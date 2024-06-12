RegisterNetEvent("Characters:Client:Spawn", function()
    Blips:Add("GoldPan", "Goldpanning Shop", { x = 1956.636, y = 710.202, z = 163.387 }, 478, 46, 0.9)
    Blips:Add("Smeltery", "Smeltery", { x = 1110.89, y = -2008.9, z = 30.94 }, 618, 46, 0.9) 
end)

function SkillCheckBucket()
    local p = promise.new()
    local model = `prop_bucket_02a` 
    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(0)
    end
    local playerPed = PlayerPedId()
    local pedCoords = GetEntityCoords(playerPed)
    local bucket = CreateObject(model, pedCoords.x, pedCoords.y, pedCoords.z, true, true, false) 
    AttachEntityToEntity(bucket, playerPed, GetPedBoneIndex(playerPed, 57005), 0.09, 0.03, -0.02, -78.0, 13.0, 28.0, false, false, true, true, 0, true)
    Minigame.Play:RoundSkillbar(1.0, 5, {
        onSuccess = function()
            Wait(2500)
            Progress:Progress({
                name = "filling_bucket",
                duration = 10000,
                label = "Filling bucket with water",
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
                    dictionary = "amb@world_human_bum_wash@male@high@base",
                    animation = "base",
                },
            }, function(cancelled)
                if not cancelled then
                    DeleteEntity(bucket)
                    ClearPedTasks(playerPed)

                    Callbacks:ServerCallback("Bucket:GetReward", {}, function(callback)
                        if callback then
                            Notification:Info("You found " .. callback, 2000)
                        end
                    end)
                else
                    DeleteEntity(bucket)
                    ClearPedTasks(playerPed)
                end
            end)
        end,
        onFail = function()
            Notification:Error("You Failed", 2000)
            DeleteEntity(bucket)
            ClearPedTasks(playerPed)
        end,
    }, {
        animation = false,
    })

    return Citizen.Await(p)
end

function SkillCheckPanning()
    local p = promise.new()
    Minigame.Play:RoundSkillbar(1, 5, {
        onSuccess = function()
            Wait(2500)
            Progress:Progress({
                name = "sifting_pan",
                duration = 10000,
                label = "Sifting pan for gold",
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
                    task = "CODE_HUMAN_MEDIC_KNEEL",
                },
            }, function(cancelled)
                if not cancelled then
                    Callbacks:ServerCallback('Goldpan:RemoveGravel', {}, function(callback) end)
                    local chance = math.random(1, 10)
                    print(chance)
                    if chance < 4 then
                        Callbacks:ServerCallback("Goldpan:GetReward", {}, function(callback)
                            if callback then
                                Notification:Info("You found some gold", 2000)
                            end
                        end)
                    end
                end
            end)
        end,
        onFail = function()
            Notification:Error("You Failed", 2000)
        end,
    }, {
        animation = false,
    })

    return Citizen.Await(p)
end

local SmeltingCoords = {
    position = vector3(1110.89, -2008.9, 30.94),
    size = vector3(55.0, 55.0, 55.0),
    heading = 325,
}

AddEventHandler('Labor:Client:Setup', function()
    Callbacks:RegisterClientCallback("Labor:Goldpanning:StartMoulding", function(data, cb)
        if Inventory.Check.Player:HasItem('goldnugget', 20) then
            local playerPos = GetEntityCoords(PlayerPedId())
            local distance = #(playerPos - SmeltingCoords.position)
            if distance <= SmeltingCoords.size.x / 2 then
                SmeltBars()
            else
                Notification:Error("You aren't close enough to the smelting area", 2000)
            end
        else
            Notification:Error("You don't have enough gold nuggets (20)", 2000)
        end
    end)

    Callbacks:RegisterClientCallback("Labor:Goldpanning:StartBucket", function(data, cb)
        local waterLevel = GetEntitySubmergedLevel(PlayerPedId())
        if waterLevel > 0 and waterLevel < 0.8 then
            SkillCheckBucket()
        else
            Notification:Error("You aren't in shallow enough water fill your bucket", 2000)
        end
    end)

    Callbacks:RegisterClientCallback("Labor:Goldpanning:StartSifting", function(data, cb)
        if Inventory.Check.Player:HasItem('gravel', 5) then
            local waterLevel = GetEntitySubmergedLevel(PlayerPedId())
            if waterLevel > 0 and waterLevel < 0.8 then
                SkillCheckPanning()
            else
                Notification:Error("You aren't in shallow enough water to sift for gold", 2000)
            end
        else
            Notification:Error("You don't have a enough gravel (5)", 2000)
        end
    end)
end)

function SmeltBars()
    local p = promise.new()
    Progress:Progress({
        name = "smelt_bars",
        duration = 20000,
        label = "Smelting bars",
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
            task = "CODE_HUMAN_MEDIC_KNEEL",
        },
    }, function(cancelled)
        if not cancelled then
            Callbacks:ServerCallback("Smelting:GetReward", {}, function(callback)
                if callback then
                    Notification:Info("You found " .. callback, 2000)
                end
            end)
        end
    end)

    return Citizen.Await(p)
end