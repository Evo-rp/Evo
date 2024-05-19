local _VOTES = {}

RegisterNUICallback('Phone:Voting:GetCandidates', function(data, cb)
    Callbacks:ServerCallback('Phone:Voting:GetCandidates', {}, function(callback)
        cb(callback)
    end)
end)

RegisterNUICallback('Phone:Voting:Vote', function(data, cb)
    Callbacks:ServerCallback('Phone:Voting:SubmitVote', { data = data }, function(callback)
        if callback then
            cb(true)
        else
            cb(false)
        end
    end)
end)

RegisterNUICallback('Phone:Voting:CreateCandidate', function(data, cb)
    Callbacks:ServerCallback('Phone:Voting:CreateCandidate', data)
    cb(true)
end)

RegisterNUICallback('Phone:Voting:RemoveCandidate', function(data, cb)
    Callbacks:ServerCallback('Phone:Voting:RemoveCandidate', data)
    cb(true)
end)

RegisterNUICallback('Phone:Voting:GetVotes', function(data, cb)
    Callbacks:ServerCallback('Phone:Voting:GetVoted', { vote = data.vote }, function(callback)
        if callback then
            _VOTES[callback.vote_name] = callback.voted
            cb(_VOTES)
        end
    end)
end)