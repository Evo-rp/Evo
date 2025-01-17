function defaultApps()
	-- local defApps = {}
	-- for k, v in pairs(LAPTOP_APPS) do
	-- 	if not v.canUninstall then
	-- 		table.insert(defApps, v.name)
	-- 	end
	-- end
	-- return {
	-- 	installed = defApps,
	-- 	home = defApps,
	-- }

	return {
		installed = {
			"settings",
			"files",
			"internet",
			"bizwiz",
			"teams",
			"lsunderground",
		},
		home = {
			"settings",
			"files",
			"internet",
			"bizwiz",
			"teams",
			"lsunderground",
		}
	}
end

function hasValue(tbl, value)
	for k, v in ipairs(tbl) do
		if v == value or (type(v) == "table" and hasValue(v, value)) then
			return true
		end
	end
	return false
end

function table.copy(t)
	local u = {}
	for k, v in pairs(t) do
		u[k] = v
	end
	return setmetatable(u, getmetatable(t))
end

function defaultSettings()
	return {
		wallpaper = "wallpaper",
		texttone = "notification.ogg",
		colors = {
			accent = "#1a7cc1",
		},
		zoom = 75,
		volume = 100,
		notifications = true,
		appNotifications = {},
	}
end

local defaultPermissions = {
	redline = {
		create = false,
	},
	lsunderground = {
		admin = false,
	}
}

AddEventHandler("onResourceStart", function(resource)
	if resource == GetCurrentResourceName() then
		TriggerClientEvent("Laptop:Client:SetApps", -1, LAPTOP_APPS)
	end
end)

AddEventHandler("Laptop:Shared:DependencyUpdate", RetrieveComponents)

function RetrieveComponents()
	Fetch = exports["evo-base"]:FetchComponent("Fetch")
	Database = exports["evo-base"]:FetchComponent("Database")
	Callbacks = exports["evo-base"]:FetchComponent("Callbacks")
	Logger = exports["evo-base"]:FetchComponent("Logger")
	Utils = exports["evo-base"]:FetchComponent("Utils")
	Chat = exports["evo-base"]:FetchComponent("Chat")
	Middleware = exports["evo-base"]:FetchComponent("Middleware")
	Execute = exports["evo-base"]:FetchComponent("Execute")
	Config = exports["evo-base"]:FetchComponent("Config")
	MDT = exports["evo-base"]:FetchComponent("MDT")
	Jobs = exports["evo-base"]:FetchComponent("Jobs")
	Labor = exports["evo-base"]:FetchComponent("Labor")
	Crypto = exports["evo-base"]:FetchComponent("Crypto")
	VOIP = exports["evo-base"]:FetchComponent("VOIP")
	Generator = exports["evo-base"]:FetchComponent("Generator")
	Properties = exports["evo-base"]:FetchComponent("Properties")
	Vehicles = exports["evo-base"]:FetchComponent("Vehicles")
	Inventory = exports["evo-base"]:FetchComponent("Inventory")
	Loot = exports["evo-base"]:FetchComponent("Loot")
	Loans = exports["evo-base"]:FetchComponent("Loans")
	Billing = exports["evo-base"]:FetchComponent("Billing")
	Banking = exports["evo-base"]:FetchComponent("Banking")
	Reputation = exports["evo-base"]:FetchComponent("Reputation")
	Robbery = exports["evo-base"]:FetchComponent("Robbery")
	Wallet = exports["evo-base"]:FetchComponent("Wallet")
	Sequence = exports["evo-base"]:FetchComponent("Sequence")
	Phone = exports["evo-base"]:FetchComponent("Phone")
	Laptop = exports["evo-base"]:FetchComponent("Laptop")
	RegisterChatCommands()
end

AddEventHandler("Core:Shared:Ready", function()
	exports["evo-base"]:RequestDependencies("Laptop", {
		"Fetch",
		"Database",
		"Callbacks",
		"Logger",
		"Utils",
		"Chat",
		"Laptop",
		"Middleware",
		"Execute",
		"Config",
		"MDT",
		"Jobs",
		"Labor",
		"Crypto",
		"VOIP",
		"Generator",
		"Properties",
		"Vehicles",
		"Inventory",
		"Loot",
		"Loans",
		"Billing",
		"Banking",
		"Reputation",
		"Robbery",
		"Wallet",
		"Sequence",
		"Phone",
	}, function(error)
		if #error > 0 then
			return
		end
		-- Do something to handle if not all dependencies loaded
		RetrieveComponents()
		Startup()
		TriggerEvent("Laptop:Server:RegisterMiddleware")
		TriggerEvent("Laptop:Server:RegisterCallbacks")

		Inventory.Items:RegisterUse("laptop", "Laptop", function(source, itemData)
			TriggerClientEvent("Laptop:Client:Open", source)
		end)

		Reputation:Create("Chopping", "Vehicle Chopping", {
			{ label = "Rank 1", value = 1000 },
			{ label = "Rank 2", value = 2500 },
			{ label = "Rank 3", value = 5000 },
			{ label = "Rank 4", value = 10000 },
			{ label = "Rank 5", value = 25000 },
			{ label = "Rank 6", value = 50000 },
			{ label = "Rank 7", value = 100000 },
			{ label = "Rank 8", value = 250000 },
			{ label = "Rank 9", value = 500000 },
			{ label = "Rank 10", value = 1000000 },
		}, true)

		Reputation:Create("Boosting", "Boosting", {
			{ label = "D", value = 0 },
			{ label = "C", value = 1600 },
			{ label = "B", value = 5500 },
			{ label = "A", value = 10000 },
			{ label = "A+", value = 40000 }, -- Get Scratching
			--{ label = "S+", value = 80000 },
		}, true)
	end)
end)

AddEventHandler("Laptop:Server:RegisterMiddleware", function()
	Middleware:Add("Characters:Spawning", function(source)
		Laptop:UpdateJobData(source)
		TriggerClientEvent("Laptop:Client:SetApps", source, LAPTOP_APPS)

		local char = Fetch:Source(source):GetData("Character")
		local myPerms = char:GetData("LaptopPermissions") or {}
		local modified = false
		for app, perms in pairs(defaultPermissions) do
			if myPerms[app] == nil then
				myPerms[app] = perms
				modified = true
			else
				for perm, state in pairs(perms) do
					if myPerms[app][perm] == nil then
						myPerms[app][perm] = state
						modified = true
					end
				end
			end
		end

		if modified then
			char:SetData("LaptopPermissions", myPerms)
		end

		if not char:GetData("LaptopSettings") then
			char:SetData("LaptopSettings", defaultSettings())
		end

		if not char:GetData("LaptopApps") then
			char:SetData("LaptopApps", defaultApps())
		end
	end, 1)
	Middleware:Add("Laptop:UIReset", function(source)
		Laptop:UpdateJobData(source)
		TriggerClientEvent("Laptop:Client:SetApps", source, LAPTOP_APPS)
	end)
	Middleware:Add("Characters:Creating", function(source, cData)
		local t = Middleware:TriggerEventWithData("Laptop:CharacterCreated", source, cData)

		return {
			{
				LaptopApps = defaultApps(),
				LaptopSettings = defaultSettings(),
				LaptopPermissions = defaultPermissions,
			},
		}
	end)
end)

RegisterNetEvent("Laptop:Server:UIReset", function()
	Middleware:TriggerEvent("Laptop:UIReset", source)
end)

AddEventHandler("Laptop:Server:RegisterCallbacks", function()
	Callbacks:RegisterServerCallback("Laptop:Permissions", function(src, data, cb)
		local char = Fetch:Source(src):GetData("Character")

		if char ~= nil then
			local perms = char:GetData("LaptopPermissions")

			for k, v in pairs(data) do
				for k2, v2 in ipairs(v) do
					if not perms[k][v2] then
						cb(false)
						return
					end
				end
			end
			cb(true)
		else
			cb(false)
		end
	end)
end)
