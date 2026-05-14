local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Events = ReplicatedStorage:WaitForChild("Events")
local fallDamageEvent = Events:WaitForChild("FallDamage")

local localPlayer = Players.LocalPlayer

local connection

local noWeather = {}
local WeatherAttach

function noWeather.on()
	WeatherAttach = workspace.Camera:FindFirstChild("WeatherAttach")
	if WeatherAttach then
		WeatherAttach.Parent = nil
	end
end

function noWeather.off()
	if WeatherAttach then
		WeatherAttach.Parent = workspace.Camera
	end
end

return noWeather
