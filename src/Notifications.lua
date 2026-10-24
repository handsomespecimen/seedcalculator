local module = {}
local SEED_DATA = require(script.Parent.SeedData)
local TS = game:GetService("TweenService")

local gui
local currentPopup
local popupId = 0
local shownAt = 0

function module.setGUI(nextGUI)
	gui = nextGUI
end

local function hide(popupFrame)
	if not popupFrame or not popupFrame.Parent then
		return
	end
	
	local move = TS:Create(popupFrame,SEED_DATA.TWEEN_IN,{
		Position = popupFrame.Position + UDim2.new(0,0,-.2,0)
	})
	
	TS:Create(popupFrame,SEED_DATA.TWEEN_LINEAR,{
		TextTransparency = 1
	}):Play()
	
	move.Completed:Connect(function()
		if popupFrame.Parent then
			popupFrame:Destroy()
		end
	end)
	
	move:Play()
end

function module.popup(text)
	if os.clock() - shownAt < 1 then return end
	
	if currentPopup then
		hide(currentPopup)
	end
	
	shownAt = os.clock()
	popupId += 1
	local thisId = popupId
	local popupFrame = gui.popup:Clone()
	currentPopup = popupFrame
	popupFrame.Position += UDim2.new(0,0,.2,0)
	popupFrame.TextTransparency = 1
	popupFrame.Text = text
	popupFrame.Parent = gui
	
	TS:Create(popupFrame,SEED_DATA.TWEEN_OUT,{
		Position = popupFrame.Position + UDim2.new(0,0,-.2,0)
	}):Play()
	TS:Create(popupFrame,SEED_DATA.TWEEN_LINEAR,{
		TextTransparency = 0
	}):Play()
	
	task.delay(5,function()
		if popupId ~= thisId or currentPopup ~= popupFrame then
			return
		end
		
		currentPopup = nil
		hide(popupFrame)
	end)
	
	task.delay(7,function()
		popupFrame:Destroy()
	end)
end

return module