local VirtualInputManager = game:GetService("VirtualInputManager")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local localPlayer = Players.LocalPlayer

local AutoRailway = {}

local connection
local track = {}
local state = false
local killingMob = false

local function clickButton(text)
	for _, frame in game:GetService("Players").LocalPlayer.PlayerGui.Dialogue.MainFrame.Options.Scroll:GetChildren() do
		if frame:IsA("Frame") then
			if frame.OptionText.Text == text or frame.OptionText.Text:find(text) then
				replicatesignal(frame.OptionButton.MouseButton1Click)
				return true
			end
		end
	end
	return false
end

local function openDoorWithTiedToString(text, section)
	for _, model in workspace.Map.Map["Carriage_" .. tostring(section)].Doors:GetChildren() do
		if model:IsA("Model") then
			if model:FindFirstChild("TiedTo") then
				if model.TiedTo.Value.Name == text or model.TiedTo.Value.Name:find(text) then
					if model:FindFirstChildWhichIsA("ProximityPrompt").Enabled then
						localPlayer.Character:PivotTo(model:GetPivot())
						task.wait(1)
						fireproximityprompt(model:FindFirstChildWhichIsA("ProximityPrompt"))
						return true
					else
						return false
					end
				end
			end
		end
	end
end

local Teleported = false

local function killMob(offset)
	local player = game.Players.LocalPlayer.Character.Humanoid.Animator
	for i = 1, 3 do
		local animtrack = player:LoadAnimation(
			game:GetService("ReplicatedStorage").WeaponINFO[game.Players.LocalPlayer.Data.Weapon.Value]["AttackAnimation" .. tostring(
				i
			)]
		)

		game:GetService("ReplicatedStorage").Events.BegunM1:FireServer(game.Players.LocalPlayer.Data.Weapon.Value)

		animtrack:Play(0, 0.01, 100000)
		animtrack.Looped = true
		table.insert(track, animtrack)
	end
	connection = RunService.PostSimulation:Connect(function(delta)
		localPlayer.Data.Stamina.Value = 100
		local targetTable = {}
		for _, human in workspace.Alive:GetChildren() do
			if
				not Players:GetPlayerFromCharacter(human)
				and human.Humanoid.Health > 0
				and not human:FindFirstChild("GotGripped")
			then
				table.insert(targetTable, human)
			end
		end

		table.sort(targetTable, function(a, b)
			return a.Humanoid.MaxHealth > b.Humanoid.MaxHealth
		end)

		if #targetTable ~= 0 then
			killingMob = true
			Teleported = false
			for _, animTrack in track do
				animTrack:AdjustSpeed(1000)
			end
			local offset = Vector3.new(math.random(0, 1), math.random(offset, offset + 1), math.random(0, 1))
			game:GetService("ReplicatedStorage").Events.BegunM1:FireServer(game.Players.LocalPlayer.Data.Weapon.Value)

			localPlayer.Character.HumanoidRootPart:PivotTo(
				targetTable[1].HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0) + offset
			)
			workspace.CurrentCamera.CameraSubject = targetTable[1].Humanoid
			localPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
			localPlayer.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
			localPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
			game:GetService("ReplicatedStorage")
				:WaitForChild("Events")
				:WaitForChild("Grip")
				:FireServer(localPlayer.Character)
		else
			workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
			killingMob = false
			Teleported = true
			localPlayer.Character:PivotTo(CFrame.new(-318.950195, 391.98999, 551.724976, 1, 0, 0, 0, 1, 0, 0, 0, 1))
			for _, animTrack in track do
				animTrack:AdjustSpeed(0)
			end
		end
	end)
	task.spawn(function()
		while connection do
			game:GetService("ReplicatedStorage").Events.Equip:FireServer(true)
			task.wait(5)
			if not connection then
				break
			end
			game:GetService("ReplicatedStorage").Events.Equip:FireServer(false)
		end
	end)

	task.spawn(function()
		while connection do
			task.wait()
			if killingMob then
				repeat
					task.wait()
				until not killingMob or not connection
			end
			if not connection then
				break
			end
		end
	end)
end

function AutoRailway.on(offset, floor)
	AutoRailway.off()
	state = false

	if game.PlaceId ~= 99831550635699 then
		return false, "Not in the Railway"
	end
	if not workspace:GetAttribute("ServerType") == "RefractionRailway" then
		return false, "Not in the Railway"
	else
		return true
	end

	local kb = workspace:FindFirstChild("KillBricks")
	if kb then
		kb:Destroy()
	end

	if not localPlayer.Character:FindFirstChild("AirTime") then
		local airTime = Instance.new("Folder")
		airTime.Name = "AirTime"
		airTime.Parent = localPlayer.Character
	end

	game:GetService("ReplicatedStorage").Events.Equip:FireServer(true)

	killMob(offset)

	return true
end

function AutoRailway.off()
	state = true
	killingMob = false
	if connection then
		connection:Disconnect()
		connection = nil
		localPlayer.Character:PivotTo(CFrame.new(-318.950195, 391.98999, 551.724976, 1, 0, 0, 0, 1, 0, 0, 0, 1))
	end
	for _, anim in track do
		anim:Stop()
		anim:Destroy()
		anim = nil
	end
	workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
end

return AutoRailway
