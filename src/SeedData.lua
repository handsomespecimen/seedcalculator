local module = {}

module.HAIRSTYLES = {
	male = {"Charmer","Cool","Dev","Dreamy","Popstar","Neat","Spiky","Shaggy","MessyWavy","Fluffed"},
	female = {"Animazing","Anime","Bob","Drama","Cropped","Wild","Classic","Long","Ponytail","Wolfish","Wavy","Short"},
	beards = {"Neat","Thin","Trimmed"}
}

module.SKIN_COLORS = {
	black = {{124,92,70},{100,75,62},{86,66,54},{110,81,62},{80,59,45}},
	beige = {{175,148,131},{170,133,106}},
	white = {{255,204,153},{234,184,146},{180,144,108}},
	tan = {{158,117,89},{124,92,70},{139,117,104}},
	medium = {{158,117,89},{180,144,108},{170,133,106}},
}

module.HAIR_COLORS = {
	black = {{27,42,53},{52,52,52},{33,33,33}},
	beige = {{27,42,53},{86,66,54},{57,43,35},{30,22,18}},
	white = {{27,42,53},{86,66,54},{99,95,98},{199,172,120},{90,76,66},{135,79,44},{124,92,70}},
	tan = {{27,42,53},{86,66,54},{57,43,35},{30,22,18}},
	medium = {{27,42,53},{52,52,52},{33,33,33}}
}

module.GROUPS = {"black","beige","white","tan","medium"}
module.SELECTOR_KEYS = {"hairstyle","beardstyle","haircolor","skincolor"}
module.WHITE = Color3.fromRGB(255,255,255)
module.BLACK = Color3.fromRGB(0,0,0)
module.GRAY = Color3.fromRGB(100,100,100)

module.TWEEN_IN = TweenInfo.new(.2,Enum.EasingStyle.Circular,Enum.EasingDirection.In)
module.TWEEN_OUT = TweenInfo.new(.2,Enum.EasingStyle.Circular,Enum.EasingDirection.Out)
module.TWEEN_LINEAR = TweenInfo.new(.2,Enum.EasingStyle.Linear)

return module