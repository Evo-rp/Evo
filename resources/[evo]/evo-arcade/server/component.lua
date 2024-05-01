AddEventHandler("Arcade:Shared:DependencyUpdate", RetrieveComponents)
function RetrieveComponents()
	Fetch = exports["evo-base"]:FetchComponent("Fetch")
	Database = exports["evo-base"]:FetchComponent("Database")
	Callbacks = exports["evo-base"]:FetchComponent("Callbacks")
	Logger = exports["evo-base"]:FetchComponent("Logger")
	Chat = exports["evo-base"]:FetchComponent("Chat")
	Middleware = exports["evo-base"]:FetchComponent("Middleware")
	Execute = exports["evo-base"]:FetchComponent("Execute")
end

AddEventHandler("Core:Shared:Ready", function()
	exports["evo-base"]:RequestDependencies("Arcade", {
		"Fetch",
		"Database",
		"Callbacks",
		"Logger",
		"Chat",
		"Middleware",
		"Execute",
	}, function(error)
		if #error > 0 then
			return
		end -- Do something to handle if not all dependencies loaded
		RetrieveComponents()

		Callbacks:RegisterServerCallback("Arcade:Open", function(source, data, cb)
			local plyr = Fetch:Source(source)
			if plyr ~= nil then
				local char = plyr:GetData("Character")
				if char ~= nil then
					if Player(source).state.onDuty == "avast_arcade" then
						GlobalState["Arcade:Open"] = true
					end
				end
			end
		end)

		Callbacks:RegisterServerCallback("Arcade:Close", function(source, data, cb)
			local plyr = Fetch:Source(source)
			if plyr ~= nil then
				local char = plyr:GetData("Character")
				if char ~= nil then
					if Player(source).state.onDuty == "avast_arcade" then
						GlobalState["Arcade:Open"] = false
					end
				end
			end
		end)
	end)
end)
