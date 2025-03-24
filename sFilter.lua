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

local eventHandler = CreateFrame("Frame")
eventHandler:RegisterEvent("ADDON_LOADED")
if units["target"] then eventHandler:RegisterEvent("PLAYER_TARGET_CHANGED") end
if units["pet"] then eventHandler:RegisterUnitEvent("UNIT_PET", "player") end
do
  local trackedUnits = {}
  for unitToken in pairs(units) do
    tinsert(trackedUnits, unitToken)
  end
  eventHandler:RegisterUnitEvent("UNIT_AURA", unpack(trackedUnits))
end

eventHandler:SetScript("OnEvent", function(self, event, ...)
  if event == "UNIT_AURA" then
    local unitToken, updateInfo = ...

    local addedAuras = updateInfo.addedAuras
    if addedAuras then
      for i = 1, #addedAuras do
        units[unitToken]:AddAura(addedAuras[i])
      end
    end

    local updatedAuraInstanceIDs = updateInfo.updatedAuraInstanceIDs
    if updatedAuraInstanceIDs then
      for i = 1, #updatedAuraInstanceIDs do
        units[unitToken]:UpdateAura(C_UnitAuras.GetAuraDataByAuraInstanceID(unitToken, updatedAuraInstanceIDs[i]))
      end
    end

    local removedAuraInstanceIDs = updateInfo.removedAuraInstanceIDs
    if removedAuraInstanceIDs then
      for i = 1, #removedAuraInstanceIDs do
        units[unitToken]:RemoveAura(removedAuraInstanceIDs[i])
      end
    end

    if updateInfo.isFullUpdate and unitToken ~= "pet" then
      units[unitToken]:RemoveAllAuras()
      units[unitToken]:AddAllAuras()
    end
  elseif event == "PLAYER_TARGET_CHANGED" then
    units["target"]:RemoveAllAuras()
    if UnitExists("target") then units["target"]:AddAllAuras() end
  elseif event == "ADDON_LOADED" then
    local name = ...
    if name ~= addonName then return end

    for unitToken, unit in pairs(units) do
      if UnitExists(unitToken) then unit:AddAllAuras() end
    end
  elseif event == "UNIT_PET" then
    units["pet"]:RemoveAllAuras()
    if UnitExists("pet") then units["pet"]:AddAllAuras() end
  end
end)
