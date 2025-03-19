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
        print('^5[Medical]^7 <Server> ' .. (filename .. '.lua' or "unknown") .. ' is waiting for module: ^3' .. key .. '^7')
        Wait(0)
    end
    print('^5[Medical]^7 Module Requested: ^2' .. key .. '^7 by ' .. (filename..'.lua' or 'unknown'))
    return Medical[key]
end

local SetupEventHandlers = function ()
    for _, value in ipairs(Medical.Network.EventHandlers) do
        RegisterServerEvent(value[1])
        AddEventHandler(value[1], value[2])
    end
end

local RequiredResources = {
    'pmc-callbacks',
    'ox_lib',
    'ox_target'
}

local _ThrowError = function (m, c)
    print('^5[Medical]^7 A ^8critical^7 error was encountered: ' .. m .. '^7')
end

local function OnPlayerJoining(name, setKickReason, defferals)
    local player = source
    if not player then _ThrowError("Failed to get player from OnPlayerJoining event") return end
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
    Medical.WaitFor('HitDetection')

    -- Load _ThrowError function
    _ThrowError = Medical.ErrorHandler.ThrowError

    -- Setup networking 
    Medical.Network.CreateCallbackTables()
    Medical.Network.CreateEventHandlers()

    -- Setup callbacks & events
    Medical.PlayerHandler.RegisterCallbacks()
    Medical.HitDetection.RegisterCallbacks()
    SetupEventHandlers()

    -- Setup players
    AddEventHandler('playerJoining', OnPlayerJoining)
    local Players = GetPlayers()
    if #Players > 0 then
        print('Setting up connected players')
        for index, value in ipairs(Players) do
            -- Set up all the players that remain
            print('Setting up [' .. value .. '] ' .. GetPlayerName(value))
            Medical.PlayerHandler.SetupPlayer(value)
        end
    end


    print("Fully Loaded")
end

Init()

