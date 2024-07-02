--[[
	sFilter
	Copyright (c) 2009, Nils Ruesch
	All rights reserved.
	Edited by ALZA, Danpiel.
]]

local _, ns = ...

local s = ns.settings
local spells = ns.spells

local MyUnits = {
	player = true,
	vehicle = true,
	pet = true,
}

local function sFilter_OnEvent(self, event, ...)
	local unit = ...
	local data = self.data

	if data.unitId == unit or event == "PLAYER_TARGET_CHANGED" or event == "PLAYER_ENTERING_WORLD" then
		self.found = false
		self:SetAlpha(data.alpha)
		local priority = 999

		for i = 1, 40 do
			local name, icon, count, dispelType, duration, expirationTime, caster, isStealable, nameplateShowPersonal, spellId = UnitAura(data.unitId, i, data.filter)

			if not spellId then break end

			local spellPriority = data.spells[spellId]

			if (data.isMine ~= 1 or MyUnits[caster]) and spellPriority and spellPriority < priority then
				priority = spellPriority
				self.found = true
				self.icon:SetTexture(icon)
				self.count:SetText(count > 1 and count or "")

				if duration and duration > 0 then
					self.cooldown:Show()
					self.cooldown:SetCooldown(expirationTime - duration, duration)
				else
					self.cooldown:Hide()
				end
			end
		end

		if not self.found then
			self:SetAlpha(0)
			self.icon:SetTexture(data.spellIcon)
			self.count:SetText("")
			self.cooldown:Hide()
		end
	end

	if s.configmode then
		self:SetAlpha(data.alpha)
		self.count:SetText(9)
	end
end

local function sFilter_CreateFrame(data)
	local frame = CreateFrame("Frame", "sFilter_" .. data.unitId .. "_" .. data.spells[1], UIParent)
	frame.data = data
	data.spellName, _, data.spellIcon = GetSpellInfo(data.spells[1])
	frame:SetWidth(data.size)
	frame:SetHeight(data.size)
	frame:SetPoint(unpack(data.setPoint))
	frame:RegisterEvent("UNIT_AURA")
	frame:RegisterEvent("PLAYER_TARGET_CHANGED")
	frame:RegisterEvent("PLAYER_ENTERING_WORLD")
	frame:SetScript("OnEvent", sFilter_OnEvent)

	if s.configmode then
		frame:SetMovable(true)
		frame:EnableMouse(true)
		frame:RegisterForDrag("LeftButton", "RightButton")
		frame:SetScript("OnMouseDown", function(self,arg1)
			if(arg1=="LeftButton") then
				if(IsShiftKeyDown() or IsAltKeyDown()) then
					self:StartMoving()
				end
			else
				self:ClearAllPoints()
				self:SetPoint(unpack(data.setPoint))
			end
		end)
		frame:SetScript("OnMouseUp", function(self,arg1)
			self:StopMovingOrSizing()
			if(arg1=="LeftButton") then
				local point, relativeTo, relativePoint, xOffset, yOffset = self:GetPoint(index)
				print(format("s|cFFFF8C00F|r|cFFFFFFFFfilter|r: setPoint for %s (%s): {\"%s\", UIParent, \"%s\", %s, %s}", data.spells[1], data.spellName, point, relativePoint, floor(xOffset + 0.5), floor(yOffset + 0.5)))
			end
		end)
	end

	frame.icon = frame:CreateTexture("$parentIcon", "BACKGROUND")
	frame.icon:SetAllPoints(frame)
	frame.icon:SetTexture(data.spellIcon)
	-- frame.icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)

	frame.count = frame:CreateFontString(nil, "OVERLAY")
	frame.count:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
	frame.count:SetTextColor(0.8, 0.8, 0.8)
	frame.count:SetPoint("BOTTOMRIGHT", -1, 1)
	frame.count:SetJustifyH("CENTER")

	frame.cooldown = CreateFrame("Cooldown", nil, frame, "CooldownFrameTemplate")
	frame.cooldown:SetReverse(true)
	frame.cooldown:SetDrawEdge(true)
	-- frame.cooldown:SetAllPoints(frame.icon)
	frame.cooldown:SetPoint("TOPLEFT", 1, -1)
	frame.cooldown:SetPoint("BOTTOMRIGHT", -1, 1)
	frame.cooldown:SetHideCountdownNumbers(true)

	data.spells = tInvert(data.spells)
end

local class = select(2, UnitClass("player"))

if spells then
	for _, data in ipairs(spells["GENERAL"]) do
		sFilter_CreateFrame(data)
	end

	if spells[class] then
		for _, data in ipairs(spells[class]) do
			sFilter_CreateFrame(data)
		end
	end
end
