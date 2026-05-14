local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Events = ReplicatedStorage:WaitForChild("Events")
local fallDamageEvent = Events:WaitForChild("FallDamage")

local localPlayer = Players.LocalPlayer

local connection

local noKillBrick = {}

function noKillBrick.on()
	local kb = workspace:FindFirstChild("KillBricks")
	if kb then
		kb:Destroy()
	end
end

function noKillBrick.off() end

return noKillBrick
