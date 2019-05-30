local Window = require 'objects.obj_window'
local Option_A = Window:extend()

--[[
	PARAMETERS
		x - X POSITION OF WINDOW
		y - Y POSITION OF WINDOW
		w - WIDTH OF WINDOW
		h - HEIGHT OF WINDOW
		options - TABLE OF OPTIONS LABELS
		title - OPTIONAL TITLE TO PLACE ON WINDOW
		tspace - TITLE SPACE ON WINDOW
		topspace - HOW MUCH SPACE BETWEEN TOP OF WINDOW AND TEXT
		ospace - SPACING BETWEEN OPTIONS (BY 8 PIXELS UNITS)
--]]
function Option_A:new(x, y, w, h, options, title, tspace, topspace, ospace)
	Option_A.super.new(self, x, y, w, h, title, tspace)

	self.topspace = topspace or 0
	self.ospace = ospace or 0

	self.options = options or {} -- AN ARRAY OF ITEMS
	self.selection = {} -- CREATE A TABLE TO STORE OPTIONS
	--SET THE OPTIONS
	if table.getn(self.options) > 0 then
		self.selection[1] = true -- SET FIRST OPTION TO BE SELECTED
		for i = 2, table.getn(self.options) do
			self.selection[i] = false -- ALL OTHER OPTIONS ARE NOT SELECTED
		end
	end
	
end

function Option_A:update(dt)
end

function Option_A:draw()
	Option_A.super.draw(self)

	--DRAW ALL THE OPTIONS
	local space_x, space_y = self.x + self.tileSize, self.y + (self.ospace * self.tileSize) + (self.topspace * self.tileSize)
	for i = 1, table.getn(self.options) do
		if self.selection[i] == true then
			love.graphics.setColor(1,201/255,14/255)--(248,216,120)
			love.graphics.print(self.options[i], space_x, space_y)
			love.graphics.setColor(1,1,1)
		else
			love.graphics.print(self.options[i], space_x, space_y)
		end
		space_y = space_y + (self.ospace * self.tileSize) + self.tileSize
	end
end

--[[
	Finds the option that needs to be highlighted.
	If it doesn't find the right one, it will be set to false (helps switch highlight)
--]]
function Option_A:setSelect(num)
	for i = 1, table.getn(self.options) do
		if i == num then
			self.selection[i] = true
		else
			self.selection[i] = false
		end
	end
end

return Option_A