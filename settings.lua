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
		-- Lava Flows
		{spellId = 65264, size = 24, alpha = 0.7, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", -190, -52}},
		
		-- Water Shield
		{spellId = 57960, size = 24, alpha = 0.7, unitId = "player", isMine = 1, filter = "HELPFUL", setPoint = {"CENTER", UIParent, "CENTER", -216, -52}},
	},

	["DEATHKNIGHT"] = {},
	["DRUID"] = {},
	["HUNTER"] = {},
	["MAGE"] = {},
	["PALADIN"] = {},
	["PRIEST"] = {},
	["ROGUE"] = {},
	["WARLOCK"] = {},
	["WARRIOR"] = {},
}
