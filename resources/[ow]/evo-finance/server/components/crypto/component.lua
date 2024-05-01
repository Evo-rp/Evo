_cryptoCoins = {}

AddEventHandler("Crypto:Shared:DependencyUpdate", RetrieveCryptoComponents)
function RetrieveCryptoComponents()
	Fetch = exports["evo-base"]:FetchComponent("Fetch")
	Utils = exports["evo-base"]:FetchComponent("Utils")
	Execute = exports["evo-base"]:FetchComponent("Execute")
	Database = exports["evo-base"]:FetchComponent("Database")
	Middleware = exports["evo-base"]:FetchComponent("Middleware")
	Callbacks = exports["evo-base"]:FetchComponent("Callbacks")
	Chat = exports["evo-base"]:FetchComponent("Chat")
	Logger = exports["evo-base"]:FetchComponent("Logger")
	Generator = exports["evo-base"]:FetchComponent("Generator")
	Phone = exports["evo-base"]:FetchComponent("Phone")
	Crypto = exports["evo-base"]:FetchComponent("Crypto")
	Banking = exports["evo-base"]:FetchComponent("Banking")
	Billing = exports["evo-base"]:FetchComponent("Billing")
	Loans = exports["evo-base"]:FetchComponent("Loans")
	Wallet = exports["evo-base"]:FetchComponent("Wallet")
	Tasks = exports["evo-base"]:FetchComponent("Tasks")
	Jobs = exports["evo-base"]:FetchComponent("Jobs")
	Vehicles = exports["evo-base"]:FetchComponent("Vehicles")
	Inventory = exports["evo-base"]:FetchComponent("Inventory")
end

AddEventHandler("Core:Shared:Ready", function()
	exports["evo-base"]:RequestDependencies("Crypto", {
		"Fetch",
		"Utils",
		"Execute",
		"Chat",
		"Database",
		"Middleware",
		"Callbacks",
		"Logger",
		"Generator",
		"Phone",
		"Wallet",
		"Banking",
		"Billing",
		"Loans",
		"Crypto",
		"Jobs",
		"Tasks",
		"Vehicles",
		"Inventory",
	}, function(error)
		if #error > 0 then
			exports["evo-base"]:FetchComponent("Logger"):Critical("Crypto", "Failed To Load All Dependencies")
			return
		end
		RetrieveCryptoComponents()
	end)
end)

_CRYPTO = {
	Coin = {
		Create = function(self, name, acronym, price, buyable, sellable)
			while Crypto == nil do
				Citizen.Wait(1)
			end

			if not Crypto.Coin:Get(acronym) then
				table.insert(_cryptoCoins, {
					Name = name,
					Short = acronym,
					Price = price,
					Buyable = buyable,
					Sellable = sellable,
				})
			else
				for k, v in ipairs(_cryptoCoins) do
					if v.Short == acronym then
						_cryptoCoins[k] = {
							Name = name,
							Short = acronym,
							Price = price,
							Buyable = buyable,
							Sellable = sellable,
						}
						return
					end
				end
			end
		end,
		Get = function(self, acronym)
			for k, v in ipairs(_cryptoCoins) do
				if v.Short == acronym then
					return v
				end
			end

			return nil
		end,
		GetAll = function(self)
			return _cryptoCoins
		end,
	},
	Has = function(self, source, coin, amt)
		local plyr = Fetch:Source(source)
		if plyr ~= nil then
			local char = plyr:GetData("Character")
			if char ~= nil then
				local crypto = char:GetData("Crypto") or {}
				return crypto[coin] ~= nil and crypto[coin] >= amt
			else
				return false
			end
		else
			return false
		end
	end,
	Exchange = {
		IsListed = function(self, coin)
			for k, v in ipairs(_cryptoCoins) do
				if v.Short == coin then
					return true
				end
			end
			return false
		end,
		Buy = function(self, coin, target, amount)
			if Crypto.Exchange:IsListed(coin) then
				local plyr = Fetch:SID(target)
				if plyr ~= nil then
					local char = plyr:GetData("Character")
					if char ~= nil then
						local acc = Banking.Accounts:GetPersonal(char:GetData("SID"))
						local coinData = Crypto.Coin:Get(coin)
						if acc.Balance >= (coinData.Price * amount) then
							if
								Banking.Balance:Withdraw(acc.Account, (coinData.Price * amount), {
									type = "withdraw",
									title = "Crypto Purchase",
									description = string.format("Bought %s $%s", amount, coin),
									transactionAccount = false,
									data = {
										character = char:GetData("SID"),
									},
								})
							then
								Phone.Notification:Add(
									char:GetData("Source"),
									"Crypto Purchase",
									string.format("You Bought %s $%s", amount, coin),
									os.time() * 1000,
									6000,
									"crypto",
									{}
								)
								return Crypto.Exchange:Add(coin, char:GetData("CryptoWallet"), amount)
							else
								return false
							end
						else
							Phone.Notification:Add(
								char:GetData("Source"),
								"Crypto Purchase",
								"Insufficient Funds",
								os.time() * 1000,
								6000,
								"crypto",
								{}
							)
							return false
						end
					else
						return false
					end
				else
					return false
				end
			else
				return false
			end
		end,
		Sell = function(self, coin, target, amount)
			if Crypto.Exchange:IsListed(coin) then
				local plyr = Fetch:SID(target)
				if plyr ~= nil then
					local char = plyr:GetData("Character")
					if char ~= nil then
						local acc = Banking.Accounts:GetPersonal(char:GetData("SID"))
						local coinData = Crypto.Coin:Get(coin)

						if coinData.Sellable then
							if Crypto.Exchange:Remove(coin, char:GetData("CryptoWallet"), amount, true) then
								return Banking.Balance:Deposit(acc.Account, (coinData.Sellable * amount), {
									type = "deposit",
									title = "Crypto Sale",
									description = string.format("Sold %s $%s", amount, coin),
									transactionAccount = false,
									data = {
										character = char:GetData("SID"),
									},
								})
							else
								return false
							end
						else
							return false
						end
					else
						return false
					end
				else
					return false
				end
			else
				return false
			end
		end,
		Add = function(self, coin, target, amount, skipAlert)
			local plyr = Fetch:CharacterData("CryptoWallet", target)
			if plyr ~= nil then
				local char = plyr:GetData("Character")
				local crypto = char:GetData("Crypto") or {}
				if crypto[coin] == nil then
					crypto[coin] = 0
				end

				crypto[coin] = crypto[coin] + amount
				char:SetData("Crypto", crypto)

				if not skipAlert then
					Phone.Notification:Add(
						plyr:GetData("Source"),
						"Received Crypto",
						string.format("You Received %s $%s", amount, coin),
						os.time() * 1000,
						6000,
						"crypto",
						{}
					)
				end

				return true
			else
				local p = promise.new()
				Database.Game:updateOne({
					collection = "characters",
					query = {
						CryptoWallet = target,
					},
					update = {
						["$inc"] = {
							[string.format("Crypto.%s", coin)] = amount,
						},
					},
				}, function(success, res)
					p:resolve(success)
				end)

				return Citizen.Await(p)
			end
		end,
		Remove = function(self, coin, target, amount, skipAlert)
			local p = promise.new()
			local plyr = Fetch:CharacterData("CryptoWallet", target)
			if plyr ~= nil then
				local char = plyr:GetData("Character")
				local crypto = char:GetData("Crypto") or {}

				if crypto[coin] == nil then
					crypto[coin] = 0
				end

				if crypto[coin] >= amount then
					crypto[coin] = crypto[coin] - amount
					char:SetData("Crypto", crypto)

					if not skipAlert then
						Phone.Notification:Add(
							plyr:GetData("Source"),
							"Crypto Purchase",
							string.format("You Paid %s $%s", amount, coin),
							os.time() * 1000,
							6000,
							"crypto",
							{}
						)
					end

					p:resolve(true)
				else
					p:resolve(false)
				end
			else
				Database.Game:findOne({
					collection = "characters",
					query = {
						CryptoWallet = target,
					},
				}, function(success, res)
					if #res == 0 then
						p:resolve(false)
						return
					else
						if res[1].Crypto[coin] >= amount then
							Database.Game:updateOne({
								collection = "characters",
								query = {
									CryptoWallet = target,
								},
								update = {
									["$inc"] = {
										[string.format("Crypto.%s", coin)] = amount,
									},
								},
							}, function(success, res)
								p:resolve(success)
							end)
						else
							p:resolve(false)
							return
						end
					end
				end)
			end

			return Citizen.Await(p)
		end,
		Transfer = function(self, coin, sender, target, amount)
			local plyr = Fetch:SID(sender)
			if plyr then
				local char = plyr:GetData("Character")
				if char then
					if char:GetData("CryptoWallet") ~= target then
						local plyr2 = Fetch:CharacterData("CryptoWallet", target)

						if plyr2 or DoesCryptoWalletExist(target) then
							if Crypto.Exchange:Remove(coin, char:GetData("CryptoWallet"), math.abs(amount), true) then
								Phone.Notification:Add(
									plyr:GetData("Source"),
									"Crypto Transfer",
									string.format("You Sent %s $%s", amount, coin),
									os.time() * 1000,
									6000,
									"crypto",
									{}
								)

								if Crypto.Exchange:Add(coin, target, math.abs(amount), true) then
									if plyr2 then
										Phone.Notification:Add(
											plyr2:GetData("Source"),
											"Crypto Transfer",
											string.format("You Received %s $%s", amount, coin),
											os.time() * 1000,
											6000,
											"crypto",
											{}
										)
									end

									return true
								end
							end
						end
					end
				end
			end
			return false
		end,
	},
}

AddEventHandler("Proxy:Shared:RegisterReady", function()
	exports["evo-base"]:RegisterComponent("Crypto", _CRYPTO)
end)
