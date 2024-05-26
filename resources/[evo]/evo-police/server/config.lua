Config = {
	Drugs = {
		weed = "Marijuana",
		oxy = "OxyContin",
	},
	CuffItems = {
		{ item = "pdhandcuffs", count = 1 },
		{ item = "handcuffs", count = 1 },
		{ item = "fluffyhandcuffs", count = 1 },
	},
	Armories = {
		{
			id = "mrpd-armory",
			name = "MRPD Armory",
			type = "box",
			coords = vector3(460.31, -999.0, 30.69),
			length = 2.6,
			width = 1,
			options = {
				heading = 0,
				--debugPoly = true,
				minZ = 28.89,
				maxZ = 32.89
			},
			data = {
				inventory = {
					invType = 27,
					owner = "mrpd-armory",
				},
			},
		},
		{
			id = "vpd-armory",
			name = "VPD Armory",
			type = "box",
			coords = vector3(603.76, 6.14, 87.8),
			length = 4.6,
			width = 1,
			options = {
				heading = 340,
				--debugPoly = true,
				minZ = 86.8,
				maxZ = 89.6
			},
			data = {
				inventory = {
					invType = 27,
					owner = "mrpd-armory",
				},
			},
		},
		{
			id = "rangers-armory",
			name = "Ranger Station Armory",
			type = "box",
			coords = vector3(387.35, 800.16, 187.46),
			length = 1.2,
			width = 2.4,
			options = {
				heading = 0,
				--debugPoly = true,
				minZ = 186.46,
				maxZ = 188.66
			},
			data = {
				inventory = {
					invType = 27,
					owner = "mrpd-armory",
				},
			},
		},
		{
			id = "sspd-armory",
			name = "Sandy PD Armory",
			type = "box",
			coords = vector3(1837.28, 3686.0, 34.19),
			length = 2.2,
			width = 4.0,
			options = {
				heading = 300,
				--debugPoly=true,
				minZ = 33.19,
				maxZ = 35.99,
			},
			data = {
				inventory = {
					invType = 27,
					owner = "sspd-armory",
				},
			},
		},
		{
			id = "pbpd-armory",
			name = "Paleto PD Armory",
			type = "box",
			coords = vector3(-447.36, 6016.42, 37.0),
			length = 2.4,
			width = 7.6,
			options = {
				heading = 45,
				--debugPoly=true,
				minZ = 35.4,
				maxZ = 38.6,
			},
			data = {
				inventory = {
					invType = 27,
					owner = "pbpd-armory",
				},
			},
		},
		{
			id = "dpd-armory",
			name = "Davis PD Armory",
			type = "box",
			coords = vector3(362.63, -1602.34, 25.45),
			length = 3.6,
			width = 5.6,
			options = {
				heading = 320,
				--debugPoly=true,
				minZ = 24.05,
				maxZ = 27.65,
			},
			data = {
				inventory = {
					invType = 27,
					owner = "dpd-armory",
				},
			},
		},
		{
			id = "lamesa-armory",
			name = "La Mesa PD Armory",
			type = "box",
			coords = vector3(836.31, -1286.94, 28.24),
			length = 3.6,
			width = 1.2,
			options = {
				heading = 0,
				--debugPoly=true,
				minZ = 27.24,
				maxZ = 29.84,
			},
			data = {
				inventory = {
					invType = 27,
					owner = "lamesa-armory",
				},
			},
		},
		{
			id = "prison-armory",
			name = "Prison Armory",
			type = "box",
			coords = vector3(1835.3, 2570.78, 46.01),
			length = 2.0,
			width = 1.2,
			options = {
				heading = 270,
				--debugPoly=true,
				minZ = 44.81,
				maxZ = 47.21,
			},
			data = {
				inventory = {
					invType = 37,
					owner = "prison-armory",
				},
			},
		},
	},
	PoliceCars = {
		[`march1rb`] = true,
		[`pd1`] = true,
		[`char`] = true,
		[`poldemonrb`] = true,
		[`zr1RB`] = true,
		[`Explorer`] = true,
		[`as350`] = true,
		[`socharger`] = true,
		[`sodurango`] = true,
		[`soexplorer`] = true,
		[`sotaurus`] = true,
		[`sotruck`] = true,
	
	},
	EMSCars = {
		[`emsambulance`] = true,
		[`emstahoe21`] = true,
	}
}
