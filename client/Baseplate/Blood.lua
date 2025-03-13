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

Medical.Blood.AddBlood = function (amt)
    Medical.Network.Blood.AddBlood(amt)
end

Medical.Blood.RemoveBlood = function (amt) 
    Medical.Network.Blood.RemoveBlood(amt)
end

Medical.Blood.GetBlood = function (player)
    local PlayerData = Medical.PlayerHandler.RequestPlayerData(player)
    if not PlayerData then return end
    local Blood = PlayerData['Baseplate']['Blood']
    return Blood or 0
end

Medical.ConfirmLoaded('Blood')