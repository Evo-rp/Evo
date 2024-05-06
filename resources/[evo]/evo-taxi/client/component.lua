_state = false
_rate = GetResourceKvpInt("TAXI_RATE") or 10

AddEventHandler("Taxi:Shared:DependencyUpdate", RetrieveComponents)
function RetrieveComponents()
	Logger = exports["evo-base"]:FetchComponent("Logger")
	Blips = exports["evo-base"]:FetchComponent("Blips")
	Keybinds = exports["evo-base"]:FetchComponent("Keybinds")
	Notification = exports["evo-base"]:FetchComponent("Notification")
	PedInteraction = exports["evo-base"]:FetchComponent("PedInteraction")
	Taxi = exports["evo-base"]:FetchComponent("Taxi")
	Input = exports["evo-base"]:FetchComponent("Input")
end

AddEventHandler("Core:Shared:Ready", function()
	exports["evo-base"]:RequestDependencies("Jail", {
		"Logger",
		"Blips",
		"Keybinds",
		"Notification",
		"PedInteraction",
		"Taxi",
	}, function(error)
		if #error > 0 then
			return
		end
		RetrieveComponents()

		Keybinds:Add("taxi_increase_rate", "", "keyboard", "Taxi - Set Rate", function()
			Taxi.Rate:Set()
		end)

		Keybinds:Add("taxi_reset_trip", "", "keyboard", "Taxi - Reset Trip", function()
			Taxi.Trip:Reset()
		end)

		Keybinds:Add("taxi_toggle_hud", "", "keyboard", "Taxi - Toggle HUD", function()
			Taxi.Hud:Toggle()
		end)
	end)
end)

AddEventHandler("Proxy:Shared:RegisterReady", function()
	exports["evo-base"]:RegisterComponent("Taxi", _TAXI)
end)

local _threading = false
function DoTaxiThread(veh)
	if _threading then
		return
	end
	_threading = true

	local prevLocation = GetEntityCoords(veh)
	Citizen.CreateThread(function()
		while LocalPlayer.state.loggedIn and _inVeh == veh and _state do
			local currLocation = GetEntityCoords(veh)
			local dist = #(currLocation - prevLocation)
			SendNUIMessage({
				type = "UPDATE_TRIP",
				data = {
					trip = dist,
				},
			})
			prevLocation = currLocation
			Citizen.Wait(1000)
		end
		_threading = false
	end)
end

_TAXI = {
	Hud = {
		Show = function(self)
			local veh = GetVehiclePedIsIn(LocalPlayer.state.ped)
			if _models[GetEntityModel(veh)] and GetPedInVehicleSeat(veh, -1) == LocalPlayer.state.ped then
				_inVeh = veh

				_state = true
				DoTaxiThread(veh)
				SendNUIMessage({
					type = "APP_SHOW",
					data = {
						rate = _rate,
					},
				})
			end
		end,
		Hide = function(self)
			_state = false
			SendNUIMessage({
				type = "APP_HIDE",
			})
		end,
		Reset = function(self)
			_state = false
			SendNUIMessage({
				type = "APP_RESET",
			})
		end,
		Toggle = function(self)
			if _state then
				Taxi.Hud:Hide()
			else
				Taxi.Hud:Show()
			end
		end,
	},
	Rate = {
		Set = function(self)
			local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
			if DoesEntityExist(vehicle) and IsVehicleModel(vehicle, GetHashKey("taxi")) then
				Input:Show("Taxi", "Set Rate", {
					{
						id = "rate",
						type = "number",
						options = {},
					},
				}, "Taxi:SetRate", {})
			end
		end,
	},
	Trip = {
		Reset = function(self)
			SendNUIMessage({
				type = "RESET_TRIP",
			})
		end,
	},
}

AddEventHandler('Taxi:SetRate', function(values, data)
	if tonumber(values.rate) < 1000 then
		SetResourceKvpInt("TAXI_RATE", tonumber(values.rate))
		SendNUIMessage({
			type = "SET_RATE",
			data = {
				rate = tonumber(values.rate),
			},
		})
	else
		Notification:Error("Rate cannot be higher than 1000 or higher")
	end
end)