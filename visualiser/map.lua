require('common.utils')
require('visualiser.visual')

---@class Map: Printable

Map = {}

---@param length integer
---@param width integer
---@param turtilla PrintableTurtle
---@return Map
function Map:new(length, width, turtilla)
    local this = {}
    this._width = width; this._length = length;
    this._turtle = turtilla

    function this:getWidth() return self._width end
    function this:getLength() return self._length end
    function this:getHeight() return self._height end

    local function createArray2d(l, w, ph)
        local arr = {}
        for i = 1, length, 1 do
            local layer = {}
            for j = 1, width, 1 do
                layer[j] = ph
            end
            arr[i] = layer
        end
        return arr
    end

    function this:getModel()
        local m = createArray2d(self._length, self._width, '|')
        m[self._turtle:getX()][self._turtle:getY()] = self._turtle:getModel()
        local result = {}
        local j = 1
        for i = self._length, 1, -1 do
            result[j] = table.concat(m[i])
            j = j + 1
        end
        return table.concat(result, '\n')
    end

    return this
end
