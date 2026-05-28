local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local localPlayer = Players.LocalPlayer
local AutoRicardo = {}

local connection
local track = {}
local state = false

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

local gripDebounce = false

function AutoRicardo.on(offset, floor, buff)
	AutoRicardo.off()
	state = true
	local teleported = false
	if game.PlaceId ~= 99831550635699 then
		return false, "Not in the library"
	end
	if not workspace:GetAttribute("ServerType") == "Ricardo" then
		return false, "Not in the library"
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
	local talkPart = workspace.NPCS:FindFirstChild("RicardoChallengePart")
	if talkPart and not workspace.Alive:FindFirstChild("Big Brother Of The Middle") then
		local mainPart = talkPart:FindFirstChild("MainPart")
		if mainPart then
			local clickBring = false
			repeat
				task.wait()
				localPlayer.Character:PivotTo(mainPart:GetPivot())
				fireproximityprompt(talkPart.InteractPrompt)
				if clickButton("Bring") then
					clickBring = true
				end
			until clickBring
		end
	end

	game:GetService("ReplicatedStorage").Events.Equip:FireServer(true)
	local equipDebounce = false
	connection = RunService.PostSimulation:Connect(LPH_NO_VIRTUALIZE(function(delta)
		if not state then
			return
		end
		if math.floor(workspace.DistributedGameTime) < 0 then
			game:GetService("ReplicatedStorage").Events.Equip:FireServer(false)
			for _, animTrack in track do
				animTrack:AdjustSpeed(0)
			end
			workspace.CurrentCamera.CameraSubject = localPlayer.Character.Humanoid
			localPlayer.Character:PivotTo(CFrame.new(-12874, -11, 1070))
			return true
		end
		teleported = false
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
			localPlayer.Character.HumanoidRootPart.Anchored = false
			local isAllAlerted = true
			for _, target in targetTable do
				if target.Target.Value ~= localPlayer.Character then
					localPlayer.Character.HumanoidRootPart:PivotTo(
						targetTable[1].HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0)
							+ Vector3.new(0, 10, 0)
					)
					isAllAlerted = false
				end
			end
			if not isAllAlerted then
				return
			end
			if not equipDebounce then
				equipDebounce = true
				game:GetService("ReplicatedStorage").Events.Equip:FireServer(true)
				for _, anim in track do
					anim:Stop()
					anim:Destroy()
				end
				table.clear(track)
				local m1Count = 0
				for _, animation in
					game:GetService("ReplicatedStorage").WeaponINFO[game.Players.LocalPlayer.Data.Weapon.Value]
						:GetChildren()
				do
					if animation:IsA("Animation") then
						if animation.Name:find("AttackAnimation") and animation.Name ~= "ChargedAttackAnimation" then
							m1Count = m1Count + 1
						end
					end
				end
				for i = 1, m1Count - 1 do
					local animtrack = localPlayer.Character.Humanoid.Animator:LoadAnimation(
						game:GetService("ReplicatedStorage").WeaponINFO[game.Players.LocalPlayer.Data.Weapon.Value]["AttackAnimation" .. tostring(
							i
						)]
					)
					animtrack:Play(0, 0.01, 100000)
					animtrack.Looped = true
					table.insert(track, animtrack)
				end
				task.delay(2.5, function()
					if connection then
						for _, anim in track do
							anim:Stop()
							anim:Destroy()
						end
						table.clear(track)
						game:GetService("ReplicatedStorage").Events.Equip:FireServer(false)
					end
					equipDebounce = false
				end)
			end
			local offset = Vector3.new(0, -Options.AutoRicardoYOffset.Value, 0)

			if targetTable[1]:FindFirstChild("Knocked") and not gripDebounce then
				gripDebounce = true
				localPlayer.Character.HumanoidRootPart:PivotTo(targetTable[1].HumanoidRootPart.CFrame)
				game:GetService("ReplicatedStorage")
					:WaitForChild("Events")
					:WaitForChild("Grip")
					:FireServer(localPlayer.Character)
				task.delay(1, function()
					gripDebounce = false
				end)
			end

			if targetTable[1]:FindFirstChild("GettingGripped") then
				localPlayer.Character.HumanoidRootPart.Anchored = true
				return
			end
			if targetTable[1].Target.Value ~= localPlayer.Character then
				localPlayer.Character.HumanoidRootPart:PivotTo(
					targetTable[1].HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0) + Vector3.new(0, 5, 0)
				)
				return
			end
			localPlayer.Character.HumanoidRootPart:PivotTo(
				targetTable[1].HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0) + offset
			)
			workspace.CurrentCamera.CameraSubject = targetTable[1].Humanoid
			localPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
			localPlayer.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
			localPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
		else
			if not teleported then
				teleported = true
				equipDebounce = false
				localPlayer.Character:PivotTo(CFrame.new(-12874, -11, 1070))
				game:GetService("ReplicatedStorage").Events.Equip:FireServer(false)
				for _, animTrack in track do
					animTrack:AdjustSpeed(0)
				end
				workspace.CurrentCamera.CameraSubject = localPlayer.Character.Humanoid
				localPlayer.Character:PivotTo(CFrame.new(-12874, -11, 1070))
			end
		end
	end))
	return true
end

function AutoRicardo.off(floor)
	state = false
	if connection then
		connection:Disconnect()
		connection = nil
	end
	for _, anim in track do
		anim:Stop()
		anim:Destroy()
	end
	table.clear(track)
	workspace.CurrentCamera.CameraSubject = localPlayer.Character.Humanoid
	localPlayer.Character.HumanoidRootPart.Anchored = false
end

return AutoRicardo
