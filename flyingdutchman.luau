local RunService = game:GetService("RunService")
local localPlayer = game.Players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()

RunService.RenderStepped:Connect(function()
	if not character then
		return
	end
	if not character.LeftGrip then
		return
	end
	if character.LeftGrip:FindFirstChild("DecapitationChainLaunch") then
		character.Humanoid.HipHeight = 1000
	else
		character.Humanoid.HipHeight = 0
	end
end)
localPlayer.CharacterAdded:Connect(function(addedCharacter)
	character = addedCharacter
end)
