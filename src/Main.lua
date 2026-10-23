local selection = game:GetService("Selection")
local ts = game:GetService("TweenService")
local chs = game:GetService("ChangeHistoryService")
local uitemp = require(script.Parent.UI)
local n = "Seed Calculator"
local button = plugin:CreateToolbar(n):CreateButton(n,n,"rbxassetid://8803807177",n)
local gui,conn
local seedsaved = 416
local selected
local sname = ""
local sframe

local hairstyles = {
	male = {"Charmer","Cool","Dev","Dreamy","Popstar","Neat","Spiky","Shaggy","MessyWavy","Fluffed"},
	female = {"Animazing","Anime","Bob","Drama","Cropped","Wild","Classic","Long","Ponytail","Wolfish","Wavy","Short"},
	beards = {"Neat","Thin","Trimmed"}
}
local skincolors = {
	black = {{124,92,70},{100,75,62},{86,66,54},{110,81,62},{80,59,45}},
	beige = {{175,148,131},{170,133,106}},
	white = {{255,204,153},{234,184,146},{180,144,108}},
	tan = {{158,117,89},{180,144,108},{170,133,106}},
	medium = {{158,117,89},{124,92,70},{139,117,104}}
}
local haircolors = {
	black = {{27,42,53},{52,52,52},{33,33,33}},
	beige = {{27,42,53},{86,66,54},{57,43,35},{30,22,18}},
	white = {{27,42,53},{86,66,54},{99,95,98},{199,172,120},{90,76,66},{135,79,44},{124,92,70}},
	tan = {{27,42,53},{86,66,54},{57,43,35},{30,22,18}},
	medium = {{27,42,53},{52,52,52},{33,33,33}}
}
local groups = {"black","beige","white","tan","medium"}
local selectorkeys = {"hairstyle","beardstyle","haircolor","skincolor"}
local white = Color3.new(1,1,1)

local currentpopup
local popupid = 0
local shownat = 0
local function hide(p)
	if not p or not p.Parent then return end
	local move = ts:Create(p,TweenInfo.new(.2,Enum.EasingStyle.Cubic,Enum.EasingDirection.In),{Position = p.Position+UDim2.new(0,0,-.2,0)})
	ts:Create(p,TweenInfo.new(.2,Enum.EasingStyle.Linear),{TextTransparency = 1}):Play()
	move.Completed:Connect(function() if p.Parent then p:Destroy() end end)
	move:Play()
end
local function popup(text)
	if os.clock()-shownat < 1 then return end
	if currentpopup then hide(currentpopup) end
	shownat = os.clock()
	popupid += 1
	local thisid = popupid
	local p = gui.popup:Clone()
	currentpopup = p
	p.Position += UDim2.new(0,0,.2,0)
	p.TextTransparency = 1
	p.Text = text
	p.Parent = gui
	ts:Create(p,TweenInfo.new(.2,Enum.EasingStyle.Cubic,Enum.EasingDirection.Out),{Position = p.Position+UDim2.new(0,0,-.2,0)}):Play()
	ts:Create(p,TweenInfo.new(.2,Enum.EasingStyle.Linear),{TextTransparency = 0}):Play()
	task.delay(5,function()
		if popupid ~= thisid or currentpopup ~= p then return end
		currentpopup = nil
		hide(p)
	end)
	task.delay(7,function() p:Destroy() end)
end


local function computethingie(list,seed,repeater)
	return list[math.floor(seed/repeater)%#list+1]
end
local function tocolor(rgb)
	return Color3.fromRGB(rgb[1],rgb[2],rgb[3])
end
local function totext(rgb)
	return table.concat(rgb,",")
end
local function makecolor(rgb,ethnicity,dropdown)
	local label = totext(rgb)
	local value = {label=label,rgb=rgb,ethnicity=ethnicity}
	if dropdown then value.dropdownlabel = label.." ("..ethnicity..")" end
	return value
end
local function getdetails(seed,selector)
	local ethnicity = "yes"
	if seed%100 < 15 then
		ethnicity = "black"
	elseif seed%100 < 30 then
		ethnicity = "beige"
	elseif seed%100 < 70 then
		ethnicity = "white"
	elseif seed%100 < 85 then
		ethnicity = "tan"
	else
		ethnicity = "medium"
	end
	local gender = seed%2 == 0 and "male" or "female"
	local details = {
		hairstyle = computethingie(hairstyles[gender],seed,7),
		beardstyle = seed%10 == 0 and computethingie(hairstyles.beards,seed,5) or "none",
		ethnicity = ethnicity,
		skincolor = computethingie(skincolors[ethnicity],seed,3),
		haircolor = computethingie(haircolors[ethnicity],seed,13)
	}
	if selector then
		details.skincolor = makecolor(details.skincolor,ethnicity)
		details.haircolor = makecolor(details.haircolor,ethnicity)
	end
	return details
end

local function updateframe(frame,key,value,viewport,displaytext)
	if displaytext then
		frame.text.Text = displaytext
	elseif type(value) == "table" then
		frame.text.Text = value.label
	else
		frame.text.Text = value
	end
	if key == "hairstyle" or key == "beardstyle" then
		frame.vf:ClearAllChildren()
		local folder = key == "hairstyle" and viewport.hair or viewport.beard
		local source = folder:FindFirstChild(value)
		if source then
			local clone = source:Clone()
			clone.Transparency = 0
			clone.Color = white
			clone.Parent = frame.vf
		end
		return
	end
	frame.cf.color.BackgroundColor3 = tocolor(value.rgb or {0,0,0})
end
local function updatebeardcheck(selector,hairstyle,beardstyle)
	local beard = selector.beardstyle
	local allowed = hairstyle == "*" or table.find(hairstyles.male,hairstyle) ~= nil or beardstyle == "*"
	beard.Active = true
	beard.AutoButtonColor = true
	beard.frame.text.TextColor3 = allowed and white or Color3.fromRGB(100,100,100)
end


local function computeseed(seedoverride)
	if not gui then return end
	local container = gui.container
	local input = container.input
	local viewport = container.viewport
	if seedoverride and tonumber(seedoverride) then
		input:SetAttribute("updating",true)
		input.Text = tostring(tonumber(seedoverride))
		input:SetAttribute("updating",false)
	end
	viewport.name.Text = sname
	local seed = tonumber(input.Text)
	if not seed then return end
	local details = getdetails(seed)
	local desc = viewport.desc
	local hairstyle = details.hairstyle
	local beardstyle = details.beardstyle
	local skincolor = details.skincolor
	local haircolor = details.haircolor
	for i,v in ipairs(viewport.hair:GetChildren()) do v.Transparency = v.Name == hairstyle and 0 or 1 end
	for i,v in ipairs(viewport.beard:GetChildren()) do v.Transparency = v.Name == beardstyle and 0 or 1 end
	viewport.Head.Color = tocolor(skincolor)
	desc.seed.frame.text.Text = seed
	local hairframe = desc.hairstyle.frame
	local beardframe = desc.beardstyle.frame
	hairframe.vf:ClearAllChildren()
	beardframe.vf:ClearAllChildren()
	local hairclone = viewport.hair[hairstyle]:Clone()
	local beardclone = viewport.beard[beardstyle]:Clone()
	hairclone.Parent = hairframe.vf
	beardclone.Parent = beardframe.vf
	hairframe.text.Text = hairstyle
	beardframe.text.Text = beardstyle
	desc.haircolor.frame.cf.color.BackgroundColor3 = tocolor(haircolor)
	desc.haircolor.frame.text.Text = totext(haircolor)
	desc.skincolor.frame.cf.color.BackgroundColor3 = tocolor(skincolor)
	desc.skincolor.frame.text.Text = totext(skincolor)
	for i,v in ipairs(viewport:GetDescendants()) do
		if v:IsA("MeshPart") and v.Parent:IsA("Folder") then v.Color = tocolor(haircolor) end
	end
	hairclone.Color = white
	beardclone.Color = white
	if selected then
		local rec = chs:TryBeginRecording("Change Bot Seed")
		if not rec then return end
		selected:SetAttribute("Seed",seed)
		chs:FinishRecording(rec,Enum.FinishRecordingOperation.Commit)
	end
end

local function close()
	if gui then
		gui:Destroy()
		gui = nil
	end
end

local function makeoptions(key,current)
	local options = {"*"}
	if key == "hairstyle" then
		for i,v in ipairs({"male","female"}) do
			for i,c in ipairs(hairstyles[v]) do table.insert(options,c) end
		end
	elseif key == "beardstyle" then
		if current.hairstyle == "*" or table.find(hairstyles.male,current.hairstyle) then
			table.insert(options,"none")
			for i,c in ipairs(hairstyles.beards) do table.insert(options,c) end
		end
	else
		options = {{label="*",dropdownlabel="*",wildcard=true}}
		local pool = key == "haircolor" and haircolors or skincolors
		for i,v in ipairs(groups) do
			for i,c in ipairs(pool[v]) do table.insert(options,makecolor(c,v,true)) end
		end
	end
	return options
end
local function makeentry(template,index,key,option,dropdown,viewport,current,selector,input)
	local entry = template:Clone()
	entry.Name = "option"..index
	entry.Visible = true
	entry.LayoutOrder = index
	entry.Position = UDim2.new(0,0,0,0)
	entry.Size = UDim2.new(1,0,0,30)
	entry.ZIndex = 99
	local duplicate = entry:FindFirstChild("text")
	if duplicate then duplicate:Destroy() end
	entry.Parent = dropdown
	for i,v in ipairs(entry:GetDescendants()) do if v:IsA("GuiObject") then v.ZIndex = 11 end end
	local displaytext = type(option) == "table" and option.dropdownlabel or option
	updateframe(entry.frame,key,option,viewport,displaytext)
	entry.MouseButton1Click:Connect(function()
		local updates = {key}
		if key == "haircolor" or key == "skincolor" then
			current[key] = option
			local other = key == "haircolor" and "skincolor" or "haircolor"
			if not option.wildcard and not current[other].wildcard then
				local divisor = other == "haircolor" and 13 or 3
				local pool = (other == "haircolor" and haircolors or skincolors)[option.ethnicity]
				current[other] = makecolor(computethingie(pool,tonumber(input.Text) or 416,divisor),option.ethnicity,true)
				table.insert(updates,other)
			end
		else
			current[key] = option
			if key == "hairstyle" then
				if option ~= "*" and not table.find(hairstyles.male,option) and current.beardstyle ~= "*" then
					current.beardstyle = "none"
				end
				table.insert(updates,"beardstyle")
			end
		end
		for i,v in ipairs(updates) do updateframe(selector[v].frame,v,current[v],viewport) end
		if key == "hairstyle" then updatebeardcheck(selector,option,current.beardstyle) end
		if sframe then
			sframe:Destroy()
			sframe = nil
		end
	end)
end

local function connectdropdowns(selector,viewport,current,input)
	for i,v in ipairs(selectorkeys) do
		local target = selector[v]
		target.MouseButton1Click:Connect(function()
			if sframe then
				local same = sframe.Parent == target
				sframe:Destroy()
				sframe = nil
				if same then return end
			end
			local options = makeoptions(v,current)
			local template = target:Clone()
			sframe = Instance.new("ScrollingFrame")
			sframe.Name = "dropdown"
			sframe.ScrollingDirection = Enum.ScrollingDirection.Y
			sframe.AutomaticCanvasSize = Enum.AutomaticSize.Y
			sframe.CanvasSize = UDim2.new(0,0,0,0)
			sframe.AnchorPoint = Vector2.new(.5,0)
			sframe.Position = UDim2.new(.5,0,1,0)
			sframe.Size = UDim2.new(1,0,3,0)
			sframe.BackgroundColor3 = Color3.new(0,0,0)
			sframe.BackgroundTransparency = .5
			sframe.ZIndex = 9
			sframe.Parent = target
			target.ClipsDescendants = false
			local layout = Instance.new("UIListLayout")
			layout.SortOrder = Enum.SortOrder.LayoutOrder
			layout.Padding = UDim.new(0,0)
			layout.Parent = sframe
			for i,c in ipairs(options) do makeentry(template,i,v,c,sframe,viewport,current,selector,input) end
			template:Destroy()
		end)
	end
end

local function matchcolor(wanted,ethnicity,rgb)
	if wanted.wildcard then return true end
	if ethnicity ~= wanted.ethnicity then return false end
	return rgb[1] == wanted.rgb[1] and rgb[2] == wanted.rgb[2] and rgb[3] == wanted.rgb[3]
end
local function connectsearch(selector,current,input)
	selector.search.sbutton.MouseButton1Click:Connect(function()
		local found = false
		for seed = 0,81899 do --81900 as lcm, beyond this they just repeat properties
			local details = getdetails(seed)
			local matches = true
			if current.hairstyle ~= "*" and current.hairstyle ~= details.hairstyle then matches = false end
			if current.beardstyle ~= "*" and current.beardstyle ~= details.beardstyle then matches = false end
			if not matchcolor(current.skincolor,details.ethnicity,details.skincolor) then matches = false end
			if not matchcolor(current.haircolor,details.ethnicity,details.haircolor) then matches = false end
			if matches then found = seed break end
		end
		if found then
			input.Text = tostring(found)
		else
			popup("Combination Impossible")
		end
	end)
end

local function connectpanel(viewport,selector)
	local t1,t2
	local expanded = false
	viewport.thing.MouseButton1Click:Connect(function()
		expanded = not expanded
		if t1 then t1:Cancel() end if t2 then t2:Cancel() end
		if expanded then
			t1 = ts:Create(viewport.Parent,TweenInfo.new(.2,Enum.EasingStyle.Cubic,Enum.EasingDirection.Out),{Position = UDim2.new(.5,0,.5,0)})
			t2 = ts:Create(selector,TweenInfo.new(.2,Enum.EasingStyle.Cubic,Enum.EasingDirection.Out),{Size = UDim2.new(0,200,0,270)})
			t1:Play() t2:Play()
			task.delay(.2,function() if expanded then selector.ClipsDescendants = false end end)
		else
			selector.ClipsDescendants = true
			t1 = ts:Create(viewport.Parent,TweenInfo.new(.2,Enum.EasingStyle.Cubic,Enum.EasingDirection.Out),{Position = UDim2.new(.5,110,.5,0)})
			t2 = ts:Create(selector,TweenInfo.new(.2,Enum.EasingStyle.Cubic,Enum.EasingDirection.Out),{Size = UDim2.new(0,0,0,270)})
			t1:Play() t2:Play()
		end
		if sframe then
			sframe:Destroy()
			sframe = nil
		end
	end)
end

local function open()
	gui = uitemp:Clone()
	gui.Parent = game:GetService("CoreGui")
	local viewport = gui.container.viewport
	local selector = viewport.selector
	local input = gui.container.input
	for i,v in ipairs(gui:GetDescendants()) do
		if v:IsA("ViewportFrame") then v.CurrentCamera = viewport.Camera end
	end
	local seed = tonumber(seedsaved) or 416
	input.Text = tostring(seed)
	local current = getdetails(seed,true)
	for i,v in ipairs(selectorkeys) do updateframe(selector[v].frame,v,current[v],viewport) end
	updatebeardcheck(selector,current.hairstyle,current.beardstyle)
	input:GetPropertyChangedSignal("Text"):Connect(function()
		if not input:GetAttribute("updating") then computeseed() end
	end)
	connectpanel(viewport,selector)
	connectsearch(selector,current,input)
	connectdropdowns(selector,viewport,current,input)
	--this is for you sprix, i dont usually do this type of main functions full of other functions but now you can read it :)
	--also i fixed most errors so there are no more pcalls yippee
end

button.Click:Connect(function()
	if gui then
		seedsaved = gui.container.input.Text
		close()
	else
		open()
		computeseed()
	end
end)

plugin.Unloading:Connect(close)
plugin.Deactivation:Connect(close)

selection.SelectionChanged:Connect(function()
	selected = selection:Get()[1]
	if conn then conn:Disconnect() conn = nil end
	local seed = selected and selected:GetAttribute("Seed")
	if selected and (selected:FindFirstAncestor("Bots") or selected:FindFirstAncestor("BotTemplates") or selected:FindFirstAncestor("BotStorage")) and seed and tonumber(seed) then
		sname = selected.Name
		computeseed(tonumber(seed))
		conn = selected:GetAttributeChangedSignal("Seed"):Connect(function()
			sname = selected.Name
			computeseed(tonumber(selected:GetAttribute("Seed")))
		end)
	else
		selected = nil
		sname = ""
		computeseed()
	end
end)
