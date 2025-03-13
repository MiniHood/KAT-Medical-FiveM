Medical = Medical or {}

-- Firstly, register the character who joined on the server
PlayersRef = {}

--[[

Player table reference

Players = {
    Player = {
        Baseplate = {
            Blood = {
                BloodML = 5000,
            }
        }
    }
}

]]



local function OnPlayerConnecting(name, setKickReason, defferals)
    local player = source

    if PlayersRef[player] then return end

    -- Create table for player
    PlayersRef[player] = {
        Baseplate = {
            Blood = 5000
        },

        Equipment = {},
        Fluids = {},
        Medicine = {},
    }
end

AddEventHandler('playerConnecting', OnPlayerConnecting)