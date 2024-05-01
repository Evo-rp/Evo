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
	Fetch = exports["fs-base"]:FetchComponent("Fetch")
	Logger = exports["fs-base"]:FetchComponent("Logger")
	Callbacks = exports["fs-base"]:FetchComponent("Callbacks")
	Middleware = exports["fs-base"]:FetchComponent("Middleware")
	Execute = exports["fs-base"]:FetchComponent("Execute")
	Chat = exports["fs-base"]:FetchComponent("Chat")
	Inventory = exports["fs-base"]:FetchComponent("Inventory")
	Crypto = exports["fs-base"]:FetchComponent("Crypto")
	Vehicles = exports["fs-base"]:FetchComponent("Vehicles")
	Drugs = exports["fs-base"]:FetchComponent("Drugs")
	Vendor = exports["fs-base"]:FetchComponent("Vendor")
end

AddEventHandler("Core:Shared:Ready", function()
	exports["fs-base"]:RequestDependencies("Drugs", {
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
			exports["fs-base"]:FetchComponent("Logger"):Critical("Drugs", "Failed To Load All Dependencies")
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
	exports["fs-base"]:RegisterComponent("Drugs", _DRUGS)
end)
