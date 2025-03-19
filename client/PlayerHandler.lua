Medical = Medical or {}
Medical.PlayerHandler = Medical.PlayerHandler or {}

Medical.Network = Medical.Network or Medical.WaitFor('Network')

Medical.PlayerHandler.RequestPlayerData = function (playerID)
    return Medical.Network.PlayerHandler.RequestPlayerData(playerID)
end

Medical.ConfirmLoaded('PlayerHandler')