Medical = Medical or {}
Medical.Network = Medical.Network or {}
Medical.Network.PlayerHandler = Medical.Network.PlayerHandler or {}
Medical.Network.PlayerHandler.Callbacks = Medical.Network.PlayerHandler.Callbacks or {}

Medical.PlayerHandler = Medical.PlayerHandler or Medical.WaitFor('PlayerHandler')

local ins = function (list, value)
    table.insert(list, value)
end

Medical.Network.CreateCallbackTables = function ()
    ins(Medical.Network.PlayerHandler.Callbacks,  { 'Medical:Server:RequestPlayerData', Medical.PlayerHandler.RequestPlayerData })
end

Medical.ConfirmLoaded('Network')