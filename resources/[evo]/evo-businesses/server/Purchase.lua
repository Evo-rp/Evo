-- local _PURCHASE_CONFIG = {
--     ['FOR_SALE_BUSINESS_ottos'] = {
--         Name = 'Otto\'s Autos',
--         Price = 128589,
--         Job = 'ottos',
--         Prop = {
--             Coords = vector3(822.993, -814.150, 25.291),
--             Heading = 86.895
--         }
--     }
-- }
local _PURCHASE_CONFIG = {}

AddEventHandler("Businesses:Server:Startup", function()
    Chat:RegisterAdminCommand("businesssigncreate", function(source, args, rawCommand)
        local ped = GetPlayerPed(source)
        local coords = GetEntityCoords(ped)
        local heading = GetEntityHeading(ped)

        local res = ForSaleBusinesses:Create(vector3(coords.x, coords.y, coords.z - 1.2), heading, args[1], tonumber(args[2]), args[3])
        if res then
            Chat.Send.Server:Single(source, "Storage Unit Added, ID: " .. res)
        end
    end, {
        help = "Create a for sale business (Location Is Where You\"re At)",
        params = {
            {
                name = "Business Id",
                help = "e.g (dgang)"
            },
            {
                name = "Price",
                help = "e.g (50000)"
            },
            {
                name = "Business Name",
                help = "e.g (Dev Gang)"
            },
        }
    }, 3)

    Database.Game:find({
        collection = "available_businesses",
        query = {},
    }, function(success, results)
        if not success then return end

        Logger:Trace("Available Businesses", "Loaded ^2" .. #results .. "^7 Available Businesses", { console = true })

        for k, v in ipairs(results) do
            _PURCHASE_CONFIG['FOR_SALE_BUSINESS_' .. v.Job] = v
        end
    end)

    Callbacks:RegisterServerCallback('Business:Purchase:PassConfig', function(source, data, cb)
        cb(_PURCHASE_CONFIG)
    end)

    Callbacks:RegisterServerCallback('Businesses:Server:FinalizePurchase', function(source, data, cb)
        local Player = Fetch:Source(source)
        local Char = Player:GetData('Character')

        Database.Game:findOne({
			collection = "available_businesses",
			query = {
				_id = data._id,
			},
		}, function(success, results)
			if not success or not #results then
                Logger:Error('Available Businesses', 'An error occoured when selecting the available business query.')
				cb(false)
				return
			end
    
            if Banking.Balance:Charge(Char:GetData("BankAccount"), results[1].Price, { type = 'bill', title = 'Purchased a business', description = string.format('Purchased business %s.', data.Name), }) then
                local success = Jobs:GiveJob(Char:GetData('SID'), results[1].Job, false, Jobs:Get(data.Job).Grades[#Jobs:Get(data.Job).Grades].Id)
    
                if success then
                    Database.Game:deleteOne({
                        collection = "available_businesses",
                        query = {
                            _id = data._id,
                        },
                    }, function(success, deleted)
                        cb(success)
                    end)

                    Callbacks:ClientCallback(-1, 'Businesses:Client:Purchase:SignSync', {
                        Type = 'Remove',
                        Job = results[1].Job,
                    })

                    cb(true)
                else
                    Logger:Error('Available Businesses', 'An error occoured with attempting to give the job bank payment.')
                    cb(false)
                end
            else
                Logger:Error('Available Businesses', 'Player doesnt have enough money.')
                cb(false)
            end
        end)
    end)
end)

_FOR_SALE_BUSINESSES = {
    Create = function(self, location, heading, job, price, label)
        Database.Game:insertOne({
            collection = "available_businesses",
            document = {
                Name = label,
                Price = price,
                Job = job,
                Prop = {
                    Coords = {
                        x = location.x,
                        y = location.y,
                        z = location.z
                    },
                    Heading = heading
                }
            },
        }, function(success, result, insertedIds)
            if success then
                Callbacks:ClientCallback(-1, 'Businesses:Client:Purchase:SignSync', {
                    Type = 'Add',
                    _id = insertedIds[1],
                    Name = label,
                    Price = price,
                    Job = job,
                    Prop = {
                        Coords = {
                            x = location.x,
                            y = location.y,
                            z = location.z
                        },
                        Heading = heading
                    }
                })
            end
        end)

        return Citizen.Await(p)
    end,
}

AddEventHandler("Proxy:Shared:RegisterReady", function(component)
	exports["evo-base"]:RegisterComponent("ForSaleBusinesses", _FOR_SALE_BUSINESSES)
end)