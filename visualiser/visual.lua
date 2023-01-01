require('common.utils')
require('turtle.move.set')

---@class Printable
---@field getModel fun(self) : string

---@class PrintableTurtle: TurtleBaseMoveset, Printable

PrintableTurtle = {}

---@param x integer?
---@param y integer?
---@param z integer?
---@param direction Direction?
---@return PrintableTurtle
function PrintableTurtle:new(x, y, z, direction)
    local this = TurtleBaseMovesetImpl:new(x, y, z, direction)
    local models = {
        front = '^',
        back = 'V',
        right = '>',
        left = '<'
    }
    this._models = models
    function this:getModel()
        return self._models[self:getDirection():getName()]
    end

---@diagnostic disable-next-line: return-type-mismatch
    return this
end

print(PrintableTurtle:new():getModel())

---@class Block: Printable

Block = {}

---@param model string
---@return Block
function Block:new(model)
    local this = { _model = model }
    function this:getModel()
        return self._model;
    end
    return this
end