Medical = Medical or {}
Medical.Threading = Medical.Threading or {}
Medical.Threading.Threads = Medical.Threading.Threads or {}

Medical.ErrorHandler = Medical.ErrorHandler or Medical.WaitFor('ErrorHandler')

local _ThrowError = Medical.ErrorHandler.ThrowError or function (m, c)
    print('^5[Medical]^7 A ^8critical^7 error was encountered: ' .. m)
    StopResource(GetCurrentResourceName())
end

local function FindKeyByValue(list, value)
	for key, tvalue in pairs(list) do
		if tvalue == value then return key end
	end

	return nil
end

Medical.Threading.CreateThread = function (identifier)
    if not identifier then identifier = math.random(125451, 473487486967) end
    Medical.Threading.Threads[identifier] = true
    return identifier
end

Medical.Threading.TerminateAllThreads = function ()
    for key, value in pairs(Medical.Threading.Threads) do
        TerminateThread(value)
        Medical.Threading.Threads[key] = nil
    end
end

Medical.Threading.GetThread = function (Identifier)
    if not Medical.Threading.Threads[Identifier] then return nil end
    return Medical.Threading.Threads[Identifier]
end

function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
 end


Medical.Threading.TerminateThreadIdentifier = function (Identifier)
    if not Medical.Threading.Threads[Identifier] then _ThrowError('Failed to find [' .. Identifier .. '] in Medical.Threading.Threads [TerminateThreadIdentifier]') print(dump(Medical.Threading.Threads)) return end
    Medical.Threading.Threads[Identifier] = nil
end

Medical.ConfirmLoaded('Threading')