local Object = require 'libraries.classic'
local Background = Object:extend()

function Background:new(image, speed)
	self.image = love.graphics.newImage(image)
	self.speed = speed
	self.position = 0
end

function Background:update(dt)
	self.position = (self.position + self.speed * dt) % self.image:getHeight()
end

function Background:draw()
	love.graphics.draw(self.image, 0, self.position)
	love.graphics.draw(self.image, 0, self.position - self.image:getHeight())
end

return Background