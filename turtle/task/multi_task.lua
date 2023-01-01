require('turtle.turtle')

TurtleMultiTask = {}

function TurtleMultiTask:new()
    local super = TurtleTask:new()

    ---@class TurtleTurtleMultiTask: TurtleTask
    local this = {}
    setmetatable(this, { __index = super })

    ---@type table<integer, TurtleTask>
    this._tasks = {}

    ---@param task TurtleTask
    function this:addTask(task)
        local tasks = self._tasks
        tasks[#tasks+1] = task
    end

    function this:removeTasks()
        local tasks = self._tasks
        for _, task in pairs(tasks) do
            task:dispose()
            table.remove(tasks, _)
        end
    end

    ---@param turtle Turtle
    function this:init(turtle)
        super.init(self, turtle)
        for _, task in pairs(self._tasks) do
            task:init(turtle)
        end
    end

    function this:dispose()
        local tasks = self._tasks
        for _, value in pairs(tasks) do
            value:dispose()
        end
        super.dispose(self)
    end

    function this:exec()
        super.exec(self)
        for _, task in pairs(self._tasks) do
            task:exec()
        end
    end

    return this
end