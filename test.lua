-- Script Path: game:GetService("Workspace").Alive.TuataraLens.ClientHandler
-- Took 0.31s to decompile.
-- Executor: Volt (1.2.24.3)

--[[ 
    Decompiled with the Fission decompiler for RbxCli
    Bytecode Version: '9'
    Type Version: 3
    Decompile Options: InferTypes, InferRobloxTypes, AutoNameVariables
]]
local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService: CollectionService = game:GetService("CollectionService")
local RunService: RunService = game:GetService("RunService")
local TweenService: TweenService = game:GetService("TweenService")
local v4 = ReplicatedStorage.Assets
local UserInputService: UserInputService = game:GetService("UserInputService")
local v6 = ReplicatedStorage.Events
local v7: table = {}
local v8: table = { "AgilityChipBoardMK1", "AgilityChipBoardMK2", "AgilityChipBoardMK3", "AgilityChipBoardMK4" }
tick()
local v10: table = require(ReplicatedStorage.Modules.GeneralModule)
local v11: table = require(ReplicatedStorage.Modules.GetPartBoundsInBox)
local v12: table = require(ReplicatedStorage.Modules.CameraShaker)
local v13: table = require(ReplicatedStorage.Info.Keybinds)
local Players: Players = game:GetService("Players")
local v15 = game.Players.LocalPlayer
local v16 = v15:GetMouse()
local v17 = v15.Character
v15:GetPropertyChangedSignal("Character"):Connect(function()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 2
            ~ Argument Count: 0
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 0
            ~ Registers Used: R0-R0
            ~ Type Information: Unavailable
    ]]
	v17 = v15.Character
end)
local HumanoidRootPart: Instance = v17:WaitForChild("HumanoidRootPart")
local WalkSpeed: Instance = v17:WaitForChild("WalkSpeed")
local Humanoid: Humanoid = v17:FindFirstChildOfClass("Humanoid")
if not v17:FindFirstChild("ForceWeapon") then
	local Weapon: Instance = v15:WaitForChild("Data"):WaitForChild("Weapon")
	v21 = Weapon.Value
else
	local ForceWeapon: Instance = v17:FindFirstChild("ForceWeapon")
	v21 = ForceWeapon.Value
end
local v22 = ReplicatedStorage.WeaponINFO
local SwingSpeed: Instance = v22:FindFirstChild(v21):FindFirstChild("SwingSpeed")
v23 = SwingSpeed.Value
v15.PlayerGui:WaitForChild("OverlayGui")
local v24 = Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v4.DefaultRunAnimation)
local v25 = Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v4.WalkAnimation)
local v26 = Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v4.IdleAnimation)
v26.Priority = Enum.AnimationPriority.Movement
local v27 = Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v4.GotParried)
Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v4.ManifestDomain)
local v29 = Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v4.Manifest)
Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v4.StaggeredAnimation)
local v31 = Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v4.DashAnims.Air)
local v32 = Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v4.DashAnims.Forward)
local v33 = Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v4.DashAnims.Back)
local v34 = Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v4.DashAnims.Left)
local v35 = Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v4.DashAnims.Right)
v35.Priority = Enum.AnimationPriority.Action
v32.Priority = Enum.AnimationPriority.Action
v34.Priority = Enum.AnimationPriority.Action
v33.Priority = Enum.AnimationPriority.Action
v31.Priority = Enum.AnimationPriority.Action
local v36 = Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v4.Vault)
local v37 = Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v4.ClimbBoost)
local v38 = Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v4.ItemIdleAnimation)
local v39 = Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v4.DiveKickAnimation)
local v40 = Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v4.SlideAnimation)
local v41 = Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v4.DiveKickBoost)
local v42 = Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v4.CarryingAnim)
local v43 = Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v4.BackJump)
local v44 = Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v4.CleanTable)
Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v4.Resting)
local v46 = v12.new(Enum.RenderPriority.Camera.Value, function(arg0: number)
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 0
            ~ Argument Count: 1
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 1
            ~ Registers Used: R0-R3
            ~ Type Information: Unavailable
    ]]
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * arg0
end)
v46:Start()
local Passives: Instance = v15:WaitForChild("Data"):WaitForChild("Passives")
local v47: { string } = string.split(Passives.Value, ",")
local v1_Passives: Instance = v15:WaitForChild("Data"):WaitForChild("Passives")
Passives.Changed:Connect(function()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 2
            ~ Argument Count: 0
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 2
            ~ Registers Used: R0-R3
            ~ Type Information: Unavailable
    ]]
	local v2_Passives: Instance = v15:WaitForChild("Data"):WaitForChild("Passives")
	local v0: { string } = string.split(Passives.Value, ",")
	v47 = v0
end)
v48 = 1
local v49: boolean = false
local v50: boolean = false
local v51: boolean = false
local v52: boolean = false
local v53: boolean = false
local v54: boolean = false
local v55: boolean = false
local v56: boolean = false
local v57: boolean = false
local v58: boolean = false
local v59: boolean = false
local v60: boolean = false
local v61: boolean = false
local v62: boolean = false
local v63: boolean = false
local v64: boolean = false
local v65: boolean = false
local EquippedWeapon: Instance = v17:WaitForChild("EquippedWeapon")
v66 = EquippedWeapon.Value
local v67: boolean = false
local v68: boolean = false
local v69: boolean = false
local v70: boolean = false
local v72: boolean = false
local v73: boolean = false
local v74: boolean = false
local v75: boolean = false
local v76: nil = nil
local v77: nil = nil
local v78: nil = nil
local v79: nil = nil
local v80: nil = nil
local v81: nil = nil
local v82: nil = nil
local v83: nil = nil
local v84: nil = nil
local v85: nil = nil
local v86: nil = nil
local v87: nil = nil
local v88: nil = nil
local v89: nil = nil
local v90: table = { "Empty", "Empty", "Empty", "Empty", "Empty" }
local v91: string = "Melee"
local function LoadAnimation(arg0: table, arg1: unknown)
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 0
            ~ Argument Count: 2
            ~ Debug Name: LoadAnimation
            ~ Bytecode ID: 3
            ~ Registers Used: R0-R4
            ~ Type Information: Unavailable
    ]]
	return arg0:FindFirstChildOfClass("Animator"):LoadAnimation(arg1)
end
local function StopAnimation(arg0: table | nil)
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 0
            ~ Argument Count: 1
            ~ Debug Name: StopAnimation
            ~ Bytecode ID: 4
            ~ Registers Used: R0-R2
            ~ Type Information: Unavailable
    ]]
	if arg0 == nil then
		return
	end
	arg0:Stop()
	return
end
local v94: table = {}
local function UnloadAllAnimations()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 1
            ~ Argument Count: 0
            ~ Debug Name: UnloadAllAnimations
            ~ Bytecode ID: 5
            ~ Registers Used: R0-R6
            ~ Type Information: Unavailable
    ]]
	local v0 = v94
	for v3, v4 in v0 do
		if v4 ~= nil then
			v4:Stop()
		end
		v4:Destroy()
	end
	v94 = {}
	return
end
local function UpdateM1s()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 23
            ~ Argument Count: 0
            ~ Debug Name: UpdateM1s
            ~ Bytecode ID: 7
            ~ Registers Used: R0-R12
            ~ Type Information: Unavailable
    ]]
	local v3_Humanoid: Humanoid = v17:FindFirstChildOfClass("Humanoid")
	if not v3_Humanoid then
		return
	end
	local v1 = ReplicatedStorage.Events.ValidateWeapon:InvokeServer(v21)
	if v1 == nil or v1 == false then
		print("Weapo not Validated.")
		return
	end
	UnloadAllAnimations()
	local v2: Instance = v22:FindFirstChild(v21)
	if not v2 then
		return
	end
	for v6, v7 in v2:GetChildren() do
		if v7.Name ~= "ChargedAttackAnimation" then
			if string.find(v7.Name, "AttackAnimation") then
				local v10: { string } = string.split(v7.Name, "AttackAnimation")
				local v9 = v9
				local v8: number = tonumber(v9)
				local v10 = v3_Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v7)
				v90[v8] = v10
			end
		end
	end
	local ChargedAttackAnimation: Instance = v2:FindFirstChild("ChargedAttackAnimation")
	v7 = ChargedAttackAnimation
	local v5 = v3_Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v7)
	v80 = v5
	task.spawn(function()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 3
                ~ Argument Count: 0
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 6
                ~ Registers Used: R0-R7
                ~ Type Information: Unavailable
        ]]
		local v0 = { v3 }
		local v3: nil = v80
		for v3, v4 in v3_Humanoid do
			if v4 then
				if v4:IsA("AnimationTrack") then
					v4:Play()
					v4:Stop()
					v4:AddTag("CancelOnStun")
					table.insert(v94, v4)
				end
			end
		end
		for v3, v4 in v90 do
			if v4 then
				if typeof(v4) ~= "string" then
					if v4:IsA("AnimationTrack") then
						v4:Play()
						v4:Stop()
						v4:AddTag("CancelOnStun")
						table.insert(v94, v4)
					end
				end
			end
		end
		return
	end)
	local v5 = v3_Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v2.IdleAnimation)
	v77 = v5
	v77.Looped = true
	local v5 = v3_Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v2.WeaponWalkAnimation)
	v79 = v5
	local RunAnimation: Instance = v2:FindFirstChild("RunAnimation")
	local v5 = v3_Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(RunAnimation)
	v78 = v5
	local RunAttack: Instance = v2:FindFirstChild("RunAttack")
	local v5 = v3_Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(RunAttack)
	v81 = v5
	local v5 = v3_Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v2.EquipAnimation)
	v82 = v5
	local v5 = v3_Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v2.UnequipAnimation)
	v83 = v5
	local v5 = v3_Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v2.BlockAnimation)
	v76 = v5
	v76.Priority = Enum.AnimationPriority.Action4
	v84 = v3
	v91 = v2.WeaponType.Value
	local v5 = v3_Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v2.LightParry)
	v87 = v5
	v87.Priority = Enum.AnimationPriority.Action2
	if v88 ~= nil then
		v88:Stop()
	end
	if v88 then
		v88:Destroy()
	end
	local v5 = v3_Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v2.ParryAttempt)
	v88 = v5
	table.insert(v94, v88)
	local v5 = v3_Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v2.HardParry)
	v89 = v5
	v89.Priority = Enum.AnimationPriority.Action2
	v79:Stop()
	if v91 == "Gun" then
		local v5 = v3_Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v2.GunShoot)
		v86 = v5
		local v5 = v3_Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v2.GunAim)
		v85 = v5
		table.insert(v94, v86)
		table.insert(v94, v85)
	end
	v77.Priority = Enum.AnimationPriority.Movement
	v79.Priority = Enum.AnimationPriority.Movement
	v79:AdjustWeight(100)
	v78.Priority = Enum.AnimationPriority.Movement
	v78:AdjustWeight(1000)
	local v4_SwingSpeed: Instance = v2:FindFirstChild("SwingSpeed")
	v23 = SwingSpeed.Value
	v3 = { v77, v79, v78, v82, v83, v76, v89 }
	for v6, v7 in v3 do
		table.insert(v94, v79)
	end
	return
end
if UserInputService.TouchEnabled == true or UserInputService.GamepadEnabled == true then
end
UpdateM1s()
local v97: table = require(ReplicatedStorage.Info.GlobalInfo)
v97 = v97.EmotionLevelReqs
tick()
local v99 = Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v4.LongJumpIdle)
local v100 = Humanoid:FindFirstChildOfClass("Animator"):LoadAnimation(v4.LongJumpWindup)
local function GetMouseTarget(arg0: boolean, arg1: number)
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 3
            ~ Argument Count: 2
            ~ Debug Name: GetMouseTarget
            ~ Bytecode ID: 8
            ~ Registers Used: R0-R17
            ~ Type Information: Available
    ]]
	local v3: nil = nil
	local v4: number = 0.4
	local v5 = CFrame.new(workspace.CurrentCamera.CFrame.Position, v16.Hit.Position)
	if not HumanoidRootPart then
		return
	end
	for v10, v11 in workspace.Alive:GetChildren() do
		if not arg0 then
			if v11 ~= v17 then
			end
		end
		local v5_HumanoidRootPart: Instance = v11:FindFirstChild("HumanoidRootPart")
		if HumanoidRootPart then
			if v11:FindFirstChild("Humanoid") then
				if v11:FindFirstChild("Torso") then
					if arg1 then
						if HumanoidRootPart.Position - HumanoidRootPart.Position.Magnitude >= arg1 then
						end
					end
					local v15 = CFrame.new(v5.Position, HumanoidRootPart.Position)
					local v14 = v15.LookVector - v5.LookVector.Magnitude
					if v14 < v4 then
						v4 = v14
						v3 = v11
					end
				end
			end
		end
	end
	return v3
end
local function AttackedTarget(arg0: table)
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 9
            ~ Argument Count: 1
            ~ Debug Name: AttackedTarget
            ~ Bytecode ID: 10
            ~ Registers Used: R0-R3
            ~ Type Information: Unavailable
    ]]
	if v49 then
		v49 = false
		v17:AddTag("AutoStoppedRun")
		task.delay(0.1, function()
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 1
                    ~ Argument Count: 0
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 9
                    ~ Registers Used: R0-R2
                    ~ Type Information: Unavailable
            ]]
			v17:RemoveTag("AutoStoppedRun")
		end)
	end
	Humanoid.WalkSpeed = 2
	Humanoid.JumpPower = 0
	if _G.CheckForStun(v17) then
		v10.StopAnimationWithTag(v17, "CancelOnStun")
	end
	if not v64 then
		if not v67 then
			return
		end
	end
	if arg0.Name == "UsingMove" then
		return
	end
	if table.find(v47, "Coldness") then
		if not (arg0.Name == "Ragdolled" or arg0.Name == "DropPlayer") then
			return
		end
	end
	v6.UnGrip:FireServer()
	v6.UnCarry:FireServer()
	if v42.IsPlaying then
		v42:Stop()
	end
	v67 = false
	return
end
v17.ChildAdded:Connect(function(arg0: table)
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 6
            ~ Argument Count: 1
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 11
            ~ Registers Used: R0-R5
            ~ Type Information: Unavailable
    ]]
	local v1 = arg0.Name
	local v2 = WalkSpeed.Value
	if v1 == "Grabbed" then
		Humanoid.WalkSpeed = 0
		Humanoid.JumpPower = 0
		return
	end
	if v1 == "Stunned" or v1 == "UsingMove" or v1 == "Ragdolled" or v1 == "DropPlayer" then
		if not v17:FindFirstChild("Grabbed") then
			AttackedTarget(arg0)
			return
		else
			return
		end
	elseif v1 ~= "LightAttack" then
		if v1 ~= "HeavyAttack" then
			if not arg0:IsA("Tool") then
				return
			end
			if not arg0:FindFirstChild("Item") then
				return
			end
			v38:Play()
			repeat
				local v3 = task.wait
				v3()
				v3 = arg0.Parent

			until v3 ~= v4
			if v17:FindFirstChildOfClass("Tool") then
				if v17:FindFirstChildOfClass("Tool"):FindFirstChild("Item") then
					return
				end
			end
			v38:Stop()
			return
		else
			if v17:FindFirstChild("Grabbed") then
				return
			end
			if v17:FindFirstChild("Stunned") then
				return
			end
			if v17:FindFirstChild("UsingMove") then
				return
			end
			if not v17:FindFirstChild("Ragdoll") then
				Humanoid.WalkSpeed = v2 / 5
				Humanoid.JumpPower = 0
				return
			else
				return
			end
		end
	else
		if v17:FindFirstChild("Grabbed") then
			return
		end
		if v17:FindFirstChild("Stunned") then
			return
		end
		if v17:FindFirstChild("UsingMove") then
			return
		end
		if v17:FindFirstChild("Ragdoll") then
			return
		end
		if not v55 then
			Humanoid.WalkSpeed = v2 / 3.5
			Humanoid.JumpPower = 0
			return
		else
			Humanoid.WalkSpeed = v2 / 4
			Humanoid.JumpPower = 0
			return
		end
		Humanoid.JumpPower = 0
		return
	end
end)
local CombatTags: Instance = v15:WaitForChild("CombatTags")
CombatTags.ChildAdded:Connect(function(arg0: table)
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 3
            ~ Argument Count: 1
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 12
            ~ Registers Used: R0-R7
            ~ Type Information: Unavailable
    ]]
	if not string.find(arg0.Name, "CombatTag") then
		return
	end
	v15:SetAttribute("InCombat", true)
	local v1 = ReplicatedStorage.NightTime.Value
	local v2 = game.Lighting.NightBrightness
	if v2.Enabled ~= v1 then
		v2.Enabled = v1
	end
	if v15.PlayerGui.Stats.CombatText.Visible == true then
		return
	end
	v15.PlayerGui.AreaGui.CombatTag:Play()
	v15.PlayerGui.Stats.CombatText.Visible = true
	TweenService:Create(v15.PlayerGui.AreaGui.CombatMusic, TweenInfo.new(1.5), { Volume = 0.35 }):Play()
	TweenService:Create(v15.PlayerGui.AreaGui.AreaMusic, TweenInfo.new(0.4), { Volume = 0 }):Play()
	return
end)
local v6_CombatTags: Instance = v15:WaitForChild("CombatTags")
CombatTags.ChildRemoved:Connect(function(arg0: table)
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 2
            ~ Argument Count: 1
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 13
            ~ Registers Used: R0-R6
            ~ Type Information: Unavailable
    ]]
	if not string.find(arg0.Name, "CombatTag") then
		return
	end
	if not v15:GetAttribute("InCombat") then
		return
	end
	if #v15.CombatTags:GetChildren() > 0 then
		return
	end
	v15:SetAttribute("InCombat", nil)
	game.Lighting.NightBrightness.Enabled = false
	if v15.PlayerGui.Stats.CombatText.Visible == false then
		return
	end
	v15.PlayerGui.AreaGui.CombatTag:Play()
	v15.PlayerGui.Stats.CombatText.Visible = false
	TweenService:Create(v15.PlayerGui.AreaGui.AreaMusic, TweenInfo.new(1.5), { Volume = 0.35 }):Play()
	TweenService:Create(v15.PlayerGui.AreaGui.CombatMusic, TweenInfo.new(0.4), { Volume = 0 }):Play()
	return
end)
v103 = function(arg0: table)
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 2
            ~ Argument Count: 1
            ~ Debug Name: Refresh
            ~ Bytecode ID: 14
            ~ Registers Used: R0-R3
            ~ Type Information: Unavailable
    ]]
	if v17:FindFirstChild("Stunned") then
		return
	end
	if v17:FindFirstChild("UsingMove") then
		return
	end
	if v17:FindFirstChild("LightAttack") then
		return
	end
	if v17:FindFirstChild("HeavyAttack") then
		return
	end
	if arg0:IsA("Tool") then
		return
	end
	if arg0.Name ~= "LightAttack" then
		if arg0.Name ~= "HeavyAttack" then
			if arg0.Name ~= "UsingMove" then
				if arg0.Name ~= "Stunned" then
					return
				end
			end
		end
	end
	local v7_Humanoid: Humanoid = v17:FindFirstChildOfClass("Humanoid")
	v7_Humanoid.WalkSpeed = WalkSpeed.Value
	local v8_Humanoid: Instance = v17:FindFirstChild("Humanoid")
	Humanoid.JumpPower = 47
	return
end
v17.ChildRemoved:Connect(function(arg0: unknown)
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 1
            ~ Argument Count: 1
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 15
            ~ Registers Used: R0-R2
            ~ Type Information: Unavailable
    ]]
	v103(arg0)
end)
local v104: table = {}
for v108, v109 in v4.DamagedAnimations:GetChildren() do
	local v110 = Humanoid.Animator:LoadAnimation(v109)
	v110.Priority = Enum.AnimationPriority.Action2
	local v111 = table.insert
	v111(v104, v110)
end
local v105: table = {}
for v109, v110 in v4.DodgeAnimations:GetChildren() do
	local v111 = Humanoid.Animator:LoadAnimation(v110)
	v111.Priority = Enum.AnimationPriority.Action
	table.insert(v105, v111)
end
local v106: table = {}
for v110, v111 in v4.DodgedAnimation:GetChildren() do
	local v112 = Humanoid.Animator:LoadAnimation(v111)
	v112.Priority = Enum.AnimationPriority.Action
	table.insert(v106, v112)
end
v6.Damaged.OnClientEvent:Connect(function(arg0: string)
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 9
            ~ Argument Count: 1
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 18
            ~ Registers Used: R0-R7
            ~ Type Information: Unavailable
    ]]
	if workspace:FindFirstChild("AprilFools") then
		local v1: number = math.random(1, 100)
		if v1 == 1 then
			local v2 = Instance.new("Sound", workspace)
			v2.SoundId = "rbxassetid://18735403020"
			v2:Play()
			v10.Debris(v2, 5)
			v15.PlayerGui.OverlayGui.EGOISME.BackgroundTransparency = 0
			v15.PlayerGui.OverlayGui.EGOISME.ImageTransparency = 0
			task.delay(0.5, function()
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 2
                        ~ Argument Count: 0
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 16
                        ~ Registers Used: R0-R4
                        ~ Type Information: Unavailable
                ]]
				TweenService:Create(
					v15.PlayerGui.OverlayGui.EGOISME,
					TweenInfo.new(0.5),
					{ BackgroundTransparency = 1, ImageTransparency = 1 }
				):Play()
			end)
		end
	elseif ReplicatedStorage.PermadeathEnabled.Value == true then
		local v1: number = math.random(1, 2000)
		if v1 == 1 then
			local v2 = Instance.new("Sound", workspace)
			v2.SoundId = "rbxassetid://78781475442496"
			v2:Play()
			v10.Debris(v2, 5)
			v15.PlayerGui.OverlayGui.HEAVENSGATE.BackgroundTransparency = 0
			v15.PlayerGui.OverlayGui.HEAVENSGATE.ImageTransparency = 0
			task.delay(0.25, function()
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 2
                        ~ Argument Count: 0
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 17
                        ~ Registers Used: R0-R4
                        ~ Type Information: Unavailable
                ]]
				TweenService:Create(
					v15.PlayerGui.OverlayGui.HEAVENSGATE,
					TweenInfo.new(0.25),
					{ BackgroundTransparency = 1, ImageTransparency = 1 }
				):Play()
			end)
		end
	end
	if arg0 == "Damaged" then
		local v1 = v10.GetStatusEffect(v17, "DullahanStacks")
		if 0 < v1.Value then
			return
		end
		if v17:FindFirstChild("HyperArmor") then
			return
		end
		if not v17:FindFirstChild("Grabbed") then
			v15.PlayerGui.OverlayGui.Hurt.ImageTransparency = 0
			TweenService:Create(
				v15.PlayerGui.OverlayGui.Hurt,
				TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
				{ ImageTransparency = 1 }
			):Play()
			v15.PlayerGui.OverlayGui.HurtBlood.ImageTransparency = 0
			local v2: number = math.random(-5, 5)
			v15.PlayerGui.OverlayGui.HurtBlood.Rotation = v2
			TweenService:Create(
				v15.PlayerGui.OverlayGui.HurtBlood,
				TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
				{ ImageTransparency = 1 }
			):Play()
			local v3: number = math.random(1, #v104)
			v104[v3]:Play()
			return
		else
			return
		end
	else
		if arg0 == "HitTarget" then
			v15.PlayerGui.OverlayGui.Hurt.ImageTransparency = 0.45
			TweenService:Create(
				v15.PlayerGui.OverlayGui.Hurt,
				TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
				{ ImageTransparency = 1 }
			):Play()
			return
		end
		if arg0 ~= "Parried" then
			if arg0 == "Dodged" then
				v15.PlayerGui.OverlayGui.White.ImageTransparency = 0
				TweenService:Create(
					v15.PlayerGui.OverlayGui.White,
					TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
					{ ImageTransparency = 1 }
				):Play()
				local v3: number = math.random(1, #v105)
				v105[v3]:Play()
				return
			end
			if arg0 ~= "AdvancedDodged" then
				return
			end
			v15.PlayerGui.OverlayGui.Red.ImageTransparency = 0
			TweenService:Create(
				v15.PlayerGui.OverlayGui.Red,
				TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
				{ ImageTransparency = 1 }
			):Play()
			local v3: number = math.random(1, #v106)
			v106[v3]:Play()
			return
		elseif not v17:FindFirstChild("HyperArmor") then
			v15.PlayerGui.OverlayGui.Burn.ImageTransparency = 0
			TweenService:Create(
				v15.PlayerGui.OverlayGui.Burn,
				TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
				{ ImageTransparency = 1 }
			):Play()
			v27:Play(0.1)
			return
		else
			return
		end
	end
end)
local v107: boolean = false
AddDragFX = function(arg0: table, arg1: table, arg2: unknown)
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 0
            ~ Argument Count: 3
            ~ Debug Name: AddDragFX
            ~ Bytecode ID: 19
            ~ Registers Used: R0-R12
            ~ Type Information: Unavailable
    ]]
	if arg1:FindFirstChild("RunFX") then
		return
	end
	if not arg0.RunAnimation:FindFirstChild("DragFX") then
		return
	end
	local Attachment: Attachment = arg0.RunAnimation:FindFirstChild("DragFX"):FindFirstChildOfClass("Attachment")
	if not Attachment then
		return
	end
	local v4 = Attachment:Clone()
	v4.Parent = arg1
	table.insert(arg2, v4)
	for v8, v9 in v4:GetChildren() do
		if v9:IsA("ParticleEmitter") then
			v9.Enabled = true
		end
	end
	return
end
local v9_Weapon: Instance = v15:WaitForChild("Data"):WaitForChild("Weapon")
Weapon.Changed:Connect(function(arg0: unknown)
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 4
            ~ Argument Count: 1
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 20
            ~ Registers Used: R0-R2
            ~ Type Information: Unavailable
    ]]
	v21 = arg0
	v77:Stop()
	v79:Stop()
	UpdateM1s()
end)
local Weapon: Instance = v17:WaitForChild("Weapon")
Weapon.Changed:Connect(function(arg0: unknown)
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 4
            ~ Argument Count: 1
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 21
            ~ Registers Used: R0-R2
            ~ Type Information: Unavailable
    ]]
	v21 = arg0
	v77:Stop()
	v79:Stop()
	UpdateM1s()
end)
local v109 = v17:FindFirstChildOfClass("Humanoid"):FindFirstChildOfClass("Animator"):LoadAnimation(v4.VerticalClimbAnim)
local v110 = v17:FindFirstChildOfClass("Humanoid"):FindFirstChildOfClass("Animator"):LoadAnimation(v4.LadderClimbAnim)
local v111 = v17:FindFirstChildOfClass("Humanoid"):FindFirstChildOfClass("Animator"):LoadAnimation(v4.ZiplineAnim)
local v112 = v17:FindFirstChildOfClass("Humanoid"):FindFirstChildOfClass("Animator"):LoadAnimation(v4.TurnCorner)
local v113 =
	v17:FindFirstChildOfClass("Humanoid"):FindFirstChildOfClass("Animator"):LoadAnimation(v4.TurnCornerOpposite)
local v114 = v17:FindFirstChildOfClass("Humanoid"):FindFirstChildOfClass("Animator"):LoadAnimation(v4.CanJumpFromClimb)
local v115 = v17:FindFirstChildOfClass("Humanoid"):FindFirstChildOfClass("Animator"):LoadAnimation(v4.JumpFromClimb)
local v116 = v17:FindFirstChildOfClass("Humanoid"):FindFirstChildOfClass("Animator"):LoadAnimation(v4.SwingClimbAnim)
v6.ZiplineStatus.OnClientEvent:Connect(function()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 1
            ~ Argument Count: 0
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 22
            ~ Registers Used: R0-R2
            ~ Type Information: Unavailable
    ]]
	v111:Stop(0)
end)
local v117: boolean = false
local function ZipLineTravel(arg0: string)
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 6
            ~ Argument Count: 1
            ~ Debug Name: ZipLineTravel
            ~ Bytecode ID: 24
            ~ Registers Used: R0-R7
            ~ Type Information: Available
    ]]
	if typeof(arg0) == "Instance" then
		if arg0:IsA("BasePart") then
			local PointA: Instance = arg0:WaitForChild("PointA")
			v1 = PointA.Value
			local PointB: Instance = arg0:WaitForChild("PointB")
			v2 = PointB.Value
			local v3
			if v1.WorldPosition.Y >= v2.WorldPosition.Y then
				v3 = v2
			else
				v3 = v1
				v4 = v2
			end
			if v17.PrimaryPart.Position - v3.WorldPosition.Magnitude <= 15 then
				return
			end
		end
	end
	v6.ZiplineStatus:FireServer("Start", arg0)
	v60 = true
	if not (arg0 == nil or arg0 == "Stop") then
		v111:Play(0.15)
		v117 = true
		return
	end
	v3 = function()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 1
                ~ Argument Count: 0
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 23
                ~ Registers Used: R0-R0
                ~ Type Information: Unavailable
        ]]
		v117 = false
	end
	task.delay(0.5, v3)
	local v1 = Instance.new("BodyVelocity")
	v1.MaxForce = Vector3.new(25000, 25000, 25000)
	v1.Velocity = workspace.CurrentCamera.CFrame.LookVector * 65 + Vector3.new(0, 20, 0)
	v1.Parent = v17.HumanoidRootPart
	v10.Debris(v1, 0.15)
	v60 = false
	if arg0 ~= "Stop" then
		print("Line IS NIL")
		return
	else
		v6.ZiplineStatus:FireServer("Stop", nil)
		v111:Stop()
		return
	end
end
local v119: table = {}
local function anon_52_34(arg0: string, arg1: string, arg2: table, arg3: unknown, arg4: number, arg5: table | nil)
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 20
            ~ Argument Count: 6
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 34
            ~ Registers Used: R0-R18
            ~ Type Information: Available
    ]]
	-- Fission: INFO: local 'v10_34' has been suffixed to avoid shadowing an existing, upper scope variable.
	-- Fission: INFO: local 'v15_34' has been suffixed to avoid shadowing an existing, upper scope variable.
	if v60 == true then
		print("Failed Climb")
		return
	end
	if arg2:GetAttribute("IsSwinging") then
		print("Failed Climb")
		return
	end
	if arg2:FindFirstChild("UsingMove") then
		print("Failed Climb")
		return
	end
	if arg2:FindFirstChild("Stunned") then
		print("Failed Climb")
		return
	end
	if arg2:FindFirstChild("Ragdolled") then
		print("Failed Climb")
		return
	end
	if table.find(v119, arg5) then
		print("Failed Climb")
		return
	end
	if HumanoidRootPart:FindFirstChildOfClass("BodyVelocity") then
		print("Failed Climb")
		return
	end
	v60 = true
	arg2:SetAttribute("IsSwinging", true)
	table.insert(v119, arg5)
	task.delay(1, function()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 2
                ~ Argument Count: 0
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 25
                ~ Registers Used: R0-R4
                ~ Type Information: Unavailable
        ]]
		local v3 = v119
		local v4 = arg5
		table.remove(v119, table.find(v3, v4))
	end)
	if arg0 == "Vertical" then
		v6 = v109
		v7 = 0.9
		if arg5:HasTag("Ladder") then
			v6 = v110
			v7 -= 0.3
		end
		if arg5 ~= nil then
			if arg5.Parent:IsA("Model") then
				for v11, v12 in arg5.Parent:GetDescendants() do
					if v12:IsA("BasePart") then
						if v12.CanCollide == true then
							v12.CanCollide = false
							task.delay(0.2, function()
								--[[ 
                                    Fission ~~ Function Information:
                                        ~ Upvalue Count: 1
                                        ~ Argument Count: 0
                                        ~ Debug Name: anon/no name
                                        ~ Bytecode ID: 26
                                        ~ Registers Used: R0-R1
                                        ~ Type Information: Unavailable
                                ]]
								v12.CanCollide = true
							end)
						end
					end
				end
			end
		end
		local v8 = Instance.new("BodyVelocity")
		v8.MaxForce = Vector3.new(20000, 20000, 20000)
		v8.Velocity = Vector3.zero
		v8.Parent = HumanoidRootPart
		if arg5:HasTag("SnakeEater") then
			local v9 = Instance.new("Sound", workspace)
			v9.SoundId = "rbxassetid://16650007973"
			v9:Play()
			v7 -= 0.3
			task.spawn(function()
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 4
                        ~ Argument Count: 0
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 27
                        ~ Registers Used: R0-R4
                        ~ Type Information: Unavailable
                ]]
				repeat
					local v0 = task.wait
					v0()
					v0 = v60

				until v0 == false
				TweenService:Create(v9, TweenInfo.new(0.5), { Volume = 0 }):Play()
				v10.Debris(v9, 2)
				return
			end)
		end
		v9 = false
		task.spawn(function()
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 6
                    ~ Argument Count: 0
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 28
                    ~ Registers Used: R0-R3
                    ~ Type Information: Unavailable
            ]]
			task.wait(0.3)
			while v60 do
				task.wait()
				local v0 = workspace.CurrentCamera.CFrame.LookVector - HumanoidRootPart.CFrame.LookVector.Magnitude
				if 1.2 < v0 then
					if not v56 then
						v56 = true
						v8.Velocity = Vector3.zero
						v6:AdjustSpeed(0)
						v114:Play(0.2)
					end
				end
				if v0 < 1.2 then
					if v56 then
						v56 = false
						v114:Stop(0.2)
						v8.Velocity = Vector3.zero
					end
				end
			end
			v114:Stop(0.2)
			return
		end)
		task.delay(0.3, function()
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 12
                    ~ Argument Count: 0
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 30
                    ~ Registers Used: R0-R3
                    ~ Type Information: Available
            ]]
			if not v60 then
				return
			end
			while v60 do
				if not v9 then
					if not arg2:FindFirstChild("Stunned") then
						if arg2:FindFirstChild("Ragdolled") then
						end
					end
					v10.Ragdoll(arg2, 1)
					v9 = true
					v60 = false
					arg2:SetAttribute("IsSwinging", nil)
					v56 = false
					v114:Stop()
					v115:Stop()
					v8:Destroy()
					v6:Stop()
					arg2.Humanoid.AutoRotate = true
					task.wait()
				end
				if arg3 < HumanoidRootPart.CFrame.Y then
					if not v9 then
						v9 = true
						v60 = false
						arg2:SetAttribute("IsSwinging", nil)
						v56 = false
						v8:Destroy()
						v6:Stop()
						v114:Stop()
						local v0 = Instance.new("BodyVelocity")
						v0.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
						v0.Velocity = HumanoidRootPart.CFrame.LookVector * 10 + Vector3.new(0, 25, 0)
						v0.Parent = HumanoidRootPart
						task.delay(0.1, function()
							--[[ 
                                Fission ~~ Function Information:
                                    ~ Upvalue Count: 2
                                    ~ Argument Count: 0
                                    ~ Debug Name: anon/no name
                                    ~ Bytecode ID: 29
                                    ~ Registers Used: R0-R1
                                    ~ Type Information: Unavailable
                            ]]
							v0:Destroy()
							arg2.Humanoid.AutoRotate = true
							task.wait(0.2)
						end)
					end
					task.wait()
				end
				if HumanoidRootPart.CFrame.Y < arg4 + 1 then
					if not v9 then
						v9 = true
						v60 = false
						arg2:SetAttribute("IsSwinging", nil)
						v56 = false
						v8:Destroy()
						v6:Stop()
						v114:Stop()
						v115:Stop()
						arg2.Humanoid.AutoRotate = true
					end
				end
				task.wait()
			end
			return
		end)
		if arg3 < HumanoidRootPart.CFrame.Y then
			if not v56 then
				v6:Play()
				v6:AdjustSpeed(0)
				local v13: number = arg5.Top.WorldPosition + arg5.CFrame.LookVector * 1 - Vector3.new(0, 3.5, 0)
				local v18 = arg5.CFrame.LookVector
				local v17: number = v18 * -1.5
				local v15_34: number = arg5.Top.WorldPosition + v17
				local v14: number = v15_34 - Vector3.new(0, 3.5, 0)
				arg2:SetPrimaryPartCFrame(CFrame.lookAt(v13, v14))
				arg2.Humanoid.AutoRotate = false
				local v10_34: nil = nil
				v11 = UserInputService.InputBegan
				local v11 = v11:Connect(function(arg0: table, arg1: boolean)
					--[[ 
                        Fission ~~ Function Information:
                            ~ Upvalue Count: 14
                            ~ Argument Count: 2
                            ~ Debug Name: anon/no name
                            ~ Bytecode ID: 31
                            ~ Registers Used: R0-R7
                            ~ Type Information: Available
                    ]]
					if arg1 then
						return
					end
					if arg0.KeyCode == Enum.KeyCode.W then
						if not v56 then
							if not v9 then
								v8.Velocity = arg5.CFrame.RightVector * v7 * -14
								v6:AdjustSpeed(0.8)
								v114:Stop()
								return
							end
						end
					end
					if arg0.KeyCode == Enum.KeyCode.S then
						if not v56 then
							if not v9 then
								v8.Velocity = arg5.CFrame.RightVector * v7 * 18
								v6:AdjustSpeed(-1)
								v114:Stop()
								return
							end
						end
					end
					if arg0.KeyCode ~= Enum.KeyCode.Space then
						return
					end
					if v9 then
						return
					end
					if not v56 then
						return
					end
					v9 = true
					v6:Stop()
					v114:Stop()
					v115:Play()
					task.wait(0.45)
					v8:Destroy()
					v114:Stop()
					v60 = false
					arg2:SetAttribute("IsSwinging", nil)
					local v2 = Instance.new("BodyVelocity")
					v2.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
					local v3 = Humanoid.MaxHealth
					local v4 = Humanoid.Health
					v2.Velocity = workspace.CurrentCamera.CFrame.LookVector * 80 + Vector3.new(0, 15, 0)
					v2.Parent = HumanoidRootPart
					v10.Debris(v2, 0.2)
					arg2.Humanoid.AutoRotate = true
					v10_34:Disconnect()
					return
				end)
				v10_34 = v11
				local v12 = UserInputService.InputEnded:Connect(function(arg0: table, arg1: boolean)
					--[[ 
                        Fission ~~ Function Information:
                            ~ Upvalue Count: 2
                            ~ Argument Count: 2
                            ~ Debug Name: anon/no name
                            ~ Bytecode ID: 32
                            ~ Registers Used: R0-R4
                            ~ Type Information: Unavailable
                    ]]
					if arg1 then
						return
					end
					if not (arg0.KeyCode == Enum.KeyCode.W or arg0.KeyCode == Enum.KeyCode.S) then
						return
					end
					v8.Velocity = Vector3.zero
					v6:AdjustSpeed(0)
					return
				end)
				v11 = v12
				return
			end
			v10_34 = nil
			v11 = UserInputService.InputBegan
			local v11 = v11:Connect(function(arg0: table, arg1: boolean)
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 14
                        ~ Argument Count: 2
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 31
                        ~ Registers Used: R0-R7
                        ~ Type Information: Available
                ]]
				if arg1 then
					return
				end
				if arg0.KeyCode == Enum.KeyCode.W then
					if not v56 then
						if not v9 then
							v8.Velocity = arg5.CFrame.RightVector * v7 * -14
							v6:AdjustSpeed(0.8)
							v114:Stop()
							return
						end
					end
				end
				if arg0.KeyCode == Enum.KeyCode.S then
					if not v56 then
						if not v9 then
							v8.Velocity = arg5.CFrame.RightVector * v7 * 18
							v6:AdjustSpeed(-1)
							v114:Stop()
							return
						end
					end
				end
				if arg0.KeyCode ~= Enum.KeyCode.Space then
					return
				end
				if v9 then
					return
				end
				if not v56 then
					return
				end
				v9 = true
				v6:Stop()
				v114:Stop()
				v115:Play()
				task.wait(0.45)
				v8:Destroy()
				v114:Stop()
				v60 = false
				arg2:SetAttribute("IsSwinging", nil)
				local v2 = Instance.new("BodyVelocity")
				v2.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
				local v3 = Humanoid.MaxHealth
				local v4 = Humanoid.Health
				v2.Velocity = workspace.CurrentCamera.CFrame.LookVector * 80 + Vector3.new(0, 15, 0)
				v2.Parent = HumanoidRootPart
				v10.Debris(v2, 0.2)
				arg2.Humanoid.AutoRotate = true
				v10_34:Disconnect()
				return
			end)
			v10_34 = v11
			local v12 = UserInputService.InputEnded:Connect(function(arg0: table, arg1: boolean)
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 2
                        ~ Argument Count: 2
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 32
                        ~ Registers Used: R0-R4
                        ~ Type Information: Unavailable
                ]]
				if arg1 then
					return
				end
				if not (arg0.KeyCode == Enum.KeyCode.W or arg0.KeyCode == Enum.KeyCode.S) then
					return
				end
				v8.Velocity = Vector3.zero
				v6:AdjustSpeed(0)
				return
			end)
			v11 = v12
			return
		end
		if HumanoidRootPart.CFrame.Y < arg4 + 3 then
			if not v56 then
				v6:Play()
				v6:AdjustSpeed(0)
				v13 = arg5.Bottom.WorldPosition + arg5.CFrame.LookVector * 1 + Vector3.new(0, 3.5, 0)
				v18 = arg5.CFrame.LookVector
				v17 = v18 * -1.5
				v15_34 = arg5.Bottom.WorldPosition + v17
				v14 = v15_34 + Vector3.new(0, 3.5, 0)
				arg2:SetPrimaryPartCFrame(CFrame.lookAt(v13, v14))
				arg2.Humanoid.AutoRotate = false
				v10_34 = nil
				v11 = UserInputService.InputBegan
				local v11 = v11:Connect(function(arg0: table, arg1: boolean)
					--[[ 
                        Fission ~~ Function Information:
                            ~ Upvalue Count: 14
                            ~ Argument Count: 2
                            ~ Debug Name: anon/no name
                            ~ Bytecode ID: 31
                            ~ Registers Used: R0-R7
                            ~ Type Information: Available
                    ]]
					if arg1 then
						return
					end
					if arg0.KeyCode == Enum.KeyCode.W then
						if not v56 then
							if not v9 then
								v8.Velocity = arg5.CFrame.RightVector * v7 * -14
								v6:AdjustSpeed(0.8)
								v114:Stop()
								return
							end
						end
					end
					if arg0.KeyCode == Enum.KeyCode.S then
						if not v56 then
							if not v9 then
								v8.Velocity = arg5.CFrame.RightVector * v7 * 18
								v6:AdjustSpeed(-1)
								v114:Stop()
								return
							end
						end
					end
					if arg0.KeyCode ~= Enum.KeyCode.Space then
						return
					end
					if v9 then
						return
					end
					if not v56 then
						return
					end
					v9 = true
					v6:Stop()
					v114:Stop()
					v115:Play()
					task.wait(0.45)
					v8:Destroy()
					v114:Stop()
					v60 = false
					arg2:SetAttribute("IsSwinging", nil)
					local v2 = Instance.new("BodyVelocity")
					v2.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
					local v3 = Humanoid.MaxHealth
					local v4 = Humanoid.Health
					v2.Velocity = workspace.CurrentCamera.CFrame.LookVector * 80 + Vector3.new(0, 15, 0)
					v2.Parent = HumanoidRootPart
					v10.Debris(v2, 0.2)
					arg2.Humanoid.AutoRotate = true
					v10_34:Disconnect()
					return
				end)
				v10_34 = v11
				local v12 = UserInputService.InputEnded:Connect(function(arg0: table, arg1: boolean)
					--[[ 
                        Fission ~~ Function Information:
                            ~ Upvalue Count: 2
                            ~ Argument Count: 2
                            ~ Debug Name: anon/no name
                            ~ Bytecode ID: 32
                            ~ Registers Used: R0-R4
                            ~ Type Information: Unavailable
                    ]]
					if arg1 then
						return
					end
					if not (arg0.KeyCode == Enum.KeyCode.W or arg0.KeyCode == Enum.KeyCode.S) then
						return
					end
					v8.Velocity = Vector3.zero
					v6:AdjustSpeed(0)
					return
				end)
				v11 = v12
				return
			end
			v10_34 = nil
			v11 = UserInputService.InputBegan
			local v11 = v11:Connect(function(arg0: table, arg1: boolean)
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 14
                        ~ Argument Count: 2
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 31
                        ~ Registers Used: R0-R7
                        ~ Type Information: Available
                ]]
				if arg1 then
					return
				end
				if arg0.KeyCode == Enum.KeyCode.W then
					if not v56 then
						if not v9 then
							v8.Velocity = arg5.CFrame.RightVector * v7 * -14
							v6:AdjustSpeed(0.8)
							v114:Stop()
							return
						end
					end
				end
				if arg0.KeyCode == Enum.KeyCode.S then
					if not v56 then
						if not v9 then
							v8.Velocity = arg5.CFrame.RightVector * v7 * 18
							v6:AdjustSpeed(-1)
							v114:Stop()
							return
						end
					end
				end
				if arg0.KeyCode ~= Enum.KeyCode.Space then
					return
				end
				if v9 then
					return
				end
				if not v56 then
					return
				end
				v9 = true
				v6:Stop()
				v114:Stop()
				v115:Play()
				task.wait(0.45)
				v8:Destroy()
				v114:Stop()
				v60 = false
				arg2:SetAttribute("IsSwinging", nil)
				local v2 = Instance.new("BodyVelocity")
				v2.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
				local v3 = Humanoid.MaxHealth
				local v4 = Humanoid.Health
				v2.Velocity = workspace.CurrentCamera.CFrame.LookVector * 80 + Vector3.new(0, 15, 0)
				v2.Parent = HumanoidRootPart
				v10.Debris(v2, 0.2)
				arg2.Humanoid.AutoRotate = true
				v10_34:Disconnect()
				return
			end)
			v10_34 = v11
			local v12 = UserInputService.InputEnded:Connect(function(arg0: table, arg1: boolean)
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 2
                        ~ Argument Count: 2
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 32
                        ~ Registers Used: R0-R4
                        ~ Type Information: Unavailable
                ]]
				if arg1 then
					return
				end
				if not (arg0.KeyCode == Enum.KeyCode.W or arg0.KeyCode == Enum.KeyCode.S) then
					return
				end
				v8.Velocity = Vector3.zero
				v6:AdjustSpeed(0)
				return
			end)
			v11 = v12
			return
		end
		v13 = Vector3.new(arg5.Position.X, HumanoidRootPart.Position.Y - 2, arg5.Position.Z)
			+ arg5.CFrame.LookVector * 1
		v18 = arg5.Position.Z
		local v15_34 = Vector3.new(arg5.Position.X, HumanoidRootPart.Position.Y - 4.5, v18)
		v17 = arg5.CFrame.LookVector
		local v16: number = v17 * -1.5
		v14 = v15_34 + v16
		arg2:SetPrimaryPartCFrame(CFrame.lookAt(v13, v14))
		arg2.Humanoid.AutoRotate = false
		v6:Play()
		v6:AdjustSpeed(0)
		v10_34 = nil
		v11 = UserInputService.InputBegan
		local v11 = v11:Connect(function(arg0: table, arg1: boolean)
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 14
                    ~ Argument Count: 2
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 31
                    ~ Registers Used: R0-R7
                    ~ Type Information: Available
            ]]
			if arg1 then
				return
			end
			if arg0.KeyCode == Enum.KeyCode.W then
				if not v56 then
					if not v9 then
						v8.Velocity = arg5.CFrame.RightVector * v7 * -14
						v6:AdjustSpeed(0.8)
						v114:Stop()
						return
					end
				end
			end
			if arg0.KeyCode == Enum.KeyCode.S then
				if not v56 then
					if not v9 then
						v8.Velocity = arg5.CFrame.RightVector * v7 * 18
						v6:AdjustSpeed(-1)
						v114:Stop()
						return
					end
				end
			end
			if arg0.KeyCode ~= Enum.KeyCode.Space then
				return
			end
			if v9 then
				return
			end
			if not v56 then
				return
			end
			v9 = true
			v6:Stop()
			v114:Stop()
			v115:Play()
			task.wait(0.45)
			v8:Destroy()
			v114:Stop()
			v60 = false
			arg2:SetAttribute("IsSwinging", nil)
			local v2 = Instance.new("BodyVelocity")
			v2.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
			local v3 = Humanoid.MaxHealth
			local v4 = Humanoid.Health
			v2.Velocity = workspace.CurrentCamera.CFrame.LookVector * 80 + Vector3.new(0, 15, 0)
			v2.Parent = HumanoidRootPart
			v10.Debris(v2, 0.2)
			arg2.Humanoid.AutoRotate = true
			v10_34:Disconnect()
			return
		end)
		v10_34 = v11
		local v12 = UserInputService.InputEnded:Connect(function(arg0: table, arg1: boolean)
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 2
                    ~ Argument Count: 2
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 32
                    ~ Registers Used: R0-R4
                    ~ Type Information: Unavailable
            ]]
			if arg1 then
				return
			end
			if not (arg0.KeyCode == Enum.KeyCode.W or arg0.KeyCode == Enum.KeyCode.S) then
				return
			end
			v8.Velocity = Vector3.zero
			v6:AdjustSpeed(0)
			return
		end)
		v11 = v12
		return
	else
		if arg0 == "Zipline" then
			arg2.Humanoid.AutoRotate = false
			ZipLineTravel(arg5, arg5)
			task.spawn(function()
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 4
                        ~ Argument Count: 0
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 33
                        ~ Registers Used: R0-R6
                        ~ Type Information: Unavailable
                ]]
				while v117 == true do
					task.wait(0.05)
					v10.ShakeScreen(v46, v15, 1, 1, 0, 0.1)
				end
				return
			end)
			arg2:SetAttribute("IsSwinging", nil)
			arg2.Humanoid.AutoRotate = true
			task.wait(0.4)
			v60 = false
			return
		end
		if arg0 == "Swing" then
			arg2.Humanoid.AutoRotate = false
			local v6 = v4.ParkourAlignPosition:Clone()
			v6.Parent = HumanoidRootPart
			v6.Attachment0 = arg5.SwingAttachment
			local v10_HumanoidRootPart: Instance = arg2:FindFirstChild("HumanoidRootPart")
			v6.Attachment1 = HumanoidRootPart.RootAttachment
			local v7 = Instance.new("BodyGyro", HumanoidRootPart)
			v7.CFrame = arg5.CFrame
			v7.MaxTorque = Vector3.new(0, 1e+05, 0)
			v10.Debris(v7, 1)
			v10.Debris(v6, 1)
			v116:Play()
			task.wait(0.3)
			v7:Destroy()
			v6:Destroy()
			local v8 = Instance.new("BodyVelocity")
			v8.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
			v8.Velocity = workspace.CurrentCamera.CFrame.LookVector * 75 + Vector3.new(0, 20, 0)
			v8.Parent = HumanoidRootPart
			v10.Debris(v8, 0.2)
			v60 = false
			arg2:SetAttribute("IsSwinging", nil)
			arg2.Humanoid.AutoRotate = true
			return
		end
		if arg0 ~= "CornerSwing" then
			return
		end
		arg2.Humanoid.AutoRotate = false
		if HumanoidRootPart.CFrame.LookVector.X >= arg5.CFrame.LookVector.X then
			v113:Play()
			v113:AdjustSpeed(1.2)
			v6 = arg5.RightSideAttachment
		else
			v112:Play()
			v112:AdjustSpeed(1.2)
			v6 = arg5.LeftSideAttachment
		end
		local v7 = v4.ParkourAlignPosition:Clone()
		v7.Parent = HumanoidRootPart
		v7.Attachment0 = v6
		local HumanoidRootPart: Instance = arg2:FindFirstChild("HumanoidRootPart")
		v7.Attachment1 = HumanoidRootPart.RootAttachment
		v10.Debris(v7, 1)
		task.wait(0.3)
		v7:Destroy()
		v60 = false
		arg2:SetAttribute("IsSwinging", nil)
		local v8 = Instance.new("BodyVelocity")
		v8.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
		v8.Velocity = workspace.CurrentCamera.CFrame.LookVector * 75 + Vector3.new(0, 5, 0)
		v8.Parent = HumanoidRootPart
		v10.Debris(v8, 0.3)
		arg2.Humanoid.AutoRotate = true
		return
	end
end
local function anon_53_35()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 7
            ~ Argument Count: 0
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 35
            ~ Registers Used: R0-R14
            ~ Type Information: Unavailable
    ]]
	-- Fission: INFO: local 'v11_35' has been suffixed to avoid shadowing an existing, upper scope variable.
	-- Fission: INFO: local 'v6_35' has been suffixed to avoid shadowing an existing, upper scope variable.
	local v0: table = {}
	local v1: table = {}
	for v5, v6_35 in CollectionService:GetTagged("Climbable") do
		table.insert(v0, v6_35)
	end
	local v2: nil = nil
	v6_35 = {}
	v6_35.Filter = v0
	v6_35.Origin = HumanoidRootPart.Position
	v6_35.Direction = HumanoidRootPart.CFrame.LookVector
	v6_35.Distance = 1
	v6_35.Character = v17
	v6_35.X = 10
	v6_35.Y = 8
	v6_35.Z = 10
	local v5 = v11.GPBIB(v6_35)
	if v5 then
		v6_35 = v5.BlockedHits
		for v9, v10 in v6_35 do
			local v11_35: number = table.find(v0, v10)
			if v11_35 then
				table.remove(v0, v11_35)
			end
		end
		if v5.Enemies then
			v6_35 = v5.Enemies
			for v9, v10 in v6_35 do
				if not table.find(v1, v10) then
					if v10:IsA("BasePart") then
						table.insert(v1, v10)
						v11_35 = v10.Position - HumanoidRootPart.Position.Magnitude
						v2 = v10
						break
					end
				end
			end
		end
	end
	if 0 >= #v1 then
		return false
	end
	if v2 == nil then
		return false
	end
	v6.FallDamage:FireServer(false, HumanoidRootPart.AssemblyLinearVelocity.Y * -2)
	if not v2:HasTag("Vertical") then
		if v2:HasTag("Swing") then
			anon_52_34("Swing", "Begin", v17, v2.Top.WorldPosition.X, v2.Bottom.WorldPosition.X, v2)
			return true
		else
			if v2:HasTag("CornerSwing") then
				anon_52_34("CornerSwing", "Begin", v17, v2.Top.WorldPosition.X, v2.Bottom.WorldPosition.X, v2)
				return true
			else
				if v2:HasTag("Horizontal") then
					anon_52_34("Horizontal", "Begin", v17, v2.Top.WorldPosition.X, v2.Bottom.WorldPosition.X, v2)
					return true
				else
					if not v2:HasTag("ZiplinePart") then
						return true
					end
					anon_52_34("Zipline", "Begin", v17, nil, nil, v2)
					return true
				end
				return true
			end
			return true
		end
		return true
	else
		if 0 < #v15.CombatTags:GetChildren() then
			return false
		end
		anon_52_34("Vertical", "Begin", v17, v2.Top.WorldPosition.Y, v2.Bottom.WorldPosition.Y, v2)
		return true
	end
	return true
end
local function anon_54_36()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 8
            ~ Argument Count: 0
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 36
            ~ Registers Used: R0-R9
            ~ Type Information: Unavailable
    ]]
	local v2 = v15.Data.LastUsedManifestation.Value
	local v2: table = require(ReplicatedStorage.Info.GlobalInfo)
	local v0, v1 = v10.GetTimedCD(tostring(v2), v2.EGOCooldown)
	if not (v15.Data.LastUsedManifestation.Value == 0 or v0 ~= false) then
		v10.Subtitle("Manifestation is unavailable at the moment. Time Remaining: " .. v1 .. " Seconds.")
		return
	end
	if workspace:HasTag("EGOCD") then
		v10.Subtitle("Manifestation is unavailable at the moment. Time Remaining: " .. v1 .. " Seconds.")
		return
	end
	if 3 < v15.Data.Grade.Value or v15.Data.Manifestation.Value == "Nothing" then
		return
	end
	v63 = true
	v59 = true
	v2 = 60 + v15.Data.Realization.Value / 10 + v15.Data.GloomSkillTree.Value
	if v2 < 0 then
		v2 = 0
	end
	local v3: number = math.min(v2, 360)
	if not UserInputService:IsKeyDown(Enum.KeyCode.Y) then
		v3 = false
	else
		v3 = true
	end
	v6.ManifestEGO:FireServer(true, v3)
	local v4: number = 60 + v3
	if table.find(v10.GetEGOGifts(v17), "Volatile Fluid Of Unknown Origin") then
		v4 = inf
	end
	while true do
		task.wait(0.25)
		if v17:FindFirstChild("Knocked") then
			break
		end
		if tick() + v4 <= tick() then
			break
		end
		if v17:GetAttribute("ShatterEGO") then
			break
		end
	end
	v17:SetAttribute("ShatterEGO", nil)
	v63 = false
	v59 = false
	v6.ManifestEGO:FireServer(false)
	return
end
local function RunningAttack()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 8
            ~ Argument Count: 0
            ~ Debug Name: RunningAttack
            ~ Bytecode ID: 41
            ~ Registers Used: R0-R10
            ~ Type Information: Unavailable
    ]]
	-- Fission: INFO: local 'v10_41' has been suffixed to avoid shadowing an existing, upper scope variable.
	-- Fission: INFO: local 'v6_41' has been suffixed to avoid shadowing an existing, upper scope variable.
	for v3, v4 in v17:GetChildren() do
		if v4.Name == "SlowAutoRotate" then
			v4:Destroy()
		end
	end
	local v0: number = HumanoidRootPart.AssemblyLinearVelocity.Y * -2
	v6.FallDamage:FireServer(false, v0)
	v10.ClearVelocity(v17)
	v17:SetAttribute("IsSwinging", true)
	v68 = true
	v6.RunAttackFX:FireServer()
	v81:Play()
	v81:AdjustSpeed(0.7)
	local v1 = Instance.new("BodyVelocity")
	v1.Name = "DashVelocity"
	v1.MaxForce = Vector3.new(25000, 0, 25000)
	v1.Parent = HumanoidRootPart
	local v2 = RaycastParams.new()
	v2.FilterType = Enum.RaycastFilterType.Exclude
	v2.FilterDescendantsInstances = { v17 }
	_G.HandleCD("Running Attack", 7)
	task.delay(7, function()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 1
                ~ Argument Count: 0
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 37
                ~ Registers Used: R0-R0
                ~ Type Information: Unavailable
        ]]
		v68 = false
	end)
	v3 = nil
	task.spawn(function()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 5
                ~ Argument Count: 0
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 38
                ~ Registers Used: R0-R19
                ~ Type Information: Unavailable
        ]]
		-- Fission: INFO: local 'v11_38' has been suffixed to avoid shadowing an existing, upper scope variable.
		-- Fission: INFO: local 'v3_38' has been suffixed to avoid shadowing an existing, upper scope variable.
		for i_2 = 1, 5, 1 do
			local v3_38 = HumanoidRootPart.CFrame
			local v5 = {}
			local v7 = _G.Enemies
			for v10, v11_38 in v7 do
				local v12 = v17
				if v11_38 ~= v12 then
					local v11_Humanoid: Instance = v11_38:FindFirstChild("Humanoid")
					if Humanoid then
						v12 = table.insert
						v12(v5, v11_38)
					end
				end
			end
			local v8 = {}
			v8.Filter = v5
			v8.Origin = v3_38.p
			v8.Direction = v3_38.LookVector * 20
			v8.Distance = 1
			v8.Character = v17
			v8.X = 15
			v8.Y = 7
			v8.Z = 25
			local v7 = v11.GPBIB(v8)
			if v7 then
				v8 = v7.BlockedHits
				for v11_38, v12 in v8 do
					local v13: number = table.find(v5, v12)
					if v13 then
						table.remove(v5, v13)
					end
				end
				if v7.Enemies then
					v8 = v7.Enemies
					for v11_38, v12 in v8 do
						local v12_HumanoidRootPart: Instance = v12:FindFirstChild("HumanoidRootPart")
						if HumanoidRootPart then
							if
								HumanoidRootPart.Position
									- HumanoidRootPart.Position.Unit:Dot(HumanoidRootPart.CFrame.LookVector)
								>= 0.8
							then
								if HumanoidRootPart.AssemblyAngularVelocity.Magnitude <= 0 then
									if game:GetService("RunService"):IsStudio() then
									end
								end
								if HumanoidRootPart.Position - HumanoidRootPart.Position.Magnitude >= 15 then
									v3 = HumanoidRootPart
									local v19 = HumanoidRootPart.CFrame.LookVector
									print(
										"got chasing target",
										v12,
										HumanoidRootPart.Position - HumanoidRootPart.Position.Unit:Dot(v19)
									)
									break
								end
							end
						end
					end
				end
			end
			if not v3 then
				task.wait(0.08)
			end
		end
		if not v3 then
			return
		end
		local v2 = CFrame.new(HumanoidRootPart.Position, v3.Position)
		v1.Velocity = v2.LookVector * 120
		return
	end)
	v10.Debris(v1, 1)
	v4 = false
	task.delay(0.2, function()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 1
                ~ Argument Count: 0
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 39
                ~ Registers Used: R0-R0
                ~ Type Information: Unavailable
        ]]
		v4 = true
	end)
	local v5: number = 130
	if v17:HasTag("InEGO") then
		v5 += 35
	end
	v6.AttackWarning:FireServer()
	local v6_41: nil = nil
	local v7: boolean = false
	local v13_RunService: RunService = game:GetService("RunService")
	local v8 = RunService.Heartbeat:Connect(function(arg0: number)
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 12
                ~ Argument Count: 1
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 40
                ~ Registers Used: R0-R12
                ~ Type Information: Unavailable
        ]]
		-- Fission: INFO: local 'v7_40' has been suffixed to avoid shadowing an existing, upper scope variable.
		-- Fission: INFO: local 'v6_40' has been suffixed to avoid shadowing an existing, upper scope variable.
		-- Fission: INFO: local 'v5_40' has been suffixed to avoid shadowing an existing, upper scope variable.
		-- Fission: INFO: local 'v3_40' has been suffixed to avoid shadowing an existing, upper scope variable.
		-- Fission: INFO: local 'v2_40' has been suffixed to avoid shadowing an existing, upper scope variable.
		-- Fission: INFO: local 'v1_40' has been suffixed to avoid shadowing an existing, upper scope variable.
		local v1_40: number = 200
		if v3 then
			v1_40 = 100
		end
		if v7 then
			v1_40 = 50
		end
		if 0 >= v5 then
			v5 = 0
			v6_41:Disconnect()
		else
			v5 = v5 - arg0 * v1_40
		end
		local v2_40 = HumanoidRootPart.Position
		local v3_40 = v17.HumanoidRootPart.CFrame.LookVector * 5
		local v5_40 = workspace:Blockcast(
			CFrame.new(v2_40, (v2_40 + v3_40)) * CFrame.new(0, 0, -2.5),
			Vector3.new(3, 5, 3),
			v3_40,
			v2
		)
		if v5_40 then
			if v5_40.Instance then
				if v5_40.Instance:IsDescendantOf(workspace.Alive) then
					if v4 then
						if not v7 then
							v7 = true
							local v6_40: number = math.clamp(v5, 35, 50)
							v5 = v6_40
							v6.AttackWarning:FireServer("RunAttack")
							if not v3 then
								v81:AdjustSpeed(1.5)
							else
								v81:AdjustSpeed(1.2)
								task.wait(0.2)
							end
							TweenService:Create(
								v1,
								TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
								{ MaxForce = Vector3.zero }
							):Play()
						end
					end
				end
			end
		end
		v6_40 = HumanoidRootPart.CFrame.LookVector
		if v3 then
			local v7_40 = CFrame.new(HumanoidRootPart.Position, v3.Position)
			v6_40 = v7_40.LookVector
		end
		v1.Velocity = v6_40 * v5
		if not (v1.Parent ~= HumanoidRootPart or v1 == nil or v5 <= 0 or v1.MaxForce.Magnitude <= 0) then
			return
		end
		v6_41:Disconnect()
		if v1 then
			v1:Destroy()
		end
		if not v17:GetAttribute("IsSwinging") then
			return
		end
		v81:AdjustSpeed(1.5)
		v17:SetAttribute("IsSwinging", nil)
		return
	end)
	v6_41 = v8
	repeat
		v8 = task.wait
		v8()
		v8 = v17
		local v10_41: string = "IsSwinging"
		local v8, v9 = v8:GetAttribute(v10_41)

	until not v8
	return
end
local function Dash()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 12
            ~ Argument Count: 0
            ~ Debug Name: Dash
            ~ Bytecode ID: 47
            ~ Registers Used: R0-R22
            ~ Type Information: Unavailable
    ]]
	-- Fission: INFO: local 'v20_47' has been suffixed to avoid shadowing an existing, upper scope variable.
	-- Fission: INFO: local 'v10_47' has been suffixed to avoid shadowing an existing, upper scope variable.
	-- Fission: INFO: local 'v6_47' has been suffixed to avoid shadowing an existing, upper scope variable.
	-- Fission: INFO: local 'v17_47' has been suffixed to avoid shadowing an existing, upper scope variable.
	if Humanoid.MoveDirection.Magnitude == 0 then
		return
	end
	local v0: nil = nil
	if v17:GetAttribute("CurrentM1") then
		if v17:GetAttribute("CurrentM1") < 4 then
			if v17:GetAttribute("CanM1Dash") then
				v0 = true
			end
			local ResetDashCD: Instance = v17:FindFirstChild("ResetDashCD")
			local v1: Instance = ResetDashCD
			if _G.CheckForStun(v17) then
				print("Check 2")
				return
			end
			if v17:FindFirstChild("UsingMove") then
				print("Check 2")
				return
			end
			if Humanoid.Health <= 0 then
				print("Check 2")
				return
			end
			if DashCD then
				if not v1 then
					print("Check 2")
					return
				end
			end
			if v17:GetAttribute("Swimming") then
				print("Check 2")
				return
			end
			for v5, v6_47 in v17:GetChildren() do
				if v6_47.Name == "SlowAutoRotate" then
					v6_47:Destroy()
				end
			end
			v2 = false
			local v3 = RaycastParams.new()
			v3.FilterType = Enum.RaycastFilterType.Exclude
			v3.FilterDescendantsInstances = { v17 }
			local v4 = workspace:Raycast(HumanoidRootPart.Position, Vector3.new(0, -5, 0), v3)
			if v4 then
				if v4.Instance then
					v2 = true
				end
			end
			v5 = Humanoid.MoveDirection
			v10.ClearVelocity(v17)
			v17:SetAttribute("Dodging", true)
			task.delay(0.25, function()
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 1
                        ~ Argument Count: 0
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 42
                        ~ Registers Used: R0-R3
                        ~ Type Information: Unavailable
                ]]
				v17:SetAttribute("Dodging", nil)
			end)
			if not v1 then
				DashCD = true
				v6_47 = 2
				if table.find(v47, "Agile") then
					v6_47 += 0.5
				end
				if table.find(v47, "ChainDashes") then
					v6_47 += 1
				end
				task.delay(v6_47, function()
					--[[ 
                        Fission ~~ Function Information:
                            ~ Upvalue Count: 0
                            ~ Argument Count: 0
                            ~ Debug Name: anon/no name
                            ~ Bytecode ID: 43
                            ~ Registers Used: R0-R0
                            ~ Type Information: Unavailable
                    ]]
					DashCD = false
				end)
			else
				v1:Destroy()
			end
			v6.FallDamage:FireServer(false, HumanoidRootPart.AssemblyLinearVelocity.Y * -2)
			local v9 = v5:Dot(HumanoidRootPart.CFrame.LookVector)
			local v10_47 = v5:Dot(HumanoidRootPart.CFrame.RightVector)
			local v11: number = 70
			local v12: number = 0.4
			local v13 = v8
			for v16, v17_47 in v13 do
				if table.find(v47, v17_47) then
					v11 += 1.5
				end
			end
			if not table.find(v47, "InsaneDashes") then
				if v17:HasTag("InEGO") then
				end
				v13 = "Ground"
				if not v2 then
					if 0.5 < v9 then
						v13 = "Air"
						v12 /= 1.5
					end
					if v0 then
						v13 = "M1Dash"
						v11 *= 0.8
						v17:SetAttribute("DisableM1", true)
						task.delay(v12, function()
							--[[ 
                                Fission ~~ Function Information:
                                    ~ Upvalue Count: 1
                                    ~ Argument Count: 0
                                    ~ Debug Name: anon/no name
                                    ~ Bytecode ID: 44
                                    ~ Registers Used: R0-R3
                                    ~ Type Information: Unavailable
                            ]]
							v17:SetAttribute("DisableM1", nil)
						end)
					end
					if table.find(v47, "CloseCallWind") then
						if v17.Humanoid.Health <= v17.Humanoid.MaxHealth / 4 then
							v11 += 15
						end
					end
					local v14 = Instance.new("BodyVelocity", HumanoidRootPart)
					v14.Name = "DashVelocity"
					v14.MaxForce = Vector3.new(30000, 0, 30000)
					v14.Velocity = v5 * v11
					v10.Debris(v14, v12)
					local v15: nil = nil
					if not v0 then
						local v16 = Instance.new("BodyGyro")
						v15 = v16
						v15.MaxTorque = Vector3.new(0, 1e+05, 0)
						v15.D = 200
						v15.P = 6000
						v15.Name = "DashThing"
						v15.CFrame = workspace.CurrentCamera.CFrame
						v15.Parent = HumanoidRootPart
						v10.Debris(v15, v12)
					end
					if v13 ~= "M1Dash" then
						if v13 ~= "Air" then
							if table.find(v47, "ChainDashes") then
								v11 *= 0.75
								v12 *= 0.75
							end
						end
					end
					local v16 = Instance.new("Folder")
					v16.Name = "DashDisabled"
					v16.Parent = v17
					v10.Debris(v16, v12 + 0.2)
					v17_47 = v32
					if v2 == false then
						if 0.5 < v9 then
							v17_47 = v31
							v14.MaxForce = Vector3.new(30000, 30000, 30000)
						end
						if v0 then
							local v18 = tick()
							local v19: nil = nil
							local v14_RunService: RunService = game:GetService("RunService")
							local v20_47 = RunService.RenderStepped:Connect(function(arg0: number)
								--[[ 
                                    Fission ~~ Function Information:
                                        ~ Upvalue Count: 10
                                        ~ Argument Count: 1
                                        ~ Debug Name: anon/no name
                                        ~ Bytecode ID: 45
                                        ~ Registers Used: R0-R8
                                        ~ Type Information: Unavailable
                                ]]
								-- Fission: INFO: local 'v5_45' has been suffixed to avoid shadowing an existing, upper scope variable.
								v11 = v11 - arg0 * 60
								if v13 == "Air" then
									local v1 = workspace.CurrentCamera.CFrame.LookVector
									local v2 = Vector3.new(v1.X, math.clamp(v1.Y, -0.2, 0.2), v1.Z)
									v5 = v2
								elseif Humanoid.MoveDirection.Magnitude ~= 0 then
									if tick() <= v18 + 0.4 then
										v5 = Humanoid.MoveDirection
									end
								end
								local v3 = RaycastParams.new()
								local v5_45 = workspace.Map
								v3.FilterDescendantsInstances = { v5_45, workspace.NPCS }
								v3.FilterType = Enum.RaycastFilterType.Include
								if workspace:Raycast(Humanoid.RootPart.Position, v5.Unit * 2, v3) then
									v19:Disconnect()
									v14:Destroy()
									v17_47:Stop(0)
									return
								end
								v14.Velocity = v5 * v11
								if v0 then
									return
								end
								v15.CFrame = workspace.CurrentCamera.CFrame
								return
							end)
							v19 = v20_47
							v6.Dash:FireServer(v13)
							task.delay(v12 + 0.1, function()
								--[[ 
                                    Fission ~~ Function Information:
                                        ~ Upvalue Count: 1
                                        ~ Argument Count: 0
                                        ~ Debug Name: anon/no name
                                        ~ Bytecode ID: 46
                                        ~ Registers Used: R0-R1
                                        ~ Type Information: Unavailable
                                ]]
								v19:Disconnect()
							end)
							return
						end
						v17_47.Priority = Enum.AnimationPriority.Action2
						v17_47:Play()
						local v18 = tick()
						v19 = nil
						local RunService: RunService = game:GetService("RunService")
						local v20_47 = RunService.RenderStepped:Connect(function(arg0: number)
							--[[ 
                                Fission ~~ Function Information:
                                    ~ Upvalue Count: 10
                                    ~ Argument Count: 1
                                    ~ Debug Name: anon/no name
                                    ~ Bytecode ID: 45
                                    ~ Registers Used: R0-R8
                                    ~ Type Information: Unavailable
                            ]]
							-- Fission: INFO: local 'v5_45' has been suffixed to avoid shadowing an existing, upper scope variable.
							v11 = v11 - arg0 * 60
							if v13 == "Air" then
								local v1 = workspace.CurrentCamera.CFrame.LookVector
								local v2 = Vector3.new(v1.X, math.clamp(v1.Y, -0.2, 0.2), v1.Z)
								v5 = v2
							elseif Humanoid.MoveDirection.Magnitude ~= 0 then
								if tick() <= v18 + 0.4 then
									v5 = Humanoid.MoveDirection
								end
							end
							local v3 = RaycastParams.new()
							local v5_45 = workspace.Map
							v3.FilterDescendantsInstances = { v5_45, workspace.NPCS }
							v3.FilterType = Enum.RaycastFilterType.Include
							if workspace:Raycast(Humanoid.RootPart.Position, v5.Unit * 2, v3) then
								v19:Disconnect()
								v14:Destroy()
								v17_47:Stop(0)
								return
							end
							v14.Velocity = v5 * v11
							if v0 then
								return
							end
							v15.CFrame = workspace.CurrentCamera.CFrame
							return
						end)
						v19 = v20_47
						v6.Dash:FireServer(v13)
						task.delay(v12 + 0.1, function()
							--[[ 
                                Fission ~~ Function Information:
                                    ~ Upvalue Count: 1
                                    ~ Argument Count: 0
                                    ~ Debug Name: anon/no name
                                    ~ Bytecode ID: 46
                                    ~ Registers Used: R0-R1
                                    ~ Type Information: Unavailable
                            ]]
							v19:Disconnect()
						end)
						return
					end
					if 0.5 >= v9 then
						if v9 >= -0.5 then
							if 0.5 >= v10_47 then
								if v10_47 < -0.5 then
									v17_47 = v34
								end
							else
								v17_47 = v35
							end
						else
							v17_47 = v33
						end
					else
						v17_47 = v32
					end
					if v0 then
						local v18 = tick()
						v19 = nil
						local v15_RunService: RunService = game:GetService("RunService")
						local v20_47 = RunService.RenderStepped:Connect(function(arg0: number)
							--[[ 
                                Fission ~~ Function Information:
                                    ~ Upvalue Count: 10
                                    ~ Argument Count: 1
                                    ~ Debug Name: anon/no name
                                    ~ Bytecode ID: 45
                                    ~ Registers Used: R0-R8
                                    ~ Type Information: Unavailable
                            ]]
							-- Fission: INFO: local 'v5_45' has been suffixed to avoid shadowing an existing, upper scope variable.
							v11 = v11 - arg0 * 60
							if v13 == "Air" then
								local v1 = workspace.CurrentCamera.CFrame.LookVector
								local v2 = Vector3.new(v1.X, math.clamp(v1.Y, -0.2, 0.2), v1.Z)
								v5 = v2
							elseif Humanoid.MoveDirection.Magnitude ~= 0 then
								if tick() <= v18 + 0.4 then
									v5 = Humanoid.MoveDirection
								end
							end
							local v3 = RaycastParams.new()
							local v5_45 = workspace.Map
							v3.FilterDescendantsInstances = { v5_45, workspace.NPCS }
							v3.FilterType = Enum.RaycastFilterType.Include
							if workspace:Raycast(Humanoid.RootPart.Position, v5.Unit * 2, v3) then
								v19:Disconnect()
								v14:Destroy()
								v17_47:Stop(0)
								return
							end
							v14.Velocity = v5 * v11
							if v0 then
								return
							end
							v15.CFrame = workspace.CurrentCamera.CFrame
							return
						end)
						v19 = v20_47
						v6.Dash:FireServer(v13)
						task.delay(v12 + 0.1, function()
							--[[ 
                                Fission ~~ Function Information:
                                    ~ Upvalue Count: 1
                                    ~ Argument Count: 0
                                    ~ Debug Name: anon/no name
                                    ~ Bytecode ID: 46
                                    ~ Registers Used: R0-R1
                                    ~ Type Information: Unavailable
                            ]]
							v19:Disconnect()
						end)
						return
					end
					v17_47.Priority = Enum.AnimationPriority.Action2
					v17_47:Play()
					local v18 = tick()
					v19 = nil
					local RunService: RunService = game:GetService("RunService")
					local v20_47 = RunService.RenderStepped:Connect(function(arg0: number)
						--[[ 
                            Fission ~~ Function Information:
                                ~ Upvalue Count: 10
                                ~ Argument Count: 1
                                ~ Debug Name: anon/no name
                                ~ Bytecode ID: 45
                                ~ Registers Used: R0-R8
                                ~ Type Information: Unavailable
                        ]]
						-- Fission: INFO: local 'v5_45' has been suffixed to avoid shadowing an existing, upper scope variable.
						v11 = v11 - arg0 * 60
						if v13 == "Air" then
							local v1 = workspace.CurrentCamera.CFrame.LookVector
							local v2 = Vector3.new(v1.X, math.clamp(v1.Y, -0.2, 0.2), v1.Z)
							v5 = v2
						elseif Humanoid.MoveDirection.Magnitude ~= 0 then
							if tick() <= v18 + 0.4 then
								v5 = Humanoid.MoveDirection
							end
						end
						local v3 = RaycastParams.new()
						local v5_45 = workspace.Map
						v3.FilterDescendantsInstances = { v5_45, workspace.NPCS }
						v3.FilterType = Enum.RaycastFilterType.Include
						if workspace:Raycast(Humanoid.RootPart.Position, v5.Unit * 2, v3) then
							v19:Disconnect()
							v14:Destroy()
							v17_47:Stop(0)
							return
						end
						v14.Velocity = v5 * v11
						if v0 then
							return
						end
						v15.CFrame = workspace.CurrentCamera.CFrame
						return
					end)
					v19 = v20_47
					v6.Dash:FireServer(v13)
					task.delay(v12 + 0.1, function()
						--[[ 
                            Fission ~~ Function Information:
                                ~ Upvalue Count: 1
                                ~ Argument Count: 0
                                ~ Debug Name: anon/no name
                                ~ Bytecode ID: 46
                                ~ Registers Used: R0-R1
                                ~ Type Information: Unavailable
                        ]]
						v19:Disconnect()
					end)
					return
				end
				local v14 = v10.GetStatusEffect(v17, "WarpDashStacks")
				if 0 >= v14.Value then
					if not table.find(v47, "Agile") then
						local v14 = v10.GetStatusEffect(v17, "HasteStacks")
						if 0 < v14.Value then
						end
					end
					v11 += 15
					v13 = "TPDash"
				else
					v13 = "WDash"
					v11 += 30
				end
				if v0 then
					v13 = "M1Dash"
					v11 *= 0.8
					v17:SetAttribute("DisableM1", true)
					task.delay(v12, function()
						--[[ 
                            Fission ~~ Function Information:
                                ~ Upvalue Count: 1
                                ~ Argument Count: 0
                                ~ Debug Name: anon/no name
                                ~ Bytecode ID: 44
                                ~ Registers Used: R0-R3
                                ~ Type Information: Unavailable
                        ]]
						v17:SetAttribute("DisableM1", nil)
					end)
				end
				if table.find(v47, "CloseCallWind") then
					if v17.Humanoid.Health <= v17.Humanoid.MaxHealth / 4 then
						v11 += 15
					end
				end
				local v14 = Instance.new("BodyVelocity", HumanoidRootPart)
				v14.Name = "DashVelocity"
				v14.MaxForce = Vector3.new(30000, 0, 30000)
				v14.Velocity = v5 * v11
				v10.Debris(v14, v12)
				v15 = nil
				if not v0 then
					local v16 = Instance.new("BodyGyro")
					v15 = v16
					v15.MaxTorque = Vector3.new(0, 1e+05, 0)
					v15.D = 200
					v15.P = 6000
					v15.Name = "DashThing"
					v15.CFrame = workspace.CurrentCamera.CFrame
					v15.Parent = HumanoidRootPart
					v10.Debris(v15, v12)
				end
				if v13 ~= "M1Dash" then
					if v13 ~= "Air" then
						if table.find(v47, "ChainDashes") then
							v11 *= 0.75
							v12 *= 0.75
						end
					end
				end
				local v16 = Instance.new("Folder")
				v16.Name = "DashDisabled"
				v16.Parent = v17
				v10.Debris(v16, v12 + 0.2)
				v17_47 = v32
				if v2 == false then
					if 0.5 < v9 then
						v17_47 = v31
						v14.MaxForce = Vector3.new(30000, 30000, 30000)
					end
					if v0 then
						local v18 = tick()
						v19 = nil
						local v16_RunService: RunService = game:GetService("RunService")
						local v20_47 = RunService.RenderStepped:Connect(function(arg0: number)
							--[[ 
                                Fission ~~ Function Information:
                                    ~ Upvalue Count: 10
                                    ~ Argument Count: 1
                                    ~ Debug Name: anon/no name
                                    ~ Bytecode ID: 45
                                    ~ Registers Used: R0-R8
                                    ~ Type Information: Unavailable
                            ]]
							-- Fission: INFO: local 'v5_45' has been suffixed to avoid shadowing an existing, upper scope variable.
							v11 = v11 - arg0 * 60
							if v13 == "Air" then
								local v1 = workspace.CurrentCamera.CFrame.LookVector
								local v2 = Vector3.new(v1.X, math.clamp(v1.Y, -0.2, 0.2), v1.Z)
								v5 = v2
							elseif Humanoid.MoveDirection.Magnitude ~= 0 then
								if tick() <= v18 + 0.4 then
									v5 = Humanoid.MoveDirection
								end
							end
							local v3 = RaycastParams.new()
							local v5_45 = workspace.Map
							v3.FilterDescendantsInstances = { v5_45, workspace.NPCS }
							v3.FilterType = Enum.RaycastFilterType.Include
							if workspace:Raycast(Humanoid.RootPart.Position, v5.Unit * 2, v3) then
								v19:Disconnect()
								v14:Destroy()
								v17_47:Stop(0)
								return
							end
							v14.Velocity = v5 * v11
							if v0 then
								return
							end
							v15.CFrame = workspace.CurrentCamera.CFrame
							return
						end)
						v19 = v20_47
						v6.Dash:FireServer(v13)
						task.delay(v12 + 0.1, function()
							--[[ 
                                Fission ~~ Function Information:
                                    ~ Upvalue Count: 1
                                    ~ Argument Count: 0
                                    ~ Debug Name: anon/no name
                                    ~ Bytecode ID: 46
                                    ~ Registers Used: R0-R1
                                    ~ Type Information: Unavailable
                            ]]
							v19:Disconnect()
						end)
						return
					end
					v17_47.Priority = Enum.AnimationPriority.Action2
					v17_47:Play()
					local v18 = tick()
					v19 = nil
					local RunService: RunService = game:GetService("RunService")
					local v20_47 = RunService.RenderStepped:Connect(function(arg0: number)
						--[[ 
                            Fission ~~ Function Information:
                                ~ Upvalue Count: 10
                                ~ Argument Count: 1
                                ~ Debug Name: anon/no name
                                ~ Bytecode ID: 45
                                ~ Registers Used: R0-R8
                                ~ Type Information: Unavailable
                        ]]
						-- Fission: INFO: local 'v5_45' has been suffixed to avoid shadowing an existing, upper scope variable.
						v11 = v11 - arg0 * 60
						if v13 == "Air" then
							local v1 = workspace.CurrentCamera.CFrame.LookVector
							local v2 = Vector3.new(v1.X, math.clamp(v1.Y, -0.2, 0.2), v1.Z)
							v5 = v2
						elseif Humanoid.MoveDirection.Magnitude ~= 0 then
							if tick() <= v18 + 0.4 then
								v5 = Humanoid.MoveDirection
							end
						end
						local v3 = RaycastParams.new()
						local v5_45 = workspace.Map
						v3.FilterDescendantsInstances = { v5_45, workspace.NPCS }
						v3.FilterType = Enum.RaycastFilterType.Include
						if workspace:Raycast(Humanoid.RootPart.Position, v5.Unit * 2, v3) then
							v19:Disconnect()
							v14:Destroy()
							v17_47:Stop(0)
							return
						end
						v14.Velocity = v5 * v11
						if v0 then
							return
						end
						v15.CFrame = workspace.CurrentCamera.CFrame
						return
					end)
					v19 = v20_47
					v6.Dash:FireServer(v13)
					task.delay(v12 + 0.1, function()
						--[[ 
                            Fission ~~ Function Information:
                                ~ Upvalue Count: 1
                                ~ Argument Count: 0
                                ~ Debug Name: anon/no name
                                ~ Bytecode ID: 46
                                ~ Registers Used: R0-R1
                                ~ Type Information: Unavailable
                        ]]
						v19:Disconnect()
					end)
					return
				end
				if 0.5 >= v9 then
					if v9 >= -0.5 then
						if 0.5 >= v10_47 then
							if v10_47 < -0.5 then
								v17_47 = v34
							end
						else
							v17_47 = v35
						end
					else
						v17_47 = v33
					end
				else
					v17_47 = v32
				end
				if v0 then
					local v18 = tick()
					v19 = nil
					local v17_RunService: RunService = game:GetService("RunService")
					local v20_47 = RunService.RenderStepped:Connect(function(arg0: number)
						--[[ 
                            Fission ~~ Function Information:
                                ~ Upvalue Count: 10
                                ~ Argument Count: 1
                                ~ Debug Name: anon/no name
                                ~ Bytecode ID: 45
                                ~ Registers Used: R0-R8
                                ~ Type Information: Unavailable
                        ]]
						-- Fission: INFO: local 'v5_45' has been suffixed to avoid shadowing an existing, upper scope variable.
						v11 = v11 - arg0 * 60
						if v13 == "Air" then
							local v1 = workspace.CurrentCamera.CFrame.LookVector
							local v2 = Vector3.new(v1.X, math.clamp(v1.Y, -0.2, 0.2), v1.Z)
							v5 = v2
						elseif Humanoid.MoveDirection.Magnitude ~= 0 then
							if tick() <= v18 + 0.4 then
								v5 = Humanoid.MoveDirection
							end
						end
						local v3 = RaycastParams.new()
						local v5_45 = workspace.Map
						v3.FilterDescendantsInstances = { v5_45, workspace.NPCS }
						v3.FilterType = Enum.RaycastFilterType.Include
						if workspace:Raycast(Humanoid.RootPart.Position, v5.Unit * 2, v3) then
							v19:Disconnect()
							v14:Destroy()
							v17_47:Stop(0)
							return
						end
						v14.Velocity = v5 * v11
						if v0 then
							return
						end
						v15.CFrame = workspace.CurrentCamera.CFrame
						return
					end)
					v19 = v20_47
					v6.Dash:FireServer(v13)
					task.delay(v12 + 0.1, function()
						--[[ 
                            Fission ~~ Function Information:
                                ~ Upvalue Count: 1
                                ~ Argument Count: 0
                                ~ Debug Name: anon/no name
                                ~ Bytecode ID: 46
                                ~ Registers Used: R0-R1
                                ~ Type Information: Unavailable
                        ]]
						v19:Disconnect()
					end)
					return
				end
				v17_47.Priority = Enum.AnimationPriority.Action2
				v17_47:Play()
				local v18 = tick()
				v19 = nil
				local RunService: RunService = game:GetService("RunService")
				local v20_47 = RunService.RenderStepped:Connect(function(arg0: number)
					--[[ 
                        Fission ~~ Function Information:
                            ~ Upvalue Count: 10
                            ~ Argument Count: 1
                            ~ Debug Name: anon/no name
                            ~ Bytecode ID: 45
                            ~ Registers Used: R0-R8
                            ~ Type Information: Unavailable
                    ]]
					-- Fission: INFO: local 'v5_45' has been suffixed to avoid shadowing an existing, upper scope variable.
					v11 = v11 - arg0 * 60
					if v13 == "Air" then
						local v1 = workspace.CurrentCamera.CFrame.LookVector
						local v2 = Vector3.new(v1.X, math.clamp(v1.Y, -0.2, 0.2), v1.Z)
						v5 = v2
					elseif Humanoid.MoveDirection.Magnitude ~= 0 then
						if tick() <= v18 + 0.4 then
							v5 = Humanoid.MoveDirection
						end
					end
					local v3 = RaycastParams.new()
					local v5_45 = workspace.Map
					v3.FilterDescendantsInstances = { v5_45, workspace.NPCS }
					v3.FilterType = Enum.RaycastFilterType.Include
					if workspace:Raycast(Humanoid.RootPart.Position, v5.Unit * 2, v3) then
						v19:Disconnect()
						v14:Destroy()
						v17_47:Stop(0)
						return
					end
					v14.Velocity = v5 * v11
					if v0 then
						return
					end
					v15.CFrame = workspace.CurrentCamera.CFrame
					return
				end)
				v19 = v20_47
				v6.Dash:FireServer(v13)
				task.delay(v12 + 0.1, function()
					--[[ 
                        Fission ~~ Function Information:
                            ~ Upvalue Count: 1
                            ~ Argument Count: 0
                            ~ Debug Name: anon/no name
                            ~ Bytecode ID: 46
                            ~ Registers Used: R0-R1
                            ~ Type Information: Unavailable
                    ]]
					v19:Disconnect()
				end)
				return
			end
			v12 = 0.6
			v13 = "Ground"
			if not v2 then
				if 0.5 < v9 then
					v13 = "Air"
					v12 /= 1.5
				end
				if v0 then
					v13 = "M1Dash"
					v11 *= 0.8
					v17:SetAttribute("DisableM1", true)
					task.delay(v12, function()
						--[[ 
                            Fission ~~ Function Information:
                                ~ Upvalue Count: 1
                                ~ Argument Count: 0
                                ~ Debug Name: anon/no name
                                ~ Bytecode ID: 44
                                ~ Registers Used: R0-R3
                                ~ Type Information: Unavailable
                        ]]
						v17:SetAttribute("DisableM1", nil)
					end)
				end
				if table.find(v47, "CloseCallWind") then
					if v17.Humanoid.Health <= v17.Humanoid.MaxHealth / 4 then
						v11 += 15
					end
				end
				local v14 = Instance.new("BodyVelocity", HumanoidRootPart)
				v14.Name = "DashVelocity"
				v14.MaxForce = Vector3.new(30000, 0, 30000)
				v14.Velocity = v5 * v11
				v10.Debris(v14, v12)
				v15 = nil
				if not v0 then
					local v16 = Instance.new("BodyGyro")
					v15 = v16
					v15.MaxTorque = Vector3.new(0, 1e+05, 0)
					v15.D = 200
					v15.P = 6000
					v15.Name = "DashThing"
					v15.CFrame = workspace.CurrentCamera.CFrame
					v15.Parent = HumanoidRootPart
					v10.Debris(v15, v12)
				end
				if v13 ~= "M1Dash" then
					if v13 ~= "Air" then
						if table.find(v47, "ChainDashes") then
							v11 *= 0.75
							v12 *= 0.75
						end
					end
				end
				local v16 = Instance.new("Folder")
				v16.Name = "DashDisabled"
				v16.Parent = v17
				v10.Debris(v16, v12 + 0.2)
				v17_47 = v32
				if v2 == false then
					if 0.5 < v9 then
						v17_47 = v31
						v14.MaxForce = Vector3.new(30000, 30000, 30000)
					end
					if v0 then
						local v18 = tick()
						v19 = nil
						local v18_RunService: RunService = game:GetService("RunService")
						local v20_47 = RunService.RenderStepped:Connect(function(arg0: number)
							--[[ 
                                Fission ~~ Function Information:
                                    ~ Upvalue Count: 10
                                    ~ Argument Count: 1
                                    ~ Debug Name: anon/no name
                                    ~ Bytecode ID: 45
                                    ~ Registers Used: R0-R8
                                    ~ Type Information: Unavailable
                            ]]
							-- Fission: INFO: local 'v5_45' has been suffixed to avoid shadowing an existing, upper scope variable.
							v11 = v11 - arg0 * 60
							if v13 == "Air" then
								local v1 = workspace.CurrentCamera.CFrame.LookVector
								local v2 = Vector3.new(v1.X, math.clamp(v1.Y, -0.2, 0.2), v1.Z)
								v5 = v2
							elseif Humanoid.MoveDirection.Magnitude ~= 0 then
								if tick() <= v18 + 0.4 then
									v5 = Humanoid.MoveDirection
								end
							end
							local v3 = RaycastParams.new()
							local v5_45 = workspace.Map
							v3.FilterDescendantsInstances = { v5_45, workspace.NPCS }
							v3.FilterType = Enum.RaycastFilterType.Include
							if workspace:Raycast(Humanoid.RootPart.Position, v5.Unit * 2, v3) then
								v19:Disconnect()
								v14:Destroy()
								v17_47:Stop(0)
								return
							end
							v14.Velocity = v5 * v11
							if v0 then
								return
							end
							v15.CFrame = workspace.CurrentCamera.CFrame
							return
						end)
						v19 = v20_47
						v6.Dash:FireServer(v13)
						task.delay(v12 + 0.1, function()
							--[[ 
                                Fission ~~ Function Information:
                                    ~ Upvalue Count: 1
                                    ~ Argument Count: 0
                                    ~ Debug Name: anon/no name
                                    ~ Bytecode ID: 46
                                    ~ Registers Used: R0-R1
                                    ~ Type Information: Unavailable
                            ]]
							v19:Disconnect()
						end)
						return
					end
					v17_47.Priority = Enum.AnimationPriority.Action2
					v17_47:Play()
					local v18 = tick()
					v19 = nil
					local RunService: RunService = game:GetService("RunService")
					local v20_47 = RunService.RenderStepped:Connect(function(arg0: number)
						--[[ 
                            Fission ~~ Function Information:
                                ~ Upvalue Count: 10
                                ~ Argument Count: 1
                                ~ Debug Name: anon/no name
                                ~ Bytecode ID: 45
                                ~ Registers Used: R0-R8
                                ~ Type Information: Unavailable
                        ]]
						-- Fission: INFO: local 'v5_45' has been suffixed to avoid shadowing an existing, upper scope variable.
						v11 = v11 - arg0 * 60
						if v13 == "Air" then
							local v1 = workspace.CurrentCamera.CFrame.LookVector
							local v2 = Vector3.new(v1.X, math.clamp(v1.Y, -0.2, 0.2), v1.Z)
							v5 = v2
						elseif Humanoid.MoveDirection.Magnitude ~= 0 then
							if tick() <= v18 + 0.4 then
								v5 = Humanoid.MoveDirection
							end
						end
						local v3 = RaycastParams.new()
						local v5_45 = workspace.Map
						v3.FilterDescendantsInstances = { v5_45, workspace.NPCS }
						v3.FilterType = Enum.RaycastFilterType.Include
						if workspace:Raycast(Humanoid.RootPart.Position, v5.Unit * 2, v3) then
							v19:Disconnect()
							v14:Destroy()
							v17_47:Stop(0)
							return
						end
						v14.Velocity = v5 * v11
						if v0 then
							return
						end
						v15.CFrame = workspace.CurrentCamera.CFrame
						return
					end)
					v19 = v20_47
					v6.Dash:FireServer(v13)
					task.delay(v12 + 0.1, function()
						--[[ 
                            Fission ~~ Function Information:
                                ~ Upvalue Count: 1
                                ~ Argument Count: 0
                                ~ Debug Name: anon/no name
                                ~ Bytecode ID: 46
                                ~ Registers Used: R0-R1
                                ~ Type Information: Unavailable
                        ]]
						v19:Disconnect()
					end)
					return
				end
				if 0.5 >= v9 then
					if v9 >= -0.5 then
						if 0.5 >= v10_47 then
							if v10_47 < -0.5 then
								v17_47 = v34
							end
						else
							v17_47 = v35
						end
					else
						v17_47 = v33
					end
				else
					v17_47 = v32
				end
				if v0 then
					local v18 = tick()
					v19 = nil
					local v19_RunService: RunService = game:GetService("RunService")
					local v20_47 = RunService.RenderStepped:Connect(function(arg0: number)
						--[[ 
                            Fission ~~ Function Information:
                                ~ Upvalue Count: 10
                                ~ Argument Count: 1
                                ~ Debug Name: anon/no name
                                ~ Bytecode ID: 45
                                ~ Registers Used: R0-R8
                                ~ Type Information: Unavailable
                        ]]
						-- Fission: INFO: local 'v5_45' has been suffixed to avoid shadowing an existing, upper scope variable.
						v11 = v11 - arg0 * 60
						if v13 == "Air" then
							local v1 = workspace.CurrentCamera.CFrame.LookVector
							local v2 = Vector3.new(v1.X, math.clamp(v1.Y, -0.2, 0.2), v1.Z)
							v5 = v2
						elseif Humanoid.MoveDirection.Magnitude ~= 0 then
							if tick() <= v18 + 0.4 then
								v5 = Humanoid.MoveDirection
							end
						end
						local v3 = RaycastParams.new()
						local v5_45 = workspace.Map
						v3.FilterDescendantsInstances = { v5_45, workspace.NPCS }
						v3.FilterType = Enum.RaycastFilterType.Include
						if workspace:Raycast(Humanoid.RootPart.Position, v5.Unit * 2, v3) then
							v19:Disconnect()
							v14:Destroy()
							v17_47:Stop(0)
							return
						end
						v14.Velocity = v5 * v11
						if v0 then
							return
						end
						v15.CFrame = workspace.CurrentCamera.CFrame
						return
					end)
					v19 = v20_47
					v6.Dash:FireServer(v13)
					task.delay(v12 + 0.1, function()
						--[[ 
                            Fission ~~ Function Information:
                                ~ Upvalue Count: 1
                                ~ Argument Count: 0
                                ~ Debug Name: anon/no name
                                ~ Bytecode ID: 46
                                ~ Registers Used: R0-R1
                                ~ Type Information: Unavailable
                        ]]
						v19:Disconnect()
					end)
					return
				end
				v17_47.Priority = Enum.AnimationPriority.Action2
				v17_47:Play()
				local v18 = tick()
				v19 = nil
				local RunService: RunService = game:GetService("RunService")
				local v20_47 = RunService.RenderStepped:Connect(function(arg0: number)
					--[[ 
                        Fission ~~ Function Information:
                            ~ Upvalue Count: 10
                            ~ Argument Count: 1
                            ~ Debug Name: anon/no name
                            ~ Bytecode ID: 45
                            ~ Registers Used: R0-R8
                            ~ Type Information: Unavailable
                    ]]
					-- Fission: INFO: local 'v5_45' has been suffixed to avoid shadowing an existing, upper scope variable.
					v11 = v11 - arg0 * 60
					if v13 == "Air" then
						local v1 = workspace.CurrentCamera.CFrame.LookVector
						local v2 = Vector3.new(v1.X, math.clamp(v1.Y, -0.2, 0.2), v1.Z)
						v5 = v2
					elseif Humanoid.MoveDirection.Magnitude ~= 0 then
						if tick() <= v18 + 0.4 then
							v5 = Humanoid.MoveDirection
						end
					end
					local v3 = RaycastParams.new()
					local v5_45 = workspace.Map
					v3.FilterDescendantsInstances = { v5_45, workspace.NPCS }
					v3.FilterType = Enum.RaycastFilterType.Include
					if workspace:Raycast(Humanoid.RootPart.Position, v5.Unit * 2, v3) then
						v19:Disconnect()
						v14:Destroy()
						v17_47:Stop(0)
						return
					end
					v14.Velocity = v5 * v11
					if v0 then
						return
					end
					v15.CFrame = workspace.CurrentCamera.CFrame
					return
				end)
				v19 = v20_47
				v6.Dash:FireServer(v13)
				task.delay(v12 + 0.1, function()
					--[[ 
                        Fission ~~ Function Information:
                            ~ Upvalue Count: 1
                            ~ Argument Count: 0
                            ~ Debug Name: anon/no name
                            ~ Bytecode ID: 46
                            ~ Registers Used: R0-R1
                            ~ Type Information: Unavailable
                    ]]
					v19:Disconnect()
				end)
				return
			end
			local v14 = v10.GetStatusEffect(v17, "WarpDashStacks")
			if 0 >= v14.Value then
				if not table.find(v47, "Agile") then
					local v14 = v10.GetStatusEffect(v17, "HasteStacks")
					if 0 < v14.Value then
					end
				end
				v11 += 15
				v13 = "TPDash"
			else
				v13 = "WDash"
				v11 += 30
			end
			if v0 then
				v13 = "M1Dash"
				v11 *= 0.8
				v17:SetAttribute("DisableM1", true)
				task.delay(v12, function()
					--[[ 
                        Fission ~~ Function Information:
                            ~ Upvalue Count: 1
                            ~ Argument Count: 0
                            ~ Debug Name: anon/no name
                            ~ Bytecode ID: 44
                            ~ Registers Used: R0-R3
                            ~ Type Information: Unavailable
                    ]]
					v17:SetAttribute("DisableM1", nil)
				end)
			end
			if table.find(v47, "CloseCallWind") then
				if v17.Humanoid.Health <= v17.Humanoid.MaxHealth / 4 then
					v11 += 15
				end
			end
			local v14 = Instance.new("BodyVelocity", HumanoidRootPart)
			v14.Name = "DashVelocity"
			v14.MaxForce = Vector3.new(30000, 0, 30000)
			v14.Velocity = v5 * v11
			v10.Debris(v14, v12)
			v15 = nil
			if not v0 then
				local v16 = Instance.new("BodyGyro")
				v15 = v16
				v15.MaxTorque = Vector3.new(0, 1e+05, 0)
				v15.D = 200
				v15.P = 6000
				v15.Name = "DashThing"
				v15.CFrame = workspace.CurrentCamera.CFrame
				v15.Parent = HumanoidRootPart
				v10.Debris(v15, v12)
			end
			if v13 ~= "M1Dash" then
				if v13 ~= "Air" then
					if table.find(v47, "ChainDashes") then
						v11 *= 0.75
						v12 *= 0.75
					end
				end
			end
			local v16 = Instance.new("Folder")
			v16.Name = "DashDisabled"
			v16.Parent = v17
			v10.Debris(v16, v12 + 0.2)
			v17_47 = v32
			if v2 == false then
				if 0.5 < v9 then
					v17_47 = v31
					v14.MaxForce = Vector3.new(30000, 30000, 30000)
				end
				if v0 then
					local v18 = tick()
					v19 = nil
					local v20_RunService: RunService = game:GetService("RunService")
					local v20_47 = RunService.RenderStepped:Connect(function(arg0: number)
						--[[ 
                            Fission ~~ Function Information:
                                ~ Upvalue Count: 10
                                ~ Argument Count: 1
                                ~ Debug Name: anon/no name
                                ~ Bytecode ID: 45
                                ~ Registers Used: R0-R8
                                ~ Type Information: Unavailable
                        ]]
						-- Fission: INFO: local 'v5_45' has been suffixed to avoid shadowing an existing, upper scope variable.
						v11 = v11 - arg0 * 60
						if v13 == "Air" then
							local v1 = workspace.CurrentCamera.CFrame.LookVector
							local v2 = Vector3.new(v1.X, math.clamp(v1.Y, -0.2, 0.2), v1.Z)
							v5 = v2
						elseif Humanoid.MoveDirection.Magnitude ~= 0 then
							if tick() <= v18 + 0.4 then
								v5 = Humanoid.MoveDirection
							end
						end
						local v3 = RaycastParams.new()
						local v5_45 = workspace.Map
						v3.FilterDescendantsInstances = { v5_45, workspace.NPCS }
						v3.FilterType = Enum.RaycastFilterType.Include
						if workspace:Raycast(Humanoid.RootPart.Position, v5.Unit * 2, v3) then
							v19:Disconnect()
							v14:Destroy()
							v17_47:Stop(0)
							return
						end
						v14.Velocity = v5 * v11
						if v0 then
							return
						end
						v15.CFrame = workspace.CurrentCamera.CFrame
						return
					end)
					v19 = v20_47
					v6.Dash:FireServer(v13)
					task.delay(v12 + 0.1, function()
						--[[ 
                            Fission ~~ Function Information:
                                ~ Upvalue Count: 1
                                ~ Argument Count: 0
                                ~ Debug Name: anon/no name
                                ~ Bytecode ID: 46
                                ~ Registers Used: R0-R1
                                ~ Type Information: Unavailable
                        ]]
						v19:Disconnect()
					end)
					return
				end
				v17_47.Priority = Enum.AnimationPriority.Action2
				v17_47:Play()
				local v18 = tick()
				v19 = nil
				local RunService: RunService = game:GetService("RunService")
				local v20_47 = RunService.RenderStepped:Connect(function(arg0: number)
					--[[ 
                        Fission ~~ Function Information:
                            ~ Upvalue Count: 10
                            ~ Argument Count: 1
                            ~ Debug Name: anon/no name
                            ~ Bytecode ID: 45
                            ~ Registers Used: R0-R8
                            ~ Type Information: Unavailable
                    ]]
					-- Fission: INFO: local 'v5_45' has been suffixed to avoid shadowing an existing, upper scope variable.
					v11 = v11 - arg0 * 60
					if v13 == "Air" then
						local v1 = workspace.CurrentCamera.CFrame.LookVector
						local v2 = Vector3.new(v1.X, math.clamp(v1.Y, -0.2, 0.2), v1.Z)
						v5 = v2
					elseif Humanoid.MoveDirection.Magnitude ~= 0 then
						if tick() <= v18 + 0.4 then
							v5 = Humanoid.MoveDirection
						end
					end
					local v3 = RaycastParams.new()
					local v5_45 = workspace.Map
					v3.FilterDescendantsInstances = { v5_45, workspace.NPCS }
					v3.FilterType = Enum.RaycastFilterType.Include
					if workspace:Raycast(Humanoid.RootPart.Position, v5.Unit * 2, v3) then
						v19:Disconnect()
						v14:Destroy()
						v17_47:Stop(0)
						return
					end
					v14.Velocity = v5 * v11
					if v0 then
						return
					end
					v15.CFrame = workspace.CurrentCamera.CFrame
					return
				end)
				v19 = v20_47
				v6.Dash:FireServer(v13)
				task.delay(v12 + 0.1, function()
					--[[ 
                        Fission ~~ Function Information:
                            ~ Upvalue Count: 1
                            ~ Argument Count: 0
                            ~ Debug Name: anon/no name
                            ~ Bytecode ID: 46
                            ~ Registers Used: R0-R1
                            ~ Type Information: Unavailable
                    ]]
					v19:Disconnect()
				end)
				return
			end
			if 0.5 >= v9 then
				if v9 >= -0.5 then
					if 0.5 >= v10_47 then
						if v10_47 < -0.5 then
							v17_47 = v34
						end
					else
						v17_47 = v35
					end
				else
					v17_47 = v33
				end
			else
				v17_47 = v32
			end
			if v0 then
				local v18 = tick()
				v19 = nil
				local v21_RunService: RunService = game:GetService("RunService")
				local v20_47 = RunService.RenderStepped:Connect(function(arg0: number)
					--[[ 
                        Fission ~~ Function Information:
                            ~ Upvalue Count: 10
                            ~ Argument Count: 1
                            ~ Debug Name: anon/no name
                            ~ Bytecode ID: 45
                            ~ Registers Used: R0-R8
                            ~ Type Information: Unavailable
                    ]]
					-- Fission: INFO: local 'v5_45' has been suffixed to avoid shadowing an existing, upper scope variable.
					v11 = v11 - arg0 * 60
					if v13 == "Air" then
						local v1 = workspace.CurrentCamera.CFrame.LookVector
						local v2 = Vector3.new(v1.X, math.clamp(v1.Y, -0.2, 0.2), v1.Z)
						v5 = v2
					elseif Humanoid.MoveDirection.Magnitude ~= 0 then
						if tick() <= v18 + 0.4 then
							v5 = Humanoid.MoveDirection
						end
					end
					local v3 = RaycastParams.new()
					local v5_45 = workspace.Map
					v3.FilterDescendantsInstances = { v5_45, workspace.NPCS }
					v3.FilterType = Enum.RaycastFilterType.Include
					if workspace:Raycast(Humanoid.RootPart.Position, v5.Unit * 2, v3) then
						v19:Disconnect()
						v14:Destroy()
						v17_47:Stop(0)
						return
					end
					v14.Velocity = v5 * v11
					if v0 then
						return
					end
					v15.CFrame = workspace.CurrentCamera.CFrame
					return
				end)
				v19 = v20_47
				v6.Dash:FireServer(v13)
				task.delay(v12 + 0.1, function()
					--[[ 
                        Fission ~~ Function Information:
                            ~ Upvalue Count: 1
                            ~ Argument Count: 0
                            ~ Debug Name: anon/no name
                            ~ Bytecode ID: 46
                            ~ Registers Used: R0-R1
                            ~ Type Information: Unavailable
                    ]]
					v19:Disconnect()
				end)
				return
			end
			v17_47.Priority = Enum.AnimationPriority.Action2
			v17_47:Play()
			local v18 = tick()
			v19 = nil
			local RunService: RunService = game:GetService("RunService")
			local v20_47 = RunService.RenderStepped:Connect(function(arg0: number)
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 10
                        ~ Argument Count: 1
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 45
                        ~ Registers Used: R0-R8
                        ~ Type Information: Unavailable
                ]]
				-- Fission: INFO: local 'v5_45' has been suffixed to avoid shadowing an existing, upper scope variable.
				v11 = v11 - arg0 * 60
				if v13 == "Air" then
					local v1 = workspace.CurrentCamera.CFrame.LookVector
					local v2 = Vector3.new(v1.X, math.clamp(v1.Y, -0.2, 0.2), v1.Z)
					v5 = v2
				elseif Humanoid.MoveDirection.Magnitude ~= 0 then
					if tick() <= v18 + 0.4 then
						v5 = Humanoid.MoveDirection
					end
				end
				local v3 = RaycastParams.new()
				local v5_45 = workspace.Map
				v3.FilterDescendantsInstances = { v5_45, workspace.NPCS }
				v3.FilterType = Enum.RaycastFilterType.Include
				if workspace:Raycast(Humanoid.RootPart.Position, v5.Unit * 2, v3) then
					v19:Disconnect()
					v14:Destroy()
					v17_47:Stop(0)
					return
				end
				v14.Velocity = v5 * v11
				if v0 then
					return
				end
				v15.CFrame = workspace.CurrentCamera.CFrame
				return
			end)
			v19 = v20_47
			v6.Dash:FireServer(v13)
			task.delay(v12 + 0.1, function()
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 1
                        ~ Argument Count: 0
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 46
                        ~ Registers Used: R0-R1
                        ~ Type Information: Unavailable
                ]]
				v19:Disconnect()
			end)
			return
		end
	end
	if v17:FindFirstChild("LightAttack") then
		return
	end
	if v17:FindFirstChild("DashDisabled") then
		return
	end
	if v17:GetAttribute("IsSwinging") then
		return
	end
	local v22_ResetDashCD: Instance = v17:FindFirstChild("ResetDashCD")
	v1 = ResetDashCD
	if _G.CheckForStun(v17) then
		print("Check 2")
		return
	end
	if v17:FindFirstChild("UsingMove") then
		print("Check 2")
		return
	end
	if Humanoid.Health <= 0 then
		print("Check 2")
		return
	end
	if DashCD then
		if not v1 then
			print("Check 2")
			return
		end
	end
	if v17:GetAttribute("Swimming") then
		print("Check 2")
		return
	end
	for v5, v6_47 in v17:GetChildren() do
		if v6_47.Name == "SlowAutoRotate" then
			v6_47:Destroy()
		end
	end
	v2 = false
	local v3 = RaycastParams.new()
	v3.FilterType = Enum.RaycastFilterType.Exclude
	v3.FilterDescendantsInstances = { v17 }
	local v4 = workspace:Raycast(HumanoidRootPart.Position, Vector3.new(0, -5, 0), v3)
	if v4 then
		if v4.Instance then
			v2 = true
		end
	end
	v5 = Humanoid.MoveDirection
	v10.ClearVelocity(v17)
	v17:SetAttribute("Dodging", true)
	task.delay(0.25, function()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 1
                ~ Argument Count: 0
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 42
                ~ Registers Used: R0-R3
                ~ Type Information: Unavailable
        ]]
		v17:SetAttribute("Dodging", nil)
	end)
	if not v1 then
		DashCD = true
		v6_47 = 2
		if table.find(v47, "Agile") then
			v6_47 += 0.5
		end
		if table.find(v47, "ChainDashes") then
			v6_47 += 1
		end
		task.delay(v6_47, function()
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 0
                    ~ Argument Count: 0
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 43
                    ~ Registers Used: R0-R0
                    ~ Type Information: Unavailable
            ]]
			DashCD = false
		end)
	else
		v1:Destroy()
	end
	v6.FallDamage:FireServer(false, HumanoidRootPart.AssemblyLinearVelocity.Y * -2)
	local v9 = v5:Dot(HumanoidRootPart.CFrame.LookVector)
	local v10_47 = v5:Dot(HumanoidRootPart.CFrame.RightVector)
	v11 = 70
	v12 = 0.4
	local v13 = v8
	for v16, v17_47 in v13 do
		if table.find(v47, v17_47) then
			v11 += 1.5
		end
	end
	if not table.find(v47, "InsaneDashes") then
		if v17:HasTag("InEGO") then
		end
		v13 = "Ground"
		if not v2 then
			if 0.5 < v9 then
				v13 = "Air"
				v12 /= 1.5
			end
			if v0 then
				v13 = "M1Dash"
				v11 *= 0.8
				v17:SetAttribute("DisableM1", true)
				task.delay(v12, function()
					--[[ 
                        Fission ~~ Function Information:
                            ~ Upvalue Count: 1
                            ~ Argument Count: 0
                            ~ Debug Name: anon/no name
                            ~ Bytecode ID: 44
                            ~ Registers Used: R0-R3
                            ~ Type Information: Unavailable
                    ]]
					v17:SetAttribute("DisableM1", nil)
				end)
			end
			if table.find(v47, "CloseCallWind") then
				if v17.Humanoid.Health <= v17.Humanoid.MaxHealth / 4 then
					v11 += 15
				end
			end
			local v14 = Instance.new("BodyVelocity", HumanoidRootPart)
			v14.Name = "DashVelocity"
			v14.MaxForce = Vector3.new(30000, 0, 30000)
			v14.Velocity = v5 * v11
			v10.Debris(v14, v12)
			v15 = nil
			if not v0 then
				local v16 = Instance.new("BodyGyro")
				v15 = v16
				v15.MaxTorque = Vector3.new(0, 1e+05, 0)
				v15.D = 200
				v15.P = 6000
				v15.Name = "DashThing"
				v15.CFrame = workspace.CurrentCamera.CFrame
				v15.Parent = HumanoidRootPart
				v10.Debris(v15, v12)
			end
			if v13 ~= "M1Dash" then
				if v13 ~= "Air" then
					if table.find(v47, "ChainDashes") then
						v11 *= 0.75
						v12 *= 0.75
					end
				end
			end
			local v16 = Instance.new("Folder")
			v16.Name = "DashDisabled"
			v16.Parent = v17
			v10.Debris(v16, v12 + 0.2)
			v17_47 = v32
			if v2 == false then
				if 0.5 < v9 then
					v17_47 = v31
					v14.MaxForce = Vector3.new(30000, 30000, 30000)
				end
				if v0 then
					local v18 = tick()
					v19 = nil
					local v23_RunService: RunService = game:GetService("RunService")
					local v20_47 = RunService.RenderStepped:Connect(function(arg0: number)
						--[[ 
                            Fission ~~ Function Information:
                                ~ Upvalue Count: 10
                                ~ Argument Count: 1
                                ~ Debug Name: anon/no name
                                ~ Bytecode ID: 45
                                ~ Registers Used: R0-R8
                                ~ Type Information: Unavailable
                        ]]
						-- Fission: INFO: local 'v5_45' has been suffixed to avoid shadowing an existing, upper scope variable.
						v11 = v11 - arg0 * 60
						if v13 == "Air" then
							local v1 = workspace.CurrentCamera.CFrame.LookVector
							local v2 = Vector3.new(v1.X, math.clamp(v1.Y, -0.2, 0.2), v1.Z)
							v5 = v2
						elseif Humanoid.MoveDirection.Magnitude ~= 0 then
							if tick() <= v18 + 0.4 then
								v5 = Humanoid.MoveDirection
							end
						end
						local v3 = RaycastParams.new()
						local v5_45 = workspace.Map
						v3.FilterDescendantsInstances = { v5_45, workspace.NPCS }
						v3.FilterType = Enum.RaycastFilterType.Include
						if workspace:Raycast(Humanoid.RootPart.Position, v5.Unit * 2, v3) then
							v19:Disconnect()
							v14:Destroy()
							v17_47:Stop(0)
							return
						end
						v14.Velocity = v5 * v11
						if v0 then
							return
						end
						v15.CFrame = workspace.CurrentCamera.CFrame
						return
					end)
					v19 = v20_47
					v6.Dash:FireServer(v13)
					task.delay(v12 + 0.1, function()
						--[[ 
                            Fission ~~ Function Information:
                                ~ Upvalue Count: 1
                                ~ Argument Count: 0
                                ~ Debug Name: anon/no name
                                ~ Bytecode ID: 46
                                ~ Registers Used: R0-R1
                                ~ Type Information: Unavailable
                        ]]
						v19:Disconnect()
					end)
					return
				end
				v17_47.Priority = Enum.AnimationPriority.Action2
				v17_47:Play()
				local v18 = tick()
				v19 = nil
				local RunService: RunService = game:GetService("RunService")
				local v20_47 = RunService.RenderStepped:Connect(function(arg0: number)
					--[[ 
                        Fission ~~ Function Information:
                            ~ Upvalue Count: 10
                            ~ Argument Count: 1
                            ~ Debug Name: anon/no name
                            ~ Bytecode ID: 45
                            ~ Registers Used: R0-R8
                            ~ Type Information: Unavailable
                    ]]
					-- Fission: INFO: local 'v5_45' has been suffixed to avoid shadowing an existing, upper scope variable.
					v11 = v11 - arg0 * 60
					if v13 == "Air" then
						local v1 = workspace.CurrentCamera.CFrame.LookVector
						local v2 = Vector3.new(v1.X, math.clamp(v1.Y, -0.2, 0.2), v1.Z)
						v5 = v2
					elseif Humanoid.MoveDirection.Magnitude ~= 0 then
						if tick() <= v18 + 0.4 then
							v5 = Humanoid.MoveDirection
						end
					end
					local v3 = RaycastParams.new()
					local v5_45 = workspace.Map
					v3.FilterDescendantsInstances = { v5_45, workspace.NPCS }
					v3.FilterType = Enum.RaycastFilterType.Include
					if workspace:Raycast(Humanoid.RootPart.Position, v5.Unit * 2, v3) then
						v19:Disconnect()
						v14:Destroy()
						v17_47:Stop(0)
						return
					end
					v14.Velocity = v5 * v11
					if v0 then
						return
					end
					v15.CFrame = workspace.CurrentCamera.CFrame
					return
				end)
				v19 = v20_47
				v6.Dash:FireServer(v13)
				task.delay(v12 + 0.1, function()
					--[[ 
                        Fission ~~ Function Information:
                            ~ Upvalue Count: 1
                            ~ Argument Count: 0
                            ~ Debug Name: anon/no name
                            ~ Bytecode ID: 46
                            ~ Registers Used: R0-R1
                            ~ Type Information: Unavailable
                    ]]
					v19:Disconnect()
				end)
				return
			end
			if 0.5 >= v9 then
				if v9 >= -0.5 then
					if 0.5 >= v10_47 then
						if v10_47 < -0.5 then
							v17_47 = v34
						end
					else
						v17_47 = v35
					end
				else
					v17_47 = v33
				end
			else
				v17_47 = v32
			end
			if v0 then
				local v18 = tick()
				v19 = nil
				local v24_RunService: RunService = game:GetService("RunService")
				local v20_47 = RunService.RenderStepped:Connect(function(arg0: number)
					--[[ 
                        Fission ~~ Function Information:
                            ~ Upvalue Count: 10
                            ~ Argument Count: 1
                            ~ Debug Name: anon/no name
                            ~ Bytecode ID: 45
                            ~ Registers Used: R0-R8
                            ~ Type Information: Unavailable
                    ]]
					-- Fission: INFO: local 'v5_45' has been suffixed to avoid shadowing an existing, upper scope variable.
					v11 = v11 - arg0 * 60
					if v13 == "Air" then
						local v1 = workspace.CurrentCamera.CFrame.LookVector
						local v2 = Vector3.new(v1.X, math.clamp(v1.Y, -0.2, 0.2), v1.Z)
						v5 = v2
					elseif Humanoid.MoveDirection.Magnitude ~= 0 then
						if tick() <= v18 + 0.4 then
							v5 = Humanoid.MoveDirection
						end
					end
					local v3 = RaycastParams.new()
					local v5_45 = workspace.Map
					v3.FilterDescendantsInstances = { v5_45, workspace.NPCS }
					v3.FilterType = Enum.RaycastFilterType.Include
					if workspace:Raycast(Humanoid.RootPart.Position, v5.Unit * 2, v3) then
						v19:Disconnect()
						v14:Destroy()
						v17_47:Stop(0)
						return
					end
					v14.Velocity = v5 * v11
					if v0 then
						return
					end
					v15.CFrame = workspace.CurrentCamera.CFrame
					return
				end)
				v19 = v20_47
				v6.Dash:FireServer(v13)
				task.delay(v12 + 0.1, function()
					--[[ 
                        Fission ~~ Function Information:
                            ~ Upvalue Count: 1
                            ~ Argument Count: 0
                            ~ Debug Name: anon/no name
                            ~ Bytecode ID: 46
                            ~ Registers Used: R0-R1
                            ~ Type Information: Unavailable
                    ]]
					v19:Disconnect()
				end)
				return
			end
			v17_47.Priority = Enum.AnimationPriority.Action2
			v17_47:Play()
			local v18 = tick()
			v19 = nil
			local RunService: RunService = game:GetService("RunService")
			local v20_47 = RunService.RenderStepped:Connect(function(arg0: number)
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 10
                        ~ Argument Count: 1
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 45
                        ~ Registers Used: R0-R8
                        ~ Type Information: Unavailable
                ]]
				-- Fission: INFO: local 'v5_45' has been suffixed to avoid shadowing an existing, upper scope variable.
				v11 = v11 - arg0 * 60
				if v13 == "Air" then
					local v1 = workspace.CurrentCamera.CFrame.LookVector
					local v2 = Vector3.new(v1.X, math.clamp(v1.Y, -0.2, 0.2), v1.Z)
					v5 = v2
				elseif Humanoid.MoveDirection.Magnitude ~= 0 then
					if tick() <= v18 + 0.4 then
						v5 = Humanoid.MoveDirection
					end
				end
				local v3 = RaycastParams.new()
				local v5_45 = workspace.Map
				v3.FilterDescendantsInstances = { v5_45, workspace.NPCS }
				v3.FilterType = Enum.RaycastFilterType.Include
				if workspace:Raycast(Humanoid.RootPart.Position, v5.Unit * 2, v3) then
					v19:Disconnect()
					v14:Destroy()
					v17_47:Stop(0)
					return
				end
				v14.Velocity = v5 * v11
				if v0 then
					return
				end
				v15.CFrame = workspace.CurrentCamera.CFrame
				return
			end)
			v19 = v20_47
			v6.Dash:FireServer(v13)
			task.delay(v12 + 0.1, function()
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 1
                        ~ Argument Count: 0
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 46
                        ~ Registers Used: R0-R1
                        ~ Type Information: Unavailable
                ]]
				v19:Disconnect()
			end)
			return
		end
		local v14 = v10.GetStatusEffect(v17, "WarpDashStacks")
		if 0 >= v14.Value then
			if not table.find(v47, "Agile") then
				local v14 = v10.GetStatusEffect(v17, "HasteStacks")
				if 0 < v14.Value then
				end
			end
			v11 += 15
			v13 = "TPDash"
		else
			v13 = "WDash"
			v11 += 30
		end
		if v0 then
			v13 = "M1Dash"
			v11 *= 0.8
			v17:SetAttribute("DisableM1", true)
			task.delay(v12, function()
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 1
                        ~ Argument Count: 0
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 44
                        ~ Registers Used: R0-R3
                        ~ Type Information: Unavailable
                ]]
				v17:SetAttribute("DisableM1", nil)
			end)
		end
		if table.find(v47, "CloseCallWind") then
			if v17.Humanoid.Health <= v17.Humanoid.MaxHealth / 4 then
				v11 += 15
			end
		end
		local v14 = Instance.new("BodyVelocity", HumanoidRootPart)
		v14.Name = "DashVelocity"
		v14.MaxForce = Vector3.new(30000, 0, 30000)
		v14.Velocity = v5 * v11
		v10.Debris(v14, v12)
		v15 = nil
		if not v0 then
			local v16 = Instance.new("BodyGyro")
			v15 = v16
			v15.MaxTorque = Vector3.new(0, 1e+05, 0)
			v15.D = 200
			v15.P = 6000
			v15.Name = "DashThing"
			v15.CFrame = workspace.CurrentCamera.CFrame
			v15.Parent = HumanoidRootPart
			v10.Debris(v15, v12)
		end
		if v13 ~= "M1Dash" then
			if v13 ~= "Air" then
				if table.find(v47, "ChainDashes") then
					v11 *= 0.75
					v12 *= 0.75
				end
			end
		end
		local v16 = Instance.new("Folder")
		v16.Name = "DashDisabled"
		v16.Parent = v17
		v10.Debris(v16, v12 + 0.2)
		v17_47 = v32
		if v2 == false then
			if 0.5 < v9 then
				v17_47 = v31
				v14.MaxForce = Vector3.new(30000, 30000, 30000)
			end
			if v0 then
				local v18 = tick()
				v19 = nil
				local v25_RunService: RunService = game:GetService("RunService")
				local v20_47 = RunService.RenderStepped:Connect(function(arg0: number)
					--[[ 
                        Fission ~~ Function Information:
                            ~ Upvalue Count: 10
                            ~ Argument Count: 1
                            ~ Debug Name: anon/no name
                            ~ Bytecode ID: 45
                            ~ Registers Used: R0-R8
                            ~ Type Information: Unavailable
                    ]]
					-- Fission: INFO: local 'v5_45' has been suffixed to avoid shadowing an existing, upper scope variable.
					v11 = v11 - arg0 * 60
					if v13 == "Air" then
						local v1 = workspace.CurrentCamera.CFrame.LookVector
						local v2 = Vector3.new(v1.X, math.clamp(v1.Y, -0.2, 0.2), v1.Z)
						v5 = v2
					elseif Humanoid.MoveDirection.Magnitude ~= 0 then
						if tick() <= v18 + 0.4 then
							v5 = Humanoid.MoveDirection
						end
					end
					local v3 = RaycastParams.new()
					local v5_45 = workspace.Map
					v3.FilterDescendantsInstances = { v5_45, workspace.NPCS }
					v3.FilterType = Enum.RaycastFilterType.Include
					if workspace:Raycast(Humanoid.RootPart.Position, v5.Unit * 2, v3) then
						v19:Disconnect()
						v14:Destroy()
						v17_47:Stop(0)
						return
					end
					v14.Velocity = v5 * v11
					if v0 then
						return
					end
					v15.CFrame = workspace.CurrentCamera.CFrame
					return
				end)
				v19 = v20_47
				v6.Dash:FireServer(v13)
				task.delay(v12 + 0.1, function()
					--[[ 
                        Fission ~~ Function Information:
                            ~ Upvalue Count: 1
                            ~ Argument Count: 0
                            ~ Debug Name: anon/no name
                            ~ Bytecode ID: 46
                            ~ Registers Used: R0-R1
                            ~ Type Information: Unavailable
                    ]]
					v19:Disconnect()
				end)
				return
			end
			v17_47.Priority = Enum.AnimationPriority.Action2
			v17_47:Play()
			local v18 = tick()
			v19 = nil
			local RunService: RunService = game:GetService("RunService")
			local v20_47 = RunService.RenderStepped:Connect(function(arg0: number)
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 10
                        ~ Argument Count: 1
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 45
                        ~ Registers Used: R0-R8
                        ~ Type Information: Unavailable
                ]]
				-- Fission: INFO: local 'v5_45' has been suffixed to avoid shadowing an existing, upper scope variable.
				v11 = v11 - arg0 * 60
				if v13 == "Air" then
					local v1 = workspace.CurrentCamera.CFrame.LookVector
					local v2 = Vector3.new(v1.X, math.clamp(v1.Y, -0.2, 0.2), v1.Z)
					v5 = v2
				elseif Humanoid.MoveDirection.Magnitude ~= 0 then
					if tick() <= v18 + 0.4 then
						v5 = Humanoid.MoveDirection
					end
				end
				local v3 = RaycastParams.new()
				local v5_45 = workspace.Map
				v3.FilterDescendantsInstances = { v5_45, workspace.NPCS }
				v3.FilterType = Enum.RaycastFilterType.Include
				if workspace:Raycast(Humanoid.RootPart.Position, v5.Unit * 2, v3) then
					v19:Disconnect()
					v14:Destroy()
					v17_47:Stop(0)
					return
				end
				v14.Velocity = v5 * v11
				if v0 then
					return
				end
				v15.CFrame = workspace.CurrentCamera.CFrame
				return
			end)
			v19 = v20_47
			v6.Dash:FireServer(v13)
			task.delay(v12 + 0.1, function()
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 1
                        ~ Argument Count: 0
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 46
                        ~ Registers Used: R0-R1
                        ~ Type Information: Unavailable
                ]]
				v19:Disconnect()
			end)
			return
		end
		if 0.5 >= v9 then
			if v9 >= -0.5 then
				if 0.5 >= v10_47 then
					if v10_47 < -0.5 then
						v17_47 = v34
					end
				else
					v17_47 = v35
				end
			else
				v17_47 = v33
			end
		else
			v17_47 = v32
		end
		if v0 then
			local v18 = tick()
			v19 = nil
			local v26_RunService: RunService = game:GetService("RunService")
			local v20_47 = RunService.RenderStepped:Connect(function(arg0: number)
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 10
                        ~ Argument Count: 1
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 45
                        ~ Registers Used: R0-R8
                        ~ Type Information: Unavailable
                ]]
				-- Fission: INFO: local 'v5_45' has been suffixed to avoid shadowing an existing, upper scope variable.
				v11 = v11 - arg0 * 60
				if v13 == "Air" then
					local v1 = workspace.CurrentCamera.CFrame.LookVector
					local v2 = Vector3.new(v1.X, math.clamp(v1.Y, -0.2, 0.2), v1.Z)
					v5 = v2
				elseif Humanoid.MoveDirection.Magnitude ~= 0 then
					if tick() <= v18 + 0.4 then
						v5 = Humanoid.MoveDirection
					end
				end
				local v3 = RaycastParams.new()
				local v5_45 = workspace.Map
				v3.FilterDescendantsInstances = { v5_45, workspace.NPCS }
				v3.FilterType = Enum.RaycastFilterType.Include
				if workspace:Raycast(Humanoid.RootPart.Position, v5.Unit * 2, v3) then
					v19:Disconnect()
					v14:Destroy()
					v17_47:Stop(0)
					return
				end
				v14.Velocity = v5 * v11
				if v0 then
					return
				end
				v15.CFrame = workspace.CurrentCamera.CFrame
				return
			end)
			v19 = v20_47
			v6.Dash:FireServer(v13)
			task.delay(v12 + 0.1, function()
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 1
                        ~ Argument Count: 0
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 46
                        ~ Registers Used: R0-R1
                        ~ Type Information: Unavailable
                ]]
				v19:Disconnect()
			end)
			return
		end
		v17_47.Priority = Enum.AnimationPriority.Action2
		v17_47:Play()
		local v18 = tick()
		v19 = nil
		local RunService: RunService = game:GetService("RunService")
		local v20_47 = RunService.RenderStepped:Connect(function(arg0: number)
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 10
                    ~ Argument Count: 1
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 45
                    ~ Registers Used: R0-R8
                    ~ Type Information: Unavailable
            ]]
			-- Fission: INFO: local 'v5_45' has been suffixed to avoid shadowing an existing, upper scope variable.
			v11 = v11 - arg0 * 60
			if v13 == "Air" then
				local v1 = workspace.CurrentCamera.CFrame.LookVector
				local v2 = Vector3.new(v1.X, math.clamp(v1.Y, -0.2, 0.2), v1.Z)
				v5 = v2
			elseif Humanoid.MoveDirection.Magnitude ~= 0 then
				if tick() <= v18 + 0.4 then
					v5 = Humanoid.MoveDirection
				end
			end
			local v3 = RaycastParams.new()
			local v5_45 = workspace.Map
			v3.FilterDescendantsInstances = { v5_45, workspace.NPCS }
			v3.FilterType = Enum.RaycastFilterType.Include
			if workspace:Raycast(Humanoid.RootPart.Position, v5.Unit * 2, v3) then
				v19:Disconnect()
				v14:Destroy()
				v17_47:Stop(0)
				return
			end
			v14.Velocity = v5 * v11
			if v0 then
				return
			end
			v15.CFrame = workspace.CurrentCamera.CFrame
			return
		end)
		v19 = v20_47
		v6.Dash:FireServer(v13)
		task.delay(v12 + 0.1, function()
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 1
                    ~ Argument Count: 0
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 46
                    ~ Registers Used: R0-R1
                    ~ Type Information: Unavailable
            ]]
			v19:Disconnect()
		end)
		return
	end
	v12 = 0.6
	v13 = "Ground"
	if not v2 then
		if 0.5 < v9 then
			v13 = "Air"
			v12 /= 1.5
		end
		if v0 then
			v13 = "M1Dash"
			v11 *= 0.8
			v17:SetAttribute("DisableM1", true)
			task.delay(v12, function()
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 1
                        ~ Argument Count: 0
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 44
                        ~ Registers Used: R0-R3
                        ~ Type Information: Unavailable
                ]]
				v17:SetAttribute("DisableM1", nil)
			end)
		end
		if table.find(v47, "CloseCallWind") then
			if v17.Humanoid.Health <= v17.Humanoid.MaxHealth / 4 then
				v11 += 15
			end
		end
		local v14 = Instance.new("BodyVelocity", HumanoidRootPart)
		v14.Name = "DashVelocity"
		v14.MaxForce = Vector3.new(30000, 0, 30000)
		v14.Velocity = v5 * v11
		v10.Debris(v14, v12)
		v15 = nil
		if not v0 then
			local v16 = Instance.new("BodyGyro")
			v15 = v16
			v15.MaxTorque = Vector3.new(0, 1e+05, 0)
			v15.D = 200
			v15.P = 6000
			v15.Name = "DashThing"
			v15.CFrame = workspace.CurrentCamera.CFrame
			v15.Parent = HumanoidRootPart
			v10.Debris(v15, v12)
		end
		if v13 ~= "M1Dash" then
			if v13 ~= "Air" then
				if table.find(v47, "ChainDashes") then
					v11 *= 0.75
					v12 *= 0.75
				end
			end
		end
		local v16 = Instance.new("Folder")
		v16.Name = "DashDisabled"
		v16.Parent = v17
		v10.Debris(v16, v12 + 0.2)
		v17_47 = v32
		if v2 == false then
			if 0.5 < v9 then
				v17_47 = v31
				v14.MaxForce = Vector3.new(30000, 30000, 30000)
			end
			if v0 then
				local v18 = tick()
				v19 = nil
				local v27_RunService: RunService = game:GetService("RunService")
				local v20_47 = RunService.RenderStepped:Connect(function(arg0: number)
					--[[ 
                        Fission ~~ Function Information:
                            ~ Upvalue Count: 10
                            ~ Argument Count: 1
                            ~ Debug Name: anon/no name
                            ~ Bytecode ID: 45
                            ~ Registers Used: R0-R8
                            ~ Type Information: Unavailable
                    ]]
					-- Fission: INFO: local 'v5_45' has been suffixed to avoid shadowing an existing, upper scope variable.
					v11 = v11 - arg0 * 60
					if v13 == "Air" then
						local v1 = workspace.CurrentCamera.CFrame.LookVector
						local v2 = Vector3.new(v1.X, math.clamp(v1.Y, -0.2, 0.2), v1.Z)
						v5 = v2
					elseif Humanoid.MoveDirection.Magnitude ~= 0 then
						if tick() <= v18 + 0.4 then
							v5 = Humanoid.MoveDirection
						end
					end
					local v3 = RaycastParams.new()
					local v5_45 = workspace.Map
					v3.FilterDescendantsInstances = { v5_45, workspace.NPCS }
					v3.FilterType = Enum.RaycastFilterType.Include
					if workspace:Raycast(Humanoid.RootPart.Position, v5.Unit * 2, v3) then
						v19:Disconnect()
						v14:Destroy()
						v17_47:Stop(0)
						return
					end
					v14.Velocity = v5 * v11
					if v0 then
						return
					end
					v15.CFrame = workspace.CurrentCamera.CFrame
					return
				end)
				v19 = v20_47
				v6.Dash:FireServer(v13)
				task.delay(v12 + 0.1, function()
					--[[ 
                        Fission ~~ Function Information:
                            ~ Upvalue Count: 1
                            ~ Argument Count: 0
                            ~ Debug Name: anon/no name
                            ~ Bytecode ID: 46
                            ~ Registers Used: R0-R1
                            ~ Type Information: Unavailable
                    ]]
					v19:Disconnect()
				end)
				return
			end
			v17_47.Priority = Enum.AnimationPriority.Action2
			v17_47:Play()
			local v18 = tick()
			v19 = nil
			local RunService: RunService = game:GetService("RunService")
			local v20_47 = RunService.RenderStepped:Connect(function(arg0: number)
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 10
                        ~ Argument Count: 1
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 45
                        ~ Registers Used: R0-R8
                        ~ Type Information: Unavailable
                ]]
				-- Fission: INFO: local 'v5_45' has been suffixed to avoid shadowing an existing, upper scope variable.
				v11 = v11 - arg0 * 60
				if v13 == "Air" then
					local v1 = workspace.CurrentCamera.CFrame.LookVector
					local v2 = Vector3.new(v1.X, math.clamp(v1.Y, -0.2, 0.2), v1.Z)
					v5 = v2
				elseif Humanoid.MoveDirection.Magnitude ~= 0 then
					if tick() <= v18 + 0.4 then
						v5 = Humanoid.MoveDirection
					end
				end
				local v3 = RaycastParams.new()
				local v5_45 = workspace.Map
				v3.FilterDescendantsInstances = { v5_45, workspace.NPCS }
				v3.FilterType = Enum.RaycastFilterType.Include
				if workspace:Raycast(Humanoid.RootPart.Position, v5.Unit * 2, v3) then
					v19:Disconnect()
					v14:Destroy()
					v17_47:Stop(0)
					return
				end
				v14.Velocity = v5 * v11
				if v0 then
					return
				end
				v15.CFrame = workspace.CurrentCamera.CFrame
				return
			end)
			v19 = v20_47
			v6.Dash:FireServer(v13)
			task.delay(v12 + 0.1, function()
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 1
                        ~ Argument Count: 0
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 46
                        ~ Registers Used: R0-R1
                        ~ Type Information: Unavailable
                ]]
				v19:Disconnect()
			end)
			return
		end
		if 0.5 >= v9 then
			if v9 >= -0.5 then
				if 0.5 >= v10_47 then
					if v10_47 < -0.5 then
						v17_47 = v34
					end
				else
					v17_47 = v35
				end
			else
				v17_47 = v33
			end
		else
			v17_47 = v32
		end
		if v0 then
			local v18 = tick()
			v19 = nil
			local v28_RunService: RunService = game:GetService("RunService")
			local v20_47 = RunService.RenderStepped:Connect(function(arg0: number)
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 10
                        ~ Argument Count: 1
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 45
                        ~ Registers Used: R0-R8
                        ~ Type Information: Unavailable
                ]]
				-- Fission: INFO: local 'v5_45' has been suffixed to avoid shadowing an existing, upper scope variable.
				v11 = v11 - arg0 * 60
				if v13 == "Air" then
					local v1 = workspace.CurrentCamera.CFrame.LookVector
					local v2 = Vector3.new(v1.X, math.clamp(v1.Y, -0.2, 0.2), v1.Z)
					v5 = v2
				elseif Humanoid.MoveDirection.Magnitude ~= 0 then
					if tick() <= v18 + 0.4 then
						v5 = Humanoid.MoveDirection
					end
				end
				local v3 = RaycastParams.new()
				local v5_45 = workspace.Map
				v3.FilterDescendantsInstances = { v5_45, workspace.NPCS }
				v3.FilterType = Enum.RaycastFilterType.Include
				if workspace:Raycast(Humanoid.RootPart.Position, v5.Unit * 2, v3) then
					v19:Disconnect()
					v14:Destroy()
					v17_47:Stop(0)
					return
				end
				v14.Velocity = v5 * v11
				if v0 then
					return
				end
				v15.CFrame = workspace.CurrentCamera.CFrame
				return
			end)
			v19 = v20_47
			v6.Dash:FireServer(v13)
			task.delay(v12 + 0.1, function()
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 1
                        ~ Argument Count: 0
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 46
                        ~ Registers Used: R0-R1
                        ~ Type Information: Unavailable
                ]]
				v19:Disconnect()
			end)
			return
		end
		v17_47.Priority = Enum.AnimationPriority.Action2
		v17_47:Play()
		local v18 = tick()
		v19 = nil
		local RunService: RunService = game:GetService("RunService")
		local v20_47 = RunService.RenderStepped:Connect(function(arg0: number)
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 10
                    ~ Argument Count: 1
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 45
                    ~ Registers Used: R0-R8
                    ~ Type Information: Unavailable
            ]]
			-- Fission: INFO: local 'v5_45' has been suffixed to avoid shadowing an existing, upper scope variable.
			v11 = v11 - arg0 * 60
			if v13 == "Air" then
				local v1 = workspace.CurrentCamera.CFrame.LookVector
				local v2 = Vector3.new(v1.X, math.clamp(v1.Y, -0.2, 0.2), v1.Z)
				v5 = v2
			elseif Humanoid.MoveDirection.Magnitude ~= 0 then
				if tick() <= v18 + 0.4 then
					v5 = Humanoid.MoveDirection
				end
			end
			local v3 = RaycastParams.new()
			local v5_45 = workspace.Map
			v3.FilterDescendantsInstances = { v5_45, workspace.NPCS }
			v3.FilterType = Enum.RaycastFilterType.Include
			if workspace:Raycast(Humanoid.RootPart.Position, v5.Unit * 2, v3) then
				v19:Disconnect()
				v14:Destroy()
				v17_47:Stop(0)
				return
			end
			v14.Velocity = v5 * v11
			if v0 then
				return
			end
			v15.CFrame = workspace.CurrentCamera.CFrame
			return
		end)
		v19 = v20_47
		v6.Dash:FireServer(v13)
		task.delay(v12 + 0.1, function()
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 1
                    ~ Argument Count: 0
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 46
                    ~ Registers Used: R0-R1
                    ~ Type Information: Unavailable
            ]]
			v19:Disconnect()
		end)
		return
	end
	local v14 = v10.GetStatusEffect(v17, "WarpDashStacks")
	if 0 >= v14.Value then
		if not table.find(v47, "Agile") then
			local v14 = v10.GetStatusEffect(v17, "HasteStacks")
			if 0 < v14.Value then
			end
		end
		v11 += 15
		v13 = "TPDash"
	else
		v13 = "WDash"
		v11 += 30
	end
	if v0 then
		v13 = "M1Dash"
		v11 *= 0.8
		v17:SetAttribute("DisableM1", true)
		task.delay(v12, function()
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 1
                    ~ Argument Count: 0
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 44
                    ~ Registers Used: R0-R3
                    ~ Type Information: Unavailable
            ]]
			v17:SetAttribute("DisableM1", nil)
		end)
	end
	if table.find(v47, "CloseCallWind") then
		if v17.Humanoid.Health <= v17.Humanoid.MaxHealth / 4 then
			v11 += 15
		end
	end
	local v14 = Instance.new("BodyVelocity", HumanoidRootPart)
	v14.Name = "DashVelocity"
	v14.MaxForce = Vector3.new(30000, 0, 30000)
	v14.Velocity = v5 * v11
	v10.Debris(v14, v12)
	v15 = nil
	if not v0 then
		local v16 = Instance.new("BodyGyro")
		v15 = v16
		v15.MaxTorque = Vector3.new(0, 1e+05, 0)
		v15.D = 200
		v15.P = 6000
		v15.Name = "DashThing"
		v15.CFrame = workspace.CurrentCamera.CFrame
		v15.Parent = HumanoidRootPart
		v10.Debris(v15, v12)
	end
	if v13 ~= "M1Dash" then
		if v13 ~= "Air" then
			if table.find(v47, "ChainDashes") then
				v11 *= 0.75
				v12 *= 0.75
			end
		end
	end
	local v16 = Instance.new("Folder")
	v16.Name = "DashDisabled"
	v16.Parent = v17
	v10.Debris(v16, v12 + 0.2)
	v17_47 = v32
	if v2 == false then
		if 0.5 < v9 then
			v17_47 = v31
			v14.MaxForce = Vector3.new(30000, 30000, 30000)
		end
		if v0 then
			local v18 = tick()
			v19 = nil
			local v29_RunService: RunService = game:GetService("RunService")
			local v20_47 = RunService.RenderStepped:Connect(function(arg0: number)
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 10
                        ~ Argument Count: 1
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 45
                        ~ Registers Used: R0-R8
                        ~ Type Information: Unavailable
                ]]
				-- Fission: INFO: local 'v5_45' has been suffixed to avoid shadowing an existing, upper scope variable.
				v11 = v11 - arg0 * 60
				if v13 == "Air" then
					local v1 = workspace.CurrentCamera.CFrame.LookVector
					local v2 = Vector3.new(v1.X, math.clamp(v1.Y, -0.2, 0.2), v1.Z)
					v5 = v2
				elseif Humanoid.MoveDirection.Magnitude ~= 0 then
					if tick() <= v18 + 0.4 then
						v5 = Humanoid.MoveDirection
					end
				end
				local v3 = RaycastParams.new()
				local v5_45 = workspace.Map
				v3.FilterDescendantsInstances = { v5_45, workspace.NPCS }
				v3.FilterType = Enum.RaycastFilterType.Include
				if workspace:Raycast(Humanoid.RootPart.Position, v5.Unit * 2, v3) then
					v19:Disconnect()
					v14:Destroy()
					v17_47:Stop(0)
					return
				end
				v14.Velocity = v5 * v11
				if v0 then
					return
				end
				v15.CFrame = workspace.CurrentCamera.CFrame
				return
			end)
			v19 = v20_47
			v6.Dash:FireServer(v13)
			task.delay(v12 + 0.1, function()
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 1
                        ~ Argument Count: 0
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 46
                        ~ Registers Used: R0-R1
                        ~ Type Information: Unavailable
                ]]
				v19:Disconnect()
			end)
			return
		end
		v17_47.Priority = Enum.AnimationPriority.Action2
		v17_47:Play()
		local v18 = tick()
		v19 = nil
		local RunService: RunService = game:GetService("RunService")
		local v20_47 = RunService.RenderStepped:Connect(function(arg0: number)
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 10
                    ~ Argument Count: 1
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 45
                    ~ Registers Used: R0-R8
                    ~ Type Information: Unavailable
            ]]
			-- Fission: INFO: local 'v5_45' has been suffixed to avoid shadowing an existing, upper scope variable.
			v11 = v11 - arg0 * 60
			if v13 == "Air" then
				local v1 = workspace.CurrentCamera.CFrame.LookVector
				local v2 = Vector3.new(v1.X, math.clamp(v1.Y, -0.2, 0.2), v1.Z)
				v5 = v2
			elseif Humanoid.MoveDirection.Magnitude ~= 0 then
				if tick() <= v18 + 0.4 then
					v5 = Humanoid.MoveDirection
				end
			end
			local v3 = RaycastParams.new()
			local v5_45 = workspace.Map
			v3.FilterDescendantsInstances = { v5_45, workspace.NPCS }
			v3.FilterType = Enum.RaycastFilterType.Include
			if workspace:Raycast(Humanoid.RootPart.Position, v5.Unit * 2, v3) then
				v19:Disconnect()
				v14:Destroy()
				v17_47:Stop(0)
				return
			end
			v14.Velocity = v5 * v11
			if v0 then
				return
			end
			v15.CFrame = workspace.CurrentCamera.CFrame
			return
		end)
		v19 = v20_47
		v6.Dash:FireServer(v13)
		task.delay(v12 + 0.1, function()
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 1
                    ~ Argument Count: 0
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 46
                    ~ Registers Used: R0-R1
                    ~ Type Information: Unavailable
            ]]
			v19:Disconnect()
		end)
		return
	end
	if 0.5 >= v9 then
		if v9 >= -0.5 then
			if 0.5 >= v10_47 then
				if v10_47 < -0.5 then
					v17_47 = v34
				end
			else
				v17_47 = v35
			end
		else
			v17_47 = v33
		end
	else
		v17_47 = v32
	end
	if v0 then
		local v18 = tick()
		v19 = nil
		local v30_RunService: RunService = game:GetService("RunService")
		local v20_47 = RunService.RenderStepped:Connect(function(arg0: number)
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 10
                    ~ Argument Count: 1
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 45
                    ~ Registers Used: R0-R8
                    ~ Type Information: Unavailable
            ]]
			-- Fission: INFO: local 'v5_45' has been suffixed to avoid shadowing an existing, upper scope variable.
			v11 = v11 - arg0 * 60
			if v13 == "Air" then
				local v1 = workspace.CurrentCamera.CFrame.LookVector
				local v2 = Vector3.new(v1.X, math.clamp(v1.Y, -0.2, 0.2), v1.Z)
				v5 = v2
			elseif Humanoid.MoveDirection.Magnitude ~= 0 then
				if tick() <= v18 + 0.4 then
					v5 = Humanoid.MoveDirection
				end
			end
			local v3 = RaycastParams.new()
			local v5_45 = workspace.Map
			v3.FilterDescendantsInstances = { v5_45, workspace.NPCS }
			v3.FilterType = Enum.RaycastFilterType.Include
			if workspace:Raycast(Humanoid.RootPart.Position, v5.Unit * 2, v3) then
				v19:Disconnect()
				v14:Destroy()
				v17_47:Stop(0)
				return
			end
			v14.Velocity = v5 * v11
			if v0 then
				return
			end
			v15.CFrame = workspace.CurrentCamera.CFrame
			return
		end)
		v19 = v20_47
		v6.Dash:FireServer(v13)
		task.delay(v12 + 0.1, function()
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 1
                    ~ Argument Count: 0
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 46
                    ~ Registers Used: R0-R1
                    ~ Type Information: Unavailable
            ]]
			v19:Disconnect()
		end)
		return
	end
	v17_47.Priority = Enum.AnimationPriority.Action2
	v17_47:Play()
	local v18 = tick()
	v19 = nil
	local RunService: RunService = game:GetService("RunService")
	local v20_47 = RunService.RenderStepped:Connect(function(arg0: number)
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 10
                ~ Argument Count: 1
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 45
                ~ Registers Used: R0-R8
                ~ Type Information: Unavailable
        ]]
		-- Fission: INFO: local 'v5_45' has been suffixed to avoid shadowing an existing, upper scope variable.
		v11 = v11 - arg0 * 60
		if v13 == "Air" then
			local v1 = workspace.CurrentCamera.CFrame.LookVector
			local v2 = Vector3.new(v1.X, math.clamp(v1.Y, -0.2, 0.2), v1.Z)
			v5 = v2
		elseif Humanoid.MoveDirection.Magnitude ~= 0 then
			if tick() <= v18 + 0.4 then
				v5 = Humanoid.MoveDirection
			end
		end
		local v3 = RaycastParams.new()
		local v5_45 = workspace.Map
		v3.FilterDescendantsInstances = { v5_45, workspace.NPCS }
		v3.FilterType = Enum.RaycastFilterType.Include
		if workspace:Raycast(Humanoid.RootPart.Position, v5.Unit * 2, v3) then
			v19:Disconnect()
			v14:Destroy()
			v17_47:Stop(0)
			return
		end
		v14.Velocity = v5 * v11
		if v0 then
			return
		end
		v15.CFrame = workspace.CurrentCamera.CFrame
		return
	end)
	v19 = v20_47
	v6.Dash:FireServer(v13)
	task.delay(v12 + 0.1, function()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 1
                ~ Argument Count: 0
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 46
                ~ Registers Used: R0-R1
                ~ Type Information: Unavailable
        ]]
		v19:Disconnect()
	end)
	return
end
local function DiveAttack()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 10
            ~ Argument Count: 0
            ~ Debug Name: DiveAttack
            ~ Bytecode ID: 52
            ~ Registers Used: R0-R15
            ~ Type Information: Available
    ]]
	-- Fission: INFO: local 'v10_52' has been suffixed to avoid shadowing an existing, upper scope variable.
	-- Fission: INFO: local 'v6_52' has been suffixed to avoid shadowing an existing, upper scope variable.
	local v0 = Instance.new("Folder")
	v0.Name = "LightAttack"
	v0.Parent = v17
	v10.Debris(v0, 4)
	v17:SetAttribute("IsSwinging", true)
	v6.FallDamage:FireServer(false, HumanoidRootPart.AssemblyLinearVelocity.Y * -2)
	task.spawn(function()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 1
                ~ Argument Count: 0
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 48
                ~ Registers Used: R0-R2
                ~ Type Information: Unavailable
        ]]
		_G.HandleCD("Dive Attack", 25)
		v69 = true
		task.wait(25)
		v69 = false
	end)
	v41:Play()
	v41:AdjustSpeed(1.3)
	v6.DiveBoost:FireServer()
	local v2 = Instance.new("BodyVelocity")
	v2.MaxForce = Vector3.new(0, 25000, 0)
	v2.Parent = HumanoidRootPart
	v10.Debris(v2, 3)
	local v3: number = 40
	task.spawn(function()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 3
                ~ Argument Count: 0
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 49
                ~ Registers Used: R0-R6
                ~ Type Information: Available
        ]]
		while v2 ~= nil do
			if 0 >= v3 then
				break
			end
			task.wait(0.05)
			v2.Velocity = HumanoidRootPart.CFrame.LookVector * -3 + Vector3.new(0, v3, 0)
			v3 = v3 - 15
		end
		v2.Velocity = HumanoidRootPart.CFrame.LookVector * 0
		return
	end)
	task.wait(0.45)
	local v4 = Instance.new("Folder", v17)
	v4.Name = "UsingMove"
	v10.Debris(v4, 0.35)
	v2:Destroy()
	v39:Play()
	local v5 = Instance.new("BodyVelocity")
	v5.MaxForce = Vector3.new(25000, 25000, 25000)
	v5.Parent = HumanoidRootPart
	v5.Velocity = HumanoidRootPart.CFrame.LookVector * 80 + Vector3.new(0, -105, 0)
	v10.Debris(v5, 0.8)
	local v6_52 = RaycastParams.new()
	v6_52.FilterType = Enum.RaycastFilterType.Exclude
	v6_52.FilterDescendantsInstances = { v17 }
	local v7: boolean = false
	while true do
		task.wait()
		local v9 = workspace:Raycast(HumanoidRootPart.Position, Vector3.new(0, -5, 0), v6_52)
		if not v9 then
			break
		end
		if v7 == true then
			v6.AttackWarning:FireServer()
			v6.AttackWarning:FireServer("DiveAttack")
			v39:Stop()
			v6.DiveAttack:FireServer()
			v40:Play()
			task.delay(3, function()
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 1
                        ~ Argument Count: 0
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 50
                        ~ Registers Used: R0-R1
                        ~ Type Information: Unavailable
                ]]
				v40:Stop()
			end)
			Humanoid.MaxSlopeAngle = 20
			v5:Destroy()
			local v8 = Instance.new("Folder", v17)
			v8.Name = "IsSliding"
			v9 = 90
			local v10_52 = Instance.new("BodyVelocity", HumanoidRootPart)
			v10_52.MaxForce = Vector3.new(25000, 0, 25000)
			v10_52.Velocity = HumanoidRootPart.CFrame.LookVector * v9
			local v11: nil = nil
			local v31_RunService: RunService = game:GetService("RunService")
			local v12 = RunService.Heartbeat:Connect(function(arg0: number)
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 6
                        ~ Argument Count: 1
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 51
                        ~ Registers Used: R0-R4
                        ~ Type Information: Unavailable
                ]]
				if 0 >= v9 then
					v11:Disconnect()
					if v10_52 ~= nil then
						v10_52:Destroy()
					end
					if v0 then
						v0:Destroy()
					end
					v9 = 0
					v40:Stop(0.5)
					v10_52.Velocity = HumanoidRootPart.CFrame.LookVector * v9
				else
					v9 = v9 - arg0 * 115
					v10_52.Velocity = HumanoidRootPart.CFrame.LookVector * v9
				end
				v10_52.Velocity = HumanoidRootPart.CFrame.LookVector * v9
			end)
			v11 = v12
			v10.Debris(v10_52, 1.5)
			v10.Debris(v8, 1)
			task.wait(0.45)
			Humanoid.MaxSlopeAngle = 80
			v17:SetAttribute("IsSwinging", nil)
			return
		end
		if v60 == true then
			v6.AttackWarning:FireServer()
			v6.AttackWarning:FireServer("DiveAttack")
			v39:Stop()
			v6.DiveAttack:FireServer()
			v40:Play()
			task.delay(3, function()
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 1
                        ~ Argument Count: 0
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 50
                        ~ Registers Used: R0-R1
                        ~ Type Information: Unavailable
                ]]
				v40:Stop()
			end)
			Humanoid.MaxSlopeAngle = 20
			v5:Destroy()
			local v8 = Instance.new("Folder", v17)
			v8.Name = "IsSliding"
			v9 = 90
			local v10_52 = Instance.new("BodyVelocity", HumanoidRootPart)
			v10_52.MaxForce = Vector3.new(25000, 0, 25000)
			v10_52.Velocity = HumanoidRootPart.CFrame.LookVector * v9
			v11 = nil
			local v32_RunService: RunService = game:GetService("RunService")
			local v12 = RunService.Heartbeat:Connect(function(arg0: number)
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 6
                        ~ Argument Count: 1
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 51
                        ~ Registers Used: R0-R4
                        ~ Type Information: Unavailable
                ]]
				if 0 >= v9 then
					v11:Disconnect()
					if v10_52 ~= nil then
						v10_52:Destroy()
					end
					if v0 then
						v0:Destroy()
					end
					v9 = 0
					v40:Stop(0.5)
					v10_52.Velocity = HumanoidRootPart.CFrame.LookVector * v9
				else
					v9 = v9 - arg0 * 115
					v10_52.Velocity = HumanoidRootPart.CFrame.LookVector * v9
				end
				v10_52.Velocity = HumanoidRootPart.CFrame.LookVector * v9
			end)
			v11 = v12
			v10.Debris(v10_52, 1.5)
			v10.Debris(v8, 1)
			task.wait(0.45)
			Humanoid.MaxSlopeAngle = 80
			v17:SetAttribute("IsSwinging", nil)
			return
		end
		if v5.Parent ~= HumanoidRootPart then
			v6.AttackWarning:FireServer()
			v6.AttackWarning:FireServer("DiveAttack")
			v39:Stop()
			v6.DiveAttack:FireServer()
			v40:Play()
			task.delay(3, function()
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 1
                        ~ Argument Count: 0
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 50
                        ~ Registers Used: R0-R1
                        ~ Type Information: Unavailable
                ]]
				v40:Stop()
			end)
			Humanoid.MaxSlopeAngle = 20
			v5:Destroy()
			local v8 = Instance.new("Folder", v17)
			v8.Name = "IsSliding"
			v9 = 90
			local v10_52 = Instance.new("BodyVelocity", HumanoidRootPart)
			v10_52.MaxForce = Vector3.new(25000, 0, 25000)
			v10_52.Velocity = HumanoidRootPart.CFrame.LookVector * v9
			v11 = nil
			local v33_RunService: RunService = game:GetService("RunService")
			local v12 = RunService.Heartbeat:Connect(function(arg0: number)
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 6
                        ~ Argument Count: 1
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 51
                        ~ Registers Used: R0-R4
                        ~ Type Information: Unavailable
                ]]
				if 0 >= v9 then
					v11:Disconnect()
					if v10_52 ~= nil then
						v10_52:Destroy()
					end
					if v0 then
						v0:Destroy()
					end
					v9 = 0
					v40:Stop(0.5)
					v10_52.Velocity = HumanoidRootPart.CFrame.LookVector * v9
				else
					v9 = v9 - arg0 * 115
					v10_52.Velocity = HumanoidRootPart.CFrame.LookVector * v9
				end
				v10_52.Velocity = HumanoidRootPart.CFrame.LookVector * v9
			end)
			v11 = v12
			v10.Debris(v10_52, 1.5)
			v10.Debris(v8, 1)
			task.wait(0.45)
			Humanoid.MaxSlopeAngle = 80
			v17:SetAttribute("IsSwinging", nil)
			return
		end
	end
	if v9.Instance then
		v7 = true
	end
	if v7 == true then
		v6.AttackWarning:FireServer()
		v6.AttackWarning:FireServer("DiveAttack")
		v39:Stop()
		v6.DiveAttack:FireServer()
		v40:Play()
		task.delay(3, function()
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 1
                    ~ Argument Count: 0
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 50
                    ~ Registers Used: R0-R1
                    ~ Type Information: Unavailable
            ]]
			v40:Stop()
		end)
		Humanoid.MaxSlopeAngle = 20
		v5:Destroy()
		local v8 = Instance.new("Folder", v17)
		v8.Name = "IsSliding"
		v9 = 90
		local v10_52 = Instance.new("BodyVelocity", HumanoidRootPart)
		v10_52.MaxForce = Vector3.new(25000, 0, 25000)
		v10_52.Velocity = HumanoidRootPart.CFrame.LookVector * v9
		v11 = nil
		local v34_RunService: RunService = game:GetService("RunService")
		local v12 = RunService.Heartbeat:Connect(function(arg0: number)
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 6
                    ~ Argument Count: 1
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 51
                    ~ Registers Used: R0-R4
                    ~ Type Information: Unavailable
            ]]
			if 0 >= v9 then
				v11:Disconnect()
				if v10_52 ~= nil then
					v10_52:Destroy()
				end
				if v0 then
					v0:Destroy()
				end
				v9 = 0
				v40:Stop(0.5)
				v10_52.Velocity = HumanoidRootPart.CFrame.LookVector * v9
			else
				v9 = v9 - arg0 * 115
				v10_52.Velocity = HumanoidRootPart.CFrame.LookVector * v9
			end
			v10_52.Velocity = HumanoidRootPart.CFrame.LookVector * v9
		end)
		v11 = v12
		v10.Debris(v10_52, 1.5)
		v10.Debris(v8, 1)
		task.wait(0.45)
		Humanoid.MaxSlopeAngle = 80
		v17:SetAttribute("IsSwinging", nil)
		return
	end
	if v60 == true then
		v6.AttackWarning:FireServer()
		v6.AttackWarning:FireServer("DiveAttack")
		v39:Stop()
		v6.DiveAttack:FireServer()
		v40:Play()
		task.delay(3, function()
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 1
                    ~ Argument Count: 0
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 50
                    ~ Registers Used: R0-R1
                    ~ Type Information: Unavailable
            ]]
			v40:Stop()
		end)
		Humanoid.MaxSlopeAngle = 20
		v5:Destroy()
		local v8 = Instance.new("Folder", v17)
		v8.Name = "IsSliding"
		v9 = 90
		local v10_52 = Instance.new("BodyVelocity", HumanoidRootPart)
		v10_52.MaxForce = Vector3.new(25000, 0, 25000)
		v10_52.Velocity = HumanoidRootPart.CFrame.LookVector * v9
		v11 = nil
		local v35_RunService: RunService = game:GetService("RunService")
		local v12 = RunService.Heartbeat:Connect(function(arg0: number)
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 6
                    ~ Argument Count: 1
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 51
                    ~ Registers Used: R0-R4
                    ~ Type Information: Unavailable
            ]]
			if 0 >= v9 then
				v11:Disconnect()
				if v10_52 ~= nil then
					v10_52:Destroy()
				end
				if v0 then
					v0:Destroy()
				end
				v9 = 0
				v40:Stop(0.5)
				v10_52.Velocity = HumanoidRootPart.CFrame.LookVector * v9
			else
				v9 = v9 - arg0 * 115
				v10_52.Velocity = HumanoidRootPart.CFrame.LookVector * v9
			end
			v10_52.Velocity = HumanoidRootPart.CFrame.LookVector * v9
		end)
		v11 = v12
		v10.Debris(v10_52, 1.5)
		v10.Debris(v8, 1)
		task.wait(0.45)
		Humanoid.MaxSlopeAngle = 80
		v17:SetAttribute("IsSwinging", nil)
		return
	end
	if v5.Parent ~= HumanoidRootPart then
		v6.AttackWarning:FireServer()
		v6.AttackWarning:FireServer("DiveAttack")
		v39:Stop()
		v6.DiveAttack:FireServer()
		v40:Play()
		task.delay(3, function()
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 1
                    ~ Argument Count: 0
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 50
                    ~ Registers Used: R0-R1
                    ~ Type Information: Unavailable
            ]]
			v40:Stop()
		end)
		Humanoid.MaxSlopeAngle = 20
		v5:Destroy()
		local v8 = Instance.new("Folder", v17)
		v8.Name = "IsSliding"
		v9 = 90
		local v10_52 = Instance.new("BodyVelocity", HumanoidRootPart)
		v10_52.MaxForce = Vector3.new(25000, 0, 25000)
		v10_52.Velocity = HumanoidRootPart.CFrame.LookVector * v9
		v11 = nil
		local v36_RunService: RunService = game:GetService("RunService")
		local v12 = RunService.Heartbeat:Connect(function(arg0: number)
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 6
                    ~ Argument Count: 1
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 51
                    ~ Registers Used: R0-R4
                    ~ Type Information: Unavailable
            ]]
			if 0 >= v9 then
				v11:Disconnect()
				if v10_52 ~= nil then
					v10_52:Destroy()
				end
				if v0 then
					v0:Destroy()
				end
				v9 = 0
				v40:Stop(0.5)
				v10_52.Velocity = HumanoidRootPart.CFrame.LookVector * v9
			else
				v9 = v9 - arg0 * 115
				v10_52.Velocity = HumanoidRootPart.CFrame.LookVector * v9
			end
			v10_52.Velocity = HumanoidRootPart.CFrame.LookVector * v9
		end)
		v11 = v12
		v10.Debris(v10_52, 1.5)
		v10.Debris(v8, 1)
		task.wait(0.45)
		Humanoid.MaxSlopeAngle = 80
		v17:SetAttribute("IsSwinging", nil)
		return
	end
end
local function LightAttack()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 20
            ~ Argument Count: 0
            ~ Debug Name: LightAttack
            ~ Bytecode ID: 63
            ~ Registers Used: R0-R20
            ~ Type Information: Unavailable
    ]]
	-- Fission: INFO: local 'v10_63' has been suffixed to avoid shadowing an existing, upper scope variable.
	-- Fission: INFO: local 'v6_63' has been suffixed to avoid shadowing an existing, upper scope variable.
	-- Fission: INFO: local 'v17_63' has been suffixed to avoid shadowing an existing, upper scope variable.
	-- Fission: INFO: local 'v4_63' has been suffixed to avoid shadowing an existing, upper scope variable.
	-- Fission: INFO: local 'v15_63' has been suffixed to avoid shadowing an existing, upper scope variable.
	v6.SwingSound:FireServer(v21)
	v17:SetAttribute("IsSwinging", true)
	local v0: { string } = string.split(v15.Data.Injuries.Value, ",")
	local v1: boolean = false
	if table.find(v0, "MissingArm") then
		v1 = true
	end
	if not v22[v21]:FindFirstChild(("AttackAnimation" .. v48)) then
		v48 = 1
	end
	if v1 == true then
		if v48 ~= 4 then
			if v22[v21]["AttackAnimation" .. v48]:FindFirstChild("LeftHanded") then
				for i_4 = 1, #v90, 1 do
					v48 = v48 + 1
					if v22[v21]["AttackAnimation" .. v48]:FindFirstChild("LeftHanded") then
						if v48 ~= 4 then
						end
					end
				end
			end
		end
	end
	v88:Stop()
	v87:Stop()
	v89:Stop()
	v84:Stop()
	v84 = v90[v48]
	v17:SetAttribute("CurrentM1", v48)
	v2 = v48
	local v3 = v23
	local v4_63: Instance = v22:FindFirstChild(v21)
	v4_63 = v4_63.M1Delay.Value
	local v5: boolean = true
	local v6_63: boolean = false
	local v7: boolean = false
	local v8: boolean = false
	local v9: nil = nil
	local v10_63: nil = nil
	local v11: number = 0
	if v50 == true then
		v3 /= 1.1
		v4_63 *= 1.1
	end
	v84:Play()
	local v12 = Instance.new("Folder")
	v12.Name = "DashDisabled"
	v12.Parent = v17
	v10.Debris(v12, v4_63 * 1.15)
	v17:SetAttribute("FastAutoRotate", true)
	task.delay(0.025, function()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 1
                ~ Argument Count: 0
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 53
                ~ Registers Used: R0-R3
                ~ Type Information: Unavailable
        ]]
		v17:SetAttribute("FastAutoRotate", nil)
	end)
	v17:SetAttribute("CanM1Dash", true)
	local function anon_28146_54()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 12
                ~ Argument Count: 0
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 54
                ~ Registers Used: R0-R8
                ~ Type Information: Unavailable
        ]]
		if not table.find(v10.HeavyWeapons, v21) then
			if not table.find(v10.GetEGOGifts(v17), "Silver Watch Case") then
				return false
			end
		end
		if not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
			return false
		end
		if v5 ~= true then
			return false
		end
		if v6_63 then
			return true
		end
		if not v10_63 then
			return true
		end
		if 0.15 > tick() - v10_63 then
			return true
		end
		v6_63 = true
		local v0 = Instance.new("Folder")
		v0.Name = "LightAttack"
		v0.Parent = v17
		v10.Debris(v0, v4_63 * 1.5)
		local v1 = v4.Effects.ChargeM1SFX.Attachment:Clone()
		v1.Parent = HumanoidRootPart
		v10.Debris(v1, 2)
		v10.PlayFX(v1)
		local v2 = v4.HighlightBase:Clone()
		local v3 = Color3.fromRGB(255, 255, 255)
		v2.OutlineColor = v3
		local v3 = Color3.fromRGB(255, 255, 255)
		v2.FillColor = v3
		v2.OutlineTransparency = 0.6
		v2.FillTransparency = 0.8
		v2.DepthMode = Enum.HighlightDepthMode.Occluded
		if table.find(v10.GetEGOGifts(v17), "Silver Watch Case") then
			local v3 = Color3.fromRGB(255, 207, 111)
			v2.OutlineColor = v3
			local v3 = Color3.fromRGB(255, 230, 166)
			v2.FillColor = v3
			v6.ChargeM1Watch:FireServer()
		end
		v2.Parent = v17
		v10.Debris(v2, 0.45)
		TweenService
			:Create(v2, TweenInfo.new(0.45, Enum.EasingStyle.Linear), { OutlineTransparency = 1, FillTransparency = 1 })
			:Play()
		return true
	end
	task.spawn(function()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 11
                ~ Argument Count: 0
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 55
                ~ Registers Used: R0-R4
                ~ Type Information: Unavailable
        ]]
		local v0 = Instance.new("Folder")
		v0.Name = "SlowAutoRotate"
		v0.Parent = v17
		v10.Debris(v0, 10)
		while true do
			local SlowerSwing: Instance = v17:FindFirstChild("SlowerSwing")
			if SlowerSwing then
				break
			end
			v9 = v1
			if not v9 then
				if v10_63 then
					v11 = v11 + (tick() - v10_63)
					v10_63 = nil
				end
			else
				if not v10_63 then
					local v1 = tick()
					v10_63 = v1
				end
				v84:AdjustSpeed(v3 / 6)
			end
			task.wait()
			if not v10_63 then
				v10.Debris(v0, v4_63)
				v84:AdjustSpeed(v23)
				return
			end
			v11 = v11 + (tick() - v10_63)
			v10_63 = nil
			v10.Debris(v0, v4_63)
			v84:AdjustSpeed(v23)
			return
		end
		local v1 = anon_28146_54()
		v9 = v1
		if not v9 then
			if v10_63 then
				v11 = v11 + (tick() - v10_63)
				v10_63 = nil
			end
		else
			if not v10_63 then
				local v1 = tick()
				v10_63 = v1
			end
			v84:AdjustSpeed(v3 / 6)
		end
		task.wait()
		if not v10_63 then
			v10.Debris(v0, v4_63)
			v84:AdjustSpeed(v23)
			return
		end
		v11 = v11 + (tick() - v10_63)
		v10_63 = nil
		v10.Debris(v0, v4_63)
		v84:AdjustSpeed(v23)
		return
	end)
	local v17_63
	if not table.find(v10.GetEGOGifts(v17), "Silver Watch Case") then
		v17_63 = 1.5
	else
		v17_63 = 1.1
	end
	task.delay(v22[v21].TimeUntilHitbox.Value / v17_63, function()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 5
                ~ Argument Count: 0
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 56
                ~ Registers Used: R0-R3
                ~ Type Information: Unavailable
        ]]
		v5 = false
		v17:SetAttribute("CanM1Dash", nil)
		while true do
			task.wait()
			if not v9 then
				break
			end
			if v8 then
				break
			end
		end
		v6.AttackWarning:FireServer()
		return
	end)
	task.delay(2.5, function()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 2
                ~ Argument Count: 0
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 57
                ~ Registers Used: R0-R0
                ~ Type Information: Unavailable
        ]]
		v7 = true
		v8 = true
	end)
	local v18: number = v2
	if v22[v21]["AttackAnimation" .. v18]:FindFirstChild("StartupFX") then
		if v7 == true then
			return
		end
		v18 = v2
		if v22[v21]["AttackAnimation" .. v18]:FindFirstChild("StartupFX") then
			v6.StartupEffects:FireServer(v2)
		end
	end
	v84:GetMarkerReachedSignal("HitBox"):Connect(function()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 10
                ~ Argument Count: 0
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 59
                ~ Registers Used: R0-R6
                ~ Type Information: Unavailable
        ]]
		-- Fission: INFO: local 'v2_59' has been suffixed to avoid shadowing an existing, upper scope variable.
		v5 = false
		if v7 == true then
			return
		end
		if not v22[v21][("AttackAnimation" .. v2)]:FindFirstChild("SlashFX") then
			local v2_59 = v15:GetNetworkPing()
			task.delay(v2_59 / 2, function()
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 1
                        ~ Argument Count: 0
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 58
                        ~ Registers Used: R0-R0
                        ~ Type Information: Unavailable
                ]]
				v8 = true
			end)
			v10.ShakeScreen(v46, v15, 0.5, 0, 0, 0.1)
			return
		end
		v6.SlashEffects:FireServer(v2)
		local v2_59 = v15:GetNetworkPing()
		task.delay(v2_59 / 2, function()
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 1
                    ~ Argument Count: 0
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 58
                    ~ Registers Used: R0-R0
                    ~ Type Information: Unavailable
            ]]
			v8 = true
		end)
		v10.ShakeScreen(v46, v15, 0.5, 0, 0, 0.1)
		return
	end)
	v84:GetMarkerReachedSignal("RagdollHitbox"):Connect(function()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 10
                ~ Argument Count: 0
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 61
                ~ Registers Used: R0-R6
                ~ Type Information: Unavailable
        ]]
		-- Fission: INFO: local 'v2_61' has been suffixed to avoid shadowing an existing, upper scope variable.
		v5 = false
		if v7 == true then
			return
		end
		if not v22[v21][("AttackAnimation" .. v2)]:FindFirstChild("SlashFX") then
			local v2_61 = v15:GetNetworkPing()
			task.delay(v2_61 / 2, function()
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 1
                        ~ Argument Count: 0
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 60
                        ~ Registers Used: R0-R0
                        ~ Type Information: Unavailable
                ]]
				v8 = true
			end)
			v10.ShakeScreen(v46, v15, 1, 0.3, 0, 0.2)
			return
		end
		v6.SlashEffects:FireServer(v2)
		local v2_61 = v15:GetNetworkPing()
		task.delay(v2_61 / 2, function()
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 1
                    ~ Argument Count: 0
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 60
                    ~ Registers Used: R0-R0
                    ~ Type Information: Unavailable
            ]]
			v8 = true
		end)
		v10.ShakeScreen(v46, v15, 1, 0.3, 0, 0.2)
		return
	end)
	if 0 < v48 then
		task.delay(ReplicatedStorage.WeaponINFO[v21].M1Delay.Value * 4, function()
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 2
                    ~ Argument Count: 0
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 62
                    ~ Registers Used: R0-R1
                    ~ Type Information: Unavailable
            ]]
			if v2 + 1 ~= v48 then
				return
			end
			v48 = 1
			return
		end)
	end
	v48 = v48 + 1
	v6.BegunM1:FireServer(v21, v2)
	local v14: boolean = false
	if v22:FindFirstChild(v21):FindFirstChild("AttackAnimation" .. v48) then
		local v15_63 = Instance.new("Folder")
		v15_63.Name = "LightAttack"
		v15_63.Parent = v17
		v10.Debris(v15_63, v4_63 * 1.15)
		local v16 = Instance.new("Folder")
		v16.Name = "SlowAutoRotate"
		v16.Parent = v17
		v10.Debris(v16, v4_63 * 1.25)
		v6.LightAttack:FireServer(v4_63)
	else
		v48 = 1
		v14 = true
		local v15_63 = Instance.new("Folder")
		v15_63.Name = "LightAttack"
		v15_63.Parent = v17
		v10.Debris(v15_63, v4_63 * 1.25)
		local v16 = Instance.new("Folder")
		v16.Name = "SlowAutoRotate"
		v16.Parent = v17
		v10.Debris(v16, v4_63 * 1.35)
		v6.LightAttack:FireServer(v4_63 * 1.25)
	end
	if not v14 then
		v16 = v4_63
	else
		v16 = v4_63 * 2
	end
	task.wait(v16)
	if v6_63 then
		task.wait(v11)
	end
	while true do
		task.wait()
		if v9 then
			break
		end
		if _G.CheckForStun(v17) then
			v17:SetAttribute("IsSwinging", nil)
			v17:SetAttribute("CurrentM1", nil)
			return
		end
	end
	if v8 == true then
		v17:SetAttribute("IsSwinging", nil)
		v17:SetAttribute("CurrentM1", nil)
		return
	end
	if _G.CheckForStun(v17) then
		v17:SetAttribute("IsSwinging", nil)
		v17:SetAttribute("CurrentM1", nil)
		return
	end
end
local function ChargedAttackFunc()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 7
            ~ Argument Count: 0
            ~ Debug Name: ChargedAttackFunc
            ~ Bytecode ID: 68
            ~ Registers Used: R0-R6
            ~ Type Information: Unavailable
    ]]
	v6.ChargedAttackStart:FireServer()
	v49 = false
	v17:SetAttribute("IsSwinging", true)
	v17:SetAttribute("ChargedAttackCD", true)
	v80:Stop()
	v80:Play()
	local v0: boolean = true
	v10.ClearVelocity(v17)
	local v1 = Instance.new("Folder")
	v1.Name = "HeavyAttack"
	v1.Parent = v17
	v10.Debris(v1, 4)
	local v2 = Instance.new("Folder")
	v2.Name = "SlowAutoRotate"
	v2.Parent = v17
	v10.Debris(v2, 4)
	task.delay(0.05, function()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 1
                ~ Argument Count: 0
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 64
                ~ Registers Used: R0-R0
                ~ Type Information: Unavailable
        ]]
		v0 = false
	end)
	while true do
		task.wait()
		if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) ~= false then
			break
		end
		if 0.55 > v80.TimePosition then
			if _G.CheckForStun(v17) then
			end
		end
		_G.HandleCD("Charged Attack", 3)
		task.delay(3, function()
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 1
                    ~ Argument Count: 0
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 65
                    ~ Registers Used: R0-R3
                    ~ Type Information: Unavailable
            ]]
			print("Removed Charge CD")
			v17:SetAttribute("ChargedAttackCD", nil)
		end)
		if not _G.CheckForStun(v17) then
			v6.AttackWarning:FireServer()
			if v80.TimePosition >= 0.55 then
				v6.StopChargingAttack:FireServer(v80.TimePosition)
				local function anon_2997_67()
					--[[ 
                        Fission ~~ Function Information:
                            ~ Upvalue Count: 5
                            ~ Argument Count: 0
                            ~ Debug Name: anon/no name
                            ~ Bytecode ID: 67
                            ~ Registers Used: R0-R3
                            ~ Type Information: Unavailable
                    ]]
					v17:SetAttribute("IsSwinging", nil)
					v10.Debris(v2, 0.1)
					Humanoid.JumpPower = 47
					if v1 == nil then
						return
					end
					v1:Destroy()
					return
				end
				task.delay(v5, anon_2997_67)
				return
			end
			while true do
				task.wait()
				v80:AdjustSpeed(3)
				if _G.CheckForStun(v17) then
					break
				end
				if 0.55 <= v80.TimePosition then
					break
				end
			end
			v80:AdjustSpeed(1)
			task.delay(0.15, function()
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 1
                        ~ Argument Count: 0
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 66
                        ~ Registers Used: R0-R2
                        ~ Type Information: Unavailable
                ]]
				v6.AttackWarning:FireServer("ChargedAttack")
			end)
			v6.StopChargingAttack:FireServer(v80.TimePosition)
			anon_2997_67 = function()
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 5
                        ~ Argument Count: 0
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 67
                        ~ Registers Used: R0-R3
                        ~ Type Information: Unavailable
                ]]
				v17:SetAttribute("IsSwinging", nil)
				v10.Debris(v2, 0.1)
				Humanoid.JumpPower = 47
				if v1 == nil then
					return
				end
				v1:Destroy()
				return
			end
			task.delay(v5, anon_2997_67)
			return
		else
			v17:SetAttribute("IsSwinging", nil)
			v10.Debris(v2, 0.1)
			Humanoid.JumpPower = 47
			if v1 == nil then
				return
			end
			v1:Destroy()
			return
		end
	end
	if v0 ~= false then
		if 0.55 > v80.TimePosition then
			if _G.CheckForStun(v17) then
			end
		end
	end
	_G.HandleCD("Charged Attack", 3)
	task.delay(3, function()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 1
                ~ Argument Count: 0
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 65
                ~ Registers Used: R0-R3
                ~ Type Information: Unavailable
        ]]
		print("Removed Charge CD")
		v17:SetAttribute("ChargedAttackCD", nil)
	end)
	if not _G.CheckForStun(v17) then
		v6.AttackWarning:FireServer()
		if v80.TimePosition >= 0.55 then
			v6.StopChargingAttack:FireServer(v80.TimePosition)
			anon_2997_67 = function()
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 5
                        ~ Argument Count: 0
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 67
                        ~ Registers Used: R0-R3
                        ~ Type Information: Unavailable
                ]]
				v17:SetAttribute("IsSwinging", nil)
				v10.Debris(v2, 0.1)
				Humanoid.JumpPower = 47
				if v1 == nil then
					return
				end
				v1:Destroy()
				return
			end
			task.delay(v5, anon_2997_67)
			return
		end
		while true do
			task.wait()
			v80:AdjustSpeed(3)
			if _G.CheckForStun(v17) then
				break
			end
			if 0.55 <= v80.TimePosition then
				break
			end
		end
		v80:AdjustSpeed(1)
		task.delay(0.15, function()
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 1
                    ~ Argument Count: 0
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 66
                    ~ Registers Used: R0-R2
                    ~ Type Information: Unavailable
            ]]
			v6.AttackWarning:FireServer("ChargedAttack")
		end)
		v6.StopChargingAttack:FireServer(v80.TimePosition)
		anon_2997_67 = function()
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 5
                    ~ Argument Count: 0
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 67
                    ~ Registers Used: R0-R3
                    ~ Type Information: Unavailable
            ]]
			v17:SetAttribute("IsSwinging", nil)
			v10.Debris(v2, 0.1)
			Humanoid.JumpPower = 47
			if v1 == nil then
				return
			end
			v1:Destroy()
			return
		end
		task.delay(v5, anon_2997_67)
		return
	else
		v17:SetAttribute("IsSwinging", nil)
		v10.Debris(v2, 0.1)
		Humanoid.JumpPower = 47
		if v1 == nil then
			return
		end
		v1:Destroy()
		return
	end
end
local function WeaponLightAttack()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 16
            ~ Argument Count: 0
            ~ Debug Name: WeaponLightAttack
            ~ Bytecode ID: 69
            ~ Registers Used: R0-R10
            ~ Type Information: Unavailable
    ]]
	if v17:GetAttribute("DisableM1") then
		while true do
			task.wait()
			if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) == false then
				break
			end
			if not _G.CheckForStun(v17) then
				if not v17:FindFirstChild("UsingMove") then
					if not v17:GetAttribute("DisableM1") then
						break
					end
				end
			end
		end
		if v17:GetAttribute("DisableM1") then
			return
		end
		if _G.CheckForStun(v17) then
			return
		end
		if v17:FindFirstChild("UsingMove") then
			return
		end
		if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) == false then
			return
		end
	elseif v17:FindFirstChild("UsingMove") then
		if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
		end
	end
	if v17:FindFirstChildOfClass("Tool") then
		return
	end
	local Data: Instance = v15:WaitForChild("Data")
	if Data.Stamina.Value < v22[v21].Stamina.Value then
		return
	end
	if v61 == true then
		return
	end
	if v66 == false then
		return
	end
	if v17:GetAttribute("Dodging") then
		return
	end
	if _G.CheckForStun(v17) then
		return
	end
	if v17:GetAttribute("IsSwinging") then
		return
	end
	if v17:FindFirstChild("DisableM1") then
		return
	end
	v0 = false
	local v1 = RaycastParams.new()
	v1.FilterType = Enum.RaycastFilterType.Exclude
	v1.FilterDescendantsInstances = { v17 }
	local v2 = workspace:Raycast(HumanoidRootPart.Position, Vector3.new(0, -5, 0), v1)
	if v2 then
		if v2.Instance then
			print("M1 Floor Found")
			v0 = true
		end
	end
	local v3: boolean = false
	if not UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
		local v4 = UserInputService:IsKeyDown(Enum.KeyCode.LeftAlt)
		local v5 = not v0 and v49 and not v69
		local v6 = v0 and v49 and not v68
		local v7: boolean = not v5
		if v7 then
			v7 = not v6
			if v7 then
				v7 = true
				if v0 ~= true then
					local AirTime: Instance = v17:FindFirstChild("AirTime")
				end
			end
		end
		if v4 then
			v3 = true
			ChargedAttackFunc()
		elseif v7 then
			v3 = true
			LightAttack()
		elseif v6 then
			RunningAttack()
			v3 = true
		elseif v5 then
			if v17:FindFirstChild("AirTime") then
				return
			end
			v3 = true
			DiveAttack()
		end
		if not v3 then
			return
		end
		if not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
			return
		end
		v128()
		return
	end
	v4 = not v17:GetAttribute("ChargedAttackCD")
	v5 = not v0 and v49 and not v69
	v6 = v0 and v49 and not v68
	v7 = not v5
	if v7 then
		v7 = not v6
		if v7 then
			v7 = true
			if v0 ~= true then
				local v37_AirTime: Instance = v17:FindFirstChild("AirTime")
			end
		end
	end
	if v4 then
		v3 = true
		ChargedAttackFunc()
	elseif v7 then
		v3 = true
		LightAttack()
	elseif v6 then
		RunningAttack()
		v3 = true
	elseif v5 then
		if v17:FindFirstChild("AirTime") then
			return
		end
		v3 = true
		DiveAttack()
	end
	if not v3 then
		return
	end
	if not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
		return
	end
	v128()
	return
end
local function EquipWeapon()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 11
            ~ Argument Count: 0
            ~ Debug Name: EquipWeapon
            ~ Bytecode ID: 71
            ~ Registers Used: R0-R4
            ~ Type Information: Unavailable
    ]]
	if v17:GetAttribute("EquipCD") then
		return
	end
	if v17:FindFirstChild("UsingMove") then
		return
	end
	if v17:GetAttribute("IsSwinging") then
		return
	end
	local v0 = Instance.new("Folder")
	v0.Name = "UsingMove"
	v0.Parent = v17
	v10.Debris(v0, 0.5)
	v77:Stop()
	v26:Stop()
	v79:Stop()
	v21 = v17.Weapon.Value
	v17:SetAttribute("EquipCD", true)
	task.delay(2, function()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 1
                ~ Argument Count: 0
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 70
                ~ Registers Used: R0-R3
                ~ Type Information: Unavailable
        ]]
		v17:SetAttribute("EquipCD", nil)
	end)
	if v66 == false then
		v66 = true
		v77:Play()
		v82:Play()
		task.wait(0.3)
		v6.SwingSound:FireServer(v21)
		v6.Equip:FireServer(true)
		return
	end
	if v66 ~= true then
		return
	end
	v66 = false
	v77:Stop()
	v83:Play()
	task.wait(0.35)
	v6.SwingSound:FireServer(v21)
	v6.Equip:FireServer(false)
	v49 = false
	return
end
local function FocusNPCs()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 5
            ~ Argument Count: 0
            ~ Debug Name: FocusNPCs
            ~ Bytecode ID: 73
            ~ Registers Used: R0-R17
            ~ Type Information: Unavailable
    ]]
	-- Fission: INFO: local 'v4_73' has been suffixed to avoid shadowing an existing, upper scope variable.
	if v17:GetAttribute("Focusing") then
		return
	end
	v17:SetAttribute("Focusing", true)
	local v0: table = {}
	local v1: table = {
		"TraderNPC",
		"VendorNPC",
		"ContractorNPC",
		"BookshelfNPC",
		"BountyNPC",
		"OutfitWeaverNPC",
		"DoctorNPC",
		"OfficeManagerNPC",
		"RipperNPC",
		"SpecialContractorNPC",
	}
	for v5, v6 in workspace.NPCS:GetChildren() do
		local v7 = v6:IsA("Model")
		if v7 then
			v7 = v6.PrimaryPart
			if v7 then
				v7 = v1
				for v10, v11 in v7 do
					if v6:HasTag(v11) then
						local v12 = v4.FocusedNPCView:Clone()
						local v14 = string.gsub(v11, "NPC$", "")
						v12.Container.NPCText.Text = v14
						v12.Parent = v6.PrimaryPart
						table.insert(v0, v12)
						break
					end
				end
			end
		end
	end
	local v2 = v15:GetAttribute("FixerGroup")
	for v6, v7 in game:GetService("Players"):GetPlayers() do
		if v7.Character ~= nil then
			if v7:GetAttribute("FixerGroup") then
				if v2 then
					if v7:GetAttribute("FixerGroup") == v2 then
						local v8 = v4.PartyIcon:Clone()
						v8.Parent = v7.Character.HumanoidRootPart
						table.insert(v0, v8)
					end
				end
			end
		end
	end
	local Lighting: Lighting = game:GetService("Lighting")
	Lighting.FocusCorrection.Enabled = true
	local v38_Lighting: Lighting = game:GetService("Lighting")
	Lighting.FocusCorrection.Focusing:Play()
	local Lighting: Lighting = game:GetService("Lighting")
	TweenService:Create(Lighting.FocusCorrection, TweenInfo.new(0.5), { Saturation = -0.9 }):Play()
	task.wait(1)
	repeat
		v3 = task.wait
		v3()
		v3 = UserInputService
		v5 = Enum.KeyCode.E
		local v3, v4_73 = v3:IsKeyDown(v5)

	until not v3
	local v39_Lighting: Lighting = game:GetService("Lighting")
	v7 = { Saturation = 0 }
	TweenService:Create(Lighting.FocusCorrection, TweenInfo.new(0.5), v7):Play()
	task.delay(2, function()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 1
                ~ Argument Count: 0
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 72
                ~ Registers Used: R0-R3
                ~ Type Information: Unavailable
        ]]
		v17:SetAttribute("Focusing", nil)
		local v40_Lighting: Lighting = game:GetService("Lighting")
		Lighting.FocusCorrection.Enabled = false
	end)
	v3 = v0
	for v6, v7 in v3 do
		v7:Destroy()
	end
	return
end
local function ShootGun()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 11
            ~ Argument Count: 0
            ~ Debug Name: ShootGun
            ~ Bytecode ID: 75
            ~ Registers Used: R0-R19
            ~ Type Information: Unavailable
    ]]
	-- Fission: INFO: local 'v6_75' has been suffixed to avoid shadowing an existing, upper scope variable.
	if not v52 then
		return
	end
	if _G.CheckForStun(v17) then
		return
	end
	if v10.GetBulletType(v17) <= 0 then
		return
	end
	local v2 = workspace.CurrentCamera
	local v3 = v15:GetMouse()
	local v4 = v22[v21].Recoil.Value
	local v5 = v22[v21].GunshotDelay.Value
	if table.find(v10.GetEGOGifts(v17), "Ammunition Crate") then
		v5 -= v5 * 0.1
	end
	local v6_75 = Instance.new("Folder")
	v6_75.Parent = v17
	v6_75.Name = "GunAttackCD"
	v10.Debris(v6_75, v22[v21].GunshotDelay.Value)
	if not _G.CheckForStun(v17) then
		local v7 = workspace.CurrentCamera:ScreenPointToRay(v3.X, v3.Y)
		task.delay(v22[v21].GunshotDelay.Value, function()
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 2
                    ~ Argument Count: 0
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 74
                    ~ Registers Used: R0-R2
                    ~ Type Information: Unavailable
            ]]
			if not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
				return
			end
			v131()
			return
		end)
		v6.GunModeShoot:InvokeServer(nil, nil, nil, v7.Direction)
		v86:Play()
		v46:ShakeOnce(v4 * 2, v4, 0, v4 * 0.1, Vector3.new(0.01 + v4 / 10, 0.02 + v4 / 10, 0.01 + v4 / 10))
		return
	else
		return
	end
end
local function GunAim()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 15
            ~ Argument Count: 0
            ~ Debug Name: GunAim
            ~ Bytecode ID: 81
            ~ Registers Used: R0-R11
            ~ Type Information: Unavailable
    ]]
	-- Fission: INFO: local 'v4_81' has been suffixed to avoid shadowing an existing, upper scope variable.
	if v91 == "Gun" then
		if not v17:GetAttribute("IsSwinging") then
			if not v17:FindFirstChild("GunAttackCD") then
				local v0, v1 = v10.GetBulletType(v17)
				if v22[v21]:FindFirstChild("BulletAmount") then
					if 0 < v1 then
						if v52 ~= false then
							return
						end
						local v2 = Instance.new("Folder")
						v2.Parent = v17
						v2.Name = "GunAttackCD"
						v10.Debris(v2, 1)
						local v3 = Instance.new("Folder")
						v3.Name = "UsingMove"
						v3.Parent = v17
						v85:Play(0.1)
						v52 = true
						v53 = true
						task.delay(0.5, function()
							--[[ 
                                Fission ~~ Function Information:
                                    ~ Upvalue Count: 1
                                    ~ Argument Count: 0
                                    ~ Debug Name: anon/no name
                                    ~ Bytecode ID: 77
                                    ~ Registers Used: R0-R0
                                    ~ Type Information: Unavailable
                            ]]
							v53 = false
						end)
						local v4_81 = RaycastParams.new()
						v4_81.FilterType = Enum.RaycastFilterType.Exclude
						v4_81.FilterDescendantsInstances = { v17, workspace.Thrown }
						v17:SetAttribute("IsSwinging", true)
						local v5 = v4.AimPart:Clone()
						v5.Parent = v17
						v5.CFrame = v17[v22[v21].AimPart.Value].CFrame
						local v11 = v21
						v5.Weld.Part0 = v17[v22[v11].AimPart.Value]
						local function anon_32392_79()
							--[[ 
                                Fission ~~ Function Information:
                                    ~ Upvalue Count: 16
                                    ~ Argument Count: 0
                                    ~ Debug Name: anon/no name
                                    ~ Bytecode ID: 79
                                    ~ Registers Used: R0-R9
                                    ~ Type Information: Unavailable
                            ]]
							-- Fission: INFO: local 'v1_79' has been suffixed to avoid shadowing an existing, upper scope variable.
							-- Fission: INFO: local 'v0_79' has been suffixed to avoid shadowing an existing, upper scope variable.
							-- Fission: INFO: local 'v3_79' has been suffixed to avoid shadowing an existing, upper scope variable.
							-- Fission: INFO: local 'v5_79' has been suffixed to avoid shadowing an existing, upper scope variable.
							-- Fission: INFO: local 'v4_79' has been suffixed to avoid shadowing an existing, upper scope variable.
							for v3_79, v4_79 in v5:GetDescendants() do
								if not v4_79:IsA("Beam") then
									if not v4_79:IsA("ParticleEmitter") then
										if v4_79:IsA("Trail") then
										end
									end
								end
								local v5_79: { string } = string.split(v15.Data.EyeColor.Value, ",")
								local v6 = Color3.new(v7, v8, v9)
								local v7 = ColorSequence.new(v6)
								v4_79.Color = v7
							end
							local v0_79 = Instance.new("BodyGyro", v17.HumanoidRootPart)
							v0_79.Name = "AimGyro"
							v0_79.P = 6000
							v0_79.D = 10
							v0_79.CFrame = v17.HumanoidRootPart.CFrame
							v0_79.MaxTorque = Vector3.new(inf, inf, inf)
							task.wait(0.2)
							if v22[v21].HasScope.Value == "Yes" then
								TweenService
									:Create(
										v15.PlayerGui.OverlayGui.Scope,
										TweenInfo.new(0.3),
										{ ImageTransparency = 0 }
									)
									:Play()
								TweenService:Create(
									v15.PlayerGui.OverlayGui.ScopeVignette,
									TweenInfo.new(0.3),
									{ ImageTransparency = 0 }
								):Play()
								TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.2), { FieldOfView = 30 })
									:Play()
							end
							while v22[v21].HasScope.Value == "Yes" do
								task.wait()
								local v1_79 = v15:GetMouse()
								local v2 = workspace.CurrentCamera:ScreenPointToRay(v1_79.X, v1_79.Y)
								local v3_79 = workspace:Raycast(v17.Head.Position, v2.Direction * 1e+07, v4_81)
								if v3_79 then
									if v3_79.Position then
										v4_79 = v3_79.Position
										local v5_79 = Vector3.new(v4_79.X, v17.HumanoidRootPart.Position.Y, v4_79.Z)
										local v6 = CFrame.lookAt(v17.HumanoidRootPart.Position, v5_79)
										v0_79.CFrame = v6
									end
								end
								if v3_79 then
									if v3_79.Instance then
										v5.LaserTrail.WorldPosition = v3_79.Position
										v5.PointLaser.WorldPosition = v3_79.Position
										if v3_79.Instance.Parent:FindFirstChildOfClass("Humanoid") then
											if not v3_79.Instance.Parent:FindFirstChild("AimModeHighlight") then
												local v4_79 = v4.AimModeHighlight:Clone()
												v4_79.Parent = v3_79.Instance.Parent
												v10.Debris(v4_79, 1)
											end
										end
									end
								end
								local v4_79, v5_79 = v10.GetBulletType(v17)
								v0 = v4_79
								v1 = v5_79
								if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) ~= false then
									if not _G.CheckForStun(v17) then
										if v66 ~= false then
											if v1 <= 0 then
											end
										end
									end
								end
								v85:Stop(0.4)
								v3:Destroy()
								v52 = false
								if v22[v21].HasScope.Value == "Yes" then
									TweenService:Create(
										v15.PlayerGui.OverlayGui.Scope,
										TweenInfo.new(0.3),
										{ ImageTransparency = 1 }
									):Play()
									TweenService:Create(
										v15.PlayerGui.OverlayGui.ScopeVignette,
										TweenInfo.new(0.3),
										{ ImageTransparency = 1 }
									):Play()
									TweenService
										:Create(workspace.CurrentCamera, TweenInfo.new(0.2), { FieldOfView = 70 })
										:Play()
									v15.CameraMode = Enum.CameraMode.Classic
								end
								v0_79:Destroy()
								task.delay(0.5, function()
									--[[ 
                                        Fission ~~ Function Information:
                                            ~ Upvalue Count: 1
                                            ~ Argument Count: 0
                                            ~ Debug Name: anon/no name
                                            ~ Bytecode ID: 78
                                            ~ Registers Used: R0-R3
                                            ~ Type Information: Unavailable
                                    ]]
									v17:SetAttribute("IsSwinging", nil)
								end)
								if v5 == nil then
									return
								end
								v5:Destroy()
								return
							end
							workspace.CurrentCamera.FieldOfView = 30
							v15.CameraMode = Enum.CameraMode.LockFirstPerson
							task.wait()
							local v1_79 = v15:GetMouse()
							local v2 = workspace.CurrentCamera:ScreenPointToRay(v1_79.X, v1_79.Y)
							local v3_79 = workspace:Raycast(v17.Head.Position, v2.Direction * 1e+07, v4_81)
							if v3_79 then
								if v3_79.Position then
									v4_79 = v3_79.Position
									local v5_79 = Vector3.new(v4_79.X, v17.HumanoidRootPart.Position.Y, v4_79.Z)
									local v6 = CFrame.lookAt(v17.HumanoidRootPart.Position, v5_79)
									v0_79.CFrame = v6
								end
							end
							if v3_79 then
								if v3_79.Instance then
									v5.LaserTrail.WorldPosition = v3_79.Position
									v5.PointLaser.WorldPosition = v3_79.Position
									if v3_79.Instance.Parent:FindFirstChildOfClass("Humanoid") then
										if not v3_79.Instance.Parent:FindFirstChild("AimModeHighlight") then
											local v4_79 = v4.AimModeHighlight:Clone()
											v4_79.Parent = v3_79.Instance.Parent
											v10.Debris(v4_79, 1)
										end
									end
								end
							end
							local v4_79, v5_79 = v10.GetBulletType(v17)
							v0 = v4_79
							v1 = v5_79
							if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) ~= false then
								if not _G.CheckForStun(v17) then
									if v66 ~= false then
										if v1 <= 0 then
										end
									end
								end
							end
							v85:Stop(0.4)
							v3:Destroy()
							v52 = false
							if v22[v21].HasScope.Value == "Yes" then
								TweenService
									:Create(
										v15.PlayerGui.OverlayGui.Scope,
										TweenInfo.new(0.3),
										{ ImageTransparency = 1 }
									)
									:Play()
								TweenService:Create(
									v15.PlayerGui.OverlayGui.ScopeVignette,
									TweenInfo.new(0.3),
									{ ImageTransparency = 1 }
								):Play()
								TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.2), { FieldOfView = 70 })
									:Play()
								v15.CameraMode = Enum.CameraMode.Classic
							end
							v0_79:Destroy()
							task.delay(0.5, function()
								--[[ 
                                    Fission ~~ Function Information:
                                        ~ Upvalue Count: 1
                                        ~ Argument Count: 0
                                        ~ Debug Name: anon/no name
                                        ~ Bytecode ID: 78
                                        ~ Registers Used: R0-R3
                                        ~ Type Information: Unavailable
                                ]]
								v17:SetAttribute("IsSwinging", nil)
							end)
							if v5 == nil then
								return
							end
							v5:Destroy()
							return
						end
						task.spawn(anon_32392_79)
						return
					end
					return
				end
				if v1 > 0 then
					return
				end
				if v75 then
					return
				end
				if v17:GetAttribute("ReloadCD") then
					return
				end
				v75 = true
				_G.HandleCD("Weapon Reload", v22[v21].ReloadCooldown.Value)
				task.delay(v22[v21].ReloadCooldown.Value, function()
					--[[ 
                        Fission ~~ Function Information:
                            ~ Upvalue Count: 1
                            ~ Argument Count: 0
                            ~ Debug Name: anon/no name
                            ~ Bytecode ID: 80
                            ~ Registers Used: R0-R0
                            ~ Type Information: Unavailable
                    ]]
					v75 = false
				end)
				ReplicatedStorage.Events.ReloadWeapon:FireServer()
				return
			end
		end
	end
	if v91 ~= "MeleeAlt" then
		return
	end
	if v75 then
		return
	end
	v75 = true
	_G.HandleCD("Weapon Function", v22[v21].ReloadCooldown.Value)
	v2 = function()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 1
                ~ Argument Count: 0
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 76
                ~ Registers Used: R0-R0
                ~ Type Information: Unavailable
        ]]
		v75 = false
	end
	task.delay(v22[v21].ReloadCooldown.Value, v2)
	ReplicatedStorage.Events.WeaponAlt:FireServer()
	return
end
local function Parry()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 10
            ~ Argument Count: 0
            ~ Debug Name: Parry
            ~ Bytecode ID: 87
            ~ Registers Used: R0-R9
            ~ Type Information: Unavailable
    ]]
	-- Fission: INFO: local 'v6_87' has been suffixed to avoid shadowing an existing, upper scope variable.
	if v17:FindFirstChild("NoParry") then
		return
	end
	if v17:GetAttribute("ParryCD") then
		return
	end
	if v17:FindFirstChild("UsingMove") then
		return
	end
	if v17:GetAttribute("Staggered") then
		return
	end
	if v17:FindFirstChild("LightAttack") then
		return
	end
	if v17:FindFirstChild("HeavyAttack") then
		return
	end
	if v17:FindFirstChild("Grabbed") then
		return
	end
	if UserInputService.MouseBehavior ~= Enum.MouseBehavior.LockCenter then
		if not v15:GetAttribute("Shiftlocked") then
			return
		end
	end
	if v17:HasTag("FragileParry") then
		return
	end
	v17:SetAttribute("ParryCD", true)
	local v0: nil = nil
	local v1 = Instance.new("Folder")
	v1.Name = "UsingMove"
	v1.Parent = v17
	v10.Debris(v1, 0.3)
	v61 = false
	local v2: boolean = false
	local v3: nil = nil
	local v5 = ReplicatedStorage.Events.FragileParry.OnClientEvent:Once(function()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 6
                ~ Argument Count: 0
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 82
                ~ Registers Used: R0-R3
                ~ Type Information: Unavailable
        ]]
		_G.ResetCD("Parry CD")
		v2 = true
		v10.ClearHighlights(v17)
		v10.FragileParry(v17)
		v88:Stop(0.3)
		v17:SetAttribute("ParryCD", nil)
		if not v0 then
			v3:Disconnect()
			return
		end
		pcall(task.cancel, v0)
		v3:Disconnect()
		return
	end)
	v3 = v5
	task.delay(1, function()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 1
                ~ Argument Count: 0
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 83
                ~ Registers Used: R0-R1
                ~ Type Information: Unavailable
        ]]
		if not v3 then
			return
		end
		if not v3.Connected then
			return
		end
		v3:Disconnect()
		return
	end)
	local v5 = v6.ParryActivate:InvokeServer()
	local v4 = v5
	if not v4 then
		v17:SetAttribute("ParryCD", nil)
		return
	end
	if not v2 then
		v88:Play()
		v5 = false
		local v6_87: boolean = false
		local function anon_155_84()
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 4
                    ~ Argument Count: 0
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 84
                    ~ Registers Used: R0-R1
                    ~ Type Information: Unavailable
            ]]
			v88:Stop()
			if v6_87 ~= false then
				return
			end
			if v2 then
				return
			end
			v6.MissParry:FireServer()
			return
		end
		task.delay(v4, anon_155_84)
		v62 = true
		local function anon_156_85()
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 3
                    ~ Argument Count: 0
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 85
                    ~ Registers Used: R0-R3
                    ~ Type Information: Unavailable
            ]]
			local v0: number = 4.5
			v62 = false
			if table.find(v47, "Bizarre") then
				v0 -= 1
			end
			if not table.find(v47, "Proficient") then
				_G.HandleCD("Parry CD", v0)
				task.wait(v0)
				v5 = true
				return
			end
			v0 += 3
			_G.HandleCD("Parry CD", v0)
			task.wait(v0)
			v5 = true
			return
		end
		local v7 = task.spawn(anon_156_85)
		task.spawn(function()
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 4
                    ~ Argument Count: 0
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 86
                    ~ Registers Used: R0-R6
                    ~ Type Information: Unavailable
            ]]
			-- Fission: INFO: local 'v3_86' has been suffixed to avoid shadowing an existing, upper scope variable.
			while true do
				task.wait()
				if v5 == true then
					break
				end
				if v17:FindFirstChild("HitParry") then
					break
				end
			end
			if v17:FindFirstChild("HitParry") then
				for v3_86, v4 in v17:GetChildren() do
					if v4.Name == "HitParry" then
						v4:Destroy()
					end
				end
				v6_87 = true
			end
			if not v3 then
				task.wait(0.05)
				_G.ResetCD("Parry CD")
				v17:SetAttribute("ParryCD", nil)
				return
			end
			if v17:GetAttribute("ParryCD") then
				task.wait(0.05)
				_G.ResetCD("Parry CD")
				v17:SetAttribute("ParryCD", nil)
				return
			else
				return
			end
		end)
		return
	else
		v17:SetAttribute("ParryCD", nil)
		return
	end
end
local function Block(arg0: table)
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 10
            ~ Argument Count: 1
            ~ Debug Name: Block
            ~ Bytecode ID: 90
            ~ Registers Used: R0-R5
            ~ Type Information: Unavailable
    ]]
	while not v17:GetAttribute("Dodging") do
		if not UserInputService:IsKeyDown(arg0.KeyCode) then
			if not UserInputService:IsMouseButtonPressed(arg0.UserInputType) then
				return
			end
		end
		task.wait()
	end
	if not v62 then
		if not v17:GetAttribute("IsSwinging") then
			if not v17:FindFirstChild("UsingMove") then
				if not v17:FindFirstChild("Stunned") then
					if not v17:FindFirstChild("Knocked") then
						if not v17:FindFirstChild("Ragdolled") then
							if v13.IsInput("Block", arg0) then
								v17:SetAttribute("IsSwinging", true)
								v61 = true
								v49 = false
								v62 = true
								v76.Looped = true
								v76:Play()
								v6.BlockState:FireServer(true)
								local v1 = Instance.new("Folder")
								v1.Name = "HeavyAttack"
								v1.Parent = v17
								local v2: nil = nil
								local v41_RunService: RunService = game:GetService("RunService")
								local v3 = RunService.RenderStepped:Connect(function()
									--[[ 
                                        Fission ~~ Function Information:
                                            ~ Upvalue Count: 11
                                            ~ Argument Count: 0
                                            ~ Debug Name: anon/no name
                                            ~ Bytecode ID: 89
                                            ~ Registers Used: R0-R4
                                            ~ Type Information: Unavailable
                                    ]]
									if not UserInputService:IsKeyDown(arg0.KeyCode) then
										if UserInputService:IsMouseButtonPressed(arg0.UserInputType) then
										end
										local v0 = Instance.new("Folder")
										v0.Name = "DashDisabled"
										v0.Parent = v17
										v10.Debris(v0, 0.2)
										v17:SetAttribute("IsSwinging", nil)
										v10.Debris(v1, 0.45)
										v76:Stop(0.25)
										v6.BlockState:FireServer(false)
										v61 = false
										_G.HandleCD("Guard", 1)
										task.delay(1, function()
											--[[ 
                                                Fission ~~ Function Information:
                                                    ~ Upvalue Count: 1
                                                    ~ Argument Count: 0
                                                    ~ Debug Name: anon/no name
                                                    ~ Bytecode ID: 88
                                                    ~ Registers Used: R0-R0
                                                    ~ Type Information: Unavailable
                                            ]]
											v62 = false
										end)
										v2:Disconnect()
										return
									end
									if v61 then
										if not v17:FindFirstChild("Stunned") then
											if not v17:FindFirstChild("UsingMove") then
												local v42_Data: Instance = v15:WaitForChild("Data")
												if 0 < Data.Stamina.Value then
													return
												end
											end
										end
									end
									local v0 = Instance.new("Folder")
									v0.Name = "DashDisabled"
									v0.Parent = v17
									v10.Debris(v0, 0.2)
									v17:SetAttribute("IsSwinging", nil)
									v10.Debris(v1, 0.45)
									v76:Stop(0.25)
									v6.BlockState:FireServer(false)
									v61 = false
									_G.HandleCD("Guard", 1)
									task.delay(1, function()
										--[[ 
                                            Fission ~~ Function Information:
                                                ~ Upvalue Count: 1
                                                ~ Argument Count: 0
                                                ~ Debug Name: anon/no name
                                                ~ Bytecode ID: 88
                                                ~ Registers Used: R0-R0
                                                ~ Type Information: Unavailable
                                        ]]
										v62 = false
									end)
									v2:Disconnect()
									return
								end)
								v2 = v3
								return
							else
								return
							end
						end
					end
				end
			end
		end
	end
	if not UserInputService:IsKeyDown(arg0.KeyCode) then
		if not UserInputService:IsMouseButtonPressed(arg0.UserInputType) then
			return
		end
	end
	task.wait()
end
local function RagdollEvasive()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 6
            ~ Argument Count: 0
            ~ Debug Name: RagdollEvasive
            ~ Bytecode ID: 92
            ~ Registers Used: R0-R4
            ~ Type Information: Unavailable
    ]]
	if not v17:FindFirstChild("Ragdolled") then
		return
	end
	if v54 then
		return
	end
	print("fired.... server for ragdoll....")
	v6.RagdollCancel:FireServer(v17)
	v54 = true
	v15.PlayerGui.OverlayGui.White.ImageTransparency = 0
	TweenService:Create(v15.PlayerGui.OverlayGui.White, TweenInfo.new(0.15), { ImageTransparency = 1 }):Play()
	local v0: number = 25
	if not table.find(v47, "Reactive") then
		_G.HandleCD("Evasive", v0)
		task.delay(v0, function()
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 1
                    ~ Argument Count: 0
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 91
                    ~ Registers Used: R0-R1
                    ~ Type Information: Unavailable
            ]]
			v54 = false
			print("got off.... cd....")
		end)
		return
	end
	v0 = 15
	_G.HandleCD("Evasive", v0)
	task.delay(v0, function()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 1
                ~ Argument Count: 0
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 91
                ~ Registers Used: R0-R1
                ~ Type Information: Unavailable
        ]]
		v54 = false
		print("got off.... cd....")
	end)
	return
end
local function PounceFollowup()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 4
            ~ Argument Count: 0
            ~ Debug Name: PounceFollowup
            ~ Bytecode ID: 95
            ~ Registers Used: R0-R7
            ~ Type Information: Unavailable
    ]]
	if not v17:FindFirstChild("IsSliding") then
		return
	end
	if v51 ~= false then
		return
	end
	if table.find(v47, "FollowUp") then
		v51 = true
		task.delay(1, function()
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 1
                    ~ Argument Count: 0
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 93
                    ~ Registers Used: R0-R0
                    ~ Type Information: Unavailable
            ]]
			v51 = false
		end)
		for v3, v4 in pairs(v17.HumanoidRootPart:GetChildren()) do
			if v4:IsA("BodyVelocity") then
				v4:Destroy()
			end
		end
		v6.FollowUp:FireServer()
		return
	else
		if not table.find(v47, "Pounce") then
			return
		end
		for v3, v4 in pairs(v17.HumanoidRootPart:GetChildren()) do
			if v4:IsA("BodyVelocity") then
				v4:Destroy()
			end
		end
		v6.Pounce:FireServer()
		v51 = true
		task.delay(1, function()
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 1
                    ~ Argument Count: 0
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 94
                    ~ Registers Used: R0-R0
                    ~ Type Information: Unavailable
            ]]
			v51 = false
		end)
		return
	end
end
local function CriticalAttack()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 10
            ~ Argument Count: 0
            ~ Debug Name: CriticalAttack
            ~ Bytecode ID: 99
            ~ Registers Used: R0-R6
            ~ Type Information: Unavailable
    ]]
	if v17:GetAttribute("DisableM1") then
		return
	end
	local v43_Data: Instance = v15:WaitForChild("Data")
	if v22[v21].Stamina.Value > Data.Stamina.Value then
		return
	end
	if v61 ~= false then
		return
	end
	if v66 ~= true then
		return
	end
	if v17:GetAttribute("CriticalCD") then
		return
	end
	if v17:FindFirstChild("PerfectParry") then
		return
	end
	if v17:HasTag("PerfectParry") then
		return
	end
	if v17:FindFirstChild("IsSliding") then
		return
	end
	v17:SetAttribute("IsSwinging", true)
	if not v22[v21]:HasTag("CustomCD") then
		v0 = false
		local v1: nil = nil
		local v2 = ReplicatedStorage.Events.ResetCritCD.OnClientEvent:Connect(function()
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 3
                    ~ Argument Count: 0
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 96
                    ~ Registers Used: R0-R3
                    ~ Type Information: Unavailable
            ]]
			v17:SetAttribute("CriticalCD", false)
			_G.ResetCD("Critical Attack")
			v0 = true
			v1:Disconnect()
		end)
		v1 = v2
		v17:SetAttribute("CriticalCD", true)
		_G.HandleCD("Critical Attack", v22[v21].CriticalCD.Value)
		task.delay(v22[v21].CriticalCD.Value, function()
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 3
                    ~ Argument Count: 0
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 97
                    ~ Registers Used: R0-R3
                    ~ Type Information: Unavailable
            ]]
			if not v0 then
				v17:SetAttribute("CriticalCD", false)
				v1:Disconnect()
				return
			else
				return
			end
		end)
	end
	task.spawn(function()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 1
                ~ Argument Count: 0
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 98
                ~ Registers Used: R0-R3
                ~ Type Information: Unavailable
        ]]
		task.wait(1)
		v17:SetAttribute("IsSwinging", nil)
	end)
	local v4 = Humanoid.Jump or Humanoid.FloorMaterial == Enum.Material.Air
	v6.ActivateCritical:FireServer(v16.Hit, Humanoid.MoveDirection, v4)
	return
end
local function ShinAndMang()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 6
            ~ Argument Count: 0
            ~ Debug Name: ShinAndMang
            ~ Bytecode ID: 102
            ~ Registers Used: R0-R5
            ~ Type Information: Unavailable
    ]]
	local v0: number = -10
	if table.find(v47, "DecimateMind") then
		v0 = -35
	end
	if v15.Data.Sanity.Value < v0 then
		return
	end
	if not _G.CheckForStun(v17) then
		local v44_Lighting: Lighting = game:GetService("Lighting")
		Lighting.ShinFocus.Enabled = true
		local Lighting: Lighting = game:GetService("Lighting")
		Lighting.ShinFocus.Focusing:Play()
		local v45_Lighting: Lighting = game:GetService("Lighting")
		v3 = Lighting.ShinFocus
		local v4 = TweenInfo.new(0.5)
		local v5: table = { Saturation = -0.9 }
		TweenService:Create(v3, v4, v5):Play()
		task.spawn(function()
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 5
                    ~ Argument Count: 0
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 101
                    ~ Registers Used: R0-R4
                    ~ Type Information: Unavailable
            ]]
			-- Fission: INFO: local 'v0_101' has been suffixed to avoid shadowing an existing, upper scope variable.
			while true do
				task.wait(0.25)
				v6.ShinGain:FireServer()
				if v15.Data.Sanity.Value < v0 then
					break
				end
				local v0_101 = UserInputService:IsKeyDown(Enum.KeyCode.LeftControl)
				if not v0_101 then
					v0_101 = UserInputService:IsKeyDown(Enum.KeyCode.LeftAlt)
				end
				if v0_101 == false then
					break
				end
			end
			local v46_Lighting: Lighting = game:GetService("Lighting")
			TweenService:Create(Lighting.ShinFocus, TweenInfo.new(0.5), { Saturation = 0 }):Play()
			task.delay(2, function()
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 0
                        ~ Argument Count: 0
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 100
                        ~ Registers Used: R0-R2
                        ~ Type Information: Unavailable
                ]]
				local v47_Lighting: Lighting = game:GetService("Lighting")
				Lighting.ShinFocus.Enabled = false
			end)
			return
		end)
		return
	else
		return
	end
end
local function Execute()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 3
            ~ Argument Count: 0
            ~ Debug Name: Execute
            ~ Bytecode ID: 104
            ~ Registers Used: R0-R9
            ~ Type Information: Unavailable
    ]]
	for v3, v4 in pairs(workspace.Alive:GetChildren()) do
		if v4:FindFirstChildOfClass("Humanoid") then
			if v4:FindFirstChild("Knocked") then
				local v48_HumanoidRootPart: Instance = v17:FindFirstChild("HumanoidRootPart")
				if v4.HumanoidRootPart.Position - HumanoidRootPart.Position.Magnitude <= 8 then
					if not v4:FindFirstChild("GettingGripped") then
						local Humanoid: Humanoid = v4:FindFirstChildOfClass("Humanoid")
						if 0 < Humanoid.Health then
							v6.Grip:FireServer(v17)
							v64 = true
							task.delay(1.55, function()
								--[[ 
                                    Fission ~~ Function Information:
                                        ~ Upvalue Count: 1
                                        ~ Argument Count: 0
                                        ~ Debug Name: anon/no name
                                        ~ Bytecode ID: 103
                                        ~ Registers Used: R0-R0
                                        ~ Type Information: Unavailable
                                ]]
								v64 = false
							end)
							return
						end
					end
				end
			end
		end
	end
	return
end
local function Carry()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 5
            ~ Argument Count: 0
            ~ Debug Name: Carry
            ~ Bytecode ID: 106
            ~ Registers Used: R0-R9
            ~ Type Information: Unavailable
    ]]
	for v3, v4 in pairs(workspace.Alive:GetChildren()) do
		if v4:FindFirstChildOfClass("Humanoid") then
			if v4:FindFirstChild("Knocked") then
				local v49_HumanoidRootPart: Instance = v17:FindFirstChild("HumanoidRootPart")
				if v4.HumanoidRootPart.Position - HumanoidRootPart.Position.Magnitude <= 8 then
					if not v4:FindFirstChild("GettingGripped") then
						local v50_Humanoid: Humanoid = v4:FindFirstChildOfClass("Humanoid")
						if 0 < v50_Humanoid.Health then
							v42:Play()
							v6.Carry:FireServer(v17)
							v67 = true
							v64 = true
							task.delay(3, function()
								--[[ 
                                    Fission ~~ Function Information:
                                        ~ Upvalue Count: 1
                                        ~ Argument Count: 0
                                        ~ Debug Name: anon/no name
                                        ~ Bytecode ID: 105
                                        ~ Registers Used: R0-R0
                                        ~ Type Information: Unavailable
                                ]]
								v64 = false
							end)
						end
					end
				end
			end
		end
	end
	return
end
local function OpenGestures()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 1
            ~ Argument Count: 0
            ~ Debug Name: OpenGestures
            ~ Bytecode ID: 108
            ~ Registers Used: R0-R7
            ~ Type Information: Unavailable
    ]]
	local v0: boolean = not v15.PlayerGui.GesturesUI.Enabled
	local v4 = v15:GetMouse()
	local v6 = v15:GetMouse()
	local v2 = UDim2.new(0, v4.X, 0, v6.Y)
	v15.PlayerGui.GesturesUI.List.Position = v2
	v15.PlayerGui.GesturesUI.Enabled = v0
	if v0 ~= true then
		return
	end
	v15.PlayerGui.GesturesUI.List.MouseLeave:Once(function()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 1
                ~ Argument Count: 0
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 107
                ~ Registers Used: R0-R1
                ~ Type Information: Unavailable
        ]]
		v15.PlayerGui.GesturesUI.Enabled = false
	end)
	return
end
local function UnCarry()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 4
            ~ Argument Count: 0
            ~ Debug Name: UnCarry
            ~ Bytecode ID: 109
            ~ Registers Used: R0-R2
            ~ Type Information: Unavailable
    ]]
	v6.UnCarry:FireServer(v49)
	v42:Stop()
	v67 = false
end
local function RunFunc()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 16
            ~ Argument Count: 0
            ~ Debug Name: RunFunc
            ~ Bytecode ID: 112
            ~ Registers Used: R0-R13
            ~ Type Information: Unavailable
    ]]
	-- Fission: INFO: local 'v4_112' has been suffixed to avoid shadowing an existing, upper scope variable.
	-- Fission: INFO: local 'v10_112' has been suffixed to avoid shadowing an existing, upper scope variable.
	-- Fission: INFO: local 'v7_112' has been suffixed to avoid shadowing an existing, upper scope variable.
	local v0 = WalkSpeed.Value
	v74 = true
	v73 = false
	v49 = true
	v17:SetAttribute("Running", true)
	local v1: boolean = false
	if not table.find(string.split(v15.Data.Injuries.Value, ","), "FracturedLeg") then
		local v2
		if not (Humanoid.Health <= Humanoid.MaxHealth / 3 or 0 < v3.Value) then
			v2 = 0 + 10
		end
		local function anon_26299_111()
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 7
                    ~ Argument Count: 0
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 111
                    ~ Registers Used: R0-R5
                    ~ Type Information: Unavailable
            ]]
			-- Fission: INFO: local 'v1_111' has been suffixed to avoid shadowing an existing, upper scope variable.
			if #v15.CombatTags:GetChildren() > 0 then
				return
			end
			if v1 ~= false then
				return
			end
			if table.find(string.split(v15.Data.Injuries.Value, ","), "FracturedLeg") then
				return
			end
			if Humanoid.MaxHealth / 3 >= Humanoid.Health then
				return
			end
			v2 = v2 + 6
			local v0 = v4.HighlightBase:Clone()
			local v1_111 = Color3.fromRGB(210, 243, 255)
			v0.OutlineColor = v1_111
			v0.FillTransparency = 1
			v0.OutlineTransparency = 1
			v0.Parent = v17
			TweenService:Create(v0, TweenInfo.new(0.4), { FillTransparency = 0.8, OutlineTransparency = 0.3 }):Play()
			task.delay(1.35, function()
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 2
                        ~ Argument Count: 0
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 110
                        ~ Registers Used: R0-R4
                        ~ Type Information: Unavailable
                ]]
				TweenService:Create(v0, TweenInfo.new(0.35), { FillTransparency = 1, OutlineTransparency = 1 }):Play()
				task.wait(0.5)
				v0:Destroy()
			end)
			return
		end
		task.delay(6, anon_26299_111)
		local v7_112: table = { FieldOfView = 83 }
		TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.4), v7_112):Play()
		for v6, v7_112 in v17:GetChildren() do
			if table.find({ "Right Arm", "Left Arm" }, v7_112.Name) then
				local v8 = v4.DashAnims.DashFX.Effects.Attachment1:Clone()
				local v9 = v4.DashAnims.DashFX.Effects.Attachment2:Clone()
				local v10_112 = v4.DashAnims.DashFX.Effects.DashTrail:Clone()
				v10_112.Attachment0 = v8
				v10_112.Attachment1 = v9
				v8.Parent = v7_112
				v9.Parent = v7_112
				v10_112.Parent = v7_112
				local v12 = v7
				table.insert(v12, v10_112)
				table.insert(v7, v8)
				table.insert(v7, v9)
			end
		end
		Humanoid.WalkSpeed = v0 + v2
		tick()
		while true do
			local v4_112: number = 0
			if not v15:GetAttribute("InCombat") then
				break
			end
			Humanoid.WalkSpeed = v0 + v2 + v4_112
			task.wait()
			if v49 ~= false then
				if not v17:GetAttribute("IsSwinging") then
					if not _G.CheckForStun(v17) then
						if not v17:GetAttribute("Swimming") then
							if not UserInputService:IsKeyDown(Enum.KeyCode.S) then
								if not UserInputService:IsKeyDown(Enum.KeyCode.W) then
								end
							end
						end
					end
				end
			end
			v17:SetAttribute("Running", nil)
			v78:Stop()
			v24:Stop()
			v49 = false
			v8 = { FieldOfView = 70 }
			TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.3), v8):Play()
			for v7_112, v8 in v7 do
				v8:Destroy()
			end
			if v17:HasTag("AutoStoppedRun") then
				return
			end
			if _G.CheckForStun(v17) then
				return
			end
			if v17:FindFirstChild("LightAttack") then
				return
			end
			if v17:FindFirstChild("HeavyAttack") then
				return
			end
			if v61 then
				return
			end
			if not v17:GetAttribute("IsSwinging") then
				Humanoid.WalkSpeed = WalkSpeed.Value
				return
			else
				return
			end
		end
		local v5 = v17:GetAttribute("LastHitBy")
		if not v5 then
			v6 = nil
		else
			v6 = Players:FindFirstChild(v5)
		end
		if v6 then
			v8 = v17.HumanoidRootPart.Position - v6.Character.HumanoidRootPart.Position.Magnitude
			if
				0
				< v17.HumanoidRootPart.Position
					- v6.Character.HumanoidRootPart.Position.Unit:Dot(v17.HumanoidRootPart.CFrame.LookVector)
			then
				v4_112 = -6
			end
		end
		Humanoid.WalkSpeed = v0 + v2 + v4_112
		task.wait()
		if v49 ~= false then
			if not v17:GetAttribute("IsSwinging") then
				if not _G.CheckForStun(v17) then
					if not v17:GetAttribute("Swimming") then
						if not UserInputService:IsKeyDown(Enum.KeyCode.S) then
							if not UserInputService:IsKeyDown(Enum.KeyCode.W) then
							end
						end
					end
				end
			end
		end
		v17:SetAttribute("Running", nil)
		v78:Stop()
		v24:Stop()
		v49 = false
		v8 = { FieldOfView = 70 }
		TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.3), v8):Play()
		for v7_112, v8 in v7 do
			v8:Destroy()
		end
		if v17:HasTag("AutoStoppedRun") then
			return
		end
		if _G.CheckForStun(v17) then
			return
		end
		if v17:FindFirstChild("LightAttack") then
			return
		end
		if v17:FindFirstChild("HeavyAttack") then
			return
		end
		if v61 then
			return
		end
		if not v17:GetAttribute("IsSwinging") then
			Humanoid.WalkSpeed = WalkSpeed.Value
			return
		else
			return
		end
	end
	v2 = 0 + 5
	anon_26299_111 = function()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 7
                ~ Argument Count: 0
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 111
                ~ Registers Used: R0-R5
                ~ Type Information: Unavailable
        ]]
		-- Fission: INFO: local 'v1_111' has been suffixed to avoid shadowing an existing, upper scope variable.
		if #v15.CombatTags:GetChildren() > 0 then
			return
		end
		if v1 ~= false then
			return
		end
		if table.find(string.split(v15.Data.Injuries.Value, ","), "FracturedLeg") then
			return
		end
		if Humanoid.MaxHealth / 3 >= Humanoid.Health then
			return
		end
		v2 = v2 + 6
		local v0 = v4.HighlightBase:Clone()
		local v1_111 = Color3.fromRGB(210, 243, 255)
		v0.OutlineColor = v1_111
		v0.FillTransparency = 1
		v0.OutlineTransparency = 1
		v0.Parent = v17
		TweenService:Create(v0, TweenInfo.new(0.4), { FillTransparency = 0.8, OutlineTransparency = 0.3 }):Play()
		task.delay(1.35, function()
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 2
                    ~ Argument Count: 0
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 110
                    ~ Registers Used: R0-R4
                    ~ Type Information: Unavailable
            ]]
			TweenService:Create(v0, TweenInfo.new(0.35), { FillTransparency = 1, OutlineTransparency = 1 }):Play()
			task.wait(0.5)
			v0:Destroy()
		end)
		return
	end
	task.delay(6, anon_26299_111)
	v7_112 = { FieldOfView = 83 }
	TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.4), v7_112):Play()
	for v6, v7_112 in v17:GetChildren() do
		if table.find({ v10_112, v11 }, v7_112.Name) then
			local v8 = v4.DashAnims.DashFX.Effects.Attachment1:Clone()
			local v9 = v4.DashAnims.DashFX.Effects.Attachment2:Clone()
			local v10_112 = v4.DashAnims.DashFX.Effects.DashTrail:Clone()
			v10_112.Attachment0 = v8
			v10_112.Attachment1 = v9
			v8.Parent = v7_112
			v9.Parent = v7_112
			v10_112.Parent = v7_112
			local v12 = v7
			table.insert(v12, v10_112)
			table.insert(v7, v8)
			table.insert(v7, v9)
		end
	end
	Humanoid.WalkSpeed = v0 + v2
	tick()
	while true do
		v4_112 = 0
		if not v15:GetAttribute("InCombat") then
			break
		end
		Humanoid.WalkSpeed = v0 + v2 + v4_112
		task.wait()
		if v49 ~= false then
			if not v17:GetAttribute("IsSwinging") then
				if not _G.CheckForStun(v17) then
					if not v17:GetAttribute("Swimming") then
						if not UserInputService:IsKeyDown(Enum.KeyCode.S) then
							if not UserInputService:IsKeyDown(Enum.KeyCode.W) then
							end
						end
					end
				end
			end
		end
		v17:SetAttribute("Running", nil)
		v78:Stop()
		v24:Stop()
		v49 = false
		v8 = { FieldOfView = 70 }
		TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.3), v8):Play()
		for v7_112, v8 in v7 do
			v8:Destroy()
		end
		if v17:HasTag("AutoStoppedRun") then
			return
		end
		if _G.CheckForStun(v17) then
			return
		end
		if v17:FindFirstChild("LightAttack") then
			return
		end
		if v17:FindFirstChild("HeavyAttack") then
			return
		end
		if v61 then
			return
		end
		if not v17:GetAttribute("IsSwinging") then
			Humanoid.WalkSpeed = WalkSpeed.Value
			return
		else
			return
		end
	end
	local v5 = v17:GetAttribute("LastHitBy")
	if not v5 then
		v6 = nil
	else
		v6 = Players:FindFirstChild(v5)
	end
	if v6 then
		v8 = v17.HumanoidRootPart.Position - v6.Character.HumanoidRootPart.Position.Magnitude
		if
			0
			< v17.HumanoidRootPart.Position
				- v6.Character.HumanoidRootPart.Position.Unit:Dot(v17.HumanoidRootPart.CFrame.LookVector)
		then
			v4_112 = -6
		end
	end
	Humanoid.WalkSpeed = v0 + v2 + v4_112
	task.wait()
	if v49 ~= false then
		if not v17:GetAttribute("IsSwinging") then
			if not _G.CheckForStun(v17) then
				if not v17:GetAttribute("Swimming") then
					if not UserInputService:IsKeyDown(Enum.KeyCode.S) then
						if not UserInputService:IsKeyDown(Enum.KeyCode.W) then
						end
					end
				end
			end
		end
	end
	v17:SetAttribute("Running", nil)
	v78:Stop()
	v24:Stop()
	v49 = false
	v8 = { FieldOfView = 70 }
	TweenService:Create(workspace.CurrentCamera, TweenInfo.new(0.3), v8):Play()
	for v7_112, v8 in v7 do
		v8:Destroy()
	end
	if v17:HasTag("AutoStoppedRun") then
		return
	end
	if _G.CheckForStun(v17) then
		return
	end
	if v17:FindFirstChild("LightAttack") then
		return
	end
	if v17:FindFirstChild("HeavyAttack") then
		return
	end
	if v61 then
		return
	end
	if not v17:GetAttribute("IsSwinging") then
		Humanoid.WalkSpeed = WalkSpeed.Value
		return
	else
		return
	end
end
UserInputService.InputBegan:Connect(function(arg0: table, arg1: boolean)
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 49
            ~ Argument Count: 2
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 121
            ~ Registers Used: R0-R19
            ~ Type Information: Available
    ]]
	-- Fission: INFO: local 'v13_121' has been suffixed to avoid shadowing an existing, upper scope variable.
	-- Fission: INFO: local 'v10_121' has been suffixed to avoid shadowing an existing, upper scope variable.
	-- Fission: INFO: local 'v6_121' has been suffixed to avoid shadowing an existing, upper scope variable.
	-- Fission: INFO: local 'v17_121' has been suffixed to avoid shadowing an existing, upper scope variable.
	if arg1 then
		return
	end
	if arg0.UserInputType == Enum.UserInputType.MouseButton3 then
		OpenGestures()
	end
	if table.find(v47, "TimeDistortionField") then
		if v17:FindFirstChild("UsingMove") then
			if v13.IsInput("Parry", arg0) then
				ReplicatedStorage.Events.RomanCancel:FireServer()
				return
			end
		end
	end
	if arg0.KeyCode == Enum.KeyCode.B then
		if v64 == true then
			v6.UnGrip:FireServer()
			return
		end
	end
	if not UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
		if UserInputService:IsKeyDown(Enum.KeyCode.LeftAlt) then
		end
		if arg0.KeyCode == Enum.KeyCode.E then
			if v15.PlayerGui.OverlayGui.PromptVisual.Visible == false then
				EquipWeapon()
			end
		end
		if v52 == true then
			if arg0.UserInputType == Enum.UserInputType.MouseButton1 then
				if not v17:FindFirstChild("GunAttackCD") then
					ShootGun()
				end
			end
		end
		if v13.IsInput("Parry", arg0) then
			local v2 = UserInputService:IsKeyDown(Enum.KeyCode.LeftControl)
			if not v2 then
				v2 = UserInputService:IsKeyDown(Enum.KeyCode.LeftAlt)
			end
			if v2 == false then
				if v66 == true then
					if not v17:FindFirstChild("LightAttack") then
						if not v17:FindFirstChild("Knocked") then
							if not v17:FindFirstChild("Ragdolled") then
								Parry()
							end
						end
					end
				end
			end
		end
		if v13.IsInput("Block", arg0) then
			if not v61 then
				if v66 then
					Block(arg0)
					return
				end
			end
		end
		if arg0.KeyCode == Enum.KeyCode.Space then
			if v60 == false then
				if not v17:GetAttribute("Swimming") then
					RagdollEvasive()
				end
			end
		end
		if arg0.KeyCode == Enum.KeyCode.Q then
			if v60 == false then
				if not v17:GetAttribute("Swimming") then
					Dash()
				end
			end
		end
		if v13.IsInput("LightAttack", arg0) then
			WeaponLightAttack()
		end
		if _G.CheckForStun(v17) then
			return
		end
		if v17:GetAttribute("IsSwinging") then
			return
		end
		if v17:FindFirstChild("UsingMove") then
			return
		end
		if v17:FindFirstChild("LightAttack") then
			return
		end
		if v13.IsInput("Critical", arg0) then
			PounceFollowup()
		end
		if v13.IsInput("Critical", arg0) then
			CriticalAttack()
		end
		if v17:GetAttribute("Dodging") then
			return
		end
		if arg0.UserInputType == Enum.UserInputType.MouseButton2 then
			if not UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
				if UserInputService:IsKeyDown(Enum.KeyCode.LeftAlt) then
				end
			end
			if v66 == true then
				GunAim()
			end
		end
		if v13.IsInput("ManifestEGO", arg0) then
			if v17:GetAttribute("EmotionLevel") ~= 2 or v63 == true then
				return
			end
			anon_54_36()
		end
		if table.find(v47, "ShinAndMang") then
			if v13.IsInput("ShinGain", arg0) then
				if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
					ShinAndMang()
					return
				end
				if UserInputService:IsKeyDown(Enum.KeyCode.LeftMeta) then
					ShinAndMang()
					return
				end
			end
		end
		if not v17:HasTag("InSafeZone") then
			if not v17:HasTag("InSparringZone") then
				if v13.IsInput("Execute", arg0) then
					if v64 == false then
						Execute()
					end
				end
			end
		end
		if not v17:HasTag("InSafeZone") then
			if not v17:HasTag("InSparringZone") then
				if v13.IsInput("Carry", arg0) then
					if v67 == false then
						if v64 == false then
							if v15.PlayerGui.Dialogue.Enabled == false then
								Carry()
							end
							if arg0.KeyCode == Enum.KeyCode.W then
								if not v17:GetAttribute("Swimming") then
									if v61 == false then
										if not v17:GetAttribute("IsSwinging") then
											if not _G.CheckForStun(v17) then
												if
													not table.find(
														string.split(v15.Data.Injuries.Value, ","),
														"MissingLeg"
													)
												then
													if v73 == false then
														if v15.Data.AutoRun.Value == false then
															v73 = true
														end
														task.delay(0.4, function()
															--[[ 
                                                                Fission ~~ Function Information:
                                                                    ~ Upvalue Count: 1
                                                                    ~ Argument Count: 0
                                                                    ~ Debug Name: anon/no name
                                                                    ~ Bytecode ID: 113
                                                                    ~ Registers Used: R0-R0
                                                                    ~ Type Information: Unavailable
                                                            ]]
															if not v73 then
																return
															end
															v73 = false
															return
														end)
													end
													RunFunc()
													task.delay(0.4, function()
														--[[ 
                                                            Fission ~~ Function Information:
                                                                ~ Upvalue Count: 1
                                                                ~ Argument Count: 0
                                                                ~ Debug Name: anon/no name
                                                                ~ Bytecode ID: 113
                                                                ~ Registers Used: R0-R0
                                                                ~ Type Information: Unavailable
                                                        ]]
														if not v73 then
															return
														end
														v73 = false
														return
													end)
												end
											end
										end
									end
								end
							end
							if arg0.KeyCode == Enum.KeyCode.Space then
								if v117 == true then
									ZipLineTravel("Stop")
								end
								local v3 = RaycastParams.new()
								v3.FilterType = Enum.RaycastFilterType.Include
								local v5 = workspace.Map
								v3.FilterDescendantsInstances = { v5 }
								local v8 = CFrame.new(0, 0, 1.5)
								local v4 = workspace:Raycast(
									HumanoidRootPart.CFrame * v8.Position,
									HumanoidRootPart.CFrame.LookVector * 5.5,
									v3
								)
								if Humanoid.FloorMaterial == Enum.Material.Air then
									if v4 then
										if v4.Instance then
											if v4.Instance:IsA("BasePart") then
												local v17_121
												if not v4.Instance:HasTag("Climbable") then
													if _G.CheckForStun(v17) then
														return
													end
													if v57 then
														return
													end
													v5 = v4.Instance
													local v6_121 = v5.CFrame
													local v7 = v5.Size / 2
													v8 = {
														v9,
														v6_121 * Vector3.new(-v7.X, v7.Y, v7.Z),
														v6_121 * Vector3.new(v7.X, v7.Y, -v7.Z),
														v6_121 * Vector3.new(-v7.X, v7.Y, -v17_121),
													}
													v9 = v6_121 * Vector3.new(v7.X, v7.Y, v7.Z)
													v17_121 = v7.Z
													local v10_121 = math.max(v10_121.Y, v11.Y, v12.Y, v13_121.Y)
														- HumanoidRootPart.Position.Y
													local v11: number = math.clamp(v10_121 / 7, 0, 1)
													if v10_121 < 7 then
														v37:Play()
														print("CanLedgeClimb")
														v57 = true
														task.delay(0.4, function()
															--[[ 
                                                                Fission ~~ Function Information:
                                                                    ~ Upvalue Count: 1
                                                                    ~ Argument Count: 0
                                                                    ~ Debug Name: anon/no name
                                                                    ~ Bytecode ID: 114
                                                                    ~ Registers Used: R0-R0
                                                                    ~ Type Information: Unavailable
                                                            ]]
															v57 = false
														end)
														local v12 = Instance.new("BodyVelocity")
														v13_121 = v11 * 50 + 15
														v12.Velocity = HumanoidRootPart.CFrame.LookVector * 20
															+ Vector3.new(0, v13_121, 0)
														v12.MaxForce = Vector3.new(50000, 50000, 50000)
														v12.Parent = HumanoidRootPart
														v10.Debris(v12, 0.15)
														return
													end
												end
											end
										end
									end
								end
								local v5 =
									Ray.new(HumanoidRootPart.CFrame.Position, HumanoidRootPart.CFrame.LookVector * 2.5)
								local v6_121 = workspace:FindPartOnRay(v5, v17)
								if v6_121 then
									if v65 == false then
										if Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
											if v70 == false then
												if v6_121.Transparency < 1 then
													if v6_121.CanCollide == true then
														if v6_121:HasTag("ClimbableWall") then
															v6.FallDamage:FireServer(
																false,
																HumanoidRootPart.AssemblyLinearVelocity.Y * -2
															)
															task.spawn(function()
																--[[ 
                                                                    Fission ~~ Function Information:
                                                                        ~ Upvalue Count: 2
                                                                        ~ Argument Count: 0
                                                                        ~ Debug Name: anon/no name
                                                                        ~ Bytecode ID: 115
                                                                        ~ Registers Used: R0-R1
                                                                        ~ Type Information: Unavailable
                                                                ]]
																v70 = true
																repeat
																	local v0 = task.wait
																	v0()
																	v0 = Humanoid
																	local v0, v1 = v0:GetState()
																	v1 = Enum.HumanoidStateType.Freefall

																until v0 ~= v1
																task.wait(0.2)
																v70 = false
																return
															end)
															v60 = true
															v36:Play()
															v36:AdjustSpeed(1.3)
															local v9 = Instance.new("BodyVelocity")
															v9.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
															v9.Velocity = HumanoidRootPart.CFrame.LookVector
																+ Vector3.new(0, 35, 0)
															v9.Parent = HumanoidRootPart
															v10.Debris(v9, 0.4)
															task.delay(0.25, function()
																--[[ 
                                                                    Fission ~~ Function Information:
                                                                        ~ Upvalue Count: 7
                                                                        ~ Argument Count: 0
                                                                        ~ Debug Name: anon/no name
                                                                        ~ Bytecode ID: 117
                                                                        ~ Registers Used: R0-R6
                                                                        ~ Type Information: Available
                                                                ]]
																v9:Destroy()
																local v0 = Ray.new(
																	v17.PrimaryPart.CFrame.Position,
																	HumanoidRootPart.CFrame.LookVector
																)
																local v1, v2 = workspace:FindPartOnRay(v0, v17)
																if not v1 then
																	v36:Stop(0.1)
																	v43:Play()
																	local v3 =
																		Instance.new("BodyVelocity", HumanoidRootPart)
																	v3.Velocity = Vector3.zero
																	v3.MaxForce = Vector3.new(20000, 2e+05, 20000)
																	v10.Debris(v3, 1)
																	local function anon_23811_116()
																		--[[ 
                                                                            Fission ~~ Function Information:
                                                                                ~ Upvalue Count: 4
                                                                                ~ Argument Count: 0
                                                                                ~ Debug Name: anon/no name
                                                                                ~ Bytecode ID: 116
                                                                                ~ Registers Used: R0-R3
                                                                                ~ Type Information: Available
                                                                        ]]
																		task.wait(0.1)
																		v3:Destroy()
																		v60 = false
																		local v0 = Instance.new("BodyVelocity")
																		v0.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
																		v0.Velocity = HumanoidRootPart.CFrame.LookVector
																				* -15
																			+ Vector3.new(0, 50, 0)
																		v0.Parent = HumanoidRootPart
																		v10.Debris(v0, 0.1)
																	end
																	task.spawn(anon_23811_116)
																	return
																end
																if v1.Transparency == 1 or v1.CanCollide == false then
																	v36:Stop(0.1)
																	v43:Play()
																	local v3 =
																		Instance.new("BodyVelocity", HumanoidRootPart)
																	v3.Velocity = Vector3.zero
																	v3.MaxForce = Vector3.new(20000, 2e+05, 20000)
																	v10.Debris(v3, 1)
																	anon_23811_116 = function()
																		--[[ 
                                                                            Fission ~~ Function Information:
                                                                                ~ Upvalue Count: 4
                                                                                ~ Argument Count: 0
                                                                                ~ Debug Name: anon/no name
                                                                                ~ Bytecode ID: 116
                                                                                ~ Registers Used: R0-R3
                                                                                ~ Type Information: Available
                                                                        ]]
																		task.wait(0.1)
																		v3:Destroy()
																		v60 = false
																		local v0 = Instance.new("BodyVelocity")
																		v0.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
																		v0.Velocity = HumanoidRootPart.CFrame.LookVector
																				* -15
																			+ Vector3.new(0, 50, 0)
																		v0.Parent = HumanoidRootPart
																		v10.Debris(v0, 0.1)
																	end
																	task.spawn(anon_23811_116)
																	return
																else
																	local v3 = Instance.new("BodyVelocity")
																	v3.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
																	v3.Velocity = HumanoidRootPart.CFrame.LookVector * 1
																		+ Vector3.new(0, 35, 0)
																	v3.Parent = HumanoidRootPart
																	v10.Debris(v3, 0.1)
																	v60 = false
																	task.wait(0.2)
																	return
																end
															end)
															return
														end
													end
												end
											end
										end
									end
								end
								if v65 == true then
									v24:Stop()
									local v8 = RaycastParams.new()
									v8.FilterType = Enum.RaycastFilterType.Exclude
									v8.FilterDescendantsInstances = { v17 }
									v9 = false
									v65 = false
									v100:Play()
									v100:AdjustSpeed(1.4)
									v49 = false
									v10_121 = Humanoid.WalkSpeed
									Humanoid.WalkSpeed = 5
									Humanoid.JumpPower = 0
									task.wait(0.18)
									local v11 = Instance.new("BodyVelocity")
									v11.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
									v11.Velocity = HumanoidRootPart.CFrame.LookVector * 60 + Vector3.new(0, 30, 0)
									v11.Parent = HumanoidRootPart
									v10.Debris(v11, 0.4)
									v99:Play()
									task.wait(0.25)
									v12 = nil
									local v51_RunService: RunService = game:GetService("RunService")
									local v13_121 = RunService.Heartbeat:Connect(function()
										--[[ 
                                            Fission ~~ Function Information:
                                                ~ Upvalue Count: 7
                                                ~ Argument Count: 0
                                                ~ Debug Name: anon/no name
                                                ~ Bytecode ID: 118
                                                ~ Registers Used: R0-R5
                                                ~ Type Information: Unavailable
                                        ]]
										local v1 =
											workspace:Raycast(HumanoidRootPart.Position, Vector3.new(0, -4.5, 0), v8)
										if not v1 then
											return
										end
										if not v1.Instance then
											return
										end
										v12:Disconnect()
										v12 = nil
										v9 = true
										v99:Stop()
										Humanoid.WalkSpeed = v10_121
										Humanoid.JumpPower = 47
										return
									end)
									v12 = v13_121
									task.delay(3, function()
										--[[ 
                                            Fission ~~ Function Information:
                                                ~ Upvalue Count: 5
                                                ~ Argument Count: 0
                                                ~ Debug Name: anon/no name
                                                ~ Bytecode ID: 119
                                                ~ Registers Used: R0-R1
                                                ~ Type Information: Unavailable
                                        ]]
										if not v12 then
											return
										end
										v12:Disconnect()
										v12 = nil
										v9 = true
										v99:Stop()
										Humanoid.WalkSpeed = v10_121
										Humanoid.JumpPower = 47
										return
									end)
									return
								end
								task.spawn(function()
									--[[ 
                                        Fission ~~ Function Information:
                                            ~ Upvalue Count: 3
                                            ~ Argument Count: 0
                                            ~ Debug Name: anon/no name
                                            ~ Bytecode ID: 120
                                            ~ Registers Used: R0-R2
                                            ~ Type Information: Unavailable
                                    ]]
									if v57 then
										return
									end
									if v60 == true then
										return
									end
									if not anon_53_35() then
										return
									end
									v57 = true
									task.wait(0.15)
									repeat
										local v1 = task.wait
										v1()
										v1 = v60

									until v1 == false
									v57 = false
									return
								end)
							end
							if arg0.KeyCode ~= Enum.KeyCode.Backspace then
								return
							end
							if not v17:FindFirstChildOfClass("Tool") then
								return
							end
							local Tool: Tool = v17:FindFirstChildOfClass("Tool")
							if not Tool:FindFirstChild("Droppable") then
								return
							end
							v6.DropItem:FireServer(Tool)
							return
						end
					end
				end
			end
		end
		if v13.IsInput("Carry", arg0) then
			if v67 ~= true or v15.PlayerGui.Dialogue.Enabled ~= false then
			end
			v6.UnCarry:FireServer(v49)
			v42:Stop()
			v67 = false
			if arg0.KeyCode == Enum.KeyCode.W then
				if not v17:GetAttribute("Swimming") then
					if v61 == false then
						if not v17:GetAttribute("IsSwinging") then
							if not _G.CheckForStun(v17) then
								if not table.find(string.split(v15.Data.Injuries.Value, ","), "MissingLeg") then
									if v73 == false then
										if v15.Data.AutoRun.Value == false then
											v73 = true
										end
										task.delay(0.4, function()
											--[[ 
                                                Fission ~~ Function Information:
                                                    ~ Upvalue Count: 1
                                                    ~ Argument Count: 0
                                                    ~ Debug Name: anon/no name
                                                    ~ Bytecode ID: 113
                                                    ~ Registers Used: R0-R0
                                                    ~ Type Information: Unavailable
                                            ]]
											if not v73 then
												return
											end
											v73 = false
											return
										end)
									end
									RunFunc()
									task.delay(0.4, function()
										--[[ 
                                            Fission ~~ Function Information:
                                                ~ Upvalue Count: 1
                                                ~ Argument Count: 0
                                                ~ Debug Name: anon/no name
                                                ~ Bytecode ID: 113
                                                ~ Registers Used: R0-R0
                                                ~ Type Information: Unavailable
                                        ]]
										if not v73 then
											return
										end
										v73 = false
										return
									end)
								end
							end
						end
					end
				end
			end
			if arg0.KeyCode == Enum.KeyCode.Space then
				if v117 == true then
					ZipLineTravel("Stop")
				end
				local v3 = RaycastParams.new()
				v3.FilterType = Enum.RaycastFilterType.Include
				v5 = workspace.Map
				v3.FilterDescendantsInstances = { v5 }
				local v8 = CFrame.new(0, 0, 1.5)
				local v4 = workspace:Raycast(
					HumanoidRootPart.CFrame * v8.Position,
					HumanoidRootPart.CFrame.LookVector * 5.5,
					v3
				)
				if Humanoid.FloorMaterial == Enum.Material.Air then
					if v4 then
						if v4.Instance then
							if v4.Instance:IsA("BasePart") then
								if not v4.Instance:HasTag("Climbable") then
									if _G.CheckForStun(v17) then
										return
									end
									if v57 then
										return
									end
									v5 = v4.Instance
									v6_121 = v5.CFrame
									v7 = v5.Size / 2
									v8 = {
										v9,
										v6_121 * Vector3.new(-v7.X, v7.Y, v7.Z),
										v6_121 * Vector3.new(v7.X, v7.Y, -v7.Z),
										v6_121 * Vector3.new(-v7.X, v7.Y, -v17_121),
									}
									v9 = v6_121 * Vector3.new(v7.X, v7.Y, v7.Z)
									v17_121 = v7.Z
									v10_121 = math.max(v10_121.Y, v11.Y, v12.Y, v13_121.Y) - HumanoidRootPart.Position.Y
									local v11: number = math.clamp(v10_121 / 7, 0, 1)
									if v10_121 < 7 then
										v37:Play()
										print("CanLedgeClimb")
										v57 = true
										task.delay(0.4, function()
											--[[ 
                                                Fission ~~ Function Information:
                                                    ~ Upvalue Count: 1
                                                    ~ Argument Count: 0
                                                    ~ Debug Name: anon/no name
                                                    ~ Bytecode ID: 114
                                                    ~ Registers Used: R0-R0
                                                    ~ Type Information: Unavailable
                                            ]]
											v57 = false
										end)
										local v12 = Instance.new("BodyVelocity")
										v13_121 = v11 * 50 + 15
										v12.Velocity = HumanoidRootPart.CFrame.LookVector * 20
											+ Vector3.new(0, v13_121, 0)
										v12.MaxForce = Vector3.new(50000, 50000, 50000)
										v12.Parent = HumanoidRootPart
										v10.Debris(v12, 0.15)
										return
									end
								end
							end
						end
					end
				end
				local v5 = Ray.new(HumanoidRootPart.CFrame.Position, HumanoidRootPart.CFrame.LookVector * 2.5)
				local v6_121 = workspace:FindPartOnRay(v5, v17)
				if v6_121 then
					if v65 == false then
						if Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
							if v70 == false then
								if v6_121.Transparency < 1 then
									if v6_121.CanCollide == true then
										if v6_121:HasTag("ClimbableWall") then
											v6.FallDamage:FireServer(
												false,
												HumanoidRootPart.AssemblyLinearVelocity.Y * -2
											)
											task.spawn(function()
												--[[ 
                                                    Fission ~~ Function Information:
                                                        ~ Upvalue Count: 2
                                                        ~ Argument Count: 0
                                                        ~ Debug Name: anon/no name
                                                        ~ Bytecode ID: 115
                                                        ~ Registers Used: R0-R1
                                                        ~ Type Information: Unavailable
                                                ]]
												v70 = true
												repeat
													local v0 = task.wait
													v0()
													v0 = Humanoid
													local v0, v1 = v0:GetState()
													v1 = Enum.HumanoidStateType.Freefall

												until v0 ~= v1
												task.wait(0.2)
												v70 = false
												return
											end)
											v60 = true
											v36:Play()
											v36:AdjustSpeed(1.3)
											local v9 = Instance.new("BodyVelocity")
											v9.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
											v9.Velocity = HumanoidRootPart.CFrame.LookVector + Vector3.new(0, 35, 0)
											v9.Parent = HumanoidRootPart
											v10.Debris(v9, 0.4)
											task.delay(0.25, function()
												--[[ 
                                                    Fission ~~ Function Information:
                                                        ~ Upvalue Count: 7
                                                        ~ Argument Count: 0
                                                        ~ Debug Name: anon/no name
                                                        ~ Bytecode ID: 117
                                                        ~ Registers Used: R0-R6
                                                        ~ Type Information: Available
                                                ]]
												v9:Destroy()
												local v0 = Ray.new(
													v17.PrimaryPart.CFrame.Position,
													HumanoidRootPart.CFrame.LookVector
												)
												local v1, v2 = workspace:FindPartOnRay(v0, v17)
												if not v1 then
													v36:Stop(0.1)
													v43:Play()
													local v3 = Instance.new("BodyVelocity", HumanoidRootPart)
													v3.Velocity = Vector3.zero
													v3.MaxForce = Vector3.new(20000, 2e+05, 20000)
													v10.Debris(v3, 1)
													local function anon_31322_116()
														--[[ 
                                                            Fission ~~ Function Information:
                                                                ~ Upvalue Count: 4
                                                                ~ Argument Count: 0
                                                                ~ Debug Name: anon/no name
                                                                ~ Bytecode ID: 116
                                                                ~ Registers Used: R0-R3
                                                                ~ Type Information: Available
                                                        ]]
														task.wait(0.1)
														v3:Destroy()
														v60 = false
														local v0 = Instance.new("BodyVelocity")
														v0.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
														v0.Velocity = HumanoidRootPart.CFrame.LookVector * -15
															+ Vector3.new(0, 50, 0)
														v0.Parent = HumanoidRootPart
														v10.Debris(v0, 0.1)
													end
													task.spawn(anon_31322_116)
													return
												end
												if v1.Transparency == 1 or v1.CanCollide == false then
													v36:Stop(0.1)
													v43:Play()
													local v3 = Instance.new("BodyVelocity", HumanoidRootPart)
													v3.Velocity = Vector3.zero
													v3.MaxForce = Vector3.new(20000, 2e+05, 20000)
													v10.Debris(v3, 1)
													anon_31322_116 = function()
														--[[ 
                                                            Fission ~~ Function Information:
                                                                ~ Upvalue Count: 4
                                                                ~ Argument Count: 0
                                                                ~ Debug Name: anon/no name
                                                                ~ Bytecode ID: 116
                                                                ~ Registers Used: R0-R3
                                                                ~ Type Information: Available
                                                        ]]
														task.wait(0.1)
														v3:Destroy()
														v60 = false
														local v0 = Instance.new("BodyVelocity")
														v0.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
														v0.Velocity = HumanoidRootPart.CFrame.LookVector * -15
															+ Vector3.new(0, 50, 0)
														v0.Parent = HumanoidRootPart
														v10.Debris(v0, 0.1)
													end
													task.spawn(anon_31322_116)
													return
												else
													local v3 = Instance.new("BodyVelocity")
													v3.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
													v3.Velocity = HumanoidRootPart.CFrame.LookVector * 1
														+ Vector3.new(0, 35, 0)
													v3.Parent = HumanoidRootPart
													v10.Debris(v3, 0.1)
													v60 = false
													task.wait(0.2)
													return
												end
											end)
											return
										end
									end
								end
							end
						end
					end
				end
				if v65 == true then
					v24:Stop()
					local v8 = RaycastParams.new()
					v8.FilterType = Enum.RaycastFilterType.Exclude
					v8.FilterDescendantsInstances = { v17 }
					v9 = false
					v65 = false
					v100:Play()
					v100:AdjustSpeed(1.4)
					v49 = false
					v10_121 = Humanoid.WalkSpeed
					Humanoid.WalkSpeed = 5
					Humanoid.JumpPower = 0
					task.wait(0.18)
					local v11 = Instance.new("BodyVelocity")
					v11.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
					v11.Velocity = HumanoidRootPart.CFrame.LookVector * 60 + Vector3.new(0, 30, 0)
					v11.Parent = HumanoidRootPart
					v10.Debris(v11, 0.4)
					v99:Play()
					task.wait(0.25)
					v12 = nil
					local v52_RunService: RunService = game:GetService("RunService")
					local v13_121 = RunService.Heartbeat:Connect(function()
						--[[ 
                            Fission ~~ Function Information:
                                ~ Upvalue Count: 7
                                ~ Argument Count: 0
                                ~ Debug Name: anon/no name
                                ~ Bytecode ID: 118
                                ~ Registers Used: R0-R5
                                ~ Type Information: Unavailable
                        ]]
						local v1 = workspace:Raycast(HumanoidRootPart.Position, Vector3.new(0, -4.5, 0), v8)
						if not v1 then
							return
						end
						if not v1.Instance then
							return
						end
						v12:Disconnect()
						v12 = nil
						v9 = true
						v99:Stop()
						Humanoid.WalkSpeed = v10_121
						Humanoid.JumpPower = 47
						return
					end)
					v12 = v13_121
					task.delay(3, function()
						--[[ 
                            Fission ~~ Function Information:
                                ~ Upvalue Count: 5
                                ~ Argument Count: 0
                                ~ Debug Name: anon/no name
                                ~ Bytecode ID: 119
                                ~ Registers Used: R0-R1
                                ~ Type Information: Unavailable
                        ]]
						if not v12 then
							return
						end
						v12:Disconnect()
						v12 = nil
						v9 = true
						v99:Stop()
						Humanoid.WalkSpeed = v10_121
						Humanoid.JumpPower = 47
						return
					end)
					return
				end
				task.spawn(function()
					--[[ 
                        Fission ~~ Function Information:
                            ~ Upvalue Count: 3
                            ~ Argument Count: 0
                            ~ Debug Name: anon/no name
                            ~ Bytecode ID: 120
                            ~ Registers Used: R0-R2
                            ~ Type Information: Unavailable
                    ]]
					if v57 then
						return
					end
					if v60 == true then
						return
					end
					if not anon_53_35() then
						return
					end
					v57 = true
					task.wait(0.15)
					repeat
						local v1 = task.wait
						v1()
						v1 = v60

					until v1 == false
					v57 = false
					return
				end)
			end
			if arg0.KeyCode ~= Enum.KeyCode.Backspace then
				return
			end
			if not v17:FindFirstChildOfClass("Tool") then
				return
			end
			local v53_Tool: Tool = v17:FindFirstChildOfClass("Tool")
			if not v53_Tool:FindFirstChild("Droppable") then
				return
			end
			v6.DropItem:FireServer(v53_Tool)
			return
		end
		if v67 then
			if not v17:HasTag("InSafeZone") then
				if v17:HasTag("InSparringZone") then
				end
			end
			v6.UnCarry:FireServer(v49)
			v42:Stop()
			v67 = false
		end
		if arg0.KeyCode == Enum.KeyCode.W then
			if not v17:GetAttribute("Swimming") then
				if v61 == false then
					if not v17:GetAttribute("IsSwinging") then
						if not _G.CheckForStun(v17) then
							if not table.find(string.split(v15.Data.Injuries.Value, ","), "MissingLeg") then
								if v73 == false then
									if v15.Data.AutoRun.Value == false then
										v73 = true
									end
									task.delay(0.4, function()
										--[[ 
                                            Fission ~~ Function Information:
                                                ~ Upvalue Count: 1
                                                ~ Argument Count: 0
                                                ~ Debug Name: anon/no name
                                                ~ Bytecode ID: 113
                                                ~ Registers Used: R0-R0
                                                ~ Type Information: Unavailable
                                        ]]
										if not v73 then
											return
										end
										v73 = false
										return
									end)
								end
								RunFunc()
								task.delay(0.4, function()
									--[[ 
                                        Fission ~~ Function Information:
                                            ~ Upvalue Count: 1
                                            ~ Argument Count: 0
                                            ~ Debug Name: anon/no name
                                            ~ Bytecode ID: 113
                                            ~ Registers Used: R0-R0
                                            ~ Type Information: Unavailable
                                    ]]
									if not v73 then
										return
									end
									v73 = false
									return
								end)
							end
						end
					end
				end
			end
		end
		if arg0.KeyCode == Enum.KeyCode.Space then
			if v117 == true then
				ZipLineTravel("Stop")
			end
			local v3 = RaycastParams.new()
			v3.FilterType = Enum.RaycastFilterType.Include
			v5 = workspace.Map
			v3.FilterDescendantsInstances = { v5 }
			local v8 = CFrame.new(0, 0, 1.5)
			local v4 =
				workspace:Raycast(HumanoidRootPart.CFrame * v8.Position, HumanoidRootPart.CFrame.LookVector * 5.5, v3)
			if Humanoid.FloorMaterial == Enum.Material.Air then
				if v4 then
					if v4.Instance then
						if v4.Instance:IsA("BasePart") then
							if not v4.Instance:HasTag("Climbable") then
								if _G.CheckForStun(v17) then
									return
								end
								if v57 then
									return
								end
								v5 = v4.Instance
								v6_121 = v5.CFrame
								v7 = v5.Size / 2
								v8 = {
									v9,
									v6_121 * Vector3.new(-v7.X, v7.Y, v7.Z),
									v6_121 * Vector3.new(v7.X, v7.Y, -v7.Z),
									v6_121 * Vector3.new(-v7.X, v7.Y, -v17_121),
								}
								v9 = v6_121 * Vector3.new(v7.X, v7.Y, v7.Z)
								v17_121 = v7.Z
								v10_121 = math.max(v10_121.Y, v11.Y, v12.Y, v13_121.Y) - HumanoidRootPart.Position.Y
								local v11: number = math.clamp(v10_121 / 7, 0, 1)
								if v10_121 < 7 then
									v37:Play()
									print("CanLedgeClimb")
									v57 = true
									task.delay(0.4, function()
										--[[ 
                                            Fission ~~ Function Information:
                                                ~ Upvalue Count: 1
                                                ~ Argument Count: 0
                                                ~ Debug Name: anon/no name
                                                ~ Bytecode ID: 114
                                                ~ Registers Used: R0-R0
                                                ~ Type Information: Unavailable
                                        ]]
										v57 = false
									end)
									local v12 = Instance.new("BodyVelocity")
									v13_121 = v11 * 50 + 15
									v12.Velocity = HumanoidRootPart.CFrame.LookVector * 20 + Vector3.new(0, v13_121, 0)
									v12.MaxForce = Vector3.new(50000, 50000, 50000)
									v12.Parent = HumanoidRootPart
									v10.Debris(v12, 0.15)
									return
								end
							end
						end
					end
				end
			end
			local v5 = Ray.new(HumanoidRootPart.CFrame.Position, HumanoidRootPart.CFrame.LookVector * 2.5)
			local v6_121 = workspace:FindPartOnRay(v5, v17)
			if v6_121 then
				if v65 == false then
					if Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
						if v70 == false then
							if v6_121.Transparency < 1 then
								if v6_121.CanCollide == true then
									if v6_121:HasTag("ClimbableWall") then
										v6.FallDamage:FireServer(false, HumanoidRootPart.AssemblyLinearVelocity.Y * -2)
										task.spawn(function()
											--[[ 
                                                Fission ~~ Function Information:
                                                    ~ Upvalue Count: 2
                                                    ~ Argument Count: 0
                                                    ~ Debug Name: anon/no name
                                                    ~ Bytecode ID: 115
                                                    ~ Registers Used: R0-R1
                                                    ~ Type Information: Unavailable
                                            ]]
											v70 = true
											repeat
												local v0 = task.wait
												v0()
												v0 = Humanoid
												local v0, v1 = v0:GetState()
												v1 = Enum.HumanoidStateType.Freefall

											until v0 ~= v1
											task.wait(0.2)
											v70 = false
											return
										end)
										v60 = true
										v36:Play()
										v36:AdjustSpeed(1.3)
										local v9 = Instance.new("BodyVelocity")
										v9.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
										v9.Velocity = HumanoidRootPart.CFrame.LookVector + Vector3.new(0, 35, 0)
										v9.Parent = HumanoidRootPart
										v10.Debris(v9, 0.4)
										task.delay(0.25, function()
											--[[ 
                                                Fission ~~ Function Information:
                                                    ~ Upvalue Count: 7
                                                    ~ Argument Count: 0
                                                    ~ Debug Name: anon/no name
                                                    ~ Bytecode ID: 117
                                                    ~ Registers Used: R0-R6
                                                    ~ Type Information: Available
                                            ]]
											v9:Destroy()
											local v0 = Ray.new(
												v17.PrimaryPart.CFrame.Position,
												HumanoidRootPart.CFrame.LookVector
											)
											local v1, v2 = workspace:FindPartOnRay(v0, v17)
											if not v1 then
												v36:Stop(0.1)
												v43:Play()
												local v3 = Instance.new("BodyVelocity", HumanoidRootPart)
												v3.Velocity = Vector3.zero
												v3.MaxForce = Vector3.new(20000, 2e+05, 20000)
												v10.Debris(v3, 1)
												local function anon_30333_116()
													--[[ 
                                                        Fission ~~ Function Information:
                                                            ~ Upvalue Count: 4
                                                            ~ Argument Count: 0
                                                            ~ Debug Name: anon/no name
                                                            ~ Bytecode ID: 116
                                                            ~ Registers Used: R0-R3
                                                            ~ Type Information: Available
                                                    ]]
													task.wait(0.1)
													v3:Destroy()
													v60 = false
													local v0 = Instance.new("BodyVelocity")
													v0.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
													v0.Velocity = HumanoidRootPart.CFrame.LookVector * -15
														+ Vector3.new(0, 50, 0)
													v0.Parent = HumanoidRootPart
													v10.Debris(v0, 0.1)
												end
												task.spawn(anon_30333_116)
												return
											end
											if v1.Transparency == 1 or v1.CanCollide == false then
												v36:Stop(0.1)
												v43:Play()
												local v3 = Instance.new("BodyVelocity", HumanoidRootPart)
												v3.Velocity = Vector3.zero
												v3.MaxForce = Vector3.new(20000, 2e+05, 20000)
												v10.Debris(v3, 1)
												anon_30333_116 = function()
													--[[ 
                                                        Fission ~~ Function Information:
                                                            ~ Upvalue Count: 4
                                                            ~ Argument Count: 0
                                                            ~ Debug Name: anon/no name
                                                            ~ Bytecode ID: 116
                                                            ~ Registers Used: R0-R3
                                                            ~ Type Information: Available
                                                    ]]
													task.wait(0.1)
													v3:Destroy()
													v60 = false
													local v0 = Instance.new("BodyVelocity")
													v0.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
													v0.Velocity = HumanoidRootPart.CFrame.LookVector * -15
														+ Vector3.new(0, 50, 0)
													v0.Parent = HumanoidRootPart
													v10.Debris(v0, 0.1)
												end
												task.spawn(anon_30333_116)
												return
											else
												local v3 = Instance.new("BodyVelocity")
												v3.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
												v3.Velocity = HumanoidRootPart.CFrame.LookVector * 1
													+ Vector3.new(0, 35, 0)
												v3.Parent = HumanoidRootPart
												v10.Debris(v3, 0.1)
												v60 = false
												task.wait(0.2)
												return
											end
										end)
										return
									end
								end
							end
						end
					end
				end
			end
			if v65 == true then
				v24:Stop()
				local v8 = RaycastParams.new()
				v8.FilterType = Enum.RaycastFilterType.Exclude
				v8.FilterDescendantsInstances = { v17 }
				v9 = false
				v65 = false
				v100:Play()
				v100:AdjustSpeed(1.4)
				v49 = false
				v10_121 = Humanoid.WalkSpeed
				Humanoid.WalkSpeed = 5
				Humanoid.JumpPower = 0
				task.wait(0.18)
				local v11 = Instance.new("BodyVelocity")
				v11.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
				v11.Velocity = HumanoidRootPart.CFrame.LookVector * 60 + Vector3.new(0, 30, 0)
				v11.Parent = HumanoidRootPart
				v10.Debris(v11, 0.4)
				v99:Play()
				task.wait(0.25)
				v12 = nil
				local v54_RunService: RunService = game:GetService("RunService")
				local v13_121 = RunService.Heartbeat:Connect(function()
					--[[ 
                        Fission ~~ Function Information:
                            ~ Upvalue Count: 7
                            ~ Argument Count: 0
                            ~ Debug Name: anon/no name
                            ~ Bytecode ID: 118
                            ~ Registers Used: R0-R5
                            ~ Type Information: Unavailable
                    ]]
					local v1 = workspace:Raycast(HumanoidRootPart.Position, Vector3.new(0, -4.5, 0), v8)
					if not v1 then
						return
					end
					if not v1.Instance then
						return
					end
					v12:Disconnect()
					v12 = nil
					v9 = true
					v99:Stop()
					Humanoid.WalkSpeed = v10_121
					Humanoid.JumpPower = 47
					return
				end)
				v12 = v13_121
				task.delay(3, function()
					--[[ 
                        Fission ~~ Function Information:
                            ~ Upvalue Count: 5
                            ~ Argument Count: 0
                            ~ Debug Name: anon/no name
                            ~ Bytecode ID: 119
                            ~ Registers Used: R0-R1
                            ~ Type Information: Unavailable
                    ]]
					if not v12 then
						return
					end
					v12:Disconnect()
					v12 = nil
					v9 = true
					v99:Stop()
					Humanoid.WalkSpeed = v10_121
					Humanoid.JumpPower = 47
					return
				end)
				return
			end
			task.spawn(function()
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 3
                        ~ Argument Count: 0
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 120
                        ~ Registers Used: R0-R2
                        ~ Type Information: Unavailable
                ]]
				if v57 then
					return
				end
				if v60 == true then
					return
				end
				if not anon_53_35() then
					return
				end
				v57 = true
				task.wait(0.15)
				repeat
					local v1 = task.wait
					v1()
					v1 = v60

				until v1 == false
				v57 = false
				return
			end)
		end
		if arg0.KeyCode ~= Enum.KeyCode.Backspace then
			return
		end
		if not v17:FindFirstChildOfClass("Tool") then
			return
		end
		local v55_Tool: Tool = v17:FindFirstChildOfClass("Tool")
		if not v55_Tool:FindFirstChild("Droppable") then
			return
		end
		v6.DropItem:FireServer(v55_Tool)
		return
	end
	if arg0.KeyCode == Enum.KeyCode.E then
		FocusNPCs()
		return
	end
	if arg0.KeyCode == Enum.KeyCode.E then
		if v15.PlayerGui.OverlayGui.PromptVisual.Visible == false then
			EquipWeapon()
		end
	end
	if v52 == true then
		if arg0.UserInputType == Enum.UserInputType.MouseButton1 then
			if not v17:FindFirstChild("GunAttackCD") then
				ShootGun()
			end
		end
	end
	if v13.IsInput("Parry", arg0) then
		local v2 = UserInputService:IsKeyDown(Enum.KeyCode.LeftControl)
		if not v2 then
			v2 = UserInputService:IsKeyDown(Enum.KeyCode.LeftAlt)
		end
		if v2 == false then
			if v66 == true then
				if not v17:FindFirstChild("LightAttack") then
					if not v17:FindFirstChild("Knocked") then
						if not v17:FindFirstChild("Ragdolled") then
							Parry()
						end
					end
				end
			end
		end
	end
	if v13.IsInput("Block", arg0) then
		if not v61 then
			if v66 then
				Block(arg0)
				return
			end
		end
	end
	if arg0.KeyCode == Enum.KeyCode.Space then
		if v60 == false then
			if not v17:GetAttribute("Swimming") then
				RagdollEvasive()
			end
		end
	end
	if arg0.KeyCode == Enum.KeyCode.Q then
		if v60 == false then
			if not v17:GetAttribute("Swimming") then
				Dash()
			end
		end
	end
	if v13.IsInput("LightAttack", arg0) then
		WeaponLightAttack()
	end
	if _G.CheckForStun(v17) then
		return
	end
	if v17:GetAttribute("IsSwinging") then
		return
	end
	if v17:FindFirstChild("UsingMove") then
		return
	end
	if v17:FindFirstChild("LightAttack") then
		return
	end
	if v13.IsInput("Critical", arg0) then
		PounceFollowup()
	end
	if v13.IsInput("Critical", arg0) then
		CriticalAttack()
	end
	if v17:GetAttribute("Dodging") then
		return
	end
	if arg0.UserInputType == Enum.UserInputType.MouseButton2 then
		if not UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
			if UserInputService:IsKeyDown(Enum.KeyCode.LeftAlt) then
			end
		end
		if v66 == true then
			GunAim()
		end
	end
	if v13.IsInput("ManifestEGO", arg0) then
		if v17:GetAttribute("EmotionLevel") ~= 2 or v63 == true then
			return
		end
		anon_54_36()
	end
	if table.find(v47, "ShinAndMang") then
		if v13.IsInput("ShinGain", arg0) then
			if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
				ShinAndMang()
				return
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.LeftMeta) then
				ShinAndMang()
				return
			end
		end
	end
	if not v17:HasTag("InSafeZone") then
		if not v17:HasTag("InSparringZone") then
			if v13.IsInput("Execute", arg0) then
				if v64 == false then
					Execute()
				end
			end
		end
	end
	if not v17:HasTag("InSafeZone") then
		if not v17:HasTag("InSparringZone") then
			if v13.IsInput("Carry", arg0) then
				if v67 == false then
					if v64 == false then
						if v15.PlayerGui.Dialogue.Enabled == false then
							Carry()
						end
						if arg0.KeyCode == Enum.KeyCode.W then
							if not v17:GetAttribute("Swimming") then
								if v61 == false then
									if not v17:GetAttribute("IsSwinging") then
										if not _G.CheckForStun(v17) then
											if
												not table.find(string.split(v15.Data.Injuries.Value, ","), "MissingLeg")
											then
												if v73 == false then
													if v15.Data.AutoRun.Value == false then
														v73 = true
													end
													task.delay(0.4, function()
														--[[ 
                                                            Fission ~~ Function Information:
                                                                ~ Upvalue Count: 1
                                                                ~ Argument Count: 0
                                                                ~ Debug Name: anon/no name
                                                                ~ Bytecode ID: 113
                                                                ~ Registers Used: R0-R0
                                                                ~ Type Information: Unavailable
                                                        ]]
														if not v73 then
															return
														end
														v73 = false
														return
													end)
												end
												RunFunc()
												task.delay(0.4, function()
													--[[ 
                                                        Fission ~~ Function Information:
                                                            ~ Upvalue Count: 1
                                                            ~ Argument Count: 0
                                                            ~ Debug Name: anon/no name
                                                            ~ Bytecode ID: 113
                                                            ~ Registers Used: R0-R0
                                                            ~ Type Information: Unavailable
                                                    ]]
													if not v73 then
														return
													end
													v73 = false
													return
												end)
											end
										end
									end
								end
							end
						end
						if arg0.KeyCode == Enum.KeyCode.Space then
							if v117 == true then
								ZipLineTravel("Stop")
							end
							local v3 = RaycastParams.new()
							v3.FilterType = Enum.RaycastFilterType.Include
							v5 = workspace.Map
							v3.FilterDescendantsInstances = { v5 }
							local v8 = CFrame.new(0, 0, 1.5)
							local v4 = workspace:Raycast(
								HumanoidRootPart.CFrame * v8.Position,
								HumanoidRootPart.CFrame.LookVector * 5.5,
								v3
							)
							if Humanoid.FloorMaterial == Enum.Material.Air then
								if v4 then
									if v4.Instance then
										if v4.Instance:IsA("BasePart") then
											if not v4.Instance:HasTag("Climbable") then
												if _G.CheckForStun(v17) then
													return
												end
												if v57 then
													return
												end
												v5 = v4.Instance
												v6_121 = v5.CFrame
												v7 = v5.Size / 2
												v8 = {
													v9,
													v6_121 * Vector3.new(-v7.X, v7.Y, v7.Z),
													v6_121 * Vector3.new(v7.X, v7.Y, -v7.Z),
													v6_121 * Vector3.new(-v7.X, v7.Y, -v17_121),
												}
												v9 = v6_121 * Vector3.new(v7.X, v7.Y, v7.Z)
												v17_121 = v7.Z
												v10_121 = math.max(v10_121.Y, v11.Y, v12.Y, v13_121.Y)
													- HumanoidRootPart.Position.Y
												local v11: number = math.clamp(v10_121 / 7, 0, 1)
												if v10_121 < 7 then
													v37:Play()
													print("CanLedgeClimb")
													v57 = true
													task.delay(0.4, function()
														--[[ 
                                                            Fission ~~ Function Information:
                                                                ~ Upvalue Count: 1
                                                                ~ Argument Count: 0
                                                                ~ Debug Name: anon/no name
                                                                ~ Bytecode ID: 114
                                                                ~ Registers Used: R0-R0
                                                                ~ Type Information: Unavailable
                                                        ]]
														v57 = false
													end)
													local v12 = Instance.new("BodyVelocity")
													v13_121 = v11 * 50 + 15
													v12.Velocity = HumanoidRootPart.CFrame.LookVector * 20
														+ Vector3.new(0, v13_121, 0)
													v12.MaxForce = Vector3.new(50000, 50000, 50000)
													v12.Parent = HumanoidRootPart
													v10.Debris(v12, 0.15)
													return
												end
											end
										end
									end
								end
							end
							local v5 =
								Ray.new(HumanoidRootPart.CFrame.Position, HumanoidRootPart.CFrame.LookVector * 2.5)
							local v6_121 = workspace:FindPartOnRay(v5, v17)
							if v6_121 then
								if v65 == false then
									if Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
										if v70 == false then
											if v6_121.Transparency < 1 then
												if v6_121.CanCollide == true then
													if v6_121:HasTag("ClimbableWall") then
														v6.FallDamage:FireServer(
															false,
															HumanoidRootPart.AssemblyLinearVelocity.Y * -2
														)
														task.spawn(function()
															--[[ 
                                                                Fission ~~ Function Information:
                                                                    ~ Upvalue Count: 2
                                                                    ~ Argument Count: 0
                                                                    ~ Debug Name: anon/no name
                                                                    ~ Bytecode ID: 115
                                                                    ~ Registers Used: R0-R1
                                                                    ~ Type Information: Unavailable
                                                            ]]
															v70 = true
															repeat
																local v0 = task.wait
																v0()
																v0 = Humanoid
																local v0, v1 = v0:GetState()
																v1 = Enum.HumanoidStateType.Freefall

															until v0 ~= v1
															task.wait(0.2)
															v70 = false
															return
														end)
														v60 = true
														v36:Play()
														v36:AdjustSpeed(1.3)
														local v9 = Instance.new("BodyVelocity")
														v9.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
														v9.Velocity = HumanoidRootPart.CFrame.LookVector
															+ Vector3.new(0, 35, 0)
														v9.Parent = HumanoidRootPart
														v10.Debris(v9, 0.4)
														task.delay(0.25, function()
															--[[ 
                                                                Fission ~~ Function Information:
                                                                    ~ Upvalue Count: 7
                                                                    ~ Argument Count: 0
                                                                    ~ Debug Name: anon/no name
                                                                    ~ Bytecode ID: 117
                                                                    ~ Registers Used: R0-R6
                                                                    ~ Type Information: Available
                                                            ]]
															v9:Destroy()
															local v0 = Ray.new(
																v17.PrimaryPart.CFrame.Position,
																HumanoidRootPart.CFrame.LookVector
															)
															local v1, v2 = workspace:FindPartOnRay(v0, v17)
															if not v1 then
																v36:Stop(0.1)
																v43:Play()
																local v3 =
																	Instance.new("BodyVelocity", HumanoidRootPart)
																v3.Velocity = Vector3.zero
																v3.MaxForce = Vector3.new(20000, 2e+05, 20000)
																v10.Debris(v3, 1)
																local function anon_17673_116()
																	--[[ 
                                                                        Fission ~~ Function Information:
                                                                            ~ Upvalue Count: 4
                                                                            ~ Argument Count: 0
                                                                            ~ Debug Name: anon/no name
                                                                            ~ Bytecode ID: 116
                                                                            ~ Registers Used: R0-R3
                                                                            ~ Type Information: Available
                                                                    ]]
																	task.wait(0.1)
																	v3:Destroy()
																	v60 = false
																	local v0 = Instance.new("BodyVelocity")
																	v0.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
																	v0.Velocity = HumanoidRootPart.CFrame.LookVector
																			* -15
																		+ Vector3.new(0, 50, 0)
																	v0.Parent = HumanoidRootPart
																	v10.Debris(v0, 0.1)
																end
																task.spawn(anon_17673_116)
																return
															end
															if v1.Transparency == 1 or v1.CanCollide == false then
																v36:Stop(0.1)
																v43:Play()
																local v3 =
																	Instance.new("BodyVelocity", HumanoidRootPart)
																v3.Velocity = Vector3.zero
																v3.MaxForce = Vector3.new(20000, 2e+05, 20000)
																v10.Debris(v3, 1)
																anon_17673_116 = function()
																	--[[ 
                                                                        Fission ~~ Function Information:
                                                                            ~ Upvalue Count: 4
                                                                            ~ Argument Count: 0
                                                                            ~ Debug Name: anon/no name
                                                                            ~ Bytecode ID: 116
                                                                            ~ Registers Used: R0-R3
                                                                            ~ Type Information: Available
                                                                    ]]
																	task.wait(0.1)
																	v3:Destroy()
																	v60 = false
																	local v0 = Instance.new("BodyVelocity")
																	v0.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
																	v0.Velocity = HumanoidRootPart.CFrame.LookVector
																			* -15
																		+ Vector3.new(0, 50, 0)
																	v0.Parent = HumanoidRootPart
																	v10.Debris(v0, 0.1)
																end
																task.spawn(anon_17673_116)
																return
															else
																local v3 = Instance.new("BodyVelocity")
																v3.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
																v3.Velocity = HumanoidRootPart.CFrame.LookVector * 1
																	+ Vector3.new(0, 35, 0)
																v3.Parent = HumanoidRootPart
																v10.Debris(v3, 0.1)
																v60 = false
																task.wait(0.2)
																return
															end
														end)
														return
													end
												end
											end
										end
									end
								end
							end
							if v65 == true then
								v24:Stop()
								local v8 = RaycastParams.new()
								v8.FilterType = Enum.RaycastFilterType.Exclude
								v8.FilterDescendantsInstances = { v17 }
								v9 = false
								v65 = false
								v100:Play()
								v100:AdjustSpeed(1.4)
								v49 = false
								v10_121 = Humanoid.WalkSpeed
								Humanoid.WalkSpeed = 5
								Humanoid.JumpPower = 0
								task.wait(0.18)
								local v11 = Instance.new("BodyVelocity")
								v11.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
								v11.Velocity = HumanoidRootPart.CFrame.LookVector * 60 + Vector3.new(0, 30, 0)
								v11.Parent = HumanoidRootPart
								v10.Debris(v11, 0.4)
								v99:Play()
								task.wait(0.25)
								v12 = nil
								local v56_RunService: RunService = game:GetService("RunService")
								local v13_121 = RunService.Heartbeat:Connect(function()
									--[[ 
                                        Fission ~~ Function Information:
                                            ~ Upvalue Count: 7
                                            ~ Argument Count: 0
                                            ~ Debug Name: anon/no name
                                            ~ Bytecode ID: 118
                                            ~ Registers Used: R0-R5
                                            ~ Type Information: Unavailable
                                    ]]
									local v1 = workspace:Raycast(HumanoidRootPart.Position, Vector3.new(0, -4.5, 0), v8)
									if not v1 then
										return
									end
									if not v1.Instance then
										return
									end
									v12:Disconnect()
									v12 = nil
									v9 = true
									v99:Stop()
									Humanoid.WalkSpeed = v10_121
									Humanoid.JumpPower = 47
									return
								end)
								v12 = v13_121
								task.delay(3, function()
									--[[ 
                                        Fission ~~ Function Information:
                                            ~ Upvalue Count: 5
                                            ~ Argument Count: 0
                                            ~ Debug Name: anon/no name
                                            ~ Bytecode ID: 119
                                            ~ Registers Used: R0-R1
                                            ~ Type Information: Unavailable
                                    ]]
									if not v12 then
										return
									end
									v12:Disconnect()
									v12 = nil
									v9 = true
									v99:Stop()
									Humanoid.WalkSpeed = v10_121
									Humanoid.JumpPower = 47
									return
								end)
								return
							end
							task.spawn(function()
								--[[ 
                                    Fission ~~ Function Information:
                                        ~ Upvalue Count: 3
                                        ~ Argument Count: 0
                                        ~ Debug Name: anon/no name
                                        ~ Bytecode ID: 120
                                        ~ Registers Used: R0-R2
                                        ~ Type Information: Unavailable
                                ]]
								if v57 then
									return
								end
								if v60 == true then
									return
								end
								if not anon_53_35() then
									return
								end
								v57 = true
								task.wait(0.15)
								repeat
									local v1 = task.wait
									v1()
									v1 = v60

								until v1 == false
								v57 = false
								return
							end)
						end
						if arg0.KeyCode ~= Enum.KeyCode.Backspace then
							return
						end
						if not v17:FindFirstChildOfClass("Tool") then
							return
						end
						local v57_Tool: Tool = v17:FindFirstChildOfClass("Tool")
						if not v57_Tool:FindFirstChild("Droppable") then
							return
						end
						v6.DropItem:FireServer(v57_Tool)
						return
					end
				end
			end
		end
	end
	if v13.IsInput("Carry", arg0) then
		if v67 ~= true or v15.PlayerGui.Dialogue.Enabled ~= false then
		end
		v6.UnCarry:FireServer(v49)
		v42:Stop()
		v67 = false
		if arg0.KeyCode == Enum.KeyCode.W then
			if not v17:GetAttribute("Swimming") then
				if v61 == false then
					if not v17:GetAttribute("IsSwinging") then
						if not _G.CheckForStun(v17) then
							if not table.find(string.split(v15.Data.Injuries.Value, ","), "MissingLeg") then
								if v73 == false then
									if v15.Data.AutoRun.Value == false then
										v73 = true
									end
									task.delay(0.4, function()
										--[[ 
                                            Fission ~~ Function Information:
                                                ~ Upvalue Count: 1
                                                ~ Argument Count: 0
                                                ~ Debug Name: anon/no name
                                                ~ Bytecode ID: 113
                                                ~ Registers Used: R0-R0
                                                ~ Type Information: Unavailable
                                        ]]
										if not v73 then
											return
										end
										v73 = false
										return
									end)
								end
								RunFunc()
								task.delay(0.4, function()
									--[[ 
                                        Fission ~~ Function Information:
                                            ~ Upvalue Count: 1
                                            ~ Argument Count: 0
                                            ~ Debug Name: anon/no name
                                            ~ Bytecode ID: 113
                                            ~ Registers Used: R0-R0
                                            ~ Type Information: Unavailable
                                    ]]
									if not v73 then
										return
									end
									v73 = false
									return
								end)
							end
						end
					end
				end
			end
		end
		if arg0.KeyCode == Enum.KeyCode.Space then
			if v117 == true then
				ZipLineTravel("Stop")
			end
			local v3 = RaycastParams.new()
			v3.FilterType = Enum.RaycastFilterType.Include
			v5 = workspace.Map
			v3.FilterDescendantsInstances = { v5 }
			local v8 = CFrame.new(0, 0, 1.5)
			local v4 =
				workspace:Raycast(HumanoidRootPart.CFrame * v8.Position, HumanoidRootPart.CFrame.LookVector * 5.5, v3)
			if Humanoid.FloorMaterial == Enum.Material.Air then
				if v4 then
					if v4.Instance then
						if v4.Instance:IsA("BasePart") then
							if not v4.Instance:HasTag("Climbable") then
								if _G.CheckForStun(v17) then
									return
								end
								if v57 then
									return
								end
								v5 = v4.Instance
								v6_121 = v5.CFrame
								v7 = v5.Size / 2
								v8 = {
									v9,
									v6_121 * Vector3.new(-v7.X, v7.Y, v7.Z),
									v6_121 * Vector3.new(v7.X, v7.Y, -v7.Z),
									v6_121 * Vector3.new(-v7.X, v7.Y, -v17_121),
								}
								v9 = v6_121 * Vector3.new(v7.X, v7.Y, v7.Z)
								v17_121 = v7.Z
								v10_121 = math.max(v10_121.Y, v11.Y, v12.Y, v13_121.Y) - HumanoidRootPart.Position.Y
								local v11: number = math.clamp(v10_121 / 7, 0, 1)
								if v10_121 < 7 then
									v37:Play()
									print("CanLedgeClimb")
									v57 = true
									task.delay(0.4, function()
										--[[ 
                                            Fission ~~ Function Information:
                                                ~ Upvalue Count: 1
                                                ~ Argument Count: 0
                                                ~ Debug Name: anon/no name
                                                ~ Bytecode ID: 114
                                                ~ Registers Used: R0-R0
                                                ~ Type Information: Unavailable
                                        ]]
										v57 = false
									end)
									local v12 = Instance.new("BodyVelocity")
									v13_121 = v11 * 50 + 15
									v12.Velocity = HumanoidRootPart.CFrame.LookVector * 20 + Vector3.new(0, v13_121, 0)
									v12.MaxForce = Vector3.new(50000, 50000, 50000)
									v12.Parent = HumanoidRootPart
									v10.Debris(v12, 0.15)
									return
								end
							end
						end
					end
				end
			end
			local v5 = Ray.new(HumanoidRootPart.CFrame.Position, HumanoidRootPart.CFrame.LookVector * 2.5)
			local v6_121 = workspace:FindPartOnRay(v5, v17)
			if v6_121 then
				if v65 == false then
					if Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
						if v70 == false then
							if v6_121.Transparency < 1 then
								if v6_121.CanCollide == true then
									if v6_121:HasTag("ClimbableWall") then
										v6.FallDamage:FireServer(false, HumanoidRootPart.AssemblyLinearVelocity.Y * -2)
										task.spawn(function()
											--[[ 
                                                Fission ~~ Function Information:
                                                    ~ Upvalue Count: 2
                                                    ~ Argument Count: 0
                                                    ~ Debug Name: anon/no name
                                                    ~ Bytecode ID: 115
                                                    ~ Registers Used: R0-R1
                                                    ~ Type Information: Unavailable
                                            ]]
											v70 = true
											repeat
												local v0 = task.wait
												v0()
												v0 = Humanoid
												local v0, v1 = v0:GetState()
												v1 = Enum.HumanoidStateType.Freefall

											until v0 ~= v1
											task.wait(0.2)
											v70 = false
											return
										end)
										v60 = true
										v36:Play()
										v36:AdjustSpeed(1.3)
										local v9 = Instance.new("BodyVelocity")
										v9.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
										v9.Velocity = HumanoidRootPart.CFrame.LookVector + Vector3.new(0, 35, 0)
										v9.Parent = HumanoidRootPart
										v10.Debris(v9, 0.4)
										task.delay(0.25, function()
											--[[ 
                                                Fission ~~ Function Information:
                                                    ~ Upvalue Count: 7
                                                    ~ Argument Count: 0
                                                    ~ Debug Name: anon/no name
                                                    ~ Bytecode ID: 117
                                                    ~ Registers Used: R0-R6
                                                    ~ Type Information: Available
                                            ]]
											v9:Destroy()
											local v0 = Ray.new(
												v17.PrimaryPart.CFrame.Position,
												HumanoidRootPart.CFrame.LookVector
											)
											local v1, v2 = workspace:FindPartOnRay(v0, v17)
											if not v1 then
												v36:Stop(0.1)
												v43:Play()
												local v3 = Instance.new("BodyVelocity", HumanoidRootPart)
												v3.Velocity = Vector3.zero
												v3.MaxForce = Vector3.new(20000, 2e+05, 20000)
												v10.Debris(v3, 1)
												local function anon_4664_116()
													--[[ 
                                                        Fission ~~ Function Information:
                                                            ~ Upvalue Count: 4
                                                            ~ Argument Count: 0
                                                            ~ Debug Name: anon/no name
                                                            ~ Bytecode ID: 116
                                                            ~ Registers Used: R0-R3
                                                            ~ Type Information: Available
                                                    ]]
													task.wait(0.1)
													v3:Destroy()
													v60 = false
													local v0 = Instance.new("BodyVelocity")
													v0.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
													v0.Velocity = HumanoidRootPart.CFrame.LookVector * -15
														+ Vector3.new(0, 50, 0)
													v0.Parent = HumanoidRootPart
													v10.Debris(v0, 0.1)
												end
												task.spawn(anon_4664_116)
												return
											end
											if v1.Transparency == 1 or v1.CanCollide == false then
												v36:Stop(0.1)
												v43:Play()
												local v3 = Instance.new("BodyVelocity", HumanoidRootPart)
												v3.Velocity = Vector3.zero
												v3.MaxForce = Vector3.new(20000, 2e+05, 20000)
												v10.Debris(v3, 1)
												anon_4664_116 = function()
													--[[ 
                                                        Fission ~~ Function Information:
                                                            ~ Upvalue Count: 4
                                                            ~ Argument Count: 0
                                                            ~ Debug Name: anon/no name
                                                            ~ Bytecode ID: 116
                                                            ~ Registers Used: R0-R3
                                                            ~ Type Information: Available
                                                    ]]
													task.wait(0.1)
													v3:Destroy()
													v60 = false
													local v0 = Instance.new("BodyVelocity")
													v0.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
													v0.Velocity = HumanoidRootPart.CFrame.LookVector * -15
														+ Vector3.new(0, 50, 0)
													v0.Parent = HumanoidRootPart
													v10.Debris(v0, 0.1)
												end
												task.spawn(anon_4664_116)
												return
											else
												local v3 = Instance.new("BodyVelocity")
												v3.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
												v3.Velocity = HumanoidRootPart.CFrame.LookVector * 1
													+ Vector3.new(0, 35, 0)
												v3.Parent = HumanoidRootPart
												v10.Debris(v3, 0.1)
												v60 = false
												task.wait(0.2)
												return
											end
										end)
										return
									end
								end
							end
						end
					end
				end
			end
			if v65 == true then
				v24:Stop()
				local v8 = RaycastParams.new()
				v8.FilterType = Enum.RaycastFilterType.Exclude
				v8.FilterDescendantsInstances = { v17 }
				v9 = false
				v65 = false
				v100:Play()
				v100:AdjustSpeed(1.4)
				v49 = false
				v10_121 = Humanoid.WalkSpeed
				Humanoid.WalkSpeed = 5
				Humanoid.JumpPower = 0
				task.wait(0.18)
				local v11 = Instance.new("BodyVelocity")
				v11.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
				v11.Velocity = HumanoidRootPart.CFrame.LookVector * 60 + Vector3.new(0, 30, 0)
				v11.Parent = HumanoidRootPart
				v10.Debris(v11, 0.4)
				v99:Play()
				task.wait(0.25)
				v12 = nil
				local v58_RunService: RunService = game:GetService("RunService")
				local v13_121 = RunService.Heartbeat:Connect(function()
					--[[ 
                        Fission ~~ Function Information:
                            ~ Upvalue Count: 7
                            ~ Argument Count: 0
                            ~ Debug Name: anon/no name
                            ~ Bytecode ID: 118
                            ~ Registers Used: R0-R5
                            ~ Type Information: Unavailable
                    ]]
					local v1 = workspace:Raycast(HumanoidRootPart.Position, Vector3.new(0, -4.5, 0), v8)
					if not v1 then
						return
					end
					if not v1.Instance then
						return
					end
					v12:Disconnect()
					v12 = nil
					v9 = true
					v99:Stop()
					Humanoid.WalkSpeed = v10_121
					Humanoid.JumpPower = 47
					return
				end)
				v12 = v13_121
				task.delay(3, function()
					--[[ 
                        Fission ~~ Function Information:
                            ~ Upvalue Count: 5
                            ~ Argument Count: 0
                            ~ Debug Name: anon/no name
                            ~ Bytecode ID: 119
                            ~ Registers Used: R0-R1
                            ~ Type Information: Unavailable
                    ]]
					if not v12 then
						return
					end
					v12:Disconnect()
					v12 = nil
					v9 = true
					v99:Stop()
					Humanoid.WalkSpeed = v10_121
					Humanoid.JumpPower = 47
					return
				end)
				return
			end
			task.spawn(function()
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 3
                        ~ Argument Count: 0
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 120
                        ~ Registers Used: R0-R2
                        ~ Type Information: Unavailable
                ]]
				if v57 then
					return
				end
				if v60 == true then
					return
				end
				if not anon_53_35() then
					return
				end
				v57 = true
				task.wait(0.15)
				repeat
					local v1 = task.wait
					v1()
					v1 = v60

				until v1 == false
				v57 = false
				return
			end)
		end
		if arg0.KeyCode ~= Enum.KeyCode.Backspace then
			return
		end
		if not v17:FindFirstChildOfClass("Tool") then
			return
		end
		local v59_Tool: Tool = v17:FindFirstChildOfClass("Tool")
		if not v59_Tool:FindFirstChild("Droppable") then
			return
		end
		v6.DropItem:FireServer(v59_Tool)
		return
	end
	if v67 then
		if not v17:HasTag("InSafeZone") then
			if v17:HasTag("InSparringZone") then
			end
		end
		v6.UnCarry:FireServer(v49)
		v42:Stop()
		v67 = false
	end
	if arg0.KeyCode == Enum.KeyCode.W then
		if not v17:GetAttribute("Swimming") then
			if v61 == false then
				if not v17:GetAttribute("IsSwinging") then
					if not _G.CheckForStun(v17) then
						if not table.find(string.split(v15.Data.Injuries.Value, ","), "MissingLeg") then
							if v73 == false then
								if v15.Data.AutoRun.Value == false then
									v73 = true
								end
								task.delay(0.4, function()
									--[[ 
                                        Fission ~~ Function Information:
                                            ~ Upvalue Count: 1
                                            ~ Argument Count: 0
                                            ~ Debug Name: anon/no name
                                            ~ Bytecode ID: 113
                                            ~ Registers Used: R0-R0
                                            ~ Type Information: Unavailable
                                    ]]
									if not v73 then
										return
									end
									v73 = false
									return
								end)
							end
							RunFunc()
							task.delay(0.4, function()
								--[[ 
                                    Fission ~~ Function Information:
                                        ~ Upvalue Count: 1
                                        ~ Argument Count: 0
                                        ~ Debug Name: anon/no name
                                        ~ Bytecode ID: 113
                                        ~ Registers Used: R0-R0
                                        ~ Type Information: Unavailable
                                ]]
								if not v73 then
									return
								end
								v73 = false
								return
							end)
						end
					end
				end
			end
		end
	end
	if arg0.KeyCode == Enum.KeyCode.Space then
		if v117 == true then
			ZipLineTravel("Stop")
		end
		local v3 = RaycastParams.new()
		v3.FilterType = Enum.RaycastFilterType.Include
		v5 = workspace.Map
		v3.FilterDescendantsInstances = { v5 }
		local v8 = CFrame.new(0, 0, 1.5)
		local v4 =
			workspace:Raycast(HumanoidRootPart.CFrame * v8.Position, HumanoidRootPart.CFrame.LookVector * 5.5, v3)
		if Humanoid.FloorMaterial == Enum.Material.Air then
			if v4 then
				if v4.Instance then
					if v4.Instance:IsA("BasePart") then
						if not v4.Instance:HasTag("Climbable") then
							if _G.CheckForStun(v17) then
								return
							end
							if v57 then
								return
							end
							v5 = v4.Instance
							v6_121 = v5.CFrame
							v7 = v5.Size / 2
							v8 = {
								v9,
								v6_121 * Vector3.new(-v7.X, v7.Y, v7.Z),
								v6_121 * Vector3.new(v7.X, v7.Y, -v7.Z),
								v6_121 * Vector3.new(-v7.X, v7.Y, -v17_121),
							}
							v9 = v6_121 * Vector3.new(v7.X, v7.Y, v7.Z)
							v17_121 = v7.Z
							v10_121 = math.max(v10_121.Y, v11.Y, v12.Y, v13_121.Y) - HumanoidRootPart.Position.Y
							local v11: number = math.clamp(v10_121 / 7, 0, 1)
							if v10_121 < 7 then
								v37:Play()
								print("CanLedgeClimb")
								v57 = true
								task.delay(0.4, function()
									--[[ 
                                        Fission ~~ Function Information:
                                            ~ Upvalue Count: 1
                                            ~ Argument Count: 0
                                            ~ Debug Name: anon/no name
                                            ~ Bytecode ID: 114
                                            ~ Registers Used: R0-R0
                                            ~ Type Information: Unavailable
                                    ]]
									v57 = false
								end)
								local v12 = Instance.new("BodyVelocity")
								v13_121 = v11 * 50 + 15
								v12.Velocity = HumanoidRootPart.CFrame.LookVector * 20 + Vector3.new(0, v13_121, 0)
								v12.MaxForce = Vector3.new(50000, 50000, 50000)
								v12.Parent = HumanoidRootPart
								v10.Debris(v12, 0.15)
								return
							end
						end
					end
				end
			end
		end
		local v5 = Ray.new(HumanoidRootPart.CFrame.Position, HumanoidRootPart.CFrame.LookVector * 2.5)
		local v6_121 = workspace:FindPartOnRay(v5, v17)
		if v6_121 then
			if v65 == false then
				if Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
					if v70 == false then
						if v6_121.Transparency < 1 then
							if v6_121.CanCollide == true then
								if v6_121:HasTag("ClimbableWall") then
									v6.FallDamage:FireServer(false, HumanoidRootPart.AssemblyLinearVelocity.Y * -2)
									task.spawn(function()
										--[[ 
                                            Fission ~~ Function Information:
                                                ~ Upvalue Count: 2
                                                ~ Argument Count: 0
                                                ~ Debug Name: anon/no name
                                                ~ Bytecode ID: 115
                                                ~ Registers Used: R0-R1
                                                ~ Type Information: Unavailable
                                        ]]
										v70 = true
										repeat
											local v0 = task.wait
											v0()
											v0 = Humanoid
											local v0, v1 = v0:GetState()
											v1 = Enum.HumanoidStateType.Freefall

										until v0 ~= v1
										task.wait(0.2)
										v70 = false
										return
									end)
									v60 = true
									v36:Play()
									v36:AdjustSpeed(1.3)
									local v9 = Instance.new("BodyVelocity")
									v9.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
									v9.Velocity = HumanoidRootPart.CFrame.LookVector + Vector3.new(0, 35, 0)
									v9.Parent = HumanoidRootPart
									v10.Debris(v9, 0.4)
									task.delay(0.25, function()
										--[[ 
                                            Fission ~~ Function Information:
                                                ~ Upvalue Count: 7
                                                ~ Argument Count: 0
                                                ~ Debug Name: anon/no name
                                                ~ Bytecode ID: 117
                                                ~ Registers Used: R0-R6
                                                ~ Type Information: Available
                                        ]]
										v9:Destroy()
										local v0 =
											Ray.new(v17.PrimaryPart.CFrame.Position, HumanoidRootPart.CFrame.LookVector)
										local v1, v2 = workspace:FindPartOnRay(v0, v17)
										if not v1 then
											v36:Stop(0.1)
											v43:Play()
											local v3 = Instance.new("BodyVelocity", HumanoidRootPart)
											v3.Velocity = Vector3.zero
											v3.MaxForce = Vector3.new(20000, 2e+05, 20000)
											v10.Debris(v3, 1)
											local function anon_15141_116()
												--[[ 
                                                    Fission ~~ Function Information:
                                                        ~ Upvalue Count: 4
                                                        ~ Argument Count: 0
                                                        ~ Debug Name: anon/no name
                                                        ~ Bytecode ID: 116
                                                        ~ Registers Used: R0-R3
                                                        ~ Type Information: Available
                                                ]]
												task.wait(0.1)
												v3:Destroy()
												v60 = false
												local v0 = Instance.new("BodyVelocity")
												v0.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
												v0.Velocity = HumanoidRootPart.CFrame.LookVector * -15
													+ Vector3.new(0, 50, 0)
												v0.Parent = HumanoidRootPart
												v10.Debris(v0, 0.1)
											end
											task.spawn(anon_15141_116)
											return
										end
										if v1.Transparency == 1 or v1.CanCollide == false then
											v36:Stop(0.1)
											v43:Play()
											local v3 = Instance.new("BodyVelocity", HumanoidRootPart)
											v3.Velocity = Vector3.zero
											v3.MaxForce = Vector3.new(20000, 2e+05, 20000)
											v10.Debris(v3, 1)
											anon_15141_116 = function()
												--[[ 
                                                    Fission ~~ Function Information:
                                                        ~ Upvalue Count: 4
                                                        ~ Argument Count: 0
                                                        ~ Debug Name: anon/no name
                                                        ~ Bytecode ID: 116
                                                        ~ Registers Used: R0-R3
                                                        ~ Type Information: Available
                                                ]]
												task.wait(0.1)
												v3:Destroy()
												v60 = false
												local v0 = Instance.new("BodyVelocity")
												v0.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
												v0.Velocity = HumanoidRootPart.CFrame.LookVector * -15
													+ Vector3.new(0, 50, 0)
												v0.Parent = HumanoidRootPart
												v10.Debris(v0, 0.1)
											end
											task.spawn(anon_15141_116)
											return
										else
											local v3 = Instance.new("BodyVelocity")
											v3.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
											v3.Velocity = HumanoidRootPart.CFrame.LookVector * 1 + Vector3.new(0, 35, 0)
											v3.Parent = HumanoidRootPart
											v10.Debris(v3, 0.1)
											v60 = false
											task.wait(0.2)
											return
										end
									end)
									return
								end
							end
						end
					end
				end
			end
		end
		if v65 == true then
			v24:Stop()
			local v8 = RaycastParams.new()
			v8.FilterType = Enum.RaycastFilterType.Exclude
			v8.FilterDescendantsInstances = { v17 }
			v9 = false
			v65 = false
			v100:Play()
			v100:AdjustSpeed(1.4)
			v49 = false
			v10_121 = Humanoid.WalkSpeed
			Humanoid.WalkSpeed = 5
			Humanoid.JumpPower = 0
			task.wait(0.18)
			local v11 = Instance.new("BodyVelocity")
			v11.MaxForce = Vector3.new(1e+05, 1e+05, 1e+05)
			v11.Velocity = HumanoidRootPart.CFrame.LookVector * 60 + Vector3.new(0, 30, 0)
			v11.Parent = HumanoidRootPart
			v10.Debris(v11, 0.4)
			v99:Play()
			task.wait(0.25)
			v12 = nil
			local v60_RunService: RunService = game:GetService("RunService")
			local v13_121 = RunService.Heartbeat:Connect(function()
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 7
                        ~ Argument Count: 0
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 118
                        ~ Registers Used: R0-R5
                        ~ Type Information: Unavailable
                ]]
				local v1 = workspace:Raycast(HumanoidRootPart.Position, Vector3.new(0, -4.5, 0), v8)
				if not v1 then
					return
				end
				if not v1.Instance then
					return
				end
				v12:Disconnect()
				v12 = nil
				v9 = true
				v99:Stop()
				Humanoid.WalkSpeed = v10_121
				Humanoid.JumpPower = 47
				return
			end)
			v12 = v13_121
			task.delay(3, function()
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 5
                        ~ Argument Count: 0
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 119
                        ~ Registers Used: R0-R1
                        ~ Type Information: Unavailable
                ]]
				if not v12 then
					return
				end
				v12:Disconnect()
				v12 = nil
				v9 = true
				v99:Stop()
				Humanoid.WalkSpeed = v10_121
				Humanoid.JumpPower = 47
				return
			end)
			return
		end
		task.spawn(function()
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 3
                    ~ Argument Count: 0
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 120
                    ~ Registers Used: R0-R2
                    ~ Type Information: Unavailable
            ]]
			if v57 then
				return
			end
			if v60 == true then
				return
			end
			if not anon_53_35() then
				return
			end
			v57 = true
			task.wait(0.15)
			repeat
				local v1 = task.wait
				v1()
				v1 = v60

			until v1 == false
			v57 = false
			return
		end)
	end
	if arg0.KeyCode ~= Enum.KeyCode.Backspace then
		return
	end
	if not v17:FindFirstChildOfClass("Tool") then
		return
	end
	local v61_Tool: Tool = v17:FindFirstChildOfClass("Tool")
	if not v61_Tool:FindFirstChild("Droppable") then
		return
	end
	v6.DropItem:FireServer(v61_Tool)
	return
end)
local v144: table = { [1] = false, [2] = false }
local v145: table = { [1] = false, [2] = false }
local EmotionLevel: Instance = v15:WaitForChild("Data"):WaitForChild("EmotionLevel")
EmotionLevel.Changed:Connect(function(arg0: unknown)
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 6
            ~ Argument Count: 1
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 124
            ~ Registers Used: R0-R8
            ~ Type Information: Unavailable
    ]]
	local v1: nil = nil
	local v2 = v15.Character
	local v3 = v2
	if v3 then
		local v62_Humanoid: Instance = v2:FindFirstChild("Humanoid")
	end
	if not v4 then
		if not v4 then
			if v4 <= arg0 then
				v1 = 1
				TweenService
					:Create(v15.PlayerGui.OverlayGui.EmotionLevel, TweenInfo.new(0.5), { ImageTransparency = 1 })
					:Play()
				TweenService
					:Create(v15.PlayerGui.OverlayGui.EmotionLevelAura, TweenInfo.new(0.5), { ImageTransparency = 1 })
					:Play()
			end
			if v1 == nil then
				return
			end
			v6.EmotionLevelIncrease:FireServer(v1)
			local function anon_6868_123()
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 6
                        ~ Argument Count: 0
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 123
                        ~ Registers Used: R0-R3
                        ~ Type Information: Unavailable
                ]]
				-- Fission: INFO: local 'v3_123' has been suffixed to avoid shadowing an existing, upper scope variable.
				while true do
					task.wait(1)
					if v15.Data.EmotionLevel.Value <= 0 then
						break
					end
					if v3.Health <= 3 then
						break
					end
				end
				v6.EmotionLevelIncrease:FireServer(0)
				v145[v1] = true
				local v3_123: nil = v1
				_G.HandleCD("Emotion Level " .. v3_123, 120)
				task.delay(120, function()
					--[[ 
                        Fission ~~ Function Information:
                            ~ Upvalue Count: 3
                            ~ Argument Count: 0
                            ~ Debug Name: anon/no name
                            ~ Bytecode ID: 122
                            ~ Registers Used: R0-R2
                            ~ Type Information: Unavailable
                    ]]
					v145[v1] = false
					v144[v1] = false
				end)
				return
			end
			task.spawn(anon_6868_123)
			return
		end
	end
	if v4 then
		if not v4 then
			if not v4 then
				if not v4 then
					if v4 <= arg0 then
						v1 = 2
						TweenService
							:Create(
								v15.PlayerGui.OverlayGui.EmotionLevel2,
								TweenInfo.new(0.5),
								{ ImageTransparency = 1 }
							)
							:Play()
						TweenService:Create(
							v15.PlayerGui.OverlayGui.EmotionLevelAura2,
							TweenInfo.new(0.5),
							{ ImageTransparency = 1 }
						):Play()
					end
				end
			end
		end
	end
	if v1 == nil then
		return
	end
	v6.EmotionLevelIncrease:FireServer(v1)
	anon_6868_123 = function()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 6
                ~ Argument Count: 0
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 123
                ~ Registers Used: R0-R3
                ~ Type Information: Unavailable
        ]]
		-- Fission: INFO: local 'v3_123' has been suffixed to avoid shadowing an existing, upper scope variable.
		while true do
			task.wait(1)
			if v15.Data.EmotionLevel.Value <= 0 then
				break
			end
			if v3.Health <= 3 then
				break
			end
		end
		v6.EmotionLevelIncrease:FireServer(0)
		v145[v1] = true
		local v3_123: nil = v1
		_G.HandleCD("Emotion Level " .. v3_123, 120)
		task.delay(120, function()
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 3
                    ~ Argument Count: 0
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 122
                    ~ Registers Used: R0-R2
                    ~ Type Information: Unavailable
            ]]
			v145[v1] = false
			v144[v1] = false
		end)
		return
	end
	task.spawn(anon_6868_123)
	return
end)
v6.CleanTable.OnClientEvent:Connect(function()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 1
            ~ Argument Count: 0
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 125
            ~ Registers Used: R0-R1
            ~ Type Information: Unavailable
    ]]
	v44:Play()
end)
v6.PlayParryAnim.OnClientEvent:Connect(function(arg0: string)
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 4
            ~ Argument Count: 1
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 126
            ~ Registers Used: R0-R7
            ~ Type Information: Unavailable
    ]]
	v15.PlayerGui.OverlayGui.Burn.ImageTransparency = 0
	TweenService:Create(
		v15.PlayerGui.OverlayGui.Burn,
		TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
		{ ImageTransparency = 1 }
	):Play()
	if arg0 ~= "KickAway" then
		v87:Play(0)
		return
	else
		v89:Play(0)
		return
	end
end)
RunService.Heartbeat:Connect(function()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 4
            ~ Argument Count: 0
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 127
            ~ Registers Used: R0-R9
            ~ Type Information: Unavailable
    ]]
	if Humanoid.FloorMaterial ~= Enum.Material.Air then
		return
	end
	if not v17:FindFirstChild("Ragdolled") then
		return
	end
	debug.profilebegin("FallDamage_Raycast")
	local v0 = RaycastParams.new()
	v0.FilterType = Enum.RaycastFilterType.Include
	local v2 = workspace.Map
	v0.FilterDescendantsInstances = { v2 }
	local v1 = HumanoidRootPart.Position
	local v2 = workspace:Raycast(v1, Vector3.new(0, -5, 0), v0)
	if not v2 then
		debug.profileend()
		return
	end
	if not v2.Instance then
		debug.profileend()
		return
	end
	if not v2.Instance:IsA("BasePart") then
		debug.profileend()
		return
	end
	if v2.Instance.Transparency >= 1 then
		debug.profileend()
		return
	end
	local v4: boolean = false
	local v5 = workspace:Raycast(v1, Vector3.new(0, -20, 0), v0)
	if v5 then
		if v5.Instance then
			if not v5.Instance:HasTag("FallDamageCushion") then
				if v5.Instance:HasTag("DestructiblePart") then
				end
			end
			v4 = true
		end
	end
	if v17:FindFirstChild("NoFallDamage") then
		debug.profileend()
		return
	end
	v6.FallDamage:FireServer(v4, HumanoidRootPart.AssemblyLinearVelocity.Y * -2)
	debug.profileend()
	return
end)
Humanoid:GetPropertyChangedSignal("FloorMaterial"):Connect(function()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 4
            ~ Argument Count: 0
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 128
            ~ Registers Used: R0-R8
            ~ Type Information: Unavailable
    ]]
	if Humanoid.FloorMaterial == Enum.Material.Air then
		return
	end
	local v1: boolean = false
	local v2 = RaycastParams.new()
	v2.FilterType = Enum.RaycastFilterType.Exclude
	local v4 = v17
	v2.FilterDescendantsInstances = { v4, workspace.Thrown, workspace.Alive }
	local v4 = workspace:Raycast(HumanoidRootPart.Position, Vector3.new(0, -20, 0), v2)
	if v4 then
		if v4.Instance then
			if not v4.Instance:HasTag("FallDamageCushion") then
				if not v4.Instance:HasTag("DestructiblePart") then
					v1 = false
				end
			end
			v1 = true
		end
	end
	if v1 == nil then
		return
	end
	if v17:FindFirstChild("NoFallDamage") then
		return
	end
	v6.FallDamage:FireServer(v1, HumanoidRootPart.AssemblyLinearVelocity.Y * -2)
	return
end)
local v146 = RaycastParams.new()
v146.FilterType = Enum.RaycastFilterType.Exclude
local v148 = workspace.Alive
v146.FilterDescendantsInstances = { v148 }
Humanoid:GetPropertyChangedSignal("Jump"):Connect(function()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 8
            ~ Argument Count: 0
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 131
            ~ Registers Used: R0-R11
            ~ Type Information: Available
    ]]
	if Humanoid.Jump == false then
		return
	end
	local v0: boolean = true
	local v3 = CFrame.new(0, 0, -1)
	local v2 = workspace:Raycast(v17.HumanoidRootPart.CFrame * v3.Position, Vector3.new(0, -10, 0), v146)
	if v2 then
		if v2.Instance then
			v0 = false
		end
	end
	if Humanoid.FloorMaterial == Enum.Material.Air then
		if v0 == true then
			Humanoid.Jump = false
			return
		end
	end
	if v0 == true then
		if v49 == true then
			local v3 = Instance.new("BodyVelocity", HumanoidRootPart)
			v3.Name = "DashVelocity"
			v3.MaxForce = Vector3.new(25000, 0, 25000)
			v10.Debris(v3, 0.15)
			local v4 = workspace.CurrentCamera.CFrame.LookVector * 55 + Vector3.new(0, 25, 0)
			local v5 = Vector3.new(v4.X, v4.Y / 2.5, v4.Z)
			v3.Velocity = v5
			local v5 = Instance.new("BodyGyro")
			v5.MaxTorque = Vector3.new(0, 1e+05, 0)
			v5.D = 200
			v5.P = 60000
			v5.Name = "DashThing"
			v5.CFrame = workspace.CurrentCamera.CFrame
			v5.Parent = HumanoidRootPart
			v10.Debris(v5, 0.15)
			local v63_RunService: RunService = game:GetService("RunService")
			local v6 = RunService.RenderStepped:Connect(function()
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 1
                        ~ Argument Count: 0
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 129
                        ~ Registers Used: R0-R1
                        ~ Type Information: Unavailable
                ]]
				v5.CFrame = workspace.CurrentCamera.CFrame
			end)
			task.delay(0.15, function()
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 1
                        ~ Argument Count: 0
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 130
                        ~ Registers Used: R0-R1
                        ~ Type Information: Unavailable
                ]]
				v6:Disconnect()
			end)
			HumanoidRootPart.ClimbJump:Play()
			v15.PlayerGui.OverlayGui.White.ImageTransparency = 0.5
			TweenService:Create(v15.PlayerGui.OverlayGui.White, TweenInfo.new(0.2), { ImageTransparency = 1 }):Play()
		end
	end
	if v17:GetAttribute("Swimming") then
		Humanoid.Jump = false
		return
	end
	local v3 = Humanoid:GetState()
	if
		v3 == "Freefall"
		or v3 == "Jumping"
		or v3 == "FallingDown"
		or v3 == "Ragdoll"
		or v3 == "PlatformStanding"
		or v3 == "Physics"
	then
		Humanoid.Jump = false
		return
	end
	if v17:FindFirstChild("Stunned") then
		Humanoid.Jump = false
		return
	end
	if not v17:FindFirstChild("UsingMove") then
		return
	else
		Humanoid.Jump = false
		return
	end
end)
local function anon_62_132()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 2
            ~ Argument Count: 0
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 132
            ~ Registers Used: R0-R3
            ~ Type Information: Unavailable
    ]]
	local v0: { string } = string.split(v15.Data.Injuries.Value, ",")
	if not table.find(v0, "Concussion") then
		game.Lighting.ConcussionInjury.Enabled = false
		game.Lighting.DepthOfField.Enabled = true
	else
		game.Lighting.ConcussionInjury.Enabled = true
		game.Lighting.DepthOfField.Enabled = false
	end
	if not table.find(v0, "FracturedArm") then
		v50 = false
		return
	else
		v50 = true
		return
	end
end
v15.Data.Injuries.Changed:Connect(function()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 1
            ~ Argument Count: 0
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 133
            ~ Registers Used: R0-R0
            ~ Type Information: Unavailable
    ]]
	anon_62_132()
end)
anon_62_132()
Humanoid.HealthChanged:Connect(function(arg0: number)
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 4
            ~ Argument Count: 1
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 134
            ~ Registers Used: R0-R3
            ~ Type Information: Unavailable
    ]]
	if 0 < arg0 then
		if arg0 > Humanoid.MaxHealth / 10 then
			if v17:FindFirstChild("Knocked") then
			end
		end
		if v72 == false then
			v72 = true
			if not v15.Data.LowHealthVFX.Value then
				return
			else
				v15.PlayerGui.OverlayGui.LowHealthBlood.ImageTransparency = 0.35
				v15.PlayerGui.OverlayGui.LowHealthHurt.ImageTransparency = 0.35
				v15.PlayerGui.OverlayGui.LowHealth:Play()
				return
			end
		end
		return
	end
	if Humanoid.MaxHealth / 10 <= arg0 then
		v72 = false
		v15.PlayerGui.OverlayGui.LowHealthBlood.ImageTransparency = 1
		v15.PlayerGui.OverlayGui.LowHealthHurt.ImageTransparency = 1
		v15.PlayerGui.OverlayGui.LowHealth:Stop()
		return
	else
		if not v17:FindFirstChild("GotGripped") then
			return
		end
		if not v72 then
			return
		end
	end
	return
end)
pcall(function()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 1
            ~ Argument Count: 0
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 135
            ~ Registers Used: R0-R1
            ~ Type Information: Unavailable
    ]]
	v15.PlayerGui.OverlayGui.LowHealthBlood.ImageTransparency = 1
	v15.PlayerGui.OverlayGui.LowHealthHurt.ImageTransparency = 1
	v15.PlayerGui.OverlayGui.LowHealth:Stop()
end)
local v148 = CollectionService:GetTagged("IconEvade")
DashIcons = v148
local v148 = CollectionService:GetTagged("IconParry")
ParryIcons = v148
local v148 = CollectionService:GetTagged("IconCrit")
CritIcons = v148
local RunService: RunService = game:GetService("RunService")
RunService.Heartbeat:Connect(function()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 4
            ~ Argument Count: 0
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 136
            ~ Registers Used: R0-R8
            ~ Type Information: Unavailable
    ]]
	local v0 = DashIcons
	for v3, v4 in v0 do
		local v5 = not v17:FindFirstChild("ResetDashCD") and DashCD
		v4.Visible = v5
	end
	for v3, v4 in ParryIcons do
		local v5 = v17:GetAttribute("ParryCD")
		v4.Visible = v5
	end
	for v3, v4 in CritIcons do
		local v5 = v17:GetAttribute("CriticalCD")
		v4.Visible = v5
	end
	if ReplicatedStorage.PermadeathEnabled.Value == true then
		if v107 == false then
			v107 = true
			v15.PlayerGui.Stats.CombatText.TextLabel.Text = "DEATH CLOSES IN"
			return
		end
	end
	if ReplicatedStorage.PermadeathEnabled.Value ~= false then
		return
	end
	if v107 ~= true then
		return
	end
	v107 = false
	v15.PlayerGui.Stats.CombatText.TextLabel.Text = "IN DANGER"
	return
end)
local v149: boolean = false
local v64_RunService: RunService = game:GetService("RunService")
RunService.Heartbeat:Connect(function()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 18
            ~ Argument Count: 0
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 137
            ~ Registers Used: R0-R7
            ~ Type Information: Unavailable
    ]]
	if v49 then
		if not v25.IsPlaying then
			if v79.IsPlaying then
			end
		end
		v25:Stop()
		v79:Stop()
	end
	local v0 = Humanoid.MoveDirection.Magnitude * Humanoid.WalkSpeed
	if v17:GetAttribute("IsSwinging") then
		if v17:FindFirstChild("Abnormality") then
		end
		for v4, v5 in v7 do
			v5:Destroy()
		end
		table.clear(v7)
		v79:Stop()
		v78:Stop()
		v24:Stop()
		v25:Stop()
		return
	end
	if not _G.CheckForStun(v17) then
		if not v17:FindFirstChild("UsingMove") then
			if v0 > 0.5 then
				v149 = false
				local v1
				if not v66 then
					v1 = v26
				else
					v1 = v77
				end
				v1:Stop()
				if not v49 then
					local v2
					if not v66 then
						v2 = v25
					else
						v2 = v79
					end
					v1 = v2
				else
					if not v66 then
						v2 = v24
					else
						v2 = v78
					end
					v1 = v2
					if v66 then
						v2 = v22[v21]
						if v2 then
							local RightGrip: Instance = v17:FindFirstChild("RightGrip")
							AddDragFX(v2, RightGrip, v7)
						end
					end
				end
				if v1 then
					if v1.IsPlaying then
						if Humanoid.FloorMaterial ~= Enum.Material.Air then
							v1:AdjustSpeed(0.8 + v0 / 100)
						else
							v1:AdjustSpeed(0.15)
						end
					else
						v1:Play()
					end
				end
				if not v17:FindFirstChild("TrueStunned") then
					if not v17:FindFirstChild("Stunned") then
						if not v17:FindFirstChild("UsingMove") then
							if not v17:GetAttribute("IsSwinging") then
								if WalkSpeed.Value / 10 < Humanoid.WalkSpeed then
									if not v17:FindFirstChild("LightAttack") then
										if v49 == false then
											if
												0.6 >= Humanoid.MoveDirection:Dot(HumanoidRootPart.CFrame.LookVector)
											then
												v55 = true
											else
												v55 = false
											end
										end
									end
								end
							end
						end
					end
				end
				if not v17:FindFirstChild("TrueStunned") then
					if not v17:FindFirstChild("Stunned") then
						if not v17:FindFirstChild("UsingMove") then
							if not v17:GetAttribute("IsSwinging") then
								if WalkSpeed.Value / 10 < Humanoid.WalkSpeed then
									if not v17:FindFirstChild("LightAttack") then
										if v49 == false then
											if not v55 then
												Humanoid.WalkSpeed = WalkSpeed.Value
											else
												Humanoid.WalkSpeed = WalkSpeed.Value * 0.6
											end
										end
									end
								end
							end
						end
					end
				end
				if v17:FindFirstChild("TrueStunned") then
					Humanoid.WalkSpeed = 0
					Humanoid.JumpPower = 0
					Humanoid.Jump = false
				end
				if not v17:FindFirstChild("Grabbed") then
					return
				end
				Humanoid.WalkSpeed = 0
				Humanoid.JumpPower = 0
				Humanoid.Jump = false
				return
			else
				if v149 then
					return
				end
				v149 = true
				if not v66 then
					v1 = v26
				else
					v1 = v77
				end
				v1:Play()
				for v4, v5 in v7 do
					v5:Destroy()
				end
				table.clear(v7)
				v79:Stop()
				v78:Stop()
				v25:Stop()
				v24:Stop()
				return
			end
		end
	end
	for v4, v5 in v7 do
		v5:Destroy()
	end
	table.clear(v7)
	v79:Stop()
	v78:Stop()
	v24:Stop()
	v25:Stop()
	return
end)
v6.EmotionLevelIncrease.OnClientEvent:Connect(function(arg0: boolean)
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 2
            ~ Argument Count: 1
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 139
            ~ Registers Used: R0-R3
            ~ Type Information: Unavailable
    ]]
	if arg0 ~= true then
		return
	end
	v29:Play()
	task.delay(5, function()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 1
                ~ Argument Count: 0
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 138
                ~ Registers Used: R0-R0
                ~ Type Information: Unavailable
        ]]
		anon_54_36()
	end)
	return
end)
v17.ChildRemoved:Connect(function(arg0: table)
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 2
            ~ Argument Count: 1
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 140
            ~ Registers Used: R0-R2
            ~ Type Information: Unavailable
    ]]
	if arg0.Name ~= "TrueStunned" then
		return
	end
	task.wait(0.1)
	Humanoid.WalkSpeed = WalkSpeed.Value
	return
end)
local v151 = Instance.new("Attachment", HumanoidRootPart)
local v152 = CFrame.new(0, 3.5, 0)
v151.CFrame = v152
local v152 = Instance.new("PointLight", v151)
v152.Range = 15
v152.Shadows = false
v152.Brightness = 0.2
Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
task.wait(3)
Humanoid.HealthChanged:Connect(function()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 2
            ~ Argument Count: 0
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 141
            ~ Registers Used: R0-R5
            ~ Type Information: Unavailable
    ]]
	local v0 = WalkSpeed:GetAttribute("MaxHPSpeed")
	if v0 >= 13 then
		local v3 = v0 * Humanoid.Health / Humanoid.MaxHealth * 1.8
		local v2: number = math.clamp(v3, 13, v0)
		WalkSpeed.Value = v2
		return
	else
		return
	end
end)
local v153 = WalkSpeed:GetAttribute("MaxHPSpeed")
WalkSpeed.Value = v153
local v65_WalkSpeed: Instance = v17:WaitForChild("WalkSpeed")
Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function(...)
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 2
            ~ Argument Count: 0
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 142
            ~ Registers Used: R0-R2
            ~ Type Information: Unavailable
    ]]
	local v0 = WalkSpeed.Value
	if v0 == 0 then
		return
	end
	if v0 * 2.5 >= Humanoid.WalkSpeed then
		return
	end
	Humanoid.WalkSpeed = v0
	return
end)
WalkSpeed:GetPropertyChangedSignal("Value"):Connect(function(...)
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 1
            ~ Argument Count: 0
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 143
            ~ Registers Used: R0-R5
            ~ Type Information: Unavailable
    ]]
	task.wait()
	if not WalkSpeed:GetAttribute("MaxHPSpeed") then
		return
	end
	if WalkSpeed:GetAttribute("MaxHPSpeed") <= 0 then
		return
	end
	if not WalkSpeed:GetAttribute("Speed") then
		return
	end
	if WalkSpeed:GetAttribute("Speed") <= 0 then
		return
	end
	if WalkSpeed:GetAttribute("MaxHPSpeed") == WalkSpeed:GetAttribute("Speed") then
		local v1 = WalkSpeed:GetAttribute("MaxHPSpeed")
		WalkSpeed.Value = v1
		return
	end
	WalkSpeed:SetAttribute("MaxHPSpeed", WalkSpeed:GetAttribute("Speed"))
	local v1 = WalkSpeed:GetAttribute("MaxHPSpeed")
	WalkSpeed.Value = v1
	return
end)
local function DanceDanceMinigame(arg0: unknown, arg1: number, arg2: table, arg3: unknown)
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 7
            ~ Argument Count: 4
            ~ Debug Name: DanceDanceMinigame
            ~ Bytecode ID: 156
            ~ Registers Used: R0-R33
            ~ Type Information: Unavailable
    ]]
	-- Fission: INFO: local 'v10_156' has been suffixed to avoid shadowing an existing, upper scope variable.
	-- Fission: INFO: local 'v4_156' has been suffixed to avoid shadowing an existing, upper scope variable.
	local v4_156 = v4.DanceDanceAnims
	local DanceDance: Instance = v15.PlayerGui:WaitForChild("DanceDance")
	local BaseFrame: Instance = DanceDance:WaitForChild("BaseFrame")
	local v7 = BaseFrame.Mascot
	local ComboText: Instance = BaseFrame:WaitForChild("ComboText")
	local v9: number = 0
	local v10_156: number = 0
	local v11 = arg2.TimePosition
	local v12: table = {}
	local v13 = v17.Humanoid.Animator:LoadAnimation(v4_156.Front)
	v12.Front = v13
	local v13 = v17.Humanoid.Animator:LoadAnimation(v4_156.Back)
	v12.Back = v13
	local v13 = v17.Humanoid.Animator:LoadAnimation(v4_156.Left)
	v12.Left = v13
	local v13 = v17.Humanoid.Animator:LoadAnimation(v4_156.Right)
	v12.Right = v13
	v13 = { "Front", "Back", "Left", "Right" }
	local function GetRandomDirection()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 1
                ~ Argument Count: 0
                ~ Debug Name: GetRandomDirection
                ~ Bytecode ID: 144
                ~ Registers Used: R0-R5
                ~ Type Information: Unavailable
        ]]
		local v2: number = math.random(1, #v13)
		return v13[v2]
	end
	local function UpdateComboText()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 3
                ~ Argument Count: 0
                ~ Debug Name: UpdateComboText
                ~ Bytecode ID: 145
                ~ Registers Used: R0-R3
                ~ Type Information: Unavailable
        ]]
		local v2: number = v9
		local v1: string = tostring(v2)
		ComboText.Number.Text = v1
		if v9 == 0 then
			local v1 = v7:GetAttribute("HorribleImage")
			v7.Image = v1
			ComboText.Text = ""
			return
		end
		if v9 < 10 then
			local v1 = v7:GetAttribute("MediocreImage")
			v7.Image = v1
			ComboText.Text = "Canard"
			return
		end
		if v9 < 30 then
			local v1 = v7:GetAttribute("MediocreImage")
			v7.Image = v1
			ComboText.Text = "Urban Myth"
			return
		end
		if v9 < 60 then
			local v1 = v7:GetAttribute("MediocreImage")
			v7.Image = v1
			ComboText.Text = "Urban Legend"
			return
		end
		if v9 < 125 then
			local v1 = v7:GetAttribute("MediocreImage")
			v7.Image = v1
			ComboText.Text = "Urban Plague"
			return
		end
		if v9 >= 400 then
			ComboText.Text = "STAR OF THE CITY"
			return
		else
			local v1 = v7:GetAttribute("GoodImage")
			v7.Image = v1
			ComboText.Text = "Urban Nightmare"
			return
		end
	end
	local function FlashBackground(arg0: table)
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 2
                ~ Argument Count: 1
                ~ Debug Name: FlashBackground
                ~ Bytecode ID: 146
                ~ Registers Used: R0-R6
                ~ Type Information: Unavailable
        ]]
		local v5: table = {}
		v5.BackgroundColor3 = arg0.BackgroundColor3
		TweenService:Create(BaseFrame.BackgroundColorFlash, TweenInfo.new(0.1), v5):Play()
		TweenService:Create(arg0, TweenInfo.new(0.1), { BackgroundTransparency = 0 }):Play()
		task.wait(0.1)
		TweenService:Create(arg0, TweenInfo.new(0.1), { BackgroundTransparency = 1 }):Play()
	end
	local function CheckForKeyPress(arg0: unknown)
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 1
                ~ Argument Count: 1
                ~ Debug Name: CheckForKeyPress
                ~ Bytecode ID: 147
                ~ Registers Used: R0-R4
                ~ Type Information: Unavailable
        ]]
		local v1: table = {}
		v1.Front = Enum.KeyCode.W
		v1.Back = Enum.KeyCode.S
		v1.Left = Enum.KeyCode.A
		v1.Right = Enum.KeyCode.D
		return UserInputService:IsKeyDown(v1[arg0])
	end
	local v18: table = {}
	local v19 = v19
	local v20: number = arg1 * 0.00942
	local v21: number = v19 * 0.2
	local v22: number = v19 * 0.3
	local v23: number = v19 * 1
	local function SpawnArrow(arg0: unknown, arg1: number)
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 7
                ~ Argument Count: 2
                ~ Debug Name: SpawnArrow
                ~ Bytecode ID: 149
                ~ Registers Used: R0-R13
                ~ Type Information: Unavailable
        ]]
		-- Fission: INFO: local 'v9_149' has been suffixed to avoid shadowing an existing, upper scope variable.
		local v2: Instance = BaseFrame:FindFirstChild(arg0)
		local v3 = v2:FindFirstChild("TemplateArrow"):Clone()
		v3.Visible = true
		local v4 = Color3.fromRGB(146, 166, 255)
		v3.ImageColor3 = v4
		local v4 = UDim2.new(0.5, 0, 1, 0)
		v3.Position = v4
		v3.Parent = v2
		print(Humanoid)
		local v8: table = {}
		local v9_149 = UDim2.new(0.5, 0, 0.025, 0)
		v8.Position = v9_149
		local v4 = TweenService:Create(v3, TweenInfo.new(Humanoid, Enum.EasingStyle.Linear), v8)
		v4:Play()
		local v5: table = { Direction = nil, Arrow = nil, TargetTime = nil, Hit = false }
		v5.Direction = arg0
		v5.Arrow = v3
		v5.TargetTime = arg1
		table.insert(v18, v5)
		task.delay(Humanoid + 0.1, function()
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 6
                    ~ Argument Count: 0
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 148
                    ~ Registers Used: R0-R5
                    ~ Type Information: Unavailable
            ]]
			-- Fission: INFO: local 'v5_148' has been suffixed to avoid shadowing an existing, upper scope variable.
			if not v3:IsDescendantOf(game) then
				return
			end
			if v5.Hit then
				v3:Destroy()
				return
			end
			if v3:HasTag("Hit") then
				v3:Destroy()
				return
			end
			v9 = 0
			UpdateComboText()
			local v0 = Instance.new("Sound", workspace.Thrown)
			v0.SoundId = "rbxassetid://2200505478"
			v0.Volume = 1
			v0:Play()
			v10.Debris(v0, 5)
			local v4 = v18
			local v5_148 = v5
			table.remove(v18, table.find(v4, v5_148))
			v3:Destroy()
			return
		end)
	end
	local v25: table = {
		[Enum.KeyCode.J] = "Front",
		[Enum.KeyCode.D] = "Left",
		[Enum.KeyCode.F] = "Back",
		[Enum.KeyCode.K] = "Right",
		[Enum.KeyCode.Up] = "Front",
		[Enum.KeyCode.Left] = "Left",
		[Enum.KeyCode.Down] = "Back",
		[Enum.KeyCode.Right] = "Right",
	}
	local v26 = UserInputService.InputBegan:Connect(function(arg0: table, arg1: boolean)
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 14
                ~ Argument Count: 2
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 151
                ~ Registers Used: R0-R13
                ~ Type Information: Unavailable
        ]]
		-- Fission: INFO: local 'v12_151' has been suffixed to avoid shadowing an existing, upper scope variable.
		-- Fission: INFO: local 'v9_151' has been suffixed to avoid shadowing an existing, upper scope variable.
		-- Fission: INFO: local 'v10_151' has been suffixed to avoid shadowing an existing, upper scope variable.
		if arg1 then
			return
		end
		local v2 = v25[arg0.KeyCode]
		if not v2 then
			return
		end
		local v4: nil = nil
		local v5 = v18
		for v8, v9_151 in v5 do
			if not v9_151.Hit then
				if v9_151.Direction == v2 then
					v4 = v9_151
					break
				end
			end
		end
		if not v4 then
			task.spawn(function()
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 4
                        ~ Argument Count: 0
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 150
                        ~ Registers Used: R0-R2
                        ~ Type Information: Unavailable
                ]]
				-- Fission: INFO: local 'v2_150' has been suffixed to avoid shadowing an existing, upper scope variable.
				if v2 == "Front" then
					v12.Front:Play()
					task.wait(0.2)
					repeat
						v0 = task.wait
						v0()
						v0 = UserInputService
						local v2_150 = arg0
						v2_150 = v2_150.KeyCode
						local v0, v1 = v0:IsKeyDown(v2_150)

					until not v0
					v12.Front:Stop()
					return
				elseif v2 == "Left" then
					v12.Left:Play()
					task.wait(0.2)
					repeat
						v0 = task.wait
						v0()
						v0 = UserInputService
						v2_150 = arg0
						v2_150 = v2_150.KeyCode
						local v0, v1 = v0:IsKeyDown(v2_150)

					until not v0
					v12.Left:Stop()
					return
				elseif v2 == "Right" then
					v12.Right:Play()
					task.wait(0.2)
					repeat
						v0 = task.wait
						v0()
						v0 = UserInputService
						v2_150 = arg0
						v2_150 = v2_150.KeyCode
						local v0, v1 = v0:IsKeyDown(v2_150)

					until not v0
					v12.Right:Stop()
					return
				else
					if v2 ~= "Back" then
						return
					end
					v12.Back:Play()
					task.wait(0.2)
					repeat
						local v0 = task.wait
						v0()
						v0 = UserInputService
						local v2_150 = arg0
						v2_150 = v2_150.KeyCode
						local v0, v1 = v0:IsKeyDown(v2_150)

					until not v0
					v12.Back:Stop()
					return
				end
			end)
			return
		end
		local v6 = v4.TargetTime - os.clock()
		local v5: number = math.abs(v6)
		if v5 > v23 then
			task.spawn(function()
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 4
                        ~ Argument Count: 0
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 150
                        ~ Registers Used: R0-R2
                        ~ Type Information: Unavailable
                ]]
				-- Fission: INFO: local 'v2_150' has been suffixed to avoid shadowing an existing, upper scope variable.
				if v2 == "Front" then
					v12.Front:Play()
					task.wait(0.2)
					repeat
						v0 = task.wait
						v0()
						v0 = UserInputService
						local v2_150 = arg0
						v2_150 = v2_150.KeyCode
						local v0, v1 = v0:IsKeyDown(v2_150)

					until not v0
					v12.Front:Stop()
					return
				elseif v2 == "Left" then
					v12.Left:Play()
					task.wait(0.2)
					repeat
						v0 = task.wait
						v0()
						v0 = UserInputService
						v2_150 = arg0
						v2_150 = v2_150.KeyCode
						local v0, v1 = v0:IsKeyDown(v2_150)

					until not v0
					v12.Left:Stop()
					return
				elseif v2 == "Right" then
					v12.Right:Play()
					task.wait(0.2)
					repeat
						v0 = task.wait
						v0()
						v0 = UserInputService
						v2_150 = arg0
						v2_150 = v2_150.KeyCode
						local v0, v1 = v0:IsKeyDown(v2_150)

					until not v0
					v12.Right:Stop()
					return
				else
					if v2 ~= "Back" then
						return
					end
					v12.Back:Play()
					task.wait(0.2)
					repeat
						local v0 = task.wait
						v0()
						v0 = UserInputService
						local v2_150 = arg0
						v2_150 = v2_150.KeyCode
						local v0, v1 = v0:IsKeyDown(v2_150)

					until not v0
					v12.Back:Stop()
					return
				end
			end)
			return
		end
		v4.Hit = true
		v4.Arrow:AddTag("Hit")
		v6 = ""
		if v5 > v21 then
			if v5 > v22 then
				if v5 <= v23 then
					v6 = "Miss"
					v9 = 0
					v10_156 = v10_156 + 1
				end
			else
				v6 = "Normal"
				v9 = v9 + 1
			end
		else
			v6 = "Perfect"
			v9 = v9 + 2
		end
		UpdateComboText()
		local v10_151 = v2
		FlashBackground(BaseFrame:FindFirstChild(v10_151))
		local v11 = {}
		local v13: Instance = BaseFrame
		local v12_151 = v13[v2].BackgroundColor3
		v11.ImageColor3 = v12_151
		TweenService:Create(v4.Arrow, TweenInfo.new(0.2), v11):Play()
		local v7 = Instance.new("Sound", workspace.Thrown)
		v7.SoundId = "rbxassetid://7434669289"
		v7.Volume = 1
		v7:Play()
		v10.Debris(v7, 5)
		if v6 ~= "Perfect" then
			task.spawn(function()
				--[[ 
                    Fission ~~ Function Information:
                        ~ Upvalue Count: 4
                        ~ Argument Count: 0
                        ~ Debug Name: anon/no name
                        ~ Bytecode ID: 150
                        ~ Registers Used: R0-R2
                        ~ Type Information: Unavailable
                ]]
				-- Fission: INFO: local 'v2_150' has been suffixed to avoid shadowing an existing, upper scope variable.
				if v2 == "Front" then
					v12.Front:Play()
					task.wait(0.2)
					repeat
						v0 = task.wait
						v0()
						v0 = UserInputService
						local v2_150 = arg0
						v2_150 = v2_150.KeyCode
						local v0, v1 = v0:IsKeyDown(v2_150)

					until not v0
					v12.Front:Stop()
					return
				elseif v2 == "Left" then
					v12.Left:Play()
					task.wait(0.2)
					repeat
						v0 = task.wait
						v0()
						v0 = UserInputService
						v2_150 = arg0
						v2_150 = v2_150.KeyCode
						local v0, v1 = v0:IsKeyDown(v2_150)

					until not v0
					v12.Left:Stop()
					return
				elseif v2 == "Right" then
					v12.Right:Play()
					task.wait(0.2)
					repeat
						v0 = task.wait
						v0()
						v0 = UserInputService
						v2_150 = arg0
						v2_150 = v2_150.KeyCode
						local v0, v1 = v0:IsKeyDown(v2_150)

					until not v0
					v12.Right:Stop()
					return
				else
					if v2 ~= "Back" then
						return
					end
					v12.Back:Play()
					task.wait(0.2)
					repeat
						local v0 = task.wait
						v0()
						v0 = UserInputService
						local v2_150 = arg0
						v2_150 = v2_150.KeyCode
						local v0, v1 = v0:IsKeyDown(v2_150)

					until not v0
					v12.Back:Stop()
					return
				end
			end)
			return
		end
		local v8 = Instance.new("Sound", workspace.Thrown)
		v8.SoundId = "rbxassetid://8592853360"
		v8.PlaybackSpeed = 1.5
		v8.Volume = 0.5
		v8:Play()
		v10.Debris(v8, 5)
		task.spawn(function()
			--[[ 
                Fission ~~ Function Information:
                    ~ Upvalue Count: 4
                    ~ Argument Count: 0
                    ~ Debug Name: anon/no name
                    ~ Bytecode ID: 150
                    ~ Registers Used: R0-R2
                    ~ Type Information: Unavailable
            ]]
			-- Fission: INFO: local 'v2_150' has been suffixed to avoid shadowing an existing, upper scope variable.
			if v2 == "Front" then
				v12.Front:Play()
				task.wait(0.2)
				repeat
					v0 = task.wait
					v0()
					v0 = UserInputService
					local v2_150 = arg0
					v2_150 = v2_150.KeyCode
					local v0, v1 = v0:IsKeyDown(v2_150)

				until not v0
				v12.Front:Stop()
				return
			elseif v2 == "Left" then
				v12.Left:Play()
				task.wait(0.2)
				repeat
					v0 = task.wait
					v0()
					v0 = UserInputService
					v2_150 = arg0
					v2_150 = v2_150.KeyCode
					local v0, v1 = v0:IsKeyDown(v2_150)

				until not v0
				v12.Left:Stop()
				return
			elseif v2 == "Right" then
				v12.Right:Play()
				task.wait(0.2)
				repeat
					v0 = task.wait
					v0()
					v0 = UserInputService
					v2_150 = arg0
					v2_150 = v2_150.KeyCode
					local v0, v1 = v0:IsKeyDown(v2_150)

				until not v0
				v12.Right:Stop()
				return
			else
				if v2 ~= "Back" then
					return
				end
				v12.Back:Play()
				task.wait(0.2)
				repeat
					local v0 = task.wait
					v0()
					v0 = UserInputService
					local v2_150 = arg0
					v2_150 = v2_150.KeyCode
					local v0, v1 = v0:IsKeyDown(v2_150)

				until not v0
				v12.Back:Stop()
				return
			end
		end)
		return
	end)
	for i_29 = 1, 3, 1 do
		local v31 = v31
		local v30: string = tostring(v31)
		ComboText.Text = v30
		local v30 = Instance.new("Sound", workspace.Thrown)
		v30.SoundId = "rbxassetid://7112391013"
		v30.PlaybackSpeed = 2
		v30.Volume = 0.5
		v30:Play()
		v10.Debris(v30, 5)
		task.wait(1)
	end
	local v27 = Instance.new("Sound", workspace.Thrown)
	v27.SoundId = "rbxassetid://7434669289"
	v27.Volume = 0.5
	v27:Play()
	v10.Debris(v27, 5)
	local function anon_8724_152()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 4
                ~ Argument Count: 0
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 152
                ~ Registers Used: R0-R3
                ~ Type Information: Unavailable
        ]]
		local v0: table = { TrackName = nil, Score = 0, Misses = nil, Combo = nil }
		v0.TrackName = arg3
		v0.Misses = v10_156
		v0.Combo = v9
		v6.GetDanceDanceResults:FireServer(v0)
	end
	task.spawn(function()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 3
                ~ Argument Count: 0
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 153
                ~ Registers Used: R0-R9
                ~ Type Information: Unavailable
        ]]
		while true do
			task.wait(Humanoid / 2)
			local v1 = UDim2.new(0, 200, 0, 150)
			v7.Size = v1
			local v4 = {}
			local v5 = UDim2.new(0, 200, 0, 200)
			v4.Size = v5
			TweenService:Create(v7, TweenInfo.new(Humanoid / 2), v4):Play()
			task.wait(Humanoid / 2)
		end
	end)
	task.delay(arg2.TimeLength, function()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 5
                ~ Argument Count: 0
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 154
                ~ Registers Used: R0-R3
                ~ Type Information: Unavailable
        ]]
		local v0 = { TrackName = nil, Score = 0, Misses = nil, Combo = nil }
		v0.TrackName = arg3
		v0.Misses = v10_156
		v0.Combo = v9
		v6.GetDanceDanceResults:FireServer(v0)
		v26:Disconnect()
	end)
	task.spawn(function()
		--[[ 
            Fission ~~ Function Information:
                ~ Upvalue Count: 4
                ~ Argument Count: 0
                ~ Debug Name: anon/no name
                ~ Bytecode ID: 155
                ~ Registers Used: R0-R7
                ~ Type Information: Unavailable
        ]]
		local v0: number = os.clock()
		v11 = v0
		v0 = 1
		while v0 <= #arg0 do
			local v2 = arg0[v0]
			if v2.Time - Humanoid > os.clock() - v11 then
				task.wait(0.01)
			else
				SpawnArrow(v2.Direction, v11 + v2.Time)
				v0 += 1
			end
		end
		return
	end)
	return
end
v6.GameStart.OnClientEvent:Connect(function(arg0: string, arg1: unknown, arg2: unknown, arg3: unknown)
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 3
            ~ Argument Count: 4
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 157
            ~ Registers Used: R0-R8
            ~ Type Information: Unavailable
    ]]
	if arg0 == "Start" then
		v58 = false
		DanceDanceMinigame(require(v4.DanceDanceMaps[arg1]), arg2, arg3, arg1)
		return
	end
	if arg0 ~= "Stop" then
		return
	end
	v58 = true
	return
end)
v6.ActivateCritical.OnClientEvent:Connect(function(arg0: boolean, arg1: number?, arg2: string?)
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 0
            ~ Argument Count: 3
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 158
            ~ Registers Used: R0-R6
            ~ Type Information: Available
    ]]
	if not arg0 then
		print("reset cd", arg2)
		_G.ResetCD(arg2 or "Critical Attack")
		return
	else
		print("show cd", arg2, arg1)
		_G.HandleCD(arg2 or "Critical Attack", arg1)
		return
	end
end)
print("Slow Auto Rotate")
local v155 = Instance.new("AlignOrientation")
v155.Enabled = false
v155.Mode = Enum.OrientationAlignmentMode.OneAttachment
v155.Attachment0 = v17.HumanoidRootPart.RootAttachment
v155.Responsiveness = 5
v155.MaxTorque = inf
v155.Parent = HumanoidRootPart
local function anon_75_159()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 3
            ~ Argument Count: 0
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 159
            ~ Registers Used: R0-R4
            ~ Type Information: Available
    ]]
	local v0 = Vector3.new(-workspace.CurrentCamera.CFrame.ZVector.X, 0, -workspace.CurrentCamera.CFrame.ZVector.Z)
	v0 = v0.Unit
	if v15:GetAttribute("Shiftlocked") then
		return CFrame.lookAt(HumanoidRootPart.Position, HumanoidRootPart.Position + v0)
	end
	if 0 >= Humanoid.MoveDirection.Magnitude then
		v0 = HumanoidRootPart.CFrame.LookVector
		return CFrame.lookAt(HumanoidRootPart.Position, HumanoidRootPart.Position + v0)
	else
		v0 = Humanoid.MoveDirection
		return CFrame.lookAt(HumanoidRootPart.Position, HumanoidRootPart.Position + v0)
	end
	return CFrame.lookAt(HumanoidRootPart.Position, HumanoidRootPart.Position + v0)
end
RunService.RenderStepped:Connect(function()
	--[[ 
        Fission ~~ Function Information:
            ~ Upvalue Count: 6
            ~ Argument Count: 0
            ~ Debug Name: anon/no name
            ~ Bytecode ID: 160
            ~ Registers Used: R0-R4
            ~ Type Information: Available
    ]]
	if not v15 then
		return
	end
	if not v17 then
		return
	end
	if not v17:FindFirstChild("NoAutoRotate") then
		if not v17:FindFirstChild("InClash") then
			if not v60 then
				if not v17:FindFirstChild("Grabbed") then
					if not v17:FindFirstChild("Ragdolled") then
						if not v17:FindFirstChild("SlowAutoRotate") then
							Humanoid.AutoRotate = true
							v155.Enabled = false
						else
							Humanoid.AutoRotate = false
							v155.Enabled = true
							v155.Responsiveness = 2000
							local v1 = anon_75_159()
							v155.CFrame = v1
						end
					end
					if not v155.Enabled then
						return
					end
					local v0 = Vector3.new(
						workspace.CurrentCamera.CFrame.LookVector.X,
						0,
						workspace.CurrentCamera.CFrame.LookVector.Z
					)
					v0 = v0.Unit
					v1 = 5
					if v17:GetAttribute("FastAutoRotate") then
						v1 = 15
					end
					v155.Responsiveness = v1
					if not v15:GetAttribute("Shiftlocked") then
						if 0 >= Humanoid.MoveDirection.Magnitude then
							return
						end
						v0 = Humanoid.MoveDirection
					end
					local v3 = anon_75_159()
					v155.CFrame = v3
					return
				end
			end
		end
	end
	Humanoid.AutoRotate = false
	v155.Enabled = false
	if not v155.Enabled then
		return
	end
	local v0 = Vector3.new(workspace.CurrentCamera.CFrame.LookVector.X, 0, workspace.CurrentCamera.CFrame.LookVector.Z)
	v0 = v0.Unit
	v1 = 5
	if v17:GetAttribute("FastAutoRotate") then
		v1 = 15
	end
	v155.Responsiveness = v1
	if not v15:GetAttribute("Shiftlocked") then
		if 0 >= Humanoid.MoveDirection.Magnitude then
			return
		end
		v0 = Humanoid.MoveDirection
	end
	local v3 = anon_75_159()
	v155.CFrame = v3
	return
end)
return
