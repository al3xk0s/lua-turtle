---@class Direction
---@field getName fun(self: Direction) : string
---@field getValue fun(self: Direction) : integer
---@field isAxisX fun(self: Direction) : boolean
---@field willIncrease fun(self: Direction) : boolean # Answers the question whether the coordinate on the axis will increase if you move forward.
---@field next fun(self: Direction) : Direction # next position when turning clockwise
---@field previous fun(self: Direction) : Direction # previous position when turning clockwise

---@class DirectionStatic
---@field front Direction
---@field right Direction
---@field back Direction
---@field left Direction
---@field values table<integer, Direction>
---@field next fun(direction: Direction) : Direction # next position when turning clockwise
---@field previous fun(direction: Direction) : Direction # previous position when turning clockwise
---@field parse fun(name: string) : Direction?

---@type DirectionStatic
Direction = {}

---@param name string
---@param isAxisX boolean
---@param willIncrease boolean
---@param value integer
---@return Direction
function Direction:_new(name, value, isAxisX, willIncrease)
    local this = { _name = name, _isAxisX = isAxisX, _willIncrease = willIncrease, _value = value }

    function this:getName() return self._name end
    function this:getValue() return self._value end
    function this:isAxisX() return self._isAxisX end
    function this:willIncrease() return self._willIncrease end

    function this:next()
        return Direction.next(self)
    end

    function this:previous()
        return Direction.previous(self)
    end

    ---@param d1 Direction
    ---@param d2 Direction
    this.__eq = function (d1, d2)
        return d1:getName() == d2:getName()
    end
    return this
end

Direction.front = Direction:_new('front', 1, true, true)
Direction.right = Direction:_new('right', 2, false, true)
Direction.back = Direction:_new('back', 3, true, false)
Direction.left = Direction:_new('left', 4, false, false)

Direction.values = { Direction.front, Direction.right, Direction.back, Direction.left }

---@param direction Direction
---@return Direction nextDirection
function Direction.next(direction)
    local key = direction:getValue()
    local nextIndex = key + 1
    nextIndex = (nextIndex - 1) % 4 + 1
    return Direction.values[nextIndex]
end

---@param direction Direction
---@return Direction previosDirection
function Direction.previous(direction)
    local key = direction:getValue()
    local newIndex = key - 1
    if newIndex < 1 then newIndex = 4 end
    return Direction.values[newIndex]
end

---@param name string
---@return Direction direction
function Direction.parse(name)
    local isCorrectName = name == 'front' or name == 'back' or name == 'left' or name == 'right'
    if not isCorrectName then error('Error parse direction with name '..name) end
    return Direction[name]
end
