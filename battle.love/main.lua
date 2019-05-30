-- IMPORT ALL STATES
Gamestate = require 'libraries.gamestate'
require 'states.state_main_menu'
require 'states.state_options'
require 'states.state_setup'
require 'states.state_hero'
require 'states.state_hero_stats'
require 'states.state_hero_stats_two'

function love.load()
	-- Set up random number generation
	math.randomseed(os.time())
	-- Scaling of pixels
	love.graphics.setDefaultFilter('nearest', 'nearest')
	
	-- helm   -> @
	-- Armor  -> #
	-- Sheild -> $
	-- Ring   -> `
	-- Knife  -> ^
	-- Sword  -> =
	-- Axe    -> (
	-- Staff  -> )
	-- Lance  -> |
	-- Potion -> }
	-- Tome   -> {
	-- Hat    -> [
	-- Cloth  -> ]

	-- Import and Set up font and special characters
	local font = love.graphics.newImageFont("assets/misc/font_2.png",
		" ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.-+:!?',%><&;0123456789@#$`^=()|}{[]")
	love.graphics.setFont(font)

	-- Set window based on scale
	scale = 1.0
	displayWidth, displayHeight = 256 * scale, 240 * scale
	love.window.setMode(displayWidth, displayHeight)

	--TESTER
	debug = true

	-- Set up States
	Gamestate.registerEvents()
	Gamestate.switch(Setup)
end

function love.update(dt)
end

function love.draw()
end