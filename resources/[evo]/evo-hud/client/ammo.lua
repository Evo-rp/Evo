Ammo = {
    LastWeapon = nil,
    Thread = false,
    ammoShown = false,
    LastAmmoUpdate = 0,

    SendAmmoToHud = function()
        if Ammo.LastAmmoUpdate > GetGameTimer() then return end
        Ammo.LastAmmoUpdate = GetGameTimer() + 100

        Ammo.ammoShown = true
        local _, clipAmmo = GetAmmoInClip(PlayerPedId(), Ammo.LastWeapon)
        local totalAmmo = GetAmmoInPedWeapon(PlayerPedId(), Ammo.LastWeapon)
        local ammoRemaining = math.floor(totalAmmo - clipAmmo)
        local onlyTotal = GetMaxAmmoInClip(PlayerPedId(), Ammo.LastWeapon) == 1

        SendNUIMessage({
            type = "UI:Ammo:Visibility",
            data = {
                state = true
            }
        })

        SendNUIMessage({
            type = "UI:Ammo:SetData",
            data = {
                clipAmmo = clipAmmo or 0,
                total = not onlyTotal and ammoRemaining or totalAmmo,
                onlyTotal = onlyTotal
            }
        })
    end,

    HideAmmo = function()
        while true do
            Wait(0)
            DisplayAmmoThisFrame(false)
        end
    end
}

CreateThread(function()
    Ammo.HideAmmo()
end)

AddEventHandler('Hud:Client:Ammo', function(state)
    if state == 'Equip' then
        Ammo.Thread = true

        CreateThread(function()
            while Ammo.Thread do
                if GetSelectedPedWeapon(PlayerPedId()) ~= GetHashKey("weapon_plasmap") then                   
                    Ammo.LastWeapon = GetSelectedPedWeapon(PlayerPedId())
                    Ammo.SendAmmoToHud()
                end

                Wait(1000)
            end
        end)
    end

    if state == 'Unequip' then
        Ammo.Thread = false

        Ammo.ammoShown = false
        SendNUIMessage({
            type = "UI:Ammo:Visibility",
            data = {
                state = false
            }
        })
    end
end)