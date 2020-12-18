---------------------------------------------------------------------------------------------------
-- -= Camera =-
---------------------------------------------------------------------------------------------------
-- Setup
--local Object = require( TILED_LOADER_PATH .. "Object")
local Camera = {class = "Camera"}
Camera.__index = Camera

---------------------------------------------------------------------------------------------------

-- Returns a new Object
function Camera:new(Object,x, y, w, h)
    -- Public:
    local obj = setmetatable({}, Camera)
	obj.Object = Object
    obj.x = x or 0              -- X location on the map
    obj.y = y  or 0	-- Y location on the map
	obj.w = w or 0
	obj.h = h or 0
	obj.viewY = 0
	obj.viewX = 0
	
    -- Return our object
    return obj
end

---------------------------------------------------------------------------------------------------
-- Updates the draw information. Call this every time the object moves or changes size.
function Camera:update()
	if self.Object ~= nil then
		self.x = self.Object.x
		self.y = self.Object.y
		self.viewX = self.x - (self.w/2) - (self.Object.width/2) + (self.w/4)
		self.viewY = self.y - (self.h/2) - (self.Object.height/2) + (self.h/4)
		
	end
end



---------------------------------------------------------------------------------------------------
-- Returns the Object class
return Camera


--[[Copyright (c) 2011-2012 Casey Baxter

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

Except as contained in this notice, the name(s) of the above copyright holders
shall not be used in advertising or otherwise to promote the sale, use or
other dealings in this Software without prior written authorization.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.--]]
