Medical = Medical or {}
Medical.Blood = Medical.Blood or Medical.WaitFor('Blood')
Medical.ErrorHandler = Medical.ErrorHandler or Medical.WaitFor('ErrorHandler')
Medical.PlayerHandler = Medical.PlayerHandler or Medical.WaitFor('PlayerHandler')

RegisterCommand('testbloodremoveclient', function (_, args, raw)
    Medical.Blood.RemoveBlood(args[1])
    print('Removed '..args[1]..'ml of blood')
end, false)

RegisterCommand('testbloodaddclient', function (_, args, raw)
    Medical.Blood.AddBlood(args[1])
    print('Added '..args[1]..'ml of blood')
end, false)

RegisterCommand('testbloodgetclient', function (_, args, raw)
    print(Medical.Blood.GetBlood(GetPlayerServerId(PlayerId())))
end, false)
