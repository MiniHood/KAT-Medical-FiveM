Medical = Medical or {}
Medical.Threading = Medical.Threading or {}
Medical.Threading.Threads = Medical.Threading.Threads or {}



local _ThrowError = Medical.ErrorHandler.ThrowError or function (m, c)
    print('^5[Medical]^7 A ^8critical^7 error was encountered: ' .. m)
end

local function FindKeyByValue(list, value)
	for key, tvalue in pairs(list) do
		if tvalue == value then return key end
	end

	return nil
end

Medical.Threading.CreateThread = function (threadID, identifier)
    if not threadID then  _ThrowError('Argument of [' .. threadID .. '] passed to medical CreateThread was invalid') return end
    if not identifier then identifier = math.random(125451, 473487486967) end
    Medical.Threading.Threads[identifier] = threadID
    return identifier
end

Medical.Threading.TerminateAllThreads = function ()
    for key, value in pairs(Medical.Threading.Threads) do
        TerminateThread(value)
        Medical.Threading.Threads[key] = nil
    end
end

Medical.Threading.TerminateThreadID = function (threadID)
    if not threadID then _ThrowError('Argument passed to terminate thread id is invalid argument: ' .. threadID) return end
    local Key = FindKeyByValue(Medical.Threading.Threads, threadID)
    if not Key then _ThrowError('Failed to find key by value in Medical.Threading.Threads') return end
    TerminateThread(Medical.Threading.Threads[Key])
    Medical.Threading.Threads[Key] = nil
end

Medical.Threading.TerminateThreadIdentifier = function (Identifier)
    if not Medical.Threading.Threads[Identifier] then _ThrowError('Failed to find [' .. Identifier .. '] in Medical.Threading.Threads') return end
    TerminateThread(Medical.Threading.Threads[Identifier])
    Medical.Threading.Threads[Identifier] = nil
end

Medical.ConfirmLoaded('Threading')