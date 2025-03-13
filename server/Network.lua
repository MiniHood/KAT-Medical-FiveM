Medical = Medical or {}
Medical.Network = Medical.Network or {}

Medical.PlayerHandler = Medical.PlayerHandler or Medical.WaitFor('PlayerHandler')
Medical.Blood = Medical.Blood or Medical.WaitFor('Blood')

Medical.Network.PlayerHandler = Medical.Network.PlayerHandler or {}
Medical.Network.EventHandlers = Medical.Network.EventHandlers or {}
Medical.Network.PlayerHandler.Callbacks = Medical.Network.PlayerHandler.Callbacks or {}
Medical.Network.Blood = Medical.Network.Blood or {}
Medical.Network.Blood.Callbacks = Medical.Network.Blood.Callbacks or {}

local ins = function (list, value)
    table.insert(list, value)
end

Medical.Network.CreateCallbackTables = function ()
    ins(Medical.Network.PlayerHandler.Callbacks,  { 'Medical:Server:RequestPlayerData', Medical.PlayerHandler.RequestPlayerData })
end

Medical.Network.CreateEventHandlers = function ()
    ins(Medical.Network.EventHandlers, { 'Medical:Server:AddBlood', Medical.Blood.AddBlood })
    ins(Medical.Network.EventHandlers, { 'Medical:Server:RemoveBlood', Medical.Blood.RemoveBlood })
end

Medical.ConfirmLoaded('Network')