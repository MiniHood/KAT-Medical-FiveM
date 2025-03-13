Medical = Medical or {}
Medical.Blood = Medical.Blood or {}
Medical.ErrorHandler = Medical.ErrorHandler or Medical.WaitFor('ErrorHandler')
Medical.PlayerHandler = Medical.PlayerHandler or Medical.WaitFor('PlayerHandler')

Medical.Blood.AddBlood = function (amt)
    local src = source
    if not src then Medical.ErrorHandler.ThrowError('Unable to obtain source for add blood function') return end
    if not amt then Medical.ErrorHandler.ThrowError('Attempted to add nil blood in add blood function') return end

    local newData = Medical.PlayerHandler.GetPlayer(src)
    if not newData then Medical.ErrorHandler.ThrowError('Unable to obtain player from data for add blood function') return end
    newData['Baseplate']['Blood']['BloodML'] += amt

    if not Medical.PlayerHandler.EditPlayer(src, newData, true) then
        Medical.ErrorHandler.ThrowError('Failed to edit player data for add blood function.')
    end
end

Medical.Blood.RemoveBlood = function (amt)
    local src = source
    if not src then Medical.ErrorHandler.ThrowError('Unable to obtain source for remove blood function') return end
    if not amt then Medical.ErrorHandler.ThrowError('Attempted to remove nil blood in remove blood function') return end
    local newData = Medical.PlayerHandler.GetPlayer(src)
    if not newData then Medical.ErrorHandler.ThrowError('Unable to obtain player from data for remove blood function') return end
    newData['Baseplate']['Blood'] -= amt

    if not Medical.PlayerHandler.EditPlayer(src, newData, true) then
        Medical.ErrorHandler.ThrowError('Failed to edit player data for remove blood function.')
    end
end


Medical.ConfirmLoaded('Blood')