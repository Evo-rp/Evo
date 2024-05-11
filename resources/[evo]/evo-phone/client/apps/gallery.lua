RegisterNUICallback('Phone:Gallery:GetImages', function(data, cb)
    cb(LocalPlayer.state.Character:GetData("GALLERY"))
end)

RegisterNUICallback('Phone:Gallery:DeleteImage', function(data, cb)
    Callbacks:ServerCallback('Phone:Gallery:DeleteImage', {
        images = LocalPlayer.state.Character:GetData("GALLERY"),
        image = data.image
    })

    cb(true)
end)

local TAKING_PHOTO = false
local FRONT_CAM = false
local COOLDOWN = false

RegisterNUICallback('Phone:Gallery:TakePhoto', function(data, cb)
    Notification:Info('[Enter] To take Photo | [ESC] To Cancel | [MMB] To swap modes')

	Phone:Close(true)
    CreateMobilePhone(1)
    CellCamActivate(true, true)
    TAKING_PHOTO = true
    Wait(0)

    while TAKING_PHOTO do
        Wait(0)
        if IsControlJustPressed(1, 27) then -- Toogle Mode
            FRONT_CAM = not FRONT_CAM
            Citizen.InvokeNative(0x2491A93618B7D838, FRONT_CAM)
        elseif IsControlJustPressed(1, 177) then -- CANCEL
            CellCamActivate(false, false)
            DestroyMobilePhone()
            TAKING_PHOTO = false
            break
        elseif IsControlJustPressed(1, 176) and TAKING_PHOTO then -- TAKE.. PIC
            exports['screenshot-basic']:requestScreenshotUpload("https://discord.com/api/webhooks/1238656303740751992/2Ve4DvL0rqXBKif_MPvuEwX16jc990W2vFXy_O-a0bfcnNX5JNs0-tFImNtW31I6ageD", 'files[]', function(data)
                local image = json.decode(data)

                COOLDOWN = true

                CellCamActivate(false, false)
                DestroyMobilePhone()
                TAKING_PHOTO = false

                Callbacks:ServerCallback('Phone:Gallery:NewImage', {
                    images = LocalPlayer.state.Character:GetData("GALLERY"),
                    image = image.attachments[1].proxy_url
                })
            end);

            Wait(1500)
            COOLDOWN = false
        end
    end
end)