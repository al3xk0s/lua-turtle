require('common.utils')
require('common.while_task')
require('turtle.move.direction')

TurtleMoveState = {}


---@param turtle TurtleBaseMoveset
function TurtleMoveState:new(turtle)
    ---@class TurtleMoveState: WhileTask
    ---@field protected _turtle TurtleBaseMoveset
    local this = { _turtle = turtle }

    local super = WhileTask:new()
    setmetatable(this, { __index = super })

    return this
end


TurtleMoveLineState = {}

---@param targetDirection Direction
---@param turtle TurtleBaseMoveset
---@param targetCoordinate integer move execute while current axis ~= this coordinate
function TurtleMoveLineState:new(turtle, targetCoordinate, targetDirection)
    local super = TurtleMoveState:new(turtle)

    ---@class TurtleMoveLineState: TurtleMoveState
    ---@field _targetCoordinate integer
    ---@field _isLast boolean
    ---@field _targetDirection Direction
    local this = {
        _targetCoordinate = targetCoordinate,
        _targetDirection = targetDirection
    }
    setmetatable(this, {__index = super})

    ---@protected
    ---@return boolean needContinue
    function this:_getCoordinate()
        ---@diagnostic disable-next-line: missing-return
        NotImplemented()
    end

    function this:_continue()
        if turtle:getDirection() ~= self._targetDirection then
            return false
        end
        return self:_getCoordinate() ~= self._targetCoordinate
    end

    function this:_doing() turtle:forward() end

    return this
end

