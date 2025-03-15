Medical = Medical or {}
Medical.HitDetection = Medical.HitDetection or {}
Medical.HitDetection.Bones = Medical.HitDetection.Bones or {}

Medical.ErrorHandler = Medical.ErrorHandler or Medical.WaitFor('ErrorHandler')

Medical.HitDetection.FillBones = function ()
    local Player = PlayerPedId()
    local ins = table.insert

    ins(Medical.HitDetection.Bones, GetEntityBoneIndexByName(Player, "SKEL_ROOT"))




    for index, value in ipairs(Medical.HitDetection.Bones) do
        print(index .. ' ' .. value)
    end
end 


AddEventHandler('gameEventTriggered', function(eventName, eventData)
    if eventName == 'CEventNetworkEntityDamage' then
        print("Entity damage info: ", eventName, eventData)
    end
end)

Medical.ConfirmLoaded('HitDetection')