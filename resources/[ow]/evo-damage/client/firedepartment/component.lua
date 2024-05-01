AddEventHandler("Hospital:Shared:DependencyUpdate", SAFDComponents)
function SAFDComponents()
	Callbacks = exports["evo-base"]:FetchComponent("Callbacks")
	Notification = exports["evo-base"]:FetchComponent("Notification")
	Damage = exports["evo-base"]:FetchComponent("Damage")
	Notification = exports["evo-base"]:FetchComponent("Notification")
	Targeting = exports["evo-base"]:FetchComponent("Targeting")
	Hospital = exports["evo-base"]:FetchComponent("Hospital")
	Progress = exports["evo-base"]:FetchComponent("Progress")
	Blips = exports["evo-base"]:FetchComponent("Blips")
	PedInteraction = exports["evo-base"]:FetchComponent("PedInteraction")
	Escort = exports["evo-base"]:FetchComponent("Escort")
	Action = exports["evo-base"]:FetchComponent("Action")
	Polyzone = exports["evo-base"]:FetchComponent("Polyzone")
	Animations = exports["evo-base"]:FetchComponent("Animations")
end

AddEventHandler("Core:Shared:Ready", function()
	exports["evo-base"]:RequestDependencies("Hospital", {
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
