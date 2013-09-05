-- menu.lua --

-- This provides a basic linear menu of selectable items. 

Menu = {}
Menu.items = {}
Menu.selection = 1

function Menu:new()
  newMenu = {}
  setmetatable(newMenu, self)
  self.__index = self
  return newMenu
end
 
function Menu:add(a)
  self.items[#self.items + 1] = a
end

function Menu:draw()
  for i,obj in ipairs(self.items) do
    if i == self.selection then
	  love.graphics.setColor(255, 155, 255, 255)
	  obj:draw(i)
	  love.graphics.setColor(255, 255, 255, 255)
	else
	  obj:draw(i)
	end
  end
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.print(self.selection, 100, 50)
end

function Menu:keypressed(key)
  if key == "up" then
    if self.selection == 1 then
	  self.selection = #self.items
	else
	  self.selection = self.selection - 1
	end
  end
  if key == "down" then
	if self.selection == #self.items then
	  self.selection = 1
	else
	  self.selection = self.selection + 1
	end
  end
end