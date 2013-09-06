-- menuitem.lua --

-- This a basic item to build into a Menu from menu.lua

Item = {}
Item.name = ""
Item.act = ""
Item.val = ""

function Item:new(name, act, val)
  newItem = {}
  newItem.name = name
  newItem.act = act
  newItem.val = val
  setmetatable(newItem, self)
  self.__index = self
  
  return newItem
end
 
function Item:draw(i, x, y)
  love.graphics.print(self.name, x, i * 30 + y)
end
 
function Item:action()
  --I'll get to this later 
  return self.val, self.act
end