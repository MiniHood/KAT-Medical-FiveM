Medical = Medical or {}

local RequiredResources = {
    'pmc-callbacks',
    'ox_lib',
    'ox_target'
}

local _ThrowError = Medical.ErrorHandler.ThrowError or function (m, c)
    print('^5[Medical]^7 A ^8critical^7 error was encountered: ' .. m)
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

    -- Register call backs
    Medical.PlayerHandler.RegisterCallbacks()

    -- Add event handlers
    AddEventHandler('playerConnecting', OnPlayerConnecting)
end

Init()

