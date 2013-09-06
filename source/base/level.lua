-- level.lua --

-- This module runs an game activity and is added to a Scene

Level = {}
Level.items = {}

function Level:new()
  newLevel = {}
  newLevel.items = {}
  setmetatable(newLevel, self)
  self.__index = self
  return newLevel
end

function Level:add(a)
  self.items[#self.items + 1] = a
end

function Level:draw()
  for i,obj in ipairs(self.items) do
    obj:draw()
  end
end

function Level:update(dt)
  for i,obj in ipairs(self.items) do
    obj:update(dt)
  end
end

function Level:keypressed(key)
  for i,obj in ipairs(self.items) do
    obj:keypressed(key)
  end
end