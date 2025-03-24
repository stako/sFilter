if WOW_PROJECT_ID ~= WOW_PROJECT_CATACLYSM_CLASSIC then return end
local _, ns = ...

ns.iconData = {
  ["GENERAL"] = {
    {
      size = 30, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMLEFT", UIParent, "CENTER", 125, 0},
      spells = {
        94794,  -- Rocket Fuel Leak
        49206,  -- Summon Gargoyle
        83853,  -- Combustion
        77606,  -- Dark Simulacrum
        82235,  -- Corruption: Sickness (Cho'gall)
        88518,  -- Twilight Meteorite (Theralion & Valiona)
        80627,  -- Stolen Power (Nefarian)
        89421,  -- Wrack (Sinestra)
        89435,  -- Wrack (Sinestra)
        99461,  -- Blazing Power (Alysrazor)
        99516,  -- Countdown (Baleroc)
        99256,  -- Torment (Baleroc)
        99257,  -- Tormented (Baleroc)
        99489,  -- Tormented (Baleroc)
        -- 98450,  -- Searing Seeds (Majordomo Staghelm)
        98245,   -- Legendary Concentration (Majordomo Staghelm)
        100594,  -- Superheated (Ragnaros)
        110317,  -- Watery Entrenchment (Hagara)
        105316   -- Ice Lance (Hagara)
      }
    },

    {
      size = 30, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -125, 36},
      spells = {
        642,    -- Divine Shield
        19263,  -- Deterrence
        47585,  -- Dispersion
        1022,   -- Hand of Protection
        6940,   -- Hand of Sacrifice
        33206,  -- Pain Suppresion
        53480   -- Roar of Sacrifice
      }
    }
  },
  ["SHAMAN"] = {
    -- Water Shield / Earth Shield
    {spells = {52127, 974}, size = 30, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -125, 0}},

    -- Tidal Waves
    {spells = {53390}, size = 22, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 98, -18}},

    -- Spiritwalker's Grace
    {spells = {79206}, size = 30, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -125, -36}},

    -- Grounding Totem Effect
    {spells = {8178}, size = 30, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -161, 0}},
  },
  ["DEATHKNIGHT"] = {
    -- Crimson Scourge
    {spells = {81141}, size = 30, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -125, 0}},

    -- Bone Shield
    {spells = {49222}, size = 22, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 98, -18}},

    -- Frost Fever
    {spells = {55095}, size = 22, alpha = 1, unit = "target", isMine = true, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 176, -18}},

    -- Blood Plague
    {spells = {55078}, size = 22, alpha = 1, unit = "target", isMine = true, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 202, -18}},
  },
  ["DRUID"] = {},
  ["HUNTER"] = {
    -- Aspect of the Pack / Aspect of the Cheetah / Camouflage
    {spells = {5118, 13159, 51755}, size = 30, alpha = 1, unit = "player", isMine = true, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -125, 0}},

    -- Trap Launcher
    {spells = {77769}, size = 30, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -161, 0}},

    -- Fire! / Resistance is Futile!
    {spells = {82926, 82897}, size = 30, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -125, -36}},

    -- Mend Pet
    {spells = {136}, size = 22, alpha = 1, unit = "pet", isMine = false, setPoint = {"LEFT", PetFrame, "RIGHT", -8, -4}},

    -- Aspect of the Hawk / Aspect of the Fox / Aspect of the Wild
    {spells = {13165, 82661, 20043}, size = 22, alpha = 1, unit = "player", isMine = true, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 98, -18}},

    -- Sniper Training / Improved Steady Shot / Focus Fire
    {spells = {64420, 53220, 82692}, size = 22, alpha = 1, unit = "player", isMine = true, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 124, -18}},

    -- Serpent Sting
    {spells = {1978, 88453}, size = 22, alpha = 1, unit = "target", isMine = true, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 176, -18}},

    -- Hunter's Mark
    {spells = {1130, 88691}, size = 22, alpha = 1, unit = "target", isMine = false, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 202, -18}},
  },
  ["MAGE"] = {},
  ["PALADIN"] = {
    -- Infusion of Light / Daybreak / Crusader Aura
    {spells = {54149, 88819, 32223}, size = 30, alpha = 1, unit = "player", isMine = true, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -125, 0}},

    -- Avenging Wrath / Divine Favor / Guardian of Ancient Kings
    {spells = {31884, 31842, 86669}, size = 30, alpha = 1, unit = "player", isMine = true, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -125, -36}},

    -- Aura Mastery
    {spells = {31821}, size = 30, alpha = 1, unit = "player", isMine = true, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -161, 0}},

    -- Judgements of the Pure
    {spells = {53657}, size = 22, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 98, -18}},
  },
  ["PRIEST"] = {
    -- Empowered Shadow
    {spells = {95799}, size = 22, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 98, -18}},

    -- Evangelism / Dark Evangelism
    {spells = {81661, 87118}, size = 22, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 124, -18}},

    -- Shadow Word: Pain
    {spells = {589}, size = 22, alpha = 1, unit = "target", isMine = true, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 150, -18}},

    -- Vampiric Touch
    {spells = {34914}, size = 22, alpha = 1, unit = "target", isMine = true, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 176, -18}},

    -- Devouring Plague / Grace
    {spells = {2944, 77613}, size = 22, alpha = 1, unit = "target", isMine = true, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 202, -18}},

    -- Shadow Orb / Vital Flame / Vital Spark
    {spells = {77487, 99263, 99262}, size = 30, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -125, 0}},

    -- Surge of Dominance
    -- {spells = {92218, 85027}, size = 22, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -145, -28}},

    -- Power Torrent
    -- {spells = {74241}, size = 22, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -119, -28}},
  },
  ["ROGUE"] = {
    -- Stealth / Dance / Vanish / Envenom / Deep Insight
    {spells = {1784, 51713, 11327, 84747}, size = 30, alpha = 1, unit = "player", isMine = true, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -125, 0}},

    -- Fury of the Destroyer
    {spells = {109949}, size = 30, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -161, 0}},

    -- Recuperate
    {spells = {73651}, size = 22, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 98, -18}},

    -- Slice and Dice
    {spells = {5171}, size = 22, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 124, -18}},

    -- Blade Flurry / Overkill / Feint
    {spells = {13877, 58427, 1966}, size = 22, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 150, -18}},

    -- Rupture
    {spells = {1943}, size = 22, alpha = 1, unit = "target", isMine = true, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 176, -18}},

    -- Hemorrhage / Revealing Strike
    {spells = {89775, 84617}, size = 22, alpha = 1, unit = "target", isMine = true, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 202, -18}},

    -- Find Weakness
    {spells = {91021}, size = 22, alpha = 1, unit = "target", isMine = true, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 202, 8}},
  },
  ["WARLOCK"] = {
    -- Empowered Imp
    {spells = {47283}, size = 30, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -125, 0}},

    -- Improved Soul Fire
    {spells = {85383}, size = 22, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 98, -18}},

    -- Corruption
    {spells = {172}, size = 22, alpha = 1, unit = "target", isMine = true, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 150, -18}},

    -- Unstable Affliction / Immolate
    {spells = {30108, 348}, size = 22, alpha = 1, unit = "target", isMine = true, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 176, -18}},

    -- Bane of Agony / Bane of Doom
    {spells = {980, 603}, size = 22, alpha = 1, unit = "target", isMine = true, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 202, -18}},
  },
  ["WARRIOR"] = {
    -- Battle Trance
    {spells = {12964}, size = 30, alpha = 1, unit = "player", isMine = true, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -161, 0}},

    -- Bloodsurge / Taste for Blood
    {spells = {46916, 60503}, size = 30, alpha = 1, unit = "player", isMine = true, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -125, 0}},

    -- Slaughter
    {spells = {84586}, size = 22, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 98, -18}},

    -- Sweeping Strikes
    {spells = {12328}, size = 22, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 124, -18}},

    -- Colossus Smash
    {spells = {86346}, size = 22, alpha = 1, unit = "target", isMine = true, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 176, -18}},

    -- Thunder Clap / Frost Fever / Judgements of the Just / Infected Wounds / Dust Cloud
    {spells = {6343, 55095, 68055, 58180, 54404}, size = 22, alpha = 1, unit = "target", spec = 3, isMine = false, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 176, -18}},

    -- Demoralizing Shout / Demoralizing Roar / Vindication / Scarlet Fever
    {spells = {1160, 99, 50256, 26017, 81130}, size = 22, alpha = 1, unit = "target", spec = 3, isMine = false, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 150, -18}},

    -- Rend
    {spells = {94009}, size = 22, alpha = 1, unit = "target", isMine = true, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 202, -18}},
  },
}
