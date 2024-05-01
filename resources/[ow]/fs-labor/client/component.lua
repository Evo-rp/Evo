AddEventHandler("Labor:Shared:DependencyUpdate", RetrieveComponents)
function RetrieveComponents()
	Logger = exports["fs-base"]:FetchComponent("Logger")
	Callbacks = exports["fs-base"]:FetchComponent("Callbacks")
	Game = exports["fs-base"]:FetchComponent("Game")
	Phone = exports["fs-base"]:FetchComponent("Phone")
	PedInteraction = exports["fs-base"]:FetchComponent("PedInteraction")
	Interaction = exports["fs-base"]:FetchComponent("Interaction")
	Progress = exports["fs-base"]:FetchComponent("Progress")
	Minigame = exports["fs-base"]:FetchComponent("Minigame")
	Notification = exports["fs-base"]:FetchComponent("Notification")
	ListMenu = exports["fs-base"]:FetchComponent("ListMenu")
	Blips = exports["fs-base"]:FetchComponent("Blips")
	Polyzone = exports["fs-base"]:FetchComponent("Polyzone")
	Targeting = exports["fs-base"]:FetchComponent("Targeting")
	Hud = exports["fs-base"]:FetchComponent("Hud")
	Inventory = exports["fs-base"]:FetchComponent("Inventory")
	EmergencyAlerts = exports["fs-base"]:FetchComponent("EmergencyAlerts")
	Status = exports["fs-base"]:FetchComponent("Status")
	Labor = exports["fs-base"]:FetchComponent("Labor")
	Sounds = exports["fs-base"]:FetchComponent("Sounds")
	Properties = exports["fs-base"]:FetchComponent("Properties")
	Action = exports["fs-base"]:FetchComponent("Action")
	Sync = exports["fs-base"]:FetchComponent("Sync")
	Confirm = exports["fs-base"]:FetchComponent("Confirm")
	Utils = exports["fs-base"]:FetchComponent("Utils")
	Keybinds = exports["fs-base"]:FetchComponent("Keybinds")
	Reputation = exports["fs-base"]:FetchComponent("Reputation")
	NetSync = exports["fs-base"]:FetchComponent("NetSync")
	Vehicles = exports["fs-base"]:FetchComponent("Vehicles")
	Animations = exports["fs-base"]:FetchComponent("Animations")
end

AddEventHandler("Core:Shared:Ready", function()
	exports["fs-base"]:RequestDependencies("Labor", {
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
	exports["fs-base"]:RegisterComponent("Labor", LABOR)
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
