Medical = Medical or {}
Medical.Blood = Medical.Blood or Medical.WaitFor('Blood')
Medical.ErrorHandler = Medical.ErrorHandler or Medical.WaitFor('ErrorHandler')
Medical.PlayerHandler = Medical.PlayerHandler or Medical.WaitFor('PlayerHandler')

RegisterCommand('testbloodremoveserver', function (source, args, raw)
    Medical.Blood.RemoveBlood(source, args[1])
end)

RegisterCommand('testbloodaddserver', function (source, args, raw)
    Medical.Blood.AddBlood(source, args[1])
end)