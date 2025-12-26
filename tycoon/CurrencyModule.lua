-- CurrencyModule.lua
-- Simple reusable currency system for Roblox

local Currency = {}
Currency.__index = Currency

function Currency.new(startingAmount)
    local self = setmetatable({}, Currency)
    self.Balance = startingAmount or 0
    return self
end

function Currency:Add(amount)
    if amount > 0 then
        self.Balance += amount
    end
end

function Currency:Remove(amount)
    if amount > 0 and self.Balance >= amount then
        self.Balance -= amount
        return true
    end
    return false
end

function Currency:GetBalance()
    return self.Balance
end

return Currency
