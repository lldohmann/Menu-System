local Object = require 'libraries.classic'
local Stats = require 'objects.obj_unit'
local Hero = Stats:extend()

function Hero:new(stats, items, actions)
	Hero.super.new(self, stats)
	self.items = items or {}
	self.itemLimit = 10
	self.hpLimit = 999
	self.mpLimit = 999
	self.statLimit = 99
	self.actions = actions or {}
end

return Hero