tiredata = {
    arcade = {
        peaktraction = 1.8,  -- Specified in lateral G's, the higher it is
        lateralcurve = 19.5, -- The lower the lateral curve coefficient should be.
        lstractionlossmulti = nil, -- same as in vehdata.lua, if set here, will overwrite what's set there.
        tracitionlossmulti = 1.0,   -- or if either is set to nil, will load from vehdata.lua.
        usesarcadegripvalues = false, -- enable this if your peak traction passes 2 G's (formula 1 cars value.) it will dynamically alter your grip while drifiting
                                     -- to allow drifiting to happen easier, drifting on high peaktraction may not work properly without this.
    },
    simulation = {      -- simulating a entry level tire, good for low hp cars ~ 250 hp or less
        peaktraction = 1.2375,
        lateralcurve = 25.0,
        lstractionlossmulti = 0.15,
        tracitionlossmulti = 1.0,
        usesarcadegripvalues = false,
    }
}

