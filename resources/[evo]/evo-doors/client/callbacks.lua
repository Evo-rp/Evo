RegisterCallbacks = function()
    Callbacks:RegisterClientCallback('Doors:BreachingCharge', function(data, cb)
        if _lookingAtDoor then
            RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
            while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") do
                Citizen.Wait(0)
            end
            local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
            local bagscene = NetworkCreateSynchronisedScene(GetEntityCoords(PlayerPedId()).x, GetEntityCoords(PlayerPedId()).y + 0.5, GetEntityCoords(PlayerPedId()).z, rotx, roty, rotz + 0.0, 2, false, false, 1065353216, 0, 1.3)
            NetworkAddPedToSynchronisedScene(PlayerPedId(), bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.5, -4.0, 1, 16, 1148846080, 0)
            NetworkStartSynchronisedScene(bagscene)
            Citizen.Wait(1500)
            local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
            local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.2,  true,  true, true)
            SetEntityCollision(bomba, false, true)
            AttachEntityToEntity(bomba, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
            Citizen.Wait(3500)

            DetachEntity(bomba, 1, 1)
            FreezeEntityPosition(bomba, true)
            NetworkStopSynchronisedScene(bagscene)

            Callbacks:ServerCallback("Doors:ToggleLocks", { doorId = _lookingAtDoor, breachingCharge = true }, function(success, newState)
                ClearPedTasks(PlayerPedId())
                DeleteObject(bomba)
                if success then
                    Sounds.Do.Play:One("doorlocks.ogg", 0.2)
                    cb(true)
                end
            end)
            cb(false)
        end
    end)
end

function loadAnim(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(10)
    end
end