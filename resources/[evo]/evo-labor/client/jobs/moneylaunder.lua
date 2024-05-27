AddEventHandler("Labor:Client:Setup", function()
    PedInteraction:Add("MoneylaunderPed", `a_m_m_farmer_01`, vector4(561.593, -1747.369, 33.443, 156.413), 63.569, 25.0, {
		{
			icon = "hand-holding",
			text = "Interact",
			event = "Labor:Client:MoneyLaunder:SpeakToPed",
		},
	}, 'money-check-dollar-pen', 'WORLD_HUMAN_CLIPBOARD')
end)

AddEventHandler('Labor:Client:MoneyLaunder:SpeakToPed', function(data)
    NPCDialog.Open(data.entity, {
		first_name = 'npcData[param.name].first_name',
		last_name = 'npcData[param.name].last_name',
		Tag = '💸',
		description = 'npcData[param.name].description',
		buttons = {
			{
				label = 'Open Shop',
				data = {
					close = true,
					event = 'Shop:Client:OpenShopNPC',
					params = {
						id = param.id
					}
				}
			},
			{
				label = 'See you later !',
				data = { close = true }
			}
		}
	})
end)