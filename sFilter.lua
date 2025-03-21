local _, ns = ...
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
eventHandler:RegisterEvent("PLAYER_ENTERING_WORLD")
if units["target"] then eventHandler:RegisterEvent("PLAYER_TARGET_CHANGED") end
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
  elseif event == "PLAYER_TARGET_CHANGED" then
    units["target"]:RemoveAllAuras()
    if UnitExists("target") then units["target"]:AddAllAuras() end
  elseif event == "PLAYER_ENTERING_WORLD" then
    for unitToken, unit in pairs(units) do
      unit:RemoveAllAuras()
      if UnitExists(unitToken) then unit:AddAllAuras() end
    end
  end
end)
