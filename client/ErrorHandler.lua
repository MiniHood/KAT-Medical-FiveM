Medical.ErrorHandler = Medical.ErrorHandler or {}

Medical.ErrorHandler.ThrowError = function (msg, critical)
    if not msg and not critical then return end

    if critical then
        print('^5[Medical]^7 A ^8critical^7 error was encountered, please contact the server developer: ' .. msg)
        return
    end    

    print('^5[Medical]^7 A ^3non-critical^7 ^8error^7 was encountered: ' .. msg)
end