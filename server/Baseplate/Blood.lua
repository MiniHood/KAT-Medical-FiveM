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

Medical.Blood.AddBleeding = function(amount, delay, bone, ply)
    local src = source or ply
    if not src then
        Medical.ErrorHandler.ThrowError('Unable to obtain source for add bleeding function')
        return
    end
    if not amount then
        Medical.ErrorHandler.ThrowError('Unable to obtain amount for add bleeding function')
        return
    end
    if not delay then
        Medical.ErrorHandler.ThrowError('Unable to obtain delay for add bleeding function')
        return
    end
    if not bone then
        Medical.ErrorHandler.ThrowError('Unable to obtain bone for add bleeding function')
        return
    end

    local PlayerData = Medical.PlayerHandler.GetPlayer(src)

    if not PlayerData then
        Medical.ErrorHandler.ThrowError('Unable to get player : '.. (src or '[cannot find src]'))
    end

    if PlayerData['Baseplate']['Bleeding'][bone] then
        local NewTable = PlayerData
        NewTable['Baseplate']['Bleeding'][bone].amount = amount
        NewTable['Baseplate']['Bleeding'][bone].delay = math.min(PlayerData['Baseplate']['Bleeding'][bone].delay, delay)
        Medical.PlayerHandler.EditPlayer(src, NewTable, true)
    else
        local NewTable = PlayerData
        NewTable['Baseplate']['Bleeding'][bone] = {
            amount = amount,
            delay = delay,
            lastTick = GetGameTimer()
        }
        Medical.PlayerHandler.EditPlayer(src, NewTable, true)
    end
end


Medical.Blood.RemoveBleeding = function(amount, bone, ply)
    local src = source or ply
    if not src then
        Medical.ErrorHandler.ThrowError('Unable to obtain source for remove bleeding function')
        return
    end
    if not amount then
        Medical.ErrorHandler.ThrowError('Unable to obtain amount for remove bleeding function')
        return
    end
    if not bone then
        Medical.ErrorHandler.ThrowError('Unable to obtain bone for remove bleeding function')
        return
    end

    local PlayerData = Medical.PlayerHandler.GetPlayer(src)

    if not PlayerData then
        Medical.ErrorHandler.ThrowError('Unable to get player : '.. (src or '[cannot find src]'))
    end

    local NewTable = PlayerData

    if amount >= NewTable['Baseplate']['Bleeding'][bone].amount then
        PlayerData['Baseplate']['Bleeding'][bone] = nil
        return
    end

    NewTable['Baseplate']['Bleeding'][bone].amount -= amount
    Medical.PlayerHandler.EditPlayer(src, NewTable, true)
end

Medical.Blood.GetBleedingAmount = function(bone, ply)
    local src = source or ply
    if not src then
        Medical.ErrorHandler.ThrowError('Unable to obtain source for get bleeding function')
        return
    end
    if not bone then
        Medical.ErrorHandler.ThrowError('Unable to obtain bone for get bleeding function')
        return
    end

    local PlayerData = Medical.PlayerHandler.GetPlayer(src)

    if not PlayerData then
        Medical.ErrorHandler.ThrowError('Unable to get player : '.. (src or '[cannot find src]'))
    end

    print('Amount: '..PlayerData['Baseplate']['Bleeding'][bone].amount)

    return PlayerData['Baseplate']['Bleeding'][bone].amount or nil
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
 --
Medical.Blood.ManageBleeding = function()
    while true do
        local currentTime = GetGameTimer()
        for key, value in pairs(GetPlayers()) do
            local PlayerData = Medical.PlayerHandler.GetPlayer(value)
            if not PlayerData then
                Medical.ErrorHandler.ThrowError('Unable to get player ' .. value)
            end

            for bone, boneData in pairs(PlayerData['Baseplate']['Bleeding']) do

                if GetEntityHealth(GetPlayerPed(value)) <= 0 then
                    local BleedingAmt = Medical.Blood.GetBleedingAmount(bone, value)
                    Medical.Blood.RemoveBleeding(BleedingAmt, bone, value)
                else

                    if currentTime - boneData.lastTick >= boneData.delay * 1000 then
                        print('Removing ' .. boneData.amount .. ' from ' .. tostring(bone))
                        Medical.Blood.RemoveBlood(boneData.amount, value)
                        Medical.Network.Blood.Bleeding.Bleed(boneData.amount, value) 
                        boneData.lastTick = currentTime
                    end

                end
            end
        end
        Wait(1) 
    end
end

-- This should look up in the threading table
-- And return the thread, the amount of bleeding
-- the delay
-- & the bone
Medical.Blood.GetBleeding = function (bone)
    if not bone then Medical.ErrorHandler.ThrowError('Unobtainable bone param passed to get bleeding function') return false end
    local ThreadID = Medical.Threading.GetThread(bone)
    if not ThreadID then return false end
    return ThreadID
end


Medical.ConfirmLoaded('Blood')