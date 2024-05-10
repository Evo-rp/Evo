_curBed = nil
_done = false

_healEnd = nil
_leavingBed = false

AddEventHandler("Hospital:Shared:DependencyUpdate", HospitalComponents)
function HospitalComponents()
	Callbacks = exports["evo-base"]:FetchComponent("Callbacks")
	Notification = exports["evo-base"]:FetchComponent("Notification")
	Damage = exports["evo-base"]:FetchComponent("Damage")
	Notification = exports["evo-base"]:FetchComponent("Notification")
	Targeting = exports["evo-base"]:FetchComponent("Targeting")
	Hospital = exports["evo-base"]:FetchComponent("Hospital")
	Progress = exports["evo-base"]:FetchComponent("Progress")
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
		"Polyzone",
		"Action",
		"Animations",
	}, function(error)
		if #error > 0 then
			return
		end
		HospitalComponents()
		Init()

		while GlobalState["HiddenHospital"] == nil do
			Citizen.Wait(5)
		end

		PedInteraction:Add("HiddenHospital", `s_m_m_doctor_01`, GlobalState["HiddenHospital"].coords, GlobalState["HiddenHospital"].heading, 25.0, {
			{
				icon = "heart-pulse",
				text = "Revive Escort (20 $PLEB)",
				event = "Hospital:Client:HiddenRevive",
				data = LocalPlayer.state.isEscorting or {},
				isEnabled = function()
					if LocalPlayer.state.isEscorting ~= nil and not LocalPlayer.state.isDead then
						local ps = Player(LocalPlayer.state.isEscorting).state
						return ps.isDead and not ps.deadData?.isMinor
					else
						return false
					end
				end,
			},
		}, 'suitcase-medical', 'CODE_HUMAN_MEDIC_KNEEL')

		Polyzone.Create:Box('hospital-check-in-zone-1', vector3(1146.37, -1538.66, 35.03), 2.8, 1.2, {
			heading = 0,
			--debugPoly=true,
			minZ = 32.63,
  			maxZ = 36.63
		}, {})

		Polyzone.Create:Box('hospital-check-in-zone-2', vector3(1129.59, -1534.96, 35.03), 2.8, 1.2, {
			heading = 3,
			--debugPoly=true,
			minZ = 32.63,
			maxZ = 36.63
		}, {})

		Polyzone.Create:Box('hospital-check-in-zone-3', vector3(1142.82, -1537.74, 39.5), 2.8, 1.2, {
			heading = 88,
			--debugPoly=true,
			minZ = 37.1,
			maxZ = 41.1
		}, {})

		Targeting.Zones:AddBox("icu-checkout", "bell-concierge", vector3(-492.49, -336.15, 69.52), 0.8, 7.2, {
			name = "hospital",
			heading = 353,
			--debugPoly=true,
			minZ = 68.52,
			maxZ = 70.52
		}, {
			{
				icon = "bell-concierge",
				text = "Request Personnel",
				event = "Hospital:Client:RequestEMS",
				isEnabled = function()
					return (LocalPlayer.state.Character:GetData("ICU") ~= nil and not LocalPlayer.state.Character:GetData("ICU").Released) and (not _done or _done < GetCloudTimeAsInt())
				end,
			}
		})
	end)
end)

AddEventHandler("Hospital:Client:RequestEMS", function()
	if not _done or _done < GetCloudTimeAsInt() then
		TriggerServerEvent("EmergencyAlerts:Server:DoPredefined", "icurequest")
		_done = GetCloudTimeAsInt() + (60 * 10)
	end
end)

AddEventHandler('Proxy:Shared:RegisterReady', function()
    exports['evo-base']:RegisterComponent('Hospital', HOSPITAL)
end)

local _bedId = nil
HOSPITAL = {
	CheckIn = function(self)
		Callbacks:ServerCallback('Hospital:Treat', {}, function(bed)
			if bed ~= nil then
				_countdown = Config.HealTimer
				LocalPlayer.state:set("isHospitalized", true, true)
				Hospital:SendToBed(Config.Beds[bed], false, bed)
			else
				Notification:Error('No Beds Available')
			end
		end)
	end,
	SendToBed = function(self, bed, isRp, bedId)
		local fuck = false

		if bedId then
			local p = promise.new()
			Callbacks:ServerCallback('Hospital:OccupyBed', bedId, function(s)
				p:resolve(s)
			end)

			fuck = Citizen.Await(p)
		else
			fuck = true
		end

		_bedId = bedId

		if bed ~= nil and fuck then
			SetBedCam(bed)
			if isRp then
				_healEnd = GetCloudTimeAsInt()
				Hud.DeathTexts:Show("hospital_rp", GetCloudTimeAsInt(), _healEnd, "primary_action")
			else
				_healEnd = GetCloudTimeAsInt() + (60 * 1)
				Hud.DeathTexts:Show("hospital", GetCloudTimeAsInt(), _healEnd, "primary_action")
				Citizen.SetTimeout(((_healEnd - GetCloudTimeAsInt()) - 10) * 1000, function()
					if LocalPlayer.state.loggedIn and LocalPlayer.state.isHospitalized then
						Damage:Revive()
					end
				end)
			end
		else
			Notification:Error('Invalid Bed or Bed Occupied')
		end
	end,
	FindBed = function(self, object)
		local coords = GetEntityCoords(object)
		Callbacks:ServerCallback('Hospital:FindBed', coords, function(bed)
			if bed ~= nil then
				Hospital:SendToBed(Config.Beds[bed], true, bed)
			else
				Hospital:SendToBed({
					x = coords.x,
					y = coords.y,
					z = coords.z,
					h = GetEntityHeading(object),
					freeBed = true,
				}, true)
			end
		end)
	end,
	LeaveBed = function(self)
		Callbacks:ServerCallback('Hospital:LeaveBed', _bedId, function()
			_bedId = nil
		end)
	end,
}

local _inCheckInZone = false

AddEventHandler('Polyzone:Enter', function(id, point, insideZone, data)
    if id == 'hospital-check-in-zone' then
        _inCheckInZone = true

		if not LocalPlayer.state.isEscorted and (GlobalState["ems:pmc:doctor"] == nil or GlobalState["ems:pmc:doctor"] == 0) then
			if not GlobalState["Duty:ems"] or GlobalState["Duty:ems"] == 0 then
				Action:Show('{keybind}primary_action{/keybind} Check In {key}$150{/key}')
			else
				Action:Show('{keybind}primary_action{/keybind} Check In {key}$5000{/key}')
			end
		end
    end
end)

AddEventHandler('Polyzone:Exit', function(id, point, insideZone, data)
    if id == 'hospital-check-in-zone' then
        _inCheckInZone = false
		Action:Hide()
    end
end)

AddEventHandler('Keybinds:Client:KeyUp:primary_action', function()
    if _inCheckInZone then
		if not LocalPlayer.state.doingAction and not LocalPlayer.state.isEscorted and (GlobalState["ems:pmc:doctor"] == nil or GlobalState["ems:pmc:doctor"] == 0) then
			TriggerEvent('Hospital:Client:CheckIn')
		end
	else
		if _curBed ~= nil and LocalPlayer.state.isHospitalized and GetCloudTimeAsInt() > _healEnd and not _leavingBed then
			_leavingBed = true
			Hud.DeathTexts:Release()
			LeaveBed()
		end
	end
end)