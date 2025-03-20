Medical = Medical or {}
Medical.HitDetection = Medical.HitDetection or {}
Medical.HitDetection.Bones = Medical.HitDetection.Bones or {}
Medical.HitDetection.Events = Medical.HitDetection.Events or {}
Medical.HitDetection.WeaponHashes = Medical.HitDetection.WeaponHashes or {}
Medical.HitDetection.WeaponInformation = Medical.HitDetection.WeaponInformation or {}
Medical.HitDetection.AmmunationInformation = Medical.HitDetection.AmmunationInformation or {}

Medical.ErrorHandler = Medical.ErrorHandler or Medical.WaitFor('ErrorHandler')
Medical.Network = Medical.Network or Medical.WaitFor('Network')
Medical.Blood = Medical.Blood or Medical.WaitFor('Blood')

local _ThrowError = Medical.ErrorHandler.ThrowError or function (m, c)
    print('^5[Medical]^7 A ^8critical^7 error was encountered: ' .. m)
end

Medical.HitDetection.FillWeaponHashes = function ()
    local weaponHashes = {
        [GetHashKey("WEAPON_ADVANCEDRIFLE")] = "weapon_advancedrifle",
        [GetHashKey("WEAPON_APPISTOL")] = "weapon_appistol",
        [GetHashKey("WEAPON_ASSAULTRIFLE")] = "weapon_assaultrifle",
        [GetHashKey("WEAPON_ASSAULTRIFLE_MK2")] = "weapon_assaultrifle_mk2",
        [GetHashKey("WEAPON_ASSAULTSHOTGUN")] = "weapon_assaultshotgun",
        [GetHashKey("WEAPON_ASSAULTSMG")] = "weapon_assaultsmg",
        [GetHashKey("WEAPON_AUTOSHOTGUN")] = "weapon_autoshotgun",
        [GetHashKey("WEAPON_BALL")] = "weapon_ball",
        [GetHashKey("WEAPON_BAT")] = "weapon_bat",
        [GetHashKey("WEAPON_BATTLEAXE")] = "weapon_battleaxe",
        [GetHashKey("WEAPON_BOTTLE")] = "weapon_bottle",
        [GetHashKey("WEAPON_BULLPUPRIFLE")] = "weapon_bullpuprifle",
        [GetHashKey("WEAPON_BULLPUPRIFLE_MK2")] = "weapon_bullpuprifle_mk2",
        [GetHashKey("WEAPON_BULLPUPSHOTGUN")] = "weapon_bullpupshotgun",
        [GetHashKey("WEAPON_BZGAS")] = "weapon_bzgas",
        [GetHashKey("WEAPON_CARBINERIFLE")] = "weapon_carbinerifle",
        [GetHashKey("WEAPON_CARBINERIFLE_MK2")] = "weapon_carbinerifle_mk2",
        [GetHashKey("WEAPON_COMBATMG")] = "weapon_combatmg",
        [GetHashKey("WEAPON_COMBATMG_MK2")] = "weapon_combatmg_mk2",
        [GetHashKey("WEAPON_COMBATPDW")] = "weapon_combatpdw",
        [GetHashKey("WEAPON_COMBATPISTOL")] = "weapon_combatpistol",
        [GetHashKey("WEAPON_COMPACTLAUNCHER")] = "weapon_compactlauncher",
        [GetHashKey("WEAPON_COMPACTRIFLE")] = "weapon_compactrifle",
        [GetHashKey("WEAPON_CROWBAR")] = "weapon_crowbar",
        [GetHashKey("WEAPON_DAGGER")] = "weapon_dagger",
        [GetHashKey("WEAPON_DBSHOTGUN")] = "weapon_dbshotgun",
        [GetHashKey("WEAPON_DOUBLEACTION")] = "weapon_doubleaction",
        [GetHashKey("WEAPON_FIREEXTINGUISHER")] = "weapon_fireextinguisher",
        [GetHashKey("WEAPON_FIREWORK")] = "weapon_firework",
        [GetHashKey("WEAPON_FLARE")] = "weapon_flare",
        [GetHashKey("WEAPON_FLAREGUN")] = "weapon_flaregun",
        [GetHashKey("WEAPON_FLASHLIGHT")] = "weapon_flashlight",
        [GetHashKey("WEAPON_GOLFCLUB")] = "weapon_golfclub",
        [GetHashKey("WEAPON_GRENADE")] = "weapon_grenade",
        [GetHashKey("WEAPON_GRENADELAUNCHER")] = "weapon_grenadelauncher",
        [GetHashKey("WEAPON_GUSENBERG")] = "weapon_gusenberg",
        [GetHashKey("WEAPON_HAMMER")] = "weapon_hammer",
        [GetHashKey("WEAPON_HATCHET")] = "weapon_hatchet",
        [GetHashKey("WEAPON_HEAVYPISTOL")] = "weapon_heavypistol",
        [GetHashKey("WEAPON_HEAVYSHOTGUN")] = "weapon_heavyshotgun",
        [GetHashKey("WEAPON_HEAVYSNIPER")] = "weapon_heavysniper",
        [GetHashKey("WEAPON_HEAVYSNIPER_MK2")] = "weapon_heavysniper_mk2",
        [GetHashKey("WEAPON_HOMINGLAUNCHER")] = "weapon_hominglauncher",
        [GetHashKey("WEAPON_KNIFE")] = "weapon_knife",
        [GetHashKey("WEAPON_KNUCKLE")] = "weapon_knuckle",
        [GetHashKey("WEAPON_MACHETE")] = "weapon_machete",
        [GetHashKey("WEAPON_MACHINEPISTOL")] = "weapon_machinepistol",
        [GetHashKey("WEAPON_MARKSMANPISTOL")] = "weapon_marksmanpistol",
        [GetHashKey("WEAPON_MARKSMANRIFLE")] = "weapon_marksmanrifle",
        [GetHashKey("WEAPON_MARKSMANRIFLE_MK2")] = "weapon_marksmanrifle_mk2",
        [GetHashKey("WEAPON_MG")] = "weapon_mg",
        [GetHashKey("WEAPON_MICROSMG")] = "weapon_microsmg",
        [GetHashKey("WEAPON_MINIGUN")] = "weapon_minigun",
        [GetHashKey("WEAPON_MINISMG")] = "weapon_minismg",
        [GetHashKey("WEAPON_MOLOTOV")] = "weapon_molotov",
        [GetHashKey("WEAPON_MUSKET")] = "weapon_musket",
        [GetHashKey("WEAPON_NIGHTSTICK")] = "weapon_nightstick",
        [GetHashKey("WEAPON_PETROLCAN")] = "weapon_petrolcan",
        [GetHashKey("WEAPON_PIPEBOMB")] = "weapon_pipebomb",
        [GetHashKey("WEAPON_PISTOL")] = "weapon_pistol",
        [GetHashKey("WEAPON_PISTOL50")] = "weapon_pistol50",
        [GetHashKey("WEAPON_PISTOL_MK2")] = "weapon_pistol_mk2",
        [GetHashKey("WEAPON_POOLCUE")] = "weapon_poolcue",
        [GetHashKey("WEAPON_PROXMINE")] = "weapon_proxmine",
        [GetHashKey("WEAPON_PUMPSHOTGUN")] = "weapon_pumpshotgun",
        [GetHashKey("WEAPON_PUMPSHOTGUN_MK2")] = "weapon_pumpshotgun_mk2",
        [GetHashKey("WEAPON_RAILGUN")] = "weapon_railgun",
        [GetHashKey("WEAPON_REVOLVER")] = "weapon_revolver",
        [GetHashKey("WEAPON_REVOLVER_MK2")] = "weapon_revolver_mk2",
        [GetHashKey("WEAPON_RPG")] = "weapon_rpg",
        [GetHashKey("WEAPON_SAWNOFFSHOTGUN")] = "weapon_sawnoffshotgun",
        [GetHashKey("WEAPON_SMG")] = "weapon_smg",
        [GetHashKey("WEAPON_SMG_MK2")] = "weapon_smg_mk2",
        [GetHashKey("WEAPON_SMOKEGRENADE")] = "weapon_smokegrenade",
        [GetHashKey("WEAPON_SNIPERRIFLE")] = "weapon_sniperrifle",
        [GetHashKey("WEAPON_SNOWBALL")] = "weapon_snowball",
        [GetHashKey("WEAPON_SNSPISTOL")] = "weapon_snspistol",
        [GetHashKey("WEAPON_SNSPISTOL_MK2")] = "weapon_snspistol_mk2",
        [GetHashKey("WEAPON_SPECIALCARBINE")] = "weapon_specialcarbine",
        [GetHashKey("WEAPON_SPECIALCARBINE_MK2")] = "weapon_specialcarbine_mk2",
        [GetHashKey("WEAPON_STICKYBOMB")] = "weapon_stickybomb",
        [GetHashKey("WEAPON_STUNGUN")] = "weapon_stungun",
        [GetHashKey("WEAPON_SWITCHBLADE")] = "weapon_switchblade",
        [GetHashKey("WEAPON_UNARMED")] = "weapon_unarmed",
        [GetHashKey("WEAPON_VINTAGEPISTOL")] = "weapon_vintagepistol",
        [GetHashKey("WEAPON_WRENCH")] = "weapon_wrench"
    }

    Medical.HitDetection.WeaponHashes = weaponHashes
end

local BleedingRates = {
    Critical = {amount = 75, delay = 0.4},
    Moderate = {amount = 40, delay = 0.8},
    Minor = {amount = 15, delay = 1.5}
}

local BoneBleedingMapping = {
    -- Critical Bleeding
    [31086] = BleedingRates.Critical,  -- Head
    [12844] = BleedingRates.Critical,  -- IK Head
    [39317] = BleedingRates.Critical,  -- Neck
    [11816] = BleedingRates.Critical,  -- Pelvis
    [52301] = BleedingRates.Critical,  -- Thigh
    [51826] = BleedingRates.Critical,  -- Thigh

    -- Moderate Bleeding
    [40269] = BleedingRates.Moderate,  -- R Upper Arm
    [45509] = BleedingRates.Moderate,  -- L Upper Arm
    [28252] = BleedingRates.Moderate,  -- R Forearm
    [61163] = BleedingRates.Moderate,  -- L Forearm
    [63931] = BleedingRates.Moderate,  -- L Calf
    [36864] = BleedingRates.Moderate,  -- R Calf
    [14201] = BleedingRates.Moderate,  -- L Foot
    [52301] = BleedingRates.Moderate,  -- R Foot

    -- Minor Bleeding
    [57005] = BleedingRates.Minor,  -- R Hand
    [18905] = BleedingRates.Minor,  -- L Hand
    [26610] = BleedingRates.Minor,  -- L Finger
    [58866] = BleedingRates.Minor,  -- R Finger
    [20781] = BleedingRates.Minor,  -- R Toe
    [2108]  = BleedingRates.Minor   -- L Toe
}

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

Medical.HitDetection.FillWeaponInformation = function ()
    local Bluntforce = {
        ["WEAPON_FISTS"] = {damage=2},
        ["VEHICLE"] = {damage=4},
        ["weapon_unarmed"] = {damage=1},
        ["weapon_bat"] = {damage=6},
        ["weapon_flashlight"] = {damage=4},
        ["weapon_golfclub"] = {damage=4},
        ["weapon_hammer"] = {damage=4},
        ["weapon_knuckle"] = {damage=5},
        ["weapon_nightstick"] = {damage=3},
        ["weapon_wrench"] = {damage=6},
        ["weapon_poolcue"] = {damage=2},
        ["weapon_stunrod"] = {damage=1},
        ["weapon_candycane"] = {damage=1},
    }

    local Slashing = {
        ["weapon_machete"] = {damage=13},
    }

    local Stabbing = {
        ["weapon_dagger"] = {damage=16},
        ["weapon_bottle"] = {damage=12},
        ["weapon_crowbar"] = {damage=14},
        ["weapon_hatchet"] = {damage=17},
        ["weapon_knife"] = {damage=15},
        ["weapon_switchblade"] = {damage=12},
        ["weapon_battleaxe"] = {damage=16},
        ["weapon_stone_hatchet"] = {damage=13},
    }

    local Gun = {
        ["weapon_microsmg"] = {damage=25, calibre=Medical.HitDetection.AmmunationInformation['9mm']},
        ["weapon_smg"] = {damage=25, calibre=Medical.HitDetection.AmmunationInformation['9mm']},
        ["weapon_smg_mk2"] = {damage=25, calibre=Medical.HitDetection.AmmunationInformation['9mm']},
        ["weapon_assaultsmg"] = {damage=25, calibre=Medical.HitDetection.AmmunationInformation['9mm']},
        ["weapon_combatpdw"] = {damage=25, calibre=Medical.HitDetection.AmmunationInformation['9mm']},
        ["weapon_machinepistol"] = {damage=25, calibre=Medical.HitDetection.AmmunationInformation['9mm']},
        ["weapon_minismg"] = {damage=25, calibre=Medical.HitDetection.AmmunationInformation['9mm']},
        ["weapon_tecpistol"] = {damage=25, calibre=Medical.HitDetection.AmmunationInformation['9mm']},
        ["weapon_pistol"] = {damage=25, calibre=Medical.HitDetection.AmmunationInformation['9mm']},
        ["weapon_pistol_mk2"] = {damage=25, calibre=Medical.HitDetection.AmmunationInformation['9mm']},
        ["weapon_combatpistol"] = {damage=25, calibre=Medical.HitDetection.AmmunationInformation['9mm']},
        ["weapon_appistol"] = {damage=25, calibre=Medical.HitDetection.AmmunationInformation['9mm']},
        ["weapon_pistol50"] = {damage=70, calibre=Medical.HitDetection.AmmunationInformation['50ae']},
        ["weapon_snspistol"] = {damage=25, calibre=Medical.HitDetection.AmmunationInformation['9mm']},
        ["weapon_snspistol_mk2"] = {damage=25, calibre=Medical.HitDetection.AmmunationInformation['9mm']},
        ["weapon_heavypistol"] = {damage=45, calibre=Medical.HitDetection.AmmunationInformation['.45']},
        ["weapon_vintagepistol"] = {damage=25, calibre=Medical.HitDetection.AmmunationInformation['9mm']},
        ["weapon_marksmanpistol"] = {damage=70, calibre=Medical.HitDetection.AmmunationInformation['44mag']},
        ["weapon_revolver"] = {damage=70, calibre=Medical.HitDetection.AmmunationInformation['44mag']},
        ["weapon_revolver_mk2"] = {damage=70, calibre=Medical.HitDetection.AmmunationInformation['44mag']},
        ["weapon_doubleaction"] = {damage=70, calibre=Medical.HitDetection.AmmunationInformation['44mag']},
        ["weapon_ceramicpistol"] = {damage=25, calibre=Medical.HitDetection.AmmunationInformation['9mm']},
        ["weapon_navyrevolver"] = {damage=25, calibre=Medical.HitDetection.AmmunationInformation['44mag']},
        ["weapon_gadgetpistol"] = {damage=25, calibre=Medical.HitDetection.AmmunationInformation['9mm']},
        ["weapon_pistolxm3"] = {damage=25, calibre=Medical.HitDetection.AmmunationInformation['9mm']},
        ["weapon_pumpshotgun"] = {damage=85, calibre=Medical.HitDetection.AmmunationInformation['12g']},
        ["weapon_pumpshotgun_mk2"] = {damage=85, calibre=Medical.HitDetection.AmmunationInformation['12g']},
        ["weapon_sawnoffshotgun"] = {damage=85, calibre=Medical.HitDetection.AmmunationInformation['12g']},
        ["weapon_assaultshotgun"] = {damage=85, calibre=Medical.HitDetection.AmmunationInformation['12g']},
        ["weapon_bullpupshotgun"] = {damage=85, calibre=Medical.HitDetection.AmmunationInformation['12g']},
        ["weapon_heavyshotgun"] = {damage=85, calibre=Medical.HitDetection.AmmunationInformation['12g']},
        ["weapon_dbshotgun"] = {damage=85, calibre=Medical.HitDetection.AmmunationInformation['12g']},
        ["weapon_autoshotgun"] = {damage=85, calibre=Medical.HitDetection.AmmunationInformation['12g']},
        ["weapon_combatshotgun"] = {damage=85, calibre=Medical.HitDetection.AmmunationInformation['12g']},
        ["weapon_assaultrifle"] = {damage=45, calibre=Medical.HitDetection.AmmunationInformation['7.62x39mm']},
        ["weapon_assaultrifle_mk2"] = {damage=45, calibre=Medical.HitDetection.AmmunationInformation['7.62x39mm']},
        ["weapon_carbinerifle"] = {damage=35, calibre=Medical.HitDetection.AmmunationInformation['5.56mm']},
        ["weapon_carbinerifle_mk2"] = {damage=35, calibre=Medical.HitDetection.AmmunationInformation['5.56mm']},
        ["weapon_advancedrifle"] = {damage=35, calibre=Medical.HitDetection.AmmunationInformation['5.56mm']},
        ["weapon_specialcarbine"] = {damage=35, calibre=Medical.HitDetection.AmmunationInformation['5.56mm']},
        ["weapon_specialcarbine_mk2"] = {damage=35, calibre=Medical.HitDetection.AmmunationInformation['5.56mm']},
        ["weapon_bullpuprifle"] = {damage=45, calibre=Medical.HitDetection.AmmunationInformation['7.62x39mm']},
        ["weapon_bullpuprifle_mk2"] = {damage=45, calibre=Medical.HitDetection.AmmunationInformation['7.62x39mm']},
        ["weapon_compactrifle"] = {damage=45, calibre=Medical.HitDetection.AmmunationInformation['7.62x39mm']},
        ["weapon_militaryrifle"] = {damage=35, calibre=Medical.HitDetection.AmmunationInformation['5.56mm']},
        ["weapon_heavyrifle"] = {damage=55, calibre=Medical.HitDetection.AmmunationInformation['7.62x51mm']},
        ["weapon_tacticalrifle"] = {damage=35, calibre=Medical.HitDetection.AmmunationInformation['5.56mm']},
        ["weapon_mg"] = {damage=55, calibre=Medical.HitDetection.AmmunationInformation['7.62x51mm']},
        ["weapon_combatmg"] = {damage=35, calibre=Medical.HitDetection.AmmunationInformation['5.56mm']},
        ["weapon_combatmg_mk2"] = {damage=35, calibre=Medical.HitDetection.AmmunationInformation['5.56mm']},
        ["weapon_gusenberg"] = {damage=45, calibre=Medical.HitDetection.AmmunationInformation['.45']},
        ["weapon_sniperrifle"] = {damage=55, calibre=Medical.HitDetection.AmmunationInformation['7.62x51mm']},
        ["weapon_heavysniper"] = {damage=100, calibre=Medical.HitDetection.AmmunationInformation['50bmg']},
        ["weapon_heavysniper_mk2"] = {damage=100, calibre=Medical.HitDetection.AmmunationInformation['50bmg']},
        ["weapon_marksmanrifle"] = {damage=55, calibre=Medical.HitDetection.AmmunationInformation['7.62x51mm']},
        ["weapon_marksmanrifle_mk2"] = {damage=55, calibre=Medical.HitDetection.AmmunationInformation['7.62x51mm']},
        ["weapon_precisionrifle"] = {damage=55, calibre=Medical.HitDetection.AmmunationInformation['7.62x51mm']},
        ["weapon_musket"] = {damage=100, calibre=Medical.HitDetection.AmmunationInformation['50bmg']},
    }

    Medical.HitDetection.WeaponInformation['Bluntforce'] = Medical.HitDetection.WeaponInformation['Bluntforce'] or {}
    Medical.HitDetection.WeaponInformation['Slashing'] = Medical.HitDetection.WeaponInformation['Slashing'] or {} 
    Medical.HitDetection.WeaponInformation['Stabbing'] = Medical.HitDetection.WeaponInformation['Stabbing'] or {} 
    Medical.HitDetection.WeaponInformation['Gun'] = Medical.HitDetection.WeaponInformation['Gun'] or {} 

    Medical.HitDetection.WeaponInformation['Bluntforce'] = Bluntforce
    Medical.HitDetection.WeaponInformation['Slashing'] = Slashing
    Medical.HitDetection.WeaponInformation['Stabbing'] = Stabbing
    Medical.HitDetection.WeaponInformation['Gun'] = Gun

end

Medical.HitDetection.FillAmmunationInformation = function ()
    -- In M/s
    -- These are just approximations based on quick google searches, feel free to change any of this
    Medical.HitDetection.AmmunationInformation['9mm'] = { displayname='9mm', velocity=370, grams=8, drag=0.25 } -- FMJ 124gr (VG)
    Medical.HitDetection.AmmunationInformation['.45'] = { displayname='.45 ACP',velocity=260, grams=15, drag=0.30 } -- Auto FMJ (VG)
    Medical.HitDetection.AmmunationInformation['44mag'] = { displayname='.44 Magnum',velocity=492, grams=15.5, drag=0.32 } -- (Drag 0.172) (V)
    Medical.HitDetection.AmmunationInformation['50ae'] = { displayname='.50 Action Express',velocity=370, grams=26, drag=0.33 } -- 
    Medical.HitDetection.AmmunationInformation['12g'] = { displayname='12 Gauge',velocity=490, grams=28.4, drag=0.40 } -- Federal Power-Shok Rifled Slugs (VG) (Drag .110)
    Medical.HitDetection.AmmunationInformation['7.62x51mm'] = { displayname='7.62x51mm',velocity=838, grams=9.65, drag=0.26 } -- M80 Ball (Drag G1 .45 G7 .2) (VG)
    Medical.HitDetection.AmmunationInformation['7.62x39mm'] = { displayname='7.62x39mm',velocity=710, grams=9.95, drag=0.26}  -- Standard Steel Core (VG)
    Medical.HitDetection.AmmunationInformation['5.56mm'] = { displayname='5.56x45 NATO',velocity=915, grams=4, drag=0.23 } -- SS109/M855 (Drag G1 .35) (VG)
    Medical.HitDetection.AmmunationInformation['50bmg'] = { displayname='.50 BMG',velocity=887, grams=43, drag=0.24 } -- M33 Ball (VG) 
end

Medical.HitDetection.GetLastSourceOfDamage = function ()
    return Medical.Network.HitDetection.GetLastSourceOfDamage()
end


Medical.HitDetection.GotHit = function (victim, culprit, weapon, DamageType)
    --[[
    This function should determine the source of the damage, the bone, the bleeding, the implications of the damage
    Including which organ it has hit etc etc, most of the behind the scenes magic will be done here
    ]]
    local LocalPed = PlayerPedId()
    local IsValid, BoneHit = GetPedLastDamageBone(LocalPed)

    -- Possible Future Issue: We may not be able to tell between somebody meleeing with a gun or a gunshot. Need to look into this.

    -- Firstly, is it bluntforce, gunshot or stabbing?
    -- 100 is a pratically 100% chance of dying, 100 would be a 50 cal 
 

    if DamageType == 'Weapon' then
        -- Get weapon of user
        local WeaponName = Medical.HitDetection.WeaponHashes[weapon]
        if not WeaponName then
            _ThrowError("Unable to find weapon name for hash: " .. weapon)
            return
        end

        -- Find out if it's a gun, blunt, stabbbing or slashing
        local WeaponType
        
        if Medical.HitDetection.WeaponInformation['Bluntforce'][WeaponName] then WeaponType = 'Bluntforce' end
        if Medical.HitDetection.WeaponInformation['Gun'][WeaponName] then WeaponType = 'Gun' end
        if Medical.HitDetection.WeaponInformation['Slashing'][WeaponName] then WeaponType = 'Slashing' end
        if Medical.HitDetection.WeaponInformation['Stabbing'][WeaponName] then WeaponType = 'Stabbing' end

        if not WeaponType then
            _ThrowError("Unable to find weapon type for weapon: " .. WeaponName)
            return
        end

        -- Get the weapon information
        local WeaponInformation = Medical.HitDetection.WeaponInformation[WeaponType][WeaponName]
        if not WeaponInformation then
            _ThrowError("Unable to find weapon information for weapon: " .. WeaponName)
            return
        end

        if WeaponType == 'Gun' then
            local victimCoords = GetEntityCoords(victim)
            local culpritCoords = GetEntityCoords(culprit)
            
            -- This is extremely flawed, I need somebody whos better at math to help me
            -- The bullet loses an extremely high amount of energy based to its distance when it shouldn't los
            -- that much
    
            local Distance = #(victimCoords - culpritCoords)
            local Velocity = WeaponInformation['calibre']['velocity'] -- Initial velocity (m/s)
            local Grams = WeaponInformation['calibre']['grams'] -- Bullet mass (grams)
            local DragCoeffecient = WeaponInformation['calibre']['drag'] -- Drag coefficient
            
            local mass = Grams / 1000 -- Convert grams to kg
            local initialKE = 0.5 * mass * (Velocity * Velocity) -- Initial kinetic energy
            local MaxDamage =  WeaponInformation['damage']
            -- drag factor
            local k = DragCoeffecient / (mass * 1000)
            local finalVelocity = (Velocity / ((1 + k) * Distance)*100) -- Smooth quadratic decay
            
            -- Compute final kinetic energy
            local finalKE = 0.5 * mass * (finalVelocity * finalVelocity)
        
            local FinalDamage = (MaxDamage * (finalKE / initialKE))
            if FinalDamage > MaxDamage then FinalDamage = MaxDamage end

            print("FinalKE: " .. finalKE .. ' InitialKE: '.. initialKE .. ' Final Damage: ' .. FinalDamage .. ' Distance: ' .. Distance .. ' k: ' .. k .. ' Final Velocity: ' .. finalVelocity .. ' Mass: ' .. mass .. ' DragcoEffecient: ' .. DragCoeffecient)

            -- Apply bleeding proportional to the damage
            local Bleeding = BoneBleedingMapping[BoneHit] or BleedingRates.Minor

            Medical.Blood.AddBleeding(Bleeding.amount, Bleeding.delay, BoneHit)
        end

    end



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

    if not IsEntityAPed(victim) then return end
    --if victim ~= PlayerPedId() then return end

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
        print("Entity damage info: "] = {damage=10}, eventName, dump(eventData))
    end
end)
*/

Medical.ConfirmLoaded('HitDetection')