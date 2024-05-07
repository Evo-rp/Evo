table.insert(Config.Restaurants, {
    Name = "Noodle Exchange",
    Job = "noodle",
    Benches = {
        food = {
            label = "Kitchen",
            targeting = {
                actionString = "Preparing",
                icon = "stroopwafel",
                poly = {
                    coords = vector3(-1238.35, -269.11, 37.77),
                    l = 1.0,
                    w = 2.8,
                    options = {
                        heading = 30,
                        --debugPoly=true,
                        minZ = 35.17,
                        maxZ = 39.17
                    },
                },
            },
            recipes = {
                _genericRecipies.glass_cock,
                _genericRecipies.lemonade,
                {
                    result = { name = "chips", count = 5 },
                    items = {
                        { name = "potato", count = 10 },
                    },
                    time = 3000,
                },
                {
                    result = { name = "japanese_pan_noodles", count = 5 },
                    items = {
                        { name = "eggs", count = 5 },
                        { name = "flour", count = 10 },
                        { name = "cucumber", count = 2 },
                    },
                    time = 1500,
                },
                {
                    result = { name = "guksu", count = 5 },
                    items = {
                        { name = "eggs", count = 7 },
                        { name = "flour", count = 10 },
                        { name = "cucumber", count = 2 },
                        { name = "lettuce", count = 4 },
                        { name = "fishing_seaweed", count = 5 },
                        { name = "fishing_oil", count = 1 },
                    },
                    time = 1500,
                },
                {
                    result = { name = "pad_thai", count = 5 },
                    items = {
                        { name = "eggs", count = 5 },
                        { name = "flour", count = 10 },
                        { name = "sugar", count = 2 },
                        { name = "lettuce", count = 4 },
                        { name = "fishing_kelp", count = 2 },
                    },
                    time = 1500,
                },
                {
                    result = { name = "maki_calirolls", count = 5 },
                    items = {
                        { name = "rice", count = 2 },
                        { name = "cucumber", count = 2 },
                        { name = "fishing_seaweed", count = 2 },
                        { name = "fishing_kelp", count = 1 },
                        { name = "fishing_rockfish", count = 1 },
                    },
                    time = 1500,
                },
                {
                    result = { name = "maki_tuna", count = 5 },
                    items = {
                        { name = "rice", count = 2 },
                        { name = "fishing_tuna", count = 4 },
                        { name = "fishing_seaweed", count = 1 },
                        { name = "cucumber", count = 1 },
                    },
                    time = 1500,
                },
                {
                    result = { name = "sashimi_mix", count = 5 },
                    items = {
                        { name = "rice", count = 2 },
                        { name = "fishing_tuna", count = 3 },
                        { name = "fishing_rainbowtrout", count = 3 },
                        { name = "fishing_bass", count = 1 },
                        { name = "fishing_seaweed", count = 2 },
                        { name = "lettuce", count = 1 },
                    },
                    time = 1500,
                },
                _genericRecipies.salad,
            },
        },
    },
    Storage = {
        {
            id = "noodle-freezer",
            type = "box",
            coords = vector3(-1241.41, -267.88, 37.77),
            width = 1.0,
            length = 1.4,
            options = {
                heading = 300,
                --debugPoly=true,
                minZ = 35.77,
                maxZ = 39.77
            },
			data = {
                business = "noodle",
                inventory = {
                    invType = 89,
                    owner = "noodle-freezer",
                },
			},
        },
    },
    Pickups = {
        {
            id = "noodle-pickup-1",
            coords = vector3(-1237.84, -271.64, 37.77),
            width = 0.8,
            length = 0.8,
            options = {
                heading = 25,
                --debugPoly=true,
                minZ = 35.37,
                maxZ = 39.37
            },
			data = {
                business = "noodle",
                inventory = {
                    invType = 25,
                    owner = "noodle-pickup-1",
                },
			},
        },
    },
    Warmers = {
        {
            id = "noodle-warmer-1",
            coords = vector3(-1239.48, -266.7, 37.77),
            length = 0.8,
            width = 2.6,
            options = {
                heading = 30,
                --debugPoly=true,
                minZ = 34.97,
                maxZ = 38.97
            },
            restrict = {
                jobs = { "noodle" },
            },
			data = {
                business = "noodle",
                inventory = {
                    invType = 90,
                    owner = "noodle-warmer-1",
                },
			},
        },
    },
})