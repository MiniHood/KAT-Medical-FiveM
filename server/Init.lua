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

local RequiredResources = {
    'pmc-callbacks',
    'ox_lib',
    'ox_target'
}

local _ThrowError = function (m, c)
    print('^5[Medical]^7 A ^8critical^7 error was encountered: ' .. m)
end

local function OnPlayerConnecting(name, setKickReason, defferals)
    local player = source
    if not player then _ThrowError("Failed to get player from connecting event") return end
    Medical.PlayerHandler.SetupPlayer(player)
end

function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
 end

local function Init()
    -- Check for required resources
    for _, value in ipairs(RequiredResources) do
        if not GetResourceState(value) == "started" then
            _ThrowError('Missing required resource: ' .. value, true)
            return
        end
    end

    
    while not Medical.IsLoaded('ErrorHandler') do
        Wait(0)
    end

    -- Load _ThrowError function
    _ThrowError = Medical.ErrorHandler.ThrowError

    while not Medical.IsLoaded('Network') do
        Wait(0)
    end

    -- Create callback tables
    Medical.Network.CreateCallbackTables()

    while not Medical.IsLoaded('PlayerHandler') do
        Wait(0)
    end

    -- Register call backs
    Medical.PlayerHandler.RegisterCallbacks()
    
    -- Add event handlers
    AddEventHandler('playerConnecting', OnPlayerConnecting)

    print("Fully Loaded")
end

Init()

