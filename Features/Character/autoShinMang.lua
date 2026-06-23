local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local localPlayer = Players.LocalPlayer
local data = localPlayer:WaitForChild("Data")
local sanity = data:WaitForChild("Sanity")

local events = ReplicatedStorage:WaitForChild("Events")

local shinGain = events:WaitForChild("ShinGain")

local autoShinMang = {}

local onGoingRepeat = false

RunService.RenderStepped:Connect(function(deltaTime)
	if not Toggles.AutoShinMang.Value then
		return
	end
	if not table.find(string.split(data.Passives.Value, ","), "ShinAndMang") then
		return
	end
	if onGoingRepeat then
		return
	end
	local shinMangMax = -10
	if table.find(string.split(data.Passives.Value, ","), "DecimateMind") then
		shinMangMax = -35
	end
	if sanity.Value <= shinMangMax then
		return
	end
	if sanity.Value <= Options.autoShinMangSanity.Value then
		onGoingRepeat = true
		repeat
			task.wait()
			shinGain:FireServer()
		until sanity.Value <= shinMangMax
		onGoingRepeat = false
	end
end)

return autoShinMang
