------------------------------------------------------

--TODO: Figure out how to wrap on selection instead of entire canvas. Future Feature
--TODO: Add Support to all toolbars for screen size scaling. Future Feature
--TODO: Set up toggle-able help/info sections. So all of the help isn't shown at once. Bit of a text wall there.
------------------------------------------------------
----------------------------------------------------------------------
--BG Auto-Scroll Toolbar powered by CarbsCode
--©2019 - 2020 CarbsCode Please don't Claim this script as your own work <3
--Version 1.1.2 (Released)
----------------------------------------------------------------------
if app.apiVersion ==  nil or app.apiVersion  < 12 then
	local user_version = tostring(app.version)
	local user_API = tostring(app.apiVersion)
	local required_version = "1.2.22 (Script API 12)"
	app.alert{
		title="Aseprite Needs An Update To Use This Toolbar",
		text={"Aseprite Version " ..required_version.. " or newer is required to use this toolbar.","","Your Aseprite version is: " ..user_version.." (Script API " .. user_API.. ")"}
	}
	do return end
end

--SET UP GLOBAL VARIABLES
SBGTScreen_Scale = app.preferences.general.screen_scale
SBGTUI_Scale = app.preferences.general.ui_scale
SBGTTheme = app.preferences.theme.selected
--BGST UI SCALE---------
SBGTHelp_Width = 430 * SBGTUI_Scale
SBGTHelp_Height = 455 * SBGTUI_Scale
SBGTThx_Width = 465 * SBGTUI_Scale
SBGThx_Height = 295 * SBGTUI_Scale
SBGTdlg_X = 120 * SBGTUI_Scale
SBGTdlg_Y = 95 * SBGTUI_Scale
SBGTdlg_Width = 128 * SBGTUI_Scale
SBGTdlg_Height = 202 * SBGTUI_Scale
SBGTdlg_Offset = 5 * SBGTUI_Scale -- OFFSET
local isThemeDebugMode = false
-----------------------

  function setSGBTUIScaleVars()
    --MORT MORT'S THEME 
    if SBGTTheme == "Dark Mort HD" then
      SBGTHelp_Width = 560 * SBGTUI_Scale
      SBGTHelp_Height = 665 * SBGTUI_Scale
      SBGTThx_Width = 610 * SBGTUI_Scale
      SBGTThx_Height = 385 * SBGTUI_Scale
      SBGTdlg_X = 130 * SBGTUI_Scale
      SBGTdlg_Y = 125 * SBGTUI_Scale
      SBGTdlg_Width = 175 * SBGTUI_Scale
      SBGTdlg_Height = 290 * SBGTUI_Scale
      SBGTdlg_Offset = 5 * SBGTUI_Scale
    end
    --MINIMAL DARK HD THEME
    if SBGTTheme == "Minimal Dark HD" then
      SBGTHelp_Width = 560 * SBGTUI_Scale
      SBGTHelp_Height = 745 * SBGTUI_Scale
      SBGTThx_Width = 590 * SBGTUI_Scale
      SBGTThx_Height = 435 * SBGTUI_Scale
      SBGTdlg_X = 130 * SBGTUI_Scale
      SBGTdlg_Y = 135 * SBGTUI_Scale
      SBGTdlg_Width = 170 * SBGTUI_Scale
      SBGTdlg_Height = 321 * SBGTUI_Scale
      SBGTdlg_Offset = 5 * SBGTUI_Scale
    end
  end

  setSGBTUIScaleVars()





  function shSBGHelp(xClicked)
  	if infoDLG.bounds.x and infoDLG.bounds.y == 0 then
  		thankyouDLG:close()
  		infoDLG:show{wait=false}
  		infoDLG.bounds = Rectangle(settingsDLG.bounds.x+(settingsDLG.bounds.width+SBGTdlg_Offset), settingsDLG.bounds.y-45, SBGTHelp_Width, SBGTHelp_Height)
  	elseif xClicked == true then
        settingsDLG:modify{id="showHideHelp",selected=false}
        infoDLG.bounds = Rectangle(0, 0, SBGTHelp_Width, (settingsDLG.bounds.height) +SBGTdlg_Offset)
        app.refresh()
  	else
      infoDLG:close()
  		infoDLG.bounds = Rectangle(0, 0, SBGTHelp_Width, (settingsDLG.bounds.height) +SBGTdlg_Offset)
  		app.refresh()

    end
  end

  function shSBGSup()
  		infoDLG:close()
  		settingsDLG:modify{id="showHideHelp",selected=false}
  		app.refresh()
  		thankyouDLG:show{wait=false}
  		thankyouDLG.bounds = Rectangle(settingsDLG.bounds.x+(settingsDLG.bounds.width+SBGTdlg_Offset), settingsDLG.bounds.y, SBGTThx_Width, SBGTThx_Height)
  end

function toolbarSBGClosed()
	infoDLG:close()
	thankyouDLG:close()
end


function showHideAllSBG()
	local hide_state =  not settingsDLG.data.showHideAll
settingsDLG
	:modify{id="sep00",visible = hide_state}
	:modify{id="inputFrames",visible = hide_state}
	:modify{id="sep0",visible = hide_state}
	:modify{id="inputSpeed",visible = hide_state}
	:modify{id="sep1",visible = hide_state}
	:modify{id="createUL",visible = hide_state}
	:modify{id="createU",visible = hide_state}
	:modify{id="createUR",visible = hide_state}
	:modify{id="createL",visible = hide_state}
	:modify{id="undo",visible = hide_state}
	:modify{id="createR",visible = hide_state}
	:modify{id="createDL",visible = hide_state}
	:modify{id="createD",visible = hide_state}
	:modify{id="createDR",visible = hide_state}
	:modify{id="fillCel",visible = hide_state}
end

infoDLG = Dialog{title="Help & Info",onclose=function() shSBGHelp(true)end}
	infoDLG
  	:separator{text=""}
  	:newrow()
  	:label{text="This toolbar quickly creates scrolling backgrounds with support for multiple speeds / parallax."}
  	:newrow()
  	:label{text="For a more in depth explanation look for the how to video or examples on the itch.io page."}
  	:newrow()
  	:button{
  		text="Click Here To View Carbs Thank You And View Extra Information / Links",
  		onclick=function() shSBGSup() end}
  	:separator{text=""}
  	:newrow()
  	:label{text="Start by selecting a single cel which you would like to insert the animation too."}
  	:newrow()
  	:label{text=""}
  	:newrow()
  	:label{text="Insert Animation Frames - "}
  	:newrow()
  	:label{text="    Input the total number of frames you would like your cel to animate over."}
  	:newrow()
  	:label{text="    This will be the number of frames you will be inserting in to the document."}
  	:newrow()
  	:label{text="    For example inserting 30 using cel 1 will animate selected cel over 30 frames."}
  	:newrow()
  	:label{text=""}
  	:newrow()
  	:label{text="Animation Speed (Loops) - "}
  	:newrow()
  	:label{text="    Input the number of times your layer will wrap around the screen in your animations frames."}
  	:newrow()
  	:label{text="    The more loops you have the faster the selected layer will animate."}
  	:newrow()
  	:label{text="    This will be especially useful when animating different layers at different speeds."}
  	:newrow()
  	:label{text=""}
  	:newrow()
  	:label{text="    As an example if you want your selected layer to move twice as fast as the total"}
  	:newrow()
  	:label{text="    animation frames you would set this number to 2. This would loop the animation"}
  	:newrow()
  	:label{text="    twice over the 30 frames we set earlier."}
  	:newrow()
  	:label{text=""}
  	:newrow()
  	:label{text="    Note: I Recommend at least 60 frames when offsetting multiple layers speeds."}
  	:newrow()
  	:label{text="    This will ensure there is enough space for it to loop properly and look good :D"}
  	:newrow()
  	:label{text="    Experiment with these settings to find the best settings fit for your animations."}
  	:newrow()
  	:label{text=""}
  	:newrow()
  	:label{text="Create Scroll Animations - "}
  	:newrow()
  	:label{text="    Select which direction you would like your animation to scroll."}
  	:newrow()
  	:label{text="    U/Up, D/Down, L/Left, R/Right, [undo] This will undo last animation (ctrl + z)"}
  	:newrow()
  	:label{text="    The middle [undo] button is just a shortcut instead of pressing hotkeys."}
  	:newrow()
  	:label{text=""}
  	:newrow()
  	:newrow()
  	:label{text="Fill Cels - "}
  	:newrow()
  	:label{text="    This option will use your currently selected frame and duplicate it over set frames."}
  	:newrow()
  	:label{text="    Useful if you have a background color you would like to have behind all your frames."}
  	:newrow()
  	:label{text="    Not having them linked means you can edit each frame if needed."}
  	:newrow()
  	:label{text="    To link cels, select cels right click and hit link cels. The same image will be used in each cel."}
  	:newrow()
	:separator{text=""}
	:newrow()
	:label{text="BG Auto-Scroll Version 1.1.2 | CarbsCode.itch.io | © CarbsCode 2019 - 2020 All Rights Reserved"}


settingsDLG = Dialog{title="BG Auto-Scroll v1.1.2",onclose=function() toolbarSBGClosed()end}

settingsDLG
	:check{
		id="showHideAll",
		text="Minimize",
		onclick=function() showHideAllSBG()end}
	:check{
		id="showHideHelp",
		text="Info",
		onclick=function() shSBGHelp(false)end}
	:newrow()
	:separator{
		id="sep00",
		text="Insert Animation Frames"
	}
	:number{
		id="inputFrames",
		text="30",
		decimals=0
	}
	:separator{
		id="sep0",
		text="Animation Speed (Loops)"
	}
	:newrow()
		:number{
		id="inputSpeed",
		text="1",
		decimals=0
	}
	:separator{
		id="sep1",
		text="Create Scroll Animations"
	}
	:button{
		id="createUL",
		text="UL",
		onclick=function() createAnimationTrans("up","left")end}
	:button{
		id="createU",
		text="U",
		onclick=function() createAnimationTrans("up")end}
	:button{
		id="createUR",
		text="UR",
		onclick=function() createAnimationTrans("up","right")end}
	:newrow()
	:button{
		id="createL",
		text="L",
		onclick=function() createAnimationTrans("left")end}
	:button{
		id="undo",
		text="[undo]",
		onclick=function() app.command.undo() end}
	:button{
		id="createR",
		text="R",
		onclick=function() createAnimationTrans("right")end}
	:newrow()
	:button{
		id="createDL",
		text="DL",
		onclick=function() createAnimationTrans("down","left")end}
	:button{
		id="createD",
		text="D",
		onclick=function() createAnimationTrans("down")end}
	:button{
		id="createDR",
		text="DR",
		onclick=function() createAnimationTrans("down","right")end}
	:newrow()
	:button{
		id="fillCel",
		text="Fill Cels",
		onclick=function() fillCelsTrans() end}
	if isThemeDebugMode == true then
		settingsDLG:show{wait=true,bounds= Rectangle(SBGTdlg_X,SBGTdlg_Y,SBGTdlg_Width,SBGTdlg_Height)}
		print("X: " .. settingsDLG.bounds.x .. "")
		print("Y: " .. settingsDLG.bounds.y .. "")
		print("Width: " .. settingsDLG.bounds.width .. "")
		print("Height: " .. settingsDLG.bounds.height .. "")
	else
		settingsDLG:show{wait=false,bounds= Rectangle(SBGTdlg_X,SBGTdlg_Y,SBGTdlg_Width,SBGTdlg_Height)}
	end
	

function testFunction()
	local image = app.activeSprite
	print(image.filename)
end	

--Create new sprite
function createNewSprite()
	app.range.layers = {app.activeLayer}
	app.command.copy()
	app.command.NewFile{ui=false,width=app.activeSprite.width,height=app.activeSprite.height,colorMode= app.activeSprite.colorMode}
	app.command.paste()
	app.command.GotoPreviousLayer()
	if getLayerCount() == 1 then
		app.alert{title="No Cel Selected!",text="To get started, please select a single cel (layer/frame)","","","Then after adjusting your settings press a direction to add an animation."}
		app.activeSprite:close()
		return false
	else
	app.command.RemoveLayer()
	return true
	end
end
--modify it

--send it back to original document.
function copyLayerToOG(i,n,fn)
	local aLayer = app.activeLayer
	local aSprite = app.activeSprite
	local tempFN = aSprite.filename
	app.range.layers = {aLayer}
	app.command.copy()
	while app.activeSprite == nil or app.activeSprite.filename ~= fn do
		app.command.GotoPreviousTab()
	end
	app.activeLayer.stackIndex = i
	app.command.paste()
	app.activeLayer.stackIndex = i
	app.command.GotoNextLayer()
	app.command.RemoveLayer()
	app.activeLayer.name = n
	app.command.DeselectMask()
	app.refresh()
	while app.activeSprite == nil or app.activeSprite.filename ~= tempFN do
		app.command.GotoNextTab()
	end
	aSprite:close()
	while app.activeSprite == nil or app.activeSprite.filename ~= fn do
		app.command.GotoPreviousTab()
	end
end

function fillCelsTrans()
	app.transaction(function() _fillCels()end)
end

function createAnimationTrans(dir0,dir1)
	app.transaction(function() createAnimationOnFrame(dir0,dir1) end)
end

function createAnimationOnFrame(dir0,dir1)
	--app.command.GoToFirstFrame()
	--local result = app.activeCel.image.isEmpty()
	--print(result)
	if app.activeImage == nil or app.activeImage:isEmpty() == true then
		app.alert{
			title="No Data In Current Cel",
			text={"Your currently selected cel does not contain any data.","","To create an animation the cel must have pixels in the image."}
		}
		return
	end
	local ogLayer = app.activeLayer
	local ogTabName = app.activeSprite.filename
	local ogFrame = app.activeCel.frameNumber
	if createNewSprite() == false then
		return
	else
	--modify it
	local aLayer = app.activeLayer
	local layer_index = app.activeLayer.stackIndex
	app.activeFrame = app.activeSprite.frames[ogFrame]
	local aFrame = app.activeFrame
	local frameTime = settingsDLG.data.inputFrames
	local loopMultiplier = settingsDLG.data.inputSpeed
	local diag = false
	if dir1 ~= nil then
		diag = true -- if we do have a second direction then this is a diagonal.
	end
	  	if aFrame == nil then
  			app.alert{
  			title="No Frame Selected",
  			text="An active frame must be selected to apply an animation to it."
  			}
  		else
  			local frameSpr = aFrame.sprite
	  		local sprW = frameSpr.width
	  		local PPF = sprW / (frameTime/loopMultiplier) --Pixels Per Frame
	  	--Create new frames
	  		for i = 1,frameTime -1 do
	  			app.command.NewFrame()
	  		end
  		--Shift frames
	  		app.activeFrame = app.activeSprite.frames[ogFrame]
	  		for m = 1, loopMultiplier do
		  		for x = 1,(frameTime / loopMultiplier) do
		  				app.command.MaskAll()
		  				app.command.MoveMask{
		  				target="content",
		  				wrap=true,
		  				direction=dir0,
		  				units="pixel",
		  				quantity=PPF * x
		  				}
		  				if diag == true then
		  					app.command.MoveMask{
		  					target="content",
		  					wrap=true,
		  					direction=dir1,
		  					units="pixel",
		  					quantity=PPF * x
		  					}
		  				end
		  				app.command.GotoNextFrame()
		  				app.refresh()
		  		end
		  	end
  		app.command.DeselectMask()
  		copyLayerToOG(ogLayer.stackIndex,ogLayer.name,ogTabName)
  		app.activeFrame = app.activeSprite.frames[ogFrame]
  	 	end
  	 end
	end

thankyouDLG= Dialog{title="Thank You For Your Interest In My Toolbars :D"}

thankyouDLG
	:separator{text=""}
  	:newrow()
  	:label{text="Dear Awesome Person,"}
  	:newrow()
  	:label{text="Thank you for checking out my toolbar! I hope you are getting great use from it!"}
  	:newrow()
  	:label{text=""}
  	:newrow()
  	:label{text="I would love to see what you have created with this tool!"}
  	:newrow()
  	:label{text="Below I have added a button that will link to my twitter page if you would like to share your work :D"}
 	:newrow()
  	:label{text="Tweet at me bro :P"}
  	:newrow()
  	:label{text=""}
  	:newrow()
  	:label{text="If you are really enjoying this tool and finding it very useful,"}
  	:newrow()
  	:label{text="and would like to support the creation of it I have included a link where you can do so below :D"}
  	:newrow()
  	:label{text="By no means is it required! However I am extremely grateful for the extra support as this is all"}
  	:newrow()
  	:label{text="done in my free time and takes many upon many of hours to complete as I want to make sure"}
  	:newrow()
  	:label{text="every feature is polished and easy to use."}
  	:newrow()
  	:label{text=""}
  	:newrow()
  	:label{text="Again THANK YOU <3 and enjoy!"}
  	:newrow()
  	:label{text="                                 -Carbs"}
  	:newrow()
  	:label{text=""}
  	:newrow()
  	:label{text="PS. Shoutout to everyone that has shared this tool and spread the word much love guys!"}
  	:newrow()
  	:label{text="PPS. Shoutout to David & Gaspar Capello and all Aseprite Devs. Without you none of this would be possible!"}
  	:newrow()
  	:separator{text=""}
  	:newrow()
  	:button{
  		text="Tweet Your Artwork At Me",
  		onclick=function() openWebsite("https://twitter.com/CarbsCode")end}
  	:button{
  		text="View All CarbsCode Projects",
  		onclick=function() openWebsite("https://carbscode.itch.io")end}
  	:button{
  		text="Donate To CarbsCode",
  		onclick=function() openWebsite("https://carbscode.itch.io/carbscode-donation") end}
  	:newrow()
  	:separator{text=""}
function openWebsite(website)
	local system = "Linux"
	--app.alert{text={"Opening Carbs Itch.io Website","","Because this opens a web browser Aseprite will ask you","to allow this action in the next dialog."}}
	--Windows
	if system == "Windows" then
		os.execute("start " ..website.. "")
	--Mac
	elseif system == "MacOS" then
		os.execute("open " ..website.. "")
	--Linux
	elseif system == "Linux" then
		os.execute("xdg-open " ..website.. "")
	else
		app.alert("Unsure what operating system your using so we can't launch the website.")
	end
end
function countLayers()
	app.command.GotoNextTab()
end

--Custom move cell function cus there doesn't seem to be one D:
function _moveCell(from_layer,from_frame,to_layer,to_frame)	
	app.activeLayer = app.activeSprite.parent.layers[from_layer]
	app.activeFrame = app.activeSprite.frames[from_frame]
	app.command.MaskAll()
	app.command.cut()
	app.activeLayer = app.activeSprite.parent.layers[to_layer]
	app.activeFrame = app.activeSprite.frames[to_frame]
	app.command.paste()
	app.command.DeselectMask()
end

function _fillCels()
	if app.activeImage == nil or app.activeImage:isEmpty() == true then
		app.alert{
			title="No Data In Current Cel",
			text={"Your currently selected cel does not contain any data.","","To fill all x amount of cels the selected cel must have pixels in the image."}
		}
		return
	end
	local frameTime = settingsDLG.data.inputFrames
	app.command.MaskAll()
	app.command.copy()
	for c = app.activeFrame.frameNumber, frameTime + (app.activeFrame.frameNumber -1) do
		app.command.GotoNextFrame()
		app.command.paste()
	end
	app.command.Cancel()
	app.refresh()
end

--Getters
function getLayerCount()
	--Returns the number of parent layers.
	--Will need to handle layer groups.
	return #app.activeLayer.parent.layers
end

function getLastFrame()
	--Returns the number of frames in the current sprite.
	return #app.activeSprite.frames
end