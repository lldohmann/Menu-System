local Window = require 'objects.obj_window'

local TextBox = Window:extend()

function TextBox:new(x, y, w, h, dialog, title, tspace)
	TextBox.super.new(self, x, y, w, h, title, tspace)

	self.dialog = dialog or nil
	if self.dialog then
		reformat(self.dialog, self.w, self.tileSize)
	end
	
end

function TextBox:update(dt)
end

function TextBox:draw(dialog)
		TextBox.super.draw(self)

		if self.dialog then
			love.graphics.printf(self.dialog, self.x + self.tileSize, self.y + self.tileSize, self.w * self.tileSize - self.tileSize)
		else
			reformat(dialog, self.w, self.tileSize)
			love.graphics.printf(dialog, self.x + self.tileSize, self.y + self.tileSize, self.w * self.tileSize - self.tileSize)
		end
end

function reformat(dialog, width, tileSize)
	local textLength = (width * tileSize - tileSize)/8
	local copy = dialog
	local totalLength = 0
	local result = ""
	for word in string.gfind(copy, "(%S+)") do
		if totalLength + string.len(word) < textLength then
			result = result .. word .. " "
			totalLength = totalLength + string.len(word) + 1
		else
			result = result .. "\n" .. word .. " "
			totalLength = string.len(word) + 1
		end
	end
	return result
end

return TextBox
