module(..., package.seeall)

function create()
    local this = {}
    this.x = 60
    this.y = SH/2
    this.width = 32
    this.height = 128
    this.speed = 12
    this.lineColor = {50, 50, 50}
    this.fillColor = {255, 102, 255}

    -- this.image = love.graphics.newImage("assets/paddle.png")
    this.body = love.physics.newBody(world, this.x, this.y, "static")
    this.shape = love.physics.newPolygonShape(-32, -64, -14, -64, -4, -42, 0, -20, 0, 24, -4, 46, -14, 64, -32, 64)
    this.fixture = love.physics.newFixture(this.body, this.shape, 1)
    -- this.body:setAngle(math.rad(30))

    function this:moveUp()
        this.y = this.y - this.speed
        if this.y < 64 then this.y = 64 end
    end

    function this:moveDown()
        this.y = this.y + this.speed
        if this.y > 536 then this.y = 536 end
    end

    function this:stop()
        -- this.body:setLinearVelocity(0, 0)
    end

    function this:update(dt)
        this.body:setX(this.x)
        this.body:setY(this.y)

    end

    function this:draw()
        love.graphics.setColor(this.fillColor)
        love.graphics.polygon("fill", this.body:getWorldPoints(this.shape:getPoints()))
        love.graphics.setColor(this.lineColor)
        love.graphics.setLineWidth(2)
        love.graphics.polygon("line", this.body:getWorldPoints(this.shape:getPoints()))
    end

    return this
end
