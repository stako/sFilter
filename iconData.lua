local _, ns = ...

ns.borderStyle = 2

ns.iconData = {
  ["GENERAL"] = {
    -- Rocket Fuel Leak / Summon Gargoyle / Combustion / Dark Simulacrum / Corruption: Sickness
    {spells = {94794, 49206, 83853, 77606, 82235}, size = 40, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMLEFT", UIParent, "CENTER", 100, 0}},

    -- Divine Shield / Deterrence / Hand of Protection / Hand of Sacrifice / Pain Suppresion / Roar of Sacrifice / Dispersion
    {spells = {642, 19263, 1022, 6940, 33206, 53480, 47585}, size = 40, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -100, 42}},
  },
  ["SHAMAN"] = {
    -- Water Shield / Earth Shield
    {spells = {52127, 974}, size = 40, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -100, 0}},

    -- Tidal Waves
    {spells = {53390}, size = 22, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 98, -18}},

    -- Spiritwalker's Grace
    {spells = {79206}, size = 40, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -100, -47}},

    -- Grounding Totem Effect
    {spells = {8178}, size = 40, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -147, 0}},
  },
  ["DEATHKNIGHT"] = {},
  ["DRUID"] = {},
  ["HUNTER"] = {
    -- Aspect of the Pack / Aspect of the Cheetah / Camouflage
    {spells = {5118, 13159, 51755}, size = 40, alpha = 1, unit = "player", isMine = true, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -100, 0}},

    -- Trap Launcher
    {spells = {77769}, size = 40, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -142, 0}},

    -- Fire! / Resistance is Futile!
    {spells = {82926, 82897}, size = 40, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -100, -42}},

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
    {spells = {54149, 88819, 32223}, size = 40, alpha = 1, unit = "player", isMine = true, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -100, 0}},

    -- Avenging Wrath / Divine Favor / Guardian of Ancient Kings
    {spells = {31884, 31842, 86669}, size = 40, alpha = 1, unit = "player", isMine = true, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -100, -47}},

    -- Aura Mastery
    {spells = {31821}, size = 40, alpha = 1, unit = "player", isMine = true, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -147, 0}},

    -- Judgements of the Pure
    {spells = {53657}, size = 22, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 98, -18}},
  },
  ["PRIEST"] = {
    -- Empowered Shadow
    {spells = {95799}, size = 22, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 98, -18}},

    -- Dark Evangelism
    {spells = {87118}, size = 22, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 124, -18}},

    -- Shadow Word: Pain
    {spells = {589}, size = 22, alpha = 1, unit = "target", isMine = true, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 150, -18}},

    -- Vampiric Touch
    {spells = {34914}, size = 22, alpha = 1, unit = "target", isMine = true, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 176, -18}},

    -- Devouring Plague
    {spells = {2944}, size = 22, alpha = 1, unit = "target", isMine = true, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 202, -18}},

    -- Shadow Orb
    {spells = {77487}, size = 40, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -100, 0}},

    -- Surge of Dominance
    {spells = {92218, 85027}, size = 22, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -96, -25}},

    -- Power Torrent
    {spells = {74241}, size = 22, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -121, -25}},
  },
  ["ROGUE"] = {
    -- Stealth / Dance / Vanish / Envenom / Deep Insight
    {spells = {1784, 51713, 11327, 84747}, size = 40, alpha = 1, unit = "player", isMine = true, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -100, 0}},

    -- Recuperate
    {spells = {73651}, size = 22, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 98, -18}},

    -- Slice and Dice
    {spells = {5171}, size = 22, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 124, -18}},

    -- Blade Flurry / Overkill / Feint
    {spells = {13877, 58427, 1966}, size = 22, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 150, -18}},

    -- Revealing Strike / Rupture
    {spells = {1943}, size = 22, alpha = 1, unit = "target", isMine = true, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 176, -18}},

    -- Hemorrhage / Revealing Strike
    {spells = {89775, 84617}, size = 22, alpha = 1, unit = "target", isMine = true, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 202, -18}},

    -- Find Weakness
    {spells = {91021}, size = 22, alpha = 1, unit = "target", isMine = true, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 202, 8}},
  },
  ["WARLOCK"] = {
    -- Corruption
    {spells = {172}, size = 22, alpha = 1, unit = "target", isMine = true, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 150, -18}},

    -- Unstable Affliction
    {spells = {30108}, size = 22, alpha = 1, unit = "target", isMine = true, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 176, -18}},

    -- Bane of Agony / Bane of Doom
    {spells = {980, 603}, size = 22, alpha = 1, unit = "target", isMine = true, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 202, -18}},
  },
  ["WARRIOR"] = {},
}
