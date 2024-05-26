local interiors = {
    {
        ipl = '3dp_snrbuns_milo', -- snrbuns
        coords = { x=-515.792969, y=-706.0899, z=38.7752 },
        entitySets = {
            { name = 'shutter01', enable = true },
            { name = 'shutter02', enable = true },
            { name = 'shutter03', enable = true },
            { name = 'shutter04', enable = true },
            { name = 'shutter05', enable = true },
            { name = 'shutter06', enable = true },
            { name = 'shutter07', enable = true },
            { name = 'shutter08', enable = true },
            { name = 'shutter09', enable = true },
            { name = 'shutter10', enable = true },
            { name = 'pizza', enable = false },
            { name = 'coffee', enable = false },
            { name = 'hotdog', enable = false },
            { name = 'sushi', enable = false },
            { name = 'smoothie', enable = false },
            { name = 'burger', enable = false },
            { name = 'sandwich', enable = false },
            { name = 'kebab', enable = false },
            { name = 'taco', enable = false },
            { name = 'noodle', enable = false },
        }
    },
   
}

CreateThread(function()
    for _, interior in ipairs(interiors) do
        if not interior.ipl or not interior.coords or not interior.entitySets then
            return
        end
        RequestIpl(interior.ipl)
        local interiorID = GetInteriorAtCoords(interior.coords.x, interior.coords.y, interior.coords.z)
        if IsValidInterior(interiorID) then
            for __, entitySet in ipairs(interior.entitySets) do
                if entitySet.enable then
                    EnableInteriorProp(interiorID, entitySet.name)
                else
                    DisableInteriorProp(interiorID, entitySet.name)
                end
            end
            RefreshInterior(interiorID)
        end
    end
end)