local noCooldown = {}

function noCooldown.init()
	if not Options.SkillCooldownSelection then
		repeat
			task.wait()
		until Options.SkillCooldownSelection
	end

	local oldCd
	repeat
		task.wait()
	until getrenv()._G.HandleCD

	oldCd = hookfunction(
		getrenv()._G.HandleCD,
		newcclosure(function(...)
			local condition = {
				["Normal"] = function(...)
					return oldCd(...)
				end,
				["Half"] = function(...)
					local args = { ... }
					args[2] = args[2] / 2
					return oldCd(table.unpack(args))
				end,
				["None"] = function(...)
					local args = { ... }
					args[2] = 0
					return oldCd(table.unpack(args))
				end,
			}
			if Options.SkillCooldownSelection.Value then
				condition[Options.SkillCooldownSelection.Value](...)
				return
			else
				return oldCd(...)
			end
		end)
	)

	for _, script in getloadedmodules() do
		if script.Name == "CoolDownModule" then
			local oldSkillCD
			oldSkillCD = hookfunction(
				require(script)["CD"],
				newcclosure(function(character, tool, cooldown)
					local condition = {
						["Normal"] = function()
							return oldSkillCD(character, tool, cooldown)
						end,
						["Half"] = function(...)
							return oldSkillCD(character, tool, cooldown / 2)
						end,
						["None"] = function(...)
							return oldSkillCD(character, tool, 0)
						end,
					}
					if Options.SkillCooldownSelection.Value then
						return condition[Options.SkillCooldownSelection.Value](character, tool, cooldown)
					else
						return oldSkillCD(character, tool, cooldown)
					end
				end)
			)
		end
	end
	for _, v in getconnections(game:GetService("CollectionService"):GetInstanceAddedSignal("OnCD")) do
		local handler
		handler = hookfunction(
			v.Function,
			newcclosure(function(...)
				local condition = {
					["Normal"] = function(...)
						return handler(...)
					end,
					["Half"] = function(...)
						local args = { ... }
						args[2] = args[2] / 2
						return handler(table.unpack(args))
					end,
					["None"] = function(...)
						local args = { ... }
						args[2] = 0
						return handler(table.unpack(args))
					end,
				}
				if Options.SkillCooldownSelection.Value then
					return condition[Options.SkillCooldownSelection.Value](...)
				else
					return handler(...)
				end
			end)
		)
	end

	local hookedLists = {}

	local function hookCD(tool)
		if table.find(hookedLists, tool) then
			return
		end
		local targetRemote = tool:FindFirstChild("RemoteEvent")
		if not targetRemote or not tool:GetAttribute("CD") then
			return
		end
		table.insert(hookedLists, tool)

		local oldFireServer
		oldFireServer = hookfunction(
			targetRemote.FireServer,
			newcclosure(function(self, ...)
				if self == targetRemote then
					local condition = {
						["Normal"] = function(self, ...)
							return oldFireServer(self, ...)
						end,
						["Half"] = function(self, ...)
							local args = { ... }
							args[2] = args[2] / 2
							return oldFireServer(self, table.unpack(args))
						end,
						["None"] = function(self, ...)
							local args = { ... }
							args[2] = 0
							return oldFireServer(self, table.unpack(args))
						end,
					}
					if Options.SkillCooldownSelection.Value then
						return condition[Options.SkillCooldownSelection.Value](self, ...)
					else
						return oldFireServer(self, ...)
					end
				else
					return oldFireServer(self, ...)
				end
			end)
		)
	end

	for _, tool in game.Players.LocalPlayer.Backpack:GetChildren() do
		hookCD(tool)
	end

	game.Players.LocalPlayer.Backpack.ChildAdded:Connect(function(tool)
		hookCD(tool)
	end)

	local oldTaskDelay = task.delay

	makewritable(task)

	oldTaskDelay = hookfunction(
		task.delay,
		newcclosure(function(t, f, ...)
			local caller = getcallingscript()
			if caller and caller.Parent and caller.Parent:IsA("Tool") and caller.Parent:GetAttribute("CD") then
				local condition = {
					["Normal"] = function(...)
						return oldTaskDelay(t, f, ...)
					end,
					["Half"] = function(...)
						return oldTaskDelay(t / 2, f, ...)
					end,
					["None"] = function(...)
						return oldTaskDelay(0, f, ...)
					end,
				}
				if Options.SkillCooldownSelection.Value then
					return condition[Options.SkillCooldownSelection.Value](...)
				else
					return oldTaskDelay(t, f, ...)
				end
			else
				return oldTaskDelay(t, f, ...)
			end
		end)
	)
end
return noCooldown
