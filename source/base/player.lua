-- player.lua --

-- This adds a player controlled avatar to a Level

-- TODO --
-- need to implement the Player:update(dt) function

Player = {}
Player.x = 0
Player.y = 0

key_act = {}
key_act.up = false
key_act.right = false
key_act.down = false
key_act.left = false

function Player:new(x, y)
  newPlayer = {}
  newPlayer.x = x
  newPlayer.y = y
  setmetatable(newPlayer, self)
  self.__index = self
  return newPlayer
end

function Player:draw()
  love.graphics.circle("fill", self.x, self.y, 10, 15)
end

function Player:keypressed(key)
	if key == "up" then
		key_act.up = true
	elseif key == "down" then
		key_act.down = true
	elseif key == "left" then
		key_act.right = true
	elseif key == "right" then
		key_act.right = true
  end
end

function Player:keyreleased(key)
	if key == "up" then
		key_act.up = false
	elseif key == "right" then
		key_act.right = false
	elseif key == "down" then
		key_act.down = false
	elseif key == "left" then
		key_act.left = false
	end
end

function Player:update(dt)
	if key_act.up then
		self.y = self.y - 10
	elseif key_act.down then
		self.y = self.y + 10
	elseif key_act.left then
		self.x = self.x - 10
	elseif key_act.right then
		self.x = self.x + 10
	end
end

