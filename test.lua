debug.setmemorycategory("ClientEffects")
local u1 = game:GetService("Players")
local u2 = game:GetService("RunService")
local u3 = game:GetService("TweenService")
game:GetService("ProximityPromptService")
local v4 = game:GetService("CollectionService")
local v5 = game:GetService("TextChatService")
local u6 = game:GetService("ReplicatedStorage")
local u7 = u1.LocalPlayer
repeat
	task.wait()
until u7.Character ~= nil
local v8 = u6.Events
local u9 = u6.Assets
local u10 = u6.Assets.Effects
local u11 = require(u6.Modules.GeneralModule)
require(u6.Modules.CraterModule)
local v12 = require(u6.Modules.CameraShaker)
local u13 = require(u6.Modules.LightningBolt)
local u14 = require(u6.Modules.LightningBolt.LightningSparks)
local v15 = require(u6.Modules.Utilities)
local u16 = require(u6.Modules.Trove)
local u17 = require(u6.Modules.Medal)
local u18 = v15.createLogger("ClientPlayerScript", u7)
local function u22(p19, p20) --[[ Line: 30 ]]
	--[[
    Upvalues:
        [1] = u7
    --]]
	if p19 then
		local v21 = nil
		if typeof(p19) == "Instance" then
			if p19:IsA("BasePart") then
				p19 = p19.Position
			elseif p19:IsA("Model") then
				p19 = p19:GetPivot().p
			elseif p19:IsA("Attachment") then
				p19 = p19.WorldPosition
			else
				p19 = v21
			end
		elseif typeof(p19) == "CFrame" then
			p19 = p19.Position
		elseif typeof(p19) ~= "Vector3" then
			p19 = v21
		end
		if p19 then
			if u7.Character then
				return u7:DistanceFromCharacter(p19) <= p20
			end
		end
	else
		return
	end
end
function v5.OnIncomingMessage(p23) --[[ Line: 59 ]]
	--[[
    Upvalues:
        [1] = u1
    --]]
	local v24 = p23.Text
	local v25
	if p23.TextSource then
		v25 = u1:GetPlayerByUserId(p23.TextSource.UserId)
	else
		v25 = nil
	end
	local v35 = v24:gsub("%*(.-)%*", function(p26) --[[ Line: 65 ]]
		return "<b>" .. p26 .. "</b>"
	end)
		:gsub('"(.-)"', function(p27) --[[ Line: 69 ]]
			return "<i>" .. p27 .. "</i>"
		end)
		:gsub("/C%s+(%d+)%s+(%d+)%s+(%d+)%s+([^/]+)%s*/", function(p28, p29, p30, p31) --[[ Line: 73 ]]
			local v32 = tonumber(p28)
			local v33 = tonumber(p29)
			local v34 = tonumber(p30)
			if
				v32
				and (
					v33
					and (
						v34 and (
							v32 >= 0 and (v32 <= 255 and (v33 >= 0 and (v33 <= 255 and (v34 >= 0 and v34 <= 255))))
						)
					)
				)
			then
				return string.format('<font color="rgb(%d,%d,%d)">%s</font>', v32, v33, v34, p31)
			else
				return p31
			end
		end)
	if v25 and table.find(string.split(v25.Data.Injuries.Value, ","), "BrokenJaw") then
		v35 = v35:gsub("%a", function(p36) --[[ Line: 82 ]]
			return math.random() < 0.4 and "-" or p36
		end)
	end
	if v25 and table.find(string.split(v25.Data.Injuries.Value, ","), "MissingJaw") then
		local u37 = {
			"!",
			"@",
			"#",
			"$",
			"%",
			"&",
			"*",
			"?",
			"~",
		}
		v35 = v35:gsub("%a", function() --[[ Line: 92 ]]
			--[[
            Upvalues:
                [1] = u37
            --]]
			return u37[math.random(1, #u37)]
		end)
	end
	local v38 = Instance.new("TextChatMessageProperties")
	v38.PrefixText = p23.PrefixText
	v38.Text = v35
	return v38
end
v8.BubblingFlesh.OnClientEvent:Connect(function(p39, p40) --[[ Line: 104 ]]
	--[[
    Upvalues:
        [1] = u22
        [2] = u6
        [3] = u11
        [4] = u3
    --]]
	if p39 == nil then
		return
	elseif u22(p39, 300) then
		local v41 = u6.Assets.BloodSounds:GetChildren()[math.random(1, #u6.Assets.BloodSounds:GetChildren())]:Clone()
		v41.Parent = p39
		v41:Play()
		u11.Debris(v41, 5)
		local v42 = {}
		for _ = 1, 7 do
			local u43 = u6.Assets.Effects.FleshBubbling:Clone()
			local v44 = Instance.new("Weld")
			v44.Part0 = p39
			v44.Part1 = u43
			v44.C0 = CFrame.new(math.random(-40, 40) / 100, math.random(-40, 40) / 100, math.random(-40, 40) / 100)
				* CFrame.Angles(math.random(0, 360), math.random(0, 360), math.random(0, 360))
			v44.Parent = u43
			u43.Color = Color3.fromRGB(131, 0, 0)
			u43.Parent = workspace.Thrown
			local u45 = true
			task.delay(p40, function() --[[ Line: 125 ]]
				--[[
                Upvalues:
                    [1] = u45
                --]]
				u45 = false
			end)
			u11.Debris(u43, p40)
			task.spawn(function() --[[ Line: 130 ]]
				--[[
                Upvalues:
                    [1] = u45
                    [2] = u3
                    [3] = u43
                --]]
				local v46 = nil
				while u45 == true do
					local v47 = math.random(5, 20) / 100
					local v48 = u3
					local v49 = u43
					local v50 = TweenInfo.new(v47, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 2, true, 0)
					local v51 = {}
					local v52 = math.random(35, 80) / 50
					local v53 = math.random(35, 80) / 50
					local v54 = math.random(35, 80) / 50
					v51.Size = Vector3.new(v52, v53, v54)
					v46 = v48:Create(v49, v50, v51)
					v46:Play()
					task.wait(v47)
				end
				v46:Pause()
				u3:Create(u43, TweenInfo.new(0.5), {
					["Size"] = Vector3.new(0, 0, 0),
				}):Play()
			end)
			table.insert(v42, u43)
		end
	end
end)
v8.PerilousAttack.OnClientEvent:Connect(function(p55, p56) --[[ Line: 150 ]]
	--[[
    Upvalues:
        [1] = u7
        [2] = u9
        [3] = u11
    --]]
	if u7.Character == nil or p55 == nil then
		return
	elseif p55:FindFirstChild("HumanoidRootPart") then
		if (u7.Character.HumanoidRootPart.Position - p55.HumanoidRootPart.Position).Magnitude <= 70 then
			local v57 = (u9.Peril:FindFirstChild(p56) or u9.Peril:FindFirstChild("Unblockable")):Clone()
			v57.Parent = u7.Character.HumanoidRootPart
			u11.PlayFX(v57)
			u11.Debris(v57, 5)
		end
	end
end)
v8.ClashStart.OnClientEvent:Connect(function(p58) --[[ Line: 165 ]]
	--[[
    Upvalues:
        [1] = u7
        [2] = u10
        [3] = u11
    --]]
	local v59 = u7.Character
	local v60 = u10.ParryEffect.Parry:Clone()
	v60.Parent = v59.HumanoidRootPart
	v60.CFrame = CFrame.new(math.random(-15, 15) / 10, math.random(-15, 15) / 10, math.random(-20, 35) / 10)
	u11.Debris(v60, 3)
	u11.PlayFX(v60)
	local v61 = u10.ParryEffect.StartClash:Clone()
	v61.Parent = p58.HumanoidRootPart
	v61.CFrame = CFrame.new(math.random(-15, 15) / 10, math.random(-15, 15) / 10, math.random(-20, 35) / 10)
	u11.Debris(v61, 3)
	u11.PlayFX(v61)
end)
v8.LoadingScreen.OnClientEvent:Connect(function() --[[ Line: 181 ]]
	--[[
    Upvalues:
        [1] = u7
        [2] = u6
    --]]
	local v62 = u7.PlayerGui:WaitForChild("LoadingScreen")
	v62.Enabled = true
	v62.MainFrame.LoadingBarBG.Tip.Text = require(u6.Modules.NPCDialogues).GetRandomTip()
	v62.MainFrame.BackgroundImage.Image = "rbxassetid://16032256503"
	local v63 = 0
	for _ = 1, 10 do
		v62.MainFrame.LoadingBarBG.LoadingBar.UIGradient.Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0),
			NumberSequenceKeypoint.new(v63, 0),
			NumberSequenceKeypoint.new(v63 + 0.05, 1),
			NumberSequenceKeypoint.new(1, 1),
		})
		v63 = v63 + 0.1
		task.wait(math.random(1, 2))
	end
	task.wait(3)
end)
v8.PlayCutscene.OnClientEvent:Connect(function(p64, p65, p66) --[[ Line: 203 ]]
	--[[
    Upvalues:
        [1] = u6
    --]]
	require(u6.Modules.CutsceneModule).PlayCutscene(p64, p65, p66)
end)
local function u74(p67, p68) --[[ Line: 208 ]]
	--[[
    Upvalues:
        [1] = u7
        [2] = u11
        [3] = u3
    --]]
	if u7 and (u7:FindFirstChild("PlayerGui") and u7.PlayerGui:FindFirstChild("OverlayGui")) then
		local u69 = u7.PlayerGui.OverlayGui.SubtitleFrame:FindFirstChild("SubtitleTemplate"):Clone()
		if u69 then
			local v70 = p68 == nil and "#FFFFFF" or p68
			for _, v71 in u7.PlayerGui.OverlayGui.SubtitleFrame:GetChildren() do
				if v71:HasTag("ActiveSubtitle") then
					v71:RemoveTag("ActiveSubtitle")
					v71.TextSize = v71.TextSize / 1.5
				end
			end
			u69.TextColor3 = Color3.fromHex(v70)
			u69.Name = "Subtitle"
			u69:AddTag("ActiveSubtitle")
			u69.Text = p67
			u69.Visible = true
			u69.Parent = u7.PlayerGui.OverlayGui.SubtitleFrame
			local v72 = #p67 / 5
			local v73 = math.min(v72, 10)
			u11.Debris(u69, v73 + 0.5)
			task.delay(v73, function() --[[ Line: 236 ]]
				--[[
                Upvalues:
                    [1] = u3
                    [2] = u69
                --]]
				u3:Create(u69, TweenInfo.new(0.5), {
					["TextTransparency"] = 1,
				}):Play()
				task.wait(0.5)
				u69:Destroy()
			end)
		end
	else
		return
	end
end
v8.Subtitle.OnClientEvent:Connect(function(p75, p76) --[[ Line: 243 ]]
	--[[
    Upvalues:
        [1] = u74
    --]]
	u74(p75, p76)
end)
v8.EventWarning.OnClientEvent:Connect(function(p77, p78) --[[ Line: 247 ]]
	--[[
    Upvalues:
        [1] = u7
        [2] = u3
    --]]
	local v79 = u7.PlayerGui.EventIndicator.EventHolder:Clone()
	v79.EventBG.ImageColor3 = p78
	v79.TextLabel.TextColor3 = p78
	v79.TextLabel.Text = p77
	v79.Visible = true
	v79.Parent = u7.PlayerGui.EventIndicator
	local v80 = v79.Size
	v79.Size = UDim2.new(0, 0, 0, 68)
	u3:Create(v79, TweenInfo.new(1), {
		["Size"] = v80,
	}):Play()
	task.wait(1)
	u3:Create(v79.TextLabel, TweenInfo.new(0.5), {
		["TextTransparency"] = 0,
	}):Play()
	task.wait(5)
	u3:Create(v79.TextLabel, TweenInfo.new(0.5), {
		["TextTransparency"] = 1,
	}):Play()
	task.wait(0.5)
	u3:Create(v79, TweenInfo.new(1), {
		["Size"] = UDim2.new(0, 0, 0, 68),
	}):Play()
end)
v8.SendChatMessage.OnClientEvent:Connect(function(p81, p82, p83) --[[ Line: 270 ]]
	--[[
    Upvalues:
        [1] = u1
        [2] = u7
        [3] = u74
    --]]
	if p81 ~= nil then
		local v84 = p83 == nil and "#FFD29B" or p83
		local v85 = not (u1:GetPlayerFromCharacter(p81) and u1:GetPlayerFromCharacter(p81).Data.DisplayName.Value)
			and p81.Parent
		if v85 then
			v85 = p81.Parent.Name
		end
		if u7.Character ~= nil and p81 ~= nil then
			local v86
			if p81:IsA("BasePart") then
				v86 = (p81.Position - u7.Character.PrimaryPart.Position).Magnitude
			else
				v86 = (p81.PrimaryPart.Position - u7.Character.PrimaryPart.Position).Magnitude
			end
			if v86 <= 70 then
				u74(v85 .. ":\n" .. p82, v84)
			end
		end
		game:GetService("TextChatService"):DisplayBubble(p81, (('<font color="%*">%*</font>'):format(v84, p82)))
	end
end)
v8.AttackIndicator.OnClientEvent:Connect(function(p87) --[[ Line: 292 ]]
	--[[
    Upvalues:
        [1] = u7
        [2] = u2
        [3] = u22
        [4] = u11
        [5] = u10
    --]]
	if p87 == u7.Character and not u2:IsStudio() then
		return
	elseif u22(p87, 100) then
		if p87 ~= nil then
			local v88 = p87:QueryDescendants(".HandlePart,StringValue")
			if table.find(u11.UnarmedWeapons, p87:FindFirstChild("Weapon").Value) then
				local v89 = u10.BaseCombatFX.Indicator:Clone()
				v89.Parent = p87:FindFirstChild("HumanoidRootPart")
				u11.Debris(v89, 1)
				u11.PlayFX(v89)
			else
				for _, v90 in v88 do
					if string.find(v90.Value, "Grip") then
						local v91 = u10.BaseCombatFX.Indicator:Clone()
						v91.Parent = p87[v90.Value]
						u11.Debris(v91, 1)
						u11.PlayFX(v91)
					end
				end
			end
			local v92 = u10.BaseCombatFX.M1IndicatorGround:Clone()
			v92.Parent = p87:FindFirstChild("HumanoidRootPart")
			v92.CFrame = p87:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0, -3, 0)
			v92.CFrame = CFrame.lookAt(v92.Position, v92.Position + v92.CFrame.LookVector * 5)
			u11.Debris(v92, 2)
			u11.PlayFX(v92)
		end
	end
end)
v8.SecretAdmingThingHEHE.OnClientEvent:Connect(function() --[[ Line: 326 ]]
	--[[
    Upvalues:
        [1] = u7
    --]]
	require(game.ReplicatedStorage.Modules.GeneralModule).BellToller(u7.Character)
end)
v8.ChangeHumanoidState.OnClientEvent:Connect(function(p93) --[[ Line: 330 ]]
	--[[
    Upvalues:
        [1] = u7
    --]]
	if u7.Character ~= nil then
		if p93 == "Physics" then
			u7.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Physics)
			return
		end
		if p93 == "GettingUp" then
			u7.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.GettingUp)
		end
	end
end)
local function v96(p94) --[[ Line: 340 ]]
	--[[
    Upvalues:
        [1] = u7
    --]]
	if u7.Data.ShowHitboxes.Value then
		local v95 = p94:WaitForChild("SelectionBox")
		v95.Transparency = 0
		v95.SurfaceTransparency = 0.9
	end
end
v4:GetInstanceAddedSignal("Hitbox"):Connect(v96)
shared.SummonHitbox = v96
local u97 = {}
u7.Data.StoryMarkers.Changed:Connect(function() --[[ Line: 444 ]]
	--[[
    Upvalues:
        [1] = u7
        [2] = u3
        [3] = u11
    --]]
	u7.PlayerGui.OverlayGui.Warp.ImageTransparency = 0.7
	u3:Create(u7.PlayerGui.OverlayGui.Warp, TweenInfo.new(0.1), {
		["ImageTransparency"] = 1,
	}):Play()
	u11.KnowledgeIncreaseVFX(u7.Character, "Storymarkers")
end);
(function() --[[ Line: 353 ]]
	--[[
    Upvalues:
        [1] = u7
        [2] = u97
    --]]
	task.wait(5)
	local v98 = string.split(u7:WaitForChild("Data"):WaitForChild("StoryMarkers").Value, ",")
	if not table.find(v98, "LetterQuestComplete") then
		local v99 = workspace.NPCS.QuestNPCS:FindFirstChild("LetterQuestStart")
		local v100 = u97
		table.insert(v100, v99)
	end
	if not table.find(v98, "CompletedInjuryQuest") then
		local v101 = workspace.NPCS.QuestNPCS:FindFirstChild("Injured Rat")
		local v102 = u97
		table.insert(v102, v101)
	end
	if table.find(v98, "SingularityExtracted") then
		local v103 = workspace.NPCS.QuestNPCS:FindFirstChild("ExtractedSingularity")
		local v104 = u97
		table.insert(v104, v103)
	end
	if table.find(v98, "OldFriendsMet") then
		local v105 = workspace.NPCS.QuestNPCS:FindFirstChild("Old Friend")
		local v106 = u97
		table.insert(v106, v105)
	end
	if table.find(v98, "LibraryRetrievalEnded") then
		local v107 = workspace.NPCS.QuestNPCS:FindFirstChild("LibraryRetrievalComplete")
		local v108 = u97
		table.insert(v108, v107)
	else
		local v109 = workspace.NPCS.QuestNPCS:FindFirstChild("LibraryRetrievalAlone")
		local v110 = u97
		table.insert(v110, v109)
	end
	if u7.Data.CookingMissionCompletions.Value >= 1 and not table.find(v98, "ChefQuestline5") then
		local v111 = workspace.NPCS.QuestNPCS:FindFirstChild("Shadou")
		local v112 = u97
		table.insert(v112, v111)
	elseif table.find(v98, "ChefQuestline5") and not table.find(v98, "ShadouEndingDeath") then
		local v113 = workspace.NPCS.QuestNPCS:FindFirstChild("ShadouEnding")
		local v114 = u97
		table.insert(v114, v113)
	end
	if table.find(v98, "RatYakuza1") then
		if table.find(v98, "RatYakuza1") and not table.find(v98, "RatYakuza2") then
			local v115 = workspace.NPCS.QuestNPCS:FindFirstChild("Not So Random Rat")
			local v116 = u97
			table.insert(v116, v115)
		elseif table.find(v98, "RatYakuza2") and not table.find(v98, "RatYakuza3") then
			local v117 = workspace.NPCS.QuestNPCS:FindFirstChild("Rat Boss")
			local v118 = u97
			table.insert(v118, v117)
		elseif table.find(v98, "RatYakuza3") then
			local v119 =
				workspace.NPCS.QuestNPCS:FindFirstChild("Ryu Razuma, The Rat of Rojima, 4th Patriarch of the Rojo Clan")
			local v120 = u97
			table.insert(v120, v119)
		end
	else
		local v121 = workspace.NPCS.QuestNPCS:FindFirstChild("Random Rat")
		local v122 = u97
		table.insert(v122, v121)
	end
	if not table.find(v98, "JudgementSentenzaQuestFinished") then
		local v123 = workspace.NPCS.QuestNPCS:FindFirstChild("SentenzaContractRatsDoorstep")
		local v124 = u97
		table.insert(v124, v123)
	end
	if table.find(v98, "WaterPassagewayCleared") then
		local v125 = workspace.NPCS.QuestNPCS:FindFirstChild("WaterBarrierSparringUnlock")
		local v126 = u97
		table.insert(v126, v125)
	else
		local v127 = workspace.NPCS.QuestNPCS:FindFirstChild("WaterBarrier")
		local v128 = u97
		table.insert(v128, v127)
	end
	if table.find(v98, "WorkshopQuest1") then
		if table.find(v98, "WorkshopQuest1") and not table.find(v98, "WorkshopQuest2") then
			local v129 = workspace.NPCS.QuestNPCS:FindFirstChild("Workshop Master Apartment")
			local v130 = u97
			table.insert(v130, v129)
		elseif table.find(v98, "WorkshopQuest2") and not table.find(v98, "WorkshopQuest3") then
			local v131 = workspace.NPCS.QuestNPCS:FindFirstChild("Workshop Master Roof")
			local v132 = u97
			table.insert(v132, v131)
		elseif table.find(v98, "WorkshopQuest3") and not table.find(v98, "WorkshopQuestFinished") then
			local v133 = workspace.NPCS.QuestNPCS:FindFirstChild("Workshop Master Train")
			local v134 = u97
			table.insert(v134, v133)
		elseif table.find(v98, "WorkshopQuestFinished") then
			local v135 = workspace.NPCS.QuestNPCS:FindFirstChild("Workshop Master Apartment")
			local v136 = u97
			table.insert(v136, v135)
		end
	else
		local v137 = workspace.NPCS.QuestNPCS:FindFirstChild("Workshop Master Cafe")
		local v138 = u97
		table.insert(v138, v137)
	end
	for _, v139 in workspace.NPCS.QuestNPCS:GetChildren() do
		if table.find(u97, v139) then
			v139.Parent = workspace.NPCS
		else
			v139:Destroy()
		end
	end
end)()
local u140 = {}
local function u148(_) --[[ Line: 463 ]]
	--[[
    Upvalues:
        [1] = u140
        [2] = u6
        [3] = u7
    --]]
	debug.profilebegin("SetNPCPoses")
	for _, u141 in workspace.NPCS:QueryDescendants("Model") do
		if u141:IsA("Model") and not table.find(u140, u141) then
			local v142 = u140
			table.insert(v142, u141)
			if
				u141:FindFirstChild("PoseValue") and u6.NPCPoses:FindFirstChild(u141:FindFirstChild("PoseValue").Value)
			then
				local v143 = u6.NPCPoses:FindFirstChild(u141:FindFirstChild("PoseValue").Value)
				local v144 =
					u141:FindFirstChildOfClass("Humanoid"):FindFirstChildOfClass("Animator"):LoadAnimation(v143)
				v144.Looped = true
				v144.Priority = Enum.AnimationPriority.Action
				v144:Play()
			end
			task.spawn(function() --[[ Line: 477 ]]
				--[[
                Upvalues:
                    [1] = u141
                    [2] = u7
                --]]
				if u141:FindFirstChildOfClass("ProximityPrompt") then
					u141:FindFirstChildOfClass("ProximityPrompt").Triggered:Connect(function(p145) --[[ Line: 479 ]]
						--[[
                        Upvalues:
                            [1] = u7
                            [2] = u141
                        --]]
						if u7 == p145 then
							u141:FindFirstChildOfClass("RemoteEvent"):FireServer()
						end
					end)
				else
					repeat
						task.wait(2)
						local v146 = u141:FindFirstChildOfClass("ProximityPrompt")
					until v146 ~= nil
					v146.Triggered:Connect(function(p147) --[[ Line: 487 ]]
						--[[
                        Upvalues:
                            [1] = u7
                            [2] = u141
                        --]]
						if u7 == p147 then
							u141:FindFirstChildOfClass("RemoteEvent"):FireServer()
						end
					end)
				end
			end)
		end
	end
	debug.profileend()
end
task.spawn(u148)
workspace.NPCS.ChildAdded:Connect(function(p149) --[[ Line: 500 ]]
	--[[
    Upvalues:
        [1] = u148
    --]]
	u148(p149)
end)
local u150 = require(game.ReplicatedStorage.Modules.MeshEmitModule)
v8.ClearESP.OnClientEvent:Connect(function() --[[ Line: 505 ]]
	for _, v151 in game:GetService("CollectionService"):GetTagged("ESP") do
		if v151:IsDescendantOf(workspace) then
			v151:Destroy()
		end
	end
end)
local function v161(u152) --[[ Line: 513 ]]
	--[[
    Upvalues:
        [1] = u18
        [2] = u7
        [3] = u16
        [4] = u10
        [5] = u6
        [6] = u2
        [7] = u3
    --]]
	if not u152 then
		return u18:Print("CustomESP Target not found.")
	end
	if typeof(u152) == "Vector3" then
		u152 = CFrame.new(u152)
	end
	local u153 = typeof(u152) == "Instance"
	if u153 and u152:IsA("Attachment") then
		u152 = u152.Parent
	end
	local v154 = u7.Character:WaitForChild("HumanoidRootPart")
	local u155 = u16.new()
	local u156 = u10.KillingInstinctEffects.KillingInstinct:Clone()
	u156.Parent = v154
	u155:Add(u156)
	local v157 = u153 and u152 or workspace.Terrain
	local u158 = Instance.new("Attachment")
	u158:AddTag("ESP")
	u158.Parent = v157
	u155:Add(u158)
	if not u153 then
		u158.WorldCFrame = u152
	end
	u156.Chains.Attachment1 = u158
	for _, v159 in u156:GetChildren() do
		if v159:IsA("Beam") then
			v159.Attachment1 = u156.Chains.Attachment1
		end
	end
	local u160 = u6.Assets.ESPIcon:Clone()
	u160.Parent = u158
	u155:Add(u160)
	u155:Add(u2.RenderStepped:Connect(function() --[[ Line: 550 ]]
		--[[
        Upvalues:
            [1] = u153
            [2] = u152
            [3] = u160
            [4] = u156
            [5] = u155
            [6] = u7
            [7] = u158
            [8] = u3
        --]]
		if u153 and not (u152 and u152.Parent) or not (u160 and u156) then
			u155:Clean()
			return
		elseif u160.Parent and u156.Parent then
			if u156:FindFirstChild("Chains") and u160:FindFirstChild("Marker") then
				if u7.Character and u7:DistanceFromCharacter(u158.WorldPosition) >= 60 then
					u3:Create(u160.Marker, TweenInfo.new(0.2), {
						["ImageTransparency"] = 0,
					}):Play()
				else
					u3:Create(u160.Marker, TweenInfo.new(0.2), {
						["ImageTransparency"] = 1,
					}):Play()
				end
			else
				u155:Clean()
				return
			end
		else
			u155:Clean()
			return
		end
	end))
	u155:AttachToInstance(u158)
end
_G.ESPTarget = v161
v8.ESPTarget.OnClientEvent:Connect(v161)
v8.ESPTargetHealth.OnClientEvent:Connect(function(p162) --[[ Line: 579 ]]
	--[[
    Upvalues:
        [1] = u6
        [2] = u11
        [3] = u3
    --]]
	local v163 = u6.Assets.IFrameHighlight:Clone()
	v163.OutlineColor = Color3.fromRGB(19, 148, 38)
	v163.FillColor = Color3.fromRGB(135, 255, 135)
	v163.Parent = p162
	v163.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	p162.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Subject
	p162.Humanoid.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOn
	p162.Humanoid.HealthDisplayDistance = 70
	u11.Debris(v163, 0.4)
	u3:Create(v163, TweenInfo.new(0.3), {
		["OutlineTransparency"] = 1,
		["FillTransparency"] = 1,
	}):Play()
end)
local u165 = v12.new(Enum.RenderPriority.Camera.Value, function(p164) --[[ Line: 592 ]]
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p164
end)
u165:Start()
v8.ShakeScreen.OnClientEvent:Connect(function(p166, p167, p168, p169, p170, p171) --[[ Line: 598 ]]
	--[[
    Upvalues:
        [1] = u11
        [2] = u165
        [3] = u7
    --]]
	u11.ShakeScreen(u165, u7, p166, p167, p168, p169, p170, p171)
end)
v8.ContractCompleted.OnClientEvent:Connect(function(p172) --[[ Line: 602 ]]
	--[[
    Upvalues:
        [1] = u11
        [2] = u7
    --]]
	u11.ContractCompleted(u7, p172)
end)
v8.Emit3D.OnClientEvent:Connect(function(p173, p174) --[[ Line: 605 ]]
	--[[
    Upvalues:
        [1] = u150
    --]]
	u150(p173, p174)
end)
v8.BlurScreen.OnClientEvent:Connect(function(p175, p176) --[[ Line: 608 ]]
	--[[
    Upvalues:
        [1] = u3
        [2] = u11
    --]]
	local v177 = Instance.new("BlurEffect", game.Lighting)
	v177.Size = 0
	u3:Create(v177, TweenInfo.new(0.2), {
		["Size"] = p176,
	}):Play()
	u11.Debris(v177, p175 + 5)
	task.wait(p175)
	u3:Create(v177, TweenInfo.new(2), {
		["Size"] = 0,
	}):Play()
end)
function AddSpaceBeforeUppercase(p178)
	return p178:gsub("(%u)", " %1"):match("^%s*(.-)$")
end
v8.MedalClip.OnClientEvent:Connect(function(u179, u180, u181) --[[ Line: 622 ]]
	--[[
    Upvalues:
        [1] = u17
    --]]
	task.spawn(function() --[[ Line: 623 ]]
		--[[
        Upvalues:
            [1] = u17
            [2] = u179
            [3] = u180
            [4] = u181
        --]]
		u17:TriggerClip(u179, u180, u181 and u181 or {
			["duration"] = 30,
			["captureDelayMs"] = 5000,
		})
	end)
end)
v8.DiedGUI.OnClientEvent:Connect(function() --[[ Line: 631 ]]
	--[[
    Upvalues:
        [1] = u6
        [2] = u7
        [3] = u17
        [4] = u3
        [5] = u2
    --]]
	local v182 = require(u6.Modules.NPCDialogues).DeathTips
	local u183 = u7.PlayerGui.DeathOverlay
	task.spawn(function() --[[ Line: 634 ]]
		--[[
        Upvalues:
            [1] = u17
            [2] = u7
        --]]
		u17:TriggerClip("PlayerDied", u7.Data.DisplayName.Value .. "'s Death", {
			["duration"] = 40,
			["captureDelayMs"] = 5000,
		})
	end)
	u183.TextFrame.DeathText.Subtext.Text = v182[math.random(1, #v182)]
	u183.TextFrame.Size = UDim2.new(0, 0, 0, 0)
	u183.BackgroundFrame.Background.ImageTransparency = 1
	u183.BackgroundFrame.Vignette.ImageTransparency = 1
	u183.Enabled = true
	u183.Appear:Play()
	u183.BackgroundFrame.BackgroundColor3 = Color3.fromRGB(198, 0, 0)
	u3:Create(u183.BackgroundFrame, TweenInfo.new(0.2), {
		["BackgroundColor3"] = Color3.fromRGB(0, 0, 0),
	}):Play()
	u3:Create(u183.BackgroundFrame.Vignette, TweenInfo.new(0.7), {
		["ImageTransparency"] = 0.5,
	}):Play()
	task.wait(0.7)
	u3:Create(u183.BackgroundFrame.Background, TweenInfo.new(1), {
		["ImageTransparency"] = 0.9,
	}):Play()
	task.wait(0.5)
	u3:Create(u183.TextFrame, TweenInfo.new(0.35), {
		["Size"] = UDim2.new(1, 0, 1, 0),
	}):Play()
	local u186 = u2.RenderStepped:Connect(function() --[[ Line: 656 ]]
		--[[
        Upvalues:
            [1] = u183
        --]]
		local v184 = u183.TextFrame.Proelium
		v184.Rotation = v184.Rotation + 0.5
		local v185 = u183.TextFrame.ProeliumBG
		v185.Rotation = v185.Rotation + 0.5
	end)
	u7.CharacterAdded:Once(function() --[[ Line: 661 ]]
		--[[
        Upvalues:
            [1] = u186
        --]]
		u186:Disconnect()
	end)
end)
v8.CreateContract.OnClientEvent:Connect(function(p187, p188, p189) --[[ Line: 667 ]]
	--[[
    Upvalues:
        [1] = u18
        [2] = u7
        [3] = u6
    --]]
	u18:Print("Got the contract", p187, p189)
	local u190 = u7.PlayerGui.Stats.ContractsActive.Template:Clone()
	u190.Name = "Contract" .. p189
	u190.ContractName.Text = AddSpaceBeforeUppercase(p187)
	local v191 = u6.Contracts.NormalContracts:FindFirstChild(p187)
	local v192 = u6.Contracts.SpecialContracts:FindFirstChild(p187)
	local v193 = u190.Description
	local v194 = not (v191 and (v191.Description and v191.Description.Value)) and (v192 and v192.Description)
	if v194 then
		v194 = v192.Description.Value
	end
	v193.Text = v194
	u190.Visible = true
	u190.Parent = u7.PlayerGui.Stats.ContractsActive
	u190.Added:Play()
	local u195 = p188
	local v196 = u190.Description["Time Left"]
	local v197 = u195
	local v198 = v197 / 60
	local v199 = math.floor(v198)
	local v200 = v197 % 60
	v196.Text = string.format("%02d:%02d", v199, v200)
	local u201 = nil
	u201 = game:GetService("RunService").Stepped:Connect(function(_, p202) --[[ Line: 693 ]]
		--[[
        Upvalues:
            [1] = u190
            [2] = u201
            [3] = u195
        --]]
		if u190 == nil then
			u201:Disconnect()
			return
		else
			u195 = u195 - p202
			if u195 <= 0 then
				u190.Description["Time Left"].Text = "00:00"
				u201:Disconnect()
			else
				local v203 = u190.Description["Time Left"]
				local v204 = u195
				local v205 = math.floor(v204)
				local v206 = v205 / 60
				local v207 = math.floor(v206)
				local v208 = v205 % 60
				v203.Text = string.format("%02d:%02d", v207, v208)
			end
		end
	end)
	if u190.Description.TextFits == false then
		u190.Description.TextScaled = true
	end
	u190.Destroying:Connect(function() --[[ Line: 707 ]]
		--[[
        Upvalues:
            [1] = u201
        --]]
		u201:Disconnect()
	end)
end)
v8.UpdateContract.OnClientEvent:Connect(function(p209, p210, p211) --[[ Line: 712 ]]
	--[[
    Upvalues:
        [1] = u7
    --]]
	for _, v212 in u7.PlayerGui.Stats.ContractsActive:GetChildren() do
		if v212.Name == "Contract" .. p211 then
			v212.Description.Text = p210
			v212.ContractName.Text = p209
			v212.Updated:Play()
		end
	end
end)
v8.RemoveContract.OnClientEvent:Connect(function(p213) --[[ Line: 722 ]]
	--[[
    Upvalues:
        [1] = u7
    --]]
	for _, v214 in u7.PlayerGui.Stats.ContractsActive:GetChildren() do
		if v214.Name == "Contract" .. p213 then
			v214:Destroy()
		end
	end
end)
v8.ClearRolandSmoke.OnClientEvent:Connect(function() --[[ Line: 730 ]]
	--[[
    Upvalues:
        [1] = u7
    --]]
	for _, v215 in pairs(u7.Character:GetDescendants()) do
		if v215.Name == "PerceptionSmoke" and v215:IsA("ParticleEmitter") then
			v215.Enabled = false
		end
	end
end)
v8.CameraShatterFX.OnClientEvent:Connect(function(p216) --[[ Line: 739 ]]
	--[[
    Upvalues:
        [1] = u6
        [2] = u11
        [3] = u3
    --]]
	local u217 = u6.Assets.GlassShatterCameraFX:Clone()
	u11.Debris(u217, p216 + 4)
	u217.Parent = workspace.Thrown
	for _, u218 in pairs(u217:GetChildren()) do
		if u218:IsA("BasePart") then
			local v219 = u218.Transparency
			local u220 = u218.Rotation
			u218.Transparency = 1
			u218.Rotation = Vector3.new(0, 0, 0)
			u3:Create(u218, TweenInfo.new(p216 / 2.5), {
				["Transparency"] = v219,
			}):Play()
			task.delay(p216 / 2.5, function() --[[ Line: 750 ]]
				--[[
                Upvalues:
                    [1] = u3
                    [2] = u218
                    [3] = u220
                --]]
				local v221 = {
					["Rotation"] = u220,
				}
				u3:Create(u218, TweenInfo.new(0.05), v221):Play()
			end)
		end
	end
	local u222 = game:GetService("RunService").RenderStepped:Connect(function() --[[ Line: 758 ]]
		--[[
        Upvalues:
            [1] = u217
        --]]
		u217:PivotTo(workspace.CurrentCamera.CFrame * CFrame.new(0, 0, -5))
	end)
	task.delay(p216, function() --[[ Line: 761 ]]
		--[[
        Upvalues:
            [1] = u217
            [2] = u6
            [3] = u222
        --]]
		for _, v223 in pairs(u217:GetChildren()) do
			if v223:IsA("BasePart") then
				local v224 = u6.Assets.EGOShardsScreen:Clone()
				v224.Enabled = false
				v224.Parent = v223
				v224:Emit(5)
				v223.Anchored = false
			end
		end
		u222:Disconnect()
	end)
end)
local u225 = require(u6.Modules.ColorPicker).new()
function v8.OpenColorWheel.OnClientInvoke() --[[ Line: 778 ]]
	--[[
    Upvalues:
        [1] = u225
    --]]
	u225:Start()
	local v226 = u225.Closed:wait()
	if v226 == false then
		return nil
	else
		return v226.R .. "," .. v226.G .. "," .. v226.B
	end
end
function AfterImageVFX(p227, p228, p229, p230)
	--[[
    Upvalues:
        [1] = u6
        [2] = u3
    --]]
	for _, v231 in p229 do
		if
			v231:IsA("BasePart")
			and (v231.Name ~= "Face" and (v231.Name ~= "HumanoidRootPart" and v231.Transparency < 1))
		then
			local v232 = v231.CFrame
			local v233
			if v231.Name == "Head" and v231:FindFirstChildOfClass("SpecialMesh") then
				v233 = u6.Assets.MeshHead:Clone()
			else
				v233 = v231:Clone()
			end
			for _, v234 in v233:QueryDescendants(":not(SpecialMesh)") do
				v234:Destroy()
			end
			for _, v235 in v233:QueryDescendants("SpecialMesh") do
				v235.TextureId = ""
			end
			if v233:IsA("MeshPart") then
				v233.TextureID = ""
			end
			v233.CFrame = v232
			v233.CanCollide = false
			v233.Anchored = true
			v233.Color = p227
			v233.Transparency = p228
			v233.Material = Enum.Material.Neon
			v233.Parent = p230
			v233.CanQuery = false
			local v236 = u3
			local v237 = TweenInfo.new(0.3)
			local v238 = {
				["Transparency"] = 1,
			}
			local v239 = v233.Size
			local v240 = math.random(1, 100) / 100
			local v241 = math.random(1, 100) / 100
			local v242 = math.random(1, 100) / 100
			v238.Size = v239 + Vector3.new(v240, v241, v242)
			v236:Create(v233, v237, v238):Play()
		end
	end
end
function SpawnAfterImageShade(p243, p244, p245, p246, p247)
	--[[
    Upvalues:
        [1] = u7
        [2] = u11
    --]]
	if p243 ~= nil then
		if p244 == nil then
			p244 = Color3.fromRGB(0, 0, 0)
		end
		local v248 = p245 == nil and 0.6 or p245
		local v249 = Instance.new("Model")
		v249.Name = "AfterImage" .. p243.Name
		local v250
		if u7:GetAttribute("LowGFX") == true then
			v250 = p243:GetChildren()
		else
			v250 = p243:QueryDescendants("BasePart")
		end
		if p246 == nil then
			p247 = 1
			p246 = 1
		end
		v249.Parent = workspace.Thrown
		u11.Debris(v249, p247 * p246)
		for _ = 1, p246 do
			AfterImageVFX(p244, v248, v250, v249)
			task.wait(p247 / p246)
		end
	end
end
v8.ShadeStep.OnClientEvent:Connect(function(p251, p252, p253, p254, p255) --[[ Line: 863 ]]
	SpawnAfterImageShade(p251, p252, p253, p254, p255)
end)
v8.ShareDisplayName.OnClientEvent:Connect(function(p256) --[[ Line: 868 ]]
	if p256.Character then
		p256.Character:FindFirstChildOfClass("Humanoid").DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Viewer
	end
end)
v8.SkillCheck.OnClientEvent:Connect(function(p257) --[[ Line: 874 ]]
	--[[
    Upvalues:
        [1] = u7
        [2] = u3
        [3] = u11
    --]]
	local v258 = Instance.new("Sound")
	v258.Name = "SkillCheck"
	local u259
	if p257 then
		v258.SoundId = "rbxassetid://131612337155735"
		u259 = u7.PlayerGui.OverlayGui.Green
	else
		v258.SoundId = "rbxassetid://121716496007720"
		u259 = u7.PlayerGui.OverlayGui.Burn
	end
	task.delay(1.35, function() --[[ Line: 885 ]]
		--[[
        Upvalues:
            [1] = u259
            [2] = u3
        --]]
		u259.ImageTransparency = 0
		u3:Create(u259, TweenInfo.new(0.5), {
			["ImageTransparency"] = 1,
		}):Play()
	end)
	v258.Parent = workspace
	v258:Play()
	u11.Debris(v258, v258.TimeLength)
end)
v8.StartCountdown.OnClientEvent:Connect(function(p260, p261, p262) --[[ Line: 894 ]]
	--[[
    Upvalues:
        [1] = u7
    --]]
	local v263 = u7.PlayerGui.OverlayGui.Countdowns.CountdownTemplate:Clone()
	v263.Text = p260 .. ": " .. p261
	if p262 then
		v263.TextColor3 = p262
	end
	v263.Visible = true
	v263.Parent = u7.PlayerGui.OverlayGui.Countdowns
	for v264 = 1, p261 do
		local v265 = p261 - v264
		v263.Text = p260 .. ": " .. tostring(v265)
		task.wait(1)
	end
	v263:Destroy()
end)
v8.ClearCountdown.OnClientEvent:Connect(function(p266) --[[ Line: 909 ]]
	--[[
    Upvalues:
        [1] = u7
    --]]
	for _, v267 in u7.PlayerGui.OverlayGui.Countdowns:GetChildren() do
		if v267:IsA("TextLabel") and string.find(v267.Text, p266) then
			v267:Destroy()
			return
		end
	end
end)
v8.Aggrod.OnClientEvent:Connect(function() --[[ Line: 919 ]]
	--[[
    Upvalues:
        [1] = u11
    --]]
	if not workspace:FindFirstChild("AlertedEnemy") then
		local v268 = Instance.new("Sound", workspace)
		v268.Name = "AlertedEnemy"
		v268.SoundId = "rbxassetid://99378386665169"
		v268:Play()
		u11.Debris(v268, 3)
	end
end)
v8.LightningBolt.OnClientEvent:Connect(
	function(p269, p270, p271, p272, p273, p274, p275, p276, p277, p278) --[[ Line: 928 ]]
		--[[
    Upvalues:
        [1] = u7
        [2] = u13
        [3] = u14
    --]]
		if not p270 or u7:DistanceFromCharacter(p270) <= 500 then
			local v279 = CFrame.fromAxisAngle((p271 - p270).Unit, 2 * math.random() * 3.141592653589793)
			local v280 = {}
			local v281 = {}
			local v282 = v279 * p273
			v280.WorldPosition = p272
			v280.WorldAxis = v282
			local v283 = v279 * p275
			v281.WorldPosition = p274
			v281.WorldAxis = v283
			local u284 = u13.new(v280, v281, p276)
			local v285 = math.random(-p277, p277)
			local v286 = math.random(-p277, p277)
			u284.CurveSize0 = v285
			u284.CurveSize1 = v286
			u284.PulseSpeed = p278 or 2
			u284.PulseLength = 0.5
			u284.FadeLength = 0.25
			u284.Color = p269
			local u287 = u14.new(u284)
			task.delay(5, function() --[[ Line: 947 ]]
				--[[
            Upvalues:
                [1] = u287
                [2] = u284
            --]]
				pcall(function() --[[ Line: 948 ]]
					--[[
                Upvalues:
                    [1] = u287
                --]]
					u287:Destroy()
				end)
				pcall(function() --[[ Line: 951 ]]
					--[[
                Upvalues:
                    [1] = u284
                --]]
					u284:Destroy()
				end)
			end)
		end
	end
)
v8.WildHuntImpact.OnClientEvent:Connect(function(p288) --[[ Line: 958 ]]
	--[[
    Upvalues:
        [1] = u7
        [2] = u11
        [3] = u3
    --]]
	if u7.Data.ScreenEffectsEnabled.Value ~= false then
		local u289 = Instance.new("ColorCorrectionEffect")
		u289.Saturation = -1
		u289.Brightness = -10
		u289.Contrast = 0
		u289.Enabled = true
		u289.Parent = game.Lighting
		u11.Debris(u289, p288)
		for _ = 1, 3 do
			task.wait(0.62)
			u289.Brightness = 1.5
			u289.Contrast = 4
			task.delay(0.2, function() --[[ Line: 973 ]]
				--[[
                Upvalues:
                    [1] = u3
                    [2] = u289
                --]]
				u3:Create(u289, TweenInfo.new(0.25), {
					["Brightness"] = -10,
					["Contrast"] = 0,
				}):Play()
			end)
		end
	end
end)
u7.Chatted:Connect(function(p290) --[[ Line: 979 ]]
	--[[
    Upvalues:
        [1] = u7
    --]]
	if workspace:FindFirstChild("AprilFools") and string.find(p290, "!Code") then
		local v291 = Instance.new("Sound", workspace)
		v291.SoundId = "rbxassetid://18242404865"
		v291:Play()
		u7:Kick("HELLO? IS ANYONE HERE?")
	end
end)
v8.ChangeFOV.OnClientEvent:Connect(function(u292, p293) --[[ Line: 988 ]]
	--[[
    Upvalues:
        [1] = u7
        [2] = u3
    --]]
	if u7.Data.FOVEnabled.Value ~= false then
		u3:Create(game.Workspace.CurrentCamera, TweenInfo.new(p293), {
			["FieldOfView"] = u292,
		}):Play()
		task.delay(p293 * 2, function() --[[ Line: 992 ]]
			--[[
            Upvalues:
                [1] = u292
                [2] = u3
            --]]
			if u292 ~= 70 then
				if workspace.CurrentCamera.FieldOfView == u292 then
					u3:Create(game.Workspace.CurrentCamera, TweenInfo.new(0.2), {
						["FieldOfView"] = 70,
					}):Play()
				end
			end
		end)
	end
end)
v8.ImpactFrame.OnClientEvent:Connect(function(p294, p295, p296) --[[ Line: 1000 ]]
	--[[
    Upvalues:
        [1] = u7
        [2] = u11
    --]]
	if u7.Data.ScreenEffectsEnabled.Value == false then
		return
	elseif typeof(p295) == "Color3" then
		local v297 = game.Lighting.ImpactFrame:Clone()
		v297.Parent = game.Lighting
		v297.TintColor = p295
		v297.Enabled = true
		local v298 = game.ReplicatedStorage.Assets.HighlightBase:Clone()
		v298.Parent = p296
		v298.FillColor = Color3.fromRGB(0, 0, 0)
		v298.OutlineColor = Color3.fromRGB(0, 0, 0)
		v298.FillTransparency = 0
		v298.OutlineTransparency = 0
		local v299 = game.ReplicatedStorage.Assets.HighlightBase:Clone()
		v299.Parent = u7.Character
		v299.FillColor = Color3.fromRGB(0, 0, 0)
		v299.OutlineColor = Color3.fromRGB(0, 0, 0)
		v299.FillTransparency = 0
		v299.OutlineTransparency = 0
		u11.Debris(v298, p294)
		u11.Debris(v299, p294)
		u11.Debris(v297, p294)
		task.wait(p294 - 0.2)
		local v300 = game:GetService("TweenService")
		v300:Create(v297, TweenInfo.new(0.2), {
			["Brightness"] = 0,
			["Saturation"] = 0,
			["TintColor"] = Color3.fromRGB(255, 255, 255),
		}):Play()
		v300:Create(v298, TweenInfo.new(0.2), {
			["FillTransparency"] = 1,
			["OutlineTransparency"] = 1,
		}):Play()
		v300:Create(v299, TweenInfo.new(0.2), {
			["FillTransparency"] = 1,
			["OutlineTransparency"] = 1,
		}):Play()
		task.wait(0.2)
		v297.Enabled = false
		v298:Destroy()
		v299:Destroy()
	end
end)
local u301 = game:GetService("RunService")
local u302 = game:GetService("Players").LocalPlayer
local u303 = game.ReplicatedStorage:WaitForChild("Events")
u303.AutoCloseDialogue.OnClientEvent:Connect(function(u304) --[[ Line: 1045 ]]
	--[[
    Upvalues:
        [1] = u302
        [2] = u303
        [3] = u301
    --]]
	local u305 = u304.PrimaryPart
	u304:FindFirstChild("Head")
	local u306 = u304:FindFirstChild("Torso")
	local u307 = u302.Character
	local u308 = u307:FindFirstChild("HumanoidRootPart")
	local u309 = u307:FindFirstChild("Head")
	local u310 = u304:FindFirstChild("InteractPrompt")
	local u311 = u302.Data:FindFirstChild("IsTalking")
	local u312
	if u306 then
		u312 = u306:FindFirstChild("Neck")
	else
		u312 = u306
	end
	local u313
	if u312 then
		u313 = u312.C0 or nil
	else
		u313 = nil
	end
	local u314 = 0
	local u315 = nil
	local function u322() --[[ Line: 1066 ]]
		--[[
        Upvalues:
            [1] = u303
            [2] = u315
            [3] = u312
            [4] = u313
            [5] = u301
        --]]
		u303.CloseDialogue:FireServer()
		if u315 then
			u315:Disconnect()
		end
		if u312 and u313 then
			local u316 = u312.C0
			local u317 = 0
			u312:AddTag("NoMove")
			local u318 = nil
			u318 = u301.RenderStepped:Connect(function(p319) --[[ Line: 1076 ]]
				--[[
                Upvalues:
                    [1] = u317
                    [2] = u312
                    [3] = u316
                    [4] = u313
                    [5] = u318
                --]]
				u317 = u317 + p319
				local v320 = u317 / 0.1
				local v321 = math.clamp(v320, 0, 1)
				u312.C0 = u316:Lerp(u313, v321)
				if v321 >= 1 then
					u312.C0 = u313
					u318:Disconnect()
					u312:RemoveTag("NoMove")
				end
			end)
		end
	end
	u315 = u301.Heartbeat:Connect(function() --[[ Line: 1092 ]]
		--[[
        Upvalues:
            [1] = u302
            [2] = u304
            [3] = u305
            [4] = u322
            [5] = u307
            [6] = u308
            [7] = u309
            [8] = u310
            [9] = u311
            [10] = u312
            [11] = u306
            [12] = u314
            [13] = u313
        --]]
		if u302 and (u304 and u305) then
			if u307 then
				if u308 and (u309 and (u310 and u311)) then
					if u307.Parent and u308.Parent then
						local v323 = (u308.Position - u305.Position).Magnitude
						if u311.Value and u310.MaxActivationDistance + 5 >= v323 then
							if u312 and not u312:HasTag("NoMove") then
								local v324 = (u309.Position - u306.Position).Unit
								local v325 = u306.CFrame.LookVector
								local v326 = u306.CFrame.RightVector:Dot(v324)
								local v327 = v325:Dot(v324)
								local v328 = math.atan2(v326, v327)
								u314 = u314 + (math.clamp(v328, -0.9599310885968813, 0.9599310885968813) - u314) * 0.15
								u312.C0 = CFrame.Angles(0, -u314, 0) * u313
							end
						else
							u322()
							return
						end
					else
						u322()
						return
					end
				else
					u322()
					return
				end
			else
				u322()
				return
			end
		else
			u322()
			return
		end
	end)
end)
game.CollectionService:GetInstanceAddedSignal(u302.Name .. "HighlightNPC"):Connect(function(p329) --[[ Line: 1135 ]]
	--[[
    Upvalues:
        [1] = u18
    --]]
	if not p329 then
		return u18:Warn("Highlight not found")
	end
	p329.Enabled = true
end)
function u303.ContractComm.OnClientInvoke(p330, ...) --[[ Line: 1141 ]]
	return require(script:FindFirstChild(p330))(...)
end
local u331 = {}
for _, v332 in v4:GetTagged("OceanTexture") do
	if v332:IsA("Texture") and not table.find(u331, v332) then
		table.insert(u331, v332)
	end
end
v4:GetInstanceAddedSignal("OceanTexture"):Connect(function(p333) --[[ Line: 1163 ]]
	--[[
    Upvalues:
        [1] = u331
    --]]
	if p333:IsA("Texture") and not table.find(u331, p333) then
		local v334 = u331
		table.insert(v334, p333)
	end
end)
v4:GetInstanceRemovedSignal("OceanTexture"):Connect(function(p335) --[[ Line: 1167 ]]
	--[[
    Upvalues:
        [1] = u331
    --]]
	local v336 = table.find(u331, p335)
	if v336 then
		table.remove(u331, v336)
	end
end)
local u337 = 0
u301.Heartbeat:Connect(function(p338) --[[ Line: 1178 ]]
	--[[
    Upvalues:
        [1] = u337
        [2] = u331
    --]]
	u337 = u337 + 25 * p338
	for _, v339 in u331 do
		if v339.Parent then
			v339.OffsetStudsU = u337
		end
	end
end)
