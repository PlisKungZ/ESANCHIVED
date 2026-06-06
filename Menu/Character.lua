local walkSpeed = require("Features/Character/WalkSpeed")
local infJump = require("Features/Character/Infjump")
local noclip = require("Features/Character/Noclip")
local noRagdoll = require("Features/Character/RagdollCancel")
local fly = require("Features/Character/Fly")
local hitFloat = require("Features/Character/hitFloat")
local bringBackHitRotate = require("Features/Character/BringBackHitRotate")
local noCooldown = require("Features/Character/noCooldown")
local noEndlag = require("Features/Removal/noEndlag")
local dashNoCD = require("Features/Removal/DashNoCD")
local noFall = require("Features/Removal/NoFall")
local noKillBrick = require("Features/Removal/noKillBrick")
local noWeather = require("Features/Removal/noWeather")
local killAura = require("Features/Troll/KillAura")

local Character = {}
local Players = game:GetService("Players")

local function getPlayerNames()
	local names = {}
	for _, player in Players:GetPlayers() do
		if player ~= Players.LocalPlayer then
			table.insert(names, player.Name)
		end
	end
	return names
end
Character.init = LPH_NO_VIRTUALIZE(function()
	local Tab = Window:AddTab("Character", "users")
	local leftSide = Tab:AddLeftGroupbox("Character", "users")
	local rightSide = Tab:AddRightGroupbox("Misc", "ear-off")
	local leftSideDown = Tab:AddLeftGroupbox("Removal", "user-x")
	local rightSideDown = Tab:AddRightGroupbox("Teleportation", "axis-3d")
	-- Fly
	leftSide:AddToggle("Fly", {
		Text = "Fly",
		Default = false,
		Tooltip = "Enable fly mode",
	})
	Toggles.Fly:OnChanged(function()
		if Toggles.Fly.Value then
			fly.on(Options.flySpeedSlider.Value)
		else
			fly.off()
		end
	end)

	leftSide:AddSlider("flySpeedSlider", {
		Text = "Fly Speed",
		Default = 50,
		Min = 50,
		Max = 200,
		Rounding = 1,
		Tooltip = "Increase your fly speed",
		Callback = function(Value) end,
	})

	leftSide:AddDivider()

	-- WalkSpeed
	leftSide:AddToggle("WalkSpeed", {
		Text = "WalkSpeed Multiplier",
		Default = false,
		Tooltip = "Enable walk speed multiplier",
	})
	Toggles.WalkSpeed:OnChanged(function()
		if Toggles.WalkSpeed.Value then
			walkSpeed.on()
		else
			walkSpeed.off(1)
		end
	end)

	leftSide:AddSlider("walkSpeedSlider", {
		Text = "Walk Speed",
		Default = 1,
		Min = 1,
		Max = 50,
		Rounding = 1,
		Tooltip = "Increase your WalkSpeed",
		Callback = function(Value)
			walkSpeed.off()
			if Toggles.WalkSpeed.Value then
				walkSpeed.on(Value)
			end
		end,
	})

	leftSide:AddDivider()

	-- Noclip
	leftSide:AddToggle("Noclip", {
		Text = "Noclip",
		Default = false,
		Tooltip = "Walk through walls",
	})
	Toggles.Noclip:OnChanged(function()
		if Toggles.Noclip.Value then
			noclip.on()
		else
			noclip.off()
		end
	end)

	-- Infinite Jump
	leftSide:AddToggle("InfJump", {
		Text = "Infinite Jump",
		Default = false,
		Tooltip = "Jump infinitely in the air",
	})
	Toggles.InfJump:OnChanged(function()
		if Toggles.InfJump.Value then
			infJump.on()
		else
			infJump.off()
		end
	end)
	-- Right side

	-- Ragdoll Cancel
	rightSide:AddToggle("ragdollCancel", {
		Text = "Auto Ragdoll Cancel",
		Default = false,
		Tooltip = "Automatically cancel ragdoll",
	})
	Toggles.ragdollCancel:OnChanged(function()
		if Toggles.ragdollCancel.Value then
			noRagdoll.on()
		else
			noRagdoll.off()
		end
	end)
	-- bring back hit rotate
	rightSide:AddToggle("bringBackRotate", {
		Text = "Bring Back Hit Rotate",
		Default = false,
	})
	Toggles.bringBackRotate:SetValue(false)
	Toggles.bringBackRotate:OnChanged(function()
		if Toggles.bringBackRotate.Value then
			bringBackHitRotate.on()
		else
			bringBackHitRotate.off()
		end
	end)

	-- M1 Air Spoof
	rightSide:AddToggle("airHit", {
		Text = "M1 On Air Spoof",
		Default = false,
		Tooltip = "Spoof M1 hit while airborne",
	})
	Toggles.airHit:OnChanged(function()
		if Toggles.airHit.Value then
			hitFloat.on()
		else
			hitFloat.off()
		end
	end)
	rightSide:AddToggle("hitAura", {
		Text = "Hit Aura",
		Default = false,
		Tooltip = "Basically M1",
	})
	Toggles.hitAura:OnChanged(function()
		if Toggles.hitAura.Value then
			killAura.on()
		else
			killAura.off()
		end
	end)
	rightSide:AddDivider()

	-- Skill Cooldown
	rightSide:AddDropdown("SkillCooldownSelection", {
		Values = { "Half", "Normal", "None" },
		Default = "Normal",
		Multi = false,
		Text = "Skill Cooldown",
		Tooltip = "Select your skill cooldown mode",
	})
	noCooldown.init()

	Options.SkillCooldownSelection:OnChanged(function()
		print("Skill Cooldown changed to:", Options.SkillCooldownSelection.Value)
	end)

	rightSide:AddDivider()

	-- Instant Log
	rightSide:AddButton({
		Text = "Instant Log",
		Func = function()
			game.Players.LocalPlayer:Destroy()
		end,
		Tooltip = "Instantly leave the game",
		DoubleClick = true, -- safety: require double click
	})

	leftSideDown:AddToggle("fallDamage", {
		Text = "No Fall Damage",
		Default = false,
		Tooltip = "Same as above",
	})

	Toggles.fallDamage:OnChanged(function()
		if Toggles.fallDamage.Value then
			noFall.on()
		else
			noFall.off()
		end
	end)

	leftSideDown:AddToggle("noDashCD", {
		Text = "No Dash Cooldown",
		Default = false,
		Tooltip = "Same as above",
	})

	Toggles.noDashCD:OnChanged(function()
		if Toggles.noDashCD.Value then
			dashNoCD.on()
		else
			dashNoCD.off()
		end
	end)

	leftSideDown:AddToggle("noStun", {
		Text = "No Slow",
		Default = false,
		Tooltip = "Same as above",
	})

	Toggles.noStun:OnChanged(function()
		if Toggles.noStun.Value then
			noEndlag.on()
		else
			noEndlag.off()
		end
	end)

	leftSideDown:AddToggle("noKillBrick", {
		Text = "No Kill Brick",
		Default = false,
		Tooltip = "Same as above",
	})

	Toggles.noKillBrick:OnChanged(function()
		if Toggles.noKillBrick.Value then
			noKillBrick.on()
		else
			noKillBrick.off()
		end
	end)

	leftSideDown:AddToggle("noWeather", {
		Text = "No Weather",
		Default = false,
		Tooltip = "Same as above",
	})

	Toggles.noWeather:OnChanged(function()
		if Toggles.noWeather.Value then
			noWeather.on()
		else
			noWeather.off()
		end
	end)

	rightSideDown:AddDropdown("playerSelection", {
		Values = getPlayerNames(),
		Default = "Normal",
		Multi = false,
		Text = "Select Player",
		Tooltip = "Select your skill cooldown mode",
	})

	Players.PlayerAdded:Connect(function(player)
		if player == Players.LocalPlayer then
			return
		end
		Options.playerSelection:SetValue(getPlayerNames())
	end)

	Players.PlayerRemoving:Connect(function(player)
		if player == Players.LocalPlayer then
			return
		end
		Options.playerSelection:SetValues(getPlayerNames())
	end)

	rightSideDown:AddButton({
		Text = "Teleport To Player",
		Func = function()
			Players.LocalPlayer.Character:PivotTo(Players[Options.playerSelection.Value].Character:GetPivot())
		end,
		Tooltip = "Same As Above",
		DoubleClick = false, -- safety: require double click
	})
end)

return Character
