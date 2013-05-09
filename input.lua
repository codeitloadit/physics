module(..., package.seeall)

function handle(dt)
    if love.keyboard.isDown("w") then
        player:moveUp()
    elseif love.keyboard.isDown("s") then
        player:moveDown()
    else
        player:stop()
    end

    if love.keyboard.isDown(" ") then
        
    end
end