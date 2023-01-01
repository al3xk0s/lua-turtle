require('common.utils')
require('turtle.move.state')
require('turtle.move.direction')

TurtleMoveLineAxisXState = {}

---@param targetDirection Direction
---@param turtle TurtleBaseMoveset
---@param targetCoordinate integer move execute while current axis ~= this coordinate
function TurtleMoveLineAxisXState:new(turtle, targetCoordinate, targetDirection)
    if not targetDirection:isAxisX() then
        error('Invalid argument error: invalid target direction')
    end
    local super = TurtleMoveLineState:new(turtle, targetCoordinate, targetDirection)

    ---@class TurtleMoveLineAxisXState: TurtleMoveLineState
    local this = {}
    setmetatable(this, { __index = super})

    function this:_getCoordinate() return this._turtle:getX() end

    return this
end


TurtleMoveLineAxisYState = {}

---@param targetDirection Direction
---@param turtle TurtleBaseMoveset
---@param targetCoordinate integer move execute while current axis ~= this coordinate
function TurtleMoveLineAxisYState:new(turtle, targetCoordinate, targetDirection)
    if targetDirection:isAxisX() then
        error('Invalid argument error: invalid target direction')
    end
    local super = TurtleMoveLineState:new(turtle, targetCoordinate, targetDirection)

    ---@class TurtleMoveLineAxisYState: TurtleMoveLineState
    local this = {}
    setmetatable(this, super)

    function this:_getCoordinate() return this._turtle:getY() end

    return this
end

TurtleMoveFront = {}
TurtleMoveBack = {}
TurtleMoveRight = {}
TurtleMoveLeft = {}


---@param turtle TurtleBaseMoveset
---@param targetCoordinate integer
function TurtleMoveFront:new(turtle, targetCoordinate)
    local super = TurtleMoveLineAxisXState:new(turtle, targetCoordinate, Direction.front)
    ---@class TurtleMoveFront:TurtleMoveLineAxisXState
    local this = {}
    setmetatable(this, {__index = super})
    return this
end

---@param turtle TurtleBaseMoveset
---@param targetCoordinate integer
function TurtleMoveBack:new(turtle, targetCoordinate)
    local super = TurtleMoveLineAxisXState:new(turtle, targetCoordinate, Direction.back)
    ---@class TurtleMoveBack:TurtleMoveLineAxisXState
    local this = {}
    setmetatable(this, {__index = super})
    return this
end

---@param turtle TurtleBaseMoveset
---@param targetCoordinate integer
function TurtleMoveRight:new(turtle, targetCoordinate)
    local super = TurtleMoveLineAxisYState:new(turtle, targetCoordinate, Direction.right)
    ---@class TurtleMoveRight:TurtleMoveLineAxisYState
    local this = {}
    setmetatable(this, {__index = super})
    return this
end

---@param turtle TurtleBaseMoveset
---@param targetCoordinate integer
function TurtleMoveLeft:new(turtle, targetCoordinate)
    local super = TurtleMoveLineAxisYState:new(turtle, targetCoordinate, Direction.left)
    ---@class TurtleMoveLeft:TurtleMoveLineAxisYState
    local this = {}
    setmetatable(this, {__index = super})
    return this
end