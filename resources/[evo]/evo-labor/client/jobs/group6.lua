---@diagnostic disable: undefined-field
local _joiner = nil

local boss = {
    ped = `S_M_M_Armoured_02`,
    position = vector3(-21.1357, -659.8265, 32.4803),
    heading = 187.3326
}

local randomPeds = {
    `CSB_VagSpeak`,
    `S_M_Y_WestSec_01`
}


G6 = {
    Data = {
        Working = false,
        Blips = {},
        EventHandlers = {}
    },
    CleanUp = function(self)
        if self.Data?.EventHandlers and next(self.Data.EventHandlers) then
            for _, event in pairs(self.Data.EventHandlers) do
                RemoveEventHandler(event)
            end

            self.Data.EventHandlers = {}
        end

        if self.Data?.Blips and next(self.Data.Blips) then
            ClearAllBlipRoutes()
            for blipID, blip in pairs(self.Data.Blips) do
                Blips:Remove(blipID)
                if DoesBlipExist(blip) then
                    RemoveBlip(blip)
                end
            end

            self.Data.Blips = {}
        end
        
        Targeting.Zones:RemoveZone('Group6_Task')
        Targeting.Zones:Refresh()

        if PedInteraction:GetPed('Group6_Task') then
            PedInteraction:Remove('Group6_Task')
        end

        LocalPlayer.state:set('jobState', nil, true)

        _joiner = nil
        self.Data.State = nil
        self.Data.Working = false
    end
}

-- Events
---Boss Ped Setup
AddEventHandler('Labor:Client:Setup', function()
    PedInteraction:Add('Group6', boss.ped, boss.position, boss.heading, 25.0, {
        {
            icon = 'clock',
            text = 'Check In',
            event = 'Group6:Client:StartJob',
            tempjob = 'Group6',
            isEnabled = function()
                return not G6.Data.Working
            end,
        },
        {
            icon = 'clock',
            text = 'Return Truck',
            event = 'Group6:Client:ReturnTruck',
            tempjob = 'Group6',
            isEnabled = function()
                return G6.Data.Working and G6.Data.State == 4
            end,
        }
    }, 'id-badge', 'WORLD_HUMAN_CLIPBOARD')
end)

-- Callback for starting job
AddEventHandler('Group6:Client:StartJob', function()
    Callbacks:ServerCallback('Group6:StartJob', _joiner, function(state)
        if not state then
            Notification:Error('Unable To Start Job')
        end
    end)

    Callbacks:RegisterClientCallback('Group6:Client:CrackSafe', function(netID, cb)
        if not netID then
            Notification:Error('Unable to crack safe')
            return
        end

        local entity = NetToVeh(netID)

        if not DoesEntityExist(entity) then
            Notification:Error('Invalid entity')
            return
        end

        local vehState = Entity(entity).state

        local hackData = vehState.HackData
        if not hackData.Device or not hackData.Minigame then
            Notification:Error('Invalid hack data')
            return
        end

        --Minigame.Play[hackData.Minigame._type](table.unpack(hackData.Minigame.settings), {
        Minigame.Play:Scanner(5, 100, 5000, 20, 5, true, {
            onSuccess = function ()
                cb(true)
            end,
            onFail = function ()
                cb(false)
            end
        }, {
            playableWhileDead = false,
            animation = {
                animDict = "veh@break_in@0h@p_m_one@",
                anim = "low_force_entry_ds",
                flags = 17,
            },
        })
    end)
end)

-- Duty
RegisterNetEvent('Group6:Client:OnDuty', function(joiner, time)
    _joiner = joiner

    local blipID = 'Group6Start'

    -- Sending the player to the npc location
    G6.Data.Blips[blipID] = Blips:Add(blipID, 'Gruppe Sechs', { x = boss.position.x, y = boss.position.y, z = boss.position.z },
        67, 52, 1.4)
    SetBlipRoute(G6.Data.Blips[blipID], true)
    SetBlipRouteColour(G6.Data.Blips[blipID], 52)

    G6.Data.EventHandlers['startup'] = RegisterNetEvent(string.format('Group6:Client:%s:Startup', joiner), function()
        G6.Data.Working = true
        G6.Data.State = 1

        LocalPlayer.state:set('jobState',G6.Data.State, true)

        if G6.Data.Blips[blipID] then
            Blips:Remove(blipID)
            G6.Data.Blips[blipID] = nil
        end
        ClearAllBlipRoutes()
        Callbacks:ServerCallback('Group6:VehicleSpawn', {}, function(netId, errorMessage)
            if not netId then
                G6:CleanUp()
                Notification:Error(errorMessage)
                return
            end
        end)
    end)

    G6.Data.EventHandlers['new-task'] = RegisterNetEvent(string.format('Group6:Client:%s:NewTask', joiner),
        function(currentTask, taskLevel)
            if taskLevel then
                G6.Data.State = taskLevel
                LocalPlayer.state:set('jobState', G6.Data.State, true)
            end

            local blipID_task = 'Group6_Task'

            if G6.Data.Blips[blipID_task] then
                ClearAllBlipRoutes()
                Blips:Remove(blipID_task)
            end

            G6.Data.Blips[blipID_task] = Blips:Add(
                blipID_task,
                'Pickup point',
                { x = currentTask.Position.x, y = currentTask.Position.y, z = currentTask.Position.z },
                478,
                52,
                1.4
            )

            SetBlipRoute(G6.Data.Blips[blipID_task], true)
            SetBlipRouteColour(G6.Data.Blips[blipID_task], 52)

            -- SetTimeout(5000, function()
            --     SetEntityCoords(PlayerPedId(), currentTask.Position.x, currentTask.Position.y, currentTask.Position.z,
            --         false, false, false, false)
            -- end)

            if PedInteraction:GetPed(blipID_task) then
                PedInteraction:Remove(blipID_task)
            end

            Targeting.Zones:RemoveZone(blipID_task)
            Targeting.Zones:Refresh()

            local targetOption = {
                {
                    icon = 'sack-dollar',
                    text = 'Grab Bag',
                    event = string.format('Group6:Client:%s:GrabBag', joiner),
                    data = {},
                    tempjob = 'Group6',
                    isEnabled = function(data)
                        return G6.Data.Working and G6.Data.State == 2
                    end,
                },
            }

            if currentTask.Route == 'Containers' then

            elseif currentTask.Route == 'Atms' then
                -- Targeting.Zones:AddCircle(blipID_task, "sack-dollar", vec(currentTask.Position.x, currentTask.Position.y, currentTask.Position.z - 1.0), 0.5, {
                --     debugPoly = true,
                --     useZ = true
                -- }, targetOption, 3.0, true)

                Targeting.Zones:AddCircle(blipID_task, "sack-dollar", vec(currentTask.Position.x, currentTask.Position.y, currentTask.Position.z - 1.0), 0.5, {
                    debugPoly = true,
                    useZ = true
                }, {
                    {
                        icon = 'sack-dollar',
                        text = 'Grab Bag',
                        event = string.format('Group6:Client:%s:GrabBag', joiner),
                        data = {},
                        tempjob = 'Group6',
                        isEnabled = function(data)
                            return G6.Data.Working and G6.Data.State == 2
                        end,
                    },
                }, 3.0, true)

                Targeting.Zones:Refresh()
            else
                PedInteraction:Add(
                    blipID_task,
                    randomPeds[math.random(#randomPeds)],
                    vec3(currentTask.Position.x, currentTask.Position.y,
                        currentTask.Position.z - 1),
                    currentTask.Position.w, 25.0,
                    targetOption,
                    'id-badge',
                    'WORLD_HUMAN_CLIPBOARD'
                )
            end
        end)

    G6.Data.EventHandlers['dropoff'] = RegisterNetEvent(string.format('Group6:Client:%s:Dropoff', joiner), function(dropOffLocation, taskLevel)
        if taskLevel then
            G6.Data.State = taskLevel
            LocalPlayer.state:set('jobState', G6.Data.State, true)
        end

        local blipID_task = 'Group6_Task'

        if G6.Data.Blips[blipID_task] then
            ClearAllBlipRoutes()
            Blips:Remove(blipID_task)
        end

        G6.Data.Blips[blipID_task] = Blips:Add(
            blipID_task,
            'Pickup point',
            { x = dropOffLocation.x, y = dropOffLocation.y, z = dropOffLocation.z },
            478,
            52,
            1.4
        )

        SetBlipRoute(G6.Data.Blips[blipID_task], true)
        SetBlipRouteColour(G6.Data.Blips[blipID_task], 52)

        PedInteraction:Add(
            blipID_task,
            randomPeds[math.random(#randomPeds)],
            vec3(dropOffLocation.x, dropOffLocation.y,
            dropOffLocation.z - 1),
            dropOffLocation.w, 25.0,
            {
                {
                    icon = 'sack-dollar',
                    text = 'Deposit Bag',
                    event = string.format('Group6:Client:%s:DepositBag', joiner),
                    data = {
                        depo = true
                    },
                    tempjob = 'Group6',
                    isEnabled = function(data)
                        return G6.Data.Working and G6.Data.State == 3
                    end,
                },
            },
            'id-badge',
            'WORLD_HUMAN_CLIPBOARD'
        )
    end)

    G6.Data.EventHandlers['grab-bag'] = RegisterNetEvent(string.format('Group6:Client:%s:GrabBag', joiner), function(data)
        Callbacks:ServerCallback('Group6:GrabBag', data, function(success)
            if not success then
                Notification:Error('Unable to grab bag')
            end
        end)
    end)

    G6.Data.EventHandlers['deposit-bag'] = RegisterNetEvent(string.format('Group6:Client:%s:DepositBag', joiner), function(_, data)
        Callbacks:ServerCallback('Group6:DepositBag', data, function(success, errorMessage)
            if not success then
                Notification:Error(errorMessage)
            end
        end)
    end)

    G6.Data.EventHandlers['return-truck'] = RegisterNetEvent(string.format('Group6:Client:%s:ReturnTruck', joiner), function()
        G6.Data.State = 4
        LocalPlayer.state:set('jobState', G6.Data.State, true)

        local blipID_task = 'Group6_Task'

        if G6.Data.Blips[blipID_task] then
            ClearAllBlipRoutes()
            Blips:Remove(blipID_task)
        end

        G6.Data.Blips[blipID_task] = Blips:Add(
            blipID_task,
            'Dropoff point',
            { x = -19.1660, y = -671.8163, z = 31.7322 },
            478,
            52,
            1.4
        )

        SetBlipRoute(G6.Data.Blips[blipID_task], true)
        SetBlipRouteColour(G6.Data.Blips[blipID_task], 52)
    end)

    G6.Data.EventHandlers['turn-in'] = AddEventHandler('Group6:Client:ReturnTruck', function()
        print(G6.Data.State == 4, 'G6.Data.State == 4')
        if not G6.Data.State == 4 then return end

        Callbacks:ServerCallback('Group6:DespawnVehicle', data, function(success, errorMessage)
            print(success, errorMessage, 'success, errorMessage')
            if not success then
                return
            end

            G6:CleanUp()
        end)
    end)
end)

RegisterNetEvent('Group6:Client:OffDuty', function(time)
    G6:CleanUp()
end)

RegisterNetEvent('Group6:Client:RegisterTargets', function(netId, state)
    if netId and NetworkDoesNetworkIdExist(netId) then
        local entity = NetToVeh(netId)
        if DoesEntityExist(entity) then
            if state then
                Targeting:AddEntity(entity, 'sack-dollar', {
                    -- {
                    --     icon = 'sack-dollar',
                    --     text = 'Teszt',
                    --     event = 'Group6:Client:GrabBag',
                    --     data = {
                    --         animation = {
                    --             anim = 'hammer',
                    --         },
                    --         duration = math.random(5000, 10000),
                    --         label = 'Picking up bags',
                    --     },
                    --     tempjob = 'Group6',
                    --     isEnabled = function(data)
                    --         return G6.Data.Working and G6.Data.State == 2
                    --     end,
                    -- },
                }, 3.0)
            else
                Targeting:RemoveEntity(entity)
            end
        end
    end
end)

AddEventHandler('Group6:DepositBag', function (data)
    Callbacks:ServerCallback('Group6:DepositBag', nil, function(success, errorMessage)
        if not success then
            Notification:Error(errorMessage)
        end
    end)
end)

AddEventHandler('Group6:CrackSafe', function(entityData)
    local vehState = Entity(entityData.entity).state
    local VIN = vehState.VIN

    if not VIN then
        Notification:Error('Unable to open safe')
        return
    end

    if not vehState.G6TRUCK then
        Notification:Error('This is not a Gruppe Sechs truck')
        --#TODO: Anticheat?
        return
    end

    if vehState.G6_GETTINGHACKED then
        Notification:Error('The safe is already being hacked')
        return
    end

    if vehState.G6_HACKED then
        Notification:Error('The safe is already hacked')
        return
    end

    if not vehState.HackData then
        Notification:Error('No hack data found')
        return
    end

    TriggerServerEvent('Group6:Server:CrackSafe', VehToNet(entityData.entity))
end)

AddEventHandler('Group6:OpenSafe', function(entityData)
    local vehState = Entity(entityData.entity).state
    local VIN = vehState.VIN

    if not VIN then
        Notification:Error('Unable to open safe')
        return
    end

    local serverId = GetPlayerServerId(PlayerId())

    if vehState.Access and not vehState.Access[serverId] then
        if not vehState.G6TRUCK then
            Notification:Error('This is not a Gruppe Sechs truck')
            --#TODO: Anticheat?
            return
        end

        if not vehState.G6_HACKED then
            Notification:Error('The safe is locked')
            return
        end
    elseif vehState.Access and vehState.Access[serverId] then
        local jobState = LocalPlayer.state.jobState
        if not jobState then return end
        if jobState ~= 3 then
            return false
        end
    end

    Callbacks:ServerCallback("Group6:OpenSafe", {
        vin = VIN,
    }, function(success, errorMessage)
        if not success then
            Notification:Error(errorMessage)
        end
    end)
end)

AddEventHandler('onResourceStop', function(resName)
    if GetCurrentResourceName() ~= resName then
        return
    end

    G6:CleanUp()
end)

RegisterCommand('g6', function()
    SetEntityCoords(PlayerPedId(), boss.position.x, boss.position.y, boss.position.z, false, false, false, false)
end, false)