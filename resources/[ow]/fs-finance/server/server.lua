AddEventHandler("Finance:Shared:DependencyUpdate", RetrieveComponents)
function RetrieveComponents()
	Fetch = exports["fs-base"]:FetchComponent("Fetch")
	Utils = exports["fs-base"]:FetchComponent("Utils")
	Execute = exports["fs-base"]:FetchComponent("Execute")
	Database = exports["fs-base"]:FetchComponent("Database")
	Middleware = exports["fs-base"]:FetchComponent("Middleware")
	Callbacks = exports["fs-base"]:FetchComponent("Callbacks")
	Chat = exports["fs-base"]:FetchComponent("Chat")
	Logger = exports["fs-base"]:FetchComponent("Logger")
	Generator = exports["fs-base"]:FetchComponent("Generator")
	Phone = exports["fs-base"]:FetchComponent("Phone")
	Crypto = exports["fs-base"]:FetchComponent("Crypto")
	Banking = exports["fs-base"]:FetchComponent("Banking")
	Billing = exports["fs-base"]:FetchComponent("Billing")
	Loans = exports["fs-base"]:FetchComponent("Loans")
	Wallet = exports["fs-base"]:FetchComponent("Wallet")
	Tasks = exports["fs-base"]:FetchComponent("Tasks")
	Jobs = exports["fs-base"]:FetchComponent("Jobs")
	Vehicles = exports["fs-base"]:FetchComponent("Vehicles")
	Inventory = exports["fs-base"]:FetchComponent("Inventory")
end

AddEventHandler("Core:Shared:Ready", function()
	exports["fs-base"]:RequestDependencies("Finance", {
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
			exports["fs-base"]:FetchComponent("Logger"):Critical("Finance", "Failed To Load All Dependencies")
			return
		end
		RetrieveComponents()

		TriggerEvent("Finance:Server:Startup")
	end)
end)
