-- menuitem.lua --

-- This a basic item to build into a Menu from menu.lua

Item = {}
Item.name = ""

function Item:new(a)
  newItem = {}
  newItem.name = a
  setmetatable(newItem, self)
  self.__index = self
  
  return newItem
end
 
function Item:draw(i, x, y)
  love.graphics.print(self.name, x, i * 30 + y)
end
 
function Item:action(act)
  --I'll get to this later 
  --return "meh"
end