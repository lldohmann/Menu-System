local Background = require 'objects.obj_background'
local Option_A = require 'objects.obj_option_a'
local gamera = require 'libraries.gamera'
Options = {}

function Options:init()
	--self.cam = gamera.new(0, 0, displayWidth, displayHeight)
	--self.cam:setWindow(0, 0, displayWidth, displayHeight)
	--self.cam:setScale(scale)
	--self.cam:setPosition(0,0)
	--self.background1 = Background('assets/misc/background1.png', 35)
	--self.option = Option_A(5, 9, 22, 6, {"Screen Resolution:", "BACK"}) -- "Design Hero", "Design Enemy", "Options", "Quit"
	--self.selection = 1
end

function Options:enter()
	self.option = Option_A(5, 9, 22, 6, {"Screen Resolution:", "BACK"}) -- "Design Hero", "Design Enemy", "Options", "Quit"
	self.selection = 1
end

function Options:update(dt)
	Main_Menu.background1:update(dt)
end

function Options:draw()
	--local l,t,w,h = self.cam:getVisible()
	--self.cam:draw(function(l,t,w,h)
		Main_Menu.background1:draw()
		--self.background1:draw()
		self.option:draw()
	--end)
end

function Options:keypressed(key)
	if key == 'down' then
		if self.selection >= table.getn(self.option.options) then
			self.selection = 1
		else
			self.selection = self.selection + 1
		end
		self.option:setSelect(self.selection)
	elseif key == 'up' then
		if self.selection <= 1 then
			self.selection = table.getn(self.option.options)
		else
			self.selection = self.selection - 1
		end
		self.option:setSelect(self.selection)
	elseif key == 'z' then
		return self:inputHandler(self.selection)
	end
end

local bindings = {
--	[4] = function() Gamestate.switch() end
	[2] = function() Gamestate.pop() end
}

function Options:inputHandler(input)
	local action = bindings[input]
	if action then return action() end
end