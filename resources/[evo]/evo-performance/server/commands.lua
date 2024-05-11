function RegisterChatCommands()
	Chat:RegisterAdminCommand("perf", function(source, args, rawCommand)
        TriggerClientEvent('evo-performance:client:CheckPerformance', source)
	end, {
		help = "Check Your Current Vehicle Performace",
	})
end
