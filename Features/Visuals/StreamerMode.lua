local httpService = game:GetService("HttpService")

local streamer = {}

function streamer.on()
	local function changeText(frame)
		for _, text in frame:GetDescendants() do
			if text.Name == "IconLabel" then
				text.Text = ""
			end
		end
	end

	local Players = game:GetService("Players")
	local localPlayer = Players.LocalPlayer
	local playerGui = localPlayer.PlayerGui
	local Topbar = playerGui:WaitForChild("TopbarStandard")
	local main = Topbar:WaitForChild("Holders"):WaitForChild("Left")

	local playerName = main:WaitForChild("PlayerName")

	local whiteList = { "PlayerName", "ServerAge", "ServerName", "ServerRegion" }

	for _, frame in main:GetChildren() do
		changeText(frame)
	end
	local frame = playerGui.Leaderboard.NameFrame.ScrollingFrame:FindFirstChild(localPlayer.Name)
	if frame then
		frame:Destroy()
	end
	game:GetService("Players").LocalPlayer.PlayerGui.OverlayGui.SubtitleFrame.Visible = false
end

function streamer.off() end

return streamer
