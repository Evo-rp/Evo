local _DOJ = {}

RegisterNUICallback('DOJ:GetData', function(data, cb)
    _DOJ = {}

    Callbacks:ServerCallback('Jobs:GetActiveDuty', 'government', function(res)
        if res then
            for k, v in ipairs(res.CharacterData) do
                table.insert(_DOJ, {
                    Rank = v.Rank,
                    Name = v.Name,
                    Number = v.Number
                })
            end
        end

        cb(_DOJ)
    end)
end)

RegisterNUICallback('DOJ:Call', function(data, cb)
    Phone.Call:Create({
        number = data.number,
        isAnon = false,
        limited = false
    })
end)