_DRUGS = _DRUGS or {}
local _addictionTemplate = {
	Meth = {
		LastUse = false,
		Factor = 0.0,
	},
	Coke = {
		LastUse = false,
		Factor = 0.0,
	},
}

AddEventHandler("Drugs:Shared:DependencyUpdate", RetrieveComponents)
function RetrieveComponents()
	Fetch = exports["evo-base"]:FetchComponent("Fetch")
	Logger = exports["evo-base"]:FetchComponent("Logger")
	Callbacks = exports["evo-base"]:FetchComponent("Callbacks")
	Middleware = exports["evo-base"]:FetchComponent("Middleware")
	Execute = exports["evo-base"]:FetchComponent("Execute")
	Chat = exports["evo-base"]:FetchComponent("Chat")
	Inventory = exports["evo-base"]:FetchComponent("Inventory")
	Crypto = exports["evo-base"]:FetchComponent("Crypto")
	Vehicles = exports["evo-base"]:FetchComponent("Vehicles")
	Drugs = exports["evo-base"]:FetchComponent("Drugs")
	Vendor = exports["evo-base"]:FetchComponent("Vendor")
end

AddEventHandler("Core:Shared:Ready", function()
	exports["evo-base"]:RequestDependencies("Drugs", {
		"Fetch",
		"Logger",
		"Callbacks",
		"Middleware",
		"Execute",
		"Chat",
		"Inventory",
		"Crypto",
		"Vehicles",
		"Drugs",
		"Vendor",
	}, function(error)
		if #error > 0 then
			exports["evo-base"]:FetchComponent("Logger"):Critical("Drugs", "Failed To Load All Dependencies")
			return
		end
		RetrieveComponents()
		RegisterItemUse()
		RunDegenThread()

		Middleware:Add("Characters:Spawning", function(source)
			local plyr = Fetch:Source(source)
			if plyr ~= nil then
				local char = plyr:GetData("Character")
				if char ~= nil then
					if char:GetData("Addiction") == nil then
						char:SetData("Addiction", _addictionTemplate)
					end
				end
			end
		end, 1)

		TriggerEvent("Drugs:Server:Startup")
	end)
end)

AddEventHandler("Proxy:Shared:RegisterReady", function()
	exports["evo-base"]:RegisterComponent("Drugs", _DRUGS)
end)
