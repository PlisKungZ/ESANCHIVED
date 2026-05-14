local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local localPlayer = Players.LocalPlayer
local KillSomeone = {}
local track = {}
local connection
local m1Debounce = false
local equippedDebounce = false
local gripDebounce = false
local oldPos

function KillSomeone.on(offset, target)
	KillSomeone.off()
	oldPos = localPlayer.Character:GetPivot()
	local player = game.Players.LocalPlayer.Character.Humanoid.Animator
	for i = 1, 3 do
		local animtrack = player:LoadAnimation(
			game:GetService("ReplicatedStorage").WeaponINFO[game.Players.LocalPlayer.Data.Weapon.Value]["AttackAnimation" .. tostring(
				i
			)]
		)

		game:GetService("ReplicatedStorage").Events.BegunM1:FireServer(game.Players.LocalPlayer.Data.Weapon.Value)

		animtrack:Play(0, 0.01, 1000)
		animtrack.Looped = true
		table.insert(track, animtrack)
	end

	connection = RunService.PostSimulation:Connect(LPH_NO_VIRTUALIZE(function(delta)
		if target:FindFirstChild("GotGripped") then
			localPlayer.Character.HumanoidRootPart.Anchored = false
			game:GetService("ReplicatedStorage").Events.Equip:FireServer(false)
			workspace.CurrentCamera.CameraSubject = localPlayer.Character.Humanoid
			for _, anim in track do
				anim:Stop()
				anim:Destroy()
				anim = nil
			end
			if oldPos then
				localPlayer.Character:PivotTo(oldPos)
				oldPos = nil
			end
			connection:Disconnect()
		end
		if not equippedDebounce then
			equippedDebounce = true
			game:GetService("ReplicatedStorage").Events.Equip:FireServer(true)
		end
		localPlayer.Character.HumanoidRootPart.Anchored = false
		for _, animTrack in track do
			animTrack:AdjustSpeed(1000)
		end
		if not m1Debounce then
			m1Debounce = true
			game:GetService("ReplicatedStorage").Events.BegunM1:FireServer(game.Players.LocalPlayer.Data.Weapon.Value)
			task.delay(0.75, function()
				m1Debounce = false
			end)
		end
		if target:FindFirstChild("Knocked") and not gripDebounce then
			gripDebounce = true
			game:GetService("ReplicatedStorage")
				:WaitForChild("Events")
				:WaitForChild("Grip")
				:FireServer(localPlayer.Character)
			task.delay(1, function()
				gripDebounce = false
			end)
		end
		if localPlayer.Character:FindFirstChild("GripNotInterrupted") then
			localPlayer.Character.HumanoidRootPart.Anchored = true
			return
		end
		localPlayer.Data.Stamina.Value = 100
		for _, animTrack in track do
			animTrack:AdjustSpeed(1000)
		end
		local offset =
			Vector3.new(math.random(0, 1), math.random(offset, offset + math.random(1, 2)), math.random(0, 1))

		localPlayer.Character.HumanoidRootPart:PivotTo(
			target.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0) + offset
		)
		workspace.CurrentCamera.CameraSubject = target.Humanoid
		localPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
		localPlayer.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
		localPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
	end))
end

function KillSomeone.off()
	game:GetService("ReplicatedStorage").Events.Equip:FireServer(false)
	if connection then
		connection:Disconnect()
		connection = nil
	end
	for _, anim in track do
		anim:Stop()
		anim:Destroy()
		anim = nil
	end
	if oldPos then
		localPlayer.Character:PivotTo(oldPos)
		oldPos = nil
	end
	workspace.CurrentCamera.CameraSubject = localPlayer.Character.Humanoid
	localPlayer.Character.HumanoidRootPart.Anchored = false
end

return KillSomeone
