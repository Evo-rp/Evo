local _PURCHASE_CONFIG = {}
local _CREATED_SALE_SIGNS = {}

AddEventHandler('Businesses:Client:Startup', function()
    Wait(1000)

    Callbacks:ServerCallback('Business:Purchase:PassConfig', {}, function(cb)
        _PURCHASE_CONFIG = cb
    end)

    Wait(1000)

    for k, v in pairs(_PURCHASE_CONFIG) do
        Logger:Info('Businesses', 'Placing for sale sign outside business ' .. v.Name)

        Polyzone.Create:Circle('FOR_SALE_BUSINESS_' .. v.Job, vector3(v.Prop.Coords.x, v.Prop.Coords.y, v.Prop.Coords.z), 55.0, { useZ = true })
    end

    Callbacks:RegisterClientCallback('Businesses:Client:Purchase:SignSync', function(data, cb)
        if data.Type == 'Add' then
            _PURCHASE_CONFIG['FOR_SALE_BUSINESS_' .. data.Job] = data
            Polyzone.Create:Circle('FOR_SALE_BUSINESS_' .. data.Job, vector3(data.Prop.Coords.x, data.Prop.Coords.y, data.Prop.Coords.z), 55.0, { useZ = true })
        end
        
        if data.Type == 'Remove' then
            if _PURCHASE_CONFIG['FOR_SALE_BUSINESS_' .. data.Job].Object then
                Targeting:RemoveEntity(_PURCHASE_CONFIG['FOR_SALE_BUSINESS_' .. data.Job].Object)
                DeleteObject(_PURCHASE_CONFIG['FOR_SALE_BUSINESS_' .. data.Job].Object)
            end

            Polyzone:Remove('FOR_SALE_BUSINESS_' .. data.Job)
            _PURCHASE_CONFIG['FOR_SALE_BUSINESS_' .. data.Job] = nil
        end
    end)

    AddEventHandler('Businesses:Client:View', function(_, data)
        ListMenu:Show({
            main = {
                label = data.Name,
                items = {
                    {
                        label = 'Price',
                        description = '$' .. data.Price,
                    },
                    {
                        label = 'Purchase',
                        event = 'Businesses:Client:Purchase',
                        data = data
                    }
                }
            }
        })
    end)

    AddEventHandler('Businesses:Client:Purchase', function(data)
        Progress:Progress({
            name = "business_purchase",
            duration = 10000,
            label = 'Aquiring Business...',
            useWhileDead = false,
            canCancel = true,
            disarm = false,
            controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            },
        }, function(cancelled)
            if not cancelled then
                Callbacks:ServerCallback('Businesses:Server:FinalizePurchase', data, function(cb)
                    if cb then
                        Notification:Success("Successfully purchased business " .. data.Name)
                    else
                        Notification:Error("An error occoured when trying to purchase this business")
                    end
                end)
            end
        end)
    end)

    Callbacks:RegisterClientCallback('Businesses:Client:Purchased')
end)

AddEventHandler('Polyzone:Enter', function(Id)
    if string.find(Id, 'FOR_SALE_BUSINESS_') then
        Logger:Info('Businesses', 'Creating a object for business ' .. _PURCHASE_CONFIG[Id].Name)
        _PURCHASE_CONFIG[Id].Object = CreateObject('prop_forsale_lrg_06', vector3(_PURCHASE_CONFIG[Id].Prop.Coords.x, _PURCHASE_CONFIG[Id].Prop.Coords.y, _PURCHASE_CONFIG[Id].Prop.Coords.z), false, false, false)

        SetEntityHeading(_PURCHASE_CONFIG[Id].Object, _PURCHASE_CONFIG[Id].Prop.Heading)
        SetEntityInvincible(_PURCHASE_CONFIG[Id].Object, true)
        FreezeEntityPosition(_PURCHASE_CONFIG[Id].Object, true)

        Targeting:AddEntity(_PURCHASE_CONFIG[Id].Object, 'sign-hanging', {
            {
                icon = "briefcase",
                text = "View Business",
                event = 'Businesses:Client:View',
                data = _PURCHASE_CONFIG[Id]
            },
        })
    end
end)

AddEventHandler('Polyzone:Exit', function(Id)
    if string.find(Id, 'FOR_SALE_BUSINESS_') then
        if _PURCHASE_CONFIG[Id].Object ~= nil then
            Logger:Info('Businesses', 'Deleteing object at business ' .. _PURCHASE_CONFIG[Id].Name .. ' | ' .. _PURCHASE_CONFIG[Id].Object)
            Targeting:RemoveEntity(_PURCHASE_CONFIG[Id].Object)
            DeleteObject(_PURCHASE_CONFIG[Id].Object)
            _PURCHASE_CONFIG[Id].Object = nil
        end
    end
end)
