AddEventHandler("Phone:Server:RegisterCallbacks", function()
    Callbacks:RegisterServerCallback("Phone:Voting:GetCandidates", function(source, data, cb)
        local votes = MySQL.query.await("SELECT * FROM voting", {})
        local categorizedVotes = {}
    
        for _, vote in ipairs(votes) do   
            if not categorizedVotes[vote.vote_category] then
                categorizedVotes[vote.vote_category] = {}
            end
    
            table.insert(categorizedVotes[vote.vote_category], vote)
        end

        cb(categorizedVotes)
    end)

    Callbacks:RegisterServerCallback("Phone:Voting:SubmitVote", function(source, data, cb)
        local plyr = Fetch:Source(source)
        local char = plyr:GetData("Character")

        if char:GetData("VOTED_" .. data.data.vote) then cb(false) return end
        char:SetData("VOTED_" .. data.data.vote, true)

        local votes = MySQL.query.await("SELECT * FROM voting WHERE id = @Id AND vote_category = @Category", {
            ['@Id'] = data.data.person,
            ['@Category'] = data.data.vote
        })

        MySQL.query.await('UPDATE voting SET votes = @Votes WHERE id = @Id AND vote_category = @Category', {
            ['@Votes'] = votes[1].votes + 1,
            ['@Id'] = data.data.person,
            ['@Category'] = data.data.vote
        })

        cb(true)
    end)

    Callbacks:RegisterServerCallback("Phone:Voting:GetVoted", function(source, data, cb)
        local plyr = Fetch:Source(source)
        local char = plyr:GetData("Character")

        cb({vote_name = 'VOTED_' .. data.vote, voted = char:GetData('VOTED_' .. data.vote)})
    end)

    Callbacks:RegisterServerCallback("Phone:Voting:CreateCandidate", function(source, data, cb)
        MySQL.insert('INSERT INTO voting (label, vote_category, restricted) VALUES(@Label, @Category, @Restricted)', {
            ['@Label'] = data.name,
            ['@Category'] = data.category,
            ['@Restricted'] = data.jobRestriction
        })
    end)

    Callbacks:RegisterServerCallback("Phone:Voting:RemoveCandidate", function(source, data, cb)
        MySQL.query.await('DELETE FROM voting WHERE id = @Id', {
            ['@Id'] = data.id
        })
    end)
end)