--[[
	sFilter
	Copyright (c) 2009, Nils Ruesch
	All rights reserved.
	Edited by ALZA, Danpiel.
]]

local _, ns = ...

local myUnits = {
	player = true,
	vehicle = true,
	pet = true,
}

local function sFilter_OnEvent(self, event, ...)
	local unit = ...
	local iconData = self.data
	local spellData

	if iconData.unitId == unit or event == "PLAYER_TARGET_CHANGED" or event == "PLAYER_ENTERING_WORLD" then
		local priority = 999

		for i = 1, 40 do
			local _, icon, count, _, duration, expirationTime, caster, _, _, spellId = UnitAura(iconData.unitId, i, iconData.filter)

			if not spellId then break end

			local spellPriority = iconData.spells[spellId]

			if (iconData.isMine ~= 1 or myUnits[caster]) and spellPriority and spellPriority < priority then
				spellData = {
					icon = icon,
					count = count,
					duration = duration,
					expirationTime = expirationTime,
					caster = caster,
					spellId = spellId
				}
			end
		end

		if spellData then
			self:Show()
			self.icon:SetTexture(spellData.icon)
			self.count:SetText(spellData.count > 1 and spellData.count or "")
			if spellData.duration and spellData.duration > 0 then
				self.cooldown:Show()
				self.cooldown:SetCooldown(spellData.expirationTime - spellData.duration, spellData.duration)
			else
				self.cooldown:Hide()
			end
		else
			self:Hide()
		end
	end
end

local function sFilter_CreateFrame(category, id, data)
	local frame = CreateFrame("Frame", "sFilter_" .. category .. "_" .. id, UIParent)
	frame.data = data
	frame:SetAlpha(data.alpha)
	frame:SetSize(data.size, data.size)
	frame:SetPoint(unpack(data.setPoint))
	frame:RegisterEvent("UNIT_AURA")
	frame:RegisterEvent("PLAYER_TARGET_CHANGED")
	frame:RegisterEvent("PLAYER_ENTERING_WORLD")
	frame:SetScript("OnEvent", sFilter_OnEvent)

	frame.icon = frame:CreateTexture("$parentIcon", "BACKGROUND")
	frame.icon:SetAllPoints(frame)
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

if ns.icons then
	if ns.icons["GENERAL"] then
		for id, data in ipairs(ns.icons["GENERAL"]) do
			sFilter_CreateFrame("GENERAL", id, data)
		end
	end

	if ns.icons[class] then
		for id, data in ipairs(ns.icons[class]) do
			sFilter_CreateFrame(class, id, data)
		end
	end
end
