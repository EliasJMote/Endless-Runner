-----------------------------------------------------------------------------------------
--
-- title_screen.lua
--
-----------------------------------------------------------------------------------------

-- load global variables
local g = gameGlobals

-- include Corona's "composer" library
local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "widget" library
local widget = require "widget"

local function onPlayBtnRelease()
	-- load game screen
	composer.gotoScene( "game" )

	return true
end

local function onOptionsBtnRelease()
	-- load game screen
	composer.gotoScene( "options" )

	return true
end

function scene:create( event )
	local sceneGroup = self.view

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	titleText = display.newText( "Chain Knight", display.actualContentWidth / 2 - 44,
	 100, native.systemFont, 16 )

	playBtn = widget.newButton{
		label="Play Game",
		labelColor = { default={255}, over={128} },
		width=90, height=40,
		x = display.actualContentWidth / 2 - 44, y = 210,
		shape = "rect",
		fillColor = { default={ 1, 0.2, 0.5, 0.7 }, over={ 1, 0.2, 0.5, 1 } },
		onRelease = onPlayBtnRelease	-- event listener function
	}

	optionsBtn = widget.newButton{
		label="Options",
		labelColor = { default={255}, over={128} },
		width=90, height=40,
		x = display.actualContentWidth / 2 - 44, y = 270,
		shape = "rect",
		fillColor = { default={ 1, 0.2, 0.5, 0.7 }, over={ 1, 0.2, 0.5, 1 } },
		onRelease = onOptionsBtnRelease	-- event listener function
	}

	-- all display objects must be inserted into group
	sceneGroup:insert(playBtn)
	sceneGroup:insert(optionsBtn)
	sceneGroup:insert(titleText)
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end	
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
	
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene

