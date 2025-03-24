local _, ns = ...
ns.Unit = {}

local myUnits = {
  player = true,
  vehicle = true,
  pet = true
}

local Unit = ns.Unit
Unit.__index = Unit

function Unit:New(unitToken)
  local unit = {
    unitToken = unitToken,
    iconsBySpellId = {},
    iconsByAuraInstanceID = {}
  }
  setmetatable(unit, self)
  return unit
end

function Unit:AddIcon(icon)
  for spellId in pairs(icon.priorityLevels) do
    if not self.iconsBySpellId[spellId] then self.iconsBySpellId[spellId] = {} end

    tinsert(self.iconsBySpellId[spellId], icon)
  end
end

function Unit:AddAura(auraData)
  local icons = self.iconsBySpellId[auraData.spellId]
  if not icons then return end

  local t = {}

  for i = 1, #icons do
    local icon = icons[i]
    if (not icon.spec or icon.spec == ns.spec) and (not icon.isMine or myUnits[auraData.sourceUnit]) then
      tinsert(t, icon)
      icon:AddAura(auraData)
    end
  end

  self.iconsByAuraInstanceID[auraData.auraInstanceID] = t
end

function Unit:UpdateAura(auraData)
  if not auraData then return end

  local icons = self.iconsByAuraInstanceID[auraData.auraInstanceID]
  if not icons then return end

  for i = 1, #icons do
    icons[i]:AddAura(auraData)
  end
end

function Unit:RemoveAura(auraInstanceID)
  local icons = self.iconsByAuraInstanceID[auraInstanceID]
  if not icons then return end

  for i = 1, #icons do
    icons[i]:RemoveAura(auraInstanceID)
  end

  self.iconsByAuraInstanceID[auraInstanceID] = nil
end

function Unit:AddAllAuras()
  local unitToken = self.unitToken
  local helpfulAuras = {select(2, C_UnitAuras.GetAuraSlots(unitToken, "HELPFUL"))}
  local harmfulAuras = {select(2, C_UnitAuras.GetAuraSlots(unitToken, "HARMFUL"))}

  for _, auras in ipairs({helpfulAuras, harmfulAuras}) do
    for i = 1, #auras do
      local auraData = C_UnitAuras.GetAuraDataBySlot(unitToken, auras[i])
      self:AddAura(auraData)
    end
  end
end

function Unit:RemoveAllAuras()
  for auraInstanceID in pairs(self.iconsByAuraInstanceID) do
    self:RemoveAura(auraInstanceID)
  end
end
