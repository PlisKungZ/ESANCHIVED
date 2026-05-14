local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local localPlayer = Players.LocalPlayer

local connection

local Noclip = {}

function Noclip.on()
	connection = RunService.Stepped:Connect(LPH_NO_VIRTUALIZE(function()
		if localPlayer.Character ~= nil then
			for _, child in pairs(localPlayer.Character:GetDescendants()) do
				if child:IsA("BasePart") and child.CanCollide == true then
					child.CanCollide = false
				end
			end
		end
	end))
end

function Noclip.off()
	if connection then
		connection:Disconnect()
		connection = nil
	end
end

return Noclip
