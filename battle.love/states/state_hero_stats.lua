local Option_A = require 'objects.obj_option_a'
local TextBox = require 'objects.obj_textBox'

heroEditStats = {}

function heroEditStats:init()
end

function heroEditStats:enter()
	self.option = Option_A(22, 17, 8, 11, {"LVL", "EXP", "HIT", "STR", "DEF", "AGL", "SPD", "MAG", "RES", "LCK"}, "STATS", 1, 1)

	self.selection = 1
	self.explain = {
		[1] = "Level of Unit",
		[2] = "Experience of Unit",
		[3] = "Hit Points of Unit",
		[4] = "Affects physical power",
		[5] = "Reduces physical damage",
		[6] = "Dodge & AGL Weapons",
		[7] = "Affects order of action",
		[8] = "Affects magical power",
		[9] = "Resistance to magic",
		[10] = "Crit% & items drops",
	}
	self.textBox = TextBox(1, 1, 29, 2)
end

function heroEditStats:update(dt)
	heroEdit:update(dt)
end

function heroEditStats:draw()
	heroEdit:draw()
	self.textBox:draw(self.explain[self.selection])
	self.option:draw()
	--[[
	printStatOnly(hero, "ATTACK", 11, 18)
	printStatOnly(hero, "DEFENSE", 11, 20)
	printStatOnly(hero, "RESIST", 11, 22)
	printStatOnly(hero, "LUCK", 11, 24)
	printStatOnly(hero, "SPEED", 11, 26)
	--]]
	printStatOnly2(hero, "LVL", 23, 18)
	printStatOnly2(hero, "EXP", 23, 19)
	printStatOnly2(hero, "HIT", 23, 20)
	printStatOnly2(hero, "STR", 23, 21)
	printStatOnly2(hero, "DEF", 23, 22)
	printStatOnly2(hero, "AGL", 23, 23)
	printStatOnly2(hero, "SPD", 23, 24)
	printStatOnly2(hero, "MAG", 23, 25)
	printStatOnly2(hero, "RES", 23, 26)
	printStatOnly2(hero, "LCK", 23, 27)
	
end

function heroEditStats:keypressed(key)
	if key == 'down' then
		if self.selection >= table.getn(self.option.options) then -- if we go out of bounds
			self.selection = 1 -- Go to top
		else
			self.selection = self.selection + 1
		end
		self.option:setSelect(self.selection)
	elseif key == 'up' then
		if self.selection <= 1 then -- if we go out of bounds
			self.selection = table.getn(self.option.options) -- Go to bottom
		else
			self.selection = self.selection - 1
		end
		self.option:setSelect(self.selection)
	elseif key == 'z' then
		return self:inputHandler(self.selection)
	elseif key == 'x' then
		Gamestate.pop()
	end
end

local bindings = {
	[1] = function() Gamestate.push(heroEditStatsTwo, "LVL", 23, 18) end,
	[2] = function() Gamestate.push(heroEditStatsTwo, "EXP", 23, 19) end,
	[3] = function() Gamestate.push(heroEditStatsTwo, "HIT", 23, 20) end,
	[4] = function() Gamestate.push(heroEditStatsTwo, "STR", 23, 21) end,
	[5] = function() Gamestate.push(heroEditStatsTwo, "DEF", 23, 22) end,
	[6] = function() Gamestate.push(heroEditStatsTwo, "AGL", 23, 23) end,
	[7] = function() Gamestate.push(heroEditStatsTwo, "SPD", 23, 24) end,
	[8] = function() Gamestate.push(heroEditStatsTwo, "MAG", 23, 25) end,
	[9] = function() Gamestate.push(heroEditStatsTwo, "RES", 23, 26) end,
	[10] = function() Gamestate.push(heroEditStatsTwo, "LCK", 23, 27) end,
}

function heroEditStats:inputHandler(input)
	local action = bindings[input]
	if action then return action() end
end

function printStatOnly(unit, id, x, y)
	local base = unit:GetBase(id)
	local full = unit:Get(id)
	local space = ""
	for i = 1, string.len(id) do
		space = space .. " "
	end
	local str = string.format("%s %d:%d", space, base, full)
	love.graphics.print(str, x*8, y*8)
end

function printStatOnly2(unit, id, x, y)
	local full = unit:Get(id)
	local space = ""
	for i = 1, string.len(id) do
		space = space .. " "
	end
	local str = string.format("%s..%d", space, full)
	love.graphics.print(str, x*8, y*8)
end