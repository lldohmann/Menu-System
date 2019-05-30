local Object = require 'libraries.classic'
local Window = Object:extend()

--[[
	PARAMETERS
		x - X POSITION OF WINDOW
		y - Y POSITION OF WINDOW
		w - WIDTH OF WINDOW
		h - HEIGHT OF WINDOW
		title - OPTIONAL TITLE TO PLACE ON WINDOW
		tspace - TITLE SPACE ON WINDOW
--]]
function Window:new(x, y, w, h, title, tspace)
	self.tileSize = 8
	self.x = x * self.tileSize
	self.y = y * self.tileSize
	self.w = w
	self.h = h
	self.title = title or ''
	self.tspace = tspace or 0

	--SET UP FRAME OF WINDOW
	self.tileset = love.graphics.newImage("assets/misc/textbox1.png")
	self.colorFilling = {
		["r"] = 0,
		["g"] = 95,
		["b"] = 255
	}
	self.tilesetBatch = love.graphics.newSpriteBatch(self.tileset, 1000)

	self.tilesetBatch:clear()
	local tileX, tileY = 0, 0
	for height = 0, self.h do
		for width = 0, self.w do
			if (height == 0) then
				if (width == 0) then -- top left
					tileX, tileY = 0, 0
				elseif (width == self.w) then -- top right
					tileX, tileY = 16, 0
				else
					tileX, tileY = 8, 0
				end
			elseif (height == self.h) then
				if (width == 0) then -- bottom left
					tileX, tileY = 0, 16
				elseif (width == self.w) then -- bottom right
					tileX, tileY = 16, 16
				else -- bottom mid 
					tileX, tileY = 8, 16
				end
			else
				if (width == 0) then -- mid left
					tileX, tileY = 0, 8
				elseif (width == self.w) then -- mid right
					tileX, tileY = 16, 8
				end
			end
			if (tileX ~= -1 and  tileY ~= -1) then
				self.tilesetBatch:add(
					love.graphics.newQuad(
						tileX, 
						tileY, 
						self.tileSize, 
						self.tileSize, 
						self.tileset:getWidth(), 
						self.tileset:getHeight()),
					self.x + width * self.tileSize, 
					self.y + height * self.tileSize)
			end
			tileX, tileY = -1, -1
		end
	end
	self.tilesetBatch:flush()
end

function Window:update(dt)
end

function Window:draw()
	--DRAW THE FILLING FOR WINDOW
	love.graphics.setColor(self.colorFilling["r"]/255, self.colorFilling["g"]/255, self.colorFilling["b"]/255) 
	love.graphics.rectangle('fill', self.x, self.y, self.w * self.tileSize, self.h * self.tileSize)
	love.graphics.setColor(1,1,1)
	--DRAW THE FRAME
	love.graphics.draw(self.tilesetBatch)

	-- DRAW THE TITLE
	self:drawTitle()
end

--TEMP
function Window:drawTitle()
	local spacing = string.len(self.title) * self.tileSize

	love.graphics.setColor(self.colorFilling["r"]/255, self.colorFilling["g"]/255, self.colorFilling["b"]/255) 
	love.graphics.rectangle('fill', self.x + (self.tspace * self.tileSize) + self.tileSize, self.y, spacing, self.tileSize)
	love.graphics.setColor(1,1,1)

	love.graphics.print(self.title, self.x + (self.tspace * self.tileSize) + self.tileSize, self.y)
end

return Window