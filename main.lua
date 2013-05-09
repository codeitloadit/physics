Player = require("actors/player")
Puck = require("actors/puck")
Edge = require("actors/edge")
Tile = require("actors/tile")

function love.load()
	input = require("input")

    love.physics.setMeter(ONE_METER)
    world = love.physics.newWorld(0, GRAVITY*ONE_METER, true)
    world:setCallbacks(beginContact, endContact, preSolve, postSolve)
    love.graphics.setBackgroundColor(150, 150, 150)

    normal = "0, 0"

    player = Player.create()

    pucks = {}
    pucks[#pucks+1] = Puck.create()

    tiles = {}

    for x = 20, 980, 40 do
        for y = 20, 580, 40 do
            table.insert(tiles, Tile.create(x, y, 40)) 
        end 
    end 

    edges = {}
    edges.top = Edge.create(60, 0, SW, 0)
    edges.bottom = Edge.create(60, SH, SW, SH)
    edges.right = Edge.create(SW, 0, SW, SH)

end

function love.update(dt)
	input.handle(dt)
    world:update(dt)
    player:update(dt)
    for _, puck in pairs(pucks) do
        puck:update(dt)
    end

    for _, tile in pairs(tiles) do
        tile:update(dt)
    end
end

function love.draw()
    for _, tile in pairs(tiles) do
        tile:draw()
    end

    player:draw()
    for _, puck in pairs(pucks) do
        puck:draw()
    end

    -- for _, edge in pairs(edges) do
    --     edge:draw()
    -- end

    if debug then
    	xv, yv = player.body:getLinearVelocity()
        love.graphics.setColor(0, 0, 0)
        love.graphics.print("FPS: "..tostring(love.timer.getFPS()), 11, 10)
    end
end

function love.keypressed(key)
   if key == "escape" then
      love.event.push("quit")
   end
   if key == " " then
      pucks[#pucks+1] = Puck.create()
   end
end

function beginContact(a, b, coll)
    -- x,y = coll:getNormal()
    -- normal = tostring(x..", "..y)

    -- if x == 0 and y < 0 then puck.angle = 315 end
    -- if x == 0 and y > 0 then puck.angle = 45 end
end

function endContact(a, b, coll)
    
end

function preSolve(a, b, coll)
    
end

function postSolve(a, b, coll)
    
end