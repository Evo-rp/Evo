_pickups = {}

AddEventHandler("Businesses:Shared:DependencyUpdate", RetrieveComponents)
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
	Jobs = exports["evo-base"]:FetchComponent("Jobs")
	Vehicles = exports["evo-base"]:FetchComponent("Vehicles")
	Inventory = exports["evo-base"]:FetchComponent("Inventory")
	Wallet = exports["evo-base"]:FetchComponent("Wallet")
	Crafting = exports["evo-base"]:FetchComponent("Crafting")
	Banking = exports["evo-base"]:FetchComponent("Banking")
	MDT = exports["evo-base"]:FetchComponent("MDT")
	StorageUnits = exports["evo-base"]:FetchComponent("StorageUnits")
	ForSaleBusinesses = exports["evo-base"]:FetchComponent("ForSaleBusinesses")
	Jobs = exports["evo-base"]:FetchComponent("Jobs")
end

AddEventHandler("Core:Shared:Ready", function()
	exports["evo-base"]:RequestDependencies("Businesses", {
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
			exports["evo-base"]:FetchComponent("Logger"):Critical("Businesses", "Failed To Load All Dependencies")
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
