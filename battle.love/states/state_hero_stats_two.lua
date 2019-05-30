heroEditStatsTwo = {}

function heroEditStatsTwo:init(prev, stat, x, y)
end

function heroEditStatsTwo:enter(prev, stat, x, y)
	self.stat = stat 
	self.x = x
	self.y = y
end

function heroEditStatsTwo:update(dt)
	heroEdit:update(dt)
end

function heroEditStatsTwo:draw()
	heroEditStats:draw()
	love.graphics.setColor(1,201/255,14/255)
	printStatOnly2(hero, self.stat, self.x, self.y)
	love.graphics.setColor(1,1,1)
end

function heroEditStatsTwo:keypressed(key)
	local baseValue = hero:GetBase(self.stat)
	if key == 'up' then
		if baseValue + 1 <= hero.statLimit then
			baseValue = baseValue + 1
			hero:EditBaseStat(self.stat, baseValue)
		end
	elseif key == 'down' then
		if baseValue - 1 > 0 then
			baseValue = baseValue - 1
			hero:EditBaseStat(self.stat, baseValue)
		end
	elseif key == 'x' then
		Gamestate.pop()
	end
end
