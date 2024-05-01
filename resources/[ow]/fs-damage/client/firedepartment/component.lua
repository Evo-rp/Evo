AddEventHandler("Hospital:Shared:DependencyUpdate", SAFDComponents)
function SAFDComponents()
	Callbacks = exports["fs-base"]:FetchComponent("Callbacks")
	Notification = exports["fs-base"]:FetchComponent("Notification")
	Damage = exports["fs-base"]:FetchComponent("Damage")
	Notification = exports["fs-base"]:FetchComponent("Notification")
	Targeting = exports["fs-base"]:FetchComponent("Targeting")
	Hospital = exports["fs-base"]:FetchComponent("Hospital")
	Progress = exports["fs-base"]:FetchComponent("Progress")
	Blips = exports["fs-base"]:FetchComponent("Blips")
	PedInteraction = exports["fs-base"]:FetchComponent("PedInteraction")
	Escort = exports["fs-base"]:FetchComponent("Escort")
	Action = exports["fs-base"]:FetchComponent("Action")
	Polyzone = exports["fs-base"]:FetchComponent("Polyzone")
	Animations = exports["fs-base"]:FetchComponent("Animations")
end

AddEventHandler("Core:Shared:Ready", function()
	exports["fs-base"]:RequestDependencies("Hospital", {
		"Callbacks",
		"Notification",
		"Damage",
		"Targeting",
		"Hospital",
		"Progress",
		"PedInteraction",
		"Escort",
		"Blips",
		"Polyzone",
		"Action",
		"Animations",
	}, function(error)
		if #error > 0 then
			return
		end
		SAFDComponents()
		SAFDInit()
	end)
end)
