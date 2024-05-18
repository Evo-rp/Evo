VEHICLE_INSIDE = nil
LOCAL_CACHED_EVIDENCE = {}

_ammoNames = {
	AMMO_STUNGUN = "Stungun Ammo",
	AMMO_PISTOL = "Pistol Ammo",
	AMMO_SMG = "SMG Ammo",
	AMMO_RIFLE = "Rifle Ammo",
	AMMO_SHOTGUN = "Shotgun Ammo",
	AMMO_SNIPER = "Sniper Ammo",
	AMMO_FLARE = "Flare Ammo",
	AMMO_MG = "Machine Gun Ammo",
}

AddEventHandler("Evidence:Shared:DependencyUpdate", RetrieveComponents)
function RetrieveComponents()
	Logger = exports["evo-base"]:FetchComponent("Logger")
	Fetch = exports["evo-base"]:FetchComponent("Fetch")
	Callbacks = exports["evo-base"]:FetchComponent("Callbacks")
	Game = exports["evo-base"]:FetchComponent("Game")
	Targeting = exports["evo-base"]:FetchComponent("Targeting")
	Utils = exports["evo-base"]:FetchComponent("Utils")
	Animations = exports["evo-base"]:FetchComponent("Animations")
	Notification = exports["evo-base"]:FetchComponent("Notification")
	Polyzone = exports["evo-base"]:FetchComponent("Polyzone")
	Jobs = exports["evo-base"]:FetchComponent("Jobs")
	Weapons = exports["evo-base"]:FetchComponent("Weapons")
	Progress = exports["evo-base"]:FetchComponent("Progress")
	Vehicles = exports["evo-base"]:FetchComponent("Vehicles")
	Targeting = exports["evo-base"]:FetchComponent("Targeting")
	ListMenu = exports["evo-base"]:FetchComponent("ListMenu")
	Action = exports["evo-base"]:FetchComponent("Action")
	Sounds = exports["evo-base"]:FetchComponent("Sounds")
end

AddEventHandler("Core:Shared:Ready", function()
	exports["evo-base"]:RequestDependencies("Evidence", {
		"Logger",
		"Fetch",
		"Callbacks",
		"Game",
		"Menu",
		"Targeting",
		"Notification",
		"Utils",
		"Animations",
		"Polyzone",
		"Jobs",
		"Weapons",
		"Progress",
		"Vehicles",
		"Targeting",
		"ListMenu",
		"Action",
		"Sounds",
	}, function(error)
		if #error > 0 then
			return
		end
		RetrieveComponents()

		Polyzone.Create:Box("evidence_ballistics_mrpd", vector3(604.24, 5.47, 75.04), 0.7, 3.2, {
			heading = 340,
			minZ = 74.04,
			maxZ = 78.04
		}, {
			ballistics = true,
		})

		Polyzone.Create:Box("evidence_dna_mrpd", vector3(605.44, 7.2, 75.04), 2.3, 1.4, {
			heading = 250,
			minZ = 73.84,
			maxZ = 77.84
		}, {
			dna = true,
		})

		Polyzone.Create:Box("evidence_ballistics_dpd", vector3(369.46, -1590.37, 25.45), 1.2, 1.6, {
			heading = 359,
			minZ = 24.45,
			maxZ = 27.25,
		}, {
			ballistics = true,
		})

		Polyzone.Create:Box("evidence_dna_dpd", vector3(367.9, -1592.18, 25.45), 1.2, 1.6, {
			heading = 0,
			minZ = 24.45,
			maxZ = 27.25,
		}, {
			dna = true,
		})

		Polyzone.Create:Box("evidence_ballistics_lmpd", vector3(849.52, -1311.05, 28.24), 1.8, 2, {
			heading = 0,
			--debugPoly=true,
			minZ = 27.24,
			maxZ = 29.84,
		}, {
			ballistics = true,
		})

		Polyzone.Create:Box("evidence_dna_lmpd", vector3(853.45, -1292.58, 28.24), 1.8, 1, {
			heading = 0,
			--debugPoly=true,
			minZ = 27.24,
			maxZ = 29.64,
		}, {
			dna = true,
		})

		Polyzone.Create:Box("evidence_dna_mt_zona_1", vector3(-444.11, -296.49, 34.91), 3.6, 1.6, {
			heading = 290,
			--debugPoly=true,
			minZ = 33.91,
			maxZ = 36.11,
		}, {
			dna = true,
		})

		Polyzone.Create:Box("evidence_dna_mt_zona_2", vector3(-442.69, -299.56, 34.91), 3.6, 1.6, {
			heading = 290,
			--debugPoly=true,
			minZ = 33.91,
			maxZ = 36.11,
		}, {
			dna = true,
		})
	end)
end)

AddEventHandler("Vehicles:Client:EnterVehicle", function(veh)
	VEHICLE_INSIDE = veh
end)

AddEventHandler("Vehicles:Client:ExitVehicle", function()
	VEHICLE_INSIDE = nil
end)

local pendingEvidenceUpdate = false

function UpdateCachedEvidence()
	if not pendingEvidenceUpdate then
		pendingEvidenceUpdate = true
		Citizen.SetTimeout(5000, function()
			pendingEvidenceUpdate = false
			SendCachedEvidence()
		end)
	end
end

function SendCachedEvidence()
	TriggerServerEvent("Evidence:Server:RecieveEvidence", LOCAL_CACHED_EVIDENCE)
	LOCAL_CACHED_EVIDENCE = {}
end
