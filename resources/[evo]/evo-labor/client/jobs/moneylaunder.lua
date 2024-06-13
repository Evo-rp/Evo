-- Fake checque item.
-- 50 rolls = 1 checkque. -- $5000 1/4 tax.
-- 5 bands = 1 checkque. -- $5000 1/4 tax.

local timesDone = 0
local _InMoneyRun = false

AddEventHandler("Labor:Client:Setup", function()
    PedInteraction:Add("MoneylaunderPed", `s_m_y_dealer_01`, vector3(561.704, -1747.374, 32.443), 152.095, 25.0, {
		{
			icon = "hand-holding",
			text = "Interact",
			event = "Labor:Client:MoneyLaunder:SpeakToPed",
		},
		{
			icon = "hand-holding",
			text = "Trade Rolls",
			event = "Labor:Client:MoneyLaunder:Trade",
			data = {
				item = 'moneyroll',
				amount = 50
			}
		},
		{
			icon = "hand-holding",
			text = "Trade Bands",
			event = "Labor:Client:MoneyLaunder:Trade",
			data = {
				item = 'moneyband',
				amount = 5
			}
		},
	}, 'money-check-dollar-pen', 'WORLD_HUMAN_CLIPBOARD')

	Interaction:RegisterMenu("moneyrun-cancel", "Cancel Money Run", "ban", function(data)
		Interaction:Hide()
		_InMoneyRun = false
		timesDone = 0

		PedInteraction:Remove("MoneyLaunderPed:Dropoff")

		RemoveBlip(_Blip)
	end, function()
        return _InMoneyRun
	end)
end)

AddEventHandler('Labor:Client:MoneyLaunder:SpeakToPed', function(data)
    NPCDialog.Open(data.entity, {
		first_name = 'William',
		last_name = 'Wash',
		Tag = '💸',
		description = 'Are you sure ?',
		buttons = {
			{
				label = 'Start run!',
				data = { close = true, event = 'Labor:Client:MoneyLaunder:GetLocation' }
			},
			{
				label = 'Get checkques.',
				data = { close = true }
			},
			{
				label = 'See you later !',
				data = { close = true }
			}
		}
	})
end)

AddEventHandler('Labor:Client:MoneyLaunder:GetLocation', function()
	_InMoneyRun = true
	Callbacks:ServerCallback('Labor:Server:MoneyLaunder:RetrieveLocations', {}, function(cb)
		Location = math.random(#cb)

		_Blip = Blips:Add("SalvDelivery", "Dropoff Location", vector3(cb[Location].x, cb[Location].y, cb[Location].z), 586, 2, 1.4)

		PedInteraction:Add("MoneyLaunderPed:Dropoff", `ig_bankman`, vector3(cb[Location].x, cb[Location].y, cb[Location].z), cb[Location].w, 25.0, {
			{
				icon = 'money-bill',
				text = "Interact",
				event = "Labor:Client:Trade",
			}
		}, 'building-columns')
	end)
end)

AddEventHandler('Labor:Client:Trade', function()
	timesDone = timesDone + 1

	if Inventory.Check.Player:HasItem('money_checkque', 1) then
		local Chance = math.random(1, 10)

		if Chance < 3 then
			Callbacks:ServerCallback('Labor:Server:MoneyLaunder:AlertPolice', { coords = GetEntityCoords(PlayerPedId() )}, function(callback) end)
		end

		Progress:Progress({
			name = "money_launder_transaction",
			duration = 30000,
			label = "Negotiating...",
			useWhileDead = false,
			canCancel = true,
			ignoreModifier = true,
			controlDisables = {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = true,
			},
		}, function(cancelled)
			if not cancelled then
				PedInteraction:Remove("MoneyLaunderPed:Dropoff")

				RemoveBlip(_Blip)

				if Chance < 3 then
					Notification:Error('Checkque declined!', 1000)
				end

				if Chance > 3 then
					Callbacks:ServerCallback('Labor:Server:MoneyLaunder:Complete')
				end

				if timesDone ~= 5 then
					TriggerEvent('Labor:Client:MoneyLaunder:GetLocation')
				else
					timesDone = 0
					_InMoneyRun = false

					Callbacks:ServerCallback('Labor:Server:MoneyLaunder:Finish')
				end
			end
		end)
	else
		Notification:Info('You do not have a checkque to turn in!', 1000)
	end
end)

AddEventHandler('Labor:Client:MoneyLaunder:Trade', function(_, data)
	if Inventory.Check.Player:HasItem(data.item, data.amount) then
		Callbacks:ServerCallback('Labor:Server:MoneyLaunder:Trade', { item = data.item }, function() end)
	else
		Notification:Error('You do not have the required items.', 1000)
	end
end)