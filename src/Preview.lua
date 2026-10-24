local module = {}
local SEED_DATA = require(script.Parent.SeedData)
local SEED_LOGIC = require(script.Parent.SeedLogic)
local HIST = game:GetService("ChangeHistoryService")
local UI_TEMPLATE = require(script.Parent.UI)

local gui
local selected
local sname = ""

function module.setSelected(nextSelected,nextName)
	selected = nextSelected
	sname = nextName or ""
end

function module.getGUI()
	return gui
end

function module.create()
	gui = UI_TEMPLATE:Clone()
	gui.Parent = game:GetService("CoreGui")
	
	local viewport = gui.container.viewport
	for _,item in ipairs(gui:GetDescendants()) do
		if item:IsA("ViewportFrame") then
			item.CurrentCamera = viewport.Camera
		end
	end
	
	return gui
end

function module.close()
	if gui then
		gui:Destroy()
		gui = nil
	end
end

local function updateAppearance(viewport,details)
	local hairstyle = details.hairstyle
	local beardstyle = details.beardstyle
	local skincolor = details.skincolor
	local haircolor = details.haircolor
	
	for _,item in ipairs(viewport.hair:GetChildren()) do
		item.Transparency = (item.Name == hairstyle and 0) or 1
	end
	for _,item in ipairs(viewport.beard:GetChildren()) do
		item.Transparency = (item.Name == beardstyle and 0) or 1
	end
	
	viewport.Head.Color = SEED_LOGIC.toColor(skincolor)
	for _,item in ipairs(viewport:GetDescendants()) do
		if item:IsA("MeshPart") and item.Parent:IsA("Folder") then
			item.Color = SEED_LOGIC.toColor(haircolor)
		end
	end
end

local function updateDetails(desc,details,seed,viewport)
	local hairstyle = details.hairstyle
	local beardstyle = details.beardstyle
	local haircolor = details.haircolor
	local skincolor = details.skincolor
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
	
	desc.haircolor.frame.cf.color.BackgroundColor3 = SEED_LOGIC.toColor(haircolor)
	desc.haircolor.frame.text.Text = SEED_LOGIC.toText(haircolor)
	desc.skincolor.frame.cf.color.BackgroundColor3 = SEED_LOGIC.toColor(skincolor)
	desc.skincolor.frame.text.Text = SEED_LOGIC.toText(skincolor)
	
	hairclone.Color = SEED_DATA.WHITE
	beardclone.Color = SEED_DATA.WHITE
end

function module.update(newSeed)
	if not gui then return end
	local container = gui.container
	local input = container.input
	local viewport = container.viewport
	
	if newSeed and tonumber(newSeed) then
		input:SetAttribute("updating",true)
		input.Text = tostring(tonumber(newSeed))
		input:SetAttribute("updating",false)
	end
	
	viewport.name.Text = sname
	local seed = tonumber(input.Text)
	if not seed then return end
	
	local details = SEED_LOGIC.getDetails(seed)
	if not details then return end
	updateAppearance(viewport,details)
	updateDetails(viewport.desc,details,seed,viewport)
	
	if selected then
		local rec = HIST:TryBeginRecording("Change Bot Seed")
		if not rec then return end
		selected:SetAttribute("Seed",seed)
		HIST:FinishRecording(rec,Enum.FinishRecordingOperation.Commit)
	end
end

return module