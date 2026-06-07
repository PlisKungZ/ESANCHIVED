local ESP = require("Features/Visuals/ESPMain")
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

local ESPPlayer = {}

local playerESPTable = {}
local connections = {}

LPH_NO_VIRTUALIZE(function()
	local R6_PARTS = { "HumanoidRootPart" }
	local function getSelections()
		if not Options.espPlayerSelection.Value then
			return {}
		end
		local Values = {}
		for value, State in next, Options.espPlayerSelection.Value do
			table.insert(Values, value)
		end
		return Values
	end
	local function getText(player, espSelection)
		local playerUsername = player.Name
		local displayName = "[" .. tostring(player.Data.DisplayName.Value) .. "]"
		local ping = "[" .. tostring(player:GetAttribute("AveragePing")) .. "ms]"
		local health = "["
			.. tostring(math.floor(player.Character.Humanoid.Health))
			.. "/"
			.. tostring(player.Character.Humanoid.MaxHealth)
			.. "]"
		local grade = "[Grade " .. tostring(player.Data.Grade.Value) .. "]"
		local singu = player.Data.Singularity.Value ~= "" and " [" .. player.Data.Singularity.Value .. "]" or ""

		local lines = {}

		if table.find(espSelection, "Username") and table.find(espSelection, "Character Name") then
			table.insert(lines, playerUsername .. " " .. displayName)
		elseif table.find(espSelection, "Username") then
			table.insert(lines, playerUsername)
		elseif table.find(espSelection, "Character Name") then
			table.insert(lines, displayName)
		end

		if table.find(espSelection, "Ping") and table.find(espSelection, "Health") then
			table.insert(lines, ping .. " " .. health)
		elseif table.find(espSelection, "Ping") then
			table.insert(lines, ping)
		elseif table.find(espSelection, "Health") then
			table.insert(lines, health)
		end

		if table.find(espSelection, "Grade") and table.find(espSelection, "Singularity") then
			table.insert(lines, grade .. singu)
		elseif table.find(espSelection, "Grade") then
			table.insert(lines, grade)
		elseif table.find(espSelection, "Singularity") then
			table.insert(lines, singu)
		end

		--[[ 		if table.find(espSelection, "Distance") then
			table.insert(lines, tostring(distance) .. "m")
		end ]]
		return table.concat(lines, "\n")
	end

	local connection

	function ESPPlayer.on(color, espSelection)
		ESPPlayer.off()

		for _, player in Players:GetPlayers() do
			if player ~= localPlayer and player.Character then
				repeat
					task.wait()
				until player.Character:FindFirstChild("Head")
				local esp = ESP:Add({
					AfterUpdate = function(self)
						if self.CurrentSettings then
							self.CurrentSettings.Name = getText(player, getSelections())
						end
					end,
					Name = getText(player, getSelections()),

					Model = player.Character,
					TextModel = player.Character.Head,

					Color = Options.espPlayerColor.Value,
					MaxDistance = math.huge,

					TextSize = 18,

					ESPType = "Highlight",

					FillColor = Options.espPlayerColor.Value,
					OutlineColor = Options.espPlayerColor.Value,
					FillTransparency = 0.5,
					OutlineTransparency = 0,
				})
				table.insert(playerESPTable, esp)
			end
		end

		connection = workspace.Alive.ChildAdded:Connect(function(character)
			local player = Players:GetPlayerFromCharacter(character)
			if player and player ~= localPlayer and player.Character then
				--characterESP(player.Character, "player", color, espSelection)
				repeat
					task.wait()
				until player.Character:FindFirstChild("Head")

				local esp = ESP:Add({
					Name = getText(player, getSelections()),
					Model = player.Character,
					TextModel = player.Character.Head,
					-- TextModel = character.Head,
					-- ↑ This would change the Billboard's Adornee to the Player's Head

					Color = Options.espPlayerColor.Value,
					MaxDistance = math.huge,

					TextSize = 18,

					ESPType = "Highlight",

					FillColor = Options.espPlayerColor.Value,
					OutlineColor = Options.espPlayerColor.Value,
					FillTransparency = 0.5,
					OutlineTransparency = 0,
					AfterUpdate = function(self)
						if self.CurrentSettings then
							self.CurrentSettings.Name = getText(player, getSelections())
						end
					end,
				})
				table.insert(playerESPTable, esp)
			end
		end)
	end

	function ESPPlayer.off()
		for _, something in playerESPTable do
			something:Destroy()
		end
		if connection then
			connection:Disconnect()
			connection = nil
		end
	end
end)()

return ESPPlayer
