table.insert(Config.Restaurants, {
    Name = "Burger Shot",
    Job = "burgershot",
    Benches = {
        drinks = {
            label = "Drinks & Ice Cream",
            targeting = {
                actionString = "Preparing",
                icon = "glass-water",
                poly = {
                    coords = vector3(-505.15, -696.74, 33.67),
                    w = 3.2,
                    l = 0.6,
                    options = {
                        heading = 0,
                        --debugPoly=true,
                        minZ = 33.47,
                        maxZ = 34.67
                    },
                },
            },
            recipes = {
                {
                    result = { name = "burgershot_drink", count = 1 },
                    items = {
                        { name = "burgershot_cup", count = 1 },
                    },
                    time = 0,
                },
                {
                    result = { name = "orangotang_icecream", count = 10 },
                    items = {
                        { name = "milk_can", count = 3 },
                        { name = "sugar", count = 1 },
                        { name = "orange", count = 10 },
                    },
                    time = 2500,
                },
                {
                    result = { name = "meteorite_icecream", count = 10 },
                    items = {
                        { name = "milk_can", count = 3 },
                        { name = "sugar", count = 1 },
                        { name = "chocolate_bar", count = 3 },
                    },
                    time = 2500,
                },
                {
                    result = { name = "mocha_shake", count = 5 },
                    items = {
                        { name = "plastic_cup", count = 1 },
                        { name = "milk_can", count = 3 },
                        { name = "chocolate_bar", count = 1 },
                        { name = "coffee_beans", count = 3 },
                    },
                    time = 2500,
                },
            },
        },
        food = {
            label = "Food",
            targeting = {
                actionString = "Cooking",
                icon = "burger",
                poly = {
                    coords = vector3(-504.63, -686.72, 33.67),
                    w = 1.4,
                    l = 1,
                    options = {
                        heading = 0,
                        --debugPoly=true,
                        minZ = 33.27,
                        maxZ = 33.87
                    },
                },
            },
            recipes = {
                {
                    result = { name = "patty", count = 5 },
                    items = {
                        { name = "unk_meat", count = 10 },
                    },
                    time = 2000,
                },
                {
                    result = { name = "pickle", count = 10 },
                    items = {
                        { name = "cucumber", count = 15 },
                    },
                    time = 2000,
                },
                {
                    result = { name = "burger", count = 5 },
                    items = {
                        { name = "bun", count = 4 },
                        { name = "patty", count = 4 },
                        { name = "lettuce", count = 3 },
                        { name = "pickle", count = 6 },
                        { name = "tomato", count = 10 },
                        { name = "cheese", count = 5 },
                    },
                    time = 2000,
                },
                {
                    result = { name = "double_shot_burger", count = 5 },
                    items = {
                        { name = "bun", count = 6 },
                        { name = "patty", count = 6 },
                        { name = "lettuce", count = 6 },
                        { name = "pickle", count = 6 },
                        { name = "tomato", count = 10 },
                        { name = "cheese", count = 5 },
                    },
                    time = 2000,
                },
                {
                    result = { name = "tacos", count = 3 },
                    items = {
                        { name = "dough", count = 1 },
                        { name = "lettuce", count = 2 },
                        { name = "tomato", count = 4 },
                        { name = "beef", count = 2 },
                    },
                    time = 2000,
                },
                {
                    result = { name = "heartstopper", count = 1 },
                    items = {
                        { name = "bun", count = 2 },
                        { name = "patty", count = 3 },
                        { name = "lettuce", count = 2 },
                        { name = "pickle", count = 3 },
                        { name = "tomato", count = 4 },
                        { name = "cheese", count = 5 },
                    },
                    time = 2000,
                },
                {
                    result = { name = "the_simply_burger", count = 5 },
                    items = {
                        { name = "bun", count = 5 },
                        { name = "patty", count = 5 },
                        { name = "lettuce", count = 12 },
                    },
                    time = 2000,
                },
                {
                    result = { name = "prickly_burger", count = 5 },
                    items = {
                        { name = "bun", count = 3 },
                        { name = "patty", count = 3 },
                        { name = "lettuce", count = 9 },
                        { name = "chicken", count = 9 },
                        { name = "cheese", count = 3 },
                    },
                    time = 2000,
                },
                {
                    result = { name = "chicken_wrap", count = 3 },
                    items = {
                        { name = "dough", count = 1 },
                        { name = "lettuce", count = 1 },
                        { name = "cucumber", count = 3 },
                        { name = "tomato", count = 5 },
                        { name = "cheese", count = 1 },
                        { name = "chicken", count = 1 },
                    },
                    time = 2000,
                },
                {
                    result = { name = "goat_cheese_wrap", count = 3 },
                    items = {
                        { name = "dough", count = 1 },
                        { name = "lettuce", count = 1 },
                        { name = "cucumber", count = 2 },
                        { name = "tomato", count = 3 },
                        { name = "cheese", count = 5 },
                    },
                    time = 2000,
                },
                {
                    result = { name = "burgershot_fries", count = 5 },
                    items = {
                        { name = "potato", count = 10 },
                    },
                    time = 2000,
                },
            },
        },
    },
    Storage = {
        {
            id = "burgershot-freezer",
            type = "box",
            coords = vector3(-508.93, -682.41, 33.67),
            width = 3.6,
            length = 1.8,
            options = {
                heading = 0,
                --debugPoly=true,
                minZ = 32.67,
                maxZ = 36.07
            },
			data = {
                business = "burgershot",
                inventory = {
                    invType = 23,
                    owner = "burgershot-freezer",
                },
			},
        },
    },
    Pickups = {
        { -- Burger Shot
            id = "burgershot-pickup-1",
            coords = vector3(-508.17, -695.18, 33.67),
            width = 1,
            length = 1,
            options = {
                heading = 0,
                --debugPoly=true,
                minZ = 33.27,
                maxZ = 33.87
            },
            data = {
                business = "burgershot",
                inventory = {
                    invType = 25,
                    owner = "burgershot-pickup-2",
                },
            },
        },
        { -- Burger Shot
            id = "burgershot-pickup-2",
            coords = vector3(-508.19, -696.68, 33.67),
            width = 1,
            length = 1,
            options = {
                heading = 0,
                --debugPoly=true,
                minZ = 33.27,
                maxZ = 33.87
            },
			data = {
                business = "burgershot",
                inventory = {
                    invType = 25,
                    owner = "burgershot-pickup-2",
                },
			},
        },
        { -- Burger Shot
            id = "burgershot-pickup-3",
            coords = vector3(-508.14, -698.23, 33.67),
            width = 0.6,
            length = 1,
            options = {
                heading = 10,
                --debugPoly=true,
                minZ = 33.27,
                maxZ = 33.87
            },
			data = {
                business = "burgershot",
                inventory = {
                    invType = 25,
                    owner = "burgershot-pickup-3",
                },
			},
        },
    },
    Warmers = {
        { -- Burger Shot
            id = "burgershot-warmer-1",
            coords = vector3(-506.77, -691.25, 33.67),
            length = 1.8,
            width = 1.4,
            options = {
                heading = 0,
                --debugPoly=true,
                minZ = 33.67,
                maxZ = 34.67
            },
            restrict = {
                jobs = { "burgershot" },
            },
			data = {
                business = "burgershot",
                inventory = {
                    invType = 24,
                    owner = "burgershot-warmer-1",
                },
			},
        },
    },
})