AddEventHandler("Phone:Server:RegisterCallbacks", function()
    Callbacks:RegisterServerCallback('Phone:Gallery:NewImage', function(source, data, cb)
		local char = Fetch:Source(source):GetData("Character")

        table.insert(data.images, {
            image = data.image
        })
        
        char:SetData("GALLERY", data.images)

        cb(true)
    end)

    Callbacks:RegisterServerCallback('Phone:Gallery:DeleteImage', function(source, data, cb)
        local char = Fetch:Source(source):GetData("Character")
        
        for k, v in ipairs(data.images) do
            if v.image == data.image then
                table.remove(data.images, k)
            end
        end

        char:SetData("GALLERY", data.images)

        cb(true)
    end)
end)

AddEventHandler('Phone:Server:RegisterMiddleware', function()
    Middleware:Add("Characters:Creating", function(source, cData)
        return {{ GALLERY = {} }}
    end)

    Middleware:Add('Characters:Spawning', function(source)
        local char = Fetch:Source(source):GetData("Character")
        local config = char:GetData("GALLERY")
        if not config then
            char:SetData("GALLERY", {})
        end
    end)
end)