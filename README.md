#Advanced Tiled Loader
========
Advanced Tiled Loader (ATL) loads and renders [Tiled](http://www.mapeditor.org/) maps inside of the [Löve2D](http://love2d.org) game framework.

ATL is no longer being actively developed. Please consider using an alternative library such as [STI](https://github.com/karai17/Simple-Tiled-Implementation).

Supported features include:
* Multiple Layers
* All object types (regular, polygon, and tile)
* Properties
* Transparent colors
* Margins and spacing
* External tilesets
* zlib/gzip compression
* Isometric maps
* Flipped and rotated tiles
* Saving loaded maps

Example files can be found at https://github.com/Kadoba/Advanced-Tiled-Loader-Examples

----------------------------------------------------------------------------------------------------
# TRCCompSci
DONE:
* Removed commands no longer supported.
* You can give an object a texture instead of just a black rectangle.
* Added a camera class and object to map.
* You can provide an object for the camera to follow.
* Map centered on camera object.
* I will add some examples to show moving objects within the map.

----------------------------------------------------------------------------------------------------
# Using the Camera

```lua
-- Find the player object in your map, give it a texture and set the camera to this object
-- The camera update is to update the x,y and viewport calculations
-- This could be in love.load() 

for _, layer in pairs(map.layers) do
    if layer.class == "ObjectLayer" then
        for _, obj in pairs(layer.objects) do
	    if obj.name == "Player" then 
	        print(obj.name)
		obj.texture = image
		map.camera.Object=obj
		map.camera:update()
	    end
	end
   end
end

-- you will then need to call map.draw() as normal
```

# Moving the object connected to the camera
```lua
-- this can be in the love.update().
-- difx and dify are used to set the movement for this update.
-- change will be true if any movement was made.

	local difx = 0
	local dify = 0
	change = false
	
	if love.keyboard.isDown("up") then 
		dify=100*dt 
		change = true
		end
	if love.keyboard.isDown("down") then 
		dify = -100*dt
		change = true		
		end
	if love.keyboard.isDown("left") then 
		difx= 100*dt 
		change = true
		end
	if love.keyboard.isDown("right") then 
		difx= -100*dt 
		change = true		
		end
	
	player.x = player.x-difx -- change the x position of the object in the map
	player.y = player.y-dify -- change the y position of the object in the map
	
	if change==true then
		map:forceRedraw()
		end

-- if a change has been made to the player objects position
-- map:forceRedraw() will update the camera and viewport.
```

# Quick Example
  
```lua     

-- Gets the loader
loader = require("Advanced-Tiled-Loader/loader.lua")

 -- Path to the tmx files. The file structure must be similar to how they are saved in Tiled
loader.path = "maps/"

 -- Loads the map file and returns it
map = loader.load("desert.tmx")

-- Draws the map
map:draw()

-- Limits the drawing range of the map. Important for performance
map:setDrawRange(0,0,love.graphics.getWidth(), love.graphics.getHeight())

-- Automatically sets the drawing range to the size of the screen.
map:autoDrawRange(tx, ty, scale, padding)

-- Accessing individual layers
map.layers["layer name"]

-- A shortcut for accessing specific layers
map("layer name")

-- Finding a specific tile
map.layers["layer name"]:get(5,5)

-- A shortcut for finding a specific tile
map("layer name")(5,5)

-- Iterating over all tiles in a layer
for x, y, tile in map("layer name"):iterate() do
   print( string.format("Tile at (%d,%d) has an id of %d", x, y, tile.id) )
end

-- Iterating over all objects in a layer
for i, obj in pairs( map("object layer").objects ) do
	print( "Hi, my name is " .. obj.name )
end

-- Find all objects of a specific type in all layers
for _, layer in pairs(map.layers) do
   if layer.class == "ObjectLayer" then
		for _, obj in pairs(player.objects) do
			if obj.type == "enemy" then print(obj.name) end
		end
   end
end

-- draw the tile with the id 4 at (100,100)
map.tiles[4]:draw(100,100)

-- Access the tile's properties set by Tiled
map.tiles[4].properties

-- Turns off drawing of non-tiled objects.
map.drawObjects = false

```
----------------------------------------------------------------------------------------------------
