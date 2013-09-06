-- menu.lua --

-- This provides a basic linear menu of selectable items. 

Menu = {}
Menu.items = {}
Menu.selection = 1
Menu.x = 0
Menu.y = 0

function Menu:new(x, y)
  newMenu = {}
  newMenu.items = {}
  newMenu.selection = 1
  newMenu.x = x
  newMenu.y = y
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
	  love.graphics.setColor(155, 155, 255, 255)
	  obj:draw(i, self.x, self.y)
	  love.graphics.setColor(255, 255, 255, 255)
	else
	  obj:draw(i, self.x, self.y)
	end
  end
  love.graphics.setColor(255, 255, 255, 255)
end

function Menu:update(dt)
  -- TODO
end

function Menu:keypressed(key)
  name = "none"
  act = "none"
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
  if key == "return" then
    name, act = self.items[self.selection]:action()
  end
  return name, act
end