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
 
 function Item:draw(y)
   love.graphics.print(self.name, 50, y * 30)
 end