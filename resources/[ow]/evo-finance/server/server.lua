AddEventHandler("Finance:Shared:DependencyUpdate", RetrieveComponents)
function RetrieveComponents()
	Fetch = exports["evo-base"]:FetchComponent("Fetch")
	Utils = exports["evo-base"]:FetchComponent("Utils")
	Execute = exports["evo-base"]:FetchComponent("Execute")
	Database = exports["evo-base"]:FetchComponent("Database")
	Middleware = exports["evo-base"]:FetchComponent("Middleware")
	Callbacks = exports["evo-base"]:FetchComponent("Callbacks")
	Chat = exports["evo-base"]:FetchComponent("Chat")
	Logger = exports["evo-base"]:FetchComponent("Logger")
	Generator = exports["evo-base"]:FetchComponent("Generator")
	Phone = exports["evo-base"]:FetchComponent("Phone")
	Crypto = exports["evo-base"]:FetchComponent("Crypto")
	Banking = exports["evo-base"]:FetchComponent("Banking")
	Billing = exports["evo-base"]:FetchComponent("Billing")
	Loans = exports["evo-base"]:FetchComponent("Loans")
	Wallet = exports["evo-base"]:FetchComponent("Wallet")
	Tasks = exports["evo-base"]:FetchComponent("Tasks")
	Jobs = exports["evo-base"]:FetchComponent("Jobs")
	Vehicles = exports["evo-base"]:FetchComponent("Vehicles")
	Inventory = exports["evo-base"]:FetchComponent("Inventory")
end

AddEventHandler("Core:Shared:Ready", function()
	exports["evo-base"]:RequestDependencies("Finance", {
		"Fetch",
		"Utils",
		"Execute",
		"Chat",
		"Database",
		"Middleware",
		"Callbacks",
		"Logger",
		"Generator",
		"Phone",
		"Wallet",
		"Banking",
		"Billing",
		"Loans",
		"Crypto",
		"Jobs",
		"Tasks",
		"Vehicles",
		"Inventory",
	}, function(error)
		if #error > 0 then
			exports["evo-base"]:FetchComponent("Logger"):Critical("Finance", "Failed To Load All Dependencies")
			return
		end
		RetrieveComponents()

		TriggerEvent("Finance:Server:Startup")
	end)
end)
