FetchGangApp = function()
    if LocalPlayer.state.Character:GetData("Gang") ~= nil then
        Callbacks:ServerCallback('GangSystem:Server:GetGang', { Gang = LocalPlayer.state.Character:GetData("Gang") }, function(callback)
            if callback then
                Laptop.Data:Set('Gang', callback)
            end
        end)
    end
end

RegisterNUICallback('Gangs:ToggleSprays', function(data, cb)
    TriggerEvent('GangSystem:Client:ToggleDiscoveredSprays')
end)

RegisterNUICallback('Gangs:AddMember', function(data, cb)
    Callbacks:ServerCallback('GangSystem:Server:AddMember', data, function(callback) end)
end)

RegisterNUICallback('Gangs:KickMember', function(data, cb)
    Callbacks:ServerCallback('GangSystem:Server:KickMember', data, function(callback) end)

    Wait(1000)

    FetchGangApp()
end)

RegisterNUICallback('Gangs:LeaveGang', function(data, cb)
    Callbacks:ServerCallback('GangSystem:Server:LeaveGang', {}, function(callback) end)
end)