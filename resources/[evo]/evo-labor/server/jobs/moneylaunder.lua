local _Locations = {
    vector4(145.193, -1037.378, 28.368, 253.865), -- Legion Square Bank
    vector4(-1218.038, -331.987, 36.781, 290.761), -- Blvd Del Perro Bank
    vector4(1180.520, 2705.429, 37.088, 84.504), -- Harmony Bank
    vector4(-2964.328, 477.584, 14.697, 352.403), -- Great Ocean Bank
    vector4(-99.867, 6470.790, 30.639, 125.275), -- Paleto Bank
    vector4(309.742, -275.827, 53.165, 243.771), -- Hawick Bank 1
    vector4(-355.210, -46.944, 48.036, 245.125), -- Hawick Bank 2
}

local _reputationMultiplier = {
    [0] = 20,
    [1] = 30,
    [2] = 40,
    [3] = 50,
    [4] = 60,
    [5] = 70,
}

AddEventHandler("Labor:Server:Startup", function()
    Reputation:Create("MoneyCleaning", "Money Launder", {
        { label = "Rank 1", value = 1875 },
        { label = "Rank 2", value = 4250 },
        { label = "Rank 3", value = 6000 },
        { label = "Rank 4", value = 8625 },
        { label = "Rank 5", value = 11625 },
    })

    Callbacks:RegisterServerCallback('Labor:Server:MoneyLaunder:RetrieveLocations', function(source, data, cb)
        Phone.Notification:Add(
			source,
			"Labor Activity",
			"Head to the location on your GPS",
			os.time() * 1000,
			6000,
			"labor",
			{}
		)

        cb(_Locations)
    end)

    Callbacks:RegisterServerCallback('Labor:Server:MoneyLaunder:Complete', function(source, data, cb)
        local char = Fetch:Source(source):GetData("Character")
        Inventory.Items:Remove(char:GetData("SID"), 1, "money_checkque", 1)

        local repLevel = Reputation:GetLevel(source, "MoneyCleaning") or 0
        Reputation.Modify:Add(source, "MoneyCleaning", 125)

        Banking.Balance:Deposit(Banking.Accounts:GetPersonal(char:GetData("SID")).Account, _reputationMultiplier[repLevel] / 30 * math.random(4500, 7000),
            {
                type = "deposit",
                title = "Banking deposit",
            }
        )
    end)

    Callbacks:RegisterServerCallback('Labor:Server:MoneyLaunder:AlertPolice', function(source, data, cb)
        Robbery:TriggerPDAlert(source, data.coords, "10-31", "Illegal Cash Deposit", {
            icon = 568,
            size = 0.9,
            color = 1,
            duration = (60 * 5),
        }, 'cash_deposit')
    end)

    Callbacks:RegisterServerCallback('Labor:Server:MoneyLaunder:Finish', function(source, data, cb)
        Phone.Notification:Add(
            source,
            "Labor Activity",
            "Run Complete!",
            os.time() * 1000,
            6000,
            "labor",
            {}
        )
    end)

    Callbacks:RegisterServerCallback('Labor:Server:MoneyLaunder:Trade', function(source, data, cb)
        if data.item == 'moneyroll' or data.item == 'moneyband'  then
            local char = Fetch:Source(source):GetData("Character")

            if data.item == 'moneyroll' then
                Inventory.Items:Remove(char:GetData("SID"), 1, "moneyroll", 50)
                Inventory:AddItem(char:GetData("SID"), "money_checkque", 1, {}, 1)
            end

            if data.item == 'moneyband' then
                Inventory.Items:Remove(char:GetData("SID"), 1, "moneyband", 5)
                Inventory:AddItem(char:GetData("SID"), "money_checkque", 1, {}, 1)
            end
        end
    end)
end)