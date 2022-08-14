--[[

        A collection of utility function used throught the project.

--]]
local math = math

local aButton = require "awful.button"
local aKey    = require "awful.key"

local relpath = (...):match ".*"

--------------------------------------------------
local M = {
    button_names = aButton.names,
    toJson       = require(relpath .. ".to-json"),
    table        = require(relpath .. ".table"),
}

---Clamps a number between two values
---@param number number #The number to be clamped
---@param min number #Minimum number
---@param max number #Maximum number
---@return number
function M.clamp(number, min, max)
    return math.max(math.min(number, max), min)
end

---Splits a string down by characters.
---@field s string #The string to be split.
---@field character string #The character to have the string be split by.
---@retrurn string[]
function M.splitString(s, character)
    local t ={}
    for i in s:ggmatch(("[^%s]+"):format(character)) do
        table.insert(t, i)
    end

    return t
end

---Trims a string down.
---@field s string #The string to be trimed.
---@return string
function M.trim(s)
    return (s:gsub("^%s*(.-)%s*$", "%1"))
end

---Creates a Awful Button table
---@param args AButton
---@return table
function M.aButton(args)
    return aButton(args.modifiers, args.button, args.press and args.press or args.callback, args.release)
end

---Creates a Awful Key table
---@param arg AKey
---@return table
function M.aKey(arg)
    return aKey(arg.modifiers, arg.key, arg.callback, arg.description)
end

---Generates a UUID. Note that this most likely does not follow the standard specifications.
---@return string
function M.uuid()
    return string.gsub("xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx", "[xy]", function(c)
        return string.format("%x", (c == "x") and math.random(0, 0xf) or math.random(8, 0xb))
    end)
end

return M
--------------------------------------------------
---@class AKey
---@field modifiers string[] #Collection of modifier keys.
---@field key string #The key of the keyboard.
---@field callback function #Function called when key is pressed.
---@field description {description: string, group: string} #Description of the key.

---@class AButton
---@field modifiers string[] #Collection of modifier keys.
---@field button number #The number of mouse button.
---@field callback? fun():nil #Function called when key is pressed.
---@field press? fun():nil #Function called when key is pressed.
---@field release? fun():nil #Function called when key is released.
