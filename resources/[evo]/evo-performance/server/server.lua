AddEventHandler("Sync:Shared:DependencyUpdate", RetrieveComponents)
function RetrieveComponents()
	Chat = exports["evo-base"]:FetchComponent("Chat")
	RegisterChatCommands()
end

AddEventHandler("Core:Shared:Ready", function()
	exports["evo-base"]:RequestDependencies("Perfrmance", {
		"Chat",
	}, function(error)
		if #error > 0 then
			return
		end
		RetrieveComponents()
	end)
end)