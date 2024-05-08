Characters = nil

AddEventHandler("Characters:Shared:DependencyUpdate", RetrieveComponents)
function RetrieveComponents()
	Callbacks = exports["evo-base"]:FetchComponent("Callbacks")
	Characters = exports["evo-base"]:FetchComponent("Characters")
	Action = exports["evo-base"]:FetchComponent("Action")
	Ped = exports["evo-base"]:FetchComponent("Ped")
	Notification = exports["evo-base"]:FetchComponent("Notification")
end

AddEventHandler("Core:Shared:Ready", function()
	exports["evo-base"]:RequestDependencies("Characters", {
		"Callbacks",
		"Characters",
		"Action",
		"Ped",
		"Notification"
	}, function(error)
		if #error > 0 then
			return
		end
		RetrieveComponents()
	end)
end)

AddEventHandler("Characters:Client:Spawn", function()
	Characters:Update()
end)

RegisterNetEvent("Characters:Client:SetData", function(key, data, cb)
	if key ~= -1 then
        LocalPlayer.state.Character:SetData(key, data)
	else
        LocalPlayer.state.Character = exports["evo-base"]:FetchComponent("DataStore"):CreateStore(1, "Character", data)
	end
    
    exports["evo-base"]:FetchComponent("Player").LocalPlayer:SetData("Character", LocalPlayer.state.Character)
	TriggerEvent("Characters:Client:Updated", key)

	if cb then
		cb()
	end
end)

CHARACTERS = {
	Updating = true,
	Logout = function(self)
		Callbacks:ServerCallback("Characters:Logout", {}, function()
			LocalPlayer.state.Char = nil
			LocalPlayer.state.Character = nil
			LocalPlayer.state.loggedIn = false
			Action:Hide()
			exports["evo-base"]:FetchComponent("Spawn"):InitCamera()
			SendNUIMessage({
				type = "APP_RESET",
			})
			Citizen.Wait(500)
			exports["evo-base"]:FetchComponent("Spawn"):Init()
		end)
	end,
	Update = function(self)
		Citizen.CreateThread(function()
			while self.Updating do
				TriggerServerEvent("Characters:Server:StoreUpdate")
				Citizen.Wait(180000)
			end
		end)
	end,
}

AddEventHandler("Proxy:Shared:RegisterReady", function()
	exports["evo-base"]:RegisterComponent("Characters", CHARACTERS)
end)
