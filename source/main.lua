require 'buildScene'

function love.load()
game = buildScene()
end

function love.draw()
  --love.graphics.print('Jekewikuw', 50, 50)
  game:draw()
end

function love.keypressed(key)
  game:keypressed(key)
end