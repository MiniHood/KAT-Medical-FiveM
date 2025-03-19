Medical = Medical or {}
Medical.Blood = Medical.Blood or {}
Medical.ErrorHandler = Medical.ErrorHandler or Medical.WaitFor('ErrorHandler')
Medical.PlayerHandler = Medical.PlayerHandler or Medical.WaitFor('PlayerHandler')
Medical.Threading = Medical.Threading or Medical.WaitFor('Threading')

Medical.Blood.AddBlood = function (amt, ply)
    local src = source or ply
    if not src then Medical.ErrorHandler.ThrowError('Unable to obtain source for add blood function') return end
    if not amt then Medical.ErrorHandler.ThrowError('Attempted to add nil blood in add blood function') return end

    local newData = Medical.PlayerHandler.GetPlayer(src)
    if not newData then Medical.ErrorHandler.ThrowError('Unable to obtain player from data for add blood function') return end
    newData['Baseplate']['Blood'] += amt

    if not Medical.PlayerHandler.EditPlayer(src, newData, true) then
        Medical.ErrorHandler.ThrowError('Failed to edit player data for add blood function.')
    end
end

Medical.Blood.RemoveBlood = function (amt, ply)
    local src = source or ply
    if not src then Medical.ErrorHandler.ThrowError('Unable to obtain source for remove blood function') return end
    if not amt then Medical.ErrorHandler.ThrowError('Attempted to remove nil blood in remove blood function') return end
    local newData = Medical.PlayerHandler.GetPlayer(src)
    if not newData then Medical.ErrorHandler.ThrowError('Unable to obtain player from data for remove blood function') return end
    newData['Baseplate']['Blood'] -= amt

    if not Medical.PlayerHandler.EditPlayer(src, newData, true) then
        Medical.ErrorHandler.ThrowError('Failed to edit player data for remove blood function.')
    end
end

-- This needs to be networked
-- Firstly, the blood thread should remove the specified amount of blood
-- every specified time per tick
-- The thread name should be named KAT-Bleeding-(BoneName)

Medical.Blood.AddBleeding = function (amount, delay, bone)
    local src = source
    if not src then Medical.ErrorHandler.ThrowError('Unable to obtain source for add bleeding function') return end
    if not amount then Medical.ErrorHandler.ThrowError('Unable to obtain amount for add bleeding function') return end
    if not delay then Medical.ErrorHandler.ThrowError('Unable to obtain delay for add bleeding function') return end
    if not bone then Medical.ErrorHandler.ThrowError('Unable to obtain bone for add bleeding function') return end

    -- Check if bleeding in that bone already exists
    local ExistingThread = Medical.Blood.GetBleeding(bone)
    if ExistingThread then
        -- Instead of creating a new thread add the bleeding
        local newData = Medical.PlayerHandler.GetPlayer(src)
        if not newData then Medical.ErrorHandler.ThrowError('Unable to obtain player from data for add bleeding function') 
            Medical.Threading.TerminateThreadIdentifier(tostring(bone))
            return
        end
    
        newData['Baseplate']['Bleeding'][ExistingThread]['amount'] += amount
        newData['Baseplate']['Bleeding'][ExistingThread]['delay'] -= (delay / 4)
    
        if not Medical.PlayerHandler.EditPlayer(src, newData, true) then
            Medical.ErrorHandler.ThrowError('Failed to edit player data for add bleeding function.')
            Medical.Threading.TerminateThreadIdentifier(tostring(bone))
            return
        end
        return
    end

    -- Build the bleeding function
    -- Any error relating to bone within the bleed function builder will be considered critical as there is no 
    -- way to stop the thread if the bone is nil
    local BleedingFunction = function ()
        if not bone then Medical.ErrorHandler.ThrowError("Unobtainable bone param passed to bleeding function builder", true) return end 
        if not src then Medical.ErrorHandler.ThrowError('Unobtainable player param passed to bleeding function builder') Medical.Threading.TerminateThreadID(bone) return end
        if not delay then Medical.ErrorHandler.ThrowError('Unobtainable delay param passed to bleeding function builder') Medical.Threading.TerminateThreadID(bone) return end
        if not amount then Medical.ErrorHandler.ThrowError('Unobtainable amount param passed to bleeding function builder') Medical.Threading.TerminateThreadID(bone) return end
        while true do
            /*
            -- This checks for the thread ID of the current thread in the player table
            -- So we can pull the information we need.
            -- This is super unoptimised, if anyone knows a better way please make a fork request
            local MaxAttempts = 50
            local CurrentAttempts = 0
            while not Medical.PlayerHandler.GetPlayer(src) or not Medical.PlayerHandler.GetPlayer(src)['Baseplate']['Bleeding'][GetIdOfThisThread()] do
                CurrentAttempts += 1
                if CurrentAttempts >= MaxAttempts then 
                    Medical.ErrorHandler.ThrowError('Unable to get data required for bleeding thread after ' .. MaxAttempts .. ' attempts.')
                    Medical.Threading.TerminateThreadID(GetIdOfThisThread())
                    return
                end
                Wait(100)
            end
            
            local newData = Medical.PlayerHandler.GetPlayer(src)
            if not newData then 
                Medical.ErrorHandler.ThrowError('Unable to obtain player from data for add bleeding builder function') 
                Medical.Threading.TerminateThreadID(GetIdOfThisThread())
                return
            end

            local ThreadInfo = newData['Baseplate']['Bleeding'][GetIdOfThisThread()]
            if not ThreadInfo then 
                Medical.ErrorHandler.ThrowError('Unable to obtain player thread info from data for add bleeding function builder thread') 
                Medical.Threading.TerminateThreadID(GetIdOfThisThread())
                return
             end

            if not ThreadInfo['amount'] then 
                Medical.ErrorHandler.ThrowError('Unable to obtain player thread info (amount) from data for add bleeding function builder thread') 
                Medical.Threading.TerminateThreadID(GetIdOfThisThread())
                return
            end

            if not ThreadInfo['delay'] then 
                Medical.ErrorHandler.ThrowError('Unable to obtain player thread info (delay) from data for add bleeding function builder thread') 
                Medical.Threading.TerminateThreadID(GetIdOfThisThread())
                return
            end

            if not ThreadInfo['bone'] then
                Medical.ErrorHandler.ThrowError('Unable to obtain player thread info (bone) from data for add bleeding function builder thread') 
                Medical.Threading.TerminateThreadID(GetIdOfThisThread())
                return
            end

            Medical.Blood.RemoveBlood(ThreadInfo['amount'], src)
            Medical.Network.Bleed(ThreadInfo['amount'], src) -- TODO: Implement this function
            Wait(ThreadInfo['delay'])
            */
        
            Medical.Blood.RemoveBlood(amount, src)
            Medical.Network.Bleed(amount, src) -- TODO: Implement this function
            Wait(delay)
        end
    end

    -- Create Thread
    local Thread = CreateThread(BleedingFunction)
    if not Thread then Medical.ErrorHandler.ThrowError('Unable to create thread for add bleeding function') return end 
    Medical.Threading.CreateThread(Thread, tostring(bone))

    -- Update player table
    local newData = Medical.PlayerHandler.GetPlayer(src)
    if not newData then Medical.ErrorHandler.ThrowError('Unable to obtain player from data for add bleeding function') 
        Medical.Threading.TerminateThreadIdentifier(tostring(bone))
        return
    end

    newData['Baseplate']['Bleeding'][Thread] = {}
    newData['Baseplate']['Bleeding'][Thread] = {
        amount = amount,
        delay = delay,
        bone = bone
    }

    if not Medical.PlayerHandler.EditPlayer(src, newData, true) then
        Medical.ErrorHandler.ThrowError('Failed to edit player data for add bleeding function.')
        Medical.Threading.TerminateThreadIdentifier(tostring(bone))
        return
    end
end

-- This should look up in the threading table
-- And return the thread, the amount of bleeding
-- the delay
-- & the bone
Medical.Blood.GetBleeding = function (bone)
    if not bone then Medical.ErrorHandler.ThrowError('Unobtainable bone param passed to get bleeding function') return false end
    local ThreadID = Medical.Threading.GetThread(bone)
    if not ThreadID then Medical.ErrorHandler.ThrowError('No thread of identnfier ' .. bone) return false end
    return ThreadID
end


Medical.ConfirmLoaded('Blood')