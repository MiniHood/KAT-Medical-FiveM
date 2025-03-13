Medical = Medical or {}
Medical.PlayerHandler = Medical.PlayerHandler or {}
Medical.PlayerHandler.PlayerData = Medical.PlayerHandler.PlayerData or {}
Medical.PlayerHandler.Callbacks = Medical.PlayerHandler.Callbacks or {}
--[[

Player table reference

Players = {
    Player = {
        Baseplate = {
            Blood = 5000,
        }
    }
}

]]

Medical.ErrorHandler = Medical.ErrorHandler or Medical.WaitFor('ErrorHandler')

Medical.Network = Medical.Network or Medical.WaitFor('Network')

local _ThrowError = Medical.ErrorHandler.ThrowError or function (m, c)
    print('^5[Medical]^7 A ^8critical^7 error was encountered: ' .. m)
end

Medical.PlayerHandler.DoesPlayerExist = function(player)
    if Medical.PlayerHandler.PlayerData[tostring(player)] then return true end
    return false
end

Medical.PlayerHandler.GetPlayer = function (player)
    if not Medical.PlayerHandler.DoesPlayerExist(player) then _ThrowError('Attempted to get a player who does not yet exist') return end
    return Medical.PlayerHandler.PlayerData[tostring(player)]
end

Medical.PlayerHandler.SetupPlayer = function(player)
    if Medical.PlayerHandler.DoesPlayerExist(player) then return end
    Medical.PlayerHandler.PlayerData[tostring(player)] = {
        Baseplate = {
            Blood = 5000
        },

        Equipment = {},
        Fluids = {},
        Medicine = {},
    }
end

Medical.PlayerHandler.EditPlayer = function (player, newData, confirm)
    if not Medical.PlayerHandler.DoesPlayerExist(player) then Medical.PlayerHandler.SetupPlayer(player) end
    Medical.PlayerHandler.PlayerData[tostring(player)] = newData
    if confirm then if not Medical.PlayerHandler.GetPlayer(player) == newData then return false else return true end end
    return true
end

Medical.PlayerHandler.RequestPlayerData = function (source, playerid)
    local Player = Medical.PlayerHandler.GetPlayer(playerid)
    if not Player then return end -- No error here, already been errored in the get player function
    return Player
end

Medical.PlayerHandler.RegisterCallbacks = function ()
    for _, value in ipairs(Medical.Network.PlayerHandler.Callbacks) do
        if not value or not value[1] or not value[2] then _ThrowError("Unable to find player handler network callback table") return end
        RegisterServerCallback {
            eventName = value[1],
            eventCallback = value[2]
        }
    end
end

Medical.ConfirmLoaded('PlayerHandler')