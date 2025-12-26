-- IncomeGenerator.lua
-- Generates income automatically at fixed intervals

local IncomeGenerator = {}
IncomeGenerator.__index = IncomeGenerator

function IncomeGenerator.new(currencyModule, incomePerTick, interval)
    local self = setmetatable({}, IncomeGenerator)
    self.Currency = currencyModule
    self.IncomePerTick = incomePerTick or 10
    self.Interval = interval or 5
    self.Running = false
    return self
end

function IncomeGenerator:Start()
    if self.Running then return end
    self.Running = true

    task.spawn(function()
        while self.Running do
            task.wait(self.Interval)
            self.Currency:Add(self.IncomePerTick)
        end
    end)
end

function IncomeGenerator:Stop()
    self.Running = false
end

return IncomeGenerator
