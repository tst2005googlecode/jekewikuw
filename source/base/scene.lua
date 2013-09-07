-- scene.lua --

-- The Stage module in base/stage.lua holds a collection of these Scenes
-- Each Scene is an instance of the game which could represent a level, menu, cutscene, etc

-- TODO --
-- This class needs design work. Right now it store all assets in the items table.
-- However every asset varies too much to pack together. For example some assets do not respond to
-- key presses and are only displayed. A MVC |Model View Control| approach could provide a solution
--
-- Also need to look into standard items that would fit this class. Things such as backgrounds,
-- data models, etc need to be designed into the framwork
--
-- Proposed components
-----------------------
-- Display only items (Backgrounds, titles, text, images, etc)
-- Selectable/Interactive items (Menus, dialogue, etc)
-- Data and models (game state, entity values, inventory, ect)

Scene = {}
Scene.items = {}
Scene.name = ""

function Scene:new(name)
  newScene = {}
  newScene.items = {}
  newScene.name = name
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

function Scene:update(dt)
  for i, obj in ipairs(self.items) do
    obj:update(dt)
  end
end

function Scene:keypressed(key)
  name = self.name
  act = "none"
  for i,obj in ipairs(self.items) do
    -- let's try to call data up from objects below here rather than
	-- passing down the key data to the objects and pushing up the results
    name, act = obj:keypressed(key)
	-- self.name = act
  end
  return name, act
end

function Scene:keyreleased(key)
  for i,obj in ipairs(self.items) do
    obj:keyreleased(key)
  end
end