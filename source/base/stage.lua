-- stage.lua --

-- This module creates the main foundation that coordinates what is displayed on the screen
-- Only one is needed for each project. Within each stage is a collection of scenes that 
-- comprise of certain states of the game. 

Stage = {}

function Stage:new(a)
  newStage = {}
  setmetatable(newStage, self)
  self.__index = self
  
  return newStage
end