_performanceUpgrades = {
	engine = 11,
	transmission = 13,
	brakes = 12,
	suspension = 15,
	turbo = 18,
}

--[[

Performance Parts

-1 is Stock
0 is Level 1
1 is Level 2
... You get the point

THE LOWEST LEVEL IS DEFAULT SO PUT THE STUFF BACK TO NORMAL

handling

Array of objects containing the changes
fieldType - Float, Vector, Int
multiplier - if true is a multiplier of the current value


]]

_pursuitModeConfig = {
	-- [`example`] = {
	--     {
	--         name = 'A',
	--         performance = {
	--             engine = -1,
	--             transmission = -1,
	--             brakes = -1,
	--             suspension = -1,
	--             turbo = false,
	--         },
	--         handling = false, -- Reset
	--     },
	--     {
	--         name = 'A+',
	--         performance = {
	--             engine = -1,
	--             transmission = -1,
	--             brakes = -1,
	--             suspension = -1,
	--             turbo = true,
	--         },
	--         handling = {
	--             {
	--                 field = 'fInitialDriveForce',
	--                 fieldType = 'Float',
	--                 multiplier = true,
	--                 value = 10.0,
	--             },
	--         }
	--     },
	--     {
	--         name = 'S',
	--     },
	--     {
	--         name = 'S+',
	--     }
	-- }

	[`POLBIKE`] = {
		{
			name = "B",
			performance = {
				engine = -1,
				transmission = -1,
				brakes = -1,
				suspension = -1,
				turbo = false,
			},
			handling = false, -- Reset
		},
		{
			name = "A",
			performance = {
				engine = 1,
				transmission = 1,
				brakes = -1,
				suspension = -1,
				turbo = false,
			},
			handling = {
				{
					field = "fInitialDragCoeff",
					fieldType = "Float",
					multiplier = false,
					value = 3.5,
				},
				{
					field = "fInitialDriveForce",
					fieldType = "Float",
					multiplier = false,
					value = 0.275,
				},
				{
					field = "fBrakeForce",
					fieldType = "Float",
					multiplier = false,
					value = 1.0,
				},
				{
					field = "fInitialDriveMaxFlatVel",
					fieldType = "Float",
					multiplier = false,
					value = 165.000000,
				},
			},
		},
		{
			name = "A+",
			performance = {
				engine = 2,
				transmission = 2,
				brakes = 2,
				suspension = 1,
				turbo = true,
			},
			handling = {
				{
					field = "fInitialDragCoeff",
					fieldType = "Float",
					multiplier = false,
					value = 2.25,
				},
				{
					field = "fInitialDriveForce",
					fieldType = "Float",
					multiplier = false,
					value = 0.295,
				},
				{
					field = "fBrakeForce",
					fieldType = "Float",
					multiplier = false,
					value = 1.2,
				},
				{
					field = "fInitialDriveMaxFlatVel",
					fieldType = "Float",
					multiplier = false,
					value = 175.000000,
				},
				{
					field = "fDriveInertia",
					fieldType = "Float",
					multiplier = false,
					value = 1.75,
				},
			},
		},
	},
	[`polcamaro`] = {
		{
			name = "B",
			performance = {
				engine = -1,
				transmission = -1,
				brakes = -1,
				suspension = -1,
				turbo = false,
			},
			handling = false, -- Reset
		},
		{
			name = "A",
			performance = {
				engine = 1,
				transmission = 1,
				brakes = -1,
				suspension = -1,
				turbo = false,
			},
			handling = {
				{
					field = "fInitialDragCoeff",
					fieldType = "Float",
					multiplier = false,
					value = 3.5,
				},
				{
					field = "fInitialDriveForce",
					fieldType = "Float",
					multiplier = false,
					value = 0.275,
				},
				{
					field = "fBrakeForce",
					fieldType = "Float",
					multiplier = false,
					value = 1.2,
				},
				{
					field = "fInitialDriveMaxFlatVel",
					fieldType = "Float",
					multiplier = false,
					value = 170.000000,
				},
			},
		},
		{
			name = "A+",
			performance = {
				engine = 2,
				transmission = 2,
				brakes = 2,
				suspension = 1,
				turbo = true,
			},
			handling = {
				{
					field = "fInitialDragCoeff",
					fieldType = "Float",
					multiplier = false,
					value = 3.5,
				},
				{
					field = "fInitialDriveForce",
					fieldType = "Float",
					multiplier = false,
					value = 0.275,
				},
				{
					field = "fBrakeForce",
					fieldType = "Float",
					multiplier = false,
					value = 1.2,
				},
				{
					field = "fInitialDriveMaxFlatVel",
					fieldType = "Float",
					multiplier = false,
					value = 175.000000,
				},
				{
					field = "fTractionCurveMax",
					fieldType = "Float",
					multiplier = false,
					value = 2.4,
				},
				{
					field = "fTractionCurveMin",
					fieldType = "Float",
					multiplier = false,
					value = 1.9,
				},
			},
		},
		{
			name = "S",
			performance = {
				engine = 3,
				transmission = 3,
				brakes = 3,
				suspension = 1,
				turbo = true,
			},
			handling = {
				{
					field = "fInitialDragCoeff",
					fieldType = "Float",
					multiplier = false,
					value = 2.8,
				},
				{
					field = "fInitialDriveForce",
					fieldType = "Float",
					multiplier = false,
					value = 0.32,
				},
				{
					field = "fBrakeForce",
					fieldType = "Float",
					multiplier = false,
					value = 1.4,
				},
				{
					field = "fInitialDriveMaxFlatVel",
					fieldType = "Float",
					multiplier = false,
					value = 180.000000,
				},
				{
					field = "fTractionCurveMax",
					fieldType = "Float",
					multiplier = false,
					value = 2.4,
				},
				{
					field = "fTractionCurveMin",
					fieldType = "Float",
					multiplier = false,
					value = 1.9,
				},
				{
					field = "fSuspensionForce",
					fieldType = "Float",
					multiplier = false,
					value = 2.4,
				},
			},
		},
	},
	[`polcharger`] = {
		{
			name = "B",
			performance = {
				engine = -1,
				transmission = -1,
				brakes = -1,
				suspension = -1,
				turbo = false,
			},
			handling = false, -- Reset
		},
		{
			name = "A",
			performance = {
				engine = 1,
				transmission = 1,
				brakes = -1,
				suspension = -1,
				turbo = false,
			},
			handling = {
				{
					field = "fInitialDragCoeff",
					fieldType = "Float",
					multiplier = false,
					value = 3.5,
				},
				{
					field = "fInitialDriveForce",
					fieldType = "Float",
					multiplier = false,
					value = 0.275,
				},
				{
					field = "fBrakeForce",
					fieldType = "Float",
					multiplier = false,
					value = 1.2,
				},
				{
					field = "fInitialDriveMaxFlatVel",
					fieldType = "Float",
					multiplier = false,
					value = 170.000000,
				},
			},
		},
		{
			name = "A+",
			performance = {
				engine = 2,
				transmission = 2,
				brakes = 2,
				suspension = 1,
				turbo = true,
			},
			handling = {
				{
					field = "fInitialDragCoeff",
					fieldType = "Float",
					multiplier = false,
					value = 3.5,
				},
				{
					field = "fInitialDriveForce",
					fieldType = "Float",
					multiplier = false,
					value = 0.275,
				},
				{
					field = "fBrakeForce",
					fieldType = "Float",
					multiplier = false,
					value = 1.2,
				},
				{
					field = "fInitialDriveMaxFlatVel",
					fieldType = "Float",
					multiplier = false,
					value = 175.000000,
				},
				{
					field = "fTractionCurveMax",
					fieldType = "Float",
					multiplier = false,
					value = 2.4,
				},
				{
					field = "fTractionCurveMin",
					fieldType = "Float",
					multiplier = false,
					value = 1.9,
				},
			},
		},
		{
			name = "S",
			performance = {
				engine = 3,
				transmission = 3,
				brakes = 3,
				suspension = 1,
				turbo = true,
			},
			handling = {
				{
					field = "fInitialDragCoeff",
					fieldType = "Float",
					multiplier = false,
					value = 2.8,
				},
				{
					field = "fInitialDriveForce",
					fieldType = "Float",
					multiplier = false,
					value = 0.32,
				},
				{
					field = "fBrakeForce",
					fieldType = "Float",
					multiplier = false,
					value = 1.4,
				},
				{
					field = "fInitialDriveMaxFlatVel",
					fieldType = "Float",
					multiplier = false,
					value = 180.000000,
				},
				{
					field = "fTractionCurveMax",
					fieldType = "Float",
					multiplier = false,
					value = 2.4,
				},
				{
					field = "fTractionCurveMin",
					fieldType = "Float",
					multiplier = false,
					value = 1.9,
				},
				{
					field = "fSuspensionForce",
					fieldType = "Float",
					multiplier = false,
					value = 2.4,
				},
			},
		},
	},
	[`poltahoe21`] = {
		{
			name = "C",
			performance = {
				engine = -1,
				transmission = -1,
				brakes = -1,
				suspension = -1,
				turbo = false,
			},
			handling = false, -- Reset
		},
		{
			name = "B",
			performance = {
				engine = 1,
				transmission = 1,
				brakes = -1,
				suspension = -1,
				turbo = false,
			},
			handling = {
				{
					field = "fInitialDragCoeff",
					fieldType = "Float",
					multiplier = false,
					value = 4.0,
				},
				{
					field = "fInitialDriveForce",
					fieldType = "Float",
					multiplier = false,
					value = 0.23,
				},
				{
					field = "fBrakeForce",
					fieldType = "Float",
					multiplier = false,
					value = 1.0,
				},
				{
					field = "fInitialDriveMaxFlatVel",
					fieldType = "Float",
					multiplier = false,
					value = 170.000000,
				},
			},
		},
		{
			name = "A",
			performance = {
				engine = 2,
				transmission = 2,
				brakes = -1,
				suspension = -1,
				turbo = true,
			},
			handling = {
				{
					field = "fInitialDragCoeff",
					fieldType = "Float",
					multiplier = false,
					value = 4.0,
				},
				{
					field = "fInitialDriveForce",
					fieldType = "Float",
					multiplier = false,
					value = 0.245,
				},
				{
					field = "fBrakeForce",
					fieldType = "Float",
					multiplier = false,
					value = 1.15,
				},
				{
					field = "fInitialDriveMaxFlatVel",
					fieldType = "Float",
					multiplier = false,
					value = 170.000000,
				},
			},
		},
	},
	[`POLRAM`] = {
		{
			name = "C",
			performance = {
				engine = -1,
				transmission = -1,
				brakes = -1,
				suspension = -1,
				turbo = false,
			},
			handling = false, -- Reset
		},
		{
			name = "B",
			performance = {
				engine = 1,
				transmission = 1,
				brakes = -1,
				suspension = -1,
				turbo = false,
			},
			handling = {
				{
					field = "fInitialDragCoeff",
					fieldType = "Float",
					multiplier = false,
					value = 4.0,
				},
				{
					field = "fInitialDriveForce",
					fieldType = "Float",
					multiplier = false,
					value = 0.23,
				},
				{
					field = "fBrakeForce",
					fieldType = "Float",
					multiplier = false,
					value = 1.0,
				},
				{
					field = "fInitialDriveMaxFlatVel",
					fieldType = "Float",
					multiplier = false,
					value = 170.000000,
				},
			},
		},
		{
			name = "A",
			performance = {
				engine = 2,
				transmission = 2,
				brakes = -1,
				suspension = -1,
				turbo = true,
			},
			handling = {
				{
					field = "fInitialDragCoeff",
					fieldType = "Float",
					multiplier = false,
					value = 4.0,
				},
				{
					field = "fInitialDriveForce",
					fieldType = "Float",
					multiplier = false,
					value = 0.245,
				},
				{
					field = "fBrakeForce",
					fieldType = "Float",
					multiplier = false,
					value = 1.15,
				},
				{
					field = "fInitialDriveMaxFlatVel",
					fieldType = "Float",
					multiplier = false,
					value = 170.000000,
				},
			},
		},
	},
}
