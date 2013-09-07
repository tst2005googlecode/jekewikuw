require 'buildScene'

function love.load()
game = buildScene()
end

function love.draw()
  --love.graphics.print('Jekewikuw', 50, 50)
  game:draw()
end

function love.update(dt)
  game:update(dt)
end

function love.keypressed(key)
  game:keypressed(key)
end

function love.keyreleased(key)
  game:keyreleased(key)
end