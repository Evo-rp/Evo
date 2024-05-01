AddEventHandler("Apartments:Shared:DependencyUpdate", RetrieveComponents)
function RetrieveComponents()
	Database = exports["evo-base"]:FetchComponent("Database")
	Callbacks = exports["evo-base"]:FetchComponent("Callbacks")
	Logger = exports["evo-base"]:FetchComponent("Logger")
	Utils = exports["evo-base"]:FetchComponent("Utils")
	Fetch = exports["evo-base"]:FetchComponent("Fetch")
	Mechanic = exports["evo-base"]:FetchComponent("Mechanic")
	Jobs = exports["evo-base"]:FetchComponent("Jobs")
	Inventory = exports["evo-base"]:FetchComponent("Inventory")
	Crafting = exports["evo-base"]:FetchComponent("Crafting")
	Vehicles = exports["evo-base"]:FetchComponent("Vehicles")
end

AddEventHandler("Core:Shared:Ready", function()
	exports["evo-base"]:RequestDependencies("Mechanic", {
		"Database",
		"Callbacks",
		"Logger",
		"Utils",
		"Fetch",
		"Mechanic",
		"Jobs",
		"Inventory",
		"Crafting",
		"Vehicles",
	}, function(error)
		if #error > 0 then
			return
		end
		RetrieveComponents()
		RegisterCallbacks()

		RegisterMechanicItems()

		for k, v in ipairs(_mechanicShopStorageCrafting) do
			if v.partCrafting then
				for benchId, bench in ipairs(v.partCrafting) do
					Crafting:RegisterBench(string.format("mech-%s-%s", v.job, benchId), bench.label, bench.targeting, {
						x = bench.targeting.poly.coords.x,
						y = bench.targeting.poly.coords.y,
						z = bench.targeting.poly.coords.z,
						h = bench.targeting.poly.options.heading,
					}, {
						job = {
							id = v.job,
							onDuty = true,
						},
					}, bench.recipes, bench.canUseSchematics)
				end
			end

			if v.partStorage then
				for storageId, storage in ipairs(v.partStorage) do
					Inventory.Poly:Create(storage)
				end
			end
		end
	end)
end)

AddEventHandler("Proxy:Shared:RegisterReady", function()
	exports["evo-base"]:RegisterComponent("Mechanic", MECHANIC)
end)

MECHANIC = {}
