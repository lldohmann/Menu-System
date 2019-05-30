local Background = require 'objects.obj_background'
local Option_A = require 'objects.obj_option_a'
local gamera = require 'libraries.gamera'

Main_Menu = {}

function Main_Menu:init()
end

function Main_Menu:enter()
	self.background1 = Background('assets/misc/background1.png', 35)
	self.option = Option_A(9, 16, 13, 12, {"DESIGN HERO", "DESIGN ENEMY", "START BATTLE", "OPTIONS", "QUIT"}, "Main Menu", 1, 1, 1)
	self.selection = 1
end

function Main_Menu:update(dt)
	self.background1:update(dt)
end

function Main_Menu:draw()
	self.background1:draw()
	self.option:draw()
end

function Main_Menu:keypressed(key)
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
	end
end

local bindings = {
	[1] = function() Gamestate.push(heroEdit) end,
	[4] = function() Gamestate.push(Options) end,
	[5] = function() love.event.quit() end
}

function Main_Menu:inputHandler(input)
	local action = bindings[input]
	if action then return action() end
end