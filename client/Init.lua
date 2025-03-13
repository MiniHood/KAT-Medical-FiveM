Medical = Medical or {}
Medical.Threading = Medical.Threading or {}
Medical.Threading.Threads = Medical.Threading.Threads or {}

AddEventHandler('onClientResourceStop', function (rN)
    if not rN == GetCurrentResourceName() then return end

    -- TODO: Add full clean up for everything

    Medical.Threading.TerminateAllThreads()
end)