local module = {}
local SEED_DATA = require(script.Parent.SeedData)
local TS = game:GetService("TweenService")

local dropdown

function module.connect(viewport,selector,closeDropdown)
	local t1,t2
	local expanded = false
	
	viewport.thing.MouseButton1Click:Connect(function()
		expanded = not expanded
		if t1 then t1:Cancel() end
		if t2 then t2:Cancel() end
		
		if expanded then
			t1 = TS:Create(viewport.Parent,SEED_DATA.TWEEN_OUT,{
				Position = UDim2.new(.5,0,.5,0)
			})
			t2 = TS:Create(selector,SEED_DATA.TWEEN_OUT,{
				Size = UDim2.new(0,200,0,270)
			})
			t1:Play()
			t2:Play()
			
			task.delay(.2,function()
				if expanded then
					selector.ClipsDescendants = false
				end
			end)
		else
			selector.ClipsDescendants = true
			t1 = TS:Create(viewport.Parent,SEED_DATA.TWEEN_OUT,{
				Position = UDim2.new(.5,110,.5,0)
			})
			t2 = TS:Create(selector,SEED_DATA.TWEEN_OUT,{
				Size = UDim2.new(0,0,0,270)
			})
			t1:Play()
			t2:Play()
		end
		
		if closeDropdown then closeDropdown() end
	end)
end

return module