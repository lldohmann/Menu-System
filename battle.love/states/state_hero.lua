--[[
function heroEdit:enter()
	self.option = Option_A(1, 5, 7, 1, {"STATS", "EQUIP", "ITEMS", "MOVES", "BACK"}, 0, 1)
	self.windowBaseStat = Window(16, 16, 9, 12)
	self.selection = 1
	self.explain = {
		[1] = "Edit base stats of hero",
		[2] = "Choose the equipment of hero",
		[3] = "Add items into the inventory",
		[4] = "Choose the battle commands",
		[5] = "Return to main menu",
	}
	self.textBox = Box(1, 1, 29, 2)
end

function heroEdit:update(dt)
	Main_Menu.background1:update(dt)
end

function heroEdit:draw()
	Main_Menu.background1:draw()

	self.option:draw()
	self.windowBaseStat:draw()
	self.textBox:draw(self.explain[self.selection])
	PrintStat(hero, "ATk", 11, 18)
	PrintStat(hero, "DEF", 11, 20)
	PrintStat(hero, "RES", 11, 22)
	PrintStat(hero, "LCK", 11, 24)
	PrintStat(hero, "SPD", 11, 26)
--]]

local Option_A = require 'objects.obj_option_a'
local Window = require 'objects.obj_window'
local Box = require 'objects.obj_textBox'

heroEdit = {}

function heroEdit:init()
end

function heroEdit:enter()
	self.option = Option_A(1, 5, 6, 10, {"STATS", "EQUIP", "ITEMS", "MOVES", "BACK"},"", 0, 0, 1)
	self.windowBaseStat = Window(22, 17, 8, 11, "STATS", 1)
	self.selection = 1
	self.explain = {
		[1] = "Edit base stats of hero",
		[2] = "Choose the equipment of hero",
		[3] = "Add items into the inventory",
		[4] = "Choose the battle commands",
		[5] = "Return to main menu",
	}
	self.textBox = Box(1, 1, 29, 2)
end

function heroEdit:update(dt)
	Main_Menu.background1:update(dt)
end

function heroEdit:draw()
	Main_Menu.background1:draw()

	self.option:draw()
	self.windowBaseStat:draw()
	self.textBox:draw(self.explain[self.selection])
	PrintStat2(hero, "LVL", 23, 18)
	PrintStat2(hero, "EXP", 23, 19)
	PrintStat2(hero, "HIT", 23, 20)
	PrintStat2(hero, "STR", 23, 21)
	PrintStat2(hero, "DEF", 23, 22)
	PrintStat2(hero, "AGL", 23, 23)
	PrintStat2(hero, "SPD", 23, 24)
	PrintStat2(hero, "MAG", 23, 25)
	PrintStat2(hero, "RES", 23, 26)
	PrintStat2(hero, "LCK", 23, 27)
end

function heroEdit:keypressed(key)
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
	[1] = function() Gamestate.push(heroEditStats) end,
	[4] = function() Gamestate.push() end,
	[5] = function() Gamestate.pop() end
}

function heroEdit:inputHandler(input)
	local action = bindings[input]
	if action then return action() end
end
