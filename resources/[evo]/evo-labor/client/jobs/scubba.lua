local _joiner = nil
local _working = false
local _blips = {}
local eventHandlers = {}
local _state = 0
local blips = {}


AddEventHandler("Labor:Client:Setup", function()
	PedInteraction:Add("ScubbaJob", `s_m_m_movspace_01`, vector3(-1684.125, -3348.271, 1.3847033), 155.045, 25.0, {
		{
			icon = "mask-snorkel",
			text = "Start Work",
			event = "Scubba:Client:StartJob",
			tempjob = "Scubba",
			isEnabled = function()
				return not _working
			end,
		},
		{
			icon = "handshake-angle",
			text = "Borrow Dinghy",
			event = "Scubba:Client:BoatSpawn",
			tempjob = "Scubba",
			isEnabled = function()
				return _working and _state == 1
			end,
		},
		{
			icon = "handshake-angle",
			text = "Return Boat",
			event = "Scubba:Client:BoatSpawnRemove",
			tempjob = "Scubba",
			isEnabled = function()
				return _working and _state == 2
			end,
		},
	}, 'mask-snorkel')
end)

eventHandlers["spawn-boat"] = AddEventHandler("Scubba:Client:BoatSpawn", function()
	Callbacks:ServerCallback("Scubba:BoatSpawn", {}, function(netId)
		SetEntityAsMissionEntity(NetToVeh(netId))
		_state = 2
	end)
end)

eventHandlers["despawn-boat"] = AddEventHandler("Scubba:Client:BoatSpawnRemove", function()
	Callbacks:ServerCallback("Scubba:BoatSpawnRemove", {})
end)

eventHandlers["return-boat"] = RegisterNetEvent("Scubba:Client:%s:ReturnBoat", joiner, function()
	_state = 1
	print("Returned Boat")
end)


RegisterNetEvent("Scubba:Client:OnDuty", function(joiner, time)
	_joiner = joiner
	DeleteWaypoint()
	SetNewWaypoint(-1683.961, -3348.845)

	eventHandlers["startup"] = RegisterNetEvent(string.format("Scubba:Client:%s:Startup", joiner), function()
		_working = true
		_state = 1

		Citizen.CreateThread(function()
			while _working do
				Citizen.Wait(1000)
			end
		end)
	end)

	eventHandlers["actions"] = RegisterNetEvent(string.format("Scubba:Client:%s:Action", joiner), function(data)
	end)
end)

AddEventHandler("Scubba:Client:StartJob", function()
    Callbacks:ServerCallback('Scubba:StartJob', _joiner, function(state)
		if not state then
			Notification:Error("Unable To Start Job")
		end
    end)
end)

RegisterNetEvent("Scubba:Client:OffDuty", function(time)
	for k, v in pairs(eventHandlers) do
		RemoveEventHandler(v)
	end

	eventHandlers = {}
	_joiner = nil
	_working = false
end)


	-- Targeting:AddObject(model, "box", {
	-- 	{
	-- 		text = "Pick Up",
	-- 		icon = "box",
	-- 		event = "Scubba:Client:Pickup",
	-- 		minDist = 3.0,
	-- 	},
	-- }, 3.0)

