local _startup = false

local defaultOrganizationAccounts = {
    {
        accountId = 'police',
        accountName = 'Law Enforcement Shared Account',
        startingBalance = 750000,
        jobAccess = {
            {
                Job = 'police',
                Workplace = false,
                Permissions = GetDefaultBankAccountPermissions()
            },
        }
    },
    {
        accountId = 'police-lspd',
        accountName = 'LSPD Account',
        startingBalance = 0,
        jobAccess = {
            {
                Job = 'police',
                Workplace = 'lspd',
                Permissions = GetDefaultBankAccountPermissions()
            },
        }
    },
    {
        accountId = 'police-lscso',
        accountName = 'LSCSO Account',
        startingBalance = 0,
        jobAccess = {
            {
                Job = 'police',
                Workplace = 'lscso',
                Permissions = GetDefaultBankAccountPermissions()
            },
        }
    },
    {
        accountId = 'ems',
        accountName = 'EMS Account',
        startingBalance = 325000,
        jobAccess = {
            {
                Job = 'ems',
                Workplace = 'safd',
                Permissions = GetDefaultBankAccountPermissions()
            },
        }
    },
    {
        accountId = 'doctors',
        accountName = 'Mt Zonah Medical Account',
        startingBalance = 20000,
        jobAccess = {
            {
                Job = 'ems',
                Workplace = 'doctors',
                Permissions = GetDefaultBankAccountPermissions()
            },
        }
    },
    {
        accountId = 'doj',
        accountName = 'DOJ Account',
        startingBalance = 0,
        jobAccess = {
            {
                Job = 'government',
                Workplace = 'doj',
                Permissions = GetDefaultBankAccountPermissions()
            },
        }
    },
    {
        accountId = 'casino-bets',
        accountName = 'Diamond Casino Bets',
        startingBalance = 0,
        jobAccess = {
            {
                Job = 'casino',
                Workplace = false,
                Permissions = GetDefaultBankAccountPermissions()
            },
        }
    },
}

function RunBankingStartup()
	if _startup then
		return
	end
	_startup = true

	local stateAccount = MySQL.single.await("SELECT * FROM bank_accounts WHERE type = ? AND account = ?", {
		"organization",
		100000,
	})

	if not stateAccount then
		local stateAccountPermissons = {
			BALANCE = "STATE_ACCOUNT_BALANCE",
			MANAGE = "STATE_ACCOUNT_MANAGE",
			WITHDRAW = "STATE_ACCOUNT_WITHDRAW",
			DEPOSIT = "STATE_ACCOUNT_DEPOSIT",
			TRANSACTIONS = "STATE_ACCOUNT_TRANSACTIONS",
			BILL = "STATE_ACCOUNT_BILL",
		}

		stateAccount = CreateBankAccount(
			"organization",
			"government",
			500000, -- Government Should Probably Have Some Starter Money
			"San Andreas State Account",
			100000,
			{
				{
					Job = "government",
					Workplace = "doj",
					Permissions = stateAccountPermissons,
				},
				{
					Job = "government",
					Workplace = "mayoroffice",
					Permissions = stateAccountPermissons,
				},
			}
		)
	end

	CreateOrganizationBankAccounts()

	local info = MySQL.single.await("SELECT SUM(balance) as total, COUNT(*) as accounts FROM bank_accounts")
	if info and info.total then
		Logger:Info("Banking", string.format("Total Balance Across %s Accounts: ^2$%s^7", info.accounts, info.total))
	end

	Logger:Info("Banking", "Loaded State Government Account - Balance: ^2$" .. stateAccount.balance .. "^7")

	local d = MySQL.query.await("DELETE FROM bank_accounts_transactions WHERE timestamp < now() - interval 30 DAY")

	if d.affectedRows > 0 then
		Logger:Info("Banking", "Cleared ^2" .. d.affectedRows .. "^7" .. " Old Bank Transactions")
	end
end

AddEventHandler("Finance:Server:Startup", function()
	Middleware:Add("Characters:Spawning", function(source)
		local char = Fetch:Source(source):GetData("Character")
		if char and not char:GetData("BankAccount") then
			local stateId = char:GetData("SID")
			local bankAccountData = Banking.Accounts:CreatePersonal(stateId)
			if bankAccountData then
				Logger:Trace(
					"Banking",
					string.format(
						"Personal Bank Account (%s) Created for Character: %s",
						bankAccountData.Account,
						stateId
					)
				)
				char:SetData("BankAccount", bankAccountData.Account)
			end
		end
	end, 3)

	RegisterBankingCallbacks()
end)

AddEventHandler("Jobs:Server:CompleteStartup", function()
	RunBankingStartup()
end)

function CreateOrganizationBankAccounts()
	local orgBankAccounts = MySQL.query.await("SELECT account, owner FROM bank_accounts WHERE type = ?", {
		"organization",
	})

	local accountsByJob = {}
	for k, v in ipairs(orgBankAccounts) do
		accountsByJob[v.owner] = true
	end

	local created = 0

	for k, v in ipairs(defaultOrganizationAccounts) do
		if v.accountId and not accountsByJob[v.accountId] then
			local success =
				CreateBankAccount("organization", v.accountId, v.startingBalance, v.accountName, nil, v.jobAccess)
			if success then
				accountsByJob[v.accountId] = true
				created = created + 1
			end
		end
	end

	local allJobs = Jobs:GetAll()
	if not allJobs then
		return
	end

	for k, v in pairs(allJobs) do
		if v.Type ~= "Government" and not accountsByJob[v.Id] then
			local success = CreateBankAccount("organization", v.Id, 0, v.Name, nil, {
				{
					Job = v.Id,
					Workplace = v.Workplace,
					Permissions = GetDefaultBankAccountPermissions(),
				},
			})

			if success then
				created = created + 1
			end
		end
	end

	if created > 0 then
		Logger:Trace("Banking", "Created ^2" .. created .. "^7 Default Organization Accounts")
	end
end
