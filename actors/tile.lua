module(..., package.seeall)

function create(x, y, size)
    local this = {}

    this.color = {250, 250, 250}

    this.body = love.physics.newBody(world, x, y, "static")
    this.shape = love.physics.newRectangleShape(0, 0, size, size)

    function this:update(dt)
    	this.color = calculateTileColor(this)
    end

    function this:draw()
        love.graphics.setColor(this.color)
		love.graphics.polygon("fill", this.body:getWorldPoints(this.shape:getPoints()))

        -- love.graphics.setColor(250, 0, 250)
        -- love.graphics.print(tostring(this.color[1]), this.body:getX()-20, this.body:getY()-20)
    end

    return this
end

function calculateTileColor(this)
	local puckDist =  -math.sqrt(
		(pucks[1].body:getX() - this.body:getX() ) * ( pucks[1].body:getX() - this.body:getX()) + 
		(pucks[1].body:getY() - this.body:getY()) * (pucks[1].body:getY() - this.body:getY()));
	puckDist = puckDist/3
	if puckDist > -1 then puckDist = -1 end
	if puckDist < -255 then puckDist = -255 end
	return {puckDist, puckDist, puckDist}
end
