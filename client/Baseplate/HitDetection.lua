Medical = Medical or {}
Medical.HitDetection = Medical.HitDetection or {}
Medical.HitDetection.Bones = Medical.HitDetection.Bones or {}
Medical.HitDetection.Events = Medical.HitDetection.Events or {}

Medical.ErrorHandler = Medical.ErrorHandler or Medical.WaitFor('ErrorHandler')
Medical.Network = Medical.Network or Medical.WaitFor('Network')

Medical.HitDetection.FillBones = function ()
    Medical.HitDetection.Bones[0] = "SKEL_ROOT"
    Medical.HitDetection.Bones[1356] = "FB_R_Brow_Out_000"
    Medical.HitDetection.Bones[2108] = "SKEL_L_Toe0"
    Medical.HitDetection.Bones[2992] = "MH_R_Elbow"
    Medical.HitDetection.Bones[4089] = "SKEL_L_Finger01"
    Medical.HitDetection.Bones[4090] = "SKEL_L_Finger02"
    Medical.HitDetection.Bones[4137] = "SKEL_L_Finger31"
    Medical.HitDetection.Bones[4138] = "SKEL_L_Finger32"
    Medical.HitDetection.Bones[4153] = "SKEL_L_Finger41"
    Medical.HitDetection.Bones[4154] = "SKEL_L_Finger42"
    Medical.HitDetection.Bones[4169] = "SKEL_L_Finger11"
    Medical.HitDetection.Bones[4170] = "SKEL_L_Finger12"
    Medical.HitDetection.Bones[4185] = "SKEL_L_Finger21"
    Medical.HitDetection.Bones[4186] = "SKEL_L_Finger22"
    Medical.HitDetection.Bones[5232] = "RB_L_ArmRoll"
    Medical.HitDetection.Bones[6286] = "IK_R_Hand"
    Medical.HitDetection.Bones[6442] = "RB_R_ThighRoll"
    Medical.HitDetection.Bones[10706] = "SKEL_R_Clavicle"
    Medical.HitDetection.Bones[11174] = "FB_R_Lip_Corner_000"
    Medical.HitDetection.Bones[11816] = "SKEL_Pelvis"
    Medical.HitDetection.Bones[12844] = "IK_Head"
    Medical.HitDetection.Bones[14201] = "SKEL_L_Foot"
    Medical.HitDetection.Bones[16335] = "MH_R_Knee"
    Medical.HitDetection.Bones[17188] = "FB_LowerLipRoot_000"
    Medical.HitDetection.Bones[17719] = "FB_R_Lip_Top_000"
    Medical.HitDetection.Bones[18905] = "SKEL_L_Hand"
    Medical.HitDetection.Bones[19336] = "FB_R_CheekBone_000"
    Medical.HitDetection.Bones[20178] = "FB_UpperLipRoot_000"
    Medical.HitDetection.Bones[20279] = "FB_L_Lip_Top_000"
    Medical.HitDetection.Bones[20623] = "FB_LowerLip_000"
    Medical.HitDetection.Bones[20781] = "SKEL_R_Toe0"
    Medical.HitDetection.Bones[21550] = "FB_L_CheekBone_000"
    Medical.HitDetection.Bones[22711] = "MH_L_Elbow"
    Medical.HitDetection.Bones[23553] = "SKEL_Spine0"
    Medical.HitDetection.Bones[23639] = "RB_L_ThighRoll"
    Medical.HitDetection.Bones[24806] = "PH_R_Foot"
    Medical.HitDetection.Bones[24816] = "SKEL_Spine1"
    Medical.HitDetection.Bones[24817] = "SKEL_Spine2"
    Medical.HitDetection.Bones[24818] = "SKEL_Spine3"
    Medical.HitDetection.Bones[25260] = "FB_L_Eye_000"
    Medical.HitDetection.Bones[26610] = "SKEL_L_Finger00"
    Medical.HitDetection.Bones[26611] = "SKEL_L_Finger10"
    Medical.HitDetection.Bones[26612] = "SKEL_L_Finger20"
    Medical.HitDetection.Bones[26613] = "SKEL_L_Finger30"
    Medical.HitDetection.Bones[26614] = "SKEL_L_Finger40"
    Medical.HitDetection.Bones[27474] = "FB_R_Eye_000"
    Medical.HitDetection.Bones[28252] = "SKEL_R_Forearm"
    Medical.HitDetection.Bones[28422] = "PH_R_Hand"
    Medical.HitDetection.Bones[29868] = "FB_L_Lip_Corner_000"
    Medical.HitDetection.Bones[31086] = "SKEL_Head"
    Medical.HitDetection.Bones[35502] = "IK_R_Foot"
    Medical.HitDetection.Bones[35731] = "RB_Neck_1"
    Medical.HitDetection.Bones[36029] = "IK_L_Hand"
    Medical.HitDetection.Bones[36864] = "SKEL_R_Calf"
    Medical.HitDetection.Bones[37119] = "RB_R_ArmRoll"
    Medical.HitDetection.Bones[37193] = "FB_Brow_Centre_000"
    Medical.HitDetection.Bones[39317] = "SKEL_Neck_1"
    Medical.HitDetection.Bones[40269] = "SKEL_R_UpperArm"
    Medical.HitDetection.Bones[43536] = "FB_R_Lid_Upper_000"
    Medical.HitDetection.Bones[43810] = "RB_R_ForeArmRoll"
    Medical.HitDetection.Bones[45509] = "SKEL_L_UpperArm"
    Medical.HitDetection.Bones[45750] = "FB_L_Lid_Upper_000"
    Medical.HitDetection.Bones[46078] = "MH_L_Knee"
    Medical.HitDetection.Bones[46240] = "FB_Jaw_000"
    Medical.HitDetection.Bones[47419] = "FB_L_Lip_Bot_000"
    Medical.HitDetection.Bones[47495] = "FB_Tongue_000"
    Medical.HitDetection.Bones[49979] = "FB_R_Lip_Bot_000"
    Medical.HitDetection.Bones[51826] = "SKEL_R_Thigh"
    Medical.HitDetection.Bones[52301] = "SKEL_R_Foot"
    Medical.HitDetection.Bones[56604] = "IK_Root"
    Medical.HitDetection.Bones[57005] = "SKEL_R_Hand"
    Medical.HitDetection.Bones[57597] = "SKEL_Spine_Root"
    Medical.HitDetection.Bones[57717] = "PH_L_Foot"
    Medical.HitDetection.Bones[58271] = "SKEL_L_Thigh"
    Medical.HitDetection.Bones[58331] = "FB_L_Brow_Out_000"
    Medical.HitDetection.Bones[58866] = "SKEL_R_Finger00"
    Medical.HitDetection.Bones[58867] = "SKEL_R_Finger10"
    Medical.HitDetection.Bones[58868] = "SKEL_R_Finger20"
    Medical.HitDetection.Bones[58869] = "SKEL_R_Finger30"
    Medical.HitDetection.Bones[58870] = "SKEL_R_Finger40"
    Medical.HitDetection.Bones[60309] = "PH_L_Hand"
    Medical.HitDetection.Bones[61007] = "RB_L_ForeArmRoll"
    Medical.HitDetection.Bones[61163] = "SKEL_L_Forearm"
    Medical.HitDetection.Bones[61839] = "FB_UpperLip_000"
    Medical.HitDetection.Bones[63931] = "SKEL_L_Calf"
    Medical.HitDetection.Bones[64016] = "SKEL_R_Finger01"
    Medical.HitDetection.Bones[64017] = "SKEL_R_Finger02"
    Medical.HitDetection.Bones[64064] = "SKEL_R_Finger31"
    Medical.HitDetection.Bones[64065] = "SKEL_R_Finger32"
    Medical.HitDetection.Bones[64080] = "SKEL_R_Finger41"
    Medical.HitDetection.Bones[64081] = "SKEL_R_Finger42"
    Medical.HitDetection.Bones[64096] = "SKEL_R_Finger11"
    Medical.HitDetection.Bones[64097] = "SKEL_R_Finger12"
    Medical.HitDetection.Bones[64112] = "SKEL_R_Finger21"
    Medical.HitDetection.Bones[64113] = "SKEL_R_Finger22"
    Medical.HitDetection.Bones[64729] = "SKEL_L_Clavicle"
    Medical.HitDetection.Bones[65068] = "FACIAL_facialRoot"
    Medical.HitDetection.Bones[65245] = "IK_L_Foot"    
end 

Medical.HitDetection.GetLastSourceOfDamage = function ()
    return Medical.Network.HitDetection.GetLastSourceOfDamage()
end
5

Medical.HitDetection.GotHit = function (victim, culprit, weapon, DamageType)
    --[[
    This function should determine the source of the damage, the bone, the bleeding, the implications of the damage
    Including which organ it has hit etc etc, most of the behind the scenes magic will be done here
    ]]
    
end

Medical.HitDetection.SetupEvents = function ()
    -- https://runtime.fivem.net/doc/events/client/
    AddEventHandler('entityDamaged', Medical.HitDetection.Events.entityDamaged)
end

Medical.HitDetection.Events.entityDamaged = function (victim, culprit, weapon, baseDamage)
    -- Base damage is always 0 for some reason
    -- If we cannot convert the weapon to a vehicle or weapon
    -- then we assume it's a vehicle, limitations stop us from checking the 
    -- Type of vehicle etc that's hit us, we could be hacky and check the nearest
    -- car but that'll cause issues down the road


    -- Types: Vehicle, Weapon, Unknown
    local DamageType

    if GetWeapontypeModel(weapon) == 0 and GetEntityModel(weapon) == 0 then
        DamageType = 'Vehicle'
    elseif GetWeapontypeModel(weapon) ~= 0 then
        DamageType = 'Weapon'
    else
        DamageType = 'Unknown'
    end

    Medical.HitDetection.GotHit(victim, culprit, weapon, DamageType)
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

 /*
AddEventHandler('gameEventTriggered', function(eventName, eventData)
    if eventName == 'CEventNetworkEntityDamage' then
        local LocalPed = PlayerPedId()
        local IsValid, BoneHit = GetPedLastDamageBone(LocalPed)

        Medical.HitDetection.GotHit(IsValid, BoneHit, Medical.HitDetection.GetLastSourceOfDamage(), )

        print("Bone hit: " .. (Medical.HitDetection.Bones[BoneHit] or 'None'))
        print("Hit by " .. Medical.HitDetection.GetLastSourceOfDamage())
        print("Entity damage info: ", eventName, dump(eventData))
    end
end)
*/

Medical.ConfirmLoaded('HitDetection')