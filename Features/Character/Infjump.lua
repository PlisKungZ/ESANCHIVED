local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local localPlayer = Players.LocalPlayer

local connection

local infJump = {}
local infJumpDebounce = false

function infJump.on()
	connection = UserInputService.JumpRequest:Connect(LPH_NO_VIRTUALIZE(function()
		if not infJumpDebounce then
			infJumpDebounce = true
			localPlayer.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
			task.wait()
			infJumpDebounce = false
		end
	end))
end

function infJump.off()
	if connection then
		connection:Disconnect()
		connection = nil
	end
end

return infJump
