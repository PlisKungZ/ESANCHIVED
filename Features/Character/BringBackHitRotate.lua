local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local localPlayer = Players.LocalPlayer
local bringBackHitRotate = {}
local instance

local connection
local resetDash

function bringBackHitRotate.on()
	connection = RunService.RenderStepped:Connect(LPH_NO_VIRTUALIZE(function()
		local SlowAutoRotate = game.Players.LocalPlayer.Character:FindFirstChild("SlowAutoRotate")
		if SlowAutoRotate then
			SlowAutoRotate:Destroy()
		end
	end))
end

function bringBackHitRotate.off()
	if connection then
		connection:Disconnect()
	end
end

return bringBackHitRotate
