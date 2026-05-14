local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local localPlayer = Players.LocalPlayer
local noEndlag = {}
local instance

local connection
local resetDash

function noEndlag.on()
	connection = RunService.RenderStepped:Connect(LPH_NO_VIRTUALIZE(function()
		local LightAttack = game.Players.LocalPlayer.Character:FindFirstChild("LightAttack")
		if LightAttack then
			LightAttack:Destroy()
		end

		local HeavyAttack = game.Players.LocalPlayer.Character:FindFirstChild("HeavyAttack")
		if HeavyAttack then
			HeavyAttack:Destroy()
		end

		local UsingMove = game.Players.LocalPlayer.Character:FindFirstChild("UsingMove")
		if UsingMove then
			UsingMove:Destroy()
		end
	end))
end

function noEndlag.off()
	if connection then
		connection:Disconnect()
	end
end

return noEndlag
