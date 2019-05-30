local Object = require 'libraries.classic'
local Stats = Object:extend()

function Stats:new(stats)
	self.mBase = {}
	-- k = key v = value
	for k, v in pairs(stats) do
		self.mBase[k] = v -- Base stats, unmod
	end
	self.mModifiers = {} -- All the modifiers, not including base stats
end

function Stats:update(dt)
end

function Stats:draw()
end

function Stats:GetBase(id)
	return self.mBase[id]
end

-- id = used to uniquely identify the modifier
-- modifier =
-- {
--		add = { table of stat increments }	
-- 		mult = { table of stat multipliers }
-- }
function Stats:AddModifier(id, modifier)
	self.mModifiers[id] = 
	{
		add = modifier.add or {}, -- if modifier has add function or do nothing
		mult = modifier.mult or {} -- if modifier has mult function or do nothing
	}
end

function Stats:RemoveModifier(id)
	self.mModifiers[id] = nil
end

function Stats:Get(id)
	local total = self.mBase[id] or 0
	local multiplier = 0 

	for k, v in pairs(self.mModifiers) do 
		total = total + (v.add[id] or 0 )
		multiplier = multiplier + (v.mult[id] or 0)
	end

	return total + (total * multiplier)
end

function Stats:EditBaseStat(id, value)
	self.mBase[id] = value
end

return Stats