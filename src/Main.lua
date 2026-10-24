local SEL = game:GetService("Selection")
local PREVIEW = require(script.Parent.Preview)
local SELECTOR = require(script.Parent.Selector)
local PANEL = require(script.Parent.Panel)
local NOTIFS = require(script.Parent.Notifications)

local NAME = "Seed Calculator"
local TOOLBAR = plugin:CreateToolbar(NAME)
local BUTTON = TOOLBAR:CreateButton(NAME,NAME,"rbxassetid://8803807177",NAME)

local gui
local selected
local connection
local savedSeed = 416
local selectedName = ""

local function close()
	if gui then
		PREVIEW.close()
		gui = nil
		NOTIFS.setGUI(nil)
	end
end

local function open()
	gui = PREVIEW.create()
	NOTIFS.setGUI(gui)
	
	local viewport = gui.container.viewport
	local selector = viewport.selector
	local input = gui.container.input
	
	local seed = tonumber(savedSeed) or 416
	input.Text = tostring(seed)
	
	PREVIEW.setSelected(selected,selectedName)
	SELECTOR.connect(gui)
	PANEL.connect(
		viewport,
		selector,
		SELECTOR.closeDropdown()
	)
	
	input:GetPropertyChangedSignal("Text"):Connect(function()
		if not input:GetAttribute("updating") then
			PREVIEW.update()
		end
	end)
end

BUTTON.Click:Connect(function()
	if gui then
		savedSeed = gui.container.input.Text
		close()
	else
		open()
		PREVIEW.update()
	end
end)

plugin.Unloading:Connect(close)
plugin.Deactivation:Connect(close)

SEL.SelectionChanged:Connect(function()
	selected = SEL:Get()[1]
	
	if connection then
		connection:Disconnect()
		connection = nil
	end
	
	local seed = selected and selected:GetAttribute("Seed")
	
	local secondCheck = selected and (selected:FindFirstAncestor("Bots") or selected:FindFirstAncestor("BotTemplates") or selected:FindFirstAncestor("BotStorage"))
	if selected and secondCheck and seed and tonumber(seed) then
		selectedName = selected.Name
		PREVIEW.setSelected(selected,selectedName)
		PREVIEW.update(tonumber(seed))
		
		connection = selected:GetAttributeChangedSignal("Seed"):Connect(function()
			selectedName = selected.Name
			PREVIEW.setSelected(selected,selectedName)
			PREVIEW.update(tonumber(selected:GetAttribute("Seed")))
		end)
	else
		selected = nil
		selectedName = ""
		PREVIEW.setSelected(nil,"")
		PREVIEW.update()
	end
end)

--sprix PLEASE tell me this is enough
--although gotta say having it sorted like this isnt like awful
--maybe ill do it more in the future (except the camel case i still feel like thats kinda gross idk why)