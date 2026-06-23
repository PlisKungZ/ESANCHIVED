local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/PlisKungZ/MSESP/refs/heads/main/source.luau"))()
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

local ESPMob = {}

local mobESPTable = {}

LPH_NO_VIRTUALIZE(function()
	local function getText(mob)
		local humanoid = mob:FindFirstChildWhichIsA("Humanoid")
		local health = humanoid
				and "[" .. tostring(math.floor(humanoid.Health)) .. "/" .. tostring(humanoid.MaxHealth) .. "]"
			or "[? / ?]"

		return mob.Name .. "\n" .. health
	end

	local connection

	function ESPMob.on(color)
		if connection then
			connection:Disconnect()
			connection = nil
		end

		for _, mob in workspace.Alive:GetChildren() do
			if not Players:GetPlayerFromCharacter(mob) then
				local head = mob:FindFirstChild("Head")
				if head then
					local esp = ESP:Add({
						Name = getText(mob),

						Model = mob,
						TextModel = head,

						Color = color,
						MaxDistance = 1000,

						TextSize = 18,

						ESPType = "Highlight",

						FillColor = color,
						OutlineColor = color,
						FillTransparency = 0.5,
						OutlineTransparency = 0,
						AfterUpdate = function(self)
							if self.CurrentSettings then
								self.CurrentSettings.Name = getText(mob)
							end
						end,
					})
					table.insert(mobESPTable, esp)
				end
			end
		end

		connection = workspace.Alive.ChildAdded:Connect(function(mob)
			if not Players:GetPlayerFromCharacter(mob) then
				repeat
					task.wait()
				until mob:FindFirstChild("Head")

				local esp = ESP:Add({
					Name = getText(mob),

					Model = mob,
					TextModel = mob.Head,

					Color = color,
					MaxDistance = 1000,

					TextSize = 18,

					ESPType = "Highlight",

					FillColor = color,
					OutlineColor = color,
					FillTransparency = 0.5,
					OutlineTransparency = 0,
					AfterUpdate = function(self)
						if self.CurrentSettings then
							self.CurrentSettings.Name = getText(mob)
						end
					end,
				})
				table.insert(mobESPTable, esp)
			end
		end)
	end

	function ESPMob.off()
		for _, something in mobESPTable do
			something:Destroy()
		end
		mobESPTable = {}
		if connection then
			connection:Disconnect()
			connection = nil
		end
	end
end)()

return ESPMob
