local walkSpeed = require("../Features/Character/WalkSpeed")
local infJump = require("../Features/Character/Infjump")
local noclip = require("../Features/Character/Noclip")
local noRagdoll = require("../Features/Character/RagdollCancel")
local fly = require("../Features/Character/Fly")
local hitFloat = require("../Features/Character/hitFloat")
local bringBackHitRotate = require("../Features/Character/BringBackHitRotate")
local noCooldown = require("../Features/Character/noCooldown")
local noEndlag = require("../Features/Removal/noEndlag")
local dashNoCD = require("../Features/Removal/DashNoCD")
local noFall = require("../Features/Removal/NoFallAndStaminaDrain")
local noKillBrick = require("../Features/Removal/noKillBrick")
local noWeather = require("../Features/Removal/noWeather")
local killAura = require("../Features/Troll/KillAura")
local NoCamShake = require("../Features/Removal/NoCamShake")
local autoShinMang = require("../Features/Character/autoShinMang")

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

local TeleportTable = {
	["Great Height (Yuria)"] = CFrame.new(747.6103515625, 770.224853515625, -51.407676696777344),
	["Sentenza"] = CFrame.new(439.9958801269531, -7.5, 438.1730651855469),
	["Hana Association"] = CFrame.new(310.8846740722656, 27.500045776367188, 570.3676147460938),
	["The Darius"] = CFrame.new(94.9479751586914, 30.540618896484375, 851.0762329101562),
	["The Tower"] = CFrame.new(-1003.6781616210938, 697.5252685546875, 1431.3994140625),
	["Ocean Appoarch"] = CFrame.new(-1193.6763916015625, -10.500003814697266, 976.7411499023438),
	["Chemical Factory"] = CFrame.new(-1277.293701171875, 190.02536010742188, -83.25059509277344),
	["Construction Site"] = CFrame.new(-776.7263793945312, 63.62499237060547, -32.27681350708008),
	["Everything Workshop"] = CFrame.new(159.12794494628906, 64.49998474121094, 112.2244644165039),
	["Dumpster Guy (Dungeon)"] = CFrame.new(295.69189453125, 64.49998474121094, -147.36453247070312),
}
local TeleportText = {
	"Great Height (Yuria)",
	"Dumpster Guy (Dungeon)",
	"Sentenza",
	"Hana Association",
	"The Darius",
	"The Tower",
	"Ocean Appoarch",
	"Chemical Factory",
	"Construction Site",
	"Everything Workshop",
}

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
	leftSide:AddLabel("Fly Keybind"):AddKeyPicker("flyKeybind", {
		Default = "",
		Mode = "Toggle",
		Text = "ESP Mob Keybind",
		NoUI = false,
		Callback = function(Value)
			if Toggles.Fly.Value then
				Toggles.Fly:SetValue(false)
			else
				Toggles.Fly:SetValue(true)
			end
		end,
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

	leftSide:AddLabel("WalkSpeed Keybind"):AddKeyPicker("walkSpeedKeybind", {
		Default = "",
		Mode = "Toggle",
		Text = "ESP Mob Keybind",
		NoUI = false,
		Callback = function(Value)
			if Toggles.WalkSpeed.Value then
				Toggles.WalkSpeed:SetValue(false)
			else
				Toggles.WalkSpeed:SetValue(true)
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

	leftSide:AddLabel("Noclip Keybind"):AddKeyPicker("noClipKeybind", {
		Default = "",
		Mode = "Toggle",
		Text = "Noclip Keybind",
		NoUI = false,
		Callback = function(Value)
			if Toggles.Noclip.Value then
				Toggles.Noclip:SetValue(false)
			else
				Toggles.Noclip:SetValue(true)
			end
		end,
	})

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

	-- Skill Cooldown
	rightSide:AddToggle("AutoShinMang", {
		Text = "Auto Shin Mang",
		Default = false,
		Tooltip = "Activate on configured Sp Point threshold",
	})

	rightSide:AddSlider("autoShinMangSanity", {
		Text = "Activation SP Point",
		Default = 0,
		Min = -45,
		Max = 45,
		Rounding = 0,
		Tooltip = "Depends on your liking.",
	})

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

	leftSideDown:AddToggle("noStaminaDrain", {
		Text = "No Stamina Drain",
		Default = false,
		Tooltip = "Same as above",
	})

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

	leftSideDown:AddToggle("noRecoil", {
		Text = "No Recoil or Camera Shake",
		Default = false,
		Tooltip = "Same as above",
	})

	rightSideDown:AddDropdown("areaSelection", {
		Values = TeleportText,
		Default = "",
		Multi = false,
		Text = "Select Area",
		Tooltip = "Chose Area To Teleport To",
	})
	rightSideDown:AddButton({
		Text = "Teleport To Area",
		Func = function()
			if TeleportTable[Options.areaSelection.Value] then
				Players.LocalPlayer.Character:PivotTo(TeleportTable[Options.areaSelection.Value])
			end
		end,
		Tooltip = "Same As Above",
		DoubleClick = false, -- safety: require double click
	})

	rightSideDown:AddDropdown("playerSelection", {
		Values = getPlayerNames(),
		Default = "Normal",
		Multi = false,
		Text = "Select Player",
		Tooltip = "Choose Player To Teleport To",
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
