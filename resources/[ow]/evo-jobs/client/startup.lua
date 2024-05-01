AddEventHandler("Jobs:Shared:DependencyUpdate", RetrieveComponents)
function RetrieveComponents()
	Callbacks = exports["evo-base"]:FetchComponent("Callbacks")
	Logger = exports["evo-base"]:FetchComponent("Logger")
	Utils = exports["evo-base"]:FetchComponent("Utils")
	Notification = exports["evo-base"]:FetchComponent("Notification")
	Jobs = exports["evo-base"]:FetchComponent("Jobs")
end

AddEventHandler("Core:Shared:Ready", function()
	exports["evo-base"]:RequestDependencies("Jobs", {
		"Callbacks",
		"Logger",
		"Utils",
		"Notification",
		"Jobs",
	}, function(error)
		if #error > 0 then
			return
		end
		RetrieveComponents()
	end)
end)
