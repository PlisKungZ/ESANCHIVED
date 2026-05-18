local MarketplaceService = game:GetService("MarketplaceService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local localPlayer = Players.LocalPlayer
local AutoLibrary = {}

local connection
local track = {}
local state = false

local safeZone = {
	["Kether"] = CFrame.new(
		4729.77637,
		338.901337,
		-1197.84521,
		0.998169243,
		-4.15211643e-09,
		0.0604829043,
		1.09101705e-09,
		1,
		5.06440081e-08,
		-0.0604829043,
		-5.04853013e-08,
		0.998169243
	),
	["Language"] = CFrame.new(4799.5625, 390.056946, -1166.06909, 1, 0, 0, 0, 1, 0, 0, 0, 1),
	["Philosophy"] = CFrame.new(
		996.82196,
		1746.71643,
		-1511.82288,
		-0.932488382,
		-7.2899482e-08,
		0.361200005,
		-2.38091999e-08,
		1,
		1.40359035e-07,
		-0.361200005,
		1.22283282e-07,
		-0.932488382
	),
}

local floorIdentifier = {
	["Kether"] = "Books",
	["Language"] = "Language VFX",
	["Philosophy"] = "Binah Floor",
}

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

local waitingPeriod = false
local bossWaited = false
local pressedOrdeal = false
local teleported = false

function AutoLibrary.on(offset, floor)
	pcall(function()
		AutoLibrary.off()
		state = true
		local teleported = false
		if game.PlaceId ~= 99831550635699 then
			return false, "Not in the library"
		end
		if not workspace:GetAttribute("ServerType") == "Library" then
			return false, "Not in the library"
		end

		task.wait(1)
		if not workspace.Map:FindFirstChild(floorIdentifier[floor]) and not pressedOrdeal then
			localPlayer.Character:PivotTo(CFrame.new(731.274353, 525.687317, 1016.26477))
			task.wait(1)
			workspace.NPCS["Ordeal Entrance"].TalkToNPC:FireServer()
			task.wait(1)
			if clickButton("Begin") then
				pressedOrdeal = true
			else
				clickButton("Select")
				task.wait(1)
				clickButton(floor)
				task.wait(1)
				workspace.NPCS["Ordeal Entrance"].TalkToNPC:FireServer()
				task.wait(1)
				clickButton("Begin")
				pressedOrdeal = true
			end
		else
			pressedOrdeal = true
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
		local M1cooldown = false
		repeat
			task.wait()
		until workspace.Map:FindFirstChild(floorIdentifier[floor])
		localPlayer.Character.HumanoidRootPart:PivotTo(safeZone[floor])
		local equipDebounce = false
		connection = RunService.PostSimulation:Connect(LPH_NO_VIRTUALIZE(function(delta)
			if math.floor(workspace.DistributedGameTime) < 0 then
				game:GetService("ReplicatedStorage").Events.Equip:FireServer(false)
				for _, animTrack in track do
					animTrack:AdjustSpeed(0)
				end
				workspace.CurrentCamera.CameraSubject = localPlayer.Character.Humanoid
				localPlayer.Character:PivotTo(safeZone[floor])
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
				if not equipDebounce then
					equipDebounce = true
					game:GetService("ReplicatedStorage").Events.Equip:FireServer(true)
				end
				for _, animTrack in track do
					animTrack:AdjustSpeed(1000)
				end
				local offset =
					Vector3.new(math.random(0, 1), -math.random(offset, offset + math.random(1, 2)), math.random(0, 1))

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
					localPlayer.Character.HumanoidRootPart:PivotTo(safeZone[floor])
					game:GetService("ReplicatedStorage").Events.Equip:FireServer(false)
					for _, animTrack in track do
						animTrack:AdjustSpeed(0)
					end
					workspace.CurrentCamera.CameraSubject = localPlayer.Character.Humanoid
					localPlayer.Character:PivotTo(safeZone[floor])
				end
			end
		end))

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
	end)
	return true
end

function AutoLibrary.off(floor)
	pcall(function()
		state = true
		pressedOrdeal = false
		if connection then
			connection:Disconnect()
			connection = nil
			if safeZone[floor] then
				localPlayer.Character:PivotTo(safeZone[floor])
			end
		end
		for _, anim in track do
			anim:Stop()
			anim:Destroy()
			anim = nil
		end
	end)
end

return AutoLibrary
