local IS_SPAWNED = false
GLOBAL_PED = false

targetableObjectModels = {}
targetableEntities = {}
interactionZones = {}

AddEventHandler("Targeting:Shared:DependencyUpdate", RetrieveComponents)
function RetrieveComponents()
	Logger = exports["fs-base"]:FetchComponent("Logger")
	Utils = exports["fs-base"]:FetchComponent("Utils")
	Keybinds = exports["fs-base"]:FetchComponent("Keybinds")
	Targeting = exports["fs-base"]:FetchComponent("Targeting")
	UISounds = exports["fs-base"]:FetchComponent("UISounds")
	Jobs = exports["fs-base"]:FetchComponent("Jobs")
	Vehicles = exports["fs-base"]:FetchComponent("Vehicles")
	Fetch = exports["fs-base"]:FetchComponent("Fetch")
	EMS = exports["fs-base"]:FetchComponent("EMS")
	Inventory = exports["fs-base"]:FetchComponent("Inventory")
	Reputation = exports["fs-base"]:FetchComponent("Reputation")
	Mechanic = exports["fs-base"]:FetchComponent("Mechanic")
	Polyzone = exports["fs-base"]:FetchComponent("Polyzone")
	Tow = exports["fs-base"]:FetchComponent("Tow")
end

AddEventHandler("Core:Shared:Ready", function()
	exports["fs-base"]:RequestDependencies("Targeting", {
		"Logger",
		"Utils",
		"Keybinds",
		"Targeting",
		"UISounds",
		"Jobs",
		"Vehicles",
		"Fetch",
		"EMS",
		"Inventory",
		"Reputation",
		"Mechanic",
		"Polyzone",
		"Tow",
	}, function(error)
		if #error > 0 then
			return
		end
		RetrieveComponents()

		Keybinds:Add("targeting_starts", "LMENU", "keyboard", "Targeting (Third Eye) (Hold)", function()
			if IS_SPAWNED then
				StartTargeting()
			end
		end, function()
			if not inTargetingMenu then
				StopTargeting()
			end
		end)

		if LocalPlayer.state.loggedIn then
			DeInitPolyzoneTargets()
			Citizen.Wait(100)
			InitPolyzoneTargets()
		end
	end)
end)

RegisterNetEvent("Characters:Client:Spawn")
AddEventHandler("Characters:Client:Spawn", function()
	Citizen.CreateThread(function()
		while LocalPlayer.state.loggedIn do
			GLOBAL_PED = PlayerPedId()
			Citizen.Wait(5000)
		end
	end)

	local lastEntity = nil
	Citizen.CreateThread(function()
		while LocalPlayer.state.loggedIn do
			Citizen.Wait(500)
			local hitting, endCoords, entity = GetEntityPlayerIsLookingAt(25.0, GLOBAL_PED, 286)
			if hitting and GetEntityType(entity) > 0 and entity ~= lastEntity then
				lastEntity = entity
				TriggerEvent("Targeting:Client:TargetChanged", entity, endCoords)
			elseif not hitting and lastEntity then
				lastEntity = nil
				TriggerEvent("Targeting:Client:TargetChanged", false)
			end
		end
	end)

	Citizen.Wait(2000)
	IS_SPAWNED = true
	InitPolyzoneTargets()
end)

RegisterNetEvent("Characters:Client:Logout")
AddEventHandler("Characters:Client:Logout", function()
	DeInitPolyzoneTargets()
	IS_SPAWNED = false
end)

TARGETING = {
	GetEntityPlayerIsLookingAt = function(self)
		local hitting, endCoords, entity = GetEntityPlayerIsLookingAt(25.0, GLOBAL_PED, 286)
		if hitting then
			return {
				entity = entity,
				endCoords = endCoords,
			}
		end
		return false
	end,
}

AddEventHandler("Proxy:Shared:RegisterReady", function()
	-- ? Clear targets since they should be being reregistered on component update anyways
	targetableObjectModels = {}
	targetableEntities = {}
	interactablePeds = {}
	interactableModels = {}
	interactionZones = {}
	exports["fs-base"]:RegisterComponent("Targeting", TARGETING)
end)
