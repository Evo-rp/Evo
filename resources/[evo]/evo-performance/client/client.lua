AddEventHandler('Performace:Shared:DependencyUpdate', RetrieveComponents)
function RetrieveComponents()
    Notification = exports['evo-base']:FetchComponent('Notification')
end

AddEventHandler('Core:Shared:Ready', function()
    exports['evo-base']:RequestDependencies('Performace', {
        'Notification',
    }, function(error)
        if #error > 0 then return; end
        RetrieveComponents()
    end)
end)

local function getFieldFromHandling(vehicle, field)
    return GetVehicleHandlingFloat(vehicle, 'CHandlingData', field)
end

local function getVehicleFromVehList(vehList, hash)
    for _, v in pairs(vehList) do
        if hash == v.hash then
            return v.name, v.brand
        end
    end
end

function getVehicleInfo(vehicle)
    local model = GetEntityModel(vehicle)
    local vehicleModel, vehicleBrand = '', ''

    local fInitialDriveMaxFlatVel = getFieldFromHandling(vehicle, "fInitialDriveMaxFlatVel")
    local fInitialDriveForce = getFieldFromHandling(vehicle, "fInitialDriveForce")
    local fClutchChangeRateScaleUpShift = getFieldFromHandling(vehicle, "fClutchChangeRateScaleUpShift")
    local nInitialDriveGears = getFieldFromHandling(vehicle, "nInitialDriveGears")
    local fDriveBiasFront = getFieldFromHandling(vehicle, "fDriveBiasFront")
    local fInitialDragCoeff = getFieldFromHandling(vehicle, "fInitialDragCoeff")
    local fTractionCurveMax = getFieldFromHandling(vehicle, "fTractionCurveMax")
    local fTractionCurveMin = getFieldFromHandling(vehicle, "fTractionCurveMin")
    local fLowSpeedTractionLossMult = getFieldFromHandling(vehicle, "fLowSpeedTractionLossMult")
    local fTractionBiasFront = getFieldFromHandling(vehicle, "fTractionBiasFront")
    local fTractionLossMult = getFieldFromHandling(vehicle, "fTractionLossMult")
    local fSuspensionReboundDamp = getFieldFromHandling(vehicle, "fSuspensionReboundDamp")
    local fSuspensionCompDamp = getFieldFromHandling(vehicle, "fSuspensionCompDamp")
    local fAntiRollBarForce = getFieldFromHandling(vehicle, "fAntiRollBarForce")
    local fBrakeForce = getFieldFromHandling(vehicle, "fBrakeForce")
    local fBrakeBiasFront = getFieldFromHandling(vehicle, "fBrakeBiasFront")
    local fHandBrakeForce = getFieldFromHandling(vehicle, "fHandBrakeForce")
    local drivetrain = 0.0
    if fDriveBiasFront > 0.5 then
        -- fwd
        drivetrain = 1.0 - fDriveBiasFront
    else
        -- rwd
        drivetrain = fDriveBiasFront
    end

    local score = {
        accel = 0.0,
        speed = 0.0,
        handling = 0.0,
        braking = 0.0,
        drivetrain = 0.0
    }

    score.drivetrain = drivetrain

    local force = fInitialDriveForce
    if fInitialDriveForce > 0 and fInitialDriveForce < 1 then
        force = (force + drivetrain * 0.15) * 1.4
    end

    -- SPEED -- 
    local speedScore = ((fInitialDriveMaxFlatVel / fInitialDragCoeff) * (fTractionCurveMax + fTractionCurveMin)) / 40
    score.speed = speedScore

    -- ACCELERATION -- 
    local accelScore = (fInitialDriveMaxFlatVel * force + (fClutchChangeRateScaleUpShift * 0.7)) / 10
    score.accel = accelScore

    -- HANDLING -- 
    local lowSpeedTraction = 1.0
    if fLowSpeedTractionLossMult >= 1.0 then
        lowSpeedTraction = lowSpeedTraction + (fLowSpeedTractionLossMult - lowSpeedTraction) * 0.15
    else
        lowSpeedTraction = lowSpeedTraction - (lowSpeedTraction - fLowSpeedTractionLossMult) * 0.15
    end
    local handlingScore = (fTractionCurveMax + (fSuspensionReboundDamp + fSuspensionCompDamp + fAntiRollBarForce) / 3) +
                              (fTractionCurveMin / lowSpeedTraction - fTractionBiasFront * 3) + drivetrain
    score.handling = handlingScore

    -- BRAKING -- 
    local brakingScore = ((fBrakeBiasFront) + fBrakeForce + fHandBrakeForce) * 4
    score.braking = brakingScore

    if Config.Debug then
        print('=====' .. vehicleModel .. '=====')
        print('accel', accelScore)
        print('speed', speedScore)
        print('handling', handlingScore)
        print('braking', brakingScore)
        print('drivetrain', drivetrain)
    end

    vehicleModel = string.lower(GetDisplayNameFromVehicleModel(model))
    vehicleBrand = GetMakeNameFromVehicleModel(model)
    
    -- Balance -- 
    local balance = Config.Balance

    -- calculate performance
    local peformanceScore = math.floor(((accelScore * balance.acceleration) + (speedScore * balance.speed) +
                                           (handlingScore * balance.handling) + (brakingScore * balance.braking)) *
                                           balance.ratingMultiplier)

    if Config.Debug then
        print('PerfRating: ', peformanceScore)
    end

    -- Get class --
    local class = "D"

    local vehicleClass = GetVehicleClass(vehicle)

    if vehicleClass ~= 8 then
        if peformanceScore > 900 then
            class = "X"
        elseif peformanceScore > 775 then
            class = "S+"
        elseif peformanceScore > 700 then
            class = "S"
        elseif peformanceScore > 650 then
            class = "A+"
        elseif peformanceScore > 600 then
            class = "A"
        elseif peformanceScore > 550 then
            class = "B+"
        elseif peformanceScore > 500 then
            class = "B"
        elseif peformanceScore > 450 then
            class = "C+"
        elseif peformanceScore > 400 then
            class = "C"
        elseif peformanceScore > 350 then
            class = "D+"
        elseif peformanceScore > 300 then
            class = "D"
        end
    else
        if peformanceScore > 500 then
            class = "M+"
        elseif peformanceScore > 300 or peformanceScore < 301 then
            class = "M"
        end
    end

    return score, class, peformanceScore, vehicleModel, vehicleBrand
end

RegisterNetEvent('evo-performance:client:checkClient', function()
    local veh = GetVehiclePedIsIn(PlayerPedId())

    local info, class, perfRating = getVehicleInfo(veh)

    return info, class, perfRating
end)

RegisterNetEvent('evo-performance:client:CheckPerformance', function()
    local veh = GetVehiclePedIsIn(PlayerPedId())

    if veh == 0 then
        Notification:Error("Not in a vehicle")
    else
        local info, class, perfRating = getVehicleInfo(veh)
        Notification:Info("This car is  " .. class .. " " .. perfRating)
    end
end)

exports("checkPerformance", function(veh)
    local info, class, perfRating = getVehicleInfo(veh)

    return info, class, perfRating
end)

local lastVehicle = nil

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        local vehicle = GetVehiclePedIsIn(PlayerPedId(-1), false)
        if DoesEntityExist(vehicle) and GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() and lastVehicle ~= vehicle then
            lastVehicle = vehicle
            local info, class, perfRating = exports['evo-performance']:checkPerformance(vehicle)
            local model = GetEntityModel(vehicle)
            local vehicleModel = string.lower(GetDisplayNameFromVehicleModel(model))
            print("setting vehicle max speed to: ", Config.MaxSpeed[class] / 2.23694)
            SetVehicleMaxSpeed(vehicle, Config.MaxSpeed[class] / 2.23694)
        end
    end
end)
