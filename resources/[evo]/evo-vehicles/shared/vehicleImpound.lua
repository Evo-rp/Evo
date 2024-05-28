_vehicleImpound = {
    name = 'Impound Yard',
    coords = vector3(1012.615, -2311.793, 30.51),
    spaces = {
        vector4(1016.628, -2310.170, 30.101, 335.157),
        vector4(1019.791, -2310.275, 30.103, 337.154),
        vector4(1022.989, -2310.313, 30.104, 336.241),
        vector4(1025.566, -2311.131, 30.103, 336.814),
    },
    interactionBoxZone = {
        center = vector3(1024.09, -2308.8, 30.51),
        length = 1,
        width = 1,
        heading = 0,
        minZ = 29.51,
        maxZ = 33.11
    }
}

_impoundConfig = {
    RequiredPermission = 'impound',
    RegularFine = 750,
    Police = {
        RequiredPermission = 'impound_police',
        Levels = {
            {
                Fine = {
                    Min = 2000,
                    Percent = false,
                },
                Holding = 0,
            },
            {
                Fine = {
                    Min = 3500,
                    Percent = false,
                },
                Holding = 6,
            },
            {
                Fine = {
                    Min = 5000,
                    Percent = false,
                },
                Holding = 12,
            },
            {
                Fine = {
                    Min = 8500,
                    Percent = false,
                },
                Holding = 24,
            },
            -- {
            --     Fine = {
            --         Min = 10000,
            --         Percent = 25,
            --     },
            --     Holding = 48,
            -- },
            -- {
            --     Fine = {
            --         Min = 10000,
            --         Percent = 25,
            --     },
            --     Holding = 96,
            -- },
        }
    }
}