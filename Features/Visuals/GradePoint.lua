local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local localPlayer = Players.LocalPlayer
local playerGui = localPlayer.PlayerGui

local GradePoint = {}
GradePoint.GradePointsReq = {
	10000,
	3000,
	2000,
	1900,
	1500,
	1300,
	1200,
	500,
	250,
}

local connection
local mouseEnter, mouseLeave

function GradePoint.on()
	GradePoint.off()
	connection = RunService.Heartbeat:Connect(LPH_NO_VIRTUALIZE(function(deltaTime)
		playerGui.Stats.UI.GradeSlider.Visible = true
		playerGui.Stats.UI.GradeSlider.SliderClip.Size = UDim2.fromScale(
			localPlayer:WaitForChild("Data"):WaitForChild("GradeUpPoints").Value
				/ GradePoint.GradePointsReq[localPlayer.Data.Grade.Value],
			1
		)
	end))

	mouseEnter = localPlayer
end

function GradePoint.off()
	playerGui.Stats.UI.GradeSlider.Visible = false
	if connection then
		connection:Disconnect()
	end
end

return GradePoint
