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
local gripDebounce = false
local pickingUpItem = false
local isBuffed = false
local currentCoroutine
local function getDroppedItems()
	local tabled = {}
	for _, item in workspace.Thrown:GetChildren() do
		for _, prompt in item:GetDescendants() do
			if prompt:IsA("ProximityPrompt") and localPlayer:DistanceFromCharacter(item:GetPivot().Position) < 500 then
				table.insert(tabled, item)
			end
		end
	end
	return tabled
end

function AutoLibrary.on(offset, floor, buff)
	AutoLibrary.off()
	state = true
	local priorityNames = { "Angelica" }
	currentCoroutine = task.spawn(function()
		local teleported = false
		if game.PlaceId ~= 99831550635699 then
			return false, "Not in the library"
		end
		if not workspace:GetAttribute("ServerType") == "Library" then
			return false, "Not in the library"
		end
		if not workspace.NPCS:FindFirstChild("Library Director") then
			return false, "Not in the library"
		end
		if not state then
			return
		end
		if not workspace.Map:FindFirstChild(floorIdentifier[Options.libraryFloorSelection.Value]) then
			task.wait(5)
		end
		local bookOfTheLib = localPlayer.Backpack:FindFirstChild("Book Of The Library")
		if
			Toggles.buffLibrary.Value
			and bookOfTheLib
			and not workspace.Map:FindFirstChild(floorIdentifier[Options.libraryFloorSelection.Value])
			and not pressedOrdeal
		then
			if not state then
				return
			end
			bookOfTheLib.Parent = localPlayer.Character
			if not state then
				return
			end
			localPlayer.Character:PivotTo(workspace.NPCS["Library Director"]:GetPivot())
			task.wait(1)
			if not state then
				return
			end
			workspace.NPCS["Library Director"].TalkToNPC:FireServer()
			if not localPlayer.Data.IsTalking.Value then
				if not state then
					return
				end
				repeat
					if not state then
						return
					end
					localPlayer.Character:PivotTo(workspace.NPCS["Library Director"]:GetPivot())
					workspace.NPCS["Library Director"].TalkToNPC:FireServer()
					task.wait(0.5)
				until localPlayer.Data.IsTalking.Value
			end
			if not state then
				return
			end
			task.wait(1)
			if not state then
				return
			end
			local clickBye = false
			repeat
				task.wait()
				if not state then
					return
				end
				if clickButton("Bye") then
					clickBye = true
				end
			until clickBye
			if not state then
				return
			end
		end
		if not state then
			return
		end
		if
			not workspace.Map:FindFirstChild(floorIdentifier[Options.libraryFloorSelection.Value])
			and not pressedOrdeal
		then
			localPlayer.Character:PivotTo(CFrame.new(731.274353, 525.687317, 1016.26477))
			if not state then
				return
			end
			task.wait(1)
			if not state then
				return
			end
			workspace.NPCS["Ordeal Entrance"].TalkToNPC:FireServer()
			if not state then
				return
			end
			if not localPlayer.Data.IsTalking.Value then
				repeat
					if not state then
						return
					end
					localPlayer.Character:PivotTo(CFrame.new(731.274353, 525.687317, 1016.26477))
					workspace.NPCS["Ordeal Entrance"].TalkToNPC:FireServer()
					task.wait(0.5)
				until localPlayer.Data.IsTalking.Value
			end
			task.wait(1)
			if not state then
				return
			end
			if clickButton("Begin") then
				if not state then
					return
				end
				pressedOrdeal = true
			else
				local select = false
				repeat
					task.wait()
					if not state then
						return
					end
					if clickButton("Select") then
						select = true
					end
				until select
				local floorSelect = false
				repeat
					task.wait()
					if not state then
						return
					end
					if clickButton(Options.libraryFloorSelection.Value) then
						floorSelect = true
					end
				until floorSelect
				task.wait(1)
				workspace.NPCS["Ordeal Entrance"].TalkToNPC:FireServer()
				if not localPlayer.Data.IsTalking.Value then
					repeat
						if not state then
							return
						end
						localPlayer.Character:PivotTo(CFrame.new(731.274353, 525.687317, 1016.26477))
						workspace.NPCS["Ordeal Entrance"].TalkToNPC:FireServer()
						task.wait(0.5)
					until localPlayer.Data.IsTalking.Value
				end
				task.wait(1)
				local begin = false
				repeat
					task.wait()
					if not state then
						return
					end
					if clickButton("Begin") then
						begin = true
					end
				until begin
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
			if not state then
				return
			end
		until workspace.Map:FindFirstChild(floorIdentifier[Options.libraryFloorSelection.Value])
		localPlayer.Character.HumanoidRootPart:PivotTo(safeZone[Options.libraryFloorSelection.Value])
		local equipDebounce = false
		connection = RunService.PostSimulation:Connect(LPH_NO_VIRTUALIZE(function(delta)
			if not connection then
				return
			end
			if not state then
				return
			end
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
				local aInList = table.find(priorityNames, a.Name) ~= nil
				local bInList = table.find(priorityNames, b.Name) ~= nil

				if aInList ~= bInList then
					return aInList
				end
				return a.Humanoid.MaxHealth > b.Humanoid.MaxHealth
			end)

			if #targetTable ~= 0 then
				localPlayer.Character.HumanoidRootPart.Anchored = false
				local isAllAlerted = true
				for _, target in targetTable do
					if not target:FindFirstChild("Aggrod") then
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
							if
								animation.Name:find("AttackAnimation")
								and animation.Name ~= "ChargedAttackAnimation"
							then
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
				local offset = Vector3.new(0, -Options.autoLibYOffset.Value, 0)

				if targetTable[1]:FindFirstChild("GettingGripped") then
					localPlayer.Character.HumanoidRootPart.Anchored = true
					return
				end
				if targetTable[1]:FindFirstChild("Knocked") then
					if not gripDebounce then
						gripDebounce = true
						game:GetService("ReplicatedStorage")
							:WaitForChild("Events")
							:WaitForChild("Grip")
							:FireServer(localPlayer.Character)
						task.delay(1, function()
							gripDebounce = false
						end)
					end
					localPlayer.Character.HumanoidRootPart:PivotTo(
						targetTable[1].HumanoidRootPart.CFrame + Vector3.new(0, 1, 0)
					)
					return
				end
				if targetTable[1].Target.Value ~= localPlayer.Character then
					localPlayer.Character.HumanoidRootPart:PivotTo(
						targetTable[1].HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0)
							+ Vector3.new(0, 5, 0)
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
				if not connection then
					pickingUpItem = false
					return
				end
				if pickingUpItem then
					return
				end
				local droppedItems = getDroppedItems()
				if #droppedItems ~= 0 then
					pickingUpItem = true
					for _, item in droppedItems do
						if not connection then
							pickingUpItem = false
							return
						end
						for _, prompt in item:GetDescendants() do
							if not connection then
								pickingUpItem = false
								return
							end
							if prompt:IsA("ProximityPrompt") then
								localPlayer.Character:PivotTo(item:GetPivot())
								fireproximityprompt(prompt)
								if not connection then
									pickingUpItem = false
									return
								end
								repeat
									if not connection then
										pickingUpItem = false
										return
									end
									localPlayer.Character:PivotTo(item:GetPivot())
									fireproximityprompt(prompt)
									task.wait()
								until not item.Parent
							end
						end
					end
					pickingUpItem = false
				end

				if not teleported then
					teleported = true
					equipDebounce = false
					localPlayer.Character.HumanoidRootPart:PivotTo(safeZone[Options.libraryFloorSelection.Value])
					game:GetService("ReplicatedStorage").Events.Equip:FireServer(false)
					for _, animTrack in track do
						animTrack:Stop()
					end
					workspace.CurrentCamera.CameraSubject = localPlayer.Character.Humanoid
					localPlayer.Character:PivotTo(safeZone[Options.libraryFloorSelection.Value])
				end
			end
		end))
	end)
	return true
end

function AutoLibrary.off(floor)
	state = false
	if currentCoroutine then
		task.cancel(currentCoroutine)
		currentCoroutine = nil
	end
	if connection then
		connection:Disconnect()
		connection = nil
		if safeZone[floor] then
			localPlayer.Character:PivotTo(safeZone[Options.libraryFloorSelection.Value])
		end
	end
	for _, anim in track do
		anim:Stop()
		anim:Destroy()
	end
	table.clear(track)
	workspace.CurrentCamera.CameraSubject = localPlayer.Character.Humanoid
	localPlayer.Character.HumanoidRootPart.Anchored = false
end

local buffLibraryConnection

function AutoLibrary.buffLibrary()
	if game.PlaceId ~= 99831550635699 then
		return false, "Not in the library"
	end
	if workspace:GetAttribute("ServerType") ~= "Library" then
		return false, "Not in the library"
	end
	if not workspace.NPCS:FindFirstChild("Library Director") then
		return false, "Not in the library"
	end
	if buffLibraryConnection then
		buffLibraryConnection:Disconnect()
		buffLibraryConnection = nil
	end
	if connection then
		return false, ""
	end
	if currentCoroutine then
		task.cancel(currentCoroutine)
		currentCoroutine = nil
	end
	if not isBuffed and localPlayer.Backpack:FindFirstChild("Book Of The Library") then
		localPlayer.Backpack:FindFirstChild("Book Of The Library").Parent = localPlayer.Character
		buffLibraryConnection = RunService.RenderStepped:Connect(function(deltaTime)
			localPlayer.Character:PivotTo(workspace.NPCS["Library Director"]:GetPivot())
			if not localPlayer.Data.IsTalking.Value then
				workspace.NPCS["Library Director"].TalkToNPC:FireServer()
			else
				buffLibraryConnection:Disconnect()
				buffLibraryConnection = nil
			end
			if connection then
				buffLibraryConnection:Disconnect()
				buffLibraryConnection = nil
			end
		end)
	end
end

return AutoLibrary
