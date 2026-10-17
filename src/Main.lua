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

hairstyles = {
	male = {"Charmer","Cool","Dev","Dreamy","Popstar","Neat","Spiky","Shaggy","MessyWavy","Fluffed"},
	female = {"Animazing","Anime","Bob","Drama","Cropped","Wild","Classic","Long","Ponytail","Wolfish","Wavy","Short"},
	beards = {"Neat","Thin","Trimmed"}
}
skincolors = {
	black = {
		{124,92,70},
		{100,75,62},
		{86,66,54},
		{110,81,62},
		{80,59,45},
	},
	beige = {
		{170,133,106},
		{175,148,131},
	},
	white = {
		{234,184,146},
		{180,144,108},
		{255,204,153},
	},
	tan = {
		{170,133,106},
		{158,117,89},
		{180,144,108},
	},
	medium = {
		{124,92,70},
		{139,117,104},
		{158,117,89},
	},
}
haircolors = {
	black = {
		{27,42,53},
		{52,52,52},
		{33,33,33},
	},
	beige = {
		{27,42,53},
		{86,66,54},
		{57,43,35},
		{30,22,18},
	},
	white = {
		{27,42,53},
		{86,66,54},
		{99,95,98},
		{199,172,120},
		{90,76,66},
		{135,79,44},
		{124,92,70},
	},
	tan = {
		{27,42,53},
		{86,66,54},
		{57,43,35},
		{30,22,18},
	},
	medium = {
		{27,42,53},
		{52,52,52},
		{33,33,33},
	},
}

local current
local id = 0
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
	if current then hide(current) end
	shownat = os.clock()
	id += 1
	local thisid = id
	local p = gui.popup:Clone()
	current = p
	p.Position += UDim2.new(0,0,.2,0)
	p.TextTransparency = 1
	p.Text = text
	p.Parent = gui
	ts:Create(p,TweenInfo.new(.2,Enum.EasingStyle.Cubic,Enum.EasingDirection.Out),{Position = p.Position+UDim2.new(0,0,-.2,0)}):Play()
	ts:Create(p,TweenInfo.new(.2,Enum.EasingStyle.Linear),{Position = p.Position+UDim2.new(0,0,-.2,0),TextTransparency = 0}):Play()
	task.delay(5,function()
		if id ~= thisid or current ~= p then return end
		current = nil
		hide(p,true)
	end)
	task.delay(7,function() if p then p:Destroy() end end)
end

local function compute(seedr)
	pcall(function()
		if seedr and tonumber(seedr) then
			local s,r = pcall(function()
				gui.container.input:SetAttribute("updating",true)
				gui.container.input.Text = tostring(tonumber(seedr))
				gui.container.input:SetAttribute("updating",false)
			end)
			if not s then return end
		end
		gui.container.viewport.name.Text = sname
		local seed = gui.container.input.Text
		if not tonumber(seed) then return end
		seed = tonumber(seed)
		local gender = seed%2 == 0 and "male" or "female"
		local hairstyle = hairstyles[gender][math.floor(seed/7)%#hairstyles[gender]+1]
		local beardstyle = seed%10 == 0 and hairstyles["beards"][math.floor(seed/5)%#hairstyles["beards"]+1] or "none"
		for i,v in ipairs(gui.container.viewport.hair:GetChildren()) do
			if v.Name == hairstyle then v.Transparency = 0 else v.Transparency = 1 end
		end
		for i,v in ipairs(gui.container.viewport.beard:GetChildren()) do
			if v.Name == beardstyle then v.Transparency = 0 else v.Transparency = 1 end
		end
		local ethnicity
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
		local skincolor = skincolors[ethnicity][math.floor(seed/3)%#skincolors[ethnicity]+1]
		local haircolor = haircolors[ethnicity][math.floor(seed/13)%#haircolors[ethnicity]+1]
		gui.container.viewport.Head.Color = Color3.fromRGB(skincolor[1],skincolor[2],skincolor[3])
		gui.container.viewport.desc.seed.frame.text.Text = seed
		gui.container.viewport.desc.hairstyle.frame.vf:ClearAllChildren()
		gui.container.viewport.desc.beardstyle.frame.vf:ClearAllChildren()
		local hairstyleclone = gui.container.viewport.hair[hairstyle]:Clone()
		local beardstyleclone = gui.container.viewport.beard[beardstyle]:Clone()
		hairstyleclone.Parent = gui.container.viewport.desc.hairstyle.frame.vf
		beardstyleclone.Parent = gui.container.viewport.desc.beardstyle.frame.vf
		gui.container.viewport.desc.hairstyle.frame.text.Text = hairstyle
		gui.container.viewport.desc.beardstyle.frame.text.Text = beardstyle
		gui.container.viewport.desc.haircolor.frame.cf.color.BackgroundColor3 = Color3.fromRGB(haircolor[1],haircolor[2],haircolor[3])
		gui.container.viewport.desc.haircolor.frame.text.Text = haircolor[1]..","..haircolor[2]..","..haircolor[3]
		gui.container.viewport.desc.skincolor.frame.cf.color.BackgroundColor3 = Color3.fromRGB(skincolor[1],skincolor[2],skincolor[3])
		gui.container.viewport.desc.skincolor.frame.text.Text = skincolor[1]..","..skincolor[2]..","..skincolor[3]
		for i,v in ipairs(gui.container.viewport:GetDescendants()) do
			if v:IsA("MeshPart") and v.Parent:IsA("Folder") then
				v.Color = Color3.fromRGB(haircolor[1],haircolor[2],haircolor[3])
			end
		end
		hairstyleclone.Color = Color3.new(1,1,1)
		beardstyleclone.Color = Color3.new(1,1,1)
		if selected then
			local rec = chs:TryBeginRecording("Change Bot Seed")
			if not rec then return end
			selected:SetAttribute("Seed",seed)
			chs:FinishRecording(rec,Enum.FinishRecordingOperation.Commit)
		end
	end)
end

local function close()
	if gui then
		gui:Destroy()
		gui = nil
	end
end

local function open()
	gui = uitemp:Clone()
	gui.Parent = game:GetService("CoreGui")
	local viewport = gui.container.viewport
	local selector:ScrollingFrame = viewport.selector
	local input = gui.container.input
	local camera:Camera = viewport.Camera
	for i,v in pairs(gui:GetDescendants()) do if v:IsA("ViewportFrame") then v.CurrentCamera = camera end end
	local groups = {"black","beige","white","tan","medium"}
	local current = {}
	local seed = tonumber(seedsaved) or 416
	input.Text = tostring(seed)
	local ethnicity
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
	local skin = skincolors[ethnicity][math.floor(seed/3)%#skincolors[ethnicity]+1]
	local hair = haircolors[ethnicity][math.floor(seed/13)%#haircolors[ethnicity]+1]
	current.hairstyle = hairstyles[gender][math.floor(seed/7)%#hairstyles[gender]+1]
	current.beardstyle = seed%10 == 0 and hairstyles.beards[math.floor(seed/5)%#hairstyles.beards+1] or "none"
	current.skincolor = {label=table.concat(skin,","),rgb=skin,ethnicity=ethnicity}
	current.haircolor = {label=table.concat(hair,","),rgb=hair,ethnicity=ethnicity}
	for i,v in ipairs({"hairstyle","beardstyle","haircolor","skincolor"}) do
		local target = selector:FindFirstChild(v)
		local frame = target and target:FindFirstChild("frame")
		local value = current[v]
		if frame then
			frame.text.Text = type(value) == "table" and value.label or value
			if v == "hairstyle" or v == "beardstyle" then
				local vf = frame.vf
				local source = (v == "hairstyle" and viewport.hair or viewport.beard):FindFirstChild(value)
				if vf then
					for i,c in ipairs(vf:GetChildren()) do c:Destroy() end
					if source then
						local t = source:Clone()
						for i,z in ipairs(t:IsA("BasePart") and {t} or t:GetDescendants()) do
							if z:IsA("BasePart") then
								z.Transparency = 0
								z.Color = Color3.new(1,1,1)
							end
						end
						t.Parent = vf
					end
				end
			else
				local cf = frame:FindFirstChild("cf")
				local color = cf and cf:FindFirstChild("color")
				local rgb = value.rgb or {255,255,255}
				if color then color.BackgroundColor3 = Color3.fromRGB(rgb[1],rgb[2],rgb[3]) end
			end
		end
	end
	local beard = selector:FindFirstChild("beardstyle")
	if beard then
		local allowed = current.hairstyle == "*" or table.find(hairstyles.male,current.hairstyle) ~= nil or current.beardstyle == "*"
		beard.Active = true
		beard.AutoButtonColor = true
		beard.frame.text.TextColor3 = allowed and Color3.new(1,1,1) or Color3.fromRGB(100,100,100)
	end
	input:GetPropertyChangedSignal("Text"):Connect(function() if not input:GetAttribute("updating") then sname = "" compute() end end)
	local t1,t2
	local t3 = false
	viewport.thing.MouseButton1Click:Connect(function()
		t3 = not t3
		if t3 then
			if t1 then t1:Cancel() end if t2 then t2:Cancel() end
			t1 = ts:Create(viewport.Parent,TweenInfo.new(.2,Enum.EasingStyle.Cubic,Enum.EasingDirection.Out),{Position = UDim2.new(.5,0,.5,0)})
			t2 = ts:Create(selector,TweenInfo.new(.2,Enum.EasingStyle.Cubic,Enum.EasingDirection.Out),{Size = UDim2.new(0,200,0,270)})
			t1:Play() t2:Play()
			task.delay(.2,function()
				if t3 then selector.ClipsDescendants = false end
			end)
		else
			selector.ClipsDescendants = true
			if t1 then t1:Cancel() end if t2 then t2:Cancel() end
			t1 = ts:Create(viewport.Parent,TweenInfo.new(.2,Enum.EasingStyle.Cubic,Enum.EasingDirection.Out),{Position = UDim2.new(.5,110,.5,0)})
			t2 = ts:Create(selector,TweenInfo.new(.2,Enum.EasingStyle.Cubic,Enum.EasingDirection.Out),{Size = UDim2.new(0,0,0,270)})
			t1:Play() t2:Play()
		end
		if sframe then
			sframe:Destroy()
			sframe = nil
		end
	end)
	local search = selector:FindFirstChild("search")
	local sbutton = search and search:FindFirstChild("sbutton")
	if sbutton then
		sbutton.MouseButton1Click:Connect(function()
			local found
			for i = 0,81899 do --82900 as lcm
				local cgender = i%2 == 0 and "male" or "female"
				local chairstyle = hairstyles[cgender][math.floor(i/7)%#hairstyles[cgender]+1]
				local cbeard = i%10 == 0 and hairstyles.beards[math.floor(i/5)%#hairstyles.beards+1] or "none"
				local cethnicity
				if i%100 < 15 then
					cethnicity = "black"
				elseif i%100 < 30 then
					cethnicity = "beige"
				elseif i%100 < 70 then
					cethnicity = "white"
				elseif i%100 < 85 then
					cethnicity = "tan"
				else
					cethnicity = "medium"
				end
				local cskin = skincolors[cethnicity][math.floor(i/3)%#skincolors[cethnicity]+1]
				local chair = haircolors[cethnicity][math.floor(i/13)%#haircolors[cethnicity]+1]
				local matches = true
				if current.hairstyle ~= "*" and current.hairstyle ~= chairstyle then matches = false end
				if current.beardstyle ~= "*" and current.beardstyle ~= cbeard then matches = false end
				local wantedskin = current.skincolor
				if wantedskin and not wantedskin.wildcard then
					if cethnicity ~= wantedskin.ethnicity or not wantedskin.rgb or cskin[1] ~= wantedskin.rgb[1] or cskin[2] ~= wantedskin.rgb[2] or cskin[3] ~= wantedskin.rgb[3] then matches = false end
				end
				local wantedhair = current.haircolor
				if wantedhair and not wantedhair.wildcard then
					if cethnicity ~= wantedhair.ethnicity or not wantedhair.rgb or chair[1] ~= wantedhair.rgb[1] or chair[2] ~= wantedhair.rgb[2] or chair[3] ~= wantedhair.rgb[3] then matches = false end
				end
				if matches then found = i break end
			end
			if found then
				input.Text = tostring(found)
			else
				popup("Combination Impossible")
			end
		end)
	end
	for i,v in ipairs({"hairstyle","beardstyle","haircolor","skincolor"}) do
		local target = selector:FindFirstChild(v)
		if target and target:IsA("TextButton") then
			target.MouseButton1Click:Connect(function()
				if sframe then
					local same = sframe.Parent == target
					sframe:Destroy()
					sframe = nil
					if same then return end
				end
				local options = {"*"}
				if v == "hairstyle" then
					for i,s in ipairs({"male","female"}) do
						for i,r in ipairs(hairstyles[s]) do table.insert(options,r) end
					end
				elseif v == "beardstyle" then
					if current.hairstyle == "*" or table.find(hairstyles.male,current.hairstyle) then
						table.insert(options,"none")
						for i,r in ipairs(hairstyles.beards) do table.insert(options,r) end
					end
				else
					options = {{label="*",dropdownlabel="*",wildcard=true}}
					local pool = v == "haircolor" and haircolors or skincolors
					for i,c in ipairs(groups) do
						for i,rgb in ipairs(pool[c]) do table.insert(options,{label=table.concat(rgb,","),dropdownlabel=table.concat(rgb,",").." ("..c..")",rgb=rgb,ethnicity=c}) end
					end
				end
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
				local lt = Instance.new("UIListLayout")
				lt.SortOrder = Enum.SortOrder.LayoutOrder
				lt.Padding = UDim.new(0,0)
				lt.Parent = sframe
				for i,a in ipairs(options) do
					local entry = template:Clone()
					entry.Name = "option"..i
					entry.Visible = true
					entry.LayoutOrder = i
					entry.Position = UDim2.new(0,0,0,0)
					entry.Size = UDim2.new(1,0,0,30)
					entry.ZIndex = 99
					if entry:FindFirstChild("text") then entry:FindFirstChild("text"):Destroy() end
					entry.Parent = sframe
					for i,child in ipairs(entry:GetDescendants()) do
						if child:IsA("GuiObject") then
							child.ZIndex = 11
						end
					end
					local frame = entry:FindFirstChild("frame")
					frame.text.Text = type(a) == "table" and a.dropdownlabel or a
					if v == "hairstyle" or v == "beardstyle" then
						local vf = frame:FindFirstChild("vf")
						local source = (v == "hairstyle" and viewport.hair or viewport.beard):FindFirstChild(a)
						if vf then
							for i,b in ipairs(vf:GetChildren()) do b:Destroy() end
							if source then
								local clone = source:Clone()
								for i,n in ipairs(clone:IsA("BasePart") and {clone} or clone:GetDescendants()) do
									if n:IsA("BasePart") then
										n.Transparency = 0
										n.Color = Color3.new(1,1,1)
									end
								end
								clone.Parent = vf
							end
						end
					else
						local cf = frame:FindFirstChild("cf")
						local color = cf and cf:FindFirstChild("color")
						local rgb = type(a) == "table" and a.rgb or {0,0,0}
						if color then color.BackgroundColor3 = Color3.fromRGB(rgb[1],rgb[2],rgb[3]) end
					end
					entry.MouseButton1Click:Connect(function()
						local updates = {v}
						if v == "haircolor" or v == "skincolor" then
							current[v] = a
							local other = v == "haircolor" and "skincolor" or "haircolor"
							if not a.wildcard and not current[other].wildcard then
								local pool = (other == "haircolor" and haircolors or skincolors)[a.ethnicity]
								local div = other == "haircolor" and 13 or 3
								local rgb = pool[math.floor((tonumber(input.Text) or 416)/div)%#pool+1]
								current[other] = {label=table.concat(rgb,","),dropdownlabel=table.concat(rgb,",").." ("..a.ethnicity..")",rgb=rgb,ethnicity=a.ethnicity}
								table.insert(updates,other)
							end
						else
							current[v] = a
							if v == "hairstyle" then
								if a ~= "*" and not table.find(hairstyles.male,a) and current.beardstyle ~= "*" then current.beardstyle = "none" end
								table.insert(updates,"beardstyle")
							end
						end
						for i,c in ipairs(updates) do
							local button = selector:FindFirstChild(c)
							local frame = button and button:FindFirstChild("frame")
							local value = current[c]
							if frame then
								frame.text.Text = type(value) == "table" and value.label or value
								if c == "hairstyle" or c == "beardstyle" then
									local vf = frame:FindFirstChild("vf")
									local source = (c == "hairstyle" and viewport.hair or viewport.beard):FindFirstChild(value)
									if vf then
										for i,obj in ipairs(vf:GetChildren()) do obj:Destroy() end
										if source then
											local clone = source:Clone()
											for i,n in ipairs(clone:IsA("BasePart") and {clone} or clone:GetDescendants()) do
												if n:IsA("BasePart") then
													n.Transparency = 0
													n.Color = Color3.new(1,1,1)
												end
											end
											clone.Parent = vf
										end
									end
								else
									local cf = frame:FindFirstChild("cf")
									local color = cf and cf:FindFirstChild("color")
									local rgb = value.rgb or {0,0,0}
									if color then color.BackgroundColor3 = Color3.fromRGB(rgb[1],rgb[2],rgb[3]) end
								end
							end
						end
						if v == "hairstyle" then
							local button = selector:FindFirstChild("beardstyle")
							local allowed = a == "*" or table.find(hairstyles.male,a) ~= nil or current.beardstyle == "*"
							if button then
								button.Active = true
								button.AutoButtonColor = true
								button.frame.text.TextColor3 = allowed and Color3.new(1,1,1) or Color3.fromRGB(100,100,100)
							end
						end
						if sframe then sframe:Destroy() sframe = nil end
					end)
				end
				template:Destroy()
			end)
		end
	end
end

button.Click:Connect(function()
	if gui then
		seedsaved = gui.container.input.Text
		close()
	else
		open()
		compute()
	end
end)

plugin.Unloading:Connect(close)
plugin.Deactivation:Connect(close)

selection.SelectionChanged:Connect(function()
	selected = selection:Get()[1]
	if selected and (selected.Parent.Name == "Bots" or selected.Parent.Name == "BotTemplates" or selected.Parent.Name == "BotStorage") and selected:GetAttribute("Seed") and tonumber(selected:GetAttribute("Seed")) then
		if conn then conn:Disconnect() conn = nil end
		pcall(function() sname = selected.Name compute(tonumber(selected:GetAttribute("Seed"))) end)
		conn = selected:GetAttributeChangedSignal("Seed"):Connect(function()
			sname = selected.Name compute(tonumber(selected:GetAttribute("Seed")))
		end)
	else
		selected = nil
		sname = ""
		compute()
	end
end)