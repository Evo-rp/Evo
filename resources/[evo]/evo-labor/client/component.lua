AddEventHandler("Labor:Shared:DependencyUpdate", RetrieveComponents)
function RetrieveComponents()
	Logger = exports["evo-base"]:FetchComponent("Logger")
	Callbacks = exports["evo-base"]:FetchComponent("Callbacks")
	Game = exports["evo-base"]:FetchComponent("Game")
	Phone = exports["evo-base"]:FetchComponent("Phone")
	PedInteraction = exports["evo-base"]:FetchComponent("PedInteraction")
	NPCDialog = exports["evo-base"]:FetchComponent("NPCDialog")
	Interaction = exports["evo-base"]:FetchComponent("Interaction")
	Progress = exports["evo-base"]:FetchComponent("Progress")
	Minigame = exports["evo-base"]:FetchComponent("Minigame")
	Notification = exports["evo-base"]:FetchComponent("Notification")
	ListMenu = exports["evo-base"]:FetchComponent("ListMenu")
	Blips = exports["evo-base"]:FetchComponent("Blips")
	Polyzone = exports["evo-base"]:FetchComponent("Polyzone")
	Targeting = exports["evo-base"]:FetchComponent("Targeting")
	Hud = exports["evo-base"]:FetchComponent("Hud")
	Inventory = exports["evo-base"]:FetchComponent("Inventory")
	EmergencyAlerts = exports["evo-base"]:FetchComponent("EmergencyAlerts")
	Status = exports["evo-base"]:FetchComponent("Status")
	Labor = exports["evo-base"]:FetchComponent("Labor")
	Sounds = exports["evo-base"]:FetchComponent("Sounds")
	Properties = exports["evo-base"]:FetchComponent("Properties")
	Action = exports["evo-base"]:FetchComponent("Action")
	Sync = exports["evo-base"]:FetchComponent("Sync")
	Confirm = exports["evo-base"]:FetchComponent("Confirm")
	Utils = exports["evo-base"]:FetchComponent("Utils")
	Keybinds = exports["evo-base"]:FetchComponent("Keybinds")
	Reputation = exports["evo-base"]:FetchComponent("Reputation")
	NetSync = exports["evo-base"]:FetchComponent("NetSync")
	Vehicles = exports["evo-base"]:FetchComponent("Vehicles")
	Animations = exports["evo-base"]:FetchComponent("Animations")
	Weapons = exports['evo-base']:FetchComponent("Weapons")
end

AddEventHandler("Core:Shared:Ready", function()
	exports["evo-base"]:RequestDependencies("Labor", {
		"Logger",
		"Callbacks",
		"Game",
		"Phone",
		"PedInteraction",
		"Interaction",
		"Progress",
		"Minigame",
		"Notification",
		"ListMenu",
		"Blips",
		"Polyzone",
		"Targeting",
		"Hud",
		"Inventory",
		"EmergencyAlerts",
		"Status",
		"Labor",
		"Sounds",
		"Properties",
		"Action",
		"Sync",
		"Confirm",
		"Utils",
		"Keybinds",
		"Reputation",
		"NetSync",
		"Vehicles",
		"Animations",
	}, function(error)
		if #error > 0 then
			return
		end
		RetrieveComponents()
		TriggerEvent("Labor:Client:Setup")
	end)
end)

function Draw3DText(x, y, z, text)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	local px, py, pz = table.unpack(GetGameplayCamCoords())

	SetTextScale(0.25, 0.25)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 245)
	SetTextOutline(true)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x, _y)
end

function PedFaceCoord(pPed, pCoords)
	TaskTurnPedToFaceCoord(pPed, pCoords.x, pCoords.y, pCoords.z)

	Citizen.Wait(100)

	while GetScriptTaskStatus(pPed, 0x574bb8f5) == 1 do
		Citizen.Wait(0)
	end
end

AddEventHandler("Proxy:Shared:RegisterReady", function()
	exports["evo-base"]:RegisterComponent("Labor", LABOR)
end)

AddEventHandler("Labor:Client:AcceptRequest", function(data)
	Callbacks:ServerCallback("Labor:AcceptRequest", data)
end)

AddEventHandler("Labor:Client:DeclineRequest", function(data)
	Callbacks:ServerCallback("Labor:DeclineRequest", data)
end)

LABOR = {
	Get = {
		Jobs = function(self)
			local p = promise.new()
			Callbacks:ServerCallback("Labor:GetJobs", {}, function(jobs)
				p:resolve(jobs)
			end)
			return Citizen.Await(p)
		end,
		Groups = function(self)
			local p = promise.new()
			Callbacks:ServerCallback("Labor:GetGroups", {}, function(groups)
				p:resolve(groups)
			end)
			return Citizen.Await(p)
		end,
		Reputations = function(self)
			local p = promise.new()
			Callbacks:ServerCallback("Labor:GetReputations", {}, function(jobs)
				p:resolve(jobs)
			end)
			return Citizen.Await(p)
		end,
	},
}
