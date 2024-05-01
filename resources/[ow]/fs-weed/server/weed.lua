_plants = {}

AddEventHandler("Weed:Shared:DependencyUpdate", RetrieveComponents)
function RetrieveComponents()
	Database = exports["fs-base"]:FetchComponent("Database")
	Callbacks = exports["fs-base"]:FetchComponent("Callbacks")
	Logger = exports["fs-base"]:FetchComponent("Logger")
	Middleware = exports["fs-base"]:FetchComponent("Middleware")
	Logger = exports["fs-base"]:FetchComponent("Logger")
	Utils = exports["fs-base"]:FetchComponent("Utils")
	Locations = exports["fs-base"]:FetchComponent("Locations")
	Game = exports["fs-base"]:FetchComponent("Game")
	Weed = exports["fs-base"]:FetchComponent("Weed")
	Routing = exports["fs-base"]:FetchComponent("Routing")
	Fetch = exports["fs-base"]:FetchComponent("Fetch")
	Inventory = exports["fs-base"]:FetchComponent("Inventory")
	Execute = exports["fs-base"]:FetchComponent("Execute")
	Routing = exports["fs-base"]:FetchComponent("Routing")
	Tasks = exports["fs-base"]:FetchComponent("Tasks")
	Wallet = exports["fs-base"]:FetchComponent("Wallet")
	Reputation = exports["fs-base"]:FetchComponent("Reputation")
	WaitList = exports["fs-base"]:FetchComponent("WaitList")
	Chat = exports["fs-base"]:FetchComponent("Chat")
	Status = exports["fs-base"]:FetchComponent("Status")
end

AddEventHandler("Core:Shared:Ready", function()
	exports["fs-base"]:RequestDependencies("Weed", {
		"Database",
		"Callbacks",
		"Logger",
		"Middleware",
		"Logger",
		"Execute",
		"Utils",
		"Locations",
		"Game",
		"Routing",
		"Fetch",
		"Weed",
		"Inventory",
		"Routing",
		"Tasks",
		"Wallet",
		"Reputation",
		"WaitList",
		"Chat",
		"Status",
	}, function(error)
		if #error > 0 then
			return
		end -- Do something to handle if not all dependencies loaded
		RetrieveComponents()
		Startup()
		RegisterMiddleware()
		RegisterCallbacks()
		RegisterTasks()
		RegisterItems()
	end)
end)

AddEventHandler("Proxy:Shared:RegisterReady", function()
	exports["fs-base"]:RegisterComponent("Weed", WEED)
end)

function getStageByPct(pct)
	local stagePct = 100 / (#Plants - 1)
	return math.floor((pct / stagePct) + 1.5)
end

function checkNearPlant(source, id)
	local coords = GetEntityCoords(GetPlayerPed(source))
	if _plants[id] ~= nil then
		return #(
				vector3(coords.x, coords.y, coords.z)
				- vector3(_plants[id].plant.location.x, _plants[id].plant.location.y, _plants[id].plant.location.z)
			) <= 5
	else
		return false
	end
end

WEED = {
	Planting = {
		Set = function(self, id, isUpdate)
			if _plants[id] ~= nil then
				local stage = getStageByPct(_plants[id].plant.growth)
				_plants[id].stage = stage

				TriggerClientEvent("Weed:Client:Objects:Update", -1, id, _plants[id], isUpdate)
			end
		end,
		Delete = function(self, id, skipRemove)
			if _plants[id] ~= nil then
				_plants[id] = nil
				TriggerClientEvent("Weed:Client:Objects:Delete", -1, id)
			end
		end,
		Create = function(self, isMale, location, material)
			local p = promise.new()
			local weed = {
				isMale = isMale,
				location = location,
				growth = 0,
				output = 1,
				material = material,
				planted = os.time(),
				water = 100.0,
			}
			Database.Game:insertOne({
				collection = "weed",
				document = weed,
			}, function(success, results, insertedIds)
				if not success then
					return p:resolve(nil)
				end
				weed._id = insertedIds[1]
				return p:resolve(weed)
			end)
			return Citizen.Await(p)
		end,
	},
}
