module(..., package.seeall)

function create()
    local this = {}
    this.x = 120
    this.y = SH/2
    this.radius = 16
    this.angle = 45
    this.speed = 5
    this.lineColor = {50, 50, 50}
    this.fillColor = {255, 204, 102}

    -- this.image = love.graphics.newImage("assets/puck.png")
    this.body = love.physics.newBody(world, this.x, this.y, "dynamic")
    this.shape = love.physics.newCircleShape(this.radius)
    -- this.shape = love.physics.newRectangleShape(0, 0, this.radius*2, this.radius*2)
    this.fixture = love.physics.newFixture(this.body, this.shape, 1)
    this.fixture:setRestitution(1)
    this.fixture:setFriction(0)
    this.body:applyLinearImpulse(100, 100)


    function this:update(dt)
        this.x = this.body:getX()
        this.y = this.body:getY()

    end

    function this:draw()
        love.graphics.setColor(this.fillColor)
        love.graphics.circle("fill", this.x, this.y, this.radius)
        love.graphics.setColor(this.lineColor)
        love.graphics.setLineWidth(2)
        love.graphics.circle("line", this.x, this.y, this.radius)

        -- love.graphics.setColor(255, 0, 0)
        -- love.graphics.setLineWidth(1)
        -- love.graphics.polygon("line", this.body:getWorldPoints(this.shape:getPoints()))
    end

	function this:getPointAroundPuck(deg)
	    local x = this.x + this.radius * math.cos(math.rad(deg))
	    local y = this.y + this.radius * math.sin(math.rad(deg))
	    return x, y
	end

    return this
end
