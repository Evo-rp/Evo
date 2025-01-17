local _logoutLocations = {
    {
        center = vector3(-435.59, -305.86, 35.0),
        length = 1.8,
        width = 2.2,
        options = {
            heading = 22,
            --debugPoly=true,
            minZ = 34.0,
            maxZ = 36.8
        },
    },
    {
        center = vector3(620.07, 11.73, 83.64), 2.4,
        length = 2.4,
        width = 3.6,
        options = {
            heading = 340,
            --debugPoly=true,
            minZ = 82.64,
            maxZ = 85.24
        },
    },
    {
        center = vector3(1849.23, 3691.41, 29.82),
        length = 2.0,
        width = 2.0,
        options = {
            heading = 30,
            --debugPoly=true,
            minZ = 28.82,
            maxZ = 31.22
        },
    },
}

AddEventHandler('Proxy:Shared:RegisterReady', function()
    exports['evo-base']:RegisterComponent('Locations', LOCATIONS)
end)

AddEventHandler('Locations:Shared:DependencyUpdate', RetrieveComponents)
function RetrieveComponents()
    Callbacks = exports['evo-base']:FetchComponent('Callbacks')
    Locations = exports['evo-base']:FetchComponent('Locations')
    Targeting = exports['evo-base']:FetchComponent('Targeting')
    Characters = exports['evo-base']:FetchComponent('Characters')
end

AddEventHandler('Core:Shared:Ready', function()
    exports['evo-base']:RequestDependencies('Locations', {
        'Callbacks',
        'Locations',
        'Targeting',
        'Characters',
    }, function(error)
        if #error > 0 then
            return;
        end
        RetrieveComponents()

        for k, v in ipairs(_logoutLocations) do
            Targeting.Zones:AddBox("logout-location-" .. k, "person-from-portal", v.center, v.length, v.width, v.options, {
                {
                    icon = "person-from-portal",
                    text = "Logout",
                    event = "Locations:Client:LogoutLocation",
                },
            }, 2.0, true)
        end
    end)
end)

LOCATIONS = {
    GetAll = function(self, type, cb)
        Callbacks:ServerCallback('Locations:GetAll', {
            type = type
        }, cb)
    end
}

AddEventHandler('Locations:Client:LogoutLocation', function()
    Characters:Logout()
end)

AddEventHandler("Characters:Client:Spawn", function()
	Citizen.CreateThread(function()
		while LocalPlayer.state.loggedIn do
			Citizen.Wait(20000)

            if not LocalPlayer.state?.tpLocation then
                local coords = GetEntityCoords(PlayerPedId())

                if coords and #(coords - vector3(0.0, 0.0, 0.0)) >= 10.0 then
                    TriggerServerEvent('Characters:Server:LastLocation', coords)
                end
            end
        end
	end)
end)
