require 'base/stage'
require 'base/scene'
require 'base/menu'
require 'base/menuitem'
require 'base/menutoggle'

function buildScene()
  a = Scene:new()
  -- build main menu
  mainMenu = Menu:new(350, 150)
  -- add the items to the main menu
  mainMenu:add(Item:new("Start"))
  mainMenu:add(Item:new("Options"))
  mainMenu:add(Toggle:new("Select", false))
  mainMenu:add(Item:new("Exit"))
  
  a:add(mainMenu)
  return a
end