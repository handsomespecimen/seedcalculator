local module = {}
local SEED_DATA = require(script.Parent.SeedData)
local SEED_LOGIC = require(script.Parent.SeedLogic)
local NOTIFS = require(script.Parent.Notifications)
local dropdown

function module.updateFrame(frame,key,value,viewport,displaytext)
	if displaytext then
		frame.text.Text = displaytext
	elseif type(value) == "table" then
		frame.text.Text = value.label
	else
		frame.text.Text = value
	end
	
	if key == "hairstyle" or key == "beardstyle" then
		frame.vf:ClearAllChildren()
		local folder = (key == "hairstyle" and viewport.hair) or viewport.beard
		local source = folder:FindFirstChild(value)
		if source then
			local clone = source:Clone()
			clone.Transparency = 0
			clone.Color = SEED_DATA.WHITE
			clone.Parent = frame.vf
		end
		return
	end
	
	frame.cf.color.BackgroundColor3 = SEED_LOGIC.toColor(value.rgb or {0,0,0})
end

function module.updateBeardCheck(selector,hairstyle,beardstyle)
	local beard = selector.beardstyle
	local allowed = hairstyle == "*" or table.find(SEED_DATA.HAIRSTYLES.male,hairstyle) ~= nil or beardstyle == "*"
	
	beard.Active = true
	beard.AutoButtonColor = true
	beard.frame.text.TextColor3 = (allowed and SEED_DATA.WHITE) or SEED_DATA.GRAY
end

local function createEntry(template,index,key,option,dropdown,viewport,current,selector,input)
	local entry = template:Clone()
	entry.Name = "option"..index
	entry.Visible = true
	entry.LayoutOrder = index
	entry.Position = UDim2.new(0,0,0,0)
	entry.Size = UDim2.new(1,0,0,30)
	entry.ZIndex = 99
	
	local duplicate = entry:FindFirstChild("text")
	if duplicate then
		duplicate:Destroy()
	end
	
	entry.Parent = dropdown
	
	for _,item in ipairs(entry:GetDescendants()) do
		if item:IsA("GuiObject") then
			item.ZIndex = 11
		end
	end
	
	local displayText = (type(option) == "table" and option.dropdownlabel) or option
	module.updateFrame(entry.frame,key,option,viewport,displayText)
	
	entry.MouseButton1Click:Connect(function()
		local updates = {key}
		
		if key == "haircolor" or key == "skincolor" then
			current[key] = option
			local other = (key == "haircolor" and "skincolor") or "haircolor"
			
			if not option.wildcard and not current[other].wildcard then
				local divisor = (other == "haircolor" and 13) or 3
				local pool = ((other == "haircolor" and SEED_DATA.HAIR_COLORS) or SEED_DATA.SKIN_COLORS)[option.ethnicity]
				
				current[other] = SEED_LOGIC.makeColor(
					SEED_LOGIC.getSeedOption(pool,tonumber(input.Text) or 416,divisor),
					option.ethnicity,
					true
				)
				
				table.insert(updates,other)
			end
		else
			current[key] = option
			
			if key == "hairstyle" then
				if option ~= "*" and not table.find(SEED_DATA.HAIRSTYLES.male,option) and current.beardstyle ~= "*" then
					current.beardstyle = "none"
				end
				table.insert(updates,"beardstyle")
			end
		end
		
		for _,updateKey in ipairs(updates) do
			module.updateFrame(selector[updateKey].frame,updateKey,current[updateKey],viewport)
		end
		
		if key == "hairstyle" then
			module.updateBeardCheck(selector,option,current.beardstyle)
		end
		
		if dropdown then
			dropdown:Destroy()
			dropdown = nil
		end
	end)
end

function module.connectDropdowns(selector,viewport,current,input)
	for _,key in ipairs(SEED_DATA.SELECTOR_KEYS) do
		local target = selector[key]
		
		target.MouseButton1Click:Connect(function()
			if dropdown then
				local same = dropdown.Parent == target
				dropdown:Destroy()
				dropdown = nil
				if same then return end
			end
			
			local options = SEED_LOGIC.makeOptions(key,current)
			local template = target:Clone()
			
			dropdown = Instance.new("ScrollingFrame")
			dropdown.Name = "dropdown"
			dropdown.ScrollingDirection = Enum.ScrollingDirection.Y
			dropdown.AutomaticCanvasSize = Enum.AutomaticSize.Y
			dropdown.CanvasSize = UDim2.new(0,0,0,0)
			dropdown.AnchorPoint = Vector2.new(.5,0)
			dropdown.Position = UDim2.new(.5,0,1,0)
			dropdown.Size = UDim2.new(1,0,3,0)
			dropdown.BackgroundColor3 = Color3.new(0,0,0)
			dropdown.BackgroundTransparency = .5
			dropdown.ZIndex = 9
			dropdown.Parent = target
			target.ClipsDescendants = false
			
			local layout = Instance.new("UIListLayout")
			layout.SortOrder = Enum.SortOrder.LayoutOrder
			layout.Padding = UDim.new(0,0)
			layout.Parent = dropdown
			
			for index,option in ipairs(options) do
				createEntry(template,index,key,option,dropdown,viewport,current,selector,input)
			end
			
			template:Destroy()
		end)
	end
end

function module.connectSearch(selector,current,input)
	selector.search.sbutton.MouseButton1Click:Connect(function()
		local found = SEED_LOGIC.findSeed(current)
		
		if found then
			input.Text = tostring(found)
		else
			NOTIFS.popup("Combination Impossible")
		end
	end)
end

function module.closeDropdown()
	if dropdown then
		dropdown:Destroy()
		dropdown = nil
	end
end

function module.connect(gui)
	local viewport = gui.container.viewport
	local selector = viewport.selector
	local input = gui.container.input
	local current = SEED_LOGIC.getDetails(tonumber(input.Text) or 416,true)
	
	for _,key in ipairs(SEED_DATA.SELECTOR_KEYS) do
		module.updateFrame(selector[key].frame,key,current[key],viewport)
	end
	module.updateBeardCheck(selector,current.hairstyle,current.beardstyle)
	module.connectSearch(selector,current,input)
	module.connectDropdowns(selector,viewport,current,input)
end

return module