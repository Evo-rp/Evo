local govDutyPoints = {
	{
		center = vector3(-587.98, -206.59, 37.23),
		length = 0.8,
		width = 0.8,
		options = {
			heading = 30,
			--debugPoly=true,
			minZ = 37.23,
			maxZ = 38.83,
		},
	},
}

AddEventHandler("Police:Shared:DependencyUpdate", GovComponents)
function GovComponents()
	Callbacks = exports["evo-base"]:FetchComponent("Callbacks")
	Inventory = exports["evo-base"]:FetchComponent("Inventory")
	Notification = exports["evo-base"]:FetchComponent("Notification")
	Blips = exports["evo-base"]:FetchComponent("Blips")
	Targeting = exports["evo-base"]:FetchComponent("Targeting")
	Jobs = exports["evo-base"]:FetchComponent("Jobs")
	PedInteraction = exports["evo-base"]:FetchComponent("PedInteraction")
	ListMenu = exports["evo-base"]:FetchComponent("ListMenu")
	Polyzone = exports["evo-base"]:FetchComponent("Polyzone")
end

AddEventHandler("Core:Shared:Ready", function()
	exports["evo-base"]:RequestDependencies("Police", {
		"Callbacks",
		"Inventory",
		"Notification",
		"Blips",
		"Targeting",
		"Jobs",
		"PedInteraction",
		"ListMenu",
		"Polyzone",
	}, function(error)
		if #error > 0 then
			return
		end
		GovComponents()

		local govServices = {
			{
				icon = "id-card",
				text = "Purchase ID ($500)",
				event = "Government:Client:BuyID",
			},
			{
				icon = "file-certificate",
				text = "License Services",
				event = "Government:Client:BuyLicense",
			},
			{
				icon = "gavel",
				text = "Public Records",
				event = "Government:Client:AccessPublicRecords",
			},
			{
				icon = "clipboard-check",
				text = "Go On Duty",
				event = "Government:Client:OnDuty",
				jobPerms = {
					{
						job = "government",
						reqOffDuty = true,
					},
				},
			},
			{
				icon = "clipboard",
				text = "Go Off Duty",
				event = "Government:Client:OffDuty",
				jobPerms = {
					{
						job = "government",
						reqDuty = true,
					},
				},
			},
			{
				icon = "shop-lock",
				text = "DOJ Shop",
				event = "Government:Client:DOJShop",
				jobPerms = {
					{
						job = "government",
						workplace = "doj",
						reqDuty = true,
					},
				},
			},
		}

		

		PedInteraction:Add(
			"govt-services",
			`a_f_m_eastsa_02`,
			vector3(321.418, -1640.354, 31.535),
			318.282,
			25.0,
			govServices,
			"bell-concierge"
		)
		-- Targeting.Zones:AddBox("govt-services", "bell-concierge", vector3(-555.92, -186.01, 38.22), 2.0, 2.0, {
		--     heading = 28,
		--     --debugPoly=true,
		--     minZ = 37.22,
		--     maxZ = 39.62
		-- }, govServices, 3.0, true)

		for k, v in ipairs(govDutyPoints) do
			Targeting.Zones:AddBox("gov-info-" .. k, "gavel", v.center, v.length, v.width, v.options, {
				{
					icon = "clipboard-check",
					text = "Go On Duty",
					event = "Government:Client:OnDuty",
					jobPerms = {
						{
							job = "government",
							reqOffDuty = true,
						},
					},
				},
				{
					icon = "clipboard",
					text = "Go Off Duty",
					event = "Government:Client:OffDuty",
					jobPerms = {
						{
							job = "government",
							reqDuty = true,
						},
					},
				},
				{
					icon = "gavel",
					text = "Public Records",
					event = "Government:Client:AccessPublicRecords",
				},
			}, 3.0, true)
		end

		Polyzone.Create:Box("courtroom", vector3(341.5, -1642.1, 38.5), 10.0, 16.2, {
			heading = 50,
			minZ = 37.7,
			maxZ = 43.9
		}, {})

		Targeting.Zones:AddBox("gavel_courthouse", "gavel", vector3(345.87, -1637.35, 38.93), 0.2, 0.4, {
			heading = 310,
			minZ = 38.73,
			maxZ = 38.93
		}, {
			{
				icon = "gavel",
				text = "Use Gavel",
				event = "Government:Client:UseGavel",
			},
		}, 2.0, true)
	end)
end)

RegisterNetEvent("Characters:Client:Spawn", function()
	Blips:Add("courthouse", "Courthouse", vector3(325.786, -1631.416, 32.535), 419, 0, 0.9)
end)

AddEventHandler("Government:Client:UseGavel", function()
	TriggerServerEvent("Government:Server:Gavel")
end)

RegisterNetEvent("Government:Client:Gavel", function()
	if not LocalPlayer.state.loggedIn then
		return
	end
	local coords = GetEntityCoords(LocalPlayer.state.ped)
	if Polyzone:IsCoordsInZone(coords, "courtroom") then
		Sounds.Play:One("gavel.ogg", 0.6)
	end
end)

AddEventHandler("Government:Client:DOJShop", function()
	Inventory.Shop:Open("doj-shop")
end)
