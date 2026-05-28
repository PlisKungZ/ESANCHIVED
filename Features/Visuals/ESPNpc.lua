local ESP = require("Features/Visuals/ESPMain")
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

local ESPNpc = {}
LPH_NO_VIRTUALIZE(function()
	local function characterESP(mob, espTag, color)
		local part = Instance.new("Part")
		part.Size = Vector3.new(4, 5, 4)
		part.Anchored = true
		part.Transparency = 1
		part.CanCollide = false
		part.CFrame = mob:GetPivot()

		local isAlive = function()
			if mob and mob.Parent then
				-- keep part following mob
				part.CFrame = mob:GetPivot()
				return true
			end
			return false
		end

		ESP.ESPPart(part, {
			tag = espTag,
			isAlive = isAlive,
			getLines = function(distance)
				return {
					mob.Name,
					tostring(distance) .. "m",
				}
			end,
			getColor = function()
				return color
			end,
		})
	end

	local connection

	function ESPNpc.on(color)
		if connection then
			connection:Disconnect()
		end

		connection = workspace.NPCS.ChildAdded:Connect(function(mob)
			if mob:IsA("Model") then
				characterESP(mob, "npc", color)
			end
		end)

		for _, mob in workspace.NPCS:GetChildren() do
			if mob:IsA("Model") then
				characterESP(mob, "npc", color)
			end
		end
	end

	function ESPNpc.off()
		if connection then
			connection:Disconnect()
		end
		ESP.Disable("npc")
	end
end)()
return ESPNpc
