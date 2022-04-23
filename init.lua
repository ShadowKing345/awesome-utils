--------------------------------------------------
--
--      A collection of utility function used throught the project.
--
--------------------------------------------------
local math  = math
local pairs = pairs
local type  = type

local aButton = require "awful.button"
local aKey    = require "awful.key"

local relpath = (...):match ".*"

--------------------------------------------------
local utils = {
    button_names = aButton.names,
    toJson = require(relpath .. ".to-json"),
}

---Clamps a number between two values
---@param number number #The number to be clamped
---@param min number #Minimum number
---@param max number #Maximum number
---@return number
function utils.clamp(number, min, max)
    return math.max(math.min(number, max), min)
end

---Creates a Awful Button table
---@param args AButton
---@return table
function utils.aButton(args)
    return aButton(args.modifiers, args.button, args.press and args.press or args.callback, args.release)
end

---Creates a Awful Key table
---@param arg AKey
---@return table
function utils.aKey(arg)
    return aKey(arg.modifiers, arg.key, arg.callback, arg.description)
end

return utils
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
