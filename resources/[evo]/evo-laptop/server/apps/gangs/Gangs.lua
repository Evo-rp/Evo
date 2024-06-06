AddEventHandler('Laptop:Server:RegisterCallbacks', function()
    Callbacks:RegisterServerCallback('GangSystem:Server:GetGang', function(source, data, cb)
        Database.Game:findOne({
            collection = 'gangs',
            query = {
                Name = data.Gang
            },
        }, function(success, results)
            if success and #results > 0 then
                cb(results[1])
            else
                cb(false)
            end
        end)
    end)
end)