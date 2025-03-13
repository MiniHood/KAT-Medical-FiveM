Medical = Medical or {}
Medical.PlayerHandler = Medical.PlayerHandler or {}

Medical.PlayerHandler.RequestPlayerData = function (playerID)
    local CallbackData = TriggerServerCallback {
        eventName = 'Medical:Server:RequestPlayerData',
        args = {playerID}
    }
    return CallbackData
end

Medical.ConfirmLoaded('PlayerHandler')