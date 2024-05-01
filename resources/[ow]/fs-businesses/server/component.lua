_pickups = {}

AddEventHandler("Businesses:Shared:DependencyUpdate", RetrieveComponents)
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
	Jobs = exports["fs-base"]:FetchComponent("Jobs")
	Vehicles = exports["fs-base"]:FetchComponent("Vehicles")
	Inventory = exports["fs-base"]:FetchComponent("Inventory")
	Wallet = exports["fs-base"]:FetchComponent("Wallet")
	Crafting = exports["fs-base"]:FetchComponent("Crafting")
	Banking = exports["fs-base"]:FetchComponent("Banking")
	MDT = exports["fs-base"]:FetchComponent("MDT")
	StorageUnits = exports["fs-base"]:FetchComponent("StorageUnits")
end

AddEventHandler("Core:Shared:Ready", function()
	exports["fs-base"]:RequestDependencies("Businesses", {
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
		"Jobs",
		"Vehicles",
		"Inventory",
		"Wallet",
		"Crafting",
		"Banking",
		"MDT",
		"StorageUnits",
	}, function(error)
		if #error > 0 then
			exports["fs-base"]:FetchComponent("Logger"):Critical("Businesses", "Failed To Load All Dependencies")
			return
		end
		RetrieveComponents()

		TriggerEvent("Businesses:Server:Startup")

		Middleware:Add("Characters:Spawning", function(source)
			TriggerClientEvent("Businesses:Client:CreatePoly", source, _pickups)
		end, 2)

		Startup()
	end)
end)

function Startup()
	for k, v in ipairs(Config.Businesses) do
		Logger:Trace("Businesses", string.format("Registering Business ^3%s^7", v.Name))
		if v.Benches then
			for benchId, bench in pairs(v.Benches) do
				Logger:Trace(
					"Businesses",
					string.format("Registering Crafting Bench ^2%s^7 For ^3%s^7", bench.label, v.Name)
				)

				if bench.targeting.manual then
					Crafting:RegisterBench(string.format("%s-%s", v.Job, benchId), bench.label, bench.targeting, {}, {
						job = {
							id = v.Job,
							onDuty = true,
						},
					}, bench.recipes)
				else
					Crafting:RegisterBench(string.format("%s-%s", k, benchId), bench.label, bench.targeting, {
						x = 0,
						y = 0,
						z = bench.targeting.poly.coords.z,
						h = bench.targeting.poly.options.heading,
					}, {
						job = {
							id = v.Job,
							onDuty = true,
						},
					}, bench.recipes)
				end
			end
		end

		if v.Storage then
			for _, storage in pairs(v.Storage) do
				Logger:Trace(
					"Businesses",
					string.format("Registering Poly Inventory ^2%s^7 For ^3%s^7", storage.id, v.Name)
				)
				Inventory.Poly:Create(storage)
			end
		end

		if v.Pickups then
			for num, pickup in pairs(v.Pickups) do
				table.insert(_pickups, pickup.id)
				pickup.num = num
				pickup.job = v.Job
				pickup.jobName = v.Name
				GlobalState[string.format("Businesses:Pickup:%s", pickup.id)] = pickup
			end
		end
	end
end
