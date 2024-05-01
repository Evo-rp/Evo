AddEventHandler("Characters:Shared:DependencyUpdate", RetrieveComponents)
function RetrieveComponents()
	Middleware = exports["fs-base"]:FetchComponent("Middleware")
	Database = exports["fs-base"]:FetchComponent("Database")
	Callbacks = exports["fs-base"]:FetchComponent("Callbacks")
	DataStore = exports["fs-base"]:FetchComponent("DataStore")
	Logger = exports["fs-base"]:FetchComponent("Logger")
	Database = exports["fs-base"]:FetchComponent("Database")
	Fetch = exports["fs-base"]:FetchComponent("Fetch")
	Logger = exports["fs-base"]:FetchComponent("Logger")
	Chat = exports["fs-base"]:FetchComponent("Chat")
	GlobalConfig = exports["fs-base"]:FetchComponent("Config")
	Routing = exports["fs-base"]:FetchComponent("Routing")
	Sequence = exports["fs-base"]:FetchComponent("Sequence")
	Reputation = exports["fs-base"]:FetchComponent("Reputation")
	Apartment = exports["fs-base"]:FetchComponent("Apartment")
	RegisterCommands()
	_spawnFuncs = {}
end

AddEventHandler("Core:Shared:Ready", function()
	exports["fs-base"]:RequestDependencies("Characters", {
		"Callbacks",
		"Database",
		"Middleware",
		"DataStore",
		"Logger",
		"Database",
		"Fetch",
		"Logger",
		"Chat",
		"Config",
		"Routing",
		"Sequence",
		"Reputation",
		"Apartment",
	}, function(error)
		if #error > 0 then
			return
		end -- Do something to handle if not all dependencies loaded
		RetrieveComponents()
		RegisterCallbacks()
		RegisterMiddleware()
		Startup()
	end)
end)
