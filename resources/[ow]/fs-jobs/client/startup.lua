AddEventHandler("Jobs:Shared:DependencyUpdate", RetrieveComponents)
function RetrieveComponents()
	Callbacks = exports["fs-base"]:FetchComponent("Callbacks")
	Logger = exports["fs-base"]:FetchComponent("Logger")
	Utils = exports["fs-base"]:FetchComponent("Utils")
	Notification = exports["fs-base"]:FetchComponent("Notification")
	Jobs = exports["fs-base"]:FetchComponent("Jobs")
end

AddEventHandler("Core:Shared:Ready", function()
	exports["fs-base"]:RequestDependencies("Jobs", {
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
