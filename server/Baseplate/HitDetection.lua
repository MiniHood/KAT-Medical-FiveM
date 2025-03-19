Medical = Medical or {}
Medical.HitDetection = Medical.HitDetection or {}

Medical.ErrorHandler = Medical.ErrorHandler or Medical.WaitFor('ErrorHandler')
Medical.Network = Medical.Network or Medical.WaitFor('Network')

local _ThrowError = Medical.ErrorHandler.ThrowError or function (m, c)
    print('^5[Medical]^7 A ^8critical^7 error was encountered: ' .. m)
end
Medical.HitDetection.RequestLastSourceOfDamage = function ()
    return GetPedSourceOfDamage(GetPlayerPed(source))
end

Medical.HitDetection.RegisterCallbacks = function ()
    for _, value in ipairs(Medical.Network.HitDetection.Callbacks) do
        if not value or not value[1] or not value[2] then _ThrowError("Unable to find hit detection network callback table") return end
        RegisterServerCallback {
            eventName = value[1],
            eventCallback = value[2]
        }
    end
end

Medical.ConfirmLoaded('HitDetection')