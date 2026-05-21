local VirtualInputManager = game:GetService("VirtualInputManager")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local localPlayer = Players.LocalPlayer

local AutoRailway = {}

local connection
local track = {}
local isM1oneToThreeYet = false

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

local function checkIfStationYet()
	if not workspace.Map:FindFirstChild("StationDisplay") then
		return false
	end
	for _, something in workspace.Map.StationDisplay:GetChildren() do
		if something:IsA("Attachment") then
			if something:FindFirstChildWhichIsA("ProximityPrompt") then
				if something:FindFirstChildWhichIsA("ProximityPrompt").Enabled then
					return true
				end
			end
		end
	end
	return false
end

local function attachmentCounter()
	local count = 0
	if not workspace.Map:FindFirstChild("StationDisplay") then
		return 0
	end
	for _, v in workspace.Map.StationDisplay:GetChildren() do
		if v:IsA("Attachment") then
			count = count + 1
		end
	end
	return count
end

local function checkForStuffandClick(name)
	if not workspace.Map:FindFirstChild("StationDisplay") then
		return false
	end
	for _, v in workspace.Map.StationDisplay:GetChildren() do
		if v:IsA("Attachment") then
			if v.Name:find(name) or v.Name == name then
				localPlayer.Character:PivotTo(v.WorldCFrame)
				if v:FindFirstChildWhichIsA("ProximityPrompt").Enabled then
					fireproximityprompt(v:FindFirstChildWhichIsA("ProximityPrompt"))
					return true
				end
			end
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

local function splitString(str, sep)
	sep = sep or ","
	local result = {}
	for item in str:gmatch("[^" .. sep .. "]+") do
		table.insert(result, item:lower())
	end
	return result
end

local enemyLists = { "Nothing There", "Sweeper Brute" }

local blackListedAnim = {
	"rbxassetid://16428863879",
	"rbxassetid://16390219304",
	"rbxassetid://16390215619",
	"rbxassetid://16390221563",
	"rbxassetid://16390165394",
	"rbxassetid://16390173071",
	"rbxassetid://16390234461",
	"rbxassetid://16390226552",
	"rbxassetid://15151732756",
	"rbxassetid://17452190205",
	"rbxassetid://17450213059",
	"rbxassetid://17450216584",
	"rbxassetid://17452468519",
	"rbxassetid://17457663944",
	"rbxassetid://17460411925",
}
local Teleported = false
local teleportToMerchantdb = false
local pickingUpItem = false
local equipedDb = false

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
	connection = RunService.PostSimulation:Connect(LPH_NO_VIRTUALIZE(function(delta)
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

		local offset = Vector3.new(math.random(0, 1), -math.random(offset, offset + 1), math.random(0, 1))

		if #targetTable ~= 0 then
			if not equipedDb then
				equipedDb = true
				game:GetService("ReplicatedStorage").Events.Equip:FireServer(true)
				for _, anim in track do
					anim:Stop()
					anim:Destroy()
				end
				table.clear(track)
				for i = 1, 3 do
					local animtrack = player:LoadAnimation(
						game:GetService("ReplicatedStorage").WeaponINFO[game.Players.LocalPlayer.Data.Weapon.Value]["AttackAnimation" .. tostring(
							i
						)]
					)

					game:GetService("ReplicatedStorage").Events.BegunM1
						:FireServer(game.Players.LocalPlayer.Data.Weapon.Value)

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
						game:GetService("ReplicatedStorage").Events.Equip:FireServer(false)
					end
					equipedDb = false
				end)
			end
			localPlayer.Character.HumanoidRootPart.Anchored = false
			for _, animTrack in track do
				animTrack:AdjustSpeed(100000)
			end
			if not m1Debounce then
				m1Debounce = true
				game:GetService("ReplicatedStorage").Events.BegunM1
					:FireServer(game.Players.LocalPlayer.Data.Weapon.Value)
				task.delay(0.75, function()
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
			if not table.find(enemyLists, targetTable[1].Name) then
				if targetTable[1].Name == "Sweeper δ" or targetTable[1].Name == "Sweeper α" then
					if targetTable[1]:FindFirstChild("Staggered") then
						local targetHRP = targetTable[1].HumanoidRootPart
						local targetPos = targetHRP.Position
						local behind = targetHRP.CFrame.LookVector * -5
						local myPos = targetPos + behind
						localPlayer.Character.HumanoidRootPart:PivotTo(CFrame.lookAt(myPos, targetPos))
					else
						localPlayer.Character.HumanoidRootPart:PivotTo(
							targetTable[1].HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0) + offset
						)
					end
				elseif targetTable[1].Name == "Gnome" then
					localPlayer.Character.HumanoidRootPart:PivotTo(
						targetTable[1].HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0)
							+ Vector3.new(0, -5, 0)
					)
				else
					localPlayer.Character.HumanoidRootPart:PivotTo(
						targetTable[1].HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0) + offset
					)
				end

				workspace.CurrentCamera.CameraSubject = targetTable[1].Humanoid
				localPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
				localPlayer.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
				localPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
				if targetTable[1]:FindFirstChild("Knocked") and targetTable[1].Name ~= "Sweeper δ" then
					localPlayer.Character.HumanoidRootPart:PivotTo(
						targetTable[1].HumanoidRootPart.CFrame + Vector3.new(0, 4, 0)
					)
				elseif targetTable[1]:FindFirstChild("Knocked") then
					localPlayer.Character.HumanoidRootPart:PivotTo(
						targetTable[1].HumanoidRootPart.CFrame + Vector3.new(0, -5, 0)
					)
				end
			else
				if targetTable[1].Name == "Nothing There" then
					if not checkAnimations(blackListedAnim, targetTable[1].Humanoid.Animator) then
						localPlayer.Character.HumanoidRootPart:PivotTo(
							targetTable[1]:GetPivot() + Vector3.new(0, 100, 0)
						)
					else
						localPlayer.Character.HumanoidRootPart:PivotTo(targetTable[1].HumanoidRootPart.CFrame)
						workspace.CurrentCamera.CameraSubject = targetTable[1].Humanoid
					end
				elseif targetTable[1].Name == "Sweeper Brute" then
					localPlayer.Character.HumanoidRootPart:PivotTo(
						targetTable[1].HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0)
							+ Vector3.new(math.random(0, 1), -10, math.random(0, 1))
					)
				end
			end
		else
			localPlayer.Character.HumanoidRootPart.Anchored = false
			workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
			for _, animTrack in track do
				animTrack:Play()
				animTrack:AdjustSpeed(0)
			end
			if equipedDb then
				game:GetService("ReplicatedStorage").Events.Equip:FireServer(false)
				equipedDb = false
			end
			if pickingUpItem then
				return
			end
			local droppedItems = getDroppedItems()
			if #droppedItems ~= 0 then
				pickingUpItem = true
				for _, item in droppedItems do
					if not connection then
						return
					end
					for _, prompt in item:GetDescendants() do
						if prompt:IsA("ProximityPrompt") then
							localPlayer.Character:PivotTo(item:GetPivot())
							fireproximityprompt(prompt)
							if not connection then
								return
							end
							repeat
								if not connection then
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
			if checkIfStationYet() and not workspace.NPCS:FindFirstChild("Railway Merchant") then
				if attachmentCounter() == 4 then
					if checkForStuffandClick("Sing") then
						return
					end
					if checkForStuffandClick("Floor") then
						return
					end
					if checkForStuffandClick("Rare") then
						return
					end
					if checkForStuffandClick("Item") then
						return
					end
					if checkForStuffandClick("HugeAhn") then
						return
					end
					if checkForStuffandClick("Ahn") then
						return
					end
					if checkForStuffandClick("Acc") then
						return
					end
					if checkForStuffandClick("HugeExp") then
						return
					end
					if checkForStuffandClick("Exp") then
						return
					end
					if checkForStuffandClick("Heal") then
						return
					end
				end
			elseif workspace.NPCS:FindFirstChild("Railway Merchant") then
				if Options.autoSellExclude.Value or Options.autoSellInclude.Value then
					local translatedString = splitString(Options.sellInput.Value)
					if Options.autoSellExclude.Value then
						getSellLists(translatedString, "Exclude")
					end
					if Options.autoSellInclude.Value then
						getSellLists(translatedString, "Include")
					end
					if isSellAble then
						localPlayer.Character:PivotTo(
							workspace.NPCS:FindFirstChild("Railway Merchant"):GetPivot() + Vector3.new(-0.5, 0, 0)
						)
						return
					end
				end
			end
			if workspace.AreaMarkers:FindFirstChild("Refraction Railway") then
				localPlayer.Character:PivotTo(
					workspace.AreaMarkers["Refraction Railway"]["Refraction Railway"].CFrame + Vector3.new(0, -30, 0)
				)
			end
		end
	end))
end

function AutoRailway.on(offset, floor)
	AutoRailway.off()
	for _, anim in track do
		anim:Stop()
		anim:Destroy()
	end
	table.clear(track)
	if game.PlaceId ~= 99831550635699 then
		return false, "Not in the Railway"
	end
	if workspace:GetAttribute("ServerType") ~= "RefractionRailway" then
		return false, "Not in the Railway"
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
	if connection then
		connection:Disconnect()
		connection = nil
		localPlayer.Character:PivotTo(
			workspace.AreaMarkers["Refraction Railway"]["Refraction Railway"].CFrame + Vector3.new(0, -30, 0)
		)
	end
	for _, anim in track do
		anim:Stop()
		anim:Destroy()
	end
	table.clear(track)
	m1Debounce = false
	gripDebounce = false
	equipedDb = false
	localPlayer.Character.HumanoidRootPart.Anchored = false
	workspace.CurrentCamera.CameraSubject = localPlayer.Character.Humanoid
end

return AutoRailway
