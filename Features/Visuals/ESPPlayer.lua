local ESP = require("Features/Visuals/ESPMain")
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

local ESPPlayer = {}

local playerESPTable = {}

LPH_NO_VIRTUALIZE(function()
	local R6_PARTS = { "HumanoidRootPart" }
	local function characterESP(character, espTag, color, espSelection)
		local humanoid = character:FindFirstChildWhichIsA("Humanoid")
		if not humanoid then
			return
		end

		local isAlive = function()
			return character and character.Parent and humanoid and humanoid.Parent and humanoid.Health > 0
		end

		for _, partName in ipairs(R6_PARTS) do
			local part = character:FindFirstChild(partName)
			if part then
				ESP.ESPPart(part, {
					tag = espTag,
					isAlive = isAlive,
					getLines = partName == "HumanoidRootPart" and function(distance)
						local player = Players:GetPlayerFromCharacter(character)
						local playerUsername = player.Name
						local displayName = "[" .. tostring(player.Data.DisplayName.Value) .. "]"
						local ping = "[" .. tostring(player:GetAttribute("AveragePing")) .. "ms" .. "]"
						local health = "["
							.. tostring(math.floor(player.Character.Humanoid.Health))
							.. "/"
							.. tostring(player.Character.Humanoid.MaxHealth)
							.. "]"

						local grade = "[Grade " .. tostring(player.Data.Grade.Value) .. "]"
						local singu = " [" .. player.Data.Singularity.Value .. "]"
						if player.Data.Singularity.Value == "" then
							singu = ""
						end

						local finalizedTable = {}

						local bothUser = false
						if table.find(espSelection, "Username") and table.find(espSelection, "Character Name") then
							table.insert(finalizedTable, playerUsername .. " " .. displayName)
							bothUser = true
						end

						if table.find(espSelection, "Username") then
							if not bothUser then
								table.insert(finalizedTable, playerUsername)
							end
						end

						if table.find(espSelection, "Character Name") then
							if not bothUser then
								table.insert(finalizedTable, displayName)
							end
						end
						local bothPingAndH = false

						if table.find(espSelection, "Ping") and table.find(espSelection, "Health") then
							bothPingAndH = true
							table.insert(finalizedTable, ping .. " " .. health)
						end

						if table.find(espSelection, "Ping") then
							if not bothPingAndH then
								table.insert(finalizedTable, ping)
							end
						end

						if table.find(espSelection, "Health") then
							if not bothPingAndH then
								table.insert(finalizedTable, health)
							end
						end
						local bothSinAndGrade = false

						if table.find(espSelection, "Singularity") and table.find(espSelection, "Grade") then
							bothSinAndGrade = true
							table.insert(finalizedTable, grade .. singu)
						end

						if table.find(espSelection, "Grade") then
							if not bothSinAndGrade then
								table.insert(finalizedTable, grade)
							end
						end

						if table.find(espSelection, "Singularity") then
							if not bothSinAndGrade then
								table.insert(finalizedTable, grade)
							end
						end

						if table.find(espSelection, "Distance") then
							table.insert(finalizedTable, tostring(distance) .. "m")
						end
						return finalizedTable
					end,
					getColor = function()
						return color
					end,
				})
			end
		end
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
		if connection then
			connection:Disconnect()
			connection = nil
		end

		for _, player in Players:GetPlayers() do
			if player ~= localPlayer and player.Character then
				repeat
					task.wait()
				until player.Character:FindFirstChild("Head")
				local esp = ESP:Add({
					Name = getText(player, espSelection),

					Model = player.Character,
					TextModel = player.Character.Head,

					Color = color,
					MaxDistance = 1000,

					TextSize = 18,

					ESPType = "Highlight",

					FillColor = color,
					OutlineColor = color,
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
					Name = getText(player, espSelection),
					Model = player.Character,
					TextModel = player.Character.Head,
					-- TextModel = character.Head,
					-- ↑ This would change the Billboard's Adornee to the Player's Head

					Color = color,
					MaxDistance = 1000,

					TextSize = 18,

					ESPType = "Highlight",

					FillColor = color,
					OutlineColor = color,
					FillTransparency = 0.5,
					OutlineTransparency = 0,
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
	print("ye")
end)()

return ESPPlayer
