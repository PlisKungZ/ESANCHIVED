local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Events = ReplicatedStorage:WaitForChild("Events")
local fallDamageEvent = Events:WaitForChild("FallDamage")
local BegunM1 = Events:WaitForChild("BegunM1")
local MissParry = Events:WaitForChild("MissParry")
local LightAttack = Events:WaitForChild("LightAttack")

local localPlayer = Players.LocalPlayer

local connection

local noFall = {}
local state = false

hookmetamethod(
	game,
	"__namecall",
	newcclosure(LPH_NO_VIRTUALIZE(function(self, ...)
		local method = getnamecallmethod()

		if not Toggles then
			return self[method](self, ...)
		end

		if method == "FireServer" and self == fallDamageEvent and Toggles.fallDamage.Value then
			return
		end

		if not Toggles.noStaminaDrain then
			return self[method](self, ...)
		end
		if method == "FireServer" and Toggles.noStaminaDrain.Value then
			if self == BegunM1 or self == MissParry or self == LightAttack then
				return
			end
		end

		return self[method](self, ...)
	end))
)

function noFall.on()
	state = true
end

function noFall.off()
	state = false
end

return noFall
