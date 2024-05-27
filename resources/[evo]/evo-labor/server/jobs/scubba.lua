local _JOB = "Scubba"

local _joiners = {}
local _scubba = {}


-- add more when i feel like it jit.
local _scubbaCoords = {
    vector3(1943.1074, -2682.932, -22.90075),
    vector3(3211.4777, -429.683, -40.54449),
    vector3(3557.4057, 1851.3031, -180.0731),
    vector3(4012.746, 4504.1308, -6.53045),
    vector3(3833.3388, 4986.9931, -43.8729)
}

AddEventHandler("Labor:Server:Startup", function()
    Middleware:Add("Characters:Logout", function(source)
        local plyr = Fetch:Source(source)
        if plyr ~= nil then
            local char = plyr:GetData("Character")
            if char ~= nil then
            end
        end
    end)

	Callbacks:RegisterServerCallback("Scubba:BoatSpawn", function(source, data, cb)
		if _joiners[source] ~= nil and _scubba[_joiners[source]].boat == nil and _scubba[_joiners[source]].state == 1 then
			Vehicles:SpawnTemp(source, `dinghy`, vector3(-1693.652, -3361.211, 0.8267235), 57.510, function(veh, VIN)
				Vehicles.Keys:Add(source, VIN)
				_scubba[_joiners[source]].boat = veh
				_scubba[_joiners[source]].state = 2
				cb(veh)
	
				local chosenCoords = {}
				local availableCoords = {table.unpack(_scubbaCoords)}
				for i = 1, 3 do
					local index = math.random(#availableCoords)
					table.insert(chosenCoords, availableCoords[index])
					table.remove(availableCoords, index)
				end
				TriggerClientEvent("Scubba:Client:SpawnModel", source, chosenCoords)
				TriggerClientEvent("Scubba:Client:CreateBlips", source, chosenCoords)
				
				Labor.Offers:Task(_joiners[source], _JOB, "Go to the routes marked on the map")
			end)
		end
	end)

	Callbacks:RegisterServerCallback("Scubba:BoatSpawnRemove", function(source, data, cb)
		if _joiners[source] ~= nil and _scubba[_joiners[source]].boat ~= nil then
			if _scubba[_joiners[source]].state == 2 then
				local garCoords = GetEntityCoords(_scubba[_joiners[source]].boat)
				local pedCoords = GetEntityCoords(GetPlayerPed(source))
				local distance = #(pedCoords - garCoords)
				if distance <= 25 then
					Vehicles:Delete(_scubba[_joiners[source]].boat, function()
						_scubba[_joiners[source]].boat = nil
						_scubba[_joiners[source]].state = 1
						TriggerClientEvent("Scubba:Client:%s:ReturnBoat", _joiners[source], -1)
						Labor.Offers:Task(_joiners[source], _JOB, "Get a rental boat from the boat salesmen")
					end)
				else
					Execute:Client(source, "Notification", "Error", "Boat Needs To Be With You")
				end
			end
		end
	end)
    
	Middleware:Add("playerDropped", function(source)
        local plyr = Fetch:Source(source)
        if plyr ~= nil then
            local char = plyr:GetData("Character")
            if char ~= nil then
            end
        end
		TriggerClientEvent("Scubba:Client:RemoveBlips", source)
    end)

    Callbacks:RegisterServerCallback("Scubba:StartJob", function(source, data, cb)
        if _scubba[data] ~= nil and _scubba[data].state == 0 then
            Labor.Offers:Task(_joiners[source], _JOB, "Get a rental boat from the boat salesmen")
            TriggerClientEvent(string.format("Scubba:Client:%s:Startup", data), -1, _scubba[data].nodes)
            _scubba[data].state = 1
            cb(true)
        else
            cb(false)
        end
    end)
end)

AddEventHandler("Scubba:Server:OnDuty", function(joiner, members, isWorkgroup)
    _joiners[joiner] = joiner
    _scubba[joiner] = {
        joiner = joiner,
        isWorkgroup = isWorkgroup,
        started = os.time(),
        state = 0,
    }

    local char = Fetch:Source(joiner):GetData("Character")
    char:SetData("TempJob", _JOB)
    Phone.Notification:Add(joiner, "Labor Activity", "You started a job", os.time() * 1000, 6000, "labor", {})
    TriggerClientEvent("Scubba:Client:OnDuty", joiner, joiner, os.time())

    Labor.Offers:Task(joiner, _JOB, "Talk To The Foreman")
    if #members > 0 then
        for k, v in ipairs(members) do
            _joiners[v.ID] = joiner
            local member = Fetch:Source(v.ID):GetData("Character")
            member:SetData("TempJob", _JOB)
            Phone.Notification:Add(v.ID, "Labor Activity", "You started a job", os.time() * 1000, 6000, "labor", {})
            TriggerClientEvent("Scubba:Client:OnDuty", v.ID, joiner, os.time())
        end
    end
end)

AddEventHandler("Scubba:Server:OffDuty", function(source, joiner)
    _joiners[source] = nil
    TriggerClientEvent("Scubba:Client:OffDuty", source)
    local plyr = Fetch:Source(source)
    if plyr ~= nil then
        local char = plyr:GetData("Character")
        if char ~= nil then
            Inventory.Items:RemoveAll(char:GetData("SID"), 1, "unknown_ore")
        end
    end
    TriggerClientEvent("Scubba:Client:RemoveBlips", source)
end)


AddEventHandler("Scubba:Server:FinishJob", function(joiner)
    _scubba[joiner] = nil
end)



-- MIGHT NOT WORK FUCK IT WE BALL


RegisterNetEvent("Scubba:Client:Pickup")
AddEventHandler("Scubba:Client:Pickup", function(data)
    local boxID = data.boxID
    -- Process pickup logic here

    -- Remove the blip and update the task
    RemoveBlipByID(boxID)
    Labor.Offers:Task(player, _JOB, "Deliver the box to the specified location")
end)

function GetCoordsByID(boxID)
    for _, coordData in ipairs(_scubbaCoords) do
        if coordData.id == boxID then
            return coordData.coords
        end
    end
    return nil
end
