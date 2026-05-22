local MarketplaceService = game:GetService("MarketplaceService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local localPlayer = Players.LocalPlayer
local AutoGradeEva = {}

local connection
local track = {}

local didGoUpYet = true

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

local equipedDb = false
local state = false

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
			if not equipedDb then
				game:GetService("ReplicatedStorage").Events.Equip:FireServer(true)
				equipedDb = true
			end
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
		else
			if equipedDb then
				game:GetService("ReplicatedStorage").Events.Equip:FireServer(false)
				equipedDb = false
			end
			for _, animTrack in track do
				animTrack:AdjustSpeed(0)
			end
			connection:Disconnect()
			workspace.CurrentCamera.CameraSubject = localPlayer.Character.Humanoid
		end
	end)
end

local animationLists = {}

local nothingThereHitAnim = {
	"rbxassetid://16428863879",
	"rbxassetid://16390219304",
	"rbxassetid://16390215619",
	"rbxassetid://16390221563",
	"rbxassetid://16390165394",
	"rbxassetid://16390173071",
	"rbxassetid://16390234461",
	"rbxassetid://16390226552",
	"rbxassetid://15151732756",
	"rbxassetid://94944102411307",
}

local function checkAnimations(tabled, animator)
	for _, track in animator:GetPlayingAnimationTracks() do
		if track.Animation.AnimationId then
			if table.find(tabled, track.Animation.AnimationId) then
				return false
			end
		end
	end
	return true
end

local function killBehind(offset)
	local player = game.Players.LocalPlayer.Character.Humanoid.Animator
	local m1Count = 0
	for _, animation in
		game:GetService("ReplicatedStorage").WeaponINFO[game.Players.LocalPlayer.Data.Weapon.Value]:GetChildren()
	do
		if animation:IsA("Animation") then
			if animation.Name:find("AttackAnimation") and animation.Name ~= "ChargedAttackAnimation" then
				m1Count = m1Count + 1
			end
		end
	end
	for i = 1, m1Count - 1 do
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
			if not equipedDb then
				game:GetService("ReplicatedStorage").Events.Equip:FireServer(true)
				equipedDb = true
			end
			for _, animTrack in track do
				animTrack:AdjustSpeed(1000)
			end
			local backDirection = -targetTable[1].HumanoidRootPart.CFrame.LookVector
			local teleportPosition = targetTable[1].HumanoidRootPart.CFrame.Position + (backDirection * 3)
			game:GetService("ReplicatedStorage").Events.BegunM1:FireServer(game.Players.LocalPlayer.Data.Weapon.Value)
			if not checkAnimations(nothingThereHitAnim, targetTable[1].Humanoid.Animator) then
				localPlayer.Character.HumanoidRootPart:PivotTo(targetTable[1]:GetPivot() + Vector3.new(0, 100, 0))
			else
				localPlayer.Character.HumanoidRootPart:PivotTo(
					CFrame.new(teleportPosition, targetTable[1].HumanoidRootPart.CFrame.Position)
				)
				workspace.CurrentCamera.CameraSubject = targetTable[1].Humanoid
			end
			localPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
			localPlayer.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
			localPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
		else
			if equipedDb then
				game:GetService("ReplicatedStorage").Events.Equip:FireServer(false)
				equipedDb = false
			end
			for _, animTrack in track do
				animTrack:AdjustSpeed(0)
			end
			connection:Disconnect()
			workspace.CurrentCamera.CameraSubject = localPlayer.Character.Humanoid
		end
	end)
end

local function goUpElavator()
	if not didGoUpYet then
		repeat
			if not state then
				break
			end
			task.wait(1)
			for _, npc in workspace.NPCS:GetChildren() do
				if npc.Name == "Elevator" and npc:FindFirstChild("NormalTP") then
					localPlayer.Character:PivotTo(npc:GetPivot())
					npc.TalkToNPC:FireServer()
				end
			end
			if clickButton("Take") then
				didGoUpYet = true
			end
		until didGoUpYet
	end
	didGoUpYet = true
end

local function clickBegin()
	local clickBeginYet = false
	if workspace.NPCS:FindFirstChild("Hana Association Examiner") then
		repeat
			if not state then
				break
			end
			task.wait()
			localPlayer.Character:PivotTo(workspace.NPCS["Hana Association Examiner"]:GetPivot())
			workspace.NPCS["Hana Association Examiner"].TalkToNPC:FireServer()
			if clickButton("Begin") then
				clickBeginYet = true
			end
		until clickBeginYet
	end
end

local gradeFunctions = {
	[9] = function()
		local fixerClick = false
		goUpElavator()
		repeat
			if not state then
				break
			end
			task.wait(0.5)
			localPlayer.Character:PivotTo(workspace.NPCS["Hana Association Examiner"]:GetPivot())
			workspace.NPCS["Hana Association Examiner"].TalkToNPC:FireServer()
			clickButton("Begin")
			clickButton("9")
			clickButton("Every")
			clickButton("125")
			clickButton("13.5")
			clickButton("Tower")
			if clickButton("Fixer") then
				fixerClick = true
			end
		until fixerClick
	end,
	[8] = function(offset)
		local clickBeginYet = false
		goUpElavator()
		clickBegin()
		killMob(offset)
	end,
	[7] = function(offset)
		goUpElavator()
		clickBegin()
		task.wait(1)
		killMob(offset)
	end,
	[6] = function(offset)
		goUpElavator()
		clickBegin()
		task.wait(1)
		killMob(offset)
	end,
	[5] = function(offset)
		goUpElavator()
		clickBegin()
		repeat
			task.wait()
		until #workspace.Alive:GetChildren() >= 2
		for _, npc in workspace.NPCS:GetChildren() do
			if npc.Name == "Elevator" and npc:FindFirstChild("NormalTP") then
				localPlayer.Character:PivotTo(npc:GetPivot())
			end
		end
	end,
	[4] = function(offset)
		goUpElavator()
		clickBegin()
		repeat
			task.wait()
		until #workspace.Alive:GetChildren() >= 2
		killMob(offset)
	end,
	[3] = function(offset)
		goUpElavator()
		clickBegin()
		repeat
			task.wait()
		until #workspace.Alive:GetChildren() >= 2
		killMob(offset)
	end,
	[2] = function(offset)
		goUpElavator()
		clickBegin()
		repeat
			task.wait()
		until #workspace.Alive:GetChildren() >= 2
		killBehind(offset)
	end,
}

function AutoGradeEva.on(offset)
	AutoGradeEva.off()
	if game.PlaceId ~= 99831550635699 then
		return false, "Not in the exam"
	end
	if not workspace.Map:FindFirstChild("ExamRoom") then
		return false, "Not in the exam"
	end
	state = true
	if gradeFunctions[tonumber(game:GetService("Players").LocalPlayer.Data.Grade.Value)] then
		pcall(function()
			gradeFunctions[tonumber(game:GetService("Players").LocalPlayer.Data.Grade.Value)](offset)
		end)
		return true, "success"
	else
		return false, "not found"
	end
end

function AutoGradeEva.off()
	state = false
	if connection then
		connection:Disconnect()
		connection = nil
	end
	for _, anim in track do
		anim:Stop()
		anim:Destroy()
		anim = nil
	end
	workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
end

return AutoGradeEva
