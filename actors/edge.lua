module(..., package.seeall)

function create(x1, y1, x2, y2)
    local this = {}

    this.body = love.physics.newBody(world, x1, y1, "static")
    this.shape = love.physics.newEdgeShape(0, 0, x2-x1, y2-y1)
    this.fixture = love.physics.newFixture(this.body, this.shape, 1)
    -- this.fixture:setRestitution(1)

    function this:draw()
        love.graphics.setColor(50, 50, 50)
		love.graphics.line(this.body:getWorldPoints(this.shape:getPoints()))
    end

    return this
end