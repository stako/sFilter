local _, ns = ...
ns.Icon = {}

local Icon = ns.Icon
Icon.__index = Icon

local pixel = PixelUtil.GetNearestPixelSize(1, UIParent:GetScale())

function Icon:New(iconData, category, id)
  iconData.priorityLevels = tInvert(iconData.spells)
  iconData.activePriority = 999
  iconData.auras = {}
  setmetatable(iconData, self)
  iconData:Build(category, id)
  return iconData
end

function Icon:Build(category, id)
  local frame = CreateFrame("Frame", "sFilter_" .. category .. id, UIParent)
  frame:SetSize(self.size, self.size)
  frame:SetAlpha(self.alpha)
  frame:SetPoint(unpack(self.setPoint))
  frame:Hide()

  local texture = frame:CreateTexture(nil, "ARTWORK")
  texture:SetAllPoints()

  local applications = frame:CreateFontString(nil, "OVERLAY", "NumberFontNormal")
  applications:SetPoint("BOTTOMRIGHT", -1, 2)
  applications:SetJustifyH("RIGHT")

  local cooldown = CreateFrame("Cooldown", nil, frame, "CooldownFrameTemplate")
  cooldown:SetAllPoints()
  cooldown:SetReverse(true)
  cooldown:SetDrawEdge(true)
  cooldown:SetDrawBling(false)
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
    applications:SetPoint("BOTTOMRIGHT", 0, 1)

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
  self.applications = applications
  self.cooldown = cooldown
end

function Icon:AddAura(auraData)
  auraData.priority = self.priorityLevels[auraData.spellId]
  self.auras[auraData.auraInstanceID] = auraData

  self:SetActiveAura(auraData)
end

function Icon:RemoveAura(auraInstanceID)
  self.auras[auraInstanceID] = nil
  self:SetActiveAura(nil)

  for _, auraData in pairs(self.auras) do
    self:SetActiveAura(auraData)
  end
end

function Icon:SetActiveAura(auraData)
  if not auraData then
    self.frame:Hide()
    self.activePriority = 999
    return
  end

  if self.activePriority < auraData.priority then return end

  self.activePriority = auraData.priority
  self.texture:SetTexture(auraData.icon)
  self.applications:SetText(auraData.applications > 1 and auraData.applications or nil)
  if auraData.duration > 0 then
    self.cooldown:Show()
    self.cooldown:SetCooldown(auraData.expirationTime - auraData.duration, auraData.duration)
  else
    self.cooldown:Hide()
  end
  self.frame:Show()
end
