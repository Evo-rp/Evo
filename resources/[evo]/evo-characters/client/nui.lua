Citizen.CreateThread(function()
	while GetIsLoadingScreenActive() or not HasCollisionLoadedAroundEntity(PlayerPedId()) do
		Citizen.Wait(0)
	end

	SendNUIMessage({type = "APP_SHOW"})
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
		coords = vector4(-452.011, -347.713, 93.668, 6.812),
		animation = {
			anim = 'idle_a',
			animDict = 'anim@mp_player_intupperfind_the_fish',
		}
	},
	{
		coords = vector4(-453.843, -347.466, 93.668, 354.550),
		animation = {
			anim = 'ambclub_12_mi_hi_bootyshake_laz',
			animDict = 'anim@amb@nightclub@lazlow@hi_railing@',
		}
	},
	{
		coords = vector4(-455.399, -347.215, 93.668, 358.231),
		animation = {
			anim = 'dancecrowd_li_11_hu_shimmy_laz',
			animDict = 'anim@amb@nightclub@lazlow@hi_dancefloor@',
		}
	},
	{
		coords = vector4(-456.765, -347.082, 93.668, 354.173),
		animation = {
			anim = 'celebration_idle_f_a',
			animDict = 'anim@mp_celebration@idles@female',
		}
	},
	{
		coords = vector4(-458.671, -346.869, 93.668, 349.038),
		animation = {
			anim = 'idle_a',
			animDict = 'amb@world_human_hang_out_street@female_hold_arm@idle_a',
		}
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
			SetEntityCoords(PlayerPedId(), -455.512, -329.480, 94.675, 0.0, 0.0, 0.0, false)

			local cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", -455.755, -341.990, 95.377, 0, 0, 175.489, 180.00, false, 0)
			SetCamActiveWithInterp(cam2, cam, 1000, true, true)
			RenderScriptCams(true, false, 1, true, true)
			SetCamFov(cam2, 80.0)

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

					if DoesEntityExist(ped) then
						RequestAnimDict(v.animation.animDict)
						while not HasAnimDictLoaded(v.animation.animDict) do 
							Wait(0) 
						end
						TaskPlayAnim(ped, v.animation.animDict, v.animation.anim, 8.0, 8.0, 600000, 1, 1, true, true, true)
					end

					Ped:Preview(ped, tonumber(characters[k].Gender), characters[k].Preview, false, characters[k].GangChain)
					Entity(ped).state.characterIndex = k
					table.insert(peds, ped)
				else
					loadModel(GetHashKey('mp_m_freemode_01'))
					local ped = CreatePed(5, GetHashKey('mp_m_freemode_01'), v.coords, false, true)

					SetEntityAlpha(ped, 0.9, false)
					while not DoesEntityExist(ped) do
						Citizen.Wait(1)
					end

					if DoesEntityExist(ped) then
						RequestAnimDict(v.animation.animDict)
						while not HasAnimDictLoaded(v.animation.animDict) do 
							Wait(0) 
						end
						TaskPlayAnim(ped, v.animation.animDict, v.animation.anim, 8.0, 8.0, 600000, 1, 1, true, true, true)
					end
					

					Entity(ped).state.characterIndex = k
					table.insert(peds, ped)
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

-- RegisterCommand("test", function(character)
-- 	SendNUIMessage({type = "APP_SHOW"})
-- 	TriggerServerEvent('Characters:GetName')
-- 	SetNuiFocus(true,true)

-- end)

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
end)
