local ESP = require("Features/Visuals/ESPMain")
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

local ESPMob = {}
LPH_NO_VIRTUALIZE(function()
	local R6_PARTS = { "HumanoidRootPart" }

	local function characterESP(character, espTag, color)
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
						local username = character.Name
						local health = "["
							.. tostring(math.floor(character.Humanoid.Health))
							.. "/"
							.. tostring(character.Humanoid.MaxHealth)
							.. "]"
						return {
							username,
							health,
							tostring(distance) .. "m",
						}
					end,
					getColor = function()
						return color
					end,
				})
			end
		end
	end

	local connection

	function ESPMob.on(color)
		if connection then
			connection:Disconnect()
		end

		connection = workspace.Alive.ChildAdded:Connect(function(mob)
			if not Players:GetPlayerFromCharacter(mob) then
				characterESP(mob, "mob", color)
			end
		end)

		for _, mob in workspace.Alive:GetChildren() do
			if not Players:GetPlayerFromCharacter(mob) then
				characterESP(mob, "mob", color)
			end
		end
	end

	function ESPMob.off()
		if connection then
			connection:Disconnect()
		end
		ESP.Disable("mob")
	end
end)()
return ESPMob
