---@diagnostic disable: missing-return, lowercase-global

turtle = {}

---@alias toolSide 'left' | 'right'

---Craft a recipe based on the turtle's inventory.
---The turtle's inventory should set up like a crafting grid. For instance, to
---craft sticks, slots 1 and 5 should contain planks. All other slots should be
---empty, including those outside the crafting "grid".
---
---**Parameters**
---* `limit?` : `number` = 64 The maximum number of crafting steps to run.
---
---**Returns**
---* `true` If crafting succeeds or `false` If crafting fails.
---* `string` A string describing why crafting failed.
---
---**Throws**
---* When limit is less than 1 or greater than 64.
---
---**Changes**
---* New in version 1.4 
---@param limit? number # The maximum number of crafting steps to run.
---@return boolean success # `true` If crafting succeeds or `false` If crafting fails.
---@return string raison # A string describing why crafting failed.
function turtle.craft(limit) end

---Move the turtle forward one block.
---
---**Returns**
---* `boolean` Whether the turtle could successfully move.
---* `string?` The reason the turtle could not move.
---@return boolean success # Whether the turtle could successfully move.
---@return string? raison # The reason the turtle could not move.
function turtle.forward() return true end


---Move the turtle backwards one block.
---
---**Returns**
---* `boolean` Whether the turtle could successfully move.
---* `string?` The reason the turtle could not move.
---@return boolean success # Whether the turtle could successfully move.
---@return string? raison # The reason the turtle could not move.
function turtle.back() return true end


---Move the turtle up one block.
---
---**Returns**
---* `boolean` Whether the turtle could successfully move.
---* `string?` The reason the turtle could not move.
---@return boolean success # Whether the turtle could successfully move.
---@return string? raison # The reason the turtle could not move.
function turtle.up() return true end


---Move the turtle down one block.
---
---**Returns**
---* `boolean` Whether the turtle could successfully move.
---* `string?` The reason the turtle could not move.
---@return boolean success # Whether the turtle could successfully move.
---@return string? raison # The reason the turtle could not move.
function turtle.down() return true end


---Rotate the turtle 90 degress to the left.
---
---**Returns**
---* `boolean` Whether the turtle could successfully turn.
---* `string?` The reason the turtle could not turn.
---@return boolean success # Whether the turtle could successfully turn.
---@return string? raison # The reason the turtle could not turn.
function turtle.turnLeft() return true end


---Rotate the turtle 90 degress to the right.
---
---**Returns**
---* `boolean` Whether the turtle could successfully turn.
---* `string?` The reason the turtle could not turn.
---@return boolean success # Whether the turtle could successfully turn.
---@return string? raison # The reason the turtle could not turn.
function turtle.turnRight() return true end


---Attempt to break the block in front of the turtle.
---This requires a turtle tool capable of breaking the block. Diamond pickaxes
---(mining turtles) can break any vanilla block, but other tools (such as axes) are more limited.
---
---**Parameters**
---* `side?` `string` The specific tool to use. Should be "left" or "right".
---
---**Returns**
---* `boolean` Whether a block was broken.
---* `string?` The reason no block was broken.
---
---**Changes**
---* Changed in version 1.6: Added optional side argument.
---@param side? toolSide # The specific tool to use.
---@return boolean success # Whether a block was broken.
---@return string? raison # The reason no block was broken.
function turtle.dig(side) end


---Attempt to break the block above the turtle. See `dig` for full details.
---
---**Parameters**
---* `side?` `string` The specific tool to use.
---
---**Returns**
---* `boolean` Whether a block was broken.
---* `string?` The reason no block was broken.
---
---**Changes**
---* Changed in version 1.6: Added optional side argument.
---@param side? toolSide # The specific tool to use.
---@return boolean success # Whether a block was broken.
---@return string? raison # The reason no block was broken.
function turtle.digUp(side) end


---Attempt to break the block below the turtle. See `dig` for full details.
---
---**Parameters**
---* `side?` `string` The specific tool to use.
---
---**Returns**
---* `boolean` Whether a block was broken.
---* `string?` The reason no block was broken.
---
---**Changes**
---* Changed in version 1.6: Added optional side argument.
---@param side? toolSide # The specific tool to use.
---@return boolean success # Whether a block was broken.
---@return string? raison # The reason no block was broken.
function turtle.digDown(side) end


---Place a block or item into the world in front of the turtle.
---"Placing" an item allows it to interact with blocks and entities in front of the turtle. 
---
---For instance, buckets
---can pick up and place down fluids, and wheat can be used to breed cows. However, you cannot use `place` to
--- perform arbitrary block interactions, such as clicking buttons or flipping levers.
---
---**Parameters**
---* `text?` `string` When placing a sign, set its contents to this text.
---
---**Returns**
---* `boolean` Whether the block could be placed.
---* `string?` The reason the block was not placed.
---
---**Changes**
---* New in version 1.4 
---@param text? string # When placing a sign, set its contents to this text.
---@return boolean success # Whether the block could be placed.
---@return string? raison # The reason the block was not placed.
function turtle.place(text) end


---Place a block or item into the world above the turtle.
---
---**Parameters**
---* `text?` `string` When placing a sign, set its contents to this text.
---
---**Returns**
---* `boolean` Whether the block could be placed.
---* `string?` The reason the block was not placed.
---
---**See also**
---* `place` For more information about placing items.
---
---**Changes**
---* New in version 1.4
---@see turtle.place
---@param text? string # When placing a sign, set its contents to this text.
---@return boolean success # Whether the block could be placed.
---@return string? raison # The reason the block was not placed.
function turtle.placeUp(text) end


---Place a block or item into the world below the turtle.
---
---**Parameters**
---* `text?` `string` When placing a sign, set its contents to this text.
---
---**Returns**
---* `boolean` Whether the block could be placed.
---* `string?` The reason the block was not placed.
---
---**See also**
---* `place` For more information about placing items.
---
---**Changes**
---* New in version 1.4 
---@see turtle.place
---@param text? string # When placing a sign, set its contents to this text.
---@return boolean success # Whether the block could be placed.
---@return string? raison # The reason the block was not placed.
function turtle.placeDown(text) end


---Drop the currently selected stack into the inventory in front of the turtle, or as an item into the world if
---there is no inventory.
---
---**Parameters**
---* `count?` `number` The number of items to drop. If not given, the entire stack will be dropped.
---
---**Returns**
---* `boolean` Whether items were dropped.
---* `string?` The reason the no items were dropped.
---
---**Throws**
---* If dropping an invalid number of items.
---
---
---**See also**
---* `select` 
---
---**Changes**
---* New in version 1.31
---@see turtle.select
---@param count? number # The number of items to drop. If not given, the entire stack will be dropped.
---@return boolean success # Whether items were dropped.
---@return string? raison # The reason the no items were dropped.
function turtle.drop(count) end


---Drop the currently selected stack into the inventory above the turtle, or as an item into the world if there is
---no inventory.
---
---**Parameters**
---* `count?` `number` The number of items to drop. If not given, the entire stack will be dropped.
---
---**Returns**
---* `boolean` Whether items were dropped.
---* `string?` The reason the no items were dropped.
---
---**Throws**
---* If dropping an invalid number of items.
---
---**See also**
---* `select` 
---
---**Changes**
---* New in version 1.4
---@see turtle.select
---@param count? number # The number of items to drop. If not given, the entire stack will be dropped.
---@return boolean success # Whether items were dropped.
---@return string? raison # The reason the no items were dropped.
function turtle.dropUp(count) end


---Drop the currently selected stack into the inventory in front of the turtle, or as an item into the world if
---there is no inventory.
---
---**Parameters**
---* `count?` `number` The number of items to drop. If not given, the entire stack will be dropped.
---
---**Returns**
---* `boolean` Whether items were dropped.
---* `string?` The reason the no items were dropped.
---
---**Throws**
---* If dropping an invalid number of items.
---
---
---**See also**
---* `select` 
---
---**Changes**
---* New in version 1.4 
---@see turtle.select
---@param count? number # The number of items to drop. If not given, the entire stack will be dropped.
---@return boolean success # Whether items were dropped.
---@return string? raison # The reason the no items were dropped.
function turtle.dropDown(count) end


---Change the currently selected slot.
---The selected slot is determines what slot actions like `drop` or `getItemCount` act on.
---
---**Parameters**
---* `slot` `number` The slot to select.
---
---**Returns**
---* `true` When the slot has been selected.
---
---**Throws**
---* If the slot is out of range.
---
---**See also**
---* `getSelectedSlot` 
---@see turtle.getSelectedSlot
---@param slot number # The slot to select.
---@return boolean success # `true` when the slot has been selected
function turtle.select(slot) end


---Get the number of items in the given slot.
---
---**Parameters**
---* `slot?` `number` The slot we wish to check. Defaults to the `selected slot`.
---
---**Returns**
---* `number` The number of items in this slot.
---
---**Throws**
---* If the slot is out of range.
---
---@param slot? number # The slot we wish to check. Defaults to the `selected slot`.
---@return number itemsCount # The number of items in this slot.
function turtle.getItemCount(slot) end


---Get the remaining number of items which may be stored in this stack.
---For instance, if a slot contains 13 blocks of dirt, it has room for another 51.
---
---**Parameters**
---* `slot?` `number` The slot we wish to check. Defaults to the `selected slot`.
---
---**Returns**
---* `number` The space left in in this slot.
---
---**Throws**
---* If the slot is out of range.
---
---@param slot? number # The slot we wish to check. Defaults to the `selected slot`.
---@return number spaceItems # The space left in in this slot.
function turtle.getItemSpace(slot) end


---Check if there is a solid block in front of the turtle. In this case, solid refers to any non-air or liquid
---block.
---
---**Returns**
---* `boolean` If there is a solid block in front.
---@return boolean blockDetected # If there is a solid block in front.
function turtle.detect() end


---Check if there is a solid block above the turtle. In this case, solid refers to any non-air or liquid block.
---
---**Returns**
---* `boolean` If there is a solid block in front.
---@return boolean blockDetected # If there is a solid block in front.
function turtle.detectUp() end


---Check if there is a solid block below the turtle. In this case, solid refers to any non-air or liquid block.
---
---**Returns**
---* `boolean` If there is a solid block in front.
---@return boolean blockDetected # If there is a solid block in front.
function turtle.detectDown() end


---Check if the block in front of the turtle is equal to the item in the currently selected slot.
---
---**Returns**
---* `boolean` If the block and item are equal.
---
---**Changes**
---* New in version 1.31 
---@return boolean itemsEquals # If the block and item are equal.
function turtle.compare() end


---Check if the block above the turtle is equal to the item in the currently selected slot.
---
---**Returns**
---* `boolean` If the block and item are equal.
---
---**Changes**
---* New in version 1.31 
---@return boolean itemsEquals # If the block and item are equal.
function turtle.compareUp() end


---Check if the block below the turtle is equal to the item in the currently selected slot.
---
---**Returns**
---* `boolean` If the block and item are equal.
---
---**Changes**
---* New in version 1.31 
---@return boolean itemsEquals # If the block and item are equal.
function turtle.compareDown() end


---Attack the entity in front of the turtle.
---
---**Parameters**
---* `side?` `string` The specific tool to use.
---
---**Returns**
---* `boolean` Whether an entity was attacked.
---* `string?` The reason nothing was attacked.
---
---**Changes**
---* New in version 1.4 
---* Changed in version 1.6: Added optional side argument.
---@param side? toolSide # The specific tool to use.
---@return boolean success # Whether an entity was attacked.
---@return string? raison # The reason nothing was attacked.
function turtle.attack(side) end


---Attack the entity above the turtle.
---
---**Parameters**
---* `side?` `string` The specific tool to use.
---
---**Returns**
---* `boolean` Whether an entity was attacked.
---* `string?` The reason nothing was attacked.
---
---**Changes**
---* New in version 1.4 
---* Changed in version 1.6: Added optional side argument.
---@param side? toolSide # The specific tool to use.
---@return boolean success # Whether an entity was attacked.
---@return string? raison # The reason nothing was attacked.
function turtle.attackUp(side) end


---Attack the entity below the turtle.
---
---**Parameters**
---* `side?` `string` The specific tool to use.
---
---**Returns**
---* `boolean` Whether an entity was attacked.
---* `string?` The reason nothing was attacked.
---
---**Changes**
---* New in version 1.4 
---* Changed in version 1.6: Added optional side argument.
---@param side? toolSide # The specific tool to use.
---@return boolean success # Whether an entity was attacked.
---@return string? raison # The reason nothing was attacked.
function turtle.attackDown(side) end


---Suck an item from the inventory in front of the turtle, or from an item floating in the world.
---This will pull items into the first acceptable slot, starting at the `currently selected` one.
---
---**Parameters**
---* `count?` `number` The number of items to suck. If not given, up to a stack of items will be picked up.
---
---**Returns**
---* `boolean` Whether items were picked up.
---* `string?` The reason the no items were picked up.
---
---**Throws**
---* If given an invalid number of items.
---
---
---**Changes**
---* New in version 1.4 
---* Changed in version 1.6: Added an optional limit argument.
---@param count? number # The number of items to suck. If not given, up to a stack of items will be picked up.
---@return boolean success # Whether items were picked up.
---@return string? raison # The reason the no items were picked up.
function turtle.suck(count) end


---Suck an item from the inventory above the turtle, or from an item floating in the world.
---
---**Parameters**
---* `count?` `number` The number of items to suck. If not given, up to a stack of items will be picked up.
---
---**Returns**
---* `boolean` Whether items were picked up.
---* `string?` The reason the no items were picked up.
---
---**Throws**
---* If given an invalid number of items.
---
---
---**Changes**
---* New in version 1.4 
---* Changed in version 1.6: Added an optional limit argument.
---@param count? number # The number of items to suck. If not given, up to a stack of items will be picked up.
---@return boolean success # Whether items were picked up.
---@return string? raison # The reason the no items were picked up.
function turtle.suckUp(count) end


---Suck an item from the inventory below the turtle, or from an item floating in the world.
---
---**Parameters**
---* `count?` `number` The number of items to suck. If not given, up to a stack of items will be picked up.
---
---**Returns**
---* `boolean` Whether items were picked up.
---* `string?` The reason the no items were picked up.
---
---**Throws**
---* If given an invalid number of items.
---
---**Changes**
---* New in version 1.4 
---* Changed in version 1.6: Added an optional limit argument.
---@param count? number # The number of items to suck. If not given, up to a stack of items will be picked up.
---@return boolean success # Whether items were picked up.
---@return string? raison # The reason the no items were picked up.
function turtle.suckDown(count) end


---Get the maximum amount of fuel this turtle currently holds.
---
---**Returns**
---* `number` The current amount of fuel a turtle this turtle has or
---* `"unlimited"` If turtles do not consume fuel when moving.
---
---**See also**
---* `getFuelLimit` 
---* `refuel` 
---
---**Changes**
---* New in version 1.4 
---@see turtle.getFuelLimit
---@see turtle.refuel
---@return number | "unlimited" fuelLevel # The current amount of fuel a turtle this turtle has or `"unlimited"` If turtles do not consume fuel when moving.
function turtle.getFuelLevel() end


---Refuel this turtle.
---While most actions a turtle can perform (such as digging or placing blocks) are free, moving consumes fuel from
---the turtle's internal buffer. If a turtle has no fuel, it will not move.
---`refuel` refuels the turtle, consuming fuel items (such as coal or lava buckets) from the currently
---selected slot and converting them into energy. This finishes once the turtle is fully refuelled or all items have
---been consumed.
---
---**Parameters**
---* `count?` `number` The maximum number of items to consume. One can pass 0 to check if an item is combustable or not.
---
---**Returns**
---* `true` If the turtle was refuelled or
---* `false` If the turtle was not refuelled.
---* `string?` The reason the turtle was not refuelled
---
---**Throws**
---* If the refuel count is out of range.
---
---**Usage**
---* Refuel a turtle from the currently selected slot.
---Run ᐅ
---```lua
---local level = turtle.getFuelLevel()
---if new_level == "unlimited" then error("Turtle does not need fuel", 0) end
---
---local ok, err = turtle.refuel()
---if ok then
---  local new_level = turtle.getFuelLevel()
---  print(("Refuelled %d, current level is %d"):format(new_level - level, new_level))
---else
---  printError(err)
---end
---```
---* Check if the current item is a valid fuel source.
---```lua
---local is_fuel, reason = turtle.refuel(0)
---if not is_fuel then printError(reason) end
---```
---
---**See also**
---* `getFuelLevel` 
---* `getFuelLimit` 
---
---**Changes**
---* New in version 1.4 
---@see turtle.getFuelLevel
---@see turtle.getFuelLimit
---@param count? number # to check if an item is combustable or not.
---@return boolean success # If the turtle was refuelled or `false` If the turtle was not refuelled.
---@return string raison # The reason the turtle was not refuelled
function turtle.refuel(count) end


---Compare the item in the currently selected slot to the item in another slot.
---
---**Parameters**
---* `slot` `number` The slot to compare to.
---
---**Returns**
---* `boolean` If the two items are equal.
---
---**Throws**
---* If the slot is out of range.
---
---
---**Changes**
---* New in version 1.4 
---@param slot number # The slot to compare to.
---@return boolean success # If the two items are equal.
function turtle.compareTo(slot) end


---Move an item from the selected slot to another one.
---
---**Parameters**
---* `slot` `number` The slot to move this item to.* `count?` `number` The maximum number of items to move.
---
---**Returns**
---* `boolean` If some items were successfully moved.
---
---**Throws**
---* If the slot is out of range.
---* If the number of items is out of range.

---
---**Changes**
---* New in version 1.45 
---@param slot number # The slot to move this item to.
---@param count? number # The maximum number of items to move.
---@return boolean success # If some items were successfully moved.
function turtle.transferTo(slot, count) end


---Get the currently selected slot.
---
---**Returns**
---* `number` The current slot.
---
---**See also**
---* `select` 
---
---**Changes**
---* New in version 1.6 
---@see turtle.select
---@return number slotNumber # The current slot.
function turtle.getSelectedSlot() end


---Get the maximum amount of fuel this turtle can hold.
---By default, normal turtles have a limit of 20,000 and advanced turtles of 100,000.
---
---**Returns**
---* `number` The maximum amount of fuel a turtle can hold or
---* `"unlimited"` If turtles do not consume fuel when moving.
---
---**See also**
---* `getFuelLevel` 
---* `refuel` 
---
---**Changes**
---* New in version 1.6 
---@see turtle.getFuelLevel
---@see turtle.refuel
---@return number | "unlimited" fuelLimit # The maximum amount of fuel a turtle can hold or `"unlimited"`
function turtle.getFuelLimit() end


---Equip (or unequip) an item on the left side of this turtle.
---This finds the item in the currently selected slot and attempts to equip it to the left side of the turtle. The
---previous upgrade is removed and placed into the turtle's inventory. If there is no item in the slot, the previous
---upgrade is removed, but no new one is equipped.
---
---**Returns**
---* `true` If the item was equipped or
---* `false` If we could not equip the item.
---* `string?` The reason equipping this item failed.
---
---**See also**
---* `equipRight` 
---
---**Changes**
---* New in version 1.6 
---@see turtle.equipRight
---@return boolean success # `true` If the item was equipped or `false` If we could not equip the item.
---@return string reason # `string?` The reason equipping this item failed.
function turtle.equipLeft() end


---Equip (or unequip) an item on the right side of this turtle.
---This finds the item in the currently selected slot and attempts to equip it to the right side of the turtle. The
---previous upgrade is removed and placed into the turtle's inventory. If there is no item in the slot, the previous
---upgrade is removed, but no new one is equipped.
---
---**Returns**
---* `true` If the item was equipped.
---* `false` If we could not equip the item.
---* `string?` The reason equipping this item failed.
---
---**See also**
---* `equipLeft` 
---
---**Changes**
---* New in version 1.6 
---@see turtle.equipLeft
---@return boolean success `true` If the item was equipped or `false` If we could not equip the item.
---@return string reason # The reason equipping this item failed.
function turtle.equipRight() end


---Get information about the block in front of the turtle.
---
---**Returns**
---* `boolean` Whether there is a block in front of the turtle.
---* `table | string` Information about the block in front, or a message explaining that there is no block.
---
---**Usage**
---```lua
---* Run ᐅlocal has_block, data = turtle.inspect()
---if has_block then
---  print(textutils.serialise(data))
---  --{
---  --  name = "minecraft:oak_log",
---  --  state = { axis = "x" },
---  --  tags = { ["minecraft:logs"] = true, ... },
---  --}
---else
---  print("No block in front of the turtle")
---end
---```
---
---**Changes**
---* New in version 1.64 * Changed in version 1.76: Added block state to return value.
---@return boolean success # Whether there is a block in front of the turtle.
---@return table | string data # Information about the block in front, or a message explaining that there is no block.
function turtle.inspect() end


---Get information about the block above the turtle.
---
---**Returns**
---* `boolean` Whether there is a block above the turtle.
---* `table | string` Information about the above below, or a message explaining that there is no block.
---
---**Changes**
---* New in version 1.64 
---@return boolean success # Whether there is a block above the turtle.
---@return table | string data # Information about the above below, or a message explaining that there is no block.
function turtle.inspectUp() end


---Get information about the block below the turtle.
---
---**Returns**
---* `boolean` Whether there is a block below the turtle.
---* `table | string` Information about the block below, or a message explaining that there is no block.
---
---**Changes**
---* New in version 1.64 
---@return boolean success # Whether there is a block below the turtle.
---@return table | string data # Information about the block below, or a message explaining that there is no block.
function turtle.inspectDown() end


---Get detailed information about the items in the given slot.
---
---**Parameters**
---* `slot?` `number` The slot to get information about. Defaults to the `selected slot`.
---* `detailed?` `boolean` Whether to include "detailed" information. When `true` the method will contain much
---more information about the item at the cost of taking longer to run.
---
---**Returns**
---* `table?` Information about the given slot, or `nil` if it is empty.
---
---**Throws**
---* If the slot is out of range.
---
---**Usage**
---* Print the current slot, assuming it contains 13 dirt.
---Run ᐅ 
---```lua
--- print(textutils.serialise(turtle.getItemDetail()))
--- -- => {
--- --  name = "minecraft:dirt",
--- --  count = 13,
--- -- }
---```
---
---**See also**
---* `inventory.getItemDetail` Describes the information returned by a detailed query.
---
---**Changes**
---* New in version 1.64 
---@param slot? number # The slot to get information about. Defaults to the `selected slot`.
---@param detailed? boolean # the method will contain much more information about the item at the cost of taking longer to run.
---@return table? data # Information about the given slot, or `nil` if it is empty.
function turtle.getItemDetail(slot, detailed) end


