local ESPPlayer = require("Features/Visuals/ESPPlayer")
local ESPMob = require("Features/Visuals/ESPMob")
local ESPNpc = require("Features/Visuals/ESPNpc")
local spectate = require("Features/Visuals/ClickToSpectate")
local streamer = require("Features/Visuals/StreamerMode")
local gradePoint = require("Features/Visuals/GradePoint")

local Visuals = {}

function Visuals.init()
	LPH_NO_VIRTUALIZE(function()
		local Tab = window:AddTab({ Title = "Visuals", Icon = "" })
		Tab:AddButton({
			Title = "Streamer Mode",
			Description = "Hide your info when screensharing",
			Callback = function()
				streamer.on()
			end,
		})

		local spectatePlayerToggle =
			Tab:AddToggle("spectatePlayerToggle", { Title = "Click Leaderboard to Spectate", Default = false })

		spectatePlayerToggle:OnChanged(function()
			if Options.spectatePlayerToggle.Value then
				spectate.on()
			else
				spectate.off()
			end
		end)

		local espPlayerToggle = Tab:AddToggle("espPlayerToggle", { Title = "ESP Player", Default = false })

		espPlayerToggle:OnChanged(function()
			if Options.espPlayerToggle.Value then
				local Values = {}
				for value, State in next, Options.espPlayerSelection.Value do
					table.insert(Values, value)
				end
				ESPPlayer.on(Options.espPlayerColor.Value, Values)
			else
				ESPPlayer.off()
			end
		end)

		local espPlayerColor = Tab:AddColorpicker("espPlayerColor", {
			Title = "Player Color",
			Default = Color3.fromRGB(96, 205, 255),
		})

		local espPlayerSelection = Tab:AddDropdown("espPlayerSelection", {
			Title = "ESP Types",
			Values = {
				"Username",
				"Character Name",
				"Ping",
				"Health",
				"Grade",
				"Singularity",
				"Distance",
			},
			Multi = true,
			Default = { "Username", "Character Name", "Health" },
		})

		espPlayerSelection:OnChanged(function(Value)
			ESPPlayer.off()

			local Values = {}
			for value, State in next, Value do
				table.insert(Values, value)
			end
			if Options.espPlayerToggle.Value then
				ESPPlayer.on(Options.espPlayerColor.Value, Values)
			end
		end)

		espPlayerColor:OnChanged(function()
			ESPPlayer.off()
			if Options.espPlayerToggle.Value then
				local Values = {}
				for value, State in next, Options.espPlayerSelection.Value do
					table.insert(Values, value)
				end
				ESPPlayer.on(Options.espPlayerColor.Value, Values) -- pass Values not raw .Value
			end
		end)

		local espPlayerKeybind = Tab:AddKeybind("espPlayerKeybind", {
			Title = "ESP Player Keybind",
			Mode = "Toggle",
			Default = "",
			Callback = function(Value)
				Options.espPlayerToggle:SetValue(Value)
			end,
		})

		local espMobToggle = Tab:AddToggle("espMobToggle", { Title = "ESP Mob", Default = false })

		espMobToggle:OnChanged(function()
			if Options.espMobToggle.Value then
				ESPMob.on(Options.espMobColor.Value)
			else
				ESPMob.off()
			end
		end)

		local espMobColor = Tab:AddColorpicker("espMobColor", {
			Title = "Mob Color",
			Default = Color3.fromRGB(211, 49, 8),
		})

		espMobColor:OnChanged(function()
			ESPMob.off()
			if Options.espMobToggle.Value then
				ESPMob.on(Options.espMobColor.Value)
			end
		end)

		local espMobKeybind = Tab:AddKeybind("espMobKeybind", {
			Title = "ESP Mob Keybind",
			Mode = "Toggle",
			Default = "",
			Callback = function(Value)
				Options.espMobToggle:SetValue(Value)
			end,
		})

		local espNpcToggle = Tab:AddToggle("espNpcToggle", { Title = "ESP Npc", Default = false })

		espNpcToggle:OnChanged(function()
			if Options.espNpcToggle.Value then
				ESPNpc.on(Options.espNpcColor.Value)
			else
				ESPNpc.off()
			end
		end)

		local espNpcColor = Tab:AddColorpicker("espNpcColor", {
			Title = "Npc Color",
			Default = Color3.fromRGB(155, 6, 255),
		})

		espNpcColor:OnChanged(function()
			ESPMob.off()
			if Options.espNpcToggle.Value then
				ESPNpc.on(Options.espNpcColor.Value)
			end
		end)

		local espNpcKeybind = Tab:AddKeybind("espNpcKeybind", {
			Title = "ESP Npc Keybind",
			Mode = "Toggle",
			Default = "",
			Callback = function(Value)
				Options.espNpcToggle:SetValue(Value)
			end,
		})

		local gradePointToggle = Tab:AddToggle("gradePointToggle", { Title = "Grade Point UI", Default = false })

		gradePointToggle:OnChanged(function()
			if Options.gradePointToggle.Value then
				gradePoint.on()
			else
				gradePoint.off()
			end
		end)
	end)()
end

return Visuals
