local IS_SPAWNED = false
GLOBAL_PED = false

targetableObjectModels = {}
targetableEntities = {}
interactionZones = {}

AddEventHandler("Targeting:Shared:DependencyUpdate", RetrieveComponents)
function RetrieveComponents()
	Logger = exports["evo-base"]:FetchComponent("Logger")
	Utils = exports["evo-base"]:FetchComponent("Utils")
	Keybinds = exports["evo-base"]:FetchComponent("Keybinds")
	Targeting = exports["evo-base"]:FetchComponent("Targeting")
	UISounds = exports["evo-base"]:FetchComponent("UISounds")
	Jobs = exports["evo-base"]:FetchComponent("Jobs")
	Vehicles = exports["evo-base"]:FetchComponent("Vehicles")
	Fetch = exports["evo-base"]:FetchComponent("Fetch")
	EMS = exports["evo-base"]:FetchComponent("EMS")
	Inventory = exports["evo-base"]:FetchComponent("Inventory")
	Reputation = exports["evo-base"]:FetchComponent("Reputation")
	Mechanic = exports["evo-base"]:FetchComponent("Mechanic")
	Polyzone = exports["evo-base"]:FetchComponent("Polyzone")
	Tow = exports["evo-base"]:FetchComponent("Tow")
end

AddEventHandler("Core:Shared:Ready", function()
	exports["evo-base"]:RequestDependencies("Targeting", {
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
	exports["evo-base"]:RegisterComponent("Targeting", TARGETING)
end)
