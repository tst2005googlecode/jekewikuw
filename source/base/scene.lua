-- scene.lua --

Scene = {}
Scene.items = {}

function Scene:new()
  newScene = {}
  setmetatable(newScene, self)
  self.__index = self
  return newScene
end

function Scene:add(a)
  self.items[#self.items + 1] = a
end

function Scene:draw()
  for i,obj in ipairs(self.items) do
    obj:draw()
  end
end