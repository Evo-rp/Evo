AddEventHandler("Jail:Shared:DependencyUpdate", RetrieveComponents)
function RetrieveComponents()
	Database = exports["fs-base"]:FetchComponent("Database")
	Middleware = exports["fs-base"]:FetchComponent("Middleware")
	Callbacks = exports["fs-base"]:FetchComponent("Callbacks")
	Logger = exports["fs-base"]:FetchComponent("Logger")
	Fetch = exports["fs-base"]:FetchComponent("Fetch")
	Execute = exports["fs-base"]:FetchComponent("Execute")
	Routing = exports["fs-base"]:FetchComponent("Routing")
	Chat = exports["fs-base"]:FetchComponent("Chat")
	Jobs = exports["fs-base"]:FetchComponent("Jobs")
	Handcuffs = exports["fs-base"]:FetchComponent("Handcuffs")
	Ped = exports["fs-base"]:FetchComponent("Ped")
	Inventory = exports["fs-base"]:FetchComponent("Inventory")
	Sounds = exports["fs-base"]:FetchComponent("Sounds")
	Labor = exports["fs-base"]:FetchComponent("Labor")
	Loans = exports["fs-base"]:FetchComponent("Loans")
	Jail = exports["fs-base"]:FetchComponent("Jail")
	Pwnzor = exports["fs-base"]:FetchComponent("Pwnzor")
end

AddEventHandler("Core:Shared:Ready", function()
	exports["fs-base"]:RequestDependencies("Jail", {
		"Database",
		"Middleware",
		"Callbacks",
		"Logger",
		"Fetch",
		"Execute",
		"Routing",
		"Chat",
		"Jobs",
		"Handcuffs",
		"Ped",
		"Inventory",
		"Sounds",
		"Labor",
		"Loans",
		"Jail",
		"Pwnzor",
	}, function(error)
		if #error > 0 then
			return
		end
		RetrieveComponents()
		RegisterCommands()
		RegisterCallbacks()
		RegisterMiddleware()
	end)
end)

AddEventHandler("Proxy:Shared:RegisterReady", function()
	exports["fs-base"]:RegisterComponent("Jail", _JAIL)
end)

function RegisterCommands()
	Chat:RegisterCommand(
		"jail",
		function(source, args, rawCommand)
			if tonumber(args[1]) and tonumber(args[2]) then
				local plyr = Fetch:SID(tonumber(args[1]))
				if plyr ~= nil then
					local char = plyr:GetData("Character")
					if char ~= nil then
						Jail:Sentence(source, plyr:GetData("Source"), tonumber(args[2]))
						Chat.Send.System:Single(
							source,
							string.format("%s Has Been Jailed For %s Months", args[1], args[2])
						)
					else
						Chat.Send.System:Single(source, "State ID Not Logged In")
					end
				else
					Chat.Send.System:Single(source, "State ID Not Logged In")
				end
			else
				Chat.Send.System:Single(source, "Invalid Arguments")
			end
		end,
		{
			help = "Jail Player",
			params = {
				{
					name = "Target",
					help = "State ID of target",
				},
				{
					name = "Length",
					help = "How long, in months (minutes), to jail player",
				},
			},
		},
		2,
		{
			{
				Id = "police",
			},
		}
	)
end

_JAIL = {
	IsJailed = function(self, source)
		local player = Fetch:Source(source)
		if player ~= nil then
			local char = player:GetData("Character")
			if char ~= nil then
				local jailed = char:GetData("Jailed")
				if jailed and not jailed.Released then
					return true
				else
					return false
				end
			else
				return false
			end
		else
			return false
		end
	end,
	IsReleaseEligible = function(self, source)
		local player = Fetch:Source(source)
		if player ~= nil then
			local char = player:GetData("Character")
			if char ~= nil then
				local jailed = char:GetData("Jailed")
				if not jailed or jailed and jailed.Duration < 9999 and os.time() >= (jailed.Release or 0) then
					return true
				else
					return false
				end
			else
				return false
			end
		else
			return false
		end
	end,
	Sentence = function(self, source, target, duration)
		local jailer = Fetch:Source(source):GetData("Character")
		local jState = Player(source).state
		local jailerName = "LOS SANTOS POLICE DEPARTMENT"
		for k, v in ipairs(jailer:GetData("Jobs")) do
			if v.Id == jState.onDuty then
				if v.Workplace ~= nil then
					jailerName = v.Workplace.Name
				else
					jailerName = v.Name
				end
				break
			end
		end

		local char = Fetch:Source(target):GetData("Character")
		if char ~= nil then
			if char:GetData("ICU") ~= nil and not char:GetData("ICU").Released then
				return false
			end

			Labor.Jail:Sentenced(target)

			char:SetData("Jailed", {
				Time = os.time(),
				Release = (os.time() + (60 * duration)),
				Duration = duration,
				Released = false,
			})

			Citizen.CreateThread(function()
				Jobs.Duty:Off(target, Player(target).state.onDuty)
				Handcuffs:UncuffTarget(-1, target)
				Ped.Mask:UnequipNoItem(target)
				Inventory.Holding:Put(target)
			end)

			TriggerClientEvent("Jail:Client:Jailed", target)
			Pwnzor.Players:TempPosIgnore(target)
			Callbacks:ClientCallback(target, "Jail:DoMugshot", {
				jailer = jailerName,
				duration = duration,
				date = os.date("%c"),
			}, function()
				TriggerClientEvent("Jail:Client:EnterJail", target)
			end)

			if duration >= 75 then
				local creditDecrease = 20

				local creditMult = math.floor(duration / 100)
				if creditMult >= 1 then
					creditDecrease += creditMult * 15
				end

				Loans.Credit:Decrease(char:GetData("SID"), creditDecrease)
			end
		else
			return false
		end
	end,
	Release = function(self, source)
		if Jail:IsReleaseEligible(source) then
			local char = Fetch:Source(source):GetData("Character")
			if char ~= nil then
				Labor.Jail:Released(source)
				char:SetData("Jailed", false)
				return true
			else
				return false
			end
		else
			Execute:Client(source, "Notification", "Error", "Not Eligible For Release")
			return false
		end
	end,
}
