table.insert(Config.Restaurants, {
    Name = "Bean Machine",
    Job = "beanmachine",
    Benches = {
        food = {
            label = "Food",
            targeting = {
                actionString = "Preparing",
                icon = "sandwich",
                poly = {
                    coords = vector3(-632.27, 224.56, 81.88),
                    w = 0.7,
                    l = 0.8,
                    options = {
                        heading = 355,
                        --debugPoly=true,
                        minZ = 79.48,
                        maxZ = 83.48
                    },
                },
            },
            recipes = {
                _genericRecipies.sandwich,
                _genericRecipies.sandwich_turkey,
                _genericRecipies.sandwich_beef,
                _genericRecipies.sandwich_blt,
                _genericRecipies.salad,
                {
                    result = { name = "carrot_cake", count = 4 },
                    items = {
                        { name = "icing", count = 1 },
                        { name = "sugar", count = 3 },
                        { name = "dough", count = 1 },
                        { name = "milk_can", count = 1 },
                    },
                    time = 5000,
                },
                {
                    result = { name = "blueberry_muffin", count = 6 },
                    items = {
                        { name = "sugar", count = 3 },
                        { name = "dough", count = 1 },
                        { name = "milk_can", count = 1 },
                    },
                    time = 5000,
                },
                {
                    result = { name = "chocy_muff", count = 6 },
                    items = {
                        { name = "sugar", count = 4 },
                        { name = "dough", count = 1 },
                        { name = "milk_can", count = 1 },
                    },
                    time = 5000,
                },
                {
                    result = { name = "million_shrtbread", count = 10 },
                    items = {
                        { name = "sugar", count = 4 },
                        { name = "dough", count = 1 },
                        { name = "milk_can", count = 1 },
                    },
                    time = 5000,
                },
            },
        },
        coffee = {
            label = "Coffee Machine",
            targeting = {
                actionString = "Preparing",
                icon = "coffee-pot",
                poly = {
                    coords = vector3(-635.72, 236.64, 81.88),
                    w = 0.8,
                    l = 1.2,
                    options = {
                        heading = 0,
                        --debugPoly=true,
                        minZ = 79.28,
                        maxZ = 83.28
                    },
                },
            },
            recipes = {
                {
                    result = { name = "beanmachine", count = 3 },
                    items = {
                        { name = "plastic_cup", count = 1 },
                        { name = "coffee_beans", count = 3 },
                        { name = "milk_can", count = 1 },
                    },
                    time = 5000,
                },
                {
                    result = { name = "expresso", count = 3 },
                    items = {
                        { name = "coffee_beans", count = 5 },
                    },
                    time = 5000,
                },
            },
        },
        colddrinks = {
            label = "Drinks Machine",
            targeting = {
                actionString = "Preparing",
                icon = "cup-straw-swoosh",
                poly = {
                    coords = vector3(-636.71, 234.85, 81.88),
                    w = 2.7,
                    l = 0.5,
                    options = {
                        heading = 5,
                        --debugPoly=true,
                        minZ = 78.08,
                        maxZ = 82.08
                    },
                },
            },
            recipes = {
                _genericRecipies.glass_cock,
                _genericRecipies.lemonade,
                {
                    result = { name = "smoothie_orange", count = 3 },
                    items = {
                        { name = "plastic_cup", count = 1 },
                        { name = "orange", count = 3 },
                        { name = "sugar", count = 1 },
                    },
                    time = 5000,
                },
                {
                    result = { name = "smoothie_veg", count = 3 },
                    items = {
                        { name = "plastic_cup", count = 1 },
                        { name = "lettuce", count = 4 },
                        { name = "peas", count = 10 },
                        { name = "cucumber", count = 4 },
                        { name = "sugar", count = 1 },
                    },
                    time = 5000,
                },
            },
        },
    },
    Storage = {
        {
            id = "beanmachine-fridge",
            type = "box",
            coords = vector3(-631.99, 228.4, 81.88),
            width = 0.7,
            length = 1.7,
            options = {
                heading = 359,
                --debugPoly=true,
                minZ = 79.68,
                maxZ = 83.68
            },
			data = {
                business = "beanmachine",
                inventory = {
                    invType = 79,
                    owner = "beanmachine-fridge",
                },
			},
        },
    },
    Pickups = {
        {
            id = "beanmachine-pickup-1",
            coords = vector3(-634.22, 235.35, 81.88),
            width = 2.0,
            length = 1.0,
            options = {
                heading = 5,
                --debugPoly=true,
                minZ = 79.08,
                maxZ = 83.08
            },
			data = {
                business = "beanmachine",
                inventory = {
                    invType = 25,
                    owner = "beanmachine-pickup-1",
                },
			},
        },
        {
            id = "beanmachine-pickup-2",
            coords = vector3(-630.09, 236.57, 81.88),
            width = 1.4,
            length = 1.6,
            options = {
                heading = 5,
                --debugPoly=true,
                minZ = 79.48,
                maxZ = 83.48
            },
			data = {
                business = "beanmachine",
                inventory = {
                    invType = 25,
                    owner = "beanmachine-pickup-2",
                },
			},
        },
    },
})