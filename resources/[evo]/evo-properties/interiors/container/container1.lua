PropertyInteriors = PropertyInteriors or {}

-- 150

PropertyInteriors["container1"] = {
    type = "container",
    price = 100000,
    info = {
        name = "Container #1",
        description = "Arms Shipping Container",
    },
    inventoryOverride = 1020,
    locations = {
        front = {
            coords = vector3(-836.086, -401.542, 31.564),
            heading = 357.346,
            polyzone = {
                center = vector3(-836.22, -402.27, 31.56),
                length = 0.4,
                width = 1.4,
                options = {
                    heading = 0,
                    --debugPoly=true,
                    minZ = 30.56,
                    maxZ = 33.16
                }
            }
        },
        crafting = {
            coords = vector3(-834.85, -396.49, 31.56),
            heading = 1,
            polyzone = {
                center = vector3(-834.85, -396.49, 31.56),
                length = 2.2,
                width = 0.9,
                options = {
                    heading = 0,
                    --debugPoly=true,
                    minZ = 30.56,
                    maxZ = 32.76
                }
            }
        },
    },
    zone = {
        center = vector3(-834.85, -396.49, 31.56),
         length = 2.2,
         width =  0.9,
         options = {
             heading = 1,
             --debugPoly=true,
             minZ = -103.1,
             maxZ = -83.7
        }
     },
}