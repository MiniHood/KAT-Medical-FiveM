Medical = Medical or {}

Medical.LoadedModules = Medical.LoadedModules or {}
Medical.ConfirmLoaded = function (key)
    table.insert(Medical.LoadedModules, key)
end
Medical.IsLoaded = function (key)
    for _, value in ipairs(Medical.LoadedModules) do
        if value == key then return true end
    end
    return false
end
Medical.WaitFor = function(key)
    local source = debug.getinfo(2, "S").source
    local filename = string.match(source, "([^/]+)%.lua$")
    while not Medical.IsLoaded(key) do
        print('^5[Medical]^7 <Client> ' .. (filename .. '.lua' or "unknown") .. ' is waiting for module: ^3' .. key .. '^7')
        Wait(0)
    end
    print('^5[Medical]^7 Module Loaded: ^2' .. key .. '^7 by ' .. (filename..'.lua' or 'unknown'))
    return Medical[key]
end

local function Init()

    -- Wait for all modules to load
    Medical.WaitFor('ErrorHandler')
    Medical.WaitFor('Network')
    Medical.WaitFor('PlayerHandler')
    Medical.WaitFor('Threading')
    Medical.WaitFor('HitDetection')
    Medical.WaitFor('BloodPressure')
    Medical.WaitFor('Glucose')
    Medical.WaitFor('Heart')
    Medical.WaitFor('Respiration')
    Medical.WaitFor('Tempature')
    Medical.WaitFor('Oxygen')
    Medical.WaitFor('Pain')

    AddEventHandler('onClientResourceStop', function(rN)
        if not rN == GetCurrentResourceName() then return end

        -- TODO: Add full clean up for everything
        Medical.Threading.TerminateAllThreads()
    end)

    -- Now for base plate modules
    Medical.HitDetection.FillBones()
    Medical.HitDetection.FillWeaponHashes()
    Medical.HitDetection.FillAmmunationInformation()
    Medical.HitDetection.FillWeaponInformation()
    Medical.HitDetection.SetupEvents()
end

Init()
