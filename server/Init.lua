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

local RequiredResources = {
    'pmc-callbacks',
    'ox_lib',
    'ox_target'
}

local _ThrowError = function (m, c)
    print('^5[Medical]^7 A ^8critical^7 error was encountered: ' .. m .. '^7')
end

local function OnPlayerConnecting(name, setKickReason, defferals)
    local player = source
    if not player then _ThrowError("Failed to get player from connecting event") return end
    Medical.PlayerHandler.SetupPlayer(player)
end

local function Init()
    -- Check for required resources
    for _, value in ipairs(RequiredResources) do
        if not GetResourceState(value) == "started" then
            _ThrowError('Missing required resource: ' .. value, true)
            return
        end
    end

    -- Wait for all modules to load
    Medical.WaitFor('ErrorHandler')
    Medical.WaitFor('Network')
    Medical.WaitFor('PlayerHandler')
    Medical.WaitFor('Threading')

    -- Load _ThrowError function
    _ThrowError = Medical.ErrorHandler.ThrowError

    -- Create callback tables
    Medical.Network.CreateCallbackTables()

    -- Register call backs
    Medical.PlayerHandler.RegisterCallbacks()
    
    -- Add event handlers
    AddEventHandler('playerConnecting', OnPlayerConnecting)

    print("Fully Loaded")
end

Init()

