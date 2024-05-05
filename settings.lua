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
	["SHAMAN"] = {		
		-- Water Shield
		{spellId = 57960, size = 24, alpha = 1, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"BOTTOMRIGHT", PlayerFrame, "TOPRIGHT", -8, -18}},

		-- Flame Shock
		{spellId = 49233, size = 24, alpha = 1, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"TOPRIGHT", TargetFrame, "TOPLEFT", 0, -22}},

		-- Dying Curse
		{spellId = 60494, size = 30, alpha = 0.7, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"BOTTOMRIGHT", PlayerFrame, "TOPRIGHT", -8, 8}},

		-- Talisman of Resurgence
		{spellId = 67684, size = 30, alpha = 0.7, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"BOTTOMRIGHT", PlayerFrame, "TOPRIGHT", -40, 8}},
	},

	["DEATHKNIGHT"] = {},
	["DRUID"] = {},
	["HUNTER"] = {
		-- Aspect of the Hawk
		{spellId = 13165, size = 24, alpha = 1, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"BOTTOMRIGHT", PlayerFrame, "TOPRIGHT", -8, -18}},

		-- Other Aspects
		{spellId = 5118, spellId2 = 13159, size = 36, alpha = 1, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"BOTTOMRIGHT", PlayerFrame, "TOPRIGHT", 4, -18}},

		-- Sniper Training, Improved Steady Shot, Focus Fire
		{spellId = 64420, spellId2 = 53220, spellId3 = 82692, size = 24, alpha = 1, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"BOTTOMRIGHT", PlayerFrame, "TOPRIGHT", -34, -18}},

		-- Pet Frenzy
		{spellId = 19615, size = 24, alpha = 1, unitId = "pet", isMine = 0, filter = "HELPFUL", setPoint = {"BOTTOMRIGHT", PlayerFrame, "TOPRIGHT", -60, -18}},

		-- Fire! (Master Marksman Proc)
		{spellId = 82926, size = 36, alpha = 0.65, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"BOTTOMRIGHT", PlayerFrame, "TOPRIGHT", -8, 8}},


		-- Serpent Sting
		{spellId = 1978, size = 24, alpha = 1, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"TOPRIGHT", TargetFrame, "TOPLEFT", 0, -22}},

		-- Hunter's Mark
		{spellId = 1130, spellId2 = 88691, size = 24, alpha = 1, unitId = "target", isMine = 0, filter = "HARMFUL", setPoint = {"BOTTOMLEFT", TargetFrame, "TOPLEFT", 6, -18}},
	},
	["MAGE"] = {},
	["PALADIN"] = {},
	["PRIEST"] = {
		-- Inner Fire
		{spellId = 25431, size = 24, alpha = 1, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"BOTTOMRIGHT", PlayerFrame, "TOPRIGHT", -8, -18}},

		-- PW: Shield
		{spellId = 25218, size = 24, alpha = 1, unitId = "player", isMine = 0, filter = "HELPFUL", setPoint = {"BOTTOMRIGHT", PlayerFrame, "TOPRIGHT", -34, -18}},

		-- SW: Pain
		{spellId = 25368, size = 24, alpha = 1, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"BOTTOMLEFT", TargetFrame, "TOPLEFT", 6, -18}},

		-- Vampiric Touch
		{spellId = 34917, size = 24, alpha = 1, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"BOTTOMLEFT", TargetFrame, "TOPLEFT", 32, -18}},

		-- Devouring Plague
		{spellId = 25467, size = 24, alpha = 1, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"BOTTOMLEFT", TargetFrame, "TOPLEFT", 58, -18}},
	},
	["ROGUE"] = {
		-- Stealth / Dance / Vanish
		{spellId = 1784, spellId2 = 51713, spellId3 = 11327, size = 36, alpha = 0.65, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"BOTTOMRIGHT", PlayerFrame, "TOPRIGHT", -8, 8}},

		-- Slice and Dice
		{spellId = 5171, size = 24, alpha = 1, unitId = "player", isMine = 0, filter = "HELPFUL", setPoint = {"BOTTOMRIGHT", PlayerFrame, "TOPRIGHT", -8, -18}},

		-- Recuperate
		{spellId = 73651, size = 24, alpha = 1, unitId = "player", isMine = 0, filter = "HELPFUL", setPoint = {"BOTTOMRIGHT", PlayerFrame, "TOPRIGHT", -34, -18}},

		-- Rupture
		{spellId = 1943, size = 24, alpha = 1, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"TOPRIGHT", TargetFrame, "TOPLEFT", 0, -22}},
	},
	["WARLOCK"] = {},
	["WARRIOR"] = {
		-- Battle Shout
		{spellId = 47436, size = 24, alpha = 1, unitId = "player", isMine = 0, filter = "HELPFUL", setPoint = {"BOTTOMRIGHT", PlayerFrame, "TOPRIGHT", -8, -18}},

		-- Commanding Shout
		{spellId = 47440, size = 24, alpha = 1, unitId = "player", isMine = 0, filter = "HELPFUL", setPoint = {"BOTTOMRIGHT", PlayerFrame, "TOPRIGHT", -34, -18}},

		-- Rend
		{spellId = 47465, size = 24, alpha = 1, unitId = "target", isMine = 1, filter = "HARMFUL", setPoint = {"TOPRIGHT", TargetFrame, "TOPLEFT", 0, -22}},
	},
}
