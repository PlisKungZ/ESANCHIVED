local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local localPlayer = Players.LocalPlayer

local fly = {}

local connection

local keys = {
	forward = Enum.KeyCode.W,
	backward = Enum.KeyCode.S,
	left = Enum.KeyCode.A,
	right = Enum.KeyCode.D,
	up = Enum.KeyCode.Space,
	down = Enum.KeyCode.LeftShift,
}

local function getDirection()
	local direction = Vector3.zero
	local camCFrame = workspace.CurrentCamera.CFrame

	-- use full camera look vector including vertical tilt
	local look = camCFrame.LookVector
	local right = camCFrame.RightVector

	if UserInputService:IsKeyDown(keys.forward) then
		direction = direction + look
	end
	if UserInputService:IsKeyDown(keys.backward) then
		direction = direction - look
	end
	if UserInputService:IsKeyDown(keys.right) then
		direction = direction + right
	end
	if UserInputService:IsKeyDown(keys.left) then
		direction = direction - right
	end
	if UserInputService:IsKeyDown(keys.up) then
		direction = direction + Vector3.new(0, 1, 0)
	end
	if UserInputService:IsKeyDown(keys.down) then
		direction = direction - Vector3.new(0, 1, 0)
	end

	return direction
end

local function enableFly(SPEED)
	local character = localPlayer.Character
	if not character then
		return
	end

	local humanoid = character:FindFirstChildWhichIsA("Humanoid")
	local rootPart = character:FindFirstChild("HumanoidRootPart")
	if not humanoid or not rootPart then
		return
	end

	humanoid.PlatformStand = true -- disables default movement without rotating char

	connection = RunService.Heartbeat:Connect(LPH_NO_VIRTUALIZE(function(delta)
		-- re-grab in case of respawn
		character = localPlayer.Character
		if not character then
			return
		end
		humanoid = character:FindFirstChildWhichIsA("Humanoid")
		rootPart = character:FindFirstChild("HumanoidRootPart")
		if not humanoid or not rootPart then
			return
		end

		local direction = getDirection()

		if direction.Magnitude > 0 then
			-- move position only, don't touch rotation
			rootPart.CFrame = rootPart.CFrame + (direction.Unit * SPEED * delta)
		end

		-- keep character upright and prevent physics from moving it
		rootPart.AssemblyLinearVelocity = Vector3.zero
		rootPart.AssemblyAngularVelocity = Vector3.zero
	end))
end

local function disableFly()
	local character = localPlayer.Character
	if character then
		local humanoid = character:FindFirstChildWhichIsA("Humanoid")
		if humanoid then
			humanoid.PlatformStand = false
		end
	end

	if connection then
		connection:Disconnect()
		connection = nil
	end
end

function fly.on(speed)
	disableFly()
	enableFly(speed)
end

function fly.off()
	disableFly()
end

return fly
