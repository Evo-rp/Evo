_dealerships = {
    ['pdm'] = {
        id = 'pdm',
        abbreviation = 'PDM',
        name = 'Premium Deluxe Motorsport',
        profitPercents = {
            default = 15,
            min = 10,
            max = 25,
        },
        commission = 25,
        emails = {
            sales = 'sales@premiumdeluxe.com',
            loans = 'loans@premiumdeluxe.com',
        },
        blip = {
            coords = vector3(-34.053, -1659.121, 29.491),
            sprite = 523,
            colour = 57,
            scale = 0.6,
        },
        zones = {
            -- Polyzone surrounding the entire dealership, showroom cars only spawn within this zone
            dealership = {
                type = 'poly',
                points = {
                    vector2(-23.837366104126, -1633.1323242188),
                    vector2(14.090105056763, -1665.0364990234),
                    vector2(11.958735466003, -1673.3294677734),
                    vector2(-57.123271942139, -1702.2672119141),
                    vector2(-65.481880187988, -1697.4028320312),
                    vector2(-67.740005493164, -1689.1381835938)
                },
                options = {
                    minZ = 28.29,
                    maxZ = 32.29
                }
            },
            catalog = {
                {
                    type = 'box',
                    center = vector3(-34.98, -1666.27, 29.49),
                    length = 1.4,
                    width = 2.4,
                    options = {
                        heading = 50,
                        minZ = 28.49,
                        maxZ = 30.09
                    },
                },
                -- {
                --     type = 'box',
                --     center = vector3(-51.13, -1086.99, 27.27),
                --     length = 1,
                --     width = 1,
                --     options = {
                --         heading = 338,
                --         minZ = 26.27,
                --         maxZ = 28.27
                --     },
                -- },
                -- {
                --     type = 'box',
                --     center = vector3(-40.27, -1094.44, 27.27),
                --     length = 1,
                --     width = 1,
                --     options = {
                --         heading = 295,
                --         minZ = 26.27,
                --         maxZ = 28.27
                --     },
                -- },
                -- {
                --     type = 'box',
                --     center = vector3(-39.02, -1100.29, 27.27),
                --     length = 1,
                --     width = 1,
                --     options = {
                --         heading = 295,
                --         minZ = 26.27,
                --         maxZ = 28.27
                --     },
                -- },
                -- {
                --     type = 'box',
                --     center = vector3(-46.887, -1095.525, 27.274),
                --     length = 1,
                --     width = 1,
                --     options = {
                --         heading = 291,
                --         minZ = 26.27,
                --         maxZ = 28.27
                --     },
                -- },
            },
            -- Array of different BOX zones for targeting interaction
            employeeInteracts = {
                { -- PDM
                    center = vector3(-29.72, -1668.68, 29.49),
                    length = 3.6,
                    width = 0.6,
                    options = {
                        heading = 320,
                        minZ = 28.49,
                        maxZ = 29.89
                    }
                },
                -- { -- PDM
                --     center = vector3(-32.19, -1088.49, 27.27),
                --     length = 1.0,
                --     width = 5.0,
                --     options = {
                --         heading = 340,
                --         minZ = 26.27,
                --         maxZ = 27.87
                --     }
                -- },
                -- { -- PDM
                --     center = vector3(-26.4, -1104.46, 27.27),
                --     length = 0.8,
                --     width = 2.6,
                --     options = {
                --         heading = 250,
                --         minZ = 26.27,
                --         maxZ = 27.87
                --     }
                -- },
                -- { -- PDM
                --     center = vector3(-27.36, -1107.16, 27.27),
                --     length = 0.8,
                --     width = 2.6,
                --     options = {
                --         heading = 250,
                --         minZ = 26.27,
                --         maxZ = 27.87
                --     }
                -- },
                -- { -- PDM
                --     center = vector3(-31.8, -1097.31, 27.27),
                --     length = 0.8,
                --     width = 5.0,
                --     options = {
                --         heading = 250,
                --         minZ = 26.27,
                --         maxZ = 27.87
                --     }
                -- },
            },
            buyback = {
                type = 'box',
                center = vector3(-52.59, -1691.59, 29.47),
                length = 7.2,
                width = 4.0,
                options = {
                    heading = 310,
                    --debugPoly=true,
                    minZ = 28.47,
                    maxZ = 31.07
                }
            }
        },
        showroom = {
            vector4(-25.207, -1650.226, 29.080, 92.910),
            vector4(-33.400, -1657.906, 29.080, 186.054),
            vector4(-39.974, -1664.899, 29.081, 80.237)
        },
        storage = {
            Type = 1,
            Id = 'pdm_delivery',
        },
        testdrive = {
			coords = vector4(-58.140, -1686.835, 29.492, 306.254),
			timer = 1000 * 60 * 1.5,
			setplayerback = false,
		},
    },
    ['tuna'] = {
        id = 'tuna',
        abbreviation = '6STR',
        name = '6STR Motors',
        profitPercents = {
            default = 15,
            min = 10,
            max = 25,
        },
        commission = 25,
        emails = {
            sales = 'sales@6str.net',
            loans = 'loans@6str.net',
        },
        zones = {
            -- Polyzone surrounding the entire dealership, showroom cars only spawn within this zone
            dealership = {
                type = 'box',
                center = vector3(154.67, -3028.78, 7.04),
                length = 63.6,
                width = 69.0,
                options = {
                    heading = 0,
                    --debugPoly=true,
                    minZ = 3.64,
                    maxZ = 14.64
                }
            },
            catalog = {
                {
                    type = 'box',
                    center = vector3(152.04, -3016.46, 7.04),
                    length = 1.6,
                    width = 1.8,
                    options = {
                        heading = 0,
                        minZ = 6.04,
                        maxZ = 8.04
                    },
                },
            },
            -- Array of different BOX zones for targeting interaction
            employeeInteracts = {
                {
                    center = vector3(123.69, -3028.24, 7.04),
                    length = 1.0,
                    width = 0.6,
                    options = {
                        heading = 270,
                        minZ = 6.64,
                        maxZ = 7.44
                    }
                },
                {
                    center = vector3(125.48, -3007.18, 7.04),
                    length = 0.8,
                    width = 2.0,
                    options = {
                        heading = 0,
                        --debugPoly=true,
                        minZ = 6.64,
                        maxZ = 7.64
                    }
                },
                {
                    center = vector3(134.02, -3013.64, 10.7),
                    length = 0.8,
                    width = 1.2,
                    options = {
                        heading = 270,
                        --debugPoly=true,
                        minZ = 9.9,
                        maxZ = 10.9
                    }
                },
            },
            buyback = {
                type = 'box',
                center = vector3(129.93, -3000.37, 7.03),
                length = 10.0,
                width = 6.2,
                options = {
                    heading = 0,
                    --debugPoly=true,
                    minZ = 6.03,
                    maxZ = 10.43
                }
            }
        },
        showroom = {
            vector4(146.46, -3046.66, 6.36, 330.08),
            vector4(142.18, -3045.47, 6.36, 330.08),
            vector4(137.59, -3044.49, 6.37, 330.08),
            vector4(147.54, -3017.87, 6.36, 216.45),
            vector4(140.02, -3017.71, 6.36, 216.45),
        },
        storage = {
            Type = 1,
            Id = 'tuna_delivery',
        },
        testdrive = {
			coords = vector4(145.530, -2991.769, 7.031, 84.926),
			timer = 1000 * 60 * 1.5,
			setplayerback = false,
		},
    },
}