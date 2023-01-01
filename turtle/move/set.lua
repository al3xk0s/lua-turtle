require('common.utils')
require('turtle.move.direction')

---@class TurtleBaseMoveset
---@field forward fun(self: TurtleBaseMoveset) : boolean, string?
---@field predictForward fun(self: TurtleBaseMoveset) : integer, integer x, y
---@field back fun(self: TurtleBaseMoveset) : boolean, string?
---@field predictBack fun(self: TurtleBaseMoveset) : integer, integer x, y
---@field up fun(self: TurtleBaseMoveset) : boolean, string?
---@field predictUp fun(self: TurtleBaseMoveset) : integer z
---@field down fun(self: TurtleBaseMoveset) : boolean, string?
---@field predictDown fun(self: TurtleBaseMoveset) : integer z
---@field turnLeft fun(self: TurtleBaseMoveset) : boolean, string?
---@field turnRight fun(self: TurtleBaseMoveset) : boolean, string?
---@field getX fun(self: TurtleBaseMoveset) : integer
---@field getY fun(self: TurtleBaseMoveset) : integer
---@field getZ fun(self: TurtleBaseMoveset) : integer
---@field getDirection fun(self: TurtleBaseMoveset) : Direction

TurtleBaseMovesetImpl = {}

---@param x integer?
---@param y integer?
---@param z integer?
---@param direction Direction?
---@return TurtleBaseMoveset
function TurtleBaseMovesetImpl:new(x, y, z, direction)
    local default = 1
    x = x or default
    y = y or default
    z = z or default
    direction = direction or Direction.front;
    local this = {
        _x = x,
        _y = y,
        _z = z,
        _direction = Direction.front
    }

    function this:getX()
        return self._x
    end
    function this:getY()
        return self._y
    end
    function this:getZ()
        return self._z
    end
    function this:getDirection()
        return self._direction
    end

    function this:_getDirectionMul()
        if self._direction:willIncrease() then return 1 end
        return -1
    end

    ---@param mul integer
    ---@return integer x, integer y
    function this:_calcAxisXYCoordinates(mul)
        if self._direction:isAxisX() then
            return self._x + mul, self._y
        end
        return self._x, self._y + mul
    end

    ---@param xCoord integer
    ---@param yCoord integer
    function this:_setAxisXYCoordinates(xCoord, yCoord)
        self._x = xCoord
        self._y = yCoord
    end

    ---@param delegate fun() : boolean, string?
    ---@param handler fun(self) : nil
    ---@return boolean success, string? raison
    function this:_doMove(delegate, handler)
        local success, raison = delegate()
        if not success then return success, raison end
        handler(self)
        return success, raison
    end

    ---@return integer x, integer y
    function this:predictForward()
        return self:_calcAxisXYCoordinates(self:_getDirectionMul())
    end

    ---@return integer x, integer y
    function this:predictBack()
        return self:_calcAxisXYCoordinates(-1 * self:_getDirectionMul())
    end

    ---@return integer z
    function this:predictUp() return self._z + 1 end
    ---@return integer z
    function this:predictDown() return self._z - 1 end

    function this:forward()
        local handler = function (t) t:_setAxisXYCoordinates(t:predictForward()) end
        return self:_doMove(turtle.forward, handler)
    end

    function this:back()
        local handler = function (t) t:_setAxisXYCoordinates(t:predictBack()) end
        return self:_doMove(turtle.back, handler)
    end

    function this:up()
        return self:_doMove(turtle.up, function(t) t._z = t:predictUp() end)
    end

    function this:down()
        return self:_doMove(turtle.down, function(t) t._z = t:predictDown() end)
    end

    function this:turnLeft()
        local changeDirection = function(t) t._direction = t._direction:previous() end
        return self:_doMove(turtle.turnLeft, changeDirection)        
    end

    function this:turnRight()
        local changeDirection = function(t) t._direction = t._direction:next() end
        return self:_doMove(turtle.turnRight, changeDirection)
    end

    return this
end
