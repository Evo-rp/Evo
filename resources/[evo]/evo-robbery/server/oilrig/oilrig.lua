_OILRIG_ROBBED = false
OilRig = {
    Loot = {}
}
_OilRigLootTable = {
	["GUNS"] = {
		{
			29,
			{
				name = "WEAPON_HEAVYPISTOL",
				min = 1,
				max = 1,
				metadata = { ammo = 100, clip = 0 },
			},
		},
		{
			28,
			{
				name = "WEAPON_APPISTOL",
				min = 1,
				max = 1,
				metadata = { ammo = 100, clip = 0 },
			},
		},
	},
	["CLASS_2"] = {
		{
			20,
			{
				name = "WEAPON_PISTOL50",
				min = 1,
				max = 1,
				metadata = { ammo = 100, clip = 0 },
			},
		},
		{
			40,
			{
				name = "WEAPON_MACHINEPISTOL",
				min = 1,
				max = 1,
				metadata = { ammo = 100, clip = 0 },
			},
		},
		{
			100,
			{
				name = "WEAPON_ASSAULTRIFLE",
				min = 1,
				max = 1,
				metadata = { ammo = 100, clip = 0 },
			},
		},
	},
	["ATTACHMENTS"] = {
		{
			22,
			{
				name = "ATTCH_WEAPON_FLASHLIGHT",
				min = 1,
				max = 1,
			},
		},
        {
			19,
			{
				name = "AMMO_RIFLE",
				min = 3,
				max = 15,
			},
		},
		{
			19,
			{
				name = "AMMO_SMG",
				min = 3,
				max = 10,
			},
		},
		{
			19,
			{
				name = "AMMO_SHOTGUN",
				min = 3,
				max = 10,
			},
		},
		{
			10,
			{
				name = "ATTCH_AR_EXT_MAG",
				min = 1,
				max = 1,
			},
		},
		{
			10,
			{
				name = "ATTCH_ADV_AR_SILENCER",
				min = 1,
				max = 1,
			},
		},
	},
}

local _OILRIG_CONFIG = {
    Peds = {
        { -3560.502, -3832.587, 64.669 },
        { -3530.443, -3822.296, 64.669 },
        { -3550.945, -3824.707, 59.575 },
        { -3540.036, -3831.712, 54.289 },
        { -3562.757, -3837.158, 54.289 },
        { -3570.788, -3829.395, 54.289 },
        { -3570.788, -3829.395, 54.289 },
        { -3570.213, -3814.486, 54.485 },
        { -3571.953, -3804.730, 54.289 },
        { -3563.588, -3794.842, 54.289 },
        { -3548.459, -3794.609, 54.289 },
        { -3540.734, -3801.760, 54.289 },
        { -3540.734, -3801.760, 54.289 },
        { -3534.122, -3814.477, 54.289 },
        { -3534.241, -3825.958, 54.289 },
        { -3562.785, -3817.789, 57.935 },
        { -3564.886, -3804.117, 57.940 },
        { -3549.239, -3802.436, 57.940 },
        { -3528.239, -3783.418, 50.702 },
        { -3533.073, -3808.469, 43.911 },
        { -3533.337, -3824.237, 43.910 },
        { -3552.470, -3823.271, 43.911 },
        { -3568.740, -3832.776, 43.911 },
        { -3582.367, -3823.333, 44.101 },
        { -3559.781, -3799.218, 38.523 },
        { -3563.697, -3785.322, 33.531 },
        { -3581.942, -3787.467, 33.531 },
        { -3579.136, -3814.573, 33.531 },
        { -3569.890, -3821.284, 33.531 },
        { -3540.658, -3822.547, 33.531 },
        { -3534.541, -3803.239, 33.531 },
        { -3528.450, -3788.458, 30.218 },
        { -3532.808, -3798.105, 30.211 },
        { -3532.438, -3828.152, 30.211 },
        { -3553.709, -3833.310, 30.211 },
        { -3575.356, -3832.684, 30.210 },
        { -3580.923, -3790.979, 30.211 }
    },

    Weapons = {
        'WEAPON_ASSAULTSMG',
        'WEAPON_CARBINERIFLE_MK2',
        'WEAPON_HEAVYRIFLE',
        'WEAPON_COMBATMG_MK2',
        'WEAPON_MICROSMG',
    },

    LootLocations = {
        {
            Target = {
                Coords = vector3(-3548.14, -3805.96, 69.53),
                Width = 2.5,
                Length = 2.5,
                Heading = 0,
                MinZ = 68.53,
                MaxZ = 71.53
            },
            Coords = {
                x = -3548.0070800781,
                y = -3805.9245605469,
                z = 68.528816223145
            },
            data = {
                id = 1,
                type = "CLASS_2",
                amount = 2,
                bonus = 8,
            },
        },
        {
            Target = {
                Coords = vector3(-3530.75, -3828.36, 64.67),
                Width = 2.5,
                Length = 2.5,
                Heading = 0,
                MinZ = 63.67,
                MaxZ = 67.27
            },
            Coords = {
                x = -3530.9020996094,
                y = -3828.3522949219,
                z = 63.668876647949
            },
            data = {
                id = 2,
                type = "GUNS",
                amount = 2,
                bonus = 8,
            },
        },
        {
            Target = {
                Coords = vector3(-3559.91, -3832.95, 64.67),
                Width = 2.5,
                Length = 2.5,
                Heading = 0,
                MinZ = 63.67,
                MaxZ = 66.67
            },
            Coords = {
                x = -3559.9650878906,
                y = -3832.8845214844,
                z = 63.664947509766
            },
            data = {
                id = 3,
                type = "ATTACHMENTS",
                amount = 2,
                bonus = 8,
            },
        }
    }
}

AddEventHandler("Robbery:Server:Setup", function()

    Callbacks:RegisterServerCallback('Robbery:OilRig:RetrieveConfig', function(source, data, cb)
        cb(_OILRIG_CONFIG)    
    end)
    
	Callbacks:RegisterServerCallback('Robbery:OilRig:ShouldSpawnPeds', function(source, data, cb)
		cb(_OILRIG_ROBBED)
	end)

    Callbacks:RegisterServerCallback("Robbery:OilRig:CheckLoot", function(source, data, cb)
		local pState = Player(source).state

        if
            pState.inOilRig
            and (not GlobalState["AntiShitlord"] or os.time() > GlobalState["AntiShitlord"])
            and not GlobalState[string.format("OilRig:Loot:%s", data.id)]
            and _OILRIG_CONFIG.LootLocations[data.id] ~= nil
        then
			if not OilRig.Loot[data.id] then
				GlobalState[string.format("OilRig:Loot:%s", data.id)] = true
				OilRig.Loot[data.id] = source
				cb(true)
			else
				cb(false)
			end
		else
			cb(false)
		end
	end)

    Callbacks:RegisterServerCallback("Robbery:OilRig:Loot", function(source, data, cb)
		local pState = Player(source).state

        if
            pState.inOilRig
            and (not GlobalState["AntiShitlord"] or os.time() > GlobalState["AntiShitlord"])
            and _OILRIG_CONFIG.LootLocations[data.id] ~= nil
        then
			if OilRig.Loot[data.id] == source then
				local actualData = _OILRIG_CONFIG.LootLocations[data.id]
				if actualData.data.type == data.type then
					local plyr = Fetch:Source(source)
					if plyr ~= nil then
						local char = plyr:GetData("Character")
						if char ~= nil then
							Logger:Info("Robbery", string.format("%s %s (%s) Looted Oilrig Loot Crate #%s", char:GetData("First"), char:GetData("Last"), char:GetData("SID"), data.id))

							for i = 1, actualData.data.amount do
								Loot:CustomWeightedSetWithCount(_OilRigLootTable[data.type], char:GetData("SID"), 1)
							end
							if math.random(100) <= actualData.data.bonus then
								Loot:CustomWeightedSetWithCount(_OilRigLootTable[data.type], char:GetData("SID"), 1)
							end

							if _eventLoot and data.id == 1 then
								for k, v in ipairs(_eventLootItems) do
									Inventory:AddItem(char:GetData("SID"), v, 1, {}, 1)
								end
								_eventLoot = false
							end

							TriggerClientEvent("Weapons:Client:Attach", source)

							OilRig.Loot[data.id] = false
						else
							OilRig.Loot[data.id] = false
							cb(false)
						end
					else
						GlobalState[string.format("OilRig:Loot:%s", data.id)] = true
						OilRig.Loot[data.id] = false
						cb(false)
					end
				else
					GlobalState[string.format("_OilRigLootTable:Loot:%s", data.id)] = true
					OilRig.Loot[data.id] = false
					cb(false)
				end
			end
		else
			cb(false)
		end
	end)

    Callbacks:RegisterServerCallback("Robbery:OilRig:CancelLoot", function(source, data, cb)
		local pState = Player(source).state

		if
			pState.inOilRig
			and not GlobalState["AntiShitlord"] or os.time() > GlobalState["AntiShitlord"]
			and _OILRIG_CONFIG.LootLocations[data.id] ~= nil
		then
			if OilRig.Loot[data.id] == source then
				GlobalState[string.format("OilRig:Loot:%s", data.id)] = false
				OilRig.Loot[data.id] = false
				cb(true)
			else
				cb(false)
			end
		else
			cb(false)
		end
	end)

end)