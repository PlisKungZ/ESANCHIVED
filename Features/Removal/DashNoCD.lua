local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local localPlayer = Players.LocalPlayer
local NoDashCD = {}
local instance

local connection
local resetDash

function NoDashCD.on()
	connection = RunService.RenderStepped:Connect(LPH_NO_VIRTUALIZE(function()
		resetDash = game.Players.LocalPlayer.Character:FindFirstChild("ResetDashCD")
		if not resetDash then
			resetDash = nil
			resetDash = Instance.new("Folder")
			resetDash.Name = "ResetDashCD"
			resetDash.Parent = game.Players.LocalPlayer.Character
		end
		local DashDisabled = game.Players.LocalPlayer.Character:FindFirstChild("DashDisabled")
		if DashDisabled then
			DashDisabled:Destroy()
		end
	end))
end

function NoDashCD.off()
	if connection then
		connection:Disconnect()
	end
	if resetDash then
		resetDash:Destroy()
		resetDash = nil
	end
end

return NoDashCD
