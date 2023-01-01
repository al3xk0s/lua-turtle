---@generic C: table, P: table
---@param child C
---@param parent P
---@return C | P child 
function Extends(child, parent)
    setmetatable(child,{__index = parent})
    return child
end

---@generic T: table
---@param parent T
---@return T
function NewChild (parent)
    local child = {}
    return Extends(child, parent)
end

---@generic L: table, P: table
---@param localObj L
---@param parent P
---@return P | L obj
function ExtendsInstance(localObj, parent)
    setmetatable(localObj, parent)
    parent.__index = parent;
    return localObj
end


---@param message? string
function NotImplemented(message)
    if message == nil then
        message = ''
    end
    error('NotImplemented: '..message)
end

---@generic K
---@param t table<K, any> 
---@return table<integer, K> keys
function table.keys(t)
    local keys = {}
    local i = 1
    for key, _ in pairs(t) do
        keys[i] = key
        i = i + 1
    end
    return keys
end

---@generic V
---@param t table<any, V>
---@return table<integer, V> values
function table.values(t)
    local values = {}
    local i = 1
    for _, v in pairs(t) do
        values[i] = v
        i = i + 1
    end
    return values
end

---@generic T: table
---@param t T
---@return T tableCopy
function table.copy(t)
    local newTable = {}
    for key, value in pairs(t) do
        newTable[key] = value
    end
    return newTable
end

---@generic T: table
---@param t T
---@return T tableCopy
function table.deepCopy(t)
    local newTable = {}
    local copyKey
    local copyValue
    for key, value in pairs(t) do
        if(type(key) == 'table') then
            copyKey = table.deepCopy(key)
        else copyKey = key end
        if(type(copyValue) == 'table') then
            copyValue = table.deepCopy(copyValue)
        else copyValue = value end
        newTable[copyKey] = copyValue
    end
    return newTable
end

---@generic T: table<string, function>
---@param t T
---@return T tableCopy
function table.copyFunctions(t)
    local copy = {}
    for key, value in pairs(t) do
        if type(value) == 'function' then copy[key] = value end
    end
    return copy
end

---@generic K, V
---@param t table<K, V>
---@param predicate fun(key: K, value: V) : boolean
---@return table<integer, { key: K, value: V }> resultList
function table.where(t, predicate)
    local result = {}
    for key, value in pairs(t) do
        if predicate(key, value) then
            result[#result+1] = { key = key, value = value }
        end
    end
    return result
end

---@generic K, V
---@param t table<K, V>
---@param predicate fun(key: K, value: V) : boolean
---@return V? result
function table.firstWhere(t, predicate)
    for key, value in pairs(t) do
        if predicate(key, value) then return value end
    end
    return nil
end

---@generic K, V
---@param t table<K, V>
---@param value V
---@return K?
function table.findKey(t, value)
    return table.findKeyWhere(t, function(k, v) return v == value end)
end

---@generic K, V
---@param t table<K, V>
---@param predicate fun(key: K, value: V) : boolean
---@return K?
function table.findKeyWhere(t, predicate)
    for key, value in pairs(t) do
        if predicate(key, value) then
            return key
        end
    end
    return nil
end