local addonName, ns = ...
if not ns.iconData then return end

ns.borderStyle = 2

local class = select(2, UnitClass("player"))
local units = {}

for _, category in ipairs({"GENERAL", class}) do
  for i, data in ipairs(ns.iconData[category]) do
    local icon = ns.Icon:New(data, category, i)
    local unitToken = data.unit

    if not units[unitToken] then units[unitToken] = ns.Unit:New(unitToken) end
    units[unitToken]:AddIcon(icon)
  end
end

local function handleUnitAura(unitToken, updateInfo)
  if updateInfo.addedAuras then
    for _, aura in ipairs(updateInfo.addedAuras) do
      units[unitToken]:AddAura(aura)
    end
  end

  if updateInfo.updatedAuraInstanceIDs then
    for _, auraID in ipairs(updateInfo.updatedAuraInstanceIDs) do
      units[unitToken]:UpdateAura(C_UnitAuras.GetAuraDataByAuraInstanceID(unitToken, auraID))
    end
  end

  if updateInfo.removedAuraInstanceIDs then
    for _, auraID in ipairs(updateInfo.removedAuraInstanceIDs) do
      units[unitToken]:RemoveAura(auraID)
    end
  end

  if updateInfo.isFullUpdate and unitToken ~= "pet" then
    units[unitToken]:RemoveAllAuras()
    units[unitToken]:AddAllAuras()
  end
end

local function refreshUnitAuras(unitToken)
  units[unitToken]:RemoveAllAuras()
  if UnitExists(unitToken) then
    units[unitToken]:AddAllAuras()
  end
end

local function handleTalentChange()
  ns.spec = GetPrimaryTalentTree()
  for unitToken, _ in pairs(units) do
    refreshUnitAuras(unitToken)
  end
end

local eventHandler = CreateFrame("Frame")
eventHandler:RegisterEvent("ADDON_LOADED")
eventHandler:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
eventHandler:RegisterEvent("PLAYER_ENTERING_WORLD")
if units["target"] then eventHandler:RegisterEvent("PLAYER_TARGET_CHANGED") end
if units["pet"] then eventHandler:RegisterUnitEvent("UNIT_PET", "player") end
do
  local trackedUnits = {}
  for unitToken in pairs(units) do
    tinsert(trackedUnits, unitToken)
  end

  if #trackedUnits > 0 then
    eventHandler:RegisterUnitEvent("UNIT_AURA", unpack(trackedUnits))
  end
end

eventHandler:SetScript("OnEvent", function(self, event, ...)
  if event == "UNIT_AURA" then
    handleUnitAura(...)
  elseif event == "PLAYER_TARGET_CHANGED" then
    refreshUnitAuras("target")
  elseif event == "PLAYER_ENTERING_WORLD" then
    self:UnregisterEvent("PLAYER_ENTERING_WORLD")
    ns.spec = GetPrimaryTalentTree()
  elseif event == "ACTIVE_TALENT_GROUP_CHANGED" then
    handleTalentChange()
  elseif event == "ADDON_LOADED" and ... == addonName then
    for unitToken, unit in pairs(units) do
      if UnitExists(unitToken) then unit:AddAllAuras() end
    end
  elseif event == "UNIT_PET" then
    refreshUnitAuras("pet")
  end
end)
