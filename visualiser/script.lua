require('common.utils')
require('turtle.move.set')
require('common.turtle_mock')
require('visualiser.visual')
require('visualiser.map')

local t = PrintableTurtle:new()
local m = Map:new(5, 10, t)

local keyDelegateMap = {
    w = t.forward,
    s = t.back,
    a = t.turnLeft,
    d = t.turnRight,
    c = t.down,
    f = t.up
}
print(m:getModel())
while true do
    local key = io.read()
    local delegate = keyDelegateMap[key]
    if delegate ~= nil then
        delegate(t)
        print(m:getModel())
        print('x: '..t:getX(), 'y: '..t:getY(), 'z: '..t:getZ(), t:getDirection():getName())
        print()
    end
end