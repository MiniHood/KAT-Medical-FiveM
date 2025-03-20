Medical = Medical or {}
Medical.Network = Medical.Network or {}

Medical.PlayerHandler = Medical.PlayerHandler or Medical.WaitFor('PlayerHandler')
Medical.Blood = Medical.Blood or Medical.WaitFor('Blood')
Medical.HitDetection = Medical.HitDetection or Medical.WaitFor('HitDetection')

Medical.Network.HitDetection = Medical.Network.HitDetection or {}
Medical.Network.HitDetection.Callbacks = Medical.Network.HitDetection.Callbacks or {}


Medical.Network.EventHandlers = Medical.Network.EventHandlers or {}

Medical.Network.PlayerHandler = Medical.Network.PlayerHandler or {}
Medical.Network.PlayerHandler.Callbacks = Medical.Network.PlayerHandler.Callbacks or {}

Medical.Network.Blood = Medical.Network.Blood or {}
Medical.Network.Blood.Bleeding = Medical.Network.Blood.Bleeding or {}
Medical.Network.Blood.Callbacks = Medical.Network.Blood.Callbacks or {}

local ins = table.insert

Medical.Network.Blood.Bleeding.Bleed = function (amount, src)
    for index, ply in ipairs(GetPlayers()) do
        if ply then
            print('Sending add bleed effect to ' .. ply)
            TriggerClientEvent("Medical:Client:AddBleedEffect", ply, amount, src)
        end
    end
end

Medical.Network.CreateCallbackTables = function ()
    ins(Medical.Network.PlayerHandler.Callbacks,  { 'Medical:Server:RequestPlayerData', Medical.PlayerHandler.RequestPlayerData })
    ins(Medical.Network.HitDetection.Callbacks,  { 'Medical:Server:RequestLastSourceOfDamage', Medical.HitDetection.RequestLastSourceOfDamage })
end

Medical.Network.CreateEventHandlers = function ()
    ins(Medical.Network.EventHandlers, { 'Medical:Server:AddBlood', Medical.Blood.AddBlood })
    ins(Medical.Network.EventHandlers, { 'Medical:Server:RemoveBlood', Medical.Blood.RemoveBlood })
    ins(Medical.Network.EventHandlers, { 'Medical:Server:AddBleeding', Medical.Blood.AddBleeding })
end

Medical.ConfirmLoaded('Network')