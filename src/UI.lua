--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 
]=]


--had to edit this because inserting meshes through plugins is stupid???????
local function mesh(part,id)
	local s,r = pcall(function()
		return game:GetService("AssetService"):CreateMeshPartAsync(Content.fromAssetId(tonumber(id)),{CollisionFidelity = part.CollisionFidelity,RenderFidelity = part.RenderFidelity,})
	end)
	if not s then
		warn("FAILED TO LOAD MESH!!!!!!! (seedcalc plugin)",id,r)
		return false
	end
	local ss,rr = pcall(function() part:ApplyMesh(r) end)
	r:Destroy()
	if not ss then
		warn("FAILED TO LOAD MESH (seedcalc plugin)!!!!!!!",id,rr)
		return false
	end
	return true
end



-- Instances: 96 | Scripts: 0 | Modules: 0 | Tags: 0
local G2L = {};

-- ServerStorage.SeedCalculator
G2L["1"] = Instance.new("ScreenGui");
G2L["1"]["Name"] = [[SeedCalculator]];


-- ServerStorage.SeedCalculator.container
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["Active"] = true;
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["Selectable"] = true;
G2L["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["2"]["Size"] = UDim2.new(0, 200, 0, 230);
G2L["2"]["Position"] = UDim2.new(0.5, 110, 0.5, 0);
G2L["2"]["Name"] = [[container]];
G2L["2"]["BackgroundTransparency"] = 1;


-- ServerStorage.SeedCalculator.container.UIListLayout
G2L["3"] = Instance.new("UIListLayout", G2L["2"]);
G2L["3"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- ServerStorage.SeedCalculator.container.viewport
G2L["4"] = Instance.new("ViewportFrame", G2L["2"]);
G2L["4"]["Active"] = true;
G2L["4"]["BorderSizePixel"] = 0;
G2L["4"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4"]["Selectable"] = true;
G2L["4"]["Ambient"] = Color3.fromRGB(255, 255, 255);
G2L["4"]["LightColor"] = Color3.fromRGB(130, 130, 130);
G2L["4"]["LightDirection"] = Vector3.new(1, 5, 5);
G2L["4"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["4"]["Size"] = UDim2.new(0, 200, 0, 200);
G2L["4"]["Position"] = UDim2.new(0.5, 0, 0.4, 0);
G2L["4"]["Name"] = [[viewport]];
G2L["4"]["LayoutOrder"] = 1;
G2L["4"]["BackgroundTransparency"] = 0.25;


-- CoreGui.SeedCalculator.container.viewport.pivot
G2L["63"] = Instance.new("Part", G2L["4"]);
G2L["63"]["BottomSurface"] = Enum.SurfaceType.Smooth;
G2L["63"]["Transparency"] = 1;
G2L["63"]["TopSurface"] = Enum.SurfaceType.Smooth;
G2L["63"]["CFrame"] = CFrame.new(Vector3.new(2.1, 1, -2.05), Vector3.new(-0.68301, -0.25882, 0.68301));
G2L["63"]["Size"] = Vector3.new(0.001, 0.001, 0.001);
G2L["63"]["Rotation"] = Vector3.new(-159.246, 43.08, 165.489);
G2L["63"]["Name"] = [[pivot]];


-- ServerStorage.SeedCalculator.container.viewport.Camera
G2L["5"] = Instance.new("Camera", G2L["4"]);
G2L["5"]["FieldOfView"] = 45;
G2L["5"]["CFrame"] = G2L["63"]["CFrame"]


-- ServerStorage.SeedCalculator.container.viewport.name
G2L["6"] = Instance.new("TextLabel", G2L["4"]);
G2L["6"]["Active"] = true;
G2L["6"]["BorderSizePixel"] = 0;
G2L["6"]["TextSize"] = 20;
G2L["6"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6"]["FontFace"] = Font.new([[rbxasset://fonts/families/Zekton.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["6"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6"]["BackgroundTransparency"] = 1;
G2L["6"]["AnchorPoint"] = Vector2.new(0.5, 0);
G2L["6"]["Size"] = UDim2.new(0, 200, 0, 30);
G2L["6"]["Text"] = [[]];
G2L["6"]["LayoutOrder"] = -1;
G2L["6"]["Selectable"] = true;
G2L["6"]["Name"] = [[name]];
G2L["6"]["Position"] = UDim2.new(0.5, 0, 0, 0);


-- ServerStorage.SeedCalculator.container.viewport.desc
G2L["7"] = Instance.new("Frame", G2L["4"]);
G2L["7"]["Active"] = true;
G2L["7"]["Interactable"] = false;
G2L["7"]["BorderSizePixel"] = 0;
G2L["7"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["7"]["Selectable"] = true;
G2L["7"]["AnchorPoint"] = Vector2.new(1, 0.5);
G2L["7"]["Size"] = UDim2.new(0, 200, 0, 270);
G2L["7"]["Position"] = UDim2.new(-0.1, 0, 0.55, 0);
G2L["7"]["Name"] = [[desc]];
G2L["7"]["LayoutOrder"] = 99;
G2L["7"]["BackgroundTransparency"] = 1;


-- ServerStorage.SeedCalculator.container.viewport.desc.UIListLayout
G2L["8"] = Instance.new("UIListLayout", G2L["7"]);
G2L["8"]["Padding"] = UDim.new(0, 5);
G2L["8"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- ServerStorage.SeedCalculator.container.viewport.desc.haircolor
G2L["9"] = Instance.new("Frame", G2L["7"]);
G2L["9"]["Active"] = true;
G2L["9"]["BorderSizePixel"] = 0;
G2L["9"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["9"]["Selectable"] = true;
G2L["9"]["AnchorPoint"] = Vector2.new(0.5, 1);
G2L["9"]["Size"] = UDim2.new(0, 200, 0, 50);
G2L["9"]["Position"] = UDim2.new(0.5, 0, 1, 0);
G2L["9"]["Name"] = [[haircolor]];
G2L["9"]["LayoutOrder"] = 3;
G2L["9"]["BackgroundTransparency"] = 1;


-- ServerStorage.SeedCalculator.container.viewport.desc.haircolor.frame
G2L["a"] = Instance.new("Frame", G2L["9"]);
G2L["a"]["Active"] = true;
G2L["a"]["BorderSizePixel"] = 0;
G2L["a"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a"]["Selectable"] = true;
G2L["a"]["AnchorPoint"] = Vector2.new(0.5, 1);
G2L["a"]["Size"] = UDim2.new(0, 200, 0, 30);
G2L["a"]["Position"] = UDim2.new(0.5, 0, 1, 0);
G2L["a"]["Name"] = [[frame]];
G2L["a"]["LayoutOrder"] = -1;
G2L["a"]["BackgroundTransparency"] = 0.5;


-- ServerStorage.SeedCalculator.container.viewport.desc.haircolor.frame.text
G2L["b"] = Instance.new("TextLabel", G2L["a"]);
G2L["b"]["TextWrapped"] = true;
G2L["b"]["Active"] = true;
G2L["b"]["BorderSizePixel"] = 0;
G2L["b"]["TextSize"] = 20;
G2L["b"]["TextScaled"] = true;
G2L["b"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["b"]["FontFace"] = Font.new([[rbxasset://fonts/families/Zekton.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["b"]["BackgroundTransparency"] = 1;
G2L["b"]["AnchorPoint"] = Vector2.new(1, 0.5);
G2L["b"]["Size"] = UDim2.new(0.8, 0, 0.75, 0);
G2L["b"]["Text"] = [[255,255,255]];
G2L["b"]["LayoutOrder"] = -1;
G2L["b"]["Selectable"] = true;
G2L["b"]["Name"] = [[text]];
G2L["b"]["Position"] = UDim2.new(1, 0, 0.5, 0);


-- ServerStorage.SeedCalculator.container.viewport.desc.haircolor.frame.cf
G2L["c"] = Instance.new("Frame", G2L["a"]);
G2L["c"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY;
G2L["c"]["BorderSizePixel"] = 0;
G2L["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["c"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["c"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["c"]["Position"] = UDim2.new(0, 0, 0.5, 0);
G2L["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["c"]["Name"] = [[cf]];
G2L["c"]["BackgroundTransparency"] = 1;


-- ServerStorage.SeedCalculator.container.viewport.desc.haircolor.frame.cf.color
G2L["d"] = Instance.new("Frame", G2L["c"]);
G2L["d"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY;
G2L["d"]["BorderSizePixel"] = 0;
G2L["d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["d"]["Size"] = UDim2.new(0.8, 0, 0.8, 0);
G2L["d"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["d"]["Name"] = [[color]];


-- ServerStorage.SeedCalculator.container.viewport.desc.haircolor.text
G2L["e"] = Instance.new("TextLabel", G2L["9"]);
G2L["e"]["TextWrapped"] = true;
G2L["e"]["Active"] = true;
G2L["e"]["BorderSizePixel"] = 0;
G2L["e"]["TextSize"] = 20;
G2L["e"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["e"]["TextScaled"] = true;
G2L["e"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["e"]["FontFace"] = Font.new([[rbxasset://fonts/families/Zekton.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["e"]["BackgroundTransparency"] = 1;
G2L["e"]["Size"] = UDim2.new(1, 0, 0, 20);
G2L["e"]["Text"] = [[        Hair Color]];
G2L["e"]["LayoutOrder"] = -1;
G2L["e"]["Selectable"] = true;
G2L["e"]["Name"] = [[text]];


-- ServerStorage.SeedCalculator.container.viewport.desc.seed
G2L["f"] = Instance.new("Frame", G2L["7"]);
G2L["f"]["Active"] = true;
G2L["f"]["BorderSizePixel"] = 0;
G2L["f"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["f"]["Selectable"] = true;
G2L["f"]["AnchorPoint"] = Vector2.new(0.5, 1);
G2L["f"]["Size"] = UDim2.new(0, 200, 0, 50);
G2L["f"]["Position"] = UDim2.new(0.5, 0, 1, 0);
G2L["f"]["Name"] = [[seed]];
G2L["f"]["BackgroundTransparency"] = 1;


-- ServerStorage.SeedCalculator.container.viewport.desc.seed.frame
G2L["10"] = Instance.new("Frame", G2L["f"]);
G2L["10"]["Active"] = true;
G2L["10"]["BorderSizePixel"] = 0;
G2L["10"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["10"]["Selectable"] = true;
G2L["10"]["AnchorPoint"] = Vector2.new(0.5, 1);
G2L["10"]["Size"] = UDim2.new(0, 200, 0, 30);
G2L["10"]["Position"] = UDim2.new(0.5, 0, 1, 0);
G2L["10"]["Name"] = [[frame]];
G2L["10"]["LayoutOrder"] = -1;
G2L["10"]["BackgroundTransparency"] = 0.5;


-- ServerStorage.SeedCalculator.container.viewport.desc.seed.frame.text
G2L["11"] = Instance.new("TextLabel", G2L["10"]);
G2L["11"]["TextWrapped"] = true;
G2L["11"]["Active"] = true;
G2L["11"]["BorderSizePixel"] = 0;
G2L["11"]["TextSize"] = 20;
G2L["11"]["TextScaled"] = true;
G2L["11"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["11"]["FontFace"] = Font.new([[rbxasset://fonts/families/Zekton.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["11"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["11"]["BackgroundTransparency"] = 1;
G2L["11"]["AnchorPoint"] = Vector2.new(1, 0.5);
G2L["11"]["Size"] = UDim2.new(1, 0, 0.75, 0);
G2L["11"]["Text"] = [[???]];
G2L["11"]["LayoutOrder"] = -1;
G2L["11"]["Selectable"] = true;
G2L["11"]["Name"] = [[text]];
G2L["11"]["Position"] = UDim2.new(1, 0, 0.5, 0);


-- ServerStorage.SeedCalculator.container.viewport.desc.seed.text
G2L["12"] = Instance.new("TextLabel", G2L["f"]);
G2L["12"]["TextWrapped"] = true;
G2L["12"]["Active"] = true;
G2L["12"]["BorderSizePixel"] = 0;
G2L["12"]["TextSize"] = 20;
G2L["12"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["12"]["TextScaled"] = true;
G2L["12"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["12"]["FontFace"] = Font.new([[rbxasset://fonts/families/Zekton.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["12"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["12"]["BackgroundTransparency"] = 1;
G2L["12"]["Size"] = UDim2.new(1, 0, 0, 20);
G2L["12"]["Text"] = [[        Seed]];
G2L["12"]["LayoutOrder"] = -1;
G2L["12"]["Selectable"] = true;
G2L["12"]["Name"] = [[text]];


-- ServerStorage.SeedCalculator.container.viewport.desc.beardstyle
G2L["13"] = Instance.new("Frame", G2L["7"]);
G2L["13"]["Active"] = true;
G2L["13"]["BorderSizePixel"] = 0;
G2L["13"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["13"]["Selectable"] = true;
G2L["13"]["AnchorPoint"] = Vector2.new(0.5, 1);
G2L["13"]["Size"] = UDim2.new(0, 200, 0, 50);
G2L["13"]["Position"] = UDim2.new(0.5, 0, 1, 0);
G2L["13"]["Name"] = [[beardstyle]];
G2L["13"]["LayoutOrder"] = 2;
G2L["13"]["BackgroundTransparency"] = 1;


-- ServerStorage.SeedCalculator.container.viewport.desc.beardstyle.frame
G2L["14"] = Instance.new("Frame", G2L["13"]);
G2L["14"]["Active"] = true;
G2L["14"]["BorderSizePixel"] = 0;
G2L["14"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["14"]["Selectable"] = true;
G2L["14"]["AnchorPoint"] = Vector2.new(0.5, 1);
G2L["14"]["Size"] = UDim2.new(0, 200, 0, 30);
G2L["14"]["Position"] = UDim2.new(0.5, 0, 1, 0);
G2L["14"]["Name"] = [[frame]];
G2L["14"]["LayoutOrder"] = -1;
G2L["14"]["BackgroundTransparency"] = 0.5;


-- ServerStorage.SeedCalculator.container.viewport.desc.beardstyle.frame.text
G2L["15"] = Instance.new("TextLabel", G2L["14"]);
G2L["15"]["TextWrapped"] = true;
G2L["15"]["Active"] = true;
G2L["15"]["BorderSizePixel"] = 0;
G2L["15"]["TextSize"] = 20;
G2L["15"]["TextScaled"] = true;
G2L["15"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["15"]["FontFace"] = Font.new([[rbxasset://fonts/families/Zekton.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["15"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["15"]["BackgroundTransparency"] = 1;
G2L["15"]["AnchorPoint"] = Vector2.new(1, 0.5);
G2L["15"]["Size"] = UDim2.new(0.8, 0, 0.75, 0);
G2L["15"]["Text"] = [[???]];
G2L["15"]["LayoutOrder"] = -1;
G2L["15"]["Selectable"] = true;
G2L["15"]["Name"] = [[text]];
G2L["15"]["Position"] = UDim2.new(1, 0, 0.5, 0);


-- ServerStorage.SeedCalculator.container.viewport.desc.beardstyle.frame.vf
G2L["16"] = Instance.new("ViewportFrame", G2L["14"]);
G2L["16"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY;
G2L["16"]["BorderSizePixel"] = 0;
G2L["16"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["16"]["LightColor"] = Color3.fromRGB(255, 255, 255);
G2L["16"]["LightDirection"] = Vector3.new(1, 1, 3);
G2L["16"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["16"]["Ambient"] = Color3.fromRGB(151, 151, 151);
G2L["16"]["Size"] = UDim2.new(1.5, 0, 1.5, 0);
G2L["16"]["Position"] = UDim2.new(0, 0, 0.5, 0);
G2L["16"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["16"]["Name"] = [[vf]];
G2L["16"]["BackgroundTransparency"] = 1;


-- ServerStorage.SeedCalculator.container.viewport.desc.beardstyle.text
G2L["17"] = Instance.new("TextLabel", G2L["13"]);
G2L["17"]["TextWrapped"] = true;
G2L["17"]["Active"] = true;
G2L["17"]["BorderSizePixel"] = 0;
G2L["17"]["TextSize"] = 20;
G2L["17"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["17"]["TextScaled"] = true;
G2L["17"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["17"]["FontFace"] = Font.new([[rbxasset://fonts/families/Zekton.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["17"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["17"]["BackgroundTransparency"] = 1;
G2L["17"]["RichText"] = true;
G2L["17"]["Size"] = UDim2.new(1, 0, 0, 20);
G2L["17"]["Text"] = [[        Beard Style]];
G2L["17"]["LayoutOrder"] = -1;
G2L["17"]["Selectable"] = true;
G2L["17"]["Name"] = [[text]];


-- ServerStorage.SeedCalculator.container.viewport.desc.skincolor
G2L["18"] = Instance.new("Frame", G2L["7"]);
G2L["18"]["Active"] = true;
G2L["18"]["BorderSizePixel"] = 0;
G2L["18"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["18"]["Selectable"] = true;
G2L["18"]["AnchorPoint"] = Vector2.new(0.5, 1);
G2L["18"]["Size"] = UDim2.new(0, 200, 0, 50);
G2L["18"]["Position"] = UDim2.new(0.5, 0, 1, 0);
G2L["18"]["Name"] = [[skincolor]];
G2L["18"]["LayoutOrder"] = 4;
G2L["18"]["BackgroundTransparency"] = 1;


-- ServerStorage.SeedCalculator.container.viewport.desc.skincolor.frame
G2L["19"] = Instance.new("Frame", G2L["18"]);
G2L["19"]["Active"] = true;
G2L["19"]["BorderSizePixel"] = 0;
G2L["19"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["19"]["Selectable"] = true;
G2L["19"]["AnchorPoint"] = Vector2.new(0.5, 1);
G2L["19"]["Size"] = UDim2.new(0, 200, 0, 30);
G2L["19"]["Position"] = UDim2.new(0.5, 0, 1, 0);
G2L["19"]["Name"] = [[frame]];
G2L["19"]["LayoutOrder"] = -1;
G2L["19"]["BackgroundTransparency"] = 0.5;


-- ServerStorage.SeedCalculator.container.viewport.desc.skincolor.frame.text
G2L["1a"] = Instance.new("TextLabel", G2L["19"]);
G2L["1a"]["TextWrapped"] = true;
G2L["1a"]["Active"] = true;
G2L["1a"]["BorderSizePixel"] = 0;
G2L["1a"]["TextSize"] = 20;
G2L["1a"]["TextScaled"] = true;
G2L["1a"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1a"]["FontFace"] = Font.new([[rbxasset://fonts/families/Zekton.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["1a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1a"]["BackgroundTransparency"] = 1;
G2L["1a"]["AnchorPoint"] = Vector2.new(1, 0.5);
G2L["1a"]["Size"] = UDim2.new(0.8, 0, 0.75, 0);
G2L["1a"]["Text"] = [[255,255,255]];
G2L["1a"]["LayoutOrder"] = -1;
G2L["1a"]["Selectable"] = true;
G2L["1a"]["Name"] = [[text]];
G2L["1a"]["Position"] = UDim2.new(1, 0, 0.5, 0);


-- ServerStorage.SeedCalculator.container.viewport.desc.skincolor.frame.cf
G2L["1b"] = Instance.new("Frame", G2L["19"]);
G2L["1b"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY;
G2L["1b"]["BorderSizePixel"] = 0;
G2L["1b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1b"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["1b"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["1b"]["Position"] = UDim2.new(0, 0, 0.5, 0);
G2L["1b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1b"]["Name"] = [[cf]];
G2L["1b"]["BackgroundTransparency"] = 1;


-- ServerStorage.SeedCalculator.container.viewport.desc.skincolor.frame.cf.color
G2L["1c"] = Instance.new("Frame", G2L["1b"]);
G2L["1c"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY;
G2L["1c"]["BorderSizePixel"] = 0;
G2L["1c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["1c"]["Size"] = UDim2.new(0.8, 0, 0.8, 0);
G2L["1c"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1c"]["Name"] = [[color]];


-- ServerStorage.SeedCalculator.container.viewport.desc.skincolor.text
G2L["1d"] = Instance.new("TextLabel", G2L["18"]);
G2L["1d"]["TextWrapped"] = true;
G2L["1d"]["Active"] = true;
G2L["1d"]["BorderSizePixel"] = 0;
G2L["1d"]["TextSize"] = 20;
G2L["1d"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["1d"]["TextScaled"] = true;
G2L["1d"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1d"]["FontFace"] = Font.new([[rbxasset://fonts/families/Zekton.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["1d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1d"]["BackgroundTransparency"] = 1;
G2L["1d"]["Size"] = UDim2.new(1, 0, 0, 20);
G2L["1d"]["Text"] = [[        Skin Color]];
G2L["1d"]["LayoutOrder"] = -1;
G2L["1d"]["Selectable"] = true;
G2L["1d"]["Name"] = [[text]];


-- ServerStorage.SeedCalculator.container.viewport.desc.hairstyle
G2L["1e"] = Instance.new("Frame", G2L["7"]);
G2L["1e"]["Active"] = true;
G2L["1e"]["BorderSizePixel"] = 0;
G2L["1e"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1e"]["Selectable"] = true;
G2L["1e"]["AnchorPoint"] = Vector2.new(0.5, 1);
G2L["1e"]["Size"] = UDim2.new(0, 200, 0, 50);
G2L["1e"]["Position"] = UDim2.new(0.5, 0, 1, 0);
G2L["1e"]["Name"] = [[hairstyle]];
G2L["1e"]["LayoutOrder"] = 1;
G2L["1e"]["BackgroundTransparency"] = 1;


-- ServerStorage.SeedCalculator.container.viewport.desc.hairstyle.frame
G2L["1f"] = Instance.new("Frame", G2L["1e"]);
G2L["1f"]["Active"] = true;
G2L["1f"]["BorderSizePixel"] = 0;
G2L["1f"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1f"]["Selectable"] = true;
G2L["1f"]["AnchorPoint"] = Vector2.new(0.5, 1);
G2L["1f"]["Size"] = UDim2.new(0, 200, 0, 30);
G2L["1f"]["Position"] = UDim2.new(0.5, 0, 1, 0);
G2L["1f"]["Name"] = [[frame]];
G2L["1f"]["LayoutOrder"] = -1;
G2L["1f"]["BackgroundTransparency"] = 0.5;


-- ServerStorage.SeedCalculator.container.viewport.desc.hairstyle.frame.text
G2L["20"] = Instance.new("TextLabel", G2L["1f"]);
G2L["20"]["TextWrapped"] = true;
G2L["20"]["Active"] = true;
G2L["20"]["BorderSizePixel"] = 0;
G2L["20"]["TextSize"] = 20;
G2L["20"]["TextScaled"] = true;
G2L["20"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["20"]["FontFace"] = Font.new([[rbxasset://fonts/families/Zekton.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["20"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["20"]["BackgroundTransparency"] = 1;
G2L["20"]["AnchorPoint"] = Vector2.new(1, 0.5);
G2L["20"]["Size"] = UDim2.new(0.8, 0, 0.75, 0);
G2L["20"]["Text"] = [[???]];
G2L["20"]["LayoutOrder"] = -1;
G2L["20"]["Selectable"] = true;
G2L["20"]["Name"] = [[text]];
G2L["20"]["Position"] = UDim2.new(1, 0, 0.5, 0);


-- ServerStorage.SeedCalculator.container.viewport.desc.hairstyle.frame.vf
G2L["21"] = Instance.new("ViewportFrame", G2L["1f"]);
G2L["21"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY;
G2L["21"]["BorderSizePixel"] = 0;
G2L["21"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["21"]["LightColor"] = Color3.fromRGB(255, 255, 255);
G2L["21"]["LightDirection"] = Vector3.new(1, 1, 3);
G2L["21"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["21"]["Ambient"] = Color3.fromRGB(151, 151, 151);
G2L["21"]["Size"] = UDim2.new(1.5, 0, 1.5, 0);
G2L["21"]["Position"] = UDim2.new(0, 0, 0.5, 0);
G2L["21"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["21"]["Name"] = [[vf]];
G2L["21"]["BackgroundTransparency"] = 1;


-- ServerStorage.SeedCalculator.container.viewport.desc.hairstyle.text
G2L["22"] = Instance.new("TextLabel", G2L["1e"]);
G2L["22"]["TextWrapped"] = true;
G2L["22"]["Active"] = true;
G2L["22"]["BorderSizePixel"] = 0;
G2L["22"]["TextSize"] = 20;
G2L["22"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["22"]["TextScaled"] = true;
G2L["22"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["22"]["FontFace"] = Font.new([[rbxasset://fonts/families/Zekton.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["22"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["22"]["BackgroundTransparency"] = 1;
G2L["22"]["Size"] = UDim2.new(1, 0, 0, 20);
G2L["22"]["Text"] = [[        Hair Style]];
G2L["22"]["LayoutOrder"] = -1;
G2L["22"]["Selectable"] = true;
G2L["22"]["Name"] = [[text]];


-- ServerStorage.SeedCalculator.container.viewport.thing
G2L["23"] = Instance.new("ImageButton", G2L["4"]);
G2L["23"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY;
G2L["23"]["BorderSizePixel"] = 0;
G2L["23"]["BackgroundTransparency"] = 0.5;
G2L["23"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["23"]["AnchorPoint"] = Vector2.new(1, 0);
G2L["23"]["Image"] = [[http://www.roblox.com/asset/?id=6031154871]];
G2L["23"]["Size"] = UDim2.new(0.15, 0, 0.15, 0);
G2L["23"]["LayoutOrder"] = -1;
G2L["23"]["Name"] = [[thing]];
G2L["23"]["Position"] = UDim2.new(1, 0, 0, 0);


-- ServerStorage.SeedCalculator.container.viewport.beard
G2L["24"] = Instance.new("Folder", G2L["4"]);
G2L["24"]["Name"] = [[beard]];


-- ServerStorage.SeedCalculator.container.viewport.beard.Thin
G2L["25"] = Instance.new("MeshPart", G2L["24"]);
G2L["25"]["CFrame"] = CFrame.new(Vector3.new(-0.47198, -0.11037, 0.33184), Vector3.new(0.34202, -0, -0.93969));
mesh(G2L["25"], 1031232539);
G2L["25"]["CollisionFidelity"] = Enum.CollisionFidelity.Default;
G2L["25"]["Size"] = Vector3.new(1.27603, 0.8969, 0.7409);
-- [ERROR] cannot convert BrickColor, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["25"]["Color"] = Color3.fromRGB(255, 255, 255);
G2L["25"]["Rotation"] = Vector3.new(0, -20, 0);
G2L["25"]["Name"] = [[Thin]];
G2L["25"]["CastShadow"] = false;


-- ServerStorage.SeedCalculator.container.viewport.beard.Trimmed
G2L["26"] = Instance.new("MeshPart", G2L["24"]);
G2L["26"]["CFrame"] = CFrame.new(Vector3.new(-0.50078, -0.11037, 0.41097), Vector3.new(0.34202, -0, -0.93969));
mesh(G2L["26"], 1031110014);
G2L["26"]["CollisionFidelity"] = Enum.CollisionFidelity.Default;
G2L["26"]["Size"] = Vector3.new(1.26733, 1.08571, 0.95459);
-- [ERROR] cannot convert BrickColor, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["26"]["Color"] = Color3.fromRGB(255, 255, 255);
G2L["26"]["Rotation"] = Vector3.new(0, -20, 0);
G2L["26"]["Name"] = [[Trimmed]];
G2L["26"]["CastShadow"] = false;


-- ServerStorage.SeedCalculator.container.viewport.beard.Neat
G2L["27"] = Instance.new("MeshPart", G2L["24"]);
G2L["27"]["CFrame"] = CFrame.new(Vector3.new(-0.48724, -0.18044, 0.37376), Vector3.new(0.34202, -0, -0.93969));
mesh(G2L["27"], 1012251543);
G2L["27"]["CollisionFidelity"] = Enum.CollisionFidelity.Default;
G2L["27"]["Size"] = Vector3.new(1.33717, 0.93614, 0.95896);
-- [ERROR] cannot convert BrickColor, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["27"]["Color"] = Color3.fromRGB(255, 255, 255);
G2L["27"]["Rotation"] = Vector3.new(0, -20, 0);
G2L["27"]["Name"] = [[Neat]];
G2L["27"]["CastShadow"] = false;


-- ServerStorage.SeedCalculator.container.viewport.beard.none
G2L["28"] = Instance.new("MeshPart", G2L["24"]);
G2L["28"]["CFrame"] = CFrame.new(Vector3.new(-0.48724, -0.18044, 0.37376), Vector3.new(0.34202, -0, -0.93969));
G2L["28"]["CollisionFidelity"] = Enum.CollisionFidelity.Default;
G2L["28"]["Size"] = Vector3.new(0.001, 0.001, 0.001);
-- [ERROR] cannot convert BrickColor, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["28"]["Color"] = Color3.fromRGB(255, 255, 255);
G2L["28"]["Rotation"] = Vector3.new(0, -20, 0);
G2L["28"]["Name"] = [[none]];
G2L["28"]["CastShadow"] = false;


-- ServerStorage.SeedCalculator.container.viewport.hair
G2L["29"] = Instance.new("Folder", G2L["4"]);
G2L["29"]["Name"] = [[hair]];


-- ServerStorage.SeedCalculator.container.viewport.hair.Animazing
G2L["2a"] = Instance.new("MeshPart", G2L["29"]);
G2L["2a"]["CFrame"] = CFrame.new(Vector3.new(-0.56744, -0.15064, 0.72901), Vector3.new(0.34202, -0, -0.93969));
mesh(G2L["2a"], 167554431);
G2L["2a"]["CollisionFidelity"] = Enum.CollisionFidelity.Default;
G2L["2a"]["Size"] = Vector3.new(2.31345, 2.12714, 1.86391);
-- [ERROR] cannot convert BrickColor, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["2a"]["Color"] = Color3.fromRGB(255, 255, 255);
G2L["2a"]["Rotation"] = Vector3.new(0, -20, 0);
G2L["2a"]["Name"] = [[Animazing]];
G2L["2a"]["CastShadow"] = false;


-- ServerStorage.SeedCalculator.container.viewport.hair.Wolfish
G2L["2b"] = Instance.new("MeshPart", G2L["29"]);
G2L["2b"]["CFrame"] = CFrame.new(Vector3.new(-0.47958, -0.26003, 0.64512), Vector3.new(-0.34202, -0, 0.93969));
mesh(G2L["2b"], 115676803194733);
G2L["2b"]["CollisionFidelity"] = Enum.CollisionFidelity.Default;
G2L["2b"]["Size"] = Vector3.new(1.60386, 2.13046, 1.40622);
-- [ERROR] cannot convert BrickColor, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["2b"]["Color"] = Color3.fromRGB(255, 255, 255);
G2L["2b"]["Rotation"] = Vector3.new(180, 20, 180);
G2L["2b"]["Name"] = [[Wolfish]];
G2L["2b"]["CastShadow"] = false;


-- ServerStorage.SeedCalculator.container.viewport.hair.Wild
G2L["2c"] = Instance.new("MeshPart", G2L["29"]);
G2L["2c"]["CFrame"] = CFrame.new(Vector3.new(-0.47018, 0.09025, 0.61928), Vector3.new(-0.34202, -0, 0.93969));
mesh(G2L["2c"], 120725632757577);
G2L["2c"]["CollisionFidelity"] = Enum.CollisionFidelity.Default;
G2L["2c"]["Size"] = Vector3.new(1.77895, 1.51652, 1.70384);
-- [ERROR] cannot convert BrickColor, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["2c"]["Color"] = Color3.fromRGB(255, 255, 255);
G2L["2c"]["Rotation"] = Vector3.new(180, 20, 180);
G2L["2c"]["Name"] = [[Wild]];
G2L["2c"]["CastShadow"] = false;


-- ServerStorage.SeedCalculator.container.viewport.hair.Wavy
G2L["2d"] = Instance.new("MeshPart", G2L["29"]);
G2L["2d"]["CFrame"] = CFrame.new(Vector3.new(-0.59962, -0.17663, 0.68254), Vector3.new(-0.34202, -0, 0.93969));
mesh(G2L["2d"], 76662915428174);
G2L["2d"]["CollisionFidelity"] = Enum.CollisionFidelity.Default;
G2L["2d"]["Size"] = Vector3.new(1.65598, 1.93661, 1.55484);
-- [ERROR] cannot convert BrickColor, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["2d"]["Color"] = Color3.fromRGB(255, 255, 255);
G2L["2d"]["Rotation"] = Vector3.new(180, 20, 180);
G2L["2d"]["Name"] = [[Wavy]];
G2L["2d"]["CastShadow"] = false;


-- ServerStorage.SeedCalculator.container.viewport.hair.Anime
G2L["2e"] = Instance.new("MeshPart", G2L["29"]);
G2L["2e"]["CFrame"] = CFrame.new(Vector3.new(-0.5733, -0.65166, 0.61022), Vector3.new(0.34202, -0, -0.93969));
mesh(G2L["2e"], 164382853);
G2L["2e"]["CollisionFidelity"] = Enum.CollisionFidelity.Default;
G2L["2e"]["Size"] = Vector3.new(1.61715, 2.79985, 1.59274);
-- [ERROR] cannot convert BrickColor, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["2e"]["Color"] = Color3.fromRGB(255, 255, 255);
G2L["2e"]["Rotation"] = Vector3.new(0, -20, 0);
G2L["2e"]["Name"] = [[Anime]];
G2L["2e"]["CastShadow"] = false;


-- ServerStorage.SeedCalculator.container.viewport.hair.Bob
G2L["2f"] = Instance.new("MeshPart", G2L["29"]);
G2L["2f"]["CFrame"] = CFrame.new(Vector3.new(-0.5501, 0.13407, 0.54648), Vector3.new(0.34202, -0, -0.93969));
mesh(G2L["2f"], 45916884);
G2L["2f"]["CollisionFidelity"] = Enum.CollisionFidelity.Default;
G2L["2f"]["Size"] = Vector3.new(1.43352, 1.47056, 1.39843);
-- [ERROR] cannot convert BrickColor, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["2f"]["Color"] = Color3.fromRGB(255, 255, 255);
G2L["2f"]["Rotation"] = Vector3.new(0, -20, 0);
G2L["2f"]["Name"] = [[Bob]];
G2L["2f"]["CastShadow"] = false;


-- ServerStorage.SeedCalculator.container.viewport.hair.Spiky
G2L["30"] = Instance.new("MeshPart", G2L["29"]);
G2L["30"]["CFrame"] = CFrame.new(Vector3.new(-0.3813, 0.31711, 0.54637), Vector3.new(-0.34202, -0, 0.93969));
mesh(G2L["30"], 129267608173297);
G2L["30"]["CollisionFidelity"] = Enum.CollisionFidelity.Default;
G2L["30"]["Size"] = Vector3.new(1.744, 1.54185, 1.44679);
-- [ERROR] cannot convert BrickColor, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["30"]["Color"] = Color3.fromRGB(255, 255, 255);
G2L["30"]["Rotation"] = Vector3.new(180, 20, 180);
G2L["30"]["Name"] = [[Spiky]];
G2L["30"]["CastShadow"] = false;


-- ServerStorage.SeedCalculator.container.viewport.hair.Short
G2L["31"] = Instance.new("MeshPart", G2L["29"]);
G2L["31"]["CFrame"] = CFrame.new(Vector3.new(-0.59962, 0.04325, 0.68254), Vector3.new(-0.34202, -0, 0.93969));
mesh(G2L["31"], 73721909901454);
G2L["31"]["CollisionFidelity"] = Enum.CollisionFidelity.Default;
G2L["31"]["Size"] = Vector3.new(1.54789, 1.73294, 1.6673);
-- [ERROR] cannot convert BrickColor, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["31"]["Color"] = Color3.fromRGB(255, 255, 255);
G2L["31"]["Rotation"] = Vector3.new(180, 20, 180);
G2L["31"]["Name"] = [[Short]];
G2L["31"]["CastShadow"] = false;


-- ServerStorage.SeedCalculator.container.viewport.hair.Shaggy
G2L["32"] = Instance.new("MeshPart", G2L["29"]);
G2L["32"]["CFrame"] = CFrame.new(Vector3.new(-0.6419, 0.18082, 0.56897), Vector3.new(-0.34202, -0, 0.93969));
mesh(G2L["32"], 122751055183151);
G2L["32"]["CollisionFidelity"] = Enum.CollisionFidelity.Default;
G2L["32"]["Size"] = Vector3.new(1.49762, 1.20722, 1.53136);
-- [ERROR] cannot convert BrickColor, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["32"]["Color"] = Color3.fromRGB(255, 255, 255);
G2L["32"]["Rotation"] = Vector3.new(180, 20, 180);
G2L["32"]["Name"] = [[Shaggy]];
G2L["32"]["CastShadow"] = false;


-- ServerStorage.SeedCalculator.container.viewport.hair.Popstar
G2L["33"] = Instance.new("MeshPart", G2L["29"]);
G2L["33"]["CFrame"] = CFrame.new(Vector3.new(-0.5501, 0.20317, 0.54648), Vector3.new(0.34202, -0, -0.93969));
mesh(G2L["33"], 726889242);
G2L["33"]["CollisionFidelity"] = Enum.CollisionFidelity.Default;
G2L["33"]["Size"] = Vector3.new(1.35382, 1.27426, 1.72042);
-- [ERROR] cannot convert BrickColor, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["33"]["Color"] = Color3.fromRGB(255, 255, 255);
G2L["33"]["Rotation"] = Vector3.new(0, -20, 0);
G2L["33"]["Name"] = [[Popstar]];
G2L["33"]["CastShadow"] = false;


-- ServerStorage.SeedCalculator.container.viewport.hair.Ponytail
G2L["34"] = Instance.new("MeshPart", G2L["29"]);
G2L["34"]["CFrame"] = CFrame.new(Vector3.new(-0.52306, -0.12944, 0.55632), Vector3.new(0.34202, -0, -0.93969));
mesh(G2L["34"], 304123880);
G2L["34"]["CollisionFidelity"] = Enum.CollisionFidelity.Default;
G2L["34"]["Size"] = Vector3.new(1.63494, 1.72962, 1.53599);
-- [ERROR] cannot convert BrickColor, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["34"]["Color"] = Color3.fromRGB(255, 255, 255);
G2L["34"]["Rotation"] = Vector3.new(0, -20, 0);
G2L["34"]["Name"] = [[Ponytail]];
G2L["34"]["CastShadow"] = false;


-- ServerStorage.SeedCalculator.container.viewport.hair.Neat
G2L["35"] = Instance.new("MeshPart", G2L["29"]);
G2L["35"]["CFrame"] = CFrame.new(Vector3.new(-0.56602, 0.20828, 0.57244), Vector3.new(-0.34202, -0, 0.93969));
mesh(G2L["35"], 108824251251669);
G2L["35"]["CollisionFidelity"] = Enum.CollisionFidelity.Default;
G2L["35"]["Size"] = Vector3.new(1.1689, 1.16038, 1.24029);
-- [ERROR] cannot convert BrickColor, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["35"]["Color"] = Color3.fromRGB(255, 255, 255);
G2L["35"]["Rotation"] = Vector3.new(180, 20, 180);
G2L["35"]["Name"] = [[Neat]];
G2L["35"]["CastShadow"] = false;


-- ServerStorage.SeedCalculator.container.viewport.hair.MessyWavy
G2L["36"] = Instance.new("MeshPart", G2L["29"]);
G2L["36"]["CFrame"] = CFrame.new(Vector3.new(-0.5501, 0.20828, 0.54648), Vector3.new(-0.34202, -0, 0.93969));
mesh(G2L["36"], 85783762802903);
G2L["36"]["CollisionFidelity"] = Enum.CollisionFidelity.Default;
G2L["36"]["Size"] = Vector3.new(1.69112, 1.2944, 1.54074);
-- [ERROR] cannot convert BrickColor, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["36"]["Color"] = Color3.fromRGB(255, 255, 255);
G2L["36"]["Rotation"] = Vector3.new(180, 20, 180);
G2L["36"]["Name"] = [[MessyWavy]];
G2L["36"]["CastShadow"] = false;


-- ServerStorage.SeedCalculator.container.viewport.hair.Long
G2L["37"] = Instance.new("MeshPart", G2L["29"]);
G2L["37"]["CFrame"] = CFrame.new(Vector3.new(-0.55762, -0.34172, 0.56713), Vector3.new(-0.34202, -0, 0.93969));
mesh(G2L["37"], 127185046348440);
G2L["37"]["CollisionFidelity"] = Enum.CollisionFidelity.Default;
G2L["37"]["Size"] = Vector3.new(1.50858, 2.41085, 1.63736);
-- [ERROR] cannot convert BrickColor, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["37"]["Color"] = Color3.fromRGB(255, 255, 255);
G2L["37"]["Rotation"] = Vector3.new(180, 20, 180);
G2L["37"]["Name"] = [[Long]];
G2L["37"]["CastShadow"] = false;


-- ServerStorage.SeedCalculator.container.viewport.hair.Fluffed
G2L["38"] = Instance.new("MeshPart", G2L["29"]);
G2L["38"]["CFrame"] = CFrame.new(Vector3.new(-0.54326, 0.25604, 0.59228), Vector3.new(-0.34202, -0, 0.93969));
mesh(G2L["38"], 129190076061368);
G2L["38"]["CollisionFidelity"] = Enum.CollisionFidelity.Default;
G2L["38"]["Size"] = Vector3.new(1.28508, 1.47564, 1.30786);
-- [ERROR] cannot convert BrickColor, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["38"]["Color"] = Color3.fromRGB(255, 255, 255);
G2L["38"]["Rotation"] = Vector3.new(180, 20, 180);
G2L["38"]["Name"] = [[Fluffed]];
G2L["38"]["CastShadow"] = false;


-- ServerStorage.SeedCalculator.container.viewport.hair.Dreamy
G2L["39"] = Instance.new("MeshPart", G2L["29"]);
G2L["39"]["CFrame"] = CFrame.new(Vector3.new(-0.5529, 0.20828, 0.55418), Vector3.new(0.34202, -0, -0.93969));
mesh(G2L["39"], 167549828);
G2L["39"]["CollisionFidelity"] = Enum.CollisionFidelity.Default;
G2L["39"]["Size"] = Vector3.new(1.80839, 1.11937, 1.49779);
-- [ERROR] cannot convert BrickColor, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["39"]["Color"] = Color3.fromRGB(255, 255, 255);
G2L["39"]["Rotation"] = Vector3.new(0, -20, 0);
G2L["39"]["Name"] = [[Dreamy]];
G2L["39"]["CastShadow"] = false;


-- ServerStorage.SeedCalculator.container.viewport.hair.Drama
G2L["3a"] = Instance.new("MeshPart", G2L["29"]);
G2L["3a"]["CFrame"] = CFrame.new(Vector3.new(-0.60132, -0.17664, 0.68721), Vector3.new(0.34202, -0, -0.93969));
mesh(G2L["3a"], 283714534);
G2L["3a"]["CollisionFidelity"] = Enum.CollisionFidelity.Default;
G2L["3a"]["Size"] = Vector3.new(1.97477, 2.29381, 1.55868);
-- [ERROR] cannot convert BrickColor, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["3a"]["Color"] = Color3.fromRGB(255, 255, 255);
G2L["3a"]["Rotation"] = Vector3.new(0, -20, 0);
G2L["3a"]["Name"] = [[Drama]];
G2L["3a"]["CastShadow"] = false;


-- ServerStorage.SeedCalculator.container.viewport.hair.Dev
G2L["3b"] = Instance.new("MeshPart", G2L["29"]);
G2L["3b"]["CFrame"] = CFrame.new(Vector3.new(-0.51583, 0.23982, 0.55895), Vector3.new(-0.34202, -0, 0.93969));
mesh(G2L["3b"], 79288739524097);
G2L["3b"]["CollisionFidelity"] = Enum.CollisionFidelity.Default;
G2L["3b"]["Size"] = Vector3.new(1.47644, 1.36031, 1.38781);
-- [ERROR] cannot convert BrickColor, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["3b"]["Color"] = Color3.fromRGB(255, 255, 255);
G2L["3b"]["Rotation"] = Vector3.new(180, 20, 180);
G2L["3b"]["Name"] = [[Dev]];
G2L["3b"]["CastShadow"] = false;


-- ServerStorage.SeedCalculator.container.viewport.hair.Cropped
G2L["3c"] = Instance.new("MeshPart", G2L["29"]);
G2L["3c"]["CFrame"] = CFrame.new(Vector3.new(-0.5501, -0.284, 0.54648), Vector3.new(0.34202, -0, -0.93969));
mesh(G2L["3c"], 319641131);
G2L["3c"]["CollisionFidelity"] = Enum.CollisionFidelity.Default;
G2L["3c"]["Size"] = Vector3.new(1.42163, 2.00631, 1.34697);
-- [ERROR] cannot convert BrickColor, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["3c"]["Color"] = Color3.fromRGB(255, 255, 255);
G2L["3c"]["Rotation"] = Vector3.new(0, -20, 0);
G2L["3c"]["Name"] = [[Cropped]];
G2L["3c"]["CastShadow"] = false;


-- ServerStorage.SeedCalculator.container.viewport.hair.Cool
G2L["3d"] = Instance.new("MeshPart", G2L["29"]);
G2L["3d"]["CFrame"] = CFrame.new(Vector3.new(-0.53632, 0.20828, 0.50862), Vector3.new(0.34202, -0, -0.93969));
mesh(G2L["3d"], 159130717);
G2L["3d"]["CollisionFidelity"] = Enum.CollisionFidelity.Default;
G2L["3d"]["Size"] = Vector3.new(1.3549, 1.209, 1.49487);
-- [ERROR] cannot convert BrickColor, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["3d"]["Color"] = Color3.fromRGB(255, 255, 255);
G2L["3d"]["Rotation"] = Vector3.new(0, -20, 0);
G2L["3d"]["Name"] = [[Cool]];
G2L["3d"]["CastShadow"] = false;


-- ServerStorage.SeedCalculator.container.viewport.hair.Classic
G2L["3e"] = Instance.new("MeshPart", G2L["29"]);
G2L["3e"]["CFrame"] = CFrame.new(Vector3.new(-0.60656, -0.2796, 0.7016), Vector3.new(-0.34202, -0, 0.93969));
mesh(G2L["3e"], 136879510045773);
G2L["3e"]["CollisionFidelity"] = Enum.CollisionFidelity.Default;
G2L["3e"]["Size"] = Vector3.new(1.31327, 2.28439, 1.51492);
-- [ERROR] cannot convert BrickColor, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["3e"]["Color"] = Color3.fromRGB(255, 255, 255);
G2L["3e"]["Rotation"] = Vector3.new(180, 20, 180);
G2L["3e"]["Name"] = [[Classic]];
G2L["3e"]["CastShadow"] = false;


-- ServerStorage.SeedCalculator.container.viewport.hair.Charmer
G2L["3f"] = Instance.new("MeshPart", G2L["29"]);
G2L["3f"]["CFrame"] = CFrame.new(Vector3.new(-0.53616, 0.28948, 0.50818), Vector3.new(0.34202, -0, -0.93969));
mesh(G2L["3f"], 74878559);
G2L["3f"]["CollisionFidelity"] = Enum.CollisionFidelity.Default;
G2L["3f"]["Size"] = Vector3.new(1.23988, 1.07031, 1.51518);
-- [ERROR] cannot convert BrickColor, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["3f"]["Color"] = Color3.fromRGB(255, 255, 255);
G2L["3f"]["Rotation"] = Vector3.new(0, -20, 0);
G2L["3f"]["Name"] = [[Charmer]];
G2L["3f"]["CastShadow"] = false;


-- ServerStorage.SeedCalculator.container.viewport.Head
G2L["40"] = Instance.new("Part", G2L["4"]);
G2L["40"]["BottomSurface"] = Enum.SurfaceType.Smooth;
G2L["40"]["CollisionGroup"] = [[ClientCharacter]];
G2L["40"]["EnableFluidForces"] = false;
G2L["40"]["TopSurface"] = Enum.SurfaceType.Smooth;
G2L["40"]["CFrame"] = CFrame.new(Vector3.new(-0.5501, -0.04172, 0.54648), Vector3.new(0.34202, -0, -0.93969));
G2L["40"]["Size"] = Vector3.new(2, 1, 1);
-- [ERROR] cannot convert BrickColor, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["40"]["Color"] = Color3.fromRGB(255, 255, 255);
G2L["40"]["Rotation"] = Vector3.new(0, -20, 0);
G2L["40"]["Name"] = [[Head]];
G2L["40"]["CastShadow"] = false;


-- ServerStorage.SeedCalculator.container.viewport.Head.Mesh
G2L["41"] = Instance.new("SpecialMesh", G2L["40"]);
G2L["41"]["Scale"] = Vector3.new(1.15, 1.15, 1.15);


-- ServerStorage.SeedCalculator.container.viewport.Head.Decal
G2L["42"] = Instance.new("Decal", G2L["40"]);
-- [ERROR] cannot convert TextureContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["42"]["Texture"] = [[rbxassetid://9836384124]];
-- [ERROR] cannot convert ColorMapContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["42"]["ColorMap"] = [[rbxassetid://9836384124]];


-- ServerStorage.SeedCalculator.container.viewport.Head.Decal
G2L["43"] = Instance.new("Decal", G2L["40"]);
-- [ERROR] cannot convert TextureContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["43"]["Texture"] = [[rbxassetid://9806565498]];
-- [ERROR] cannot convert ColorMapContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["43"]["ColorMap"] = [[rbxassetid://9806565498]];


-- ServerStorage.SeedCalculator.container.viewport.selector
G2L["44"] = Instance.new("ScrollingFrame", G2L["4"]);
G2L["44"]["Active"] = true;
G2L["44"]["BorderSizePixel"] = 0;
G2L["44"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
G2L["44"]["Name"] = [[selector]];
G2L["44"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["44"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["44"]["Size"] = UDim2.new(0, 0, 0, 270);
G2L["44"]["Position"] = UDim2.new(1.1, 0, 0.55, 0);
G2L["44"]["LayoutOrder"] = 99;
G2L["44"]["BackgroundTransparency"] = 1;


-- ServerStorage.SeedCalculator.container.viewport.selector.UIListLayout
G2L["45"] = Instance.new("UIListLayout", G2L["44"]);
G2L["45"]["Padding"] = UDim.new(0, 5);
G2L["45"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- ServerStorage.SeedCalculator.container.viewport.selector.search
G2L["46"] = Instance.new("ImageLabel", G2L["44"]);
G2L["46"]["Active"] = true;
G2L["46"]["BorderSizePixel"] = 0;
G2L["46"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["46"]["ImageTransparency"] = 1;
G2L["46"]["AnchorPoint"] = Vector2.new(0.5, 1);
G2L["46"]["Size"] = UDim2.new(0, 200, 0, 50);
G2L["46"]["BackgroundTransparency"] = 1;
G2L["46"]["LayoutOrder"] = 9;
G2L["46"]["Selectable"] = true;
G2L["46"]["Name"] = [[search]];
G2L["46"]["Position"] = UDim2.new(0.5, 0, 1, 0);


-- ServerStorage.SeedCalculator.container.viewport.selector.search.sbutton
G2L["47"] = Instance.new("TextButton", G2L["46"]);
G2L["47"]["BorderSizePixel"] = 0;
G2L["47"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["47"]["AnchorPoint"] = Vector2.new(0.5, 1);
G2L["47"]["BackgroundTransparency"] = 0.5;
G2L["47"]["Size"] = UDim2.new(0, 200, 0, 30);
G2L["47"]["LayoutOrder"] = -1;
G2L["47"]["Text"] = [[]];
G2L["47"]["Name"] = [[sbutton]];
G2L["47"]["Position"] = UDim2.new(0.5, 0, 1, 0);


-- ServerStorage.SeedCalculator.container.viewport.selector.search.sbutton.text
G2L["48"] = Instance.new("TextLabel", G2L["47"]);
G2L["48"]["TextWrapped"] = true;
G2L["48"]["Active"] = true;
G2L["48"]["Interactable"] = false;
G2L["48"]["BorderSizePixel"] = 0;
G2L["48"]["TextSize"] = 20;
G2L["48"]["TextScaled"] = true;
G2L["48"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["48"]["FontFace"] = Font.new([[rbxasset://fonts/families/Zekton.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["48"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["48"]["BackgroundTransparency"] = 1;
G2L["48"]["AnchorPoint"] = Vector2.new(1, 0.5);
G2L["48"]["Size"] = UDim2.new(1, 0, 0.75, 0);
G2L["48"]["Text"] = [[Calculate]];
G2L["48"]["LayoutOrder"] = -1;
G2L["48"]["Selectable"] = true;
G2L["48"]["Name"] = [[text]];
G2L["48"]["Position"] = UDim2.new(1, 0, 0.5, 0);


-- ServerStorage.SeedCalculator.container.viewport.selector.skincolor
G2L["49"] = Instance.new("TextButton", G2L["44"]);
G2L["49"]["BorderSizePixel"] = 0;
G2L["49"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["49"]["AnchorPoint"] = Vector2.new(0.5, 1);
G2L["49"]["BackgroundTransparency"] = 1;
G2L["49"]["Size"] = UDim2.new(0, 200, 0, 50);
G2L["49"]["LayoutOrder"] = 4;
G2L["49"]["Text"] = [[]];
G2L["49"]["Name"] = [[skincolor]];
G2L["49"]["Position"] = UDim2.new(0.5, 0, 1, 0);


-- ServerStorage.SeedCalculator.container.viewport.selector.skincolor.frame
G2L["4a"] = Instance.new("Frame", G2L["49"]);
G2L["4a"]["Active"] = true;
G2L["4a"]["Interactable"] = false;
G2L["4a"]["BorderSizePixel"] = 0;
G2L["4a"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4a"]["Selectable"] = true;
G2L["4a"]["AnchorPoint"] = Vector2.new(0.5, 1);
G2L["4a"]["Size"] = UDim2.new(0, 200, 0, 30);
G2L["4a"]["Position"] = UDim2.new(0.5, 0, 1, 0);
G2L["4a"]["Name"] = [[frame]];
G2L["4a"]["LayoutOrder"] = -1;
G2L["4a"]["BackgroundTransparency"] = 0.5;


-- ServerStorage.SeedCalculator.container.viewport.selector.skincolor.frame.text
G2L["4b"] = Instance.new("TextLabel", G2L["4a"]);
G2L["4b"]["TextWrapped"] = true;
G2L["4b"]["Active"] = true;
G2L["4b"]["BorderSizePixel"] = 0;
G2L["4b"]["TextSize"] = 20;
G2L["4b"]["TextScaled"] = true;
G2L["4b"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4b"]["FontFace"] = Font.new([[rbxasset://fonts/families/Zekton.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["4b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4b"]["BackgroundTransparency"] = 1;
G2L["4b"]["AnchorPoint"] = Vector2.new(1, 0.5);
G2L["4b"]["Size"] = UDim2.new(0.8, 0, 0.75, 0);
G2L["4b"]["Text"] = [[255,255,255]];
G2L["4b"]["LayoutOrder"] = -1;
G2L["4b"]["Selectable"] = true;
G2L["4b"]["Name"] = [[text]];
G2L["4b"]["Position"] = UDim2.new(1, 0, 0.5, 0);


-- ServerStorage.SeedCalculator.container.viewport.selector.skincolor.frame.cf
G2L["4c"] = Instance.new("Frame", G2L["4a"]);
G2L["4c"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY;
G2L["4c"]["BorderSizePixel"] = 0;
G2L["4c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4c"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["4c"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["4c"]["Position"] = UDim2.new(0, 0, 0.5, 0);
G2L["4c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4c"]["Name"] = [[cf]];
G2L["4c"]["BackgroundTransparency"] = 1;


-- ServerStorage.SeedCalculator.container.viewport.selector.skincolor.frame.cf.color
G2L["4d"] = Instance.new("Frame", G2L["4c"]);
G2L["4d"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY;
G2L["4d"]["BorderSizePixel"] = 0;
G2L["4d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["4d"]["Size"] = UDim2.new(0.8, 0, 0.8, 0);
G2L["4d"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["4d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4d"]["Name"] = [[color]];


-- ServerStorage.SeedCalculator.container.viewport.selector.skincolor.text
G2L["4e"] = Instance.new("TextLabel", G2L["49"]);
G2L["4e"]["TextWrapped"] = true;
G2L["4e"]["Active"] = true;
G2L["4e"]["Interactable"] = false;
G2L["4e"]["BorderSizePixel"] = 0;
G2L["4e"]["TextSize"] = 20;
G2L["4e"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["4e"]["TextScaled"] = true;
G2L["4e"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4e"]["FontFace"] = Font.new([[rbxasset://fonts/families/Zekton.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["4e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4e"]["BackgroundTransparency"] = 1;
G2L["4e"]["Size"] = UDim2.new(1, 0, 0, 20);
G2L["4e"]["Text"] = [[        Skin Color]];
G2L["4e"]["LayoutOrder"] = -1;
G2L["4e"]["Selectable"] = true;
G2L["4e"]["Name"] = [[text]];


-- ServerStorage.SeedCalculator.container.viewport.selector.hairstyle
G2L["4f"] = Instance.new("TextButton", G2L["44"]);
G2L["4f"]["BorderSizePixel"] = 0;
G2L["4f"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4f"]["AnchorPoint"] = Vector2.new(0.5, 1);
G2L["4f"]["BackgroundTransparency"] = 1;
G2L["4f"]["Size"] = UDim2.new(0, 200, 0, 50);
G2L["4f"]["LayoutOrder"] = 1;
G2L["4f"]["Text"] = [[]];
G2L["4f"]["Name"] = [[hairstyle]];
G2L["4f"]["Position"] = UDim2.new(0.5, 0, 1, 0);


-- ServerStorage.SeedCalculator.container.viewport.selector.hairstyle.frame
G2L["50"] = Instance.new("Frame", G2L["4f"]);
G2L["50"]["Active"] = true;
G2L["50"]["Interactable"] = false;
G2L["50"]["BorderSizePixel"] = 0;
G2L["50"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["50"]["Selectable"] = true;
G2L["50"]["AnchorPoint"] = Vector2.new(0.5, 1);
G2L["50"]["Size"] = UDim2.new(0, 200, 0, 30);
G2L["50"]["Position"] = UDim2.new(0.5, 0, 1, 0);
G2L["50"]["Name"] = [[frame]];
G2L["50"]["LayoutOrder"] = -1;
G2L["50"]["BackgroundTransparency"] = 0.5;


-- ServerStorage.SeedCalculator.container.viewport.selector.hairstyle.frame.text
G2L["51"] = Instance.new("TextLabel", G2L["50"]);
G2L["51"]["TextWrapped"] = true;
G2L["51"]["Active"] = true;
G2L["51"]["BorderSizePixel"] = 0;
G2L["51"]["TextSize"] = 20;
G2L["51"]["TextScaled"] = true;
G2L["51"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["51"]["FontFace"] = Font.new([[rbxasset://fonts/families/Zekton.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["51"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["51"]["BackgroundTransparency"] = 1;
G2L["51"]["AnchorPoint"] = Vector2.new(1, 0.5);
G2L["51"]["Size"] = UDim2.new(0.8, 0, 0.75, 0);
G2L["51"]["Text"] = [[???]];
G2L["51"]["LayoutOrder"] = -1;
G2L["51"]["Selectable"] = true;
G2L["51"]["Name"] = [[text]];
G2L["51"]["Position"] = UDim2.new(1, 0, 0.5, 0);


-- ServerStorage.SeedCalculator.container.viewport.selector.hairstyle.frame.vf
G2L["52"] = Instance.new("ViewportFrame", G2L["50"]);
G2L["52"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY;
G2L["52"]["BorderSizePixel"] = 0;
G2L["52"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["52"]["LightColor"] = Color3.fromRGB(255, 255, 255);
G2L["52"]["LightDirection"] = Vector3.new(1, 1, 3);
G2L["52"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["52"]["Ambient"] = Color3.fromRGB(151, 151, 151);
G2L["52"]["Size"] = UDim2.new(1.5, 0, 1.5, 0);
G2L["52"]["Position"] = UDim2.new(0, 0, 0.5, 0);
G2L["52"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["52"]["Name"] = [[vf]];
G2L["52"]["BackgroundTransparency"] = 1;


-- ServerStorage.SeedCalculator.container.viewport.selector.hairstyle.text
G2L["53"] = Instance.new("TextLabel", G2L["4f"]);
G2L["53"]["TextWrapped"] = true;
G2L["53"]["Active"] = true;
G2L["53"]["Interactable"] = false;
G2L["53"]["BorderSizePixel"] = 0;
G2L["53"]["TextSize"] = 20;
G2L["53"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["53"]["TextScaled"] = true;
G2L["53"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["53"]["FontFace"] = Font.new([[rbxasset://fonts/families/Zekton.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["53"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["53"]["BackgroundTransparency"] = 1;
G2L["53"]["Size"] = UDim2.new(1, 0, 0, 20);
G2L["53"]["Text"] = [[        Hair Style]];
G2L["53"]["LayoutOrder"] = -1;
G2L["53"]["Selectable"] = true;
G2L["53"]["Name"] = [[text]];


-- ServerStorage.SeedCalculator.container.viewport.selector.haircolor
G2L["54"] = Instance.new("TextButton", G2L["44"]);
G2L["54"]["BorderSizePixel"] = 0;
G2L["54"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["54"]["AnchorPoint"] = Vector2.new(0.5, 1);
G2L["54"]["BackgroundTransparency"] = 1;
G2L["54"]["Size"] = UDim2.new(0, 200, 0, 50);
G2L["54"]["LayoutOrder"] = 3;
G2L["54"]["Text"] = [[]];
G2L["54"]["Name"] = [[haircolor]];
G2L["54"]["Position"] = UDim2.new(0.5, 0, 1, 0);


-- ServerStorage.SeedCalculator.container.viewport.selector.haircolor.frame
G2L["55"] = Instance.new("Frame", G2L["54"]);
G2L["55"]["Active"] = true;
G2L["55"]["Interactable"] = false;
G2L["55"]["BorderSizePixel"] = 0;
G2L["55"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["55"]["Selectable"] = true;
G2L["55"]["AnchorPoint"] = Vector2.new(0.5, 1);
G2L["55"]["Size"] = UDim2.new(0, 200, 0, 30);
G2L["55"]["Position"] = UDim2.new(0.5, 0, 1, 0);
G2L["55"]["Name"] = [[frame]];
G2L["55"]["LayoutOrder"] = -1;
G2L["55"]["BackgroundTransparency"] = 0.5;


-- ServerStorage.SeedCalculator.container.viewport.selector.haircolor.frame.text
G2L["56"] = Instance.new("TextLabel", G2L["55"]);
G2L["56"]["TextWrapped"] = true;
G2L["56"]["Active"] = true;
G2L["56"]["BorderSizePixel"] = 0;
G2L["56"]["TextSize"] = 20;
G2L["56"]["TextScaled"] = true;
G2L["56"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["56"]["FontFace"] = Font.new([[rbxasset://fonts/families/Zekton.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["56"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["56"]["BackgroundTransparency"] = 1;
G2L["56"]["AnchorPoint"] = Vector2.new(1, 0.5);
G2L["56"]["Size"] = UDim2.new(0.8, 0, 0.75, 0);
G2L["56"]["Text"] = [[255,255,255]];
G2L["56"]["LayoutOrder"] = -1;
G2L["56"]["Selectable"] = true;
G2L["56"]["Name"] = [[text]];
G2L["56"]["Position"] = UDim2.new(1, 0, 0.5, 0);


-- ServerStorage.SeedCalculator.container.viewport.selector.haircolor.frame.cf
G2L["57"] = Instance.new("Frame", G2L["55"]);
G2L["57"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY;
G2L["57"]["BorderSizePixel"] = 0;
G2L["57"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["57"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["57"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["57"]["Position"] = UDim2.new(0, 0, 0.5, 0);
G2L["57"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["57"]["Name"] = [[cf]];
G2L["57"]["BackgroundTransparency"] = 1;


-- ServerStorage.SeedCalculator.container.viewport.selector.haircolor.frame.cf.color
G2L["58"] = Instance.new("Frame", G2L["57"]);
G2L["58"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY;
G2L["58"]["BorderSizePixel"] = 0;
G2L["58"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["58"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["58"]["Size"] = UDim2.new(0.8, 0, 0.8, 0);
G2L["58"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["58"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["58"]["Name"] = [[color]];


-- ServerStorage.SeedCalculator.container.viewport.selector.haircolor.text
G2L["59"] = Instance.new("TextLabel", G2L["54"]);
G2L["59"]["TextWrapped"] = true;
G2L["59"]["Active"] = true;
G2L["59"]["Interactable"] = false;
G2L["59"]["BorderSizePixel"] = 0;
G2L["59"]["TextSize"] = 20;
G2L["59"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["59"]["TextScaled"] = true;
G2L["59"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["59"]["FontFace"] = Font.new([[rbxasset://fonts/families/Zekton.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["59"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["59"]["BackgroundTransparency"] = 1;
G2L["59"]["Size"] = UDim2.new(1, 0, 0, 20);
G2L["59"]["Text"] = [[        Hair Color]];
G2L["59"]["LayoutOrder"] = -1;
G2L["59"]["Selectable"] = true;
G2L["59"]["Name"] = [[text]];


-- ServerStorage.SeedCalculator.container.viewport.selector.beardstyle
G2L["5a"] = Instance.new("TextButton", G2L["44"]);
G2L["5a"]["BorderSizePixel"] = 0;
G2L["5a"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5a"]["AnchorPoint"] = Vector2.new(0.5, 1);
G2L["5a"]["BackgroundTransparency"] = 1;
G2L["5a"]["Size"] = UDim2.new(0, 200, 0, 50);
G2L["5a"]["LayoutOrder"] = 2;
G2L["5a"]["Text"] = [[]];
G2L["5a"]["Name"] = [[beardstyle]];
G2L["5a"]["Position"] = UDim2.new(0.5, 0, 1, 0);


-- ServerStorage.SeedCalculator.container.viewport.selector.beardstyle.frame
G2L["5b"] = Instance.new("Frame", G2L["5a"]);
G2L["5b"]["Active"] = true;
G2L["5b"]["Interactable"] = false;
G2L["5b"]["BorderSizePixel"] = 0;
G2L["5b"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5b"]["Selectable"] = true;
G2L["5b"]["AnchorPoint"] = Vector2.new(0.5, 1);
G2L["5b"]["Size"] = UDim2.new(0, 200, 0, 30);
G2L["5b"]["Position"] = UDim2.new(0.5, 0, 1, 0);
G2L["5b"]["Name"] = [[frame]];
G2L["5b"]["LayoutOrder"] = -1;
G2L["5b"]["BackgroundTransparency"] = 0.5;


-- ServerStorage.SeedCalculator.container.viewport.selector.beardstyle.frame.text
G2L["5c"] = Instance.new("TextLabel", G2L["5b"]);
G2L["5c"]["TextWrapped"] = true;
G2L["5c"]["Active"] = true;
G2L["5c"]["BorderSizePixel"] = 0;
G2L["5c"]["TextSize"] = 20;
G2L["5c"]["TextScaled"] = true;
G2L["5c"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5c"]["FontFace"] = Font.new([[rbxasset://fonts/families/Zekton.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["5c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5c"]["BackgroundTransparency"] = 1;
G2L["5c"]["AnchorPoint"] = Vector2.new(1, 0.5);
G2L["5c"]["Size"] = UDim2.new(0.8, 0, 0.75, 0);
G2L["5c"]["Text"] = [[???]];
G2L["5c"]["LayoutOrder"] = -1;
G2L["5c"]["Selectable"] = true;
G2L["5c"]["Name"] = [[text]];
G2L["5c"]["Position"] = UDim2.new(1, 0, 0.5, 0);


-- ServerStorage.SeedCalculator.container.viewport.selector.beardstyle.frame.vf
G2L["5d"] = Instance.new("ViewportFrame", G2L["5b"]);
G2L["5d"]["SizeConstraint"] = Enum.SizeConstraint.RelativeYY;
G2L["5d"]["BorderSizePixel"] = 0;
G2L["5d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5d"]["LightColor"] = Color3.fromRGB(255, 255, 255);
G2L["5d"]["LightDirection"] = Vector3.new(1, 1, 3);
G2L["5d"]["AnchorPoint"] = Vector2.new(0, 0.5);
G2L["5d"]["Ambient"] = Color3.fromRGB(151, 151, 151);
G2L["5d"]["Size"] = UDim2.new(1.5, 0, 1.5, 0);
G2L["5d"]["Position"] = UDim2.new(0, 0, 0.5, 0);
G2L["5d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5d"]["Name"] = [[vf]];
G2L["5d"]["BackgroundTransparency"] = 1;


-- ServerStorage.SeedCalculator.container.viewport.selector.beardstyle.text
G2L["5e"] = Instance.new("TextLabel", G2L["5a"]);
G2L["5e"]["TextWrapped"] = true;
G2L["5e"]["Active"] = true;
G2L["5e"]["Interactable"] = false;
G2L["5e"]["BorderSizePixel"] = 0;
G2L["5e"]["TextSize"] = 20;
G2L["5e"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["5e"]["TextScaled"] = true;
G2L["5e"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5e"]["FontFace"] = Font.new([[rbxasset://fonts/families/Zekton.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["5e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5e"]["BackgroundTransparency"] = 1;
G2L["5e"]["RichText"] = true;
G2L["5e"]["Size"] = UDim2.new(1, 0, 0, 20);
G2L["5e"]["Text"] = [[        Beard Style]];
G2L["5e"]["LayoutOrder"] = -1;
G2L["5e"]["Selectable"] = true;
G2L["5e"]["Name"] = [[text]];


-- ServerStorage.SeedCalculator.container.input
G2L["5f"] = Instance.new("TextBox", G2L["2"]);
G2L["5f"]["Name"] = [[input]];
G2L["5f"]["BorderSizePixel"] = 0;
G2L["5f"]["TextSize"] = 20;
G2L["5f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5f"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5f"]["FontFace"] = Font.new([[rbxasset://fonts/families/Zekton.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["5f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["5f"]["ClearTextOnFocus"] = false;
G2L["5f"]["PlaceholderText"] = [[Input Seed]];
G2L["5f"]["Size"] = UDim2.new(0, 200, 0, 30);
G2L["5f"]["Position"] = UDim2.new(0.5, 0, 0.7, 0);
G2L["5f"]["Text"] = [[416]];
G2L["5f"]["LayoutOrder"] = 10;
G2L["5f"]["BackgroundTransparency"] = 0.5;


-- ServerStorage.SeedCalculator.popup
G2L["60"] = Instance.new("TextLabel", G2L["1"]);
G2L["60"]["Active"] = true;
G2L["60"]["Interactable"] = false;
G2L["60"]["BorderSizePixel"] = 0;
G2L["60"]["TextSize"] = 20;
G2L["60"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
G2L["60"]["FontFace"] = Font.new([[rbxasset://fonts/families/Zekton.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["60"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["60"]["BackgroundTransparency"] = 1;
G2L["60"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["60"]["Size"] = UDim2.new(0, 400, 0, 30);
G2L["60"]["Text"] = [[]];
G2L["60"]["LayoutOrder"] = 10;
G2L["60"]["Selectable"] = true;
G2L["60"]["Name"] = [[popup]];
G2L["60"]["Position"] = UDim2.new(0.5, 0, 0.15, 0);

return G2L["1"]