Ammo = {
    LastWeapon = '',
    Thread = false,
    ammoShown = false,
    lastammoupdate = 0,
    AmmoUpdate = 0,

    SendAmmoToHud = function()
        if Ammo.lastammoupdate > GetGameTimer() or delayed then return end
        Ammo.lastammoupdate = GetGameTimer() + 100
        if not IsPedArmed(PlayerPedId(), 7) or IsPedArmed(PlayerPedId(), 1) or Ammo.LastWeapon == unarmed then
            if not Ammo.ammoShown then return end
            Ammo.ammoShown = false
            SendNUIMessage({
                type = "UI:Ammo:Visibility",
                data = {
                    state = false
                }
            })
            return
        end

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
            HideHudComponentThisFrame(14)
        end
    end
}

CreateThread(function()
    Ammo.HideAmmo()
end)

AddEventHandler('Hud:Client:Ammo', function(state)
    if state.Type == 'Equip' then
        Ammo.Thread = true

        CreateThread = function()
            while Ammo.Thread do
                Wait(1000)
        
                if GetSelectedPedWeapon(PlayerPedId()) ~= GetHashKey("weapon_plasmap") then        
                    Ammo.AmmoUpdate = Ammo.AmmoUpdate - 1
            
                    Ammo.LastWeapon = GetSelectedPedWeapon(PlayerPedId())
                    Ammo.SendAmmoToHud()
                end
            end
        end
    end

    if state.Type == 'Unequip' then
        Ammo.Thread = false
    end
end)