-- player.lua --

-- This adds a player controlled avatar to a Level

-- TODO --
-- need to implement the Player:update(dt) function

Player = {}
Player.x = 0
Player.y = 0

function Player:new(x, y)
  newPlayer = {}
  newPlayer.x = x
  newPlayer.y = y
  setmetatable(newPlayer, self)
  self.__index = self
  return newPlayer
end

function Player:draw()
  love.graphics.print("[-]", self.x, self.y)
end

function Player:update(dt)
 -- TODO
end

function Player:keypressed(key)
  if key == "up" then
    self.y = self.y - 10
  elseif key == "down" then
    self.y = self.y + 10
  elseif key == "left" then
    self.x = self.x - 10
  elseif key == "right" then
    self.x = self.x + 10
  end
end