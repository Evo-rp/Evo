local policeStationBlips = {
	vector3(-445.7, 6013.2, 100.0),
	vector3(589.595, -4.845, 113.363),
	vector3(1850.634, 3683.860, 100.0),
	vector3(372.658, -1601.816, 100.0),
	vector3(835.011, -1292.794, 100.0),
	vector3(378.742, 801.199, 187.675),
	vector3(428.705, -982.595, 35.582)
}

local _pdModels = {}
local _emsModels = {}

local lastTackle = 0

local _breached = {}

local policeDutyPoint = {
	{
		icon = "clipboard-check",
		text = "Go On Duty",
		event = "Police:Client:OnDuty",
		jobPerms = {
			{
				job = "police",
				reqOffDuty = true,
			},
		},
	},
	{
		icon = "clipboard",
		text = "Go Off Duty",
		event = "Police:Client:OffDuty",
		jobPerms = {
			{
				job = "police",
				reqDuty = true,
			},
		},
	},
}

local _pdStationPolys = {
	{
		points = {
			vector2(652.99047851562, -16.881130218506),
			vector2(658.63635253906, -10.847926139832),
			vector2(664.91101074219, -2.9746489524841),
			vector2(667.87384033203, 1.6730183362961),
			vector2(657.22534179688, 8.7602939605713),
			vector2(638.99658203125, 15.857474327087),
			vector2(625.30963134766, 21.043769836426),
			vector2(614.06805419922, 25.060285568237),
			vector2(602.15069580078, 29.026824951172),
			vector2(588.88879394531, 32.200756072998),
			vector2(575.017578125, 34.140483856201),
			vector2(561.87292480469, 34.782337188721),
			vector2(546.20684814453, 33.236515045166),
			vector2(535.95904541016, 30.142761230469),
			vector2(523.97570800781, 24.668859481812),
			vector2(515.23156738281, 18.228441238403),
			vector2(507.83135986328, 11.211340904236),
			vector2(499.8928527832, 1.7220767736435),
			vector2(493.17269897461, -8.5908002853394),
			vector2(490.34576416016, -13.227485656738),
			vector2(497.40631103516, -18.644784927368),
			vector2(504.17944335938, -23.2024269104),
			vector2(514.89752197266, -29.810018539429),
			vector2(522.41687011719, -35.481426239014),
			vector2(531.58880615234, -44.229679107666),
			vector2(535.38122558594, -50.6047706604),
			vector2(540.59204101562, -58.423030853271),
			vector2(545.59606933594, -62.582099914551),
			vector2(556.24176025391, -69.576362609863),
			vector2(571.86010742188, -65.172164916992),
			vector2(587.69427490234, -59.327331542969),
			vector2(600.27001953125, -53.614898681641),
			vector2(618.19464111328, -44.802200317383),
			vector2(628.79321289062, -38.876937866211),
			vector2(639.58062744141, -30.965692520142)
		},
		options = {
			name = "pdstation_vpd",
			minZ = 70.211494445801,
			maxZ = 94.416831970215
		},
		data = { pdstation = true },
	},
	{
		points = {
			vector2(411.00393676758, -1661.6872558594),
			vector2(424.06509399414, -1645.6456298828),
			vector2(424.70223999023, -1640.4389648438),
			vector2(423.83392333984, -1627.9958496094),
			vector2(360.71951293945, -1574.7712402344),
			vector2(339.02374267578, -1600.73046875),
		},
		options = {
			name = "pdstation_davis",
			minZ = 25.36417388916,
			maxZ = 45.414678573608,
		},
		data = { pdstation = true },
	},
	{
		points = {
			vector2(818.44097900391, -1249.2879638672),
			vector2(836.80029296875, -1252.8927001953),
			vector2(860.4052734375, -1278.6043701172),
			vector2(862.82849121094, -1296.5511474609),
			vector2(877.03753662109, -1297.9116210938),
			vector2(878.47839355469, -1328.7099609375),
			vector2(878.81671142578, -1361.5606689453),
			vector2(848.46789550781, -1417.4731445312),
			vector2(816.15045166016, -1417.8415527344),
		},
		options = {
			name = "pdstation_popular",
			minZ = 25.36417388916,
			maxZ = 45.414678573608,
		},
		data = { pdstation = true },
	},
	{
		points = {
			vector2(1889.2142333984, 3691.6762695312),
			vector2(1851.7814941406, 3668.3894042969),
			vector2(1830.3732910156, 3704.9562988281),
			vector2(1868.1072998047, 3727.1462402344),
		},
		options = {
			name = "pdstation_sandy",
			minZ = 29.36417388916,
			maxZ = 49.414678573608,
		},
		data = { pdstation = true },
	},
	{
		points = {
			vector2(-442.38430786133, 6062.9243164062),
			vector2(-416.13342285156, 6005.0458984375),
			vector2(-415.57186889648, 5998.3540039062),
			vector2(-439.16738891602, 5975.2041015625),
			vector2(-449.66729736328, 5985.3481445312),
			vector2(-472.04858398438, 5963.1728515625),
			vector2(-500.68542480469, 5991.81640625),
			vector2(-478.4963684082, 6014.41796875),
			vector2(-488.33645629883, 6024.4272460938),
			vector2(-460.89733886719, 6051.8681640625),
		},
		options = {
			name = "pdstation_paleto",
			minZ = 29.36417388916,
			maxZ = 49.414678573608,
		},
		data = { pdstation = true },
	},
	{
		points = {
			vector2(1013.2506713868, -2313.5517578125),
			vector2(1016.5518188476, -2307.0634765625),
			vector2(1031.3686523438, -2308.8452148438),
			vector2(1028.384765625, -2314.8395996094)
		},
		options = {
			name = "pdstation_impound",
			heading = 0,
			--debugPoly=true,
			minZ = 30.511,
			maxZ = 30.512
		},
		data = { pdstation = true },
	},
}

function loadModel(model)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Citizen.Wait(1)
	end
end

AddEventHandler("Police:Shared:DependencyUpdate", PoliceComponents)
function PoliceComponents()
	Callbacks = exports["evo-base"]:FetchComponent("Callbacks")
	Inventory = exports["evo-base"]:FetchComponent("Inventory")
	Notification = exports["evo-base"]:FetchComponent("Notification")
	Input = exports["evo-base"]:FetchComponent("Input")
	Keybinds = exports["evo-base"]:FetchComponent("Keybinds")
	Handcuffs = exports["evo-base"]:FetchComponent("Handcuffs")
	Interaction = exports["evo-base"]:FetchComponent("Interaction")
	Blips = exports["evo-base"]:FetchComponent("Blips")
	Targeting = exports["evo-base"]:FetchComponent("Targeting")
	Jobs = exports["evo-base"]:FetchComponent("Jobs")
	Sounds = exports["evo-base"]:FetchComponent("Sounds")
	Properties = exports["evo-base"]:FetchComponent("Properties")
	Apartment = exports["evo-base"]:FetchComponent("Apartment")
	EmergencyAlerts = exports["evo-base"]:FetchComponent("EmergencyAlerts")
	Wardrobe = exports["evo-base"]:FetchComponent("Wardrobe")
	Status = exports["evo-base"]:FetchComponent("Status")
	Game = exports["evo-base"]:FetchComponent("Game")
	Sync = exports["evo-base"]:FetchComponent("Sync")
	Polyzone = exports["evo-base"]:FetchComponent("Polyzone")
	Vehicles = exports["evo-base"]:FetchComponent("Vehicles")
end

AddEventHandler("Core:Shared:Ready", function()
	exports["evo-base"]:RequestDependencies("Police", {
		"Callbacks",
		"Inventory",
		"Notification",
		"Input",
		"Keybinds",
		"Handcuffs",
		"Interaction",
		"Blips",
		"Targeting",
		"Jobs",
		"Sounds",
		"Properties",
		"Apartment",
		"EmergencyAlerts",
		"Wardrobe",
		"Status",
		"Game",
		"Sync",
		"Polyzone",
		"Vehicles",
	}, function(error)
		if #error > 0 then
			return
		end
		PoliceComponents()

		_pdModels = GlobalState["PoliceCars"]
		_emsModels = GlobalState["EMSCars"]

		Interaction:RegisterMenu("police-panic", false, "siren-on", function(data)
			Interaction:ShowMenu({
				{
					icon = "siren-on",
					label = "13-A",
					action = function()
						Interaction:Hide()
						TriggerServerEvent("Police:Server:Panic", true)
					end,
					shouldShow = function()
						return LocalPlayer.state.isDead
					end,
				},
				{
					icon = "siren",
					label = "13-B",
					action = function()
						Interaction:Hide()
						TriggerServerEvent("Police:Server:Panic", false)
					end,
					shouldShow = function()
						return LocalPlayer.state.isDead
					end,
				},
			})
		end, function()
			return LocalPlayer.state.onDuty == "police" and LocalPlayer.state.isDead
		end)

		Interaction:RegisterMenu("police", "Secured Compartment", "gun", function(data)
			Interaction:Hide()

			Inventory.Dumbfuck:Open({
				invType = 3,
				owner = GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId())),
			})
		end, function()
			return LocalPlayer.state.onDuty == "police" and not LocalPlayer.state.isDead and GetVehicleClass(GetVehiclePedIsIn(PlayerPedId(), false)) == 18 and IsPedInAnyVehicle(PlayerPedId())
		end)

		Interaction:RegisterMenu("police-raid-biz", "Search Inventory", "magnifying-glass", function(data)
			Interaction:Hide()
			Progress:ProgressWithTickEvent({
				name = 'pd_raid_biz',
				duration = 8000,
				label = "Searching",
				tickrate = 250,
				useWhileDead = false,
				canCancel = true,
				vehicle = false,
				controlDisables = {
					disableMovement = true,
					disableCarMovement = true,
					disableCombat = true,
				},
				animation = {
					animDict = "anim@gangops@facility@servers@bodysearch@",
					anim = "player_search",
					flags = 49,
				},
			}, function()
				if LocalPlayer.state.onDuty == "police" and not LocalPlayer.state.isDead and LocalPlayer.state._inInvPoly ~= nil then
					return
				end
				Progress:Cancel()
			end, function(cancelled)
				_doing = false
				if not cancelled then
					Callbacks:ServerCallback("Inventory:Raid", LocalPlayer.state._inInvPoly.inventory, function(owner) end)
				end
			end)
		end, function()
			return LocalPlayer.state.onDuty == "police"
					and not LocalPlayer.state.isDead
					and LocalPlayer.state._inInvPoly ~= nil
					and LocalPlayer.state._inInvPoly?.business ~= nil
		end)

		Interaction:RegisterMenu("pd-locked-veh", "Secured Compartment", "shield-keyhole", function(data)
			Interaction:Hide()
			Progress:Progress({
				name = "pd_rack_prog",
				duration = 5000,
				label = "Unlocking Compartment",
				useWhileDead = false,
				canCancel = true,
				animation = false,
			}, function(status)
				if not status then
					Callbacks:ServerCallback("Police:AccessRifleRack")
				end
			end)
		end, function()
			local v = GetVehiclePedIsIn(LocalPlayer.state.ped)
			return LocalPlayer.state.onDuty == "police" and not LocalPlayer.state.isDead and v ~= 0 and _pdModels[GetEntityModel(v)] and Vehicles:HasAccess(v)
		end)

		Interaction:RegisterMenu("police-utils", "Police Utilities", "tablet-rugged", function(data)
			Interaction:ShowMenu({
				{
					icon = "lock-keyhole-open",
					label = "Slimjim Vehicle",
					action = function()
						Interaction:Hide()
						TriggerServerEvent("Police:Server:Slimjim")
					end,
					shoudlShow = function()
						local target = Targeting:GetEntityPlayerIsLookingAt()
						return target
							and target.entity
							and DoesEntityExist(target.entity)
							and IsEntityAVehicle(target.entity)
							and #(GetEntityCoords(target.entity) - GetEntityCoords(LocalPlayer.state.ped)) <= 2.0
					end,
				},
				{
					icon = "tablet-screen-button",
					label = "MDT",
					action = function()
						Interaction:Hide()
						TriggerEvent("MDT:Client:Toggle")
					end,
					shoudlShow = function()
						return LocalPlayer.state.onDuty == "police"
					end,
				},
				{
					icon = "camera-security",
					label = "Toggle Body Cam",
					action = function()
						Interaction:Hide()
						TriggerEvent("MDT:Client:ToggleBodyCam")
					end,
					shoudlShow = function()
						return LocalPlayer.state.onDuty == "police"
					end,
				},
			})
		end, function()
			return LocalPlayer.state.onDuty == "police"
		end)

		Interaction:RegisterMenu("pd-breach", "Breach", "bomb", function(data)
			local prop = Properties:Get(data.propertyId)
			Interaction:ShowMenu({
				{
					icon = "house",
					label = "Breach Property",
					action = function()
						Interaction:Hide()
						Callbacks:ServerCallback("Police:Breach", {
							type = "property",
							property = data.propertyId,
						}, function(s)
							if s then

							end
						end)
					end,
					shouldShow = function()
						return prop ~= nil and prop.sold
					end,
				},
				{
					icon = "window-frame-open",
					label = "Breach Apartment",
					action = function()
						Interaction:Hide()
						Input:Show("Breaching", "Unit Number (Owner State ID)", {
							{
								id = "unit",
								type = "number",
								options = {},
							},
						}, "Police:Client:DoApartmentBreach", data.id)
					end,
					shouldShow = function()
						return Apartment:GetNearApartment()
					end,
				},
			})
		end, function()
			if LocalPlayer.state.onDuty and LocalPlayer.state.onDuty == "police" then
				return Properties:GetNearHouse() or Apartment:GetNearApartment()
			else
				return nil
			end
		end)

		Interaction:RegisterMenu("pd-breach-robbery", "Breach House Robbery", "bomb", function(data)
			local bruh = GlobalState["Robbery:InProgress"]
			for k, v in ipairs(bruh) do
				local fuck = GlobalState[string.format("Robbery:InProgress:%s", v)]
				if fuck then
					local dist = #(vector3(LocalPlayer.state.myPos.x, LocalPlayer.state.myPos.y, LocalPlayer.state.myPos.z) - vector3(fuck.x, fuck.y, fuck.z))
					if dist <= 3.0 then
						Callbacks:ServerCallback("Police:Breach", {
							type = "robbery",
							property = v,
						})

						return
					end
				end
			end
			Interaction:Hide()
		end, function()
			if LocalPlayer.state.onDuty and LocalPlayer.state.onDuty == "police" then
				local bruh = GlobalState["Robbery:InProgress"]
				for k, v in ipairs(bruh) do
					local fuck = GlobalState[string.format("Robbery:InProgress:%s", v)]
					if fuck then
						local dist = #(vector3(LocalPlayer.state.myPos.x, LocalPlayer.state.myPos.y, LocalPlayer.state.myPos.z) - vector3(fuck.x, fuck.y, fuck.z))
						return dist <= 3.0
					end
				end
			end
			return false
		end)

		Callbacks:RegisterClientCallback("Police:Breach", function(data, cb)
			Progress:Progress({
				name = "breach_action",
				duration = 3000,
				label = "Breaching",
				useWhileDead = false,
				canCancel = true,
				disarm = false,
				controlDisables = {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				},
				animation = {
					animDict = "missprologuemcs_1",
					anim = "kick_down_player_zero",
					flags = 49,
				},
			}, function(cancelled)
				cb(not cancelled)
				if not cancelled then
					--Sounds.Play:Location(LocalPlayer.state.myPos, 20, "breach.ogg", 0.15)
				end
			end)
		end)

		local _cuffCd = false
		Keybinds:Add("pd_cuff", "LBRACKET", "keyboard", "Police - Cuff", function()
			if LocalPlayer.state.Character ~= nil and LocalPlayer.state.onDuty == "police" then
				if not _cuffCd then
					TriggerServerEvent("Police:Server:Cuff")
					_cuffCd = true
					Citizen.SetTimeout(3000, function()
						_cuffCd = false
					end)
				end
			end
		end)

		Keybinds:Add("pd_uncuff", "RBRACKET", "keyboard", "Police - Uncuff", function()
			if LocalPlayer.state.Character ~= nil and LocalPlayer.state.onDuty == "police" then
				if not _cuffCd then
					TriggerServerEvent("Police:Server:Uncuff")
					_cuffCd = true
					Citizen.SetTimeout(3000, function()
						_cuffCd = false
					end)
				end
			end
		end)

		-- Keybinds:Add("pd_toggle_cuff", "", "keyboard", "Police - Cuff / Uncuff", function()
		-- 	if LocalPlayer.state.Character ~= nil and LocalPlayer.state.onDuty == "police" then
		-- 		if not _cuffCd then
		-- 			TriggerServerEvent("Police:Server:ToggleCuff")
		-- 			_cuffCd = true
		-- 			Citizen.CreateThread(function()
		-- 				Citizen.Wait(2000)
		-- 				_cuffCd = false
		-- 			end)
		-- 		end
		-- 	end
		-- end)

		Keybinds:Add("tackle", "", "keyboard", "Tackle", function()
			if LocalPlayer.state.Character ~= nil then
				if
					not LocalPlayer.state.isCuffed
					and not LocalPlayer.state.tpLocation
					and not IsPedInAnyVehicle(LocalPlayer.state.ped)
					and not LocalPlayer.state.playingCasino
				then
					if GetEntitySpeed(LocalPlayer.state.ped) > 2.0 then
						local cPlayer, dist = Game.Players:GetClosestPlayer()
						local tarPlayer = GetPlayerServerId(cPlayer)
						if tarPlayer ~= 0 and dist <= 2.0 and GetGameTimer() - lastTackle > 7000 then
							lastTackle = GetGameTimer()
							TriggerServerEvent("Police:Server:Tackle", tarPlayer)

							loadAnimDict("swimming@first_person@diving")

							if
								IsEntityPlayingAnim(
									LocalPlayer.state.ped,
									"swimming@first_person@diving",
									"dive_run_fwd_-45_loop",
									3
								)
							then
								ClearPedSecondaryTask(LocalPlayer.state.ped)
							else
								-- TaskPlayAnim(
								-- 	LocalPlayer.state.ped,
								-- 	"swimming@first_person@diving",
								-- 	"dive_run_fwd_-45_loop",
								-- 	8.0,
								-- 	-8,
								-- 	-1,
								-- 	49,
								-- 	0,
								-- 	0,
								-- 	0,
								-- 	0
								-- )
								-- Citizen.Wait(350)
								StupidRagdoll(true)
								-- ClearPedSecondaryTask(LocalPlayer.state.ped)
								-- SetPedToRagdoll(LocalPlayer.state.ped, 500, 500, 0, 0, 0, 0)
							end
						else
							--StupidRagdoll(true)
						end
					else
						--StupidRagdoll(false)
					end
				end
			end
		end)

		Targeting.Zones:AddBox("pd-clockinoff-fuckingmrpd", "siren-on", vector3(450.41, -983.93, 30.69), 0.8, 0.8, {
			heading = 355,
			minZ = 28.49,
			maxZ = 32.49
		}, policeDutyPoint, 2.0, true)

		Targeting.Zones:AddBox("pd-clockinoff-vpd", "siren-on", vector3(621.34, 7.9, 83.62), 1, 1, {
			heading = 340,
			minZ = 83.62,
			maxZ = 84.02
		}, policeDutyPoint, 2.0, true)

		Targeting.Zones:AddBox("pd-clockinoff-rangers", "siren-on", vector3(385.76, 795.04, 187.46), 0.4, 0.4, {
			heading = 340,
			minZ = 187.46,
			maxZ = 187.66
		}, policeDutyPoint, 2.0, true)

		Targeting.Zones:AddBox("pd-clockinoff-sandy", "siren-on", vector3(1833.55, 3678.69, 34.19), 1.0, 3.0, {
			heading = 30,
			--debugPoly=true,
			minZ = 33.79,
			maxZ = 35.59
		}, policeDutyPoint, 2.0, true)

		Targeting.Zones:AddBox("pd-clockinoff-pbpd", "siren-on", vector3(-447.18, 6013.36, 32.29), 0.8, 1.6, {
			heading = 45,
			minZ = 32.29,
			maxZ = 32.89,
		}, policeDutyPoint, 2.0, true)

		Targeting.Zones:AddBox("pd-clockinoff-davis", "siren-on", vector3(369.302, -1607.452, 29.293), 2.0, 3.0, {
			heading = 53.516,
			minZ = 25,
			maxZ = 31,
		}, policeDutyPoint, 2.0, true)

		Targeting.Zones:AddBox("pd-clockinoff-lamesa", "siren-on", vector3(837.23, -1289.2, 28.24), 0.8, 2.2, {
			heading = 0,
			--debugPoly=true,
			minZ = 27.24,
			maxZ = 29.04,
		}, policeDutyPoint, 2.0, true)

		Targeting.Zones:AddBox("pd-clockinoff-courthouse", "siren-on", vector3(318.34, -1638.93, 32.54), 1.8, 1.6, {
			heading = 50,
			--debugPoly=true,
			minZ = 32.34,
			maxZ = 33.34
		}, policeDutyPoint, 2.0, true)

		for k, v in ipairs(_pdStationPolys) do
			--print(v.options.name)
			Polyzone.Create:Poly(v.options.name, v.points, v.options, v.data)
		end

		Callbacks:RegisterClientCallback("Police:DeploySpikes", function(data, cb)
			Progress:ProgressWithStartEvent({
				name = "spikestrips",
				duration = 1000,
				label = "Laying Spikes",
				useWhileDead = false,
				canCancel = true,
				controlDisables = {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				},
				animation = {
					animDict = "weapons@first_person@aim_rng@generic@projectile@thermal_charge@",
					anim = "plant_floor",
				},
				disarm = true,
			}, function()
				Weapons:UnequipIfEquippedNoAnim()
			end, function(status)
				if not status then
					local h = GetEntityHeading(PlayerPedId())
					local positions = {}
					for i = 1, 3 do
						table.insert(
							positions,
							GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, -1.5 + (3.5 * i), 0.15)
						)
					end
					cb({
						positions = positions,
						h = h,
					})
				else
					cb(nil)
				end
			end)
		end)

		Targeting.Zones:AddBox("prison-clockinoff", "clipboard", vector3(1838.94, 2578.14, 46.01), 2.0, 0.8, {
			heading = 305,
			--debugPoly=true,
			minZ = 45.81,
			maxZ = 46.61,
		}, {
			{
				icon = "clipboard-check",
				text = "Go On Duty",
				event = "Corrections:Client:OnDuty",
				jobPerms = {
					{
						job = "prison",
						reqOffDuty = true,
					},
				},
			},
			{
				icon = "clipboard",
				text = "Go Off Duty",
				event = "Corrections:Client:OffDuty",
				jobPerms = {
					{
						job = "prison",
						reqDuty = true,
					},
				},
			},
			{
				icon = "clipboard-check",
				text = "Go On Duty (Medical)",
				event = "EMS:Client:OnDuty",
				jobPerms = {
					{
						job = "ems",
						workplace = "prison",
						reqOffDuty = true,
					},
				},
			},
			{
				icon = "clipboard",
				text = "Go Off Duty (Medical)",
				event = "EMS:Client:OffDuty",
				jobPerms = {
					{
						job = "ems",
						workplace = "prison",
						reqDuty = true,
					},
				},
			},
		}, 2.0, true)

		local locker = {
			{
				icon = "user-lock",
				text = "Open Personal Locker",
				event = "Police:Client:OpenLocker",
				jobPerms = {
					{
						job = "police",
						reqDuty = false,
					},
				},
			},
		}

		Targeting.Zones:AddBox("police-shitty-locker-mrpd-women", "siren-on", vector3(474.94, -990.35, 30.69), 1.1, 6.3, {
			heading = 0,
			--debugPoly=true,
			minZ = 28.89,
			maxZ = 32.89
		}, locker, 3.0, true)

		Targeting.Zones:AddBox("police-shitty-locker-mrpd-men", "siren-on", vector3(480.74, -1006.71, 30.69), 6.2, 0.8, {
			heading = 267,
			--debugPoly=true,
			minZ = 28.29,
			maxZ = 32.29
		}, locker, 3.0, true)

		Targeting.Zones:AddBox("police-shitty-locker", "siren-on", vector3(607.94, 9.2, 87.8), 0.4, 4.2, {
			heading = 340,
			--debugPoly=true,
			minZ = 87.4,
			maxZ = 89.2
		}, locker, 3.0, true)

		Targeting.Zones:AddBox("police-shitty-locker-2", "siren-on", vector3(1841.51, 3682.08, 34.19), 2.0, 1, {
			heading = 30,
			--debugPoly=true,
			minZ = 33.19,
			maxZ = 35.59
		}, locker, 3.0, true)

		Targeting.Zones:AddBox("police-shitty-locker-3", "siren-on", vector3(-436.32, 6009.79, 37.0), 0.2, 2.2, {
			heading = 45,
			--debugPoly=true,
			minZ = 36.3,
			maxZ = 38.1,
		}, locker, 3.0, true)

		Targeting.Zones:AddBox("police-shitty-locker-4", "siren-on", vector3(360.08, -1592.9, 25.45), 0.5, 2.8, {
			heading = 50,
			--debugPoly=true,
			minZ = 24.45,
			maxZ = 27.45,
		}, locker, 3.0, true)

		Targeting.Zones:AddBox("police-shitty-locker-5", "siren-on", vector3(844.8, -1286.55, 28.24), 2.0, 1.2, {
			heading = 0,
			--debugPoly=true,
			minZ = 27.24,
			maxZ = 29.84,
		}, locker, 3.0, true)

		Targeting.Zones:AddBox("ems-shitty-locker-2", "siren-on", vector3(-439.04, -309.88, 34.91), 0.8, 0.8, {
			heading = 20,
			--debugPoly=true,
			minZ = 33.71,
			maxZ = 36.11,
		}, {
			{
				icon = "user-lock",
				text = "Open Personal Locker",
				event = "Police:Client:OpenLocker",
				jobPerms = {
					{
						job = "ems",
						reqDuty = false,
					},
				},
			},
		}, 3.0, true)
	end)
end)

AddEventHandler("Police:Client:DoApartmentBreach", function(values, data)
	Callbacks:ServerCallback("Police:Breach", {
		type = "apartment",
		property = tonumber(values.unit),
		id = data,
	}, function(s)
		if s then
			
		end
	end)
end)

AddEventHandler("Proxy:Shared:RegisterReady", function()
	exports["evo-base"]:RegisterComponent("Police", POLICE)
end)

RegisterNetEvent("Characters:Client:Spawn", function()
	for k, v in ipairs(policeStationBlips) do
		Blips:Add("police_station_" .. k, "Police Department", v, 137, 38, 0.6)
	end
end)

RegisterNetEvent("Police:Client:Breached", function(type, id)
	_breached[type] = _breached[type] or {}
	_breached[type][id] = GlobalState["OS:Time"] + (60 * 5)
end)

RegisterNetEvent("Police:Client:GetTackled", function(s)
	if LocalPlayer.state.loggedIn then
		SetPedToRagdoll(LocalPlayer.state.ped, math.random(3000, 5000), math.random(3000, 5000), 0, 0, 0, 0)
		lastTackle = GetGameTimer()
	end
end)

POLICE = {
	IsPdCar = function(self, entity)
		return _pdModels[GetEntityModel(entity)]
	end,
	IsEMSCar = function(self, entity)
		return _emsModels[GetEntityModel(entity)]
	end
}

function StupidRagdoll(tackleAnim)
	local time = 3500
	if tackleAnim then
		TaskPlayAnim(
			LocalPlayer.state.ped,
			"swimming@first_person@diving",
			"dive_run_fwd_-45_loop",
			8.0,
			-8,
			-1,
			49,
			0,
			0,
			0,
			0
		)
		-- time = 1000
	end
	Citizen.Wait(350)
	ClearPedSecondaryTask(LocalPlayer.state.ped)
	SetPedToRagdoll(LocalPlayer.state.ped, time, time, 0, 0, 0, 0)
end