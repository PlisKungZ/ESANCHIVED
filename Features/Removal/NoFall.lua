local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Events = ReplicatedStorage:WaitForChild("Events")
local fallDamageEvent = Events:WaitForChild("FallDamage")

local localPlayer = Players.LocalPlayer

local connection

local noFall = {}
local state = false

hookmetamethod(
	game,
	"__namecall",
	newcclosure(LPH_NO_VIRTUALIZE(function(self, ...)
		local method = getnamecallmethod()

		if method == "FireServer" and self == fallDamageEvent and state then
			return
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
