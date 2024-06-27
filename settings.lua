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
		{spellId = 94794, size = 40, alpha = 1, unitId = "player", isMine = 0, filter = "HARMFUL", setPoint = {"BOTTOMLEFT", UIParent, "CENTER", 100, 0}},
	},
	["SHAMAN"] = {
		-- Water Shield, Earth Shield
		{spellId = 52127, spellId2 = 974, size = 40, alpha = 1, unitId = "player", isMine = 0, filter = "HELPFUL", setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -100, 0}},

		-- Tidal Waves
		{spellId = 53390, size = 24, alpha = 1, unitId = "player", isMine = 0, filter = "HELPFUL", setPoint = {"BOTTOMRIGHT", PlayerFrame, "TOPRIGHT", -5, -18}},

		-- Spiritwalker's Grace
		{spellId = 79206, size = 40, alpha = 1, unitId = "player", isMine = 0, filter = "HELPFUL", setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -100, -42}},

		-- Grounding Totem Effect
		{spellId = 8178, size = 40, alpha = 1, unitId = "player", isMine = 0, filter = "HELPFUL", setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -142, 0}},
	},
	["DEATHKNIGHT"] = {},
	["DRUID"] = {},
	["HUNTER"] = {
		-- Aspect of the Hawk, Aspect of the Fox, Aspect of the Wild
		{spellId = 13165, spellId2 = 82661, spellId3 = 20043, size = 24, alpha = 1, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"BOTTOMRIGHT", PlayerFrame, "TOPRIGHT", -5, -18}},

		-- Aspect of the Pack, Aspect of the Cheetah
		{spellId = 5118, spellId2 = 13159, size = 40, alpha = 1, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -100, 0}},

		-- Sniper Training, Improved Steady Shot, Focus Fire
		{spellId = 64420, spellId2 = 53220, spellId3 = 82692, size = 24, alpha = 1, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"BOTTOMRIGHT", PlayerFrame, "TOPRIGHT", -31, -18}},

		-- Serpent Sting
		{spellId = 1978, spellId2 = 88453, size = 24, alpha = 1, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"BOTTOMLEFT", TargetFrame, "TOPLEFT", 31, -18}},

		-- Hunter's Mark
		{spellId = 1130, spellId2 = 88691, size = 24, alpha = 1, unitId = "target", isMine = 0, filter = "HARMFUL", setPoint = {"BOTTOMLEFT", TargetFrame, "TOPLEFT", 5, -18}},
	},
	["MAGE"] = {},
	["PALADIN"] = {},
	["PRIEST"] = {},
	["ROGUE"] = {
		-- Stealth / Dance / Vanish / Envenom / Deep Insight
		{spellId = 1784, spellId2 = 51713, spellId3 = 11327, spellId4 = 32645, spellId5 = 84747, size = 40, alpha = 1, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"BOTTOMRIGHT", UIParent, "CENTER", -100, 0}},

		-- Blade Flurry / Overkill
		{spellId = 13877, spellId2 = 58427, size = 24, alpha = 1, unitId = "player", isMine = 0, filter = "HELPFUL", setPoint = {"BOTTOMRIGHT", PlayerFrame, "TOPRIGHT", -57, -18}},

		-- Slice and Dice
		{spellId = 5171, size = 24, alpha = 1, unitId = "player", isMine = 0, filter = "HELPFUL", setPoint = {"BOTTOMRIGHT", PlayerFrame, "TOPRIGHT", -31, -18}},

		-- Recuperate
		{spellId = 73651, size = 24, alpha = 1, unitId = "player", isMine = 0, filter = "HELPFUL", setPoint = {"BOTTOMRIGHT", PlayerFrame, "TOPRIGHT", -5, -18}},

		-- Revealing Strike / Rupture
		{spellId = 84617, spellId2 = 1943, size = 24, alpha = 1, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"BOTTOMLEFT", TargetFrame, "TOPLEFT", 5, -18}},
	},
	["WARLOCK"] = {},
	["WARRIOR"] = {},
}
