 --- ### pinkcage
  --- ### pinkcage

--  _aptData = {
-- 	{
-- 		name = "Boring Tower",
-- 		invEntity = 13,
-- 		coords = vector3(-481.83, -690.74, 33.21), --enter and exit: move loaction 
-- 		heading = 96.566,
-- 		length = 8.4,
-- 		width = 4.0,
-- 		options = {
-- 			heading = 0,
-- 			--debugPoly=true,
-- 			minZ = 32.21,
-- 			maxZ = 36.21
-- 		},
-- 		interior = {
-- 			wakeup = {
-- 				x = 351.1,
-- 				y = -201.598,
-- 				z = 53.1,
-- 				h = 68.261,
-- 			},
-- 			spawn = {
-- 				x = 347.826,
-- 				y = -200.121,
-- 				z = 54.239,
-- 				h = 243.706
-- 			},
-- 			locations = {
-- 				exit = {
-- 					coords = vector3(347.41, -199.9, 54.24),
-- 					length = 0.4,
-- 					width = 1.2,
-- 					options = {
-- 						heading = 69,
-- 						--debugPoly=true,
-- 						minZ = 53.24,
-- 						maxZ = 55.64
-- 					},
-- 				},
-- 				wardrobe = {
-- 					coords = vector3(351.89, -205.34, 54.23),
-- 					length = 0.4,
-- 					width = 2.0,
-- 					options = {
-- 						heading = 339,
-- 						--debugPoly=true,
-- 						minZ = 53.23,
-- 						maxZ = 56.23
-- 					},
-- 				},
-- 				stash = {
-- 					coords = vector3(348.69, -208.74, 54.23),
-- 					length = 2.4,
-- 					width = 1.0,
-- 					options = {
-- 						heading = 339,
-- 						--debugPoly=true,
-- 						minZ = 53.23,
-- 						maxZ = 54.63
-- 					},
-- 				},
-- 				logout = {
-- 					coords = vector3(346.02, -207.23, 54.23),
-- 					length = 2.0,
-- 					width = 2.8,
-- 					options = {
-- 						heading = 338,
-- 						--debugPoly=true,
-- 						minZ = 51.83,
-- 						maxZ = 54.03
-- 					},
-- 				},
-- 			},
-- 		},
-- 	},
-- }

-- function Startup()
-- 	local aptIds = {}

-- 	for k, v in ipairs(_aptData) do
-- 		v.id = k
-- 		GlobalState[string.format("Apartment:%s", k)] = v
-- 		table.insert(aptIds, k)
-- 	end

-- 	GlobalState["Apartments"] = aptIds
-- end
 --- ### pinkcage


 _aptData = {
	{
		name = "Alta Street",
		invEntity = 13,
		coords = vector3(-271.25, -958.0, 31.22),
		heading = 153.319,
		length = 2.2,
		width = 1.4,
		options = {
			heading = 30,
			debugPoly=false,
			minZ = 30.22,
			maxZ = 32.82
		},
		interior = {
			wakeup = {
				x = 285.433,
				y = -928.362,
				z = -23.954,
				h = 268.463,
			},
			spawn = {
				x = 291.069,
				y = -924.995,
				z = -22.995,
				h = 174.465,
			},
			locations = {
				exit = {
					coords = vector3(291.04, -924.59, -23.0),
					length = 1.0,
					width = 1.6,
					options = {
						heading = 0,
						--debugPoly=true,
						minZ = -24.0,
						maxZ = -21.4
					},
				},
				wardrobe = {
					coords = vector3(287.15, -922.39, -23.0),
					length = 1.0,
					width = 2.0,
					options = {
						heading = 270,
						--debugPoly=true,
						minZ = -24.0,
						maxZ = -21.6
					},
				},
				stash = {
					coords = vector3(288.89, -924.91, -23.0),
					length = 0.8,
					width = 2.4,
					options = {
						heading = 0,
						--debugPoly=true,
						minZ = -24.0,
						maxZ = -22.0
					},
				},
				logout = {
					coords = vector3(284.92, -928.52, -23.0),
					length = 2.6,
					width = 2.2,
					options = {
						heading = 0,
						--debugPoly=true,
						minZ = -24.0,
						maxZ = -22.8
					},
				},
			},
		},
	},
}

function Startup()
	local aptIds = {}

	for k, v in ipairs(_aptData) do
		v.id = k
		GlobalState[string.format("Apartment:%s", k)] = v
		table.insert(aptIds, k)
	end

	GlobalState["Apartments"] = aptIds
end
