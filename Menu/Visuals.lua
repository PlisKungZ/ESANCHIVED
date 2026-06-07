local ESPPlayer = require("Features/Visuals/ESPPlayer")
local ESPMob = require("Features/Visuals/ESPMob")
local ESPNpc = require("Features/Visuals/ESPNpc")
local spectate = require("Features/Visuals/ClickToSpectate")
local streamer = require("Features/Visuals/StreamerMode")
local gradePoint = require("Features/Visuals/GradePoint")

local Visuals = {}
Visuals.init = LPH_NO_VIRTUALIZE(function()
	local Tab = Window:AddTab("Visuals", "eye")
	local leftSide = Tab:AddLeftGroupbox("Player")
	local rightSide = Tab:AddRightGroupbox("Mobs & NPC")

	-- Streamer Mode
	leftSide:AddButton({
		Text = "Streamer Mode",
		Func = function()
			streamer.on()
		end,
		Tooltip = "Hide your info when screensharing",
		DoubleClick = false,
	})

	-- Spectate
	leftSide:AddToggle("spectatePlayerToggle", {
		Text = "Click Leaderboard to View",
		Default = false,
	})
	Toggles.spectatePlayerToggle:OnChanged(function()
		if Toggles.spectatePlayerToggle.Value then
			spectate.on()
		else
			spectate.off()
		end
	end)

	leftSide:AddDivider()

	-- ESP Player
	leftSide:AddToggle("espPlayerToggle", {
		Text = "ESP Player",
		Default = false,
		Tooltip = "Show ESP for players",
	})
	Toggles.espPlayerToggle:OnChanged(function()
		if Toggles.espPlayerToggle.Value then
			local Values = {}
			for value, State in next, Options.espPlayerSelection.Value do
				table.insert(Values, value)
			end
			ESPPlayer.on(Options.espPlayerColor.Value, Values)
		else
			ESPPlayer.off()
		end
	end)

	leftSide:AddLabel("Player ESP Color"):AddColorPicker("espPlayerColor", {
		Default = Color3.fromRGB(96, 205, 255),
		Title = "Player Color",
	})
	Options.espPlayerColor:OnChanged(function()
		ESPPlayer.off()
		if Toggles.espPlayerToggle.Value then
			local Values = {}
			for value, State in next, Options.espPlayerSelection.Value do
				table.insert(Values, value)
			end
			ESPPlayer.on(Options.espPlayerColor.Value, Values)
		end
	end)

	leftSide:AddDropdown("espPlayerSelection", {
		Text = "ESP Types",
		Values = {
			"Username",
			"Character Name",
			"Ping",
			"Health",
			"Grade",
			"Singularity",
		},
		Multi = true,
		Default = 1,
		Tooltip = "Select which ESP info to display",
	})
	Options.espPlayerSelection:OnChanged(function()
		--[[ 		ESPPlayer.off()
		local Values = {}
		for value, State in next, Options.espPlayerSelection.Value do
			table.insert(Values, value)
		end
		if Toggles.espPlayerToggle.Value then
			ESPPlayer.on(Options.espPlayerColor.Value, Values)
		end ]]
	end)

	leftSide:AddLabel("ESP Player Keybind"):AddKeyPicker("espPlayerKeybind", {
		Default = "",
		Mode = "Toggle",
		Text = "ESP Player Keybind",
		NoUI = false,
		Callback = function(Value)
			if Toggles.espPlayerToggle.Value then
				Toggles.espPlayerToggle:SetValue(false)
			else
				Toggles.espPlayerToggle:SetValue(true)
			end
		end,
	})

	leftSide:AddDivider()

	-- Grade Point UI
	leftSide:AddToggle("gradePointToggle", {
		Text = "Grade Point UI",
		Default = false,
		Tooltip = "Toggle the grade point UI",
	})
	Toggles.gradePointToggle:OnChanged(function()
		if Toggles.gradePointToggle.Value then
			gradePoint.on()
		else
			gradePoint.off()
		end
	end)

	-- ESP Mob
	rightSide:AddToggle("espMobToggle", {
		Text = "ESP Mob",
		Default = false,
		Tooltip = "Show ESP for mobs",
	})
	Toggles.espMobToggle:OnChanged(function()
		if Toggles.espMobToggle.Value then
			ESPMob.on(Options.espMobColor.Value)
		else
			ESPMob.off()
		end
	end)

	rightSide:AddLabel("Mob ESP Color"):AddColorPicker("espMobColor", {
		Default = Color3.fromRGB(211, 49, 8),
		Title = "Mob Color",
	})
	Options.espMobColor:OnChanged(function()
		ESPMob.off()
		if Toggles.espMobToggle.Value then
			ESPMob.on(Options.espMobColor.Value)
		end
	end)

	rightSide:AddLabel("ESP Mob Keybind"):AddKeyPicker("espMobKeybind", {
		Default = "",
		Mode = "Toggle",
		Text = "ESP Mob Keybind",
		NoUI = false,
		Callback = function(Value)
			if Toggles.espMobToggle.Value then
				Toggles.espMobToggle:SetValue(false)
			else
				Toggles.espMobToggle:SetValue(true)
			end
		end,
	})

	rightSide:AddDivider()

	-- ESP NPC
	rightSide:AddToggle("espNpcToggle", {
		Text = "ESP NPC",
		Default = false,
		Tooltip = "Show ESP for NPCs",
	})
	Toggles.espNpcToggle:OnChanged(function()
		if Toggles.espNpcToggle.Value then
			ESPNpc.on(Options.espNpcColor.Value)
		else
			ESPNpc.off()
		end
	end)

	rightSide:AddLabel("NPC ESP Color"):AddColorPicker("espNpcColor", {
		Default = Color3.fromRGB(155, 6, 255),
		Title = "NPC Color",
	})
	Options.espNpcColor:OnChanged(function()
		ESPNpc.off()
		if Toggles.espNpcToggle.Value then
			ESPNpc.on(Options.espNpcColor.Value)
		end
	end)

	rightSide:AddLabel("ESP NPC Keybind"):AddKeyPicker("espNpcKeybind", {
		Default = "",
		Mode = "Toggle",
		Text = "ESP NPC Keybind",
		NoUI = false,
		Callback = function(Value)
			if Toggles.espNpcToggle.Value then
				Toggles.espNpcToggle:SetValue(false)
			else
				Toggles.espNpcToggle:SetValue(true)
			end
		end,
	})
end)

return Visuals
