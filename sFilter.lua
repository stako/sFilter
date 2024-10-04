local _, ns = ...

local UnitAura = UnitAura
local class = select(2, UnitClass("player"))
local icons = {}
local spells = {}
local units = {}
local myUnits = {
  player = true,
  vehicle = true,
  pet = true,
}

local pixel = PixelUtil.GetNearestPixelSize(1, UIParent:GetScale())

-- Icon class
local Icon = {
  new = function(self, obj, category, id)
    obj = obj or {}
    setmetatable(obj, self)
    self.__index = self
    obj.spells = tInvert(obj.spells)
    obj:Build(category, id)
    return obj
  end,

  Hide = function(self)
    self.frame:Hide()
    self.curPriority = 999
  end,

  Build = function(self, category, id)
    local frame = CreateFrame("Frame", "sFilter_" .. category .. id, UIParent)
    frame:SetSize(self.size, self.size)
    frame:SetPoint(unpack(self.setPoint))
    frame:SetAlpha(self.alpha)

    local texture = frame:CreateTexture(nil, "ARTWORK")
    texture:SetAllPoints()

    local count = frame:CreateFontString(nil, "OVERLAY", "NumberFontNormal")
    count:SetPoint("BOTTOMRIGHT", -1, 2)
    count:SetJustifyH("RIGHT")

    local cooldown = CreateFrame("Cooldown", nil, frame, "CooldownFrameTemplate")
    cooldown:SetAllPoints()
    cooldown:SetReverse(true)
    cooldown:SetDrawEdge(true)
    cooldown:SetHideCountdownNumbers(true)

    if ns.borderStyle == 2 then
      local borderFrame = CreateFrame("Frame", nil, frame)
      borderFrame:SetFrameLevel(5)
      borderFrame:SetAllPoints()

      local border = borderFrame:CreateTexture(nil, "ARTWORK")
      border:SetAtlas("CommentatorSpellBorder")
      border:SetPoint("CENTER")
      border:SetSize(self.size * 1.6, self.size * 1.6)

      texture:SetTexCoord(0.07, 0.93, 0.07, 0.93)
      count:SetPoint("BOTTOMRIGHT", 0, 1)

      cooldown:ClearAllPoints()
      cooldown:SetPoint("TOPLEFT", pixel, -pixel)
      cooldown:SetPoint("BOTTOMRIGHT", -pixel, pixel)
    elseif ns.borderStyle == 3 then
      local background = frame:CreateTexture(nil, "BACKGROUND")
      background:SetAllPoints()
      background:SetColorTexture(0, 0, 0)

      texture:ClearAllPoints()
      texture:SetPoint("TOPLEFT", pixel, -pixel)
      texture:SetPoint("BOTTOMRIGHT", -pixel, pixel)
      texture:SetTexCoord(0.07, 0.93, 0.07, 0.93)

      cooldown:ClearAllPoints()
      cooldown:SetPoint("TOPLEFT", pixel, -pixel)
      cooldown:SetPoint("BOTTOMRIGHT", -pixel, pixel)
    end

    self.frame = frame
    self.texture = texture
    self.count = count
    self.cooldown = cooldown

    self:Hide()
  end,

  HandleSpell = function(self, texture, count, duration, expirationTime, caster, spellId)
    if self.isMine and not myUnits[caster] then return end
    if self.curPriority < self.spells[spellId] then return end

    self.curPriority = self.spells[spellId]
    self.frame:Show()
    self.texture:SetTexture(texture)
    self.count:SetText(count > 1 and count or "")
    if duration and duration > 0 then
      self.cooldown:Show()
      self.cooldown:SetCooldown(expirationTime - duration, duration)
    else
      self.cooldown:Hide()
    end
  end
}

-- Build Icons
if not ns.iconData then return end

for _, category in ipairs({"GENERAL", class}) do
  for i, data in ipairs(ns.iconData[category]) do
    local icon = Icon:new(data, category, i)
    tinsert(icons, icon)
  end
end

for _, icon in ipairs(icons) do
  units[icon.unit] = icon.unit

  for spellId, _ in pairs(icon.spells) do
    spells[spellId] = spells[spellId] or {}
    tinsert(spells[spellId], icon)
  end
end

local function scanAuras(unit, auraType)
  for i = 1, 40 do
    local _, texture, count, _, duration, expirationTime, caster, _, _, spellId = UnitAura(unit, i, auraType)
    if not spellId then break end
    if spells[spellId] then
      for _, icon in ipairs(spells[spellId]) do
        if icon.unit == unit then
          icon:HandleSpell(texture, count, duration, expirationTime, caster, spellId)
        end
      end
    end
  end
end

local function scanUnit(unit)
  for _, icon in ipairs(icons) do
    if icon.unit == unit then
      icon:Hide()
    end
  end

  scanAuras(unit, "HELPFUL")
  scanAuras(unit, "HARMFUL")
end

local eventHandler = CreateFrame("Frame")
eventHandler:RegisterUnitEvent("UNIT_AURA", unpack(units))
eventHandler:RegisterEvent("PLAYER_TARGET_CHANGED")
eventHandler:RegisterEvent("PLAYER_ENTERING_WORLD")

eventHandler:SetScript("OnEvent", function(self, event, ...)
  local unit = ...

  if event == "UNIT_AURA" and units[unit] then
    scanUnit(unit)
  elseif event == "PLAYER_TARGET_CHANGED" and units["target"] then
    scanUnit("target")
  elseif event == "PLAYER_ENTERING_WORLD" then
    for unit in pairs(units) do
      scanUnit(unit)
    end
  end
end)