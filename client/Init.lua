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
    while not Medical.IsLoaded(key) do
        print('^5[Medical]^7 Waiting for module: ^3' .. key .. '^7')
        Wait(0)
    end
    print('^5[Medical]^7 Module Loaded: ^2' .. key .. '^7')
end
local function Init()

    -- Wait for all modules to load
    Medical.WaitFor('ErrorHandler')
    Medical.WaitFor('Network')
    Medical.WaitFor('PlayerHandler')
    Medical.WaitFor('Threading')

    AddEventHandler('onClientResourceStop', function(rN)
        if not rN == GetCurrentResourceName() then return end

        -- TODO: Add full clean up for everything
        Medical.Threading.TerminateAllThreads()
    end)
end

Init()
