Medical = Medical or {}
Medical.Network = Medical.Network or {}
Medical.Network.Blood = Medical.Network.Blood or {} 

Medical.Network.Blood.AddBlood = function (amt)
    TriggerServerEvent('Medical:Server:AddBlood', amt)
end

Medical.Network.Blood.RemoveBlood = function (amt)
    TriggerServerEvent('Medical:Server:RemoveBlood', amt)
end

Medical.ConfirmLoaded('Network')