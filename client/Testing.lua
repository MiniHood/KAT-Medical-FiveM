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

RegisterCommand("spawnnpc", function(source, args, rawCommand)
    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1)))
    local npcModel = "a_m_m_skater_01" 
    RequestModel(npcModel)
    while not HasModelLoaded(npcModel) do
        Wait(500)
    end
    local npc = CreatePed(4, npcModel, x + 5, y + 5, z, 0.0, true, true)
    SetPedAsEnemy(npc, true)
    local weaponHash = GetHashKey("WEAPON_PISTOL")  
    GiveWeaponToPed(npc, weaponHash, 250, false, true) 
    TaskCombatPed(npc, GetPlayerPed(-1), 0, 16)
    SetEntityInvincible(npc, false)
    SetEntityVisible(npc, true)
end, false)
