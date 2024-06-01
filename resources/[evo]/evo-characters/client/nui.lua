Citizen.CreateThread(function()
	while GetIsLoadingScreenActive() or not HasCollisionLoadedAroundEntity(PlayerPedId()) do
		Citizen.Wait(0)
	end

	SendNUIMessage({type = "APP_SHOW"})
	DisplayRadar(false)
end)

function loadModel(model)
	if IsModelInCdimage(model) then
		while not HasModelLoaded(model) do
			RequestModel(model)
			Citizen.Wait(5)
		end
	end
end

local previews = {
	{
		coords = vector4(-3965.796, 2068.584, 496.51, 60.0),
	},
	{
		coords = vector4(-3965.542, 2066.99, 496.51, 45.0),
	},
	{
		coords = vector4(-3966.36, 2066.042, 496.51, 35.0),
	},
	{
		coords = vector4(-3966.954, 2065.124, 496.51, 31.0),
	},
	{
		coords = vector4(-3968.297, 2064.551, 496.51, 17.0),
	},
	{
		coords = vector4(-3969.694, 2064.037, 496.51, 4.0),
	},
	{
		coords = vector4(-3970.917, 2065.034, 496.51, 349.0),
	}
}

local peds = {}

RegisterNUICallback("GetData", function(data, cb)
	selectingCharacter = true
	cb("ok")

	while LocalPlayer.state.ID == nil do
		Citizen.Wait(1)
	end

	for k, v in ipairs(peds) do
		DeleteEntity(v)
	end

	Callbacks:ServerCallback("Characters:GetServerData", {}, function(serverData)
		SendNUIMessage({
			type = "LOADING_SHOW",
			data = { message = "Getting Character Data" },
		})
		
		Callbacks:ServerCallback("Characters:GetCharacters", {}, function(characters)
			SetEntityCoordsNoOffset(PlayerPedId(), vector3(-3972.28, 2017.22, 500.92), false, false, false, false)

			cam2 = CreateCam('DEFAULT_SCRIPTED_CAMERA', true);
			SetCamRot(cam2, 0.0, 0.0, 207.829, 2);
			SetCamCoord(cam2, -3970.787, 2071.767, 498.14);
			StopCamShaking(cam2, true);
			SetCamFov(cam2, 47.0);
			SetCamActive(cam2, true);
			RenderScriptCams(true, false, 0, true, true);

			TransitionFromBlurred(500)
			DestroyCam(cam)
			cam = cam2

			for k, v in ipairs(previews) do
				if characters[k] and characters[k].Preview then
					loadModel(GetHashKey(characters[k].Preview.model))

					local ped = CreatePed(5, GetHashKey(characters[k].Preview.model), v.coords, false, true)

					while not DoesEntityExist(ped) do
						Citizen.Wait(1)
					end

					Ped:Preview(ped, tonumber(characters[k].Gender), characters[k].Preview, false, characters[k].GangChain)
					Entity(ped).state.characterIndex = k
					table.insert(peds, ped)

					FreezeEntityPosition(ped, true)
				else
					loadModel(GetHashKey('mp_m_freemode_01'))
					local ped = CreatePed(5, GetHashKey('mp_m_freemode_01'), v.coords, false, true)

					SetEntityAlpha(ped, 0.9, false)
					while not DoesEntityExist(ped) do
						Citizen.Wait(1)
					end

					Entity(ped).state.characterIndex = k
					table.insert(peds, ped)

					FreezeEntityPosition(ped, true)
				end

				SetEntityCoords(ped, previews[k][1], previews[k][2], previews[k][3], 0.0, 0.0, 0.0, false)
				FreezeEntityPosition(ped, true)
			end

			exports["evo-base"]:FetchComponent("Spawn"):hitCharacterThread()

			SendNUIMessage({
				type = "SET_DATA",
				data = { changelog = serverData.changelog, motd = serverData.motd, characters = characters },
			})
			SendNUIMessage({ type = "LOADING_HIDE" })
			SendNUIMessage({
				type = "SET_STATE",
				data = { state = "STATE_CHARACTERS" },
			})
		end)
	end)
end)

RegisterNUICallback("CreateCharacter", function(data, cb)
	cb("ok")
	Callbacks:ServerCallback("Characters:CreateCharacter", data, function(character)
		if character ~= nil then
			SendNUIMessage({
				type = "CREATE_CHARACTER",
				data = { character = character },
			})
		end

		SendNUIMessage({
			type = "SET_STATE",
			data = { state = "STATE_CHARACTERS" },
		})
		SendNUIMessage({ type = "LOADING_HIDE" })
	end)
end)

RegisterNUICallback("DeleteCharacter", function(data, cb)
	cb("ok")
	exports["evo-base"]:FetchComponent("Spawn").Deleting = true
	Callbacks:ServerCallback("Characters:DeleteCharacter", data.id, function(status)
		if status then
			SendNUIMessage({
				type = "DELETE_CHARACTER",
				data = { id = data.id },
			})
		end
		SendNUIMessage({ type = "LOADING_HIDE" })
	end)
end)

RegisterNUICallback("SelectCharacter", function(data, cb)
	cb("ok")
	Callbacks:ServerCallback("Characters:GetSpawnPoints", data.id, function(spawns)
		if spawns then
			SendNUIMessage({
				type = "SET_SPAWNS",
				data = { spawns = spawns },
			})
			SendNUIMessage({
				type = "SET_STATE",
				data = { state = "STATE_SPAWN" },
			})
		end

		SendNUIMessage({ type = "LOADING_HIDE" })
	end)

	DestroyCam(cam)

	SetEntityCoordsNoOffset(PlayerPedId(), vector3(-3972.28, 2017.22, 500.92), false, false, false, false)

	FreezeEntityPosition(PlayerPedId(), true)

	while not HasCollisionLoadedAroundEntity(PlayerPedId()) do
		Wait(0)
	end

	cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)

	SetCamRot(cam, -90.0, 0.0, 250.0, 2)
	SetCamCoord(cam, -3968.85, 2015.93, 502.22)
	StopCamShaking(cam, true)
	SetCamFov(cam, 50.0)
	SetCamActive(cam, true)
	RenderScriptCams(true, false, 0, true, true)
end)

RegisterNUICallback("PlayCharacter", function(data, cb)
	cb("ok")
	selectingCharacter = false
	Callbacks:ServerCallback("Characters:GetCharacterData", data.character.ID, function(cData)
		cData.spawn = data.spawn
		TriggerEvent("Characters:Client:SetData", -1, cData, function()
			exports["evo-base"]:FetchComponent("Spawn"):SpawnToWorld(cData, function()
				LocalPlayer.state.canUsePhone = true
				if data.spawn.event ~= nil then
					Callbacks:ServerCallback(data.spawn.event, data.spawn, function()
						LocalPlayer.state.Char = cData.ID
						TriggerServerEvent("Characters:Server:Spawning")
					end)
				else
					LocalPlayer.state.Char = cData.ID
					TriggerServerEvent("Characters:Server:Spawning")
				end
			end)
		end)

		for k, v in ipairs(peds) do
			DeleteEntity(v)
		end
	end)
end)

RegisterNetEvent("Characters:Client:Spawned", function()
	TriggerEvent("Characters:Client:Spawn")
	TriggerServerEvent("Characters:Server:Spawn")
	SetNuiFocus(false)
	SendNUIMessage({ type = "APP_HIDE" })
	SendNUIMessage({ type = "LOADING_HIDE" })
	LocalPlayer.state.loggedIn = true
	Notification:Success("Tax is set to 15% Across Retail", 3500)
end)
