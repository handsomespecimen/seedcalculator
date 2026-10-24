local module = {}
local SEED_DATA = require(script.Parent.SeedData)

function module.getSeedOption(list,seed,repeater)
	return list[math.floor(seed/repeater)%#list+1]
end
function module.toColor(rgb)
	return Color3.fromRGB(rgb[1],rgb[2],rgb[3])
end
function module.toText(rgb)
	return table.concat(rgb,",")
end

function module.makeColor(rgb,ethnicity,dropdown)
	local label = module.toText(rgb)
	local value = {label = label,rgb = rgb,ethnicity = ethnicity}
	
	if dropdown then
		value.dropdownlabel = label.." ("..ethnicity..")"
	end
	
	return value
end

function module.getDetails(seed,selector)
	local details = {}
	
	if seed%100 < 15 then
		details.ethnicity = "black"
	elseif seed%100 < 30 then
		details.ethnicity = "beige"
	elseif seed%100 < 70 then
		details.ethnicity = "white"
	elseif seed%100 < 85 then
		details.ethnicity = "tan"
	else
		details.ethnicity = "medium"
	end
	
	local gender = (seed%2 == 0 and "male") or "female"
	details.hairstyle = module.getSeedOption(SEED_DATA.HAIRSTYLES[gender],seed,7)
	details.beardstyle = (seed%10 == 0 and module.getSeedOption(SEED_DATA.HAIRSTYLES.beards,seed,5)) or "none"
	details.skincolor = module.getSeedOption(SEED_DATA.SKIN_COLORS[details.ethnicity],seed,3)
	details.haircolor = module.getSeedOption(SEED_DATA.HAIR_COLORS[details.ethnicity],seed,13)
	
	if selector then
		details.skincolor = module.makeColor(details.skincolor,details.ethnicity)
		details.haircolor = module.makeColor(details.haircolor,details.ethnicity)
	end
	
	if not details.hairstyle or not details.beardstyle or not details.skincolor or not details.haircolor then
		return false
	end
	return details
end

function module.makeOptions(key,current)
	local options = {"*"}
	
	if key == "hairstyle" then
		for _,gender in ipairs({"male","female"}) do
			for _,style in ipairs(SEED_DATA.HAIRSTYLES[gender]) do
				table.insert(options,style)
			end
		end
	elseif key == "beardstyle" then
		if current.hairstyle == "*" or table.find(SEED_DATA.HAIRSTYLES.male,current.hairstyle) then
			table.insert(options,"none")
			for _,style in ipairs(SEED_DATA.HAIRSTYLES.beards) do
				table.insert(options,style)
			end
		end
	else
		options = {{label = "*",dropdownlabel = "*",wildcard = true}}
		local pool = (key == "haircolor" and SEED_DATA.HAIR_COLORS) or SEED_DATA.SKIN_COLORS

		for _,group in ipairs(SEED_DATA.GROUPS) do
			for _,color in ipairs(pool[group]) do
				table.insert(options,module.makeColor(color,group,true))
			end
		end
	end
	
	return options
end

function module.matchColor(wanted,ethnicity,rgb)
	if wanted.wildcard then
		return true
	end
	
	if ethnicity ~= wanted.ethnicity then
		return false
	end
	
	return rgb[1] == wanted.rgb[1] and rgb[2] == wanted.rgb[2] and rgb[3] == wanted.rgb[3]
end

function module.findSeed(current)
	for seed = 0,81899 do -- 81900 as lcm, beyond this they just repeat properties
		local details = module.getDetails(seed)
		local matches = true
		
		if current.hairstyle ~= "*" and current.hairstyle ~= details.hairstyle then
			matches = false
		end
		if current.beardstyle ~= "*" and current.beardstyle ~= details.beardstyle then
			matches = false
		end
		if not module.matchColor(current.skincolor,details.ethnicity,details.skincolor) then
			matches = false
		end
		if not module.matchColor(current.haircolor,details.ethnicity,details.haircolor) then
			matches = false
		end
		
		if matches then
			return seed
		end
	end
	
	return nil
end

return module