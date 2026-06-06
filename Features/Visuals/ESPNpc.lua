local ESP = require("Features/Visuals/ESPMain")
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

local ESPNpc = {}

local npcESPTable = {}

LPH_NO_VIRTUALIZE(function()
	local function getText(npc)
		return npc.Name
	end

	local connection

	function ESPNpc.on(color)
		if connection then
			connection:Disconnect()
			connection = nil
		end

		for _, npc in workspace.NPCS:GetChildren() do
			if npc:IsA("Model") then
				local esp = ESP:Add({
					Name = getText(npc),

					Model = npc,
					TextModel = npc.PrimaryPart or npc,

					Color = color,
					MaxDistance = 1000,

					TextSize = 18,

					ESPType = "Highlight",

					FillColor = color,
					OutlineColor = color,
					FillTransparency = 0.5,
					OutlineTransparency = 0,
				})
				table.insert(npcESPTable, esp)
			end
		end

		connection = workspace.NPCS.ChildAdded:Connect(function(npc)
			if npc:IsA("Model") then
				local esp = ESP:Add({
					Name = getText(npc),

					Model = npc,
					TextModel = npc.PrimaryPart or npc,

					Color = color,
					MaxDistance = 1000,

					TextSize = 18,

					ESPType = "Highlight",

					FillColor = color,
					OutlineColor = color,
					FillTransparency = 0.5,
					OutlineTransparency = 0,
				})
				table.insert(npcESPTable, esp)
			end
		end)
	end

	function ESPNpc.off()
		for _, something in npcESPTable do
			something:Destroy()
		end
		npcESPTable = {}
		if connection then
			connection:Disconnect()
			connection = nil
		end
	end
end)()

return ESPNpc
