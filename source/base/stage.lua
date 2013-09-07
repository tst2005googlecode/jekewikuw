-- stage.lua --

-- This module creates the main foundation that coordinates what is displayed on the screen
-- Only one is needed for each project. Within each stage is a collection of scenes that 
-- comprise of certain states of the game. 

Stage = {}
Stage.scenes = {}
Stage.currentScene = ""

function Stage:new()
  newStage = {}
  setmetatable(newStage, self)
  self.__index = self
  
  return newStage
end

function Stage:add(a)
  self.scenes[a.name] = a
end

function Stage:createScene(a)
  self.scenes[a] = Scene:new(a)
end

function Stage:draw()
  self.scenes[self.currentScene]:draw()
end

function Stage:update()
  self.scenes[self.currentScene]:update(dt)
end

function Stage:keypressed(key)
  name, act = self.scenes[self.currentScene]:keypressed(key)
  if act == "scene" then
	self:setScene(name)
  elseif act == "quit" then
    love.event.push(act)
  end
end

function Stage:keyreleased(key)
  self.scenes[self.currentScene]:keyreleased(key)
end

function Stage:setScene(scene)
  self.currentScene = scene
end
