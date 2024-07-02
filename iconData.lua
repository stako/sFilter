local _, ns = ...

ns.iconData = {
  ["GENERAL"] = {
    -- Rocket Fuel Leak
    {spells = {94794}, size = 40, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMLEFT", UIParent, "CENTER", 100, 0}},

    -- Divine Shield, Deterrence, Hand of Protection, Hand of Sacrifice, Roar of Sacrifice
    {spells = {642, 19263, 1022, 6940, 53480}, size = 40, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -100, 42}},
  },
  ["SHAMAN"] = {
    -- Water Shield, Earth Shield
    {spells = {52127, 974}, size = 40, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -100, 0}},

    -- Tidal Waves
    {spells = {53390}, size = 24, alpha = 1, unit = "player", isMine = false, setPoint = {"TOPLEFT", PlayerFrame, "BOTTOMLEFT", 106, 32}},

    -- Spiritwalker's Grace
    {spells = {79206}, size = 40, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -100, -42}},

    -- Grounding Totem Effect
    {spells = {8178}, size = 40, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -142, 0}},
  },
  ["DEATHKNIGHT"] = {},
  ["DRUID"] = {},
  ["HUNTER"] = {
    -- Aspect of the Hawk, Aspect of the Fox, Aspect of the Wild
    {spells = {13165, 82661, 20043}, size = 24, alpha = 1, unit = "player", isMine = true, setPoint = {"TOPLEFT", PlayerFrame, "BOTTOMLEFT", 106, 32}},

    -- Aspect of the Pack, Aspect of the Cheetah, Camouflage
    {spells = {5118, 13159, 51755}, size = 40, alpha = 1, unit = "player", isMine = true, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -100, 0}},

    -- Fire!
    {spells = {82926}, size = 40, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -100, -42}},

    -- Sniper Training, Improved Steady Shot, Focus Fire
    {spells = {64420, 53220, 82692}, size = 24, alpha = 1, unit = "player", isMine = true, setPoint = {"TOPLEFT", PlayerFrame, "BOTTOMLEFT", 132, 32}},

    -- Serpent Sting
    {spells = {1978, 88453}, size = 24, alpha = 1, unit = "target", isMine = true, setPoint = {"TOPLEFT", PlayerFrame, "BOTTOMLEFT", 176, 32}},

    -- Hunter's Mark
    {spells = {1130, 88691}, size = 24, alpha = 1, unit = "target", isMine = false, setPoint = {"TOPLEFT", PlayerFrame, "BOTTOMLEFT", 202, 32}},

    -- Mend Pet
    {spells = {136}, size = 24, alpha = 1, unit = "pet", isMine = false, setPoint = {"LEFT", PetFrame, "RIGHT", -8, -4}},
  },
  ["MAGE"] = {},
  ["PALADIN"] = {},
  ["PRIEST"] = {},
  ["ROGUE"] = {
    -- Stealth / Dance / Vanish / Envenom / Deep Insight
    {spells = {1784, 51713, 11327, 32645, 84747}, size = 40, alpha = 1, unit = "player", isMine = true, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -100, 0}},

    -- Blade Flurry / Overkill
    {spells = {13877, 58427}, size = 24, alpha = 1, unit = "player", isMine = false, setPoint = {"TOPLEFT", PlayerFrame, "BOTTOMLEFT", 158, 32}},

    -- Slice and Dice
    {spells = {5171}, size = 24, alpha = 1, unit = "player", isMine = false, setPoint = {"TOPLEFT", PlayerFrame, "BOTTOMLEFT", 132, 32}},

    -- Recuperate
    {spells = {73651}, size = 24, alpha = 1, unit = "player", isMine = false, setPoint = {"TOPLEFT", PlayerFrame, "BOTTOMLEFT", 106, 32}},

    -- Revealing Strike / Rupture
    {spells = {84617, 1943}, size = 24, alpha = 1, unit = "target", isMine = true, setPoint = {"TOPLEFT", PlayerFrame, "BOTTOMLEFT", 202, 32}},
  },
  ["WARLOCK"] = {},
  ["WARRIOR"] = {},
}
