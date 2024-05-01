AddEventHandler('Characters:Shared:DependencyUpdate', RetrieveComponents)
function RetrieveComponents()
	Middleware = exports['evo-base']:FetchComponent('Middleware')
	Database = exports['evo-base']:FetchComponent('Database')
	Callbacks = exports['evo-base']:FetchComponent('Callbacks')
	DataStore = exports['evo-base']:FetchComponent('DataStore')
	Logger = exports['evo-base']:FetchComponent('Logger')
	Database = exports['evo-base']:FetchComponent('Database')
	Fetch = exports['evo-base']:FetchComponent('Fetch')
	Logger = exports['evo-base']:FetchComponent('Logger')
	Chat = exports['evo-base']:FetchComponent('Chat')
	GlobalConfig = exports['evo-base']:FetchComponent('Config')
	Routing = exports['evo-base']:FetchComponent('Routing')
	Sequence = exports['evo-base']:FetchComponent('Sequence')
	Reputation = exports['evo-base']:FetchComponent('Reputation')
	Apartment = exports['evo-base']:FetchComponent('Apartment')
	RegisterCommands()
	_spawnFuncs = {}
end

AddEventHandler('Core:Shared:Ready', function()
	exports['evo-base']:RequestDependencies('Characters', {
		'Callbacks',
		'Database',
		'Middleware',
		'DataStore',
		'Logger',
		'Database',
		'Fetch',
		'Logger',
		'Chat',
		'Config',
		'Routing',
		'Sequence',
		'Reputation',
		'Apartment',
	}, function(error)
		if #error > 0 then return end -- Do something to handle if not all dependencies loaded
		RetrieveComponents()
		RegisterCallbacks()
		RegisterMiddleware()
		Startup()
	end)
end)