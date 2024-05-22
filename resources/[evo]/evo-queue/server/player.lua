States = {
	QUEUED = 1,
	JOINING = 2,
	JOINED = 3,
	DISCONNECTED = 4,
}

function PlayerClass(identifier, player, deferrals)
	local member = FetchDatabaseUser(identifier, player)
	if not member or member == "" or member == -1 then
		return nil
	end

	local prio = 0
	local msg = ""

	if member.priority then
		local prioBoosts = tonumber(member.priority)
		if prioBoosts and prioBoosts > 0 then
			msg = "\n🎉 Extra Priority Boosts | +" .. prioBoosts
			prio = prio + prioBoosts
		end
	end

	if QUEUE.Dropped:Get(identifier) then
		msg = msg .. "\n💥 Crash Priority | +1000"
		prio = prio + 1000
	end

	for _, group in ipairs(member.groups) do
		if Config.Groups[group] and Config.Groups[group].Queue and Config.Groups[group].Queue.Priority > 0 then
			prio = prio + tonumber(Config.Groups[group].Queue.Priority)

			msg = msg
				.. "\n"
				.. string.format(
					"%s | +%s",
					Config.Groups[group].Queue.Message or Config.Groups[group].Name,
					Config.Groups[group].Queue.Priority
				)
		end
	end

	if member.priority > 0 then
		msg = "\n🌟 Base Priority | +" .. member.priority .. " 🌟" .. msg
	end

	while prio == nil do
		Citizen.Wait(10)
	end

	local _data = {
		Source = player,
		State = States.QUEUED,
		ID = member._id,
		Groups = member.groups,
		Name = member.name,
		AccountID = member.account,
		Avatar = member.avatar,
		Tokens = member.tokens,
		Identifier = identifier,
		Verified = member.verified,
		Priority = prio,
		Message = msg,
		TimeBoost = 0,
		Deferrals = deferrals,
		Grace = nil,

		Timer = {
			Hour = 0,
			Minute = 0,
			Second = 0,

			Tick = function(self, plyr)
				if self.Second == 59 then
					if self.Minute == 59 then
						self.Second = 0
						self.Minute = 0
						self.Hour = self.Hour + 1
					else
						self.Second = 0
						self.Minute = self.Minute + 1
					end

					if plyr.TimeBoost < Config.Settings.MaxTimeBoost then
						plyr.TimeBoost = plyr.TimeBoost + 1
						plyr.Priority = plyr.Priority + 1
					end
				else
					self.Second = self.Second + 1
				end
			end,
			Output = function(self)
				return string.format("%02d:%02d:%02d", self.Hour, self.Minute, self.Second)
			end,
		},

		IsWhitelisted = function(self)
			if _tempWhitelist[self.ID] then
				return true
			end

			-- print(type(Convar.ACCESS_ROLE.value))
			if Convar.ACCESS_ROLE.value == "0" then
				return true
			end

			if #member.groups > 0 then
				local accessRole = Convar.ACCESS_ROLE.value or "Whitelisted"
				for _, group in ipairs(member.groups) do
					if
						Config.Groups[group]
						and (
							(Config.Groups[group].Abv == accessRole)
							or (type(Config.Groups[group].Permission) == "table" and Config.Groups[group].Permission.Level >= 10)
							or _tempWhitelistGroup[Config.Groups[group].Abv]
						)
					then
						return true
					end
				end
			end

			return false
		end,

		IsBanned = function(self)
			return (
				Punishment:CheckBan("account", self.AccountID)
				or Punishment:CheckBan("identifier", self.Identifier)
			)
		end,

		IsVerified = function(self)
			return self.Verified
		end,

		

		IsInGracePeriod = function(self)
			if self.Grace == nil then
				return false
			else
				return os.time() <= self.Grace + (60 * Config.Settings.Grace)
			end
		end,
	}

	return _data
end

function FetchDatabaseUser(identifier, player)
    local p = promise.new()
    -- This can kill itself --PixelRez
    local query = "SELECT name, forum, account, identifier, verified, joined, groups, avatar, priority FROM users WHERE identifier = ? LIMIT 1"
    local params = {identifier}

    exports.oxmysql:execute(query, params, function(results)
        if results and #results > 0 and results[1].identifier and results[1].identifier == identifier then
            local user = results[1]
            if user.name == nil or user.name ~= GetPlayerName(player) then
                local updateQuery = "UPDATE users SET name = ? WHERE identifier = ?"
                local updateParams = {GetPlayerName(player), user.identifier}
                
                exports.oxmysql:execute(updateQuery, updateParams, function()
                    p:resolve(user)
                end)
            else
                p:resolve(user)
            end
        else
            local doc = {
                name = GetPlayerName(player),
                account = Sequence:Get("Account"),
                identifier = identifier,
                verified = true,
                joined = os.time() * 1000,
                groups = json.encode({"Whitelisted"}),
                priority = 0,
            }
            local insertQuery = [[
                INSERT INTO users (name, account, identifier, verified, joined, groups, priority)
                VALUES (?, ?, ?, ?, ?, ?, ?)
            ]]
            local insertParams = {doc.name, doc.account, doc.identifier, doc.verified, doc.joined, doc.groups, doc.priority}

            exports.oxmysql:execute(insertQuery, insertParams, function()
                p:resolve(doc)
            end)
        end
    end)

    return Citizen.Await(p)
end

