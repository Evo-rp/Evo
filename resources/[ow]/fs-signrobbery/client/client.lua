local objects = {}
local holdingSign = false


AddEventHandler("Labor:Shared:DependencyUpdate", RetrieveComponents)
function RetrieveComponents()
	Logger = exports["fs-base"]:FetchComponent("Logger")
	Callbacks = exports["fs-base"]:FetchComponent("Callbacks")
	Targeting = exports["fs-base"]:FetchComponent("Targeting")
    Progress = exports["fs-base"]:FetchComponent("Progress")
end

AddEventHandler("Core:Shared:Ready", function()
	exports["fs-base"]:RequestDependencies("Labor", {
		"Logger",
		"Callbacks",
		"Targeting",
        "Progress"
		
	}, function(error)
		if #error > 0 then
			return
		end
		RetrieveComponents()
        RegisterCallbacks()
        RegisterTargets()
	end)
end)


function RegisterCallbacks()
    Callbacks:ServerCallback('fs-signrobbery:server:GetObjects', function(incObjects)
        objects = incObjects
    end)
end

--Functions
local function AlertCops()
    -- README: UNCOMMENT WHICHEVER ALERT YOU WANNA USE UNLESS YOU USE A DIFFERENT ALERT SYSTEM
    --TriggerServerEvent('police:server:policeAlert', 'Sign being stolen') -- Default QBCore Dispatch
    --exports['ps-dispatch']:SignRobbery() -- ps-dispatch
end

local function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(1)
    end
end

local function LoadPropDict(model)
    while not HasModelLoaded(GetHashKey(model)) do
        RequestModel(GetHashKey(model))
        Wait(10)
    end
end


--Events
RegisterNetEvent("fs-signrobbery:client:StopSign", function(data)
    local ped = PlayerPedId()
    loadAnimDict("amb@prop_human_bum_bin@base")
    TaskPlayAnim(ped, "amb@prop_human_bum_bin@base", "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    Progress:Progress({
		name = "ammo_action",
		duration = (math.random(5) + 15) * 1000,
		label = "Stealing Stop Sign",
		useWhileDead = false,
		canCancel = true,
		ignoreModifier = true,
		controlDisables = {
			disableMovement = false,
			disableCarMovement = false,
			disableMouse = false,
			disableCombat = true,
		},
	}, function(status)
        local coords = GetEntityCoords(data.entity)
        SetEntityAsMissionEntity(data.entity, true, true)
        StopAnimTask(ped, "amb@prop_human_bum_bin@base", "base", 1.0)
        DeleteEntity(data.entity)
        local object = {coords = coords, model = -949234773}
        TriggerServerEvent("fs-signrobbery:server:delete", object)
        AlertCops()
    end)
end)

RegisterNetEvent("fs-signrobbery:client:WalkingManSign", function(data)
    local ped = PlayerPedId()
    loadAnimDict("amb@prop_human_bum_bin@base")
    TaskPlayAnim(ped, "amb@prop_human_bum_bin@base", "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    Progress:Progress({
		name = "ammo_action",
		duration = (math.random(5) + 15) * 1000,
		label = "Stealing Pedestrian Sign",
		useWhileDead = false,
		canCancel = true,
		ignoreModifier = true,
		controlDisables = {
			disableMovement = false,
			disableCarMovement = false,
			disableMouse = false,
			disableCombat = true,
		},
	}, function(status)
        local coords = GetEntityCoords(data.entity)
        SetEntityAsMissionEntity(data.entity, true, true)
        StopAnimTask(ped, "amb@prop_human_bum_bin@base", "base", 1.0)
        DeleteEntity(data.entity)
        local object = {coords = coords, model = 1502931467}
        TriggerServerEvent("fs-signrobbery:server:delete", object)
        AlertCops()
    end)
end)

RegisterNetEvent("fs-signrobbery:client:DontBlockIntersectionSign", function(data)
    local ped = PlayerPedId()
    loadAnimDict("amb@prop_human_bum_bin@base")
    TaskPlayAnim(ped, "amb@prop_human_bum_bin@base", "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    Progress:Progress({
		name = "ammo_action",
		duration = (math.random(5) + 15) * 1000,
		label = "Stealing Intersection Sign",
		useWhileDead = false,
		canCancel = true,
		ignoreModifier = true,
		controlDisables = {
			disableMovement = false,
			disableCarMovement = false,
			disableMouse = false,
			disableCombat = true,
		},
	}, function(status)
        local coords = GetEntityCoords(data.entity)
        SetEntityAsMissionEntity(data.entity, true, true)
        StopAnimTask(ped, "amb@prop_human_bum_bin@base", "base", 1.0)
        DeleteEntity(data.entity)
        local object = {coords = coords, model = 1191039009}
        TriggerServerEvent("fs-signrobbery:server:delete", object)
        AlertCops()
    end)
end)

RegisterNetEvent("fs-signrobbery:client:UTurnSign", function(data)
    local ped = PlayerPedId()
    loadAnimDict("amb@prop_human_bum_bin@base")
    TaskPlayAnim(ped, "amb@prop_human_bum_bin@base", "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    Progress:Progress({
		name = "ammo_action",
		duration = (math.random(5) + 15) * 1000,
		label = "Stealing U-Turn Sign",
		useWhileDead = false,
		canCancel = true,
		ignoreModifier = true,
		controlDisables = {
			disableMovement = false,
			disableCarMovement = false,
			disableMouse = false,
			disableCombat = true,
		},
	}, function(status)
        local coords = GetEntityCoords(data.entity)
        SetEntityAsMissionEntity(data.entity, true, true)
        StopAnimTask(ped, "amb@prop_human_bum_bin@base", "base", 1.0)
        DeleteEntity(data.entity)
        local object = {coords = coords, model = 4138610559}
        TriggerServerEvent("fs-signrobbery:server:delete", object)
        AlertCops()
    end)
end)

RegisterNetEvent("fs-signrobbery:client:NoParkingSign", function(data)
    local ped = PlayerPedId()
    loadAnimDict("amb@prop_human_bum_bin@base")
    TaskPlayAnim(ped, "amb@prop_human_bum_bin@base", "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    Progress:Progress({
		name = "ammo_action",
		duration = (math.random(5) + 15) * 1000,
		label = "Stealing No Parking Sign",
		useWhileDead = false,
		canCancel = true,
		ignoreModifier = true,
		controlDisables = {
			disableMovement = false,
			disableCarMovement = false,
			disableMouse = false,
			disableCombat = true,
		},
	}, function(status)
        local coords = GetEntityCoords(data.entity)
        SetEntityAsMissionEntity(data.entity, true, true)
        StopAnimTask(ped, "amb@prop_human_bum_bin@base", "base", 1.0)
        DeleteEntity(data.entity)
        local object = {coords = coords, model = 3830972543}
        TriggerServerEvent("fs-signrobbery:server:delete", object)
        AlertCops()
    end)
end)

RegisterNetEvent("fs-signrobbery:client:LeftTurnSign", function(data)
    local ped = PlayerPedId()
    loadAnimDict("amb@prop_human_bum_bin@base")
    TaskPlayAnim(ped, "amb@prop_human_bum_bin@base", "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    Progress:Progress({
		name = "ammo_action",
		duration = (math.random(5) + 15) * 1000,
		label = "Stealing Left Turn Sign",
		useWhileDead = false,
		canCancel = true,
		ignoreModifier = true,
		controlDisables = {
			disableMovement = false,
			disableCarMovement = false,
			disableMouse = false,
			disableCombat = true,
		},
	}, function(status)
        local coords = GetEntityCoords(data.entity)
        SetEntityAsMissionEntity(data.entity, true, true)
        StopAnimTask(ped, "amb@prop_human_bum_bin@base", "base", 1.0)
        DeleteEntity(data.entity)
        local object = {coords = coords, model = 2643325436}
        TriggerServerEvent("fs-signrobbery:server:delete", object)
        AlertCops()
    end)
end)

RegisterNetEvent("fs-signrobbery:client:RightTurnSign", function(data)
    local ped = PlayerPedId()
    loadAnimDict("amb@prop_human_bum_bin@base")
    TaskPlayAnim(ped, "amb@prop_human_bum_bin@base", "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    Progress:Progress({
		name = "ammo_action",
		duration = (math.random(5) + 15) * 1000,
		label = "Stealing Right Turn Sign",
		useWhileDead = false,
		canCancel = true,
		ignoreModifier = true,
		controlDisables = {
			disableMovement = false,
			disableCarMovement = false,
			disableMouse = false,
			disableCombat = true,
		},
	}, function(status)
        local coords = GetEntityCoords(data.entity)
        SetEntityAsMissionEntity(data.entity, true, true)
        StopAnimTask(ped, "amb@prop_human_bum_bin@base", "base", 1.0)
        DeleteEntity(data.entity)
        local object = {coords = coords, model = 793482617}
        TriggerServerEvent("fs-signrobbery:server:delete", object)
        AlertCops()
    end)
end)

RegisterNetEvent("fs-signrobbery:client:NoTrespassingSign", function(data)
    local ped = PlayerPedId()
    loadAnimDict("amb@prop_human_bum_bin@base")
    TaskPlayAnim(ped, "amb@prop_human_bum_bin@base", "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    Progress:Progress({
		name = "ammo_action",
		duration = (math.random(5) + 15) * 1000,
		label = "Stealing No Tresspassing Sign",
		useWhileDead = false,
		canCancel = true,
		ignoreModifier = true,
		controlDisables = {
			disableMovement = false,
			disableCarMovement = false,
			disableMouse = false,
			disableCombat = true,
		},
	}, function(status)
        local coords = GetEntityCoords(data.entity)
        SetEntityAsMissionEntity(data.entity, true, true)
        StopAnimTask(ped, "amb@prop_human_bum_bin@base", "base", 1.0)
        DeleteEntity(data.entity)
        local object = {coords = coords, model = 1021214550}
        TriggerServerEvent("fs-signrobbery:server:delete", object)
        AlertCops()
    end)
end)

RegisterNetEvent("fs-signrobbery:client:YieldSign", function(data)
    local ped = PlayerPedId()
    loadAnimDict("amb@prop_human_bum_bin@base")
    TaskPlayAnim(ped, "amb@prop_human_bum_bin@base", "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    Progress:Progress({
		name = "ammo_action",
		duration = (math.random(5) + 15) * 1000,
		label = "Stealing Yield Sign",
		useWhileDead = false,
		canCancel = true,
		ignoreModifier = true,
		controlDisables = {
			disableMovement = false,
			disableCarMovement = false,
			disableMouse = false,
			disableCombat = true,
		},
	}, function(status)
        local coords = GetEntityCoords(data.entity)
        SetEntityAsMissionEntity(data.entity, true, true)
        StopAnimTask(ped, "amb@prop_human_bum_bin@base", "base", 1.0)
        DeleteEntity(data.entity)
        local object = {coords = coords, model = 3654973172}
        TriggerServerEvent("fs-signrobbery:server:delete", object)
        AlertCops()
    end)
end)

local prop = nil
function AddPropToPlayerAndAnim(prop1, bone, off1, off2, off3, rot1, rot2, rot3)
    loadAnimDict("amb@world_human_janitor@male@base")
    local Player = PlayerPedId()
    local x,y,z = table.unpack(GetEntityCoords(Player))
    if not HasModelLoaded(prop1) then
        LoadPropDict(prop1)
    end
    prop = CreateObject(GetHashKey(prop1), x, y, z+0.2,  true,  true, true)
    AttachEntityToEntity(prop, Player, GetPedBoneIndex(Player, bone), off1, off2, off3, rot1, rot2, rot3, true, true, false, true, 1, true)
    SetModelAsNoLongerNeeded(prop1)
    TaskPlayAnim(Player, "amb@world_human_janitor@male@base", "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0)

    CreateThread(function()
        while holdingSign do
            Wait(1000)
            if not IsEntityPlayingAnim(PlayerPedId(), "amb@world_human_janitor@male@base", "base", 3) and holdingSign then
                holdingSign = false
                DeleteEntity(prop)
            end
        end
    end)
end

--Emote Events

RegisterCommand("propt", function()
    TriggerEvent('fs-signrobbery:use:StopSign')
end)
RegisterNetEvent("fs-signrobbery:use:StopSign")
AddEventHandler("fs-signrobbery:use:StopSign", function(src)    
    if not holdingSign then
        holdingSign = true
        AddPropToPlayerAndAnim("prop_sign_road_01a", 57005, 0.10, -1.0, 0.0, -90.0, -250.0, 0.0)
    else
        holdingSign = false
        DeleteEntity(prop)
        ClearPedSecondaryTask(PlayerPedId())
    end
end)

RegisterNetEvent("fs-signrobbery:use:WalkingManSign", function(src) 
    if not holdingSign then
        holdingSign = true
        AddPropToPlayerAndAnim("prop_sign_road_05a", 57005, 0.10, -1.0, 0.0, -90.0, -250.0, 0.0)
    else
        holdingSign = false
        DeleteEntity(prop)
        ClearPedSecondaryTask(PlayerPedId())
    end
end)

RegisterNetEvent("fs-signrobbery:use:DontBlockIntersectionSign")
AddEventHandler("fs-signrobbery:use:DontBlockIntersectionSign", function(src)
    if not holdingSign then
        holdingSign = true
        AddPropToPlayerAndAnim("prop_sign_road_03e", 57005, 0.10, -1.0, 0.0, -90.0, -250.0, 0.0)
    else
        holdingSign = false
        DeleteEntity(prop)
        ClearPedSecondaryTask(PlayerPedId())
    end
end)

RegisterNetEvent("fs-signrobbery:use:UturnSign", function(src)
    if not holdingSign then
        holdingSign = true
        AddPropToPlayerAndAnim("prop_sign_road_03m", 57005, 0.10, -1.0, 0.0, -90.0, -250.0, 0.0)
    else
        holdingSign = false
        DeleteEntity(prop)
        ClearPedSecondaryTask(PlayerPedId())
    end
    
end)

RegisterNetEvent("fs-signrobbery:use:NoParkingSign", function(src)
    if not holdingSign then
        holdingSign = true
        AddPropToPlayerAndAnim("prop_sign_road_04a", 57005, 0.10, -1.0, 0.0, -90.0, -250.0, 0.0)
    else
        holdingSign = false
        DeleteEntity(prop)
        ClearPedSecondaryTask(PlayerPedId())
    end
    
end)

RegisterNetEvent("fs-signrobbery:use:LeftTurnSign", function(src)
    if not holdingSign then
        holdingSign = true
        AddPropToPlayerAndAnim("prop_sign_road_05e", 57005, 0.10, -1.0, 0.0, -90.0, -250.0, 0.0)
    else
        holdingSign = false
        DeleteEntity(prop)
        ClearPedSecondaryTask(PlayerPedId())
    end
    
end)

RegisterNetEvent("fs-signrobbery:use:RightTurnSign", function(src)
    if not holdingSign then
        holdingSign = true
        AddPropToPlayerAndAnim("prop_sign_road_05f", 57005, 0.10, -1.0, 0.0, -90.0, -250.0, 0.0)
    else
        holdingSign = false
        DeleteEntity(prop)
        ClearPedSecondaryTask(PlayerPedId())
    end
    
end)

RegisterNetEvent("fs-signrobbery:use:NoTrespassingSign", function(src)
    if not holdingSign then
        holdingSign = true
        AddPropToPlayerAndAnim("prop_sign_road_restriction_10", 57005, 0.10, -1.0, 0.0, -90.0, -250.0, 0.0)
    else
        holdingSign = false
        DeleteEntity(prop)
        ClearPedSecondaryTask(PlayerPedId())
    end
    
end)

RegisterNetEvent("fs-signrobbery:use:YieldSign", function(src)
    if not holdingSign then
        holdingSign = true
        AddPropToPlayerAndAnim("prop_sign_road_02a", 57005, 0.10, -1.0, 0.0, -90.0, -250.0, 0.0)
    else
        holdingSign = false
        DeleteEntity(prop)
        ClearPedSecondaryTask(PlayerPedId())
    end
    
end)

--Deleting The Sign Event
RegisterNetEvent("signrobbery:client:delete", function(object)
    objects[#objects+1] = {coords = object.coords, model = object.model}
    local ent = GetClosestObjectOfType(object.coords.x, object.coords.y, object.coords.z, 0.1, object.model, false, false, false)
    if DoesEntityExist(ent) then
        SetEntityAsMissionEntity(ent, 1, 1)
        DeleteObject(ent)
        SetEntityAsNoLongerNeeded(ent)
    end
end)


local signs = {
    -949234773, 1502931467, 1191039009, 4138610559, 3830972543, 2643325436, 793482617, 1021214550, 3654973172
}

--Target Exports
function RegisterTargets()
    
    Targeting:AddObject(-949234773, 'sign',  {
        {
            icon = "sign",
            text = "Steal Stop Sign",
            event = "fs-signrobbery:client:StopSign",
            minDist = 2.0,
            isEnabled = function()
                return LocalPlayer.state.isEscorting == nil
                    and LocalPlayer.state.myEscorter == nil
                    and not LocalPlayer.state.isHospitalized
            end,
        },
    }, 3.0)
    

    Targeting:AddObject(1502931467, 'sign',  {
        {
            icon = "sign",
            text = "Steal Walking Man Sign",
            event = "fs-signrobbery:client:WalkingManSign",
            minDist = 2.0,
            isEnabled = function()
                return LocalPlayer.state.isEscorting == nil
                    and LocalPlayer.state.myEscorter == nil
                    and not LocalPlayer.state.isHospitalized
            end,
        },
    }, 3.0)

    Targeting:AddObject(1191039009, 'sign',  {
        {
            icon = "sign",
            text = "Steal Intersection Sign",
            event = "fs-signrobbery:client:DontBlockIntersectionSign",
            minDist = 2.0,
            isEnabled = function()
                return LocalPlayer.state.isEscorting == nil
                    and LocalPlayer.state.myEscorter == nil
                    and not LocalPlayer.state.isHospitalized
            end,
        },
    }, 3.0)

    Targeting:AddObject(4138610559, 'sign',  {
        {
            icon = "sign",
            text = "Steal U-turn Sign",
            event = "fs-signrobbery:client:UTurnSign",
            minDist = 2.0,
            isEnabled = function()
                return LocalPlayer.state.isEscorting == nil
                    and LocalPlayer.state.myEscorter == nil
                    and not LocalPlayer.state.isHospitalized
            end,
        },
    }, 3.0)

    Targeting:AddObject(3830972543, 'sign',  {
        {
            icon = "sign",
            text = "Steal No Parking Sign",
            event = "fs-signrobbery:client:NoParkingSign",
            minDist = 2.0,
            isEnabled = function()
                return LocalPlayer.state.isEscorting == nil
                    and LocalPlayer.state.myEscorter == nil
                    and not LocalPlayer.state.isHospitalized
            end,
        },
    }, 3.0)


    Targeting:AddObject(2643325436, 'sign',  {
        {
            icon = "sign",
            text = "Steal Left Turn Sign",
            event = "fs-signrobbery:client:LeftTurnSign",
            minDist = 2.0,
            isEnabled = function()
                return LocalPlayer.state.isEscorting == nil
                    and LocalPlayer.state.myEscorter == nil
                    and not LocalPlayer.state.isHospitalized
            end,
        },
    }, 3.0)

    Targeting:AddObject(793482617, 'sign',  {
        {
            icon = "sign",
            text = "Steal Right Turn Sign",
            event = "fs-signrobbery:client:RightTurnSign",
            minDist = 2.0,
            isEnabled = function()
                return LocalPlayer.state.isEscorting == nil
                    and LocalPlayer.state.myEscorter == nil
                    and not LocalPlayer.state.isHospitalized
            end,
        },
    }, 3.0)

    Targeting:AddObject(1021214550, 'sign',  {
        {
            icon = "sign",
            text = "Steal No Trespassing Sign",
            event = "fs-signrobbery:client:NoTrespassingSign",
            minDist = 2.0,
            isEnabled = function()
                return LocalPlayer.state.isEscorting == nil
                    and LocalPlayer.state.myEscorter == nil
                    and not LocalPlayer.state.isHospitalized
            end,
        },
    }, 3.0)

    Targeting:AddObject(3654973172, 'sign',  {
        {
            icon = "sign",
            text = "Steal Yield Sign",
            event = "fs-signrobbery:client:YieldSign",
            minDist = 2.0,
            isEnabled = function()
                return LocalPlayer.state.isEscorting == nil
                    and LocalPlayer.state.myEscorter == nil
                    and not LocalPlayer.state.isHospitalized
            end,
        },
    }, 3.0)

end

CreateThread(function()
    while true do
        for k = 1, #objects, 1 do
            v = objects[k]
            local ent = GetClosestObjectOfType(v.coords.x, v.coords.y, v.coords.z, 0.1, v.model, false, false, false)
            if DoesEntityExist(ent) then
                SetEntityAsMissionEntity(ent, 1, 1)
                DeleteObject(ent)
                SetEntityAsNoLongerNeeded(ent)
            end
        end
        Wait(1000)
    end
end)
