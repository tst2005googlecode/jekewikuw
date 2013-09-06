-- menutoggle.lua --

-- This a basic toggle to build into a Menu from menu.lua

Toggle = {}
Toggle.name = ""
Toggle.value = false

function Toggle:new(a, v)
  newToggle = {}
  newToggle.name = a
  newToggle.value = v
  setmetatable(newToggle, self)
  self.__index = self
  
  return newToggle
end
 
function Toggle:draw(i, x, y)
  love.graphics.print(self.name, x, i * 30 + y)
  if self.value == true then
    love.graphics.print("X", x + 100, i * 30 + y)
  else
    love.graphics.print("O", x + 100, i * 30 + y)
  end
end
 
function Toggle:action()
  self.value = not self.value
  return self.name
end