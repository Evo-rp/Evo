AddEventHandler("Restaurant:Shared:DependencyUpdate", RetrieveComponents)
function RetrieveComponents()
	Database = exports["evo-base"]:FetchComponent("Database")
	Callbacks = exports["evo-base"]:FetchComponent("Callbacks")
	Middleware = exports["evo-base"]:FetchComponent("Middleware")
	Logger = exports["evo-base"]:FetchComponent("Logger")
	Fetch = exports["evo-base"]:FetchComponent("Fetch")
	Inventory = exports["evo-base"]:FetchComponent("Inventory")
	Crafting = exports["evo-base"]:FetchComponent("Crafting")
	Jobs = exports["evo-base"]:FetchComponent("Jobs")
end

AddEventHandler("Core:Shared:Ready", function()
	exports["evo-base"]:RequestDependencies("Restaurant", {
		"Database",
		"Callbacks",
		"Middleware",
		"Logger",
		"Fetch",
		"Inventory",
		"Crafting",
		"Jobs",
	}, function(error)
		if error then
		end

		RetrieveComponents()
		Startup()

		Middleware:Add("Characters:Spawning", function(source)
			RunRestaurantJobUpdate(source, true)
		end, 2)
	end)
end)

AddEventHandler("Proxy:Shared:RegisterReady", function()
	exports["evo-base"]:RegisterComponent("Restaurant", _RESTAURANT)
end)

_RESTAURANT = {}

function RunRestaurantJobUpdate(source, onSpawn)
	local charJobs = Jobs.Permissions:GetJobs(source)
	local warmersList = {}
	for k, v in ipairs(charJobs) do
		local jobWarmers = _warmers[v.Id]
		if jobWarmers then
			table.insert(warmersList, jobWarmers)
		end
	end
	TriggerClientEvent("Restaurant:Client:CreatePoly", source, _pickups, warmersList, onSpawn)
end

AddEventHandler("Jobs:Server:JobUpdate", function(source)
	RunRestaurantJobUpdate(source)
end)
