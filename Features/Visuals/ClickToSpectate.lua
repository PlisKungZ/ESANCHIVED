local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local playerGui = localPlayer.PlayerGui

local leaderboardGui = playerGui:WaitForChild("Leaderboard")
local scroll = leaderboardGui:WaitForChild("NameFrame"):WaitForChild("ScrollingFrame")

local clickToSpectate = {}

local currentPlayer

local trash = {}

local function createButton(frame)
	if not frame:FindFirstChild("PlayerName2") then
		return
	end

	local textButton = Instance.new("TextButton")
	textButton.Name = "Button"
	textButton.Size = UDim2.fromScale(1, 1)
	textButton.Position = frame.PlayerName2.Position
	textButton.AnchorPoint = frame.PlayerName2.AnchorPoint
	textButton.BackgroundTransparency = 1
	textButton.Text = ""
	textButton.Parent = frame

	textButton.Activated:Connect(function()
		if currentPlayer == Players[frame.PlayerName2.Text] then
			currentPlayer = nil
			workspace.CurrentCamera.CameraSubject = localPlayer.Character.Humanoid
			return
		end
		workspace.CurrentCamera.CameraSubject = game.Players[frame.PlayerName2.Text].Character.Humanoid
		currentPlayer = game.Players[frame.PlayerName2.Text]
	end)

	table.insert(trash, textButton)
end

function clickToSpectate.on()
	for _, frame in scroll:GetChildren() do
		if frame:IsA("Frame") then
			createButton(frame)
		end
	end
end

function clickToSpectate.off()
	for _, part in trash do
		part:Destroy()
	end
end

return clickToSpectate
