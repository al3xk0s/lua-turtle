require('turtle.turtle')

---@enum TurtleTaskState
TurtleTaskState = {
    initial = 0,
    onProcess = 1,
    stoped = 2,
    err = 3,
    complete = 4,
}

TurtleTask = {}

function TurtleTask:new()
    ---@class TurtleTask
    ---@field _turtle Turtle?
    local this = {}

    function this:exec() self:_verifyTaskExecute() end

    ---@param turtle Turtle
    function this:init(turtle)
        self._turtle = turtle
    end

    function this:dispose()
        self._turtle = nil
    end

    function this:isInitialised()
        return self._turtle ~= nil
    end

    ---@protected
    function this:_verifyTaskExecute()
        if not self:isInitialised() then
            error('The task must be initialized!')
        end
    end

    return this
end