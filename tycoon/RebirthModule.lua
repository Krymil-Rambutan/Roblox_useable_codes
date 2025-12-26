-- RebirthModule.lua
-- Handles rebirths and income multipliers

local Rebirth = {}
Rebirth.__index = Rebirth

function Rebirth.new(currencyModule)
    local self = setmetatable({}, Rebirth)
    self.Currency = currencyModule
    self.Rebirths = 0
    self.Multiplier = 1
    self.RebirthCost = 2000
    return self
end

function Rebirth:CanRebirth()
    return self.Currency:GetBalance() >= self.RebirthCost
end

function Rebirth:DoRebirth()
    if not self:CanRebirth() then
        return false
    end

    self.Currency:Remove(self.RebirthCost)
    self.Rebirths += 1
    self.Multiplier = 1 + (self.Rebirths * 0.5)

    -- Increase next rebirth cost
    self.RebirthCost = math.floor(self.RebirthCost * 1.5)

    return true
end

function Rebirth:GetMultiplier()
    return self.Multiplier
end

return Rebirth
