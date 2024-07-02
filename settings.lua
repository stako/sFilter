local _, ns = ...

-- "true" means enabled, "false" means disabled
ns.settings = {
	-- configmode = true -- In this mode all icons are shown and can be moved.
}

--[[ More info about config mode:
You can move icons with left mouse button while holding Alt OR Shift. Changed position won't be saved between sessions.
After click on icon you will see in chat info about its position. This can be used to change setPoint attribute is spell list.
Clicking on icon with right mouse button will reset its position to default.
]]

--[[ Closer look at spell lists:
All classes have their own spell list.
Each entry in list creates a separate icon. Entry is a table with values in it:
- spellId - id of spell you want to track. If you don't know it - check wowhead.com - last number in any spell link is spellid (example: http://www.wowhead.com/?spell=55095, id is 55095)
- spellId2, spellId3, spellId4, spellId5 - optional entries, these are the spellids you want to track if primary spell is NOT active.
- size - icon size in pixels
- alpha - between 0 and 1
- unitId - unit at which you wish to track selected spell(s). More info: http://www.wowwiki.com/UnitId
- isMine - this is filter. isMine = 1 means only  effects from units in MyUnits table will be shown (see below for this table. Note: isMine = "1" will NOT work, it should be number, not string. Any other value will show effect from any source
- filter - filter again =). Needs to be "HELPFUL" for buffs and "HARMFUL" for debuffs.
- setPoint - where to place the icon. It's a table with coordinates inside. More info: http://www.wowwiki.com/API_Region_SetPoint
Original addon version: http://toxila.googlecode.com/svn/zips/sFilter/
]]

ns.spells = {
	["GENERAL"] = {
		-- Rocket Fuel Leak
		{spells = {94794}, size = 40, alpha = 1, unitId = "player", isMine = 0, filter = "HARMFUL", setPoint = {"BOTTOMLEFT", UIParent, "CENTER", 100, 0}},

		-- Divine Shield, Deterrence, Hand of Protection, Hand of Sacrifice, Roar of Sacrifice
		{spells = {642, 19263, 1022, 6940, 53480}, size = 40, alpha = 1, unitId = "player", isMine = 0, filter = "HELPFUL", setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -100, 42}},
	},
	["SHAMAN"] = {
		-- Water Shield, Earth Shield
		{spells = {52127, 974}, size = 40, alpha = 1, unitId = "player", isMine = 0, filter = "HELPFUL", setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -100, 0}},

		-- Tidal Waves
		{spells = {53390}, size = 24, alpha = 1, unitId = "player", isMine = 0, filter = "HELPFUL", setPoint = {"TOPLEFT", PlayerFrame, "BOTTOMLEFT", 106, 32}},

		-- Spiritwalker's Grace
		{spells = {79206}, size = 40, alpha = 1, unitId = "player", isMine = 0, filter = "HELPFUL", setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -100, -42}},

		-- Grounding Totem Effect
		{spells = {8178}, size = 40, alpha = 1, unitId = "player", isMine = 0, filter = "HELPFUL", setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -142, 0}},
	},
	["DEATHKNIGHT"] = {},
	["DRUID"] = {},
	["HUNTER"] = {
		-- Aspect of the Hawk, Aspect of the Fox, Aspect of the Wild
		{spells = {13165, 82661, 20043}, size = 24, alpha = 1, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"TOPLEFT", PlayerFrame, "BOTTOMLEFT", 106, 32}},

		-- Aspect of the Pack, Aspect of the Cheetah, Camouflage
		{spells = {5118, 13159, 51755}, size = 40, alpha = 1, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -100, 0}},

		-- Fire!
		{spells = {82926}, size = 40, alpha = 1, unitId = "player", isMine = 0, filter = "HELPFUL", setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -100, -42}},

		-- Sniper Training, Improved Steady Shot, Focus Fire
		{spells = {64420, 53220, 82692}, size = 24, alpha = 1, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"TOPLEFT", PlayerFrame, "BOTTOMLEFT", 132, 32}},

		-- Serpent Sting
		{spells = {1978, 88453}, size = 24, alpha = 1, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"TOPLEFT", PlayerFrame, "BOTTOMLEFT", 176, 32}},

		-- Hunter's Mark
		{spells = {1130, 88691}, size = 24, alpha = 1, unitId = "target", isMine = 0, filter = "HARMFUL", setPoint = {"TOPLEFT", PlayerFrame, "BOTTOMLEFT", 202, 32}},

		-- Mend Pet
		{spells = {136}, size = 24, alpha = 1, unitId = "pet", isMine = 0, filter = "HELPFUL", setPoint = {"LEFT", PetFrame, "RIGHT", -8, -4}},
	},
	["MAGE"] = {},
	["PALADIN"] = {},
	["PRIEST"] = {},
	["ROGUE"] = {
		-- Stealth / Dance / Vanish / Envenom / Deep Insight
		{spells = {1784, 51713, 11327, 32645, 84747}, size = 40, alpha = 1, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -100, 0}},

		-- Blade Flurry / Overkill
		{spells = {13877, 58427}, size = 24, alpha = 1, unitId = "player", isMine = 0, filter = "HELPFUL", setPoint = {"TOPLEFT", PlayerFrame, "BOTTOMLEFT", 158, 32}},

		-- Slice and Dice
		{spells = {5171}, size = 24, alpha = 1, unitId = "player", isMine = 0, filter = "HELPFUL", setPoint = {"TOPLEFT", PlayerFrame, "BOTTOMLEFT", 132, 32}},

		-- Recuperate
		{spells = {73651}, size = 24, alpha = 1, unitId = "player", isMine = 0, filter = "HELPFUL", setPoint = {"TOPLEFT", PlayerFrame, "BOTTOMLEFT", 106, 32}},

		-- Revealing Strike / Rupture
		{spells = {84617, 1943}, size = 24, alpha = 1, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"TOPLEFT", PlayerFrame, "BOTTOMLEFT", 202, 32}},
	},
	["WARLOCK"] = {},
	["WARRIOR"] = {},
}
