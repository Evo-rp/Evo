local _OILRIG_CONFIG = {}

AddEventHandler("Robbery:Client:Setup", function()
    Polyzone.Create:Poly('OILRIG_ZONE', {
        vector2(-3196.1867675781, -3822.5815429688),
        vector2(-3101.7326660156, -4191.580078125),
        vector2(-3920.4829101562, -4286.5712890625),
        vector2(-4060.943359375, -3629.392578125),
        vector2(-3272.572265625, -3571.8037109375)
    }, {
        name="OILRIG_ZONE",
        --minZ = 13.238565444946,
        --maxZ = 41.837734222412
    })

    SpawnCrates = function()
        for k, v in pairs(_OILRIG_CONFIG.LootLocations) do
            local objectID = GetClosestObjectOfType(v.Coords.x, v.Coords.y, v.Coords.z, 5.0, GetHashKey('gr_prop_gr_crates_rifles_04a'), false)

            if objectID == 0 then
                objectID = GetClosestObjectOfType(v.Coords.x, v.Coords.y, v.Coords.z, 5.0, GetHashKey('gr_prop_gr_crates_rifles_04a'), true)
            end

            if objectID == 0 then
                local obj = CreateObject(GetHashKey('gr_prop_gr_crates_rifles_04a'), v.Coords.x, v.Coords.y, v.Coords.z, true, true, false)
            end

            Targeting.Zones:AddBox(string.format("OILRIG-LOOT-%s", k), "boxes-stacked", v.Target.Coords, v.Target.Width, v.Target.Length, {
                name = string.format("OILRIG-LOOT-%s", k),
                minZ = v.Target.MinZ,
                maxZ = v.Target.MaxZ,
            },
            {
                {
                    icon = "hand",
                    text = "Grab Loot",
                    event = "Robbery:Client:OilRig:GrabLoot",
                    data = v.data
                },
            }, 3.0, true)

            Targeting.Zones:Refresh()
        end
    end

    SpawnPeds = function()
        Callbacks:ServerCallback('Robbery:OilRig:ShouldSpawnPeds', {}, function(cb)
            if not cb then
                local oilGroupHash = GetHashKey('OIL')    
                AddRelationshipGroup('OIL')
                SetRelationshipBetweenGroups(0, oilGroupHash, oilGroupHash)

                for k, v in ipairs(_OILRIG_CONFIG.Peds) do
                    local PedModel = GetHashKey('s_m_y_blackops_01')
            
                    RequestModel(PedModel)
                    while not HasModelLoaded(PedModel) do
                        RequestModel(PedModel)
                        Citizen.Wait(100)
                    end
            
                    Citizen.Wait(50)
            
                    local Ped = CreatePed(0, PedModel, v[1], v[2], v[3], 0.0, true, true)
                    ClearPedTasksImmediately(Ped)
                    SetPedDropsWeaponsWhenDead(Ped, false)
                    local Hash = _OILRIG_CONFIG.Weapons[math.random(1, #_OILRIG_CONFIG.Weapons)]
                    GiveWeaponToPed(Ped, GetHashKey(Hash), 150, 0, 1)
                    SetPedInfiniteAmmo(Ped, true, GetHashKey(Hash))
                    TaskCombatPed(Ped, PlayerPedId(), 0, 16)
                    SetPedKeepTask(Ped, true)
                    SetPedRelationshipGroupHash(Ped, oilGroupHash)
                    SetPedArmour(Ped, 150)
                    SetEntityHealth(Ped, 250)
                    SetPedConfigFlag(Ped, 2, true)
                    SetPedCanRagdoll(Ped, false)
                end
            end
        end)
    end

    Wait(5000)

    Callbacks:ServerCallback('Robbery:OilRig:RetrieveConfig', {}, function(state)
        _OILRIG_CONFIG = state
    end)
end)

AddEventHandler("Polyzone:Enter", function(id, point, insideZone, data)
	if id == "OILRIG_ZONE" then
        SpawnPeds()
        SpawnCrates()
        LocalPlayer.state:set('inOilRig', true, true)
	end
end)

AddEventHandler("Polyzone:Exit", function(id, point, insideZone, data)
	if id == "OILRIG_ZONE" then
        LocalPlayer.state:set('inOilRig', false, true)
	end
end)

AddEventHandler("Robbery:Client:OilRig:GrabLoot", function(entity, data)
    Callbacks:ServerCallback('Robbery:OilRig:CheckLoot', data, function(s)
        if s then
            Progress:Progress({
                name = "oilrig_loot",
                duration = 60000,
                label = "Grabbing Loot...",
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
                    anim = "type",
                },
            }, function(status)
                if not status then
					Callbacks:ServerCallback('Robbery:OilRig:Loot', data, function(s2) end)
				else
					Callbacks:ServerCallback('Robbery:OilRig:CancelLoot', data, function(s2) end)
				end
            end)
        end
    end)
end)