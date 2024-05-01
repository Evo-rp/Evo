AddEventHandler("Drugs:Shared:DependencyUpdate", RetrieveComponents)
function RetrieveComponents()
	Callbacks = exports["evo-base"]:FetchComponent("Callbacks")
	Inventory = exports["evo-base"]:FetchComponent("Inventory")
	Targeting = exports["evo-base"]:FetchComponent("Targeting")
	Progress = exports["evo-base"]:FetchComponent("Progress")
	Hud = exports["evo-base"]:FetchComponent("Hud")
	Notification = exports["evo-base"]:FetchComponent("Notification")
	ObjectPlacer = exports["evo-base"]:FetchComponent("ObjectPlacer")
	Minigame = exports["evo-base"]:FetchComponent("Minigame")
	ListMenu = exports["evo-base"]:FetchComponent("ListMenu")
	PedInteraction = exports["evo-base"]:FetchComponent("PedInteraction")
	Polyzone = exports["evo-base"]:FetchComponent("Polyzone")
end

AddEventHandler("Core:Shared:Ready", function()
	exports["evo-base"]:RequestDependencies("Drugs", {
		"Callbacks",
		"Inventory",
		"Targeting",
		"Progress",
		"Hud",
		"Notification",
		"ObjectPlacer",
		"Minigame",
		"ListMenu",
		"PedInteraction",
		"Polyzone",
	}, function(error)
		if #error > 0 then
			exports["evo-base"]:FetchComponent("Logger"):Critical("Drugs", "Failed To Load All Dependencies")
			return
		end
		RetrieveComponents()

		TriggerEvent("Drugs:Client:Startup")
	end)
end)
