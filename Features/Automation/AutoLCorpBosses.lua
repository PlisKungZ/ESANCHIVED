local MarketplaceService = game:GetService("MarketplaceService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local localPlayer = Players.LocalPlayer
local AutoLCorpBosses = {}

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
local ignoreLists = { "Thumb Soldato", "Thumb Soldato III" }
local function isInIgnoreLists(name)
	for _, value in ignoreLists do
		if value:find(name) or value == name then
			return true
		end
	end
	return false
end

local function getDroppedItems()
	local tabled = {}
	for _, item in workspace.Thrown:GetChildren() do
		for _, prompt in item:GetDescendants() do
			if prompt:IsA("ProximityPrompt") then
				table.insert(tabled, item)
			end
		end
	end
	return tabled
end

local gripDebounce = false
local bossesName = {
	["Lei Heng"] = "Capo IIII of The Thumb",
	["Gloom"] = "Absolute Gloom",
	["Pride"] = "Absolute Pride",
	["Wrath"] = "Absolute Wrath",
	["Desire"] = "Absolute Desire",
	["Sloth"] = "Absolute Sloth",
	["Envy"] = "Absolute Envy",
	["Gluttony"] = "Absolute Gluttony",
}
local bossesFunctions = {
	["Lei Heng"] = function()
		local fragmentSelf = workspace.NPCS:FindFirstChild("Fragmented Self")
		local ordealEntrance = false
		if workspace.NPCS:FindFirstChild("Ordeal Entrance") then
			ordealEntrance = true
			if
				not workspace.Alive:FindFirstChild("Capo IIII of The Thumb")
				and not workspace.NPCS["Ordeal Entrance"]:FindFirstChild("LeiHengRig")
			then
				local clickFace = false
				repeat
					task.wait(0.5)
					workspace.NPCS["Ordeal Entrance"].TalkToNPC:FireServer()
					localPlayer.Character:PivotTo(workspace.NPCS["Ordeal Entrance"]:GetPivot())
					if clickButton("Face") then
						clickFace = true
					end
				until clickFace
			end
		end
		if fragmentSelf and not ordealEntrance then
			local clickedWorld = false
			repeat
				task.wait(0.5)
				fragmentSelf.TalkToNPC:FireServer()
				localPlayer.Character:PivotTo(fragmentSelf:GetPivot())
				if clickButton("Worlds") then
					clickedWorld = true
				end
			until clickedWorld
			local clickThumb = false
			repeat
				task.wait(0.5)
				fragmentSelf.TalkToNPC:FireServer()
				localPlayer.Character:PivotTo(fragmentSelf:GetPivot())
				if clickButton("Thumb") then
					clickThumb = true
				end
			until clickThumb
			repeat
				task.wait()
			until workspace.NPCS:FindFirstChild("Ordeal Entrance")
			local clickFace = false
			repeat
				task.wait(0.5)
				workspace.NPCS["Ordeal Entrance"].TalkToNPC:FireServer()
				localPlayer.Character:PivotTo(workspace.NPCS["Ordeal Entrance"]:GetPivot())
				if clickButton("Face") then
					clickFace = true
				end
			until clickFace
		end
	end,
	["Gloom"] = function()
		local fragmentSelf = workspace.NPCS:FindFirstChild("Fragmented Self")
		if not workspace.Alive:FindFirstChild("Absolute Gloom") then
			local clickedSin = false
			repeat
				task.wait(0.5)
				fragmentSelf.TalkToNPC:FireServer()
				localPlayer.Character:PivotTo(fragmentSelf:GetPivot())
				if clickButton("Sin") then
					clickedSin = true
				end
			until clickedSin
			local clickGloom = false
			repeat
				task.wait(0.5)
				fragmentSelf.TalkToNPC:FireServer()
				localPlayer.Character:PivotTo(fragmentSelf:GetPivot())
				if clickButton("Gloom") then
					clickGloom = true
				end
			until clickGloom
		end
	end,
	["Pride"] = function()
		local fragmentSelf = workspace.NPCS:FindFirstChild("Fragmented Self")
		if not workspace.Alive:FindFirstChild("Absolute Pride") then
			local clickedSin = false
			repeat
				task.wait(0.5)
				fragmentSelf.TalkToNPC:FireServer()
				localPlayer.Character:PivotTo(fragmentSelf:GetPivot())
				if clickButton("Sin") then
					clickedSin = true
				end
			until clickedSin
			local click = false
			repeat
				task.wait(0.5)
				fragmentSelf.TalkToNPC:FireServer()
				localPlayer.Character:PivotTo(fragmentSelf:GetPivot())
				if clickButton("Pride") then
					click = true
				end
			until click
		end
	end,
	["Wrath"] = function()
		local fragmentSelf = workspace.NPCS:FindFirstChild("Fragmented Self")
		if not workspace.Alive:FindFirstChild("Absolute Wrath") then
			local clickedSin = false
			repeat
				task.wait(0.5)
				fragmentSelf.TalkToNPC:FireServer()
				localPlayer.Character:PivotTo(fragmentSelf:GetPivot())
				if clickButton("Sin") then
					clickedSin = true
				end
			until clickedSin
			local click = false
			repeat
				task.wait(0.5)
				fragmentSelf.TalkToNPC:FireServer()
				localPlayer.Character:PivotTo(fragmentSelf:GetPivot())
				if clickButton("Wrath") then
					click = true
				end
			until click
		end
	end,
	["Desire"] = function()
		local fragmentSelf = workspace.NPCS:FindFirstChild("Fragmented Self")
		if not workspace.Alive:FindFirstChild("Absolute Desire") then
			local clickedSin = false
			repeat
				task.wait(0.5)
				fragmentSelf.TalkToNPC:FireServer()
				localPlayer.Character:PivotTo(fragmentSelf:GetPivot())
				if clickButton("Sin") then
					clickedSin = true
				end
			until clickedSin
			local click = false
			repeat
				task.wait(0.5)
				fragmentSelf.TalkToNPC:FireServer()
				localPlayer.Character:PivotTo(fragmentSelf:GetPivot())
				if clickButton("Desire") then
					click = true
				end
			until click
		end
	end,
	["Sloth"] = function()
		local fragmentSelf = workspace.NPCS:FindFirstChild("Fragmented Self")
		if not workspace.Alive:FindFirstChild("Absolute Sloth") then
			local clickedSin = false
			repeat
				task.wait(0.5)
				fragmentSelf.TalkToNPC:FireServer()
				localPlayer.Character:PivotTo(fragmentSelf:GetPivot())
				if clickButton("Sin") then
					clickedSin = true
				end
			until clickedSin
			local click = false
			repeat
				task.wait(0.5)
				fragmentSelf.TalkToNPC:FireServer()
				localPlayer.Character:PivotTo(fragmentSelf:GetPivot())
				if clickButton("Sloth") then
					click = true
				end
			until click
		end
	end,
	["Envy"] = function()
		local fragmentSelf = workspace.NPCS:FindFirstChild("Fragmented Self")
		if not workspace.Alive:FindFirstChild("Absolute Envy") then
			local clickedSin = false
			repeat
				task.wait(0.5)
				fragmentSelf.TalkToNPC:FireServer()
				localPlayer.Character:PivotTo(fragmentSelf:GetPivot())
				if clickButton("Sin") then
					clickedSin = true
				end
			until clickedSin
			local click = false
			repeat
				task.wait(0.5)
				fragmentSelf.TalkToNPC:FireServer()
				localPlayer.Character:PivotTo(fragmentSelf:GetPivot())
				if clickButton("Envy") then
					click = true
				end
			until click
		end
	end,
	["Gluttony"] = function()
		local fragmentSelf = workspace.NPCS:FindFirstChild("Fragmented Self")
		if not workspace.Alive:FindFirstChild("Absolute Gluttony") then
			local clickedSin = false
			repeat
				task.wait(0.5)
				fragmentSelf.TalkToNPC:FireServer()
				localPlayer.Character:PivotTo(fragmentSelf:GetPivot())
				if clickButton("Sin") then
					clickedSin = true
				end
			until clickedSin
			local click = false
			repeat
				task.wait(0.5)
				fragmentSelf.TalkToNPC:FireServer()
				localPlayer.Character:PivotTo(fragmentSelf:GetPivot())
				if clickButton("Gluttony") then
					click = true
				end
			until click
		end
	end,
}

function AutoLCorpBosses.on()
	AutoLCorpBosses.off()
	state = true
	if game.PlaceId ~= 99831550635699 then
		return false, "Not in the L Corp"
	end
	if not workspace:GetAttribute("ServerType") == "LCorpBranch" then
		return false, "Not in the L Corp"
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
	local equipDebounce = false
	local killBoss = false
	local canDoAnythingAfterBoss = false
	bossesFunctions[Options.lCorpBossSelection.Value]()
	local db = false
	connection = RunService.PostSimulation:Connect(LPH_NO_VIRTUALIZE(function(delta)
		if not state then
			return
		end

		if killBoss and canDoAnythingAfterBoss then
			db = true
			if localPlayer.Character then
				if localPlayer.Character:FindFirstChild("Humanoid") then
					workspace.CurrentCamera.CameraSubject = localPlayer.Character.Humanoid
				end
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
			else
				local clickExtract = false
				repeat
					task.wait(0.5)
					localPlayer.Character:PivotTo(CFrame.new(103.09710693359375, 981.3513793945312, -84.36695098876953))
				until workspace.NPCS:FindFirstChild("Elevator Door")
				repeat
					task.wait(0.5)
					workspace.NPCS["Elevator Door"].TalkToNPC:FireServer()
					if clickButton("Extract") then
						clickExtract = true
					end
					localPlayer.Character:PivotTo(CFrame.new(103.09710693359375, 981.3513793945312, -84.36695098876953))
				until clickExtract
			end
			db = false
			return
		end
		localPlayer.Data.Stamina.Value = 100
		local targetTable = {}

		for _, human in workspace.Alive:GetChildren() do
			if
				not Players:GetPlayerFromCharacter(human)
				and human.Humanoid.Health > 0
				and not human:FindFirstChild("GotGripped")
				and not isInIgnoreLists(human.Name)
			then
				table.insert(targetTable, human)
			end
		end

		table.sort(targetTable, function(a, b)
			return a.Humanoid.MaxHealth > b.Humanoid.MaxHealth
		end)

		if #targetTable ~= 0 then
			localPlayer.Character.HumanoidRootPart.Anchored = false
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
			local offset = Vector3.new(0, -Options.AutoLCorpYOffset.Value, 0)

			if targetTable[1]:FindFirstChild("Knocked") and not gripDebounce then
				gripDebounce = true
				localPlayer.Character.HumanoidRootPart:PivotTo(
					targetTable[1].HumanoidRootPart.CFrame + Vector3.new(0, 2, 0)
				)
				game:GetService("ReplicatedStorage")
					:WaitForChild("Events")
					:WaitForChild("Grip")
					:FireServer(localPlayer.Character)
				task.delay(1, function()
					gripDebounce = false
				end)
			end

			if targetTable[1]:FindFirstChild("GettingGripped") and not killBoss then
				if targetTable[1].Name == bossesName[Options.lCorpBossSelection.Value] then
					killBoss = true
					localPlayer.Character.HumanoidRootPart:PivotTo(
						targetTable[1].HumanoidRootPart.CFrame + Vector3.new(0, 10, 0)
					)
					task.delay(5, function()
						canDoAnythingAfterBoss = true
					end)
				end
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
		end
	end))
	return true
end

function AutoLCorpBosses.off(floor)
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

return AutoLCorpBosses
