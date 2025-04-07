if WOW_PROJECT_ID ~= WOW_PROJECT_CLASSIC then return end
local _, ns = ...

ns.iconData = {
  ["GENERAL"] = {},
  ["SHAMAN"] = {},
  ["DEATHKNIGHT"] = {},
  ["DRUID"] = {},
  ["HUNTER"] = {
    -- Serpent Sting
    {spells = {1978}, size = 22, alpha = 1, unit = "target", isMine = true, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 176, -18}},

    -- Hunter's Mark
    {spells = {1130}, size = 22, alpha = 1, unit = "target", isMine = false, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 202, -18}},
  },
  ["MAGE"] = {},
  ["PALADIN"] = {},
  ["PRIEST"] = {},
  ["ROGUE"] = {},
  ["WARLOCK"] = {},
  ["WARRIOR"] = {
    -- Blood Surge
    {spells = {413399}, size = 40, alpha = 1, unit = "player", isMine = true, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -170, 0}},

    -- Sudden Death
    {spells = {440114}, size = 40, alpha = 1, unit = "player", isMine = true, setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -123, 0}},

    -- Battle Shout
    {spells = {11549, 11550}, size = 22, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 98, -18}},

    -- Commanding Shout
    {spells = {403215}, size = 22, alpha = 1, unit = "player", isMine = false, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 124, -18}},

    -- Rend
    {spells = {11572}, size = 22, alpha = 1, unit = "target", isMine = true, setPoint = {"BOTTOMLEFT", PlayerFrame, "TOPLEFT", 202, -18}},

  },
}
