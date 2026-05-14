local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

local walkSpeed = {}

local connection

function walkSpeed.on(speed)
	if connection then
		connection:Disconnect()
		connection = nil
	end
	local character = localPlayer.Character
	local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")

	connection = RunService.Heartbeat:Connect(LPH_NO_VIRTUALIZE(function(delta)
		if not (character and humanoid and humanoid.Parent) then
			connection:Disconnect()
			return
		end

		if humanoid.MoveDirection.Magnitude > 0 then
			character:TranslateBy(humanoid.MoveDirection * speed * delta * 10)
		end
	end))
end

function walkSpeed.off()
	if connection then
		connection:Disconnect()
		connection = nil
	end
end

return walkSpeed
