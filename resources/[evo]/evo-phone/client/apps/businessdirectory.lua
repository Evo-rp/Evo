local _OpenBusinesses = {}
local _BlacklistedJobs = {
    ['police'],
    ['dgang'],
}

RegisterNUICallback('BusinessDirectory:Get:Data', function(data, cb)
    _OpenBusinesses = {}

    Callbacks:ServerCallback('Jobs:GetAll', {}, function(res)
        if res then
            for k, v in pairs(res) do
                if not _BlacklistedJobs[k] and v.Active then
                    table.insert(_OpenBusinesses, {
                        Name = v.Name,
                        Employees = v.CharacterData,
                    })
                end
            end
        end

        cb(_OpenBusinesses)
    end)
end)

RegisterNUICallback('BusinessDirectory:Call', function(data, cb)
    Phone.Call:Create({
        number = data.number,
        isAnon = false,
        limited = false
    })
end)
