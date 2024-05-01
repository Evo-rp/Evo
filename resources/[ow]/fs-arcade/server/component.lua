AddEventHandler("Arcade:Shared:DependencyUpdate", RetrieveComponents)
function RetrieveComponents()
	Fetch = exports["fs-base"]:FetchComponent("Fetch")
	Database = exports["fs-base"]:FetchComponent("Database")
	Callbacks = exports["fs-base"]:FetchComponent("Callbacks")
	Logger = exports["fs-base"]:FetchComponent("Logger")
	Chat = exports["fs-base"]:FetchComponent("Chat")
	Middleware = exports["fs-base"]:FetchComponent("Middleware")
	Execute = exports["fs-base"]:FetchComponent("Execute")
end

AddEventHandler("Core:Shared:Ready", function()
	exports["fs-base"]:RequestDependencies("Arcade", {
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
