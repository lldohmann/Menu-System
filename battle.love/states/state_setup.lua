local Background = require 'objects.obj_background'
local Option_A = require 'objects.obj_option_a'
local Stats = require 'objects.obj_unit'
local Items = require 'data.items'
local Hero = require 'objects.obj_hero'
local Box = require 'objects.obj_textBox'

local gamera = require 'libraries.gamera'

Setup = {}

function Setup:init()
end

--[[
	SET UP TEST ENVIRONMENT TO QUICKLY TEST NEW FEATURES BEFORE IMPLEMENTATION
--]]
function Setup:enter()
	self.textBox = Box(1, 1, 29, 2, "Hello World", "test box")

	-- A TEST STATS OF UNIT
	local stats2 = {
		["LVL"] = 1,
		["EXP"] = 0,
		["HIT"] = 15,
		["HITNOW"] = 15,
		["STR"] = 10,
		["DEF"] = 10,
		["AGL"] = 8,
		["SPD"] = 4,
		["MAG"] = 3,
		["RES"] = 5,
		["LCK"] = 5,
	}


--[[
	local stats2 = {
		["NAME"] = "Hero",
		["HP MAX"] = 15,
		["HP Now"] = 15,
		["MP MAX"] = 10,
		["MP NOW"] = 10,
		["ATTACK"] = 10,
		["DEFENSE"] = 8,
		["RESIST"] = 4,
		["LUCK"] = 3,
		["SPEED"] = 5,
	}
	--]]
	hero = Hero(stats2)
end

function Setup:update(dt)
end

function Setup:draw()
	-- TESTING ALL CUSTOM CHARACTERS
	love.graphics.print(" @ Iron \n # magic \n $ Fire \n ` Spd+1 \n ( Battle \n ) Holy \n | Heal \n } Cur1", 16, 40)
	self.textBox:draw()
end

function Setup:keypressed(key)
	if key == "z" then
		 Gamestate.push(Main_Menu)
	end
end

function PrintStat(unit, id, x, y)
	local base = unit:GetBase(id)
	local full = unit:Get(id)
	local str = string.format("%s %d:%d", id, base, full)
	love.graphics.print(str, x*8, y*8)
end

function PrintStat2(unit, id, x, y)
	local full = unit:Get(id)
	local str = string.format("%s..%d", id, full)
	love.graphics.print(str, x*8, y*8)
end