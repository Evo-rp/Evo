RegisterNetEvent('rcore_tennis:setBallData')
AddEventHandler('rcore_tennis:setBallData', function(courtName, hitType, ballPos, newVelocity)
    TriggerClientEvent('rcore_tennis:setBallData', -1, source, courtName, hitType, ballPos, newVelocity)
end)

RegisterNetEvent('rcore_tennis:requestPosition')
AddEventHandler('rcore_tennis:requestPosition', function(courtName, positionName)
    local Source = source

    if not TennisCourts[courtName].players then 
        TennisCourts[courtName].players = {}
    end

    if not TennisCourts[courtName].players[positionName] then
        TennisCourts[courtName].players[positionName] = Source
        TriggerClientEvent('rcore_tennis:grantPosition', Source, courtName, positionName, true)
    end

    TriggerClientEvent('rcore_tennis:setBallInHand', -1, source, courtName)
end)