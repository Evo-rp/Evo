local _houseLocs = {
	{
		coords = vector3(-463.675, -1734.908, 18.804),
		heading = 88.629,
	},
}

local rando = _houseLocs[math.random(#_houseLocs)]
local _locations = {
	houseRobbery = rando,
	oxy = _oxyStarts[tostring(os.date("%w"))],
	corner = {
		coords = vector3(703.286, -1210.108, 26.582),
		heading = 129.002,
	},
}

AddEventHandler("onResourceStart", function(resource)
	if resource == GetCurrentResourceName() then
		Citizen.Wait(20)
		TriggerClientEvent("Labor:Client:GetLocs", -1, _locations)
	end
end)

AddEventHandler("Queue:Server:SessionActive", function(source, data)
	TriggerClientEvent("Labor:Client:GetLocs", source, _locations)
end)
