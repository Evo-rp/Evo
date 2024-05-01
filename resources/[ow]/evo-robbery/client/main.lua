AddEventHandler("Robbery:Shared:DependencyUpdate", RetrieveComponents)
function RetrieveComponents()
	Logger = exports["evo-base"]:FetchComponent("Logger")
	Callbacks = exports["evo-base"]:FetchComponent("Callbacks")
	PedInteraction = exports["evo-base"]:FetchComponent("PedInteraction")
	Progress = exports["evo-base"]:FetchComponent("Progress")
	Phone = exports["evo-base"]:FetchComponent("Phone")
	Notification = exports["evo-base"]:FetchComponent("Notification")
	Polyzone = exports["evo-base"]:FetchComponent("Polyzone")
	Targeting = exports["evo-base"]:FetchComponent("Targeting")
	Progress = exports["evo-base"]:FetchComponent("Progress")
	Minigame = exports["evo-base"]:FetchComponent("Minigame")
	Keybinds = exports["evo-base"]:FetchComponent("Keybinds")
	Properties = exports["evo-base"]:FetchComponent("Properties")
	Sounds = exports["evo-base"]:FetchComponent("Sounds")
	Interaction = exports["evo-base"]:FetchComponent("Interaction")
	Inventory = exports["evo-base"]:FetchComponent("Inventory")
	Action = exports["evo-base"]:FetchComponent("Action")
	Blips = exports["evo-base"]:FetchComponent("Blips")
	EmergencyAlerts = exports["evo-base"]:FetchComponent("EmergencyAlerts")
	Doors = exports["evo-base"]:FetchComponent("Doors")
	ListMenu = exports["evo-base"]:FetchComponent("ListMenu")
	Input = exports["evo-base"]:FetchComponent("Input")
	Game = exports["evo-base"]:FetchComponent("Game")
	NetSync = exports["evo-base"]:FetchComponent("NetSync")
	Damage = exports["evo-base"]:FetchComponent("Damage")
	Lasers = exports["evo-base"]:FetchComponent("Lasers")
end

AddEventHandler("Core:Shared:Ready", function()
	exports["evo-base"]:RequestDependencies("Robbery", {
		"Logger",
		"Callbacks",
		"PedInteraction",
		"Progress",
		"Phone",
		"Notification",
		"Polyzone",
		"Targeting",
		"Progress",
		"Minigame",
		"Keybinds",
		"Properties",
		"Sounds",
		"Interaction",
		"Inventory",
		"Action",
		"Blips",
		"EmergencyAlerts",
		"Doors",
		"ListMenu",
		"Input",
		"Game",
		"NetSync",
		"Damage",
		"Lasers",
	}, function(error)
		if #error > 0 then
			return
		end
		RetrieveComponents()
		RegisterGamesCallbacks()
		TriggerEvent("Robbery:Client:Setup")

		Citizen.CreateThread(function()
			PedInteraction:Add(
				"RobToolsPickup",
				GetHashKey("csb_anton"),
				vector3(387.5015, -823.3320, 28.3002),
				225.358,
				25.0,
				{
					{
						icon = "hand",
						text = "Pickup Items",
						event = "Robbery:Client:PickupItems",
					},
				},
				"box-dollar"
			)
		end)
	end)
end)

AddEventHandler("Robbery:Client:PickupItems", function()
	Callbacks:ServerCallback("Robbery:Pickup", {})
end)

AddEventHandler("Proxy:Shared:RegisterReady", function()
	exports["evo-base"]:RegisterComponent("Robbery", _ROBBERY)
end)

RegisterNetEvent("Robbery:Client:State:Init", function(states)
	_bankStates = states

	for k, v in pairs(states) do
		TriggerEvent(string.format("Robbery:Client:Update:%s", k))
	end
end)

RegisterNetEvent("Robbery:Client:State:Set", function(bank, state)
	_bankStates[bank] = state
	TriggerEvent(string.format("Robbery:Client:Update:%s", bank))
end)

RegisterNetEvent("Robbery:Client:State:Update", function(bank, key, value, tableId)
	if tableId then
		_bankStates[bank][tableId] = _bankStates[bank][tableId] or {}
		_bankStates[bank][tableId][key] = value
	else
		_bankStates[bank][key] = value
	end
	TriggerEvent(string.format("Robbery:Client:Update:%s", bank))
end)

AddEventHandler("Robbery:Client:Holdup:Do", function(entity, data)
	Progress:ProgressWithTickEvent({
		name = "holdup",
		duration = 5000,
		label = "Robbing",
		useWhileDead = false,
		canCancel = true,
		ignoreModifier = true,
		controlDisables = {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		},
		animation = {
			animDict = "random@shop_robbery",
			anim = "robbery_action_b",
			flags = 49,
		},
	}, function()
		if
			#(
				GetEntityCoords(LocalPlayer.state.ped)
				- GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(entity.serverId)))
			) <= 3.0
		then
			return
		end
		Progress:Cancel()
	end, function(cancelled)
		if not cancelled then
			Callbacks:ServerCallback("Robbery:Holdup:Do", entity.serverId, function(s)
				Inventory.Dumbfuck:Open(s)

				while not LocalPlayer.state.inventoryOpen do
					Citizen.Wait(1)
				end

				Citizen.CreateThread(function()
					while LocalPlayer.state.inventoryOpen do
						if
							#(
								GetEntityCoords(LocalPlayer.state.ped)
								- GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(entity.serverId)))
							) > 3.0
						then
							Inventory.Close:All()
						end
						Citizen.Wait(2)
					end
				end)
			end)
		end
	end)
end)

_ROBBERY = {}
