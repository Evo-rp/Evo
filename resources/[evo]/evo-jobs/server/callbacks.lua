function RegisterJobCallbacks()
    Callbacks:RegisterServerCallback('Jobs:OnDuty', function(source, jobId, cb)
        cb(Jobs.Duty:On(source, jobId))
    end)

    Callbacks:RegisterServerCallback('Jobs:OffDuty', function(source, jobId, cb)
        cb(Jobs.Duty:Off(source, jobId))
    end)

    Callbacks:RegisterServerCallback('Jobs:GetActiveDuty', function(source, jobId, cb)
        cb(Jobs.Duty:GetDutyData(jobId))
    end)
end