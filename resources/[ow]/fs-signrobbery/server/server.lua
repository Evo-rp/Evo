local objects = {}

AddEventHandler("Labor:Shared:DependencyUpdate", RetrieveComponents)
function RetrieveComponents()
    Fetch = exports["fs-base"]:FetchComponent("Fetch")
	Callbacks = exports["fs-base"]:FetchComponent("Callbacks")
	Inventory = exports["fs-base"]:FetchComponent("Inventory")
end

AddEventHandler("Core:Shared:Ready", function()
	exports["fs-base"]:RequestDependencies("Labor", {
        "Fetch",
		"Callbacks",
		"Inventory",
	}, function(error)
		if #error > 0 then
			return
		end -- Do something to handle if not all dependencies loaded
		RetrieveComponents()
		RegisterCallbacks()
        RegisterInv()
	end)
end)

function RegisterCallbacks()
	Callbacks:RegisterServerCallback("fs-signrobbery:server:GetObjects", function(source, cb)
		cb(objects)
	end)
end

RegisterNetEvent('fs-signrobbery:server:delete')
AddEventHandler('fs-signrobbery:server:delete', function(object)
    local src = source
    local player = exports["fs-base"]:FetchComponent("Fetch"):Source(source)
	local char = player:GetData("Character")
    local sourceCoords = GetEntityCoords(GetPlayerPed(src))
    if #(sourceCoords - object.coords) < 4 then
        objects[#objects+1] = {coords = object.coords, model = object.model}
        TriggerClientEvent("signrobbery:client:delete", -1, object)
        if object.model == -949234773 then --done
            Inventory:AddItem(char:GetData("SID"), 'stopsign', 1, {}, 1)
        elseif object.model == 1502931467 then --done
            Inventory:AddItem(char:GetData("SID"), 'walkingmansign', 1, {}, 1)
        elseif object.model == 1191039009 then --done
            Inventory:AddItem(char:GetData("SID"), 'dontblockintersectionsign', 1, {}, 1)
        elseif object.model == 4138610559 then
            Inventory:AddItem(char:GetData("SID"), 'uturnsign', 1, {}, 1)
        elseif object.model == 3830972543 then
            Inventory:AddItem(char:GetData("SID"), 'noparkingsign', 1, {}, 1)
        elseif  object.model == 2643325436 then
            Inventory:AddItem(char:GetData("SID"), 'leftturnsign', 1, {}, 1)
		elseif  object.model == 793482617 then
            Inventory:AddItem(char:GetData("SID"), 'rightturnsign', 1, {}, 1)
		elseif  object.model == 1021214550 then
            Inventory:AddItem(char:GetData("SID"), 'notrespassingsign', 1, {}, 1)
		elseif  object.model == 3654973172 then
            Inventory:AddItem(char:GetData("SID"), 'yieldsign', 1, {}, 1)
		end
	end
end)

---------------------
--- Usable Signs ----
---------------------
function RegisterInv()
    Inventory.Items:RegisterUse("stopsign","Sign", function(source, item)
        local src = source
        local char = Fetch:Source(source):GetData("Character")
        TriggerClientEvent('fs-signrobbery:use:StopSign', src, item)
    end)

    Inventory.Items:RegisterUse("walkingmansign","Sign", function(source, item)
    local src = source
    local Player =Fetch:Source(source):GetData("Character")
    TriggerClientEvent('fs-signrobbery:use:WalkingManSign', src, item)
    end)

    Inventory.Items:RegisterUse("dontblockintersectionsign","Sign", function(source, item)
    local src = source
    local Player =Fetch:Source(source):GetData("Character")
    TriggerClientEvent('fs-signrobbery:use:DontBlockIntersectionSign', src, item)
    end)

    Inventory.Items:RegisterUse("uturnsign","Sign", function(source, item)
    local src = source
    local Player =Fetch:Source(source):GetData("Character")
    TriggerClientEvent('fs-signrobbery:use:UturnSign', src, item)
    end)

    Inventory.Items:RegisterUse("noparkingsign","Sign", function(source, item)
    local src = source
    local Player =Fetch:Source(source):GetData("Character")
    TriggerClientEvent('fs-signrobbery:use:NoParkingSign', src, item)
    end)

    Inventory.Items:RegisterUse("leftturnsign","Sign", function(source, item)
    local src = source
    local Player =Fetch:Source(source):GetData("Character")
    TriggerClientEvent('fs-signrobbery:use:LeftTurnSign', src, item)
    end)

    Inventory.Items:RegisterUse("rightturnsign","Sign", function(source, item)
    local src = source
    local Player =Fetch:Source(source):GetData("Character")
    TriggerClientEvent('fs-signrobbery:use:RightTurnSign', src, item)
    end)

    Inventory.Items:RegisterUse("notrespassingsign","Sign", function(source, item)
    local src = source
    local Player =Fetch:Source(source):GetData("Character")
    TriggerClientEvent('fs-signrobbery:use:NoTrespassingSign', src, item)
    end)

    Inventory.Items:RegisterUse("yieldsign","Sign", function(source, item)
    local src = source
    local Player =Fetch:Source(source):GetData("Character")
    TriggerClientEvent('fs-signrobbery:use:YieldSign', src, item)
    end)
end

