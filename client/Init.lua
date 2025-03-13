Medical = Medical or {}

AddEventHandler('onClientResourceStop', function (rN)
    if not rN == GetCurrentResourceName() then return end

    -- TODO: Add full clean up for everything

    Medical.Threading.TerminateAllThreads()
end)