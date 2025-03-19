Medical = Medical or {}
Medical.Network = Medical.Network or {}
Medical.Network.Blood = Medical.Network.Blood or {} 
Medical.Network.HitDetection = Medical.Network.HitDetection or {}
Medical.Network.PlayerHandler = Medical.Network.PlayerHandler or {}


Medical.Network.Blood.AddBlood = function (amt)
    TriggerServerEvent('Medical:Server:AddBlood', amt)
end

Medical.Network.Blood.RemoveBlood = function (amt)
    TriggerServerEvent('Medical:Server:RemoveBlood', amt)
end

Medical.Network.Blood.AddBleeding = function (amount, delay, bone)
    TriggerServerEvent('Medical:Server:AddBleeding', amount, delay, bone)
end

Medical.Network.HitDetection.GetLastSourceOfDamage = function ()
    local CallbackData = TriggerServerCallback { 
        eventName = 'Medical:Server:RequestLastSourceOfDamage',
        args = {}
    }
    return CallbackData
end

Medical.Network.PlayerHandler.RequestPlayerData = function (playerID)
    local CallbackData = TriggerServerCallback { 
        eventName = 'Medical:Server:RequestPlayerData',
        args = {playerID}
    }
    return CallbackData
end

Medical.ConfirmLoaded('Network')