local ESP = require("Features/Visuals/ESPMain")
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

local ESPPlayer = {}

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

local connection

function ESPPlayer.on(color, espSelection)
	if connection then
		connection:Disconnect()
		connection = nil
	end

	for _, player in Players:GetPlayers() do
		if player ~= localPlayer and player.Character then
			characterESP(player.Character, "player", color, espSelection)
		end
	end

	connection = workspace.Alive.ChildAdded:Connect(function(character)
		local player = Players:GetPlayerFromCharacter(character)
		if player and player ~= localPlayer and player.Character then
			characterESP(player.Character, "player", color, espSelection)
		end
	end)
end

function ESPPlayer.off()
	ESP.Disable("player")
	if connection then
		connection:Disconnect()
		connection = nil
	end
end

return ESPPlayer
