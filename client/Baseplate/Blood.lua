Medical = Medical or {}
Medical.Blood = Medical.Blood or {}

Medical.Threading = Medical.Threading or Medical.WaitFor('Threading')
Medical.ErrorHandler = Medical.ErrorHandler or Medical.WaitFor('ErrorHandler')
Medical.Network = Medical.Network or Medical.WaitFor('Network')

--[[

This file should both deal with interacting with the local players blood
and the other players (if interacting with them) blood

]]

--[[
Manipulating other peoples blood will not be allowed on the client and instead will be done
through the server
]]

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
-- Function for adding blood
-- @param amt The amount you want to add
Medical.Blood.AddBlood = function (amt)
    Medical.Network.Blood.AddBlood(amt)
end

-- Function for adding blood
-- @param amt The amount you want to remove
Medical.Blood.RemoveBlood = function (amt) 
    Medical.Network.Blood.RemoveBlood(amt)
end

-- Function to getting blood
-- @param player Player to get blood amount from
Medical.Blood.GetBlood = function (player)
    local PlayerData = Medical.PlayerHandler.RequestPlayerData(player)
    if not PlayerData then return end
    local Blood = PlayerData['Baseplate']['Blood']
    return Blood or 0
end

-- Function to add bleeding to a bone
-- @param amount Amount of bleeding per tick
-- @param delay Delay between each tick
-- @param delay Source bone of the bleeding
Medical.Blood.AddBleeding = function (amount, delay, bone)
    Medical.Network.Blood.AddBleeding(amount, delay, bone)
end

Medical.Blood.AddBleedEffect = function (amt, ply)
    local src = source
    local pos = GetEntityCoords(src)
    AddDecal(1010, pos.x, pos.y, pos.z, 0.0, 0.0, -1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0)
end

Medical.ConfirmLoaded('Blood')