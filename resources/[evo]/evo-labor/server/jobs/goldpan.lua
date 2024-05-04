
AddEventHandler('Labor:Server:Startup', function()
    Callbacks:RegisterServerCallback("Bucket:GetReward", function(source, data, cb)
        local char = Fetch:Source(source):GetData("Character")
        Inventory:AddItem(char:GetData("SID"), "gravel", math.random(3,5), {}, 1)
    end)
end)

AddEventHandler('Labor:Server:Startup', function()
    Callbacks:RegisterServerCallback("Goldpan:GetReward", function(source, data, cb)
        local char = Fetch:Source(source):GetData("Character")
        Inventory:AddItem(char:GetData("SID"), "goldnugget", math.random(2,5), {}, 1)
        Inventory.Items:Remove(char:GetData("SID"), 1, "gravel", 5)
    end)
end)


AddEventHandler('Labor:Server:Startup', function()
    Callbacks:RegisterServerCallback("Smelting:GetReward", function(source, data, cb)
        local char = Fetch:Source(source):GetData("Character")
        Inventory:AddItem(char:GetData("SID"), "goldbar", math.random(1,2), {}, 1)
        Inventory.Items:Remove(char:GetData("SID"), 1, "goldnugget", 20)
    end)
end)