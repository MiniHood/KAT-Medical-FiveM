Medical = Medical or {}
Medical.ErrorHandler = Medical.ErrorHandler or {}

Medical.ErrorHandler.ThrowError = function (msg, critical)
    if not msg and not critical then return end

    -- If it's critical attempt to shut down all threads
    if critical then
        print('^5[Medical]^7 A ^8critical^7 error was encountered: ' .. msg)

        -- Attempt to shut down all threads
        if Medical.Threading then
            Medical.Threading.TerminateAllThreads()
            return
        else
            -- If we can't reach the threading library, for example the threading is the one throwing the error, then stop the resource.
            StopResource(GetCurrentResourceName())
            return
        end
    end    


    -- If the error is not critical, simply print it.
    print('^5[Medical]^7 A ^3non-critical^7 ^8error^7 was encountered: ' .. msg)
end

Medical.ConfirmLoaded('ErrorHandler')