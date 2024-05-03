local cam = nil
selectingCharacter = false
Deleting = false

Spawn = {
	InitCamera = function(self)
		-- TransitionToBlurred(500)
		DoScreenFadeOut(500)
		cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 711.081, 1210.714, 368.527, -21.929, 0.00, 160.00, 100.00, false, 0)
		SetCamActiveWithInterp(cam, true, 900, true, true)
		RenderScriptCams(true, false, 1, true, true)
		DisplayRadar(false)
	end,

	Init = function(self)
		local ped = PlayerPedId()
		SetEntityCoords(ped, 711.081, 1197.714, 348.527)
		FreezeEntityPosition(ped, true)
		SetEntityVisible(ped, false)
		DoScreenFadeIn(500)
		Citizen.Wait(500) -- Why the fuck does NUI just not do this without a wait here???
		SetNuiFocus(true, true)
	end,

	SpawnToWorld = function(self, data, cb)
		DoScreenFadeOut(500)

		DestroyCam(SpawnCam)

		while not IsScreenFadedOut() do
			Citizen.Wait(10)
		end

		local player = PlayerPedId()
		SetTimecycleModifier("default")

		local model = `mp_f_freemode_01`
		if tonumber(data.Gender) == 0 then
			model = `mp_m_freemode_01`
		end

		RequestModel(model)

		while not HasModelLoaded(model) do
			Citizen.Wait(500)
		end
		SetPlayerModel(PlayerId(), model)
		player = PlayerPedId()
		SetPedDefaultComponentVariation(player)
		SetEntityAsMissionEntity(player, true, true)
		SetModelAsNoLongerNeeded(model)

		Citizen.Wait(300)

		DestroyAllCams(true)
		RenderScriptCams(false, true, 1, true, true)
		FreezeEntityPosition(player, false)

		NetworkSetEntityInvisibleToNetwork(player, false)
		SetEntityVisible(player, true)
		FreezeEntityPosition(player, false)

		cam = nil

		SetPlayerInvincible(PlayerId(), false)
		SetCanAttackFriendly(player, true, true)
		NetworkSetFriendlyFireOption(true)

		SetEntityMaxHealth(PlayerPedId(), 200)
		SetEntityHealth(PlayerPedId(), data.HP > 100 and data.HP or 200)
		DisplayHud(true)

		if data.action ~= nil then
			TriggerEvent(data.action, data.data)
		else
			SetEntityCoords(player, data.spawn.location.x, data.spawn.location.y, data.spawn.location.z)
			FreezeEntityPosition(PlayerPedId(), false)
			DoScreenFadeIn(500)
		end

		SetFocusEntity(PlayerPedId())

		LocalPlayer.state.ped = player

		SetNuiFocus(false)

		-- TransitionFromBlurred(500)
		cb()
	end,

	hitCharacterThread = function(self)
		CreateThread(function()
			while selectingCharacter do
				Wait(5)

				DisableAllControlActions(0)

				EnableControlAction(0, 1, true)
				EnableControlAction(0, 2, true)

				local screenX = GetDisabledControlNormal(0, 239)
				local screenY = GetDisabledControlNormal(0, 240)

				local world, normal = GetWorldCoordFromScreenCoord(screenX, screenY)

				local depth = 10

				local target = world + normal * depth

				local camPos = IsGameplayCamRendering() and GetGameplayCamCoord() or GetCamCoord(GetRenderingCam())
				local ray = StartShapeTestRay(
					camPos.x,
					camPos.y,
					camPos.z,
					target.x,
					target.y,
					target.z,
					8,
					0,
					0
				)

				local _, hit, _, _, entity = GetShapeTestResult(ray)

				if hit and not Deleting then
				    if entity and DoesEntityExist(entity) and IsEntityAPed(entity) then
				        lastHit = entity
				    end
				end

				if lastHit then
					local uiCoordinates = GetWorldPositionOfEntityBone(lastHit, GetEntityBoneIndexByName(lastHit, "BONETAG_HEAD"))

					local visible, screenX, screenY = GetScreenCoordFromWorldCoord(uiCoordinates.x, uiCoordinates.y, uiCoordinates.z)

					if visible then
						currentIndex = Entity(lastHit).state.characterIndex

						if currentIndex then
							SendNUIMessage({
							    type = "SET_CHARACTER_DATA",
							    data = {
							        index = currentIndex - 1,

							        x = screenX,
							        y = screenY
							    }
							})
						end
					end
				end
			end
		end)
	end,
}

AddEventHandler("Proxy:Shared:RegisterReady", function()
	exports["evo-base"]:RegisterComponent("Spawn", Spawn)
end)