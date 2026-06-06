local VirtualInputManager = game:GetService("VirtualInputManager")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local localPlayer = Players.LocalPlayer

local AutoWarp = {}

local connection
local track = {}
local state = false
local killingMob = false
local talkRemoteCd = false

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
local m1Debounce = false
local equippedDebounce = false
local gripDebounce = false
local function killMob(offset)
	connection = RunService.PostSimulation:Connect(LPH_NO_VIRTUALIZE(function(delta)
		-- only run logic every 0.1s instead of every frame

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
			if not equippedDebounce then
				equippedDebounce = true
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
				task.delay(5, function()
					if connection then
						for _, anim in track do
							anim:Stop()
							anim:Destroy()
						end
						table.clear(track)
						game:GetService("ReplicatedStorage").Events.Equip:FireServer(false)
					end
					equippedDebounce = false
				end)
			end
			localPlayer.Character.HumanoidRootPart.Anchored = false
			killingMob = true
			Teleported = false
			for _, animTrack in track do
				animTrack:Play()
				animTrack:AdjustSpeed(1000)
			end
			local offset = Vector3.new(0, -Options.autoWarpYOffset.Value, 0)
			if not m1Debounce then
				m1Debounce = true
				task.delay(1.5, function()
					m1Debounce = false
				end)
			end
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
			if localPlayer.Character:FindFirstChild("GripNotInterrupted") then
				localPlayer.Character.HumanoidRootPart.Anchored = true
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
			if equippedDebounce then
				equippedDebounce = false
				game:GetService("ReplicatedStorage").Events.Equip:FireServer(false)
			end
			workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
			killingMob = false
			if not Teleported then
				Teleported = true
				localPlayer.Character:PivotTo(CFrame.new(-318.950195, 391.98999, 551.724976, 1, 0, 0, 0, 1, 0, 0, 0, 1))
				for _, animTrack in track do
					animTrack:Stop()
				end
			end
		end

		if killingMob then
			return
		end
		if not connection then
			return
		end
		localPlayer.Character.HumanoidRootPart.Anchored = false

		if not openDoorWithTiedToString("CarriageEntranceDoor", 6) then
			localPlayer.Character:PivotTo(
				workspace
					:WaitForChild("NPCS")
					:WaitForChild("PrinceFight")
					:WaitForChild("The Prince of the Parade")
					:GetPivot()
			)
			if not talkRemoteCd then
				talkRemoteCd = true
				workspace
					:WaitForChild("NPCS")
					:WaitForChild("PrinceFight")
					:WaitForChild("The Prince of the Parade")
					:WaitForChild("TalkToNPC")
					:FireServer()
				clickButton("I'm here to end")
				clickButton("...")
				clickButton("What")
				task.delay(1, function()
					talkRemoteCd = false
				end)
			end
		end
	end))
end

function AutoWarp.on(offset, floor)
	AutoWarp.off()
	state = false

	if game.PlaceId ~= 99831550635699 then
		return false, "Not in the Warp Train"
	end

	if not workspace:GetAttribute("WARPServer") then
		return false, "Not in the Warp Train"
	end

	if not workspace:FindFirstChild("Spawns") then
		if not workspace.Spawns:FindFirstChild("WARPSpawn") then
			return false, "Not in the Warp Train"
		end
		return false, "Not in the Warp Train"
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

function AutoWarp.off()
	state = true
	killingMob = false
	if connection then
		connection:Disconnect()
		connection = nil
		localPlayer.Character:PivotTo(
			CFrame.new(
				-331.066559,
				392.213531,
				550.836121,
				-0.0747568682,
				0.00394378649,
				-0.997193992,
				-1.45631475e-05,
				0.999992192,
				0.00395594304,
				0.997201741,
				0.00031024238,
				-0.0747562274
			)
		)
	end
	for _, anim in track do
		anim:Stop()
		anim:Destroy()
		anim = nil
	end
	workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
	localPlayer.Character.HumanoidRootPart.Anchored = false
end

return AutoWarp
