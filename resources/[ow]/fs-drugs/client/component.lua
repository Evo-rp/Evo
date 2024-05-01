AddEventHandler("Drugs:Shared:DependencyUpdate", RetrieveComponents)
function RetrieveComponents()
	Callbacks = exports["fs-base"]:FetchComponent("Callbacks")
	Inventory = exports["fs-base"]:FetchComponent("Inventory")
	Targeting = exports["fs-base"]:FetchComponent("Targeting")
	Progress = exports["fs-base"]:FetchComponent("Progress")
	Hud = exports["fs-base"]:FetchComponent("Hud")
	Notification = exports["fs-base"]:FetchComponent("Notification")
	ObjectPlacer = exports["fs-base"]:FetchComponent("ObjectPlacer")
	Minigame = exports["fs-base"]:FetchComponent("Minigame")
	ListMenu = exports["fs-base"]:FetchComponent("ListMenu")
	PedInteraction = exports["fs-base"]:FetchComponent("PedInteraction")
	Polyzone = exports["fs-base"]:FetchComponent("Polyzone")
end

AddEventHandler("Core:Shared:Ready", function()
	exports["fs-base"]:RequestDependencies("Drugs", {
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
			exports["fs-base"]:FetchComponent("Logger"):Critical("Drugs", "Failed To Load All Dependencies")
			return
		end
		RetrieveComponents()

		TriggerEvent("Drugs:Client:Startup")
	end)
end)
