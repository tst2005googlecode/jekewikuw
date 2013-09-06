require 'base/stage'
require 'base/scene'
require 'base/menu'
require 'base/menuitem'
require 'base/menutoggle'
require 'base/level'
require 'base/player'

function buildScene()
  game = Stage:new()
  mainScreen = Scene:new("title")
  -- build main menu
  mainMenu = Menu:new(350, 150)
  -- add the items to the main menu
  mainMenu:add(Item:new("Start", "scene", "Start"))
  mainMenu:add(Item:new("Options", "scene", "Options"))
  mainMenu:add(Toggle:new("Select", false))
  mainMenu:add(Item:new("Exit", "quit", "quit"))
  mainScreen:add(mainMenu)
  
  level = Scene:new("Start")
  environment = Level:new()
  environment:add(Player:new(50, 50))
  level:add(environment)
  
  optionScreen = Scene:new("Options")
  omenu = Menu:new(350, 150)
  omenu:add(Item:new("Resolution", "none", "none"))
  omenu:add(Toggle:new("VSync", true))
  omenu:add(Toggle:new("FullScreen", false))
  omenu:add(Item:new("Back", "scene", "title"))
  optionScreen:add(omenu)
  
  game:add(mainScreen)
  game:add(level)
  game:add(optionScreen)
  game:setScene("title")
  return game
end