-- scene.lua --

-- The Stage module in base/stage.lua holds a collection of these Scenes
-- Each Scene is an instance of the game which could represent a level, menu, cutscene, etc

-- TODO --
-- This class needs design work. Right now it store all assets in the items table.
-- However every asset varies too much to pack together. For example some assets do not respond to
-- key presses and are only displayed. A MVC |Model View Control| approach could provide a solution

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

function Scene:keypressed(key)
  for i,obj in ipairs(self.items) do
    obj:keypressed(key)
  end
end