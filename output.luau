local a = { cache = {} :: any }
do
	do
		local function __modImpl()
			local b = game:GetService("RunService")
			local c = game:GetService("Players")
			local d = c.LocalPlayer

			local e = {}

			local f

			function e.on(g)
				if f then
					f:Disconnect()
					f = nil
				end
				local h = d.Character
				local i = h and h:FindFirstChildWhichIsA("Humanoid")

				f = b.Heartbeat:Connect(LPH_NO_VIRTUALIZE(function(j)
					if not (h and i and i.Parent) then
						f:Disconnect()
						return
					end

					if i.MoveDirection.Magnitude > 0 then
						h:TranslateBy(i.MoveDirection * Options.walkSpeedSlider.Value * j * 10)
					end
				end))
			end

			function e.off()
				if f then
					f:Disconnect()
					f = nil
				end
			end

			return e
		end
		function a.a(): typeof(__modImpl())
			local b = a.cache.a
			if not b then
				b = { c = __modImpl() }
				a.cache.a = b
			end
			return b.c
		end
	end
	do
		local function __modImpl()
			game:GetService("RunService")
			local b = game:GetService("Players")
			local c = game:GetService("UserInputService")
			local d = b.LocalPlayer

			local e

			local f = {}
			local g = false

			function f.on()
				e = c.JumpRequest:Connect(LPH_NO_VIRTUALIZE(function()
					if not g then
						g = true
						d.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
						task.wait()
						g = false
					end
				end))
			end

			function f.off()
				if e then
					e:Disconnect()
					e = nil
				end
			end

			return f
		end
		function a.b(): typeof(__modImpl())
			local b = a.cache.b
			if not b then
				b = { c = __modImpl() }
				a.cache.b = b
			end
			return b.c
		end
	end
	do
		local function __modImpl()
			local b = game:GetService("RunService")
			local c = game:GetService("Players")
			game:GetService("UserInputService")
			local d = c.LocalPlayer

			local e

			local f = {}

			function f.on()
				e = b.Stepped:Connect(LPH_NO_VIRTUALIZE(function()
					if d.Character ~= nil then
						for g, h in pairs(d.Character:GetDescendants()) do
							if h:IsA("BasePart") and h.CanCollide == true then
								h.CanCollide = false
							end
						end
					end
				end))
			end

			function f.off()
				if e then
					e:Disconnect()
					e = nil
				end
			end

			return f
		end
		function a.c(): typeof(__modImpl())
			local b = a.cache.c
			if not b then
				b = { c = __modImpl() }
				a.cache.c = b
			end
			return b.c
		end
	end
	do
		local function __modImpl()
			local b = game:GetService("Players")
			local c = game:GetService("ReplicatedStorage")
			local d = c:WaitForChild("Events")
			local e = d:WaitForChild("RagdollCancel")

			local f = b.LocalPlayer

			local g

			local h = {}

			function h.on()
				g = f.Character.ChildAdded:Connect(function(i)
					if i:IsA("Folder") and i.Name == "Ragdolled" then
						e:FireServer(f.Character)
					end
				end)
			end

			function h.off()
				if g then
					g:Disconnect()
					g = nil
				end
			end

			return h
		end
		function a.d(): typeof(__modImpl())
			local b = a.cache.d
			if not b then
				b = { c = __modImpl() }
				a.cache.d = b
			end
			return b.c
		end
	end
	do
		local function __modImpl()
			local b = game:GetService("RunService")
			local c = game:GetService("Players")
			local d = game:GetService("UserInputService")
			local e = c.LocalPlayer

			local f = {}

			local g

			local h = {
				forward = Enum.KeyCode.W,
				backward = Enum.KeyCode.S,
				left = Enum.KeyCode.A,
				right = Enum.KeyCode.D,
				up = Enum.KeyCode.Space,
				down = Enum.KeyCode.LeftShift,
			}

			local function getDirection()
				local i = Vector3.zero
				local j = workspace.CurrentCamera.CFrame

				local k = j.LookVector
				local l = j.RightVector

				if d:IsKeyDown(h.forward) then
					i = i + k
				end
				if d:IsKeyDown(h.backward) then
					i = i - k
				end
				if d:IsKeyDown(h.right) then
					i = i + l
				end
				if d:IsKeyDown(h.left) then
					i = i - l
				end
				if d:IsKeyDown(h.up) then
					i = i + Vector3.new(0, 1, 0)
				end
				if d:IsKeyDown(h.down) then
					i = i - Vector3.new(0, 1, 0)
				end

				return i
			end

			local function enableFly()
				local i = e.Character
				if not i then
					return
				end

				local j = i:FindFirstChildWhichIsA("Humanoid")
				local k = i:FindFirstChild("HumanoidRootPart")
				if not j or not k then
					return
				end

				j.PlatformStand = true

				local l = k.Position

				g = b.Heartbeat:Connect(LPH_NO_VIRTUALIZE(function(m)
					i = e.Character
					if not i then
						return
					end
					j = i:FindFirstChildWhichIsA("Humanoid")
					k = i:FindFirstChild("HumanoidRootPart")
					if not j or not k then
						return
					end

					local n = getDirection()

					if n.Magnitude > 0 then
						k.CFrame = k.CFrame + (n.Unit * Options.flySpeedSlider.Value * m)
						l = k.Position
					else
						k.CFrame = CFrame.new(l) * (k.CFrame - k.CFrame.Position)
					end

					k.AssemblyLinearVelocity = Vector3.zero
					k.AssemblyAngularVelocity = Vector3.zero
				end))
			end

			local function disableFly()
				local i = e.Character
				if i then
					local j = i:FindFirstChildWhichIsA("Humanoid")
					if j then
						j.PlatformStand = false
					end
				end

				if g then
					g:Disconnect()
					g = nil
				end
			end

			function f.on(i)
				disableFly()
				enableFly(i)
			end

			function f.off()
				disableFly()
			end

			return f
		end
		function a.e(): typeof(__modImpl())
			local b = a.cache.e
			if not b then
				b = { c = __modImpl() }
				a.cache.e = b
			end
			return b.c
		end
	end
	do
		local function __modImpl()
			local b = game:GetService("Players")
			local c = b.LocalPlayer
			local d = {}
			local e

			function d.on()
				if e then
					e:Destroy()
				end
				local f = Instance.new("Folder")
				f.Name = "AirTime"
				f.Parent = c.Character
				e = f
			end

			function d.off()
				if e then
					e:Destroy()
				end
			end

			return d
		end
		function a.f(): typeof(__modImpl())
			local b = a.cache.f
			if not b then
				b = { c = __modImpl() }
				a.cache.f = b
			end
			return b.c
		end
	end
	do
		local function __modImpl()
			local b = game:GetService("Players")
			local c = game:GetService("RunService")

			local d = b.LocalPlayer
			local e = {}

			local f

			function e.on()
				f = c.RenderStepped:Connect(LPH_NO_VIRTUALIZE(function()
					local g = d.Character:FindFirstChild("SlowAutoRotate")
					if g then
						g:Destroy()
					end
				end))
			end

			function e.off()
				if f then
					f:Disconnect()
				end
			end

			return e
		end
		function a.g(): typeof(__modImpl())
			local b = a.cache.g
			if not b then
				b = { c = __modImpl() }
				a.cache.g = b
			end
			return b.c
		end
	end
	do
		local function __modImpl()
			local b = {}

			function b.init()
				task.spawn(function()
					if not Options.SkillCooldownSelection then
						repeat
							task.wait()
						until Options.SkillCooldownSelection
					end

					local c
					repeat
						task.wait()
					until getrenv()._G.HandleCD

					c = hookfunction(
						getrenv()._G.HandleCD,
						newcclosure(function(...)
							local d = {
								Normal = function(...)
									return c(...)
								end,
								Half = function(...)
									local d = { ... }
									print(d[1], d[2], d[3])
									d[2] = d[2] / 2
									return c(table.unpack(d))
								end,
								None = function(...)
									local d = { ... }
									d[2] = 0
									return c(table.unpack(d))
								end,
							}
							if Options.SkillCooldownSelection.Value then
								d[Options.SkillCooldownSelection.Value](...)
								return
							else
								return c(...)
							end
						end)
					)

					local d = false
					repeat
						task.wait()
						for e, f in getloadedmodules() do
							if f.Name == "CoolDownModule" then
								d = true
							end
						end
					until d

					for e, f in getloadedmodules() do
						if f.Name == "CoolDownModule" then
							local g
							g = hookfunction(
								require(f).CD,
								newcclosure(function(h, i, j)
									local k = {
										Normal = function()
											return g(h, i, j)
										end,
										Half = function(...)
											return g(h, i, j / 2)
										end,
										None = function(...)
											return g(h, i, 0)
										end,
									}
									if Options.SkillCooldownSelection.Value then
										print(h:GetFullName(), i.Name, j)
										return k[Options.SkillCooldownSelection.Value](h, i, j)
									else
										return g(h, i, j)
									end
								end)
							)
						end
					end

					local e = {}

					local function hookCD(f)
						if table.find(e, f) then
							return
						end
						local g = f:FindFirstChild("RemoteEvent")
						if not g or not f:GetAttribute("CD") then
							return
						end
						table.insert(e, f)

						local h
						h = hookfunction(
							g.FireServer,
							newcclosure(function(i, ...)
								if i == g then
									local j = {
										Normal = function(j, ...)
											return h(j, ...)
										end,
										Half = function(j, ...)
											local k = { ... }
											k[1] = k[1] / 2
											return h(j, table.unpack(k))
										end,
										None = function(j, ...)
											local k = { ... }
											k[1] = 0
											return h(j, table.unpack(k))
										end,
									}
									if Options.SkillCooldownSelection.Value then
										return j[Options.SkillCooldownSelection.Value](i, ...)
									else
										return h(i, ...)
									end
								else
									return h(i, ...)
								end
							end)
						)
					end

					for f, g in game.Players.LocalPlayer.Backpack:GetChildren() do
						hookCD(g)
					end

					game.Players.LocalPlayer.Backpack.ChildAdded:Connect(function(f)
						hookCD(f)
					end)

					makewritable(task)

					local f

					f = hookfunction(
						task.delay,
						newcclosure(function(g, h)
							local i = getcallingscript()
							if i and i.Parent and i.Parent:IsA("Tool") and i.Parent:GetAttribute("CD") then
								local j = {
									Normal = function(j, k)
										return f(j, k)
									end,
									Half = function(j, k)
										return f(j / 2, k)
									end,
									None = function(j, k)
										return f(0, k)
									end,
								}
								if Options.SkillCooldownSelection.Value then
									return j[Options.SkillCooldownSelection.Value](g, h)
								else
									return f(g, h)
								end
							end
							return f(g, h)
						end)
					)
				end)
			end
			return b
		end
		function a.h(): typeof(__modImpl())
			local b = a.cache.h
			if not b then
				b = { c = __modImpl() }
				a.cache.h = b
			end
			return b.c
		end
	end
	do
		local function __modImpl()
			local b = game:GetService("Players")
			local c = game:GetService("RunService")
			local d = 
b.LocalPlayer
			local e = {}

			local f

			function e.on()
				f = c.RenderStepped:Connect(LPH_NO_VIRTUALIZE(function()
					local g = game.Players.LocalPlayer.Character:FindFirstChild("LightAttack")
					if g then
						g:Destroy()
					end

					local h = game.Players.LocalPlayer.Character:FindFirstChild("HeavyAttack")
					if h then
						h:Destroy()
					end

					local i = game.Players.LocalPlayer.Character:FindFirstChild("UsingMove")
					if i then
						i:Destroy()
					end
				end))
			end

			function e.off()
				if f then
					f:Disconnect()
				end
			end

			return e
		end
		function a.i(): typeof(__modImpl())
			local b = a.cache.i
			if not b then
				b = { c = __modImpl() }
				a.cache.i = b
			end
			return b.c
		end
	end
	do
		local function __modImpl()
			local b = game:GetService("Players")
			local c = game:GetService("RunService")
			local d = 
b.LocalPlayer
			local e = {}

			local f
			local g

			function e.on()
				f = c.RenderStepped:Connect(LPH_NO_VIRTUALIZE(function()
					g = game.Players.LocalPlayer.Character:FindFirstChild("ResetDashCD")
					if not g then
						g = nil
						g = Instance.new("Folder")
						g.Name = "ResetDashCD"
						g.Parent = game.Players.LocalPlayer.Character
					end
					local h = game.Players.LocalPlayer.Character:FindFirstChild("DashDisabled")
					if h then
						h:Destroy()
					end
				end))
			end

			function e.off()
				if f then
					f:Disconnect()
				end
				if g then
					g:Destroy()
					g = nil
				end
			end

			return e
		end
		function a.j(): typeof(__modImpl())
			local b = a.cache.j
			if not b then
				b = { c = __modImpl() }
				a.cache.j = b
			end
			return b.c
		end
	end
	do
		local function __modImpl()
			local b = game:GetService("Players")
			local c = game:GetService("ReplicatedStorage")
			local d = c:WaitForChild("Events")
			local e = d:WaitForChild("FallDamage")
			local f = d:WaitForChild("BegunM1")
			local g = d:WaitForChild("MissParry")
			local h = d:WaitForChild("LightAttack")
			local i = 
b.LocalPlayer

			local j = {}
			local k = false

			hookmetamethod(
				game,
				"__namecall",
				newcclosure(LPH_NO_VIRTUALIZE(function(l, ...)
					local m = getnamecallmethod()

					if not Toggles then
						return l[m](l, ...)
					end

					if m == "FireServer" and l == e and Toggles.fallDamage.Value then
						return
					end

					if not Toggles.noStaminaDrain then
						return l[m](l, ...)
					end
					if m == "FireServer" and Toggles.noStaminaDrain.Value then
						if l == f or l == g or l == h then
							return
						end
					end

					return l[m](l, ...)
				end))
			)

			function j.on()
				k = true
			end

			function j.off()
				k = false
			end

			return j
		end
		function a.k(): typeof(__modImpl())
			local b = a.cache.k
			if not b then
				b = { c = __modImpl() }
				a.cache.k = b
			end
			return b.c
		end
	end
	do
		local function __modImpl()
			local b = game:GetService("Players")
			local c = game:GetService("ReplicatedStorage")
			local d = c:WaitForChild("Events")
			d:WaitForChild("FallDamage")
			local e = 
b.LocalPlayer

			local f = {}

			function f.on()
				local g = workspace:FindFirstChild("KillBricks")
				if g then
					g:Destroy()
				end
			end

			function f.off() end

			return f
		end
		function a.l(): typeof(__modImpl())
			local b = a.cache.l
			if not b then
				b = { c = __modImpl() }
				a.cache.l = b
			end
			return b.c
		end
	end
	do
		local function __modImpl()
			local b = game:GetService("Players")
			local c = game:GetService("ReplicatedStorage")
			local d = c:WaitForChild("Events")
			d:WaitForChild("FallDamage")
			local e = 
b.LocalPlayer

			local f = {}
			local g

			function f.on()
				g = workspace.Camera:FindFirstChild("WeatherAttach")
				if g then
					g.Parent = nil
				end
			end

			function f.off()
				if g then
					g.Parent = workspace.Camera
				end
			end

			return f
		end
		function a.m(): typeof(__modImpl())
			local b = a.cache.m
			if not b then
				b = { c = __modImpl() }
				a.cache.m = b
			end
			return b.c
		end
	end
	do
		local function __modImpl()
			local b = game:GetService("Players")
			local c = game:GetService("RunService")

			local d = b.LocalPlayer
			local e = {}
			local f = {}
			local g
			function e.on()
				e.off()
				local h = game.Players.LocalPlayer.Character.Humanoid.Animator
				game:GetService("ReplicatedStorage").Events.Equip:FireServer(true)
				local i = 0
				for j, k in
					game:GetService("ReplicatedStorage").WeaponINFO[game.Players.LocalPlayer.Data.Weapon.Value]
						:GetChildren()
				do
					if k.Name:find("AttackAnimation") and k.Name ~= "ChargedAttackAnimation" then
						i = i + 1
					end
				end
				for j = 1, i - 1 do
					local k = h:LoadAnimation(
						game:GetService("ReplicatedStorage").WeaponINFO[game.Players.LocalPlayer.Data.Weapon.Value]["AttackAnimation" .. tostring(
							j
						)]
					)
					k:Play(0, 0.01, 100000)
					k.Looped = true
					table.insert(f, k)
				end
				local j = false
				g = c.RenderStepped:Connect(function(k)
					if not j then
						j = true
						for l, m in f do
							m:Stop()
						end
						for l, m in f do
							m:Play(0, 0.01, 100000)
						end
						task.delay(2, function()
							j = false
						end)
					end
					d.Data.Stamina.Value = 100
				end)
			end

			function e.off()
				if g then
					g:Disconnect()
				end
				game:GetService("ReplicatedStorage").Events.Equip:FireServer(false)
				for h, i in f do
					i:Stop()
					i:Destroy()
				end
				workspace.CurrentCamera.CameraSubject = d.Character.Humanoid
			end

			return e
		end
		function a.n(): typeof(__modImpl())
			local b = a.cache.n
			if not b then
				b = { c = __modImpl() }
				a.cache.n = b
			end
			return b.c
		end
	end
	do
		local function __modImpl()
			local b = game:GetService("Players")
			local c = 
b.LocalPlayer

			local d = {}

			local e

			repeat
				task.wait()

				for f, g in getloadedmodules() do
					if g.Name == "CameraShaker" then
						e = g
					end
				end
			until e

			local f
			f = hookfunction(
				require(e).ShakeOnce,
				newcclosure(function()
					if not Toggles then
						return f
					end
					if not Toggles.noRecoil then
						return f
					end
					if Toggles.noRecoil.Value then
						return
					else
						return f
					end
				end)
			)

			return d
		end
		function a.o(): typeof(__modImpl())
			local b = a.cache.o
			if not b then
				b = { c = __modImpl() }
				a.cache.o = b
			end
			return b.c
		end
	end
	do
		local function __modImpl()
			local b = game:GetService("Players")
			local c = game:GetService("ReplicatedStorage")
			local d = game:GetService("RunService")

			local e = b.LocalPlayer
			local f = e:WaitForChild("Data")
			local g = f:WaitForChild("Sanity")

			local h = c:WaitForChild("Events")

			local i = h:WaitForChild("ShinGain")

			local j = {}

			local k = false

			d.RenderStepped:Connect(function(l)
				if not Toggles then
					return
				end
				if not Toggles.AutoShinMang then
					return
				end
				if not Toggles.AutoShinMang.Value then
					return
				end
				if not table.find(string.split(f.Passives.Value, ","), "ShinAndMang") then
					return
				end
				if k then
					return
				end
				local m = -10
				if table.find(string.split(f.Passives.Value, ","), "DecimateMind") then
					m = -35
				end
				if g.Value <= m then
					return
				end
				if g.Value <= Options.autoShinMangSanity.Value then
					k = true
					repeat
						task.wait()
						i:FireServer()
					until g.Value <= m
					k = false
				end
			end)

			return j
		end
		function a.p(): typeof(__modImpl())
			local b = a.cache.p
			if not b then
				b = { c = __modImpl() }
				a.cache.p = b
			end
			return b.c
		end
	end
	do
		local function __modImpl()
			local b = a.a()
			local c = a.b()
			local d = a.c()
			local e = a.d()
			local f = a.e()
			local g = a.f()
			local h = a.g()
			local i = a.h()
			local j = a.i()
			local k = a.j()
			local l = a.k()
			local m = a.l()
			local n = a.m()
			local o = a.n()
			a.o()
			a.p()

			local p = {}
			local q = game:GetService("Players")

			local function getPlayerNames()
				local r = {}
				for s, t in q:GetPlayers() do
					if t ~= q.LocalPlayer then
						table.insert(r, t.Name)
					end
				end
				return r
			end

			local r = {
				["Great Height (Yuria)"] = CFrame.new(747.6103515625, 770.224853515625, -51.407676696777344),
				Sentenza = CFrame.new(439.9958801269531, -7.5, 438.1730651855469),
				["Hana Association"] = CFrame.new(310.8846740722656, 27.500045776367188, 570.3676147460938),
				["The Darius"] = CFrame.new(94.9479751586914, 30.540618896484375, 851.0762329101562),
				["The Tower"] = CFrame.new(-1003.6781616210938, 697.5252685546875, 1431.3994140625),
				["Ocean Appoarch"] = CFrame.new(-1193.6763916015625, -10.500003814697266, 976.7411499023438),
				["Chemical Factory"] = CFrame.new(-1277.293701171875, 190.02536010742188, -83.25059509277344),
				["Construction Site"] = CFrame.new(-776.7263793945313, 63.62499237060547, -32.27681350708008),
				["Everything Workshop"] = CFrame.new(159.12794494628906, 64.49998474121094, 112.2244644165039),
				["Dumpster Guy (Dungeon)"] = CFrame.new(295.69189453125, 64.49998474121094, -147.36453247070313),
			}
			local s = {
				"Great Height (Yuria)",
				"Dumpster Guy (Dungeon)",
				"Sentenza",
				"Hana Association",
				"The Darius",
				"The Tower",
				"Ocean Appoarch",
				"Chemical Factory",
				"Construction Site",
				"Everything Workshop",
			}

			p.init = LPH_NO_VIRTUALIZE(function()
				local t = Window:AddTab("Character", "users")
				local u = t:AddLeftGroupbox("Character", "users")
				local v = t:AddRightGroupbox("Misc", "ear-off")
				local w = t:AddLeftGroupbox("Removal", "user-x")
				local x = t:AddRightGroupbox("Teleportation", "axis-3d")

				u:AddToggle("Fly", {
					Text = "Fly",
					Default = false,
					Tooltip = "Enable fly mode",
				})
				Toggles.Fly:OnChanged(function()
					if Toggles.Fly.Value then
						f.on(Options.flySpeedSlider.Value)
					else
						f.off()
					end
				end)

				u:AddSlider("flySpeedSlider", {
					Text = "Fly Speed",
					Default = 50,
					Min = 50,
					Max = 200,
					Rounding = 1,
					Tooltip = "Increase your fly speed",
					Callback = function(y) end,
				})
				u:AddLabel("Fly Keybind"):AddKeyPicker("flyKeybind", {
					Default = "",
					Mode = "Toggle",
					Text = "ESP Mob Keybind",
					NoUI = false,
					Callback = function(y)
						if Toggles.Fly.Value then
							Toggles.Fly:SetValue(false)
						else
							Toggles.Fly:SetValue(true)
						end
					end,
				})

				u:AddDivider()

				u:AddToggle("WalkSpeed", {
					Text = "WalkSpeed Multiplier",
					Default = false,
					Tooltip = "Enable walk speed multiplier",
				})
				Toggles.WalkSpeed:OnChanged(function()
					if Toggles.WalkSpeed.Value then
						b.on()
					else
						b.off(1)
					end
				end)

				u:AddSlider("walkSpeedSlider", {
					Text = "Walk Speed",
					Default = 1,
					Min = 1,
					Max = 50,
					Rounding = 1,
					Tooltip = "Increase your WalkSpeed",
					Callback = function(y)
						b.off()
						if Toggles.WalkSpeed.Value then
							b.on(y)
						end
					end,
				})

				u:AddLabel("WalkSpeed Keybind"):AddKeyPicker("walkSpeedKeybind", {
					Default = "",
					Mode = "Toggle",
					Text = "ESP Mob Keybind",
					NoUI = false,
					Callback = function(y)
						if Toggles.WalkSpeed.Value then
							Toggles.WalkSpeed:SetValue(false)
						else
							Toggles.WalkSpeed:SetValue(true)
						end
					end,
				})

				u:AddDivider()

				u:AddToggle("Noclip", {
					Text = "Noclip",
					Default = false,
					Tooltip = "Walk through walls",
				})
				Toggles.Noclip:OnChanged(function()
					if Toggles.Noclip.Value then
						d.on()
					else
						d.off()
					end
				end)

				u:AddLabel("Noclip Keybind"):AddKeyPicker("noClipKeybind", {
					Default = "",
					Mode = "Toggle",
					Text = "Noclip Keybind",
					NoUI = false,
					Callback = function(y)
						if Toggles.Noclip.Value then
							Toggles.Noclip:SetValue(false)
						else
							Toggles.Noclip:SetValue(true)
						end
					end,
				})

				u:AddToggle("InfJump", {
					Text = "Infinite Jump",
					Default = false,
					Tooltip = "Jump infinitely in the air",
				})
				Toggles.InfJump:OnChanged(function()
					if Toggles.InfJump.Value then
						c.on()
					else
						c.off()
					end
				end)

				v:AddToggle("ragdollCancel", {
					Text = "Auto Ragdoll Cancel",
					Default = false,
					Tooltip = "Automatically cancel ragdoll",
				})
				Toggles.ragdollCancel:OnChanged(function()
					if Toggles.ragdollCancel.Value then
						e.on()
					else
						e.off()
					end
				end)

				v:AddToggle("bringBackRotate", {
					Text = "Bring Back Hit Rotate",
					Default = false,
				})
				Toggles.bringBackRotate:SetValue(false)
				Toggles.bringBackRotate:OnChanged(function()
					if Toggles.bringBackRotate.Value then
						h.on()
					else
						h.off()
					end
				end)

				v:AddToggle("airHit", {
					Text = "M1 On Air Spoof",
					Default = false,
					Tooltip = "Spoof M1 hit while airborne",
				})
				Toggles.airHit:OnChanged(function()
					if Toggles.airHit.Value then
						g.on()
					else
						g.off()
					end
				end)
				v:AddToggle("hitAura", {
					Text = "Hit Aura",
					Default = false,
					Tooltip = "Basically M1",
				})
				Toggles.hitAura:OnChanged(function()
					if Toggles.hitAura.Value then
						o.on()
					else
						o.off()
					end
				end)
				v:AddDivider()

				v:AddDropdown("SkillCooldownSelection", {
					Values = { "Half", "Normal", "None" },
					Default = "Normal",
					Multi = false,
					Text = "Skill Cooldown",
					Tooltip = "Select your skill cooldown mode",
				})
				i.init()

				Options.SkillCooldownSelection:OnChanged(function()
					print("Skill Cooldown changed to:", Options.SkillCooldownSelection.Value)
				end)

				v:AddDivider()

				v:AddToggle("AutoShinMang", {
					Text = "Auto Shin Mang",
					Default = false,
					Tooltip = "Activate on configured Sp Point threshold",
				})

				v:AddSlider("autoShinMangSanity", {
					Text = "Activation SP Point",
					Default = 0,
					Min = -45,
					Max = 45,
					Rounding = 0,
					Tooltip = "Depends on your liking.",
				})

				v:AddButton({
					Text = "Instant Log",
					Func = function()
						game.Players.LocalPlayer:Destroy()
					end,
					Tooltip = "Instantly leave the game",
					DoubleClick = true,
				})

				w:AddToggle("fallDamage", {
					Text = "No Fall Damage",
					Default = false,
					Tooltip = "Same as above",
				})

				Toggles.fallDamage:OnChanged(function()
					if Toggles.fallDamage.Value then
						l.on()
					else
						l.off()
					end
				end)

				w:AddToggle("noDashCD", {
					Text = "No Dash Cooldown",
					Default = false,
					Tooltip = "Same as above",
				})

				Toggles.noDashCD:OnChanged(function()
					if Toggles.noDashCD.Value then
						k.on()
					else
						k.off()
					end
				end)

				w:AddToggle("noStaminaDrain", {
					Text = "No Stamina Drain",
					Default = false,
					Tooltip = "Same as above",
				})

				w:AddToggle("noStun", {
					Text = "No Slow",
					Default = false,
					Tooltip = "Same as above",
				})

				Toggles.noStun:OnChanged(function()
					if Toggles.noStun.Value then
						j.on()
					else
						j.off()
					end
				end)

				w:AddToggle("noKillBrick", {
					Text = "No Kill Brick",
					Default = false,
					Tooltip = "Same as above",
				})

				Toggles.noKillBrick:OnChanged(function()
					if Toggles.noKillBrick.Value then
						m.on()
					else
						m.off()
					end
				end)

				w:AddToggle("noWeather", {
					Text = "No Weather",
					Default = false,
					Tooltip = "Same as above",
				})

				Toggles.noWeather:OnChanged(function()
					if Toggles.noWeather.Value then
						n.on()
					else
						n.off()
					end
				end)

				w:AddToggle("noRecoil", {
					Text = "No Recoil or Camera Shake",
					Default = false,
					Tooltip = "Same as above",
				})

				x:AddDropdown("areaSelection", {
					Values = s,
					Default = "",
					Multi = false,
					Text = "Select Area",
					Tooltip = "Chose Area To Teleport To",
				})
				x:AddButton({
					Text = "Teleport To Area",
					Func = function()
						if r[Options.areaSelection.Value] then
							q.LocalPlayer.Character:PivotTo(r[Options.areaSelection.Value])
						end
					end,
					Tooltip = "Same As Above",
					DoubleClick = false,
				})

				x:AddDropdown("playerSelection", {
					Values = getPlayerNames(),
					Default = "Normal",
					Multi = false,
					Text = "Select Player",
					Tooltip = "Choose Player To Teleport To",
				})

				q.PlayerAdded:Connect(function(y)
					if y == q.LocalPlayer then
						return
					end
					Options.playerSelection:SetValue(getPlayerNames())
				end)

				q.PlayerRemoving:Connect(function(y)
					if y == q.LocalPlayer then
						return
					end
					Options.playerSelection:SetValues(getPlayerNames())
				end)

				x:AddButton({
					Text = "Teleport To Player",
					Func = function()
						q.LocalPlayer.Character:PivotTo(q[Options.playerSelection.Value].Character:GetPivot())
					end,
					Tooltip = "Same As Above",
					DoubleClick = false,
				})
			end)

			return p
		end
		function a.q(): typeof(__modImpl())
			local b = a.cache.q
			if not b then
				b = { c = __modImpl() }
				a.cache.q = b
			end
			return b.c
		end
	end
	do
		local function __modImpl()
			local b = loadstring(
				game:HttpGet("https://raw.githubusercontent.com/PlisKungZ/MSESP/refs/heads/main/source.luau")
			)()
			local c = game:GetService("Players")
			local d = c.LocalPlayer

			local e = {}

			local f = {}

			LPH_NO_VIRTUALIZE(function()
				local function getSelections()
					if not Options.espPlayerSelection.Value then
						return {}
					end
					local g = {}
					for h, i in next, Options.espPlayerSelection.Value do
						table.insert(g, h)
					end
					return g
				end
				local function getText(g, h)
					local i = g.Name
					local j = "[" .. tostring(g.Data.DisplayName.Value) .. "]"
					local k = "[" .. tostring(g:GetAttribute("AveragePing")) .. "ms]"
					local l = "["
						.. tostring(math.floor(g.Character.Humanoid.Health))
						.. "/"
						.. tostring(g.Character.Humanoid.MaxHealth)
						.. "]"
					local m = "[Grade " .. tostring(g.Data.Grade.Value) .. "]"
					local n = g.Data.Singularity.Value ~= "" and " [" .. g.Data.Singularity.Value .. "]" or ""

					local o = {}

					if table.find(h, "Username") and table.find(h, "Character Name") then
						table.insert(o, i .. " " .. j)
					elseif table.find(h, "Username") then
						table.insert(o, i)
					elseif table.find(h, "Character Name") then
						table.insert(o, j)
					end

					if table.find(h, "Ping") and table.find(h, "Health") then
						table.insert(o, k .. " " .. l)
					elseif table.find(h, "Ping") then
						table.insert(o, k)
					elseif table.find(h, "Health") then
						table.insert(o, l)
					end

					if table.find(h, "Grade") and table.find(h, "Singularity") then
						table.insert(o, m .. n)
					elseif table.find(h, "Grade") then
						table.insert(o, m)
					elseif table.find(h, "Singularity") then
						table.insert(o, n)
					end

					return table.concat(o, "\n")
				end
				local g = {}
				local function getColorForPlayer(h)
					if Toggles.espPlayerParryVisualize.Value then
						if g[h] then
							return Options.espPlayerParryVisualizeColor.Value
						else
							return Options.espPlayerColor.Value
						end
					else
						return Options.espPlayerColor.Value
					end
				end

				local h = {}
				local i = {}

				local function playerAddedESPCheck(j)
					if j == d then
						return
					end

					h[j] = j.CharacterAdded:Connect(function(k)
						if i[j] then
							i[j]:Disconnect()
							i[j] = nil
						end
						i[j] = k.ChildAdded:Connect(function(l)
							if l.Name == "StartedAnAttack" then
								g[j] = true
								task.delay(0.5, function()
									g[j] = false
								end)
							end
						end)
					end)
					if j.Character then
						i[j] = j.Character.ChildAdded:Connect(function(k)
							if k.Name == "StartedAnAttack" then
								g[j] = true
								task.delay(0.5, function()
									g[j] = false
								end)
							end
						end)
					end
				end
				for j, k in c:GetPlayers() do
					playerAddedESPCheck(k)
				end

				c.PlayerAdded:Connect(playerAddedESPCheck)

				local j

				function e.on(k, l)
					e.off()

					for m, n in c:GetPlayers() do
						if n ~= d and n.Character then
							repeat
								task.wait()
							until n.Character:FindFirstChild("Head")
							local o = b:Add({
								AfterUpdate = function(o)
									if o.CurrentSettings then
										o.CurrentSettings.Name = getText(n, getSelections())
										o.CurrentSettings.Color = getColorForPlayer(n)
										o.CurrentSettings.FillColor = getColorForPlayer(n)
										o.CurrentSettings.OutlineColor = getColorForPlayer(n)
									end
								end,
								Name = getText(n, getSelections()),

								Model = n.Character,
								TextModel = n.Character.Head,

								Color = getColorForPlayer(n),
								MaxDistance = math.huge,

								TextSize = 18,

								ESPType = "Highlight",

								FillColor = getColorForPlayer(n),
								OutlineColor = getColorForPlayer(n),
								FillTransparency = 0.5,
								OutlineTransparency = 0,
							})
							table.insert(f, o)
						end
					end

					j = workspace.Alive.ChildAdded:Connect(function(m)
						local n = c:GetPlayerFromCharacter(m)
						if n and n ~= d and n.Character then
							repeat
								task.wait()
							until n.Character:FindFirstChild("Head")

							local o = b:Add({
								Name = getText(n, getSelections()),
								Model = n.Character,
								TextModel = n.Character.Head,

								Color = getColorForPlayer(n),
								MaxDistance = math.huge,

								TextSize = 18,

								ESPType = "Highlight",

								FillColor = getColorForPlayer(n),
								OutlineColor = getColorForPlayer(n),
								FillTransparency = 0.5,
								OutlineTransparency = 0,
								AfterUpdate = function(o)
									if o.CurrentSettings then
										o.CurrentSettings.Name = getText(n, getSelections())
										o.CurrentSettings.Color = getColorForPlayer(n)
										o.CurrentSettings.FillColor = getColorForPlayer(n)
										o.CurrentSettings.OutlineColor = getColorForPlayer(n)
									end
								end,
							})
							table.insert(f, o)
						end
					end)
				end

				function e.off()
					for k, l in f do
						l:Destroy()
					end
					if j then
						j:Disconnect()
						j = nil
					end
				end
			end)()

			return e
		end
		function a.r(): typeof(__modImpl())
			local b = a.cache.r
			if not b then
				b = { c = __modImpl() }
				a.cache.r = b
			end
			return b.c
		end
	end
	do
		local function __modImpl()
			local b = loadstring(
				game:HttpGet("https://raw.githubusercontent.com/PlisKungZ/MSESP/refs/heads/main/source.luau")
			)()
			local c = game:GetService("Players")
			local d = c.LocalPlayer

			local e = {}

			local f = {}

			LPH_NO_VIRTUALIZE(function()
				local function getText(g)
					local h = g:FindFirstChildWhichIsA("Humanoid")
					local i = h and "[" .. tostring(math.floor(h.Health)) .. "/" .. tostring(h.MaxHealth) .. "]"
						or "[? / ?]"

					return g.Name .. "\n" .. i
				end

				local g

				function e.on(h)
					if g then
						g:Disconnect()
						g = nil
					end

					for i, j in workspace.Alive:GetChildren() do
						if not c:GetPlayerFromCharacter(j) then
							local k = j:FindFirstChild("Head")
							if k then
								local l = b:Add({
									Name = getText(j),

									Model = j,
									TextModel = k,

									Color = h,
									MaxDistance = 1000,

									TextSize = 18,

									ESPType = "Highlight",

									FillColor = h,
									OutlineColor = h,
									FillTransparency = 0.5,
									OutlineTransparency = 0,
									AfterUpdate = function(l)
										if l.CurrentSettings then
											l.CurrentSettings.Name = getText(j)
										end
									end,
								})
								table.insert(f, l)
							end
						end
					end

					g = workspace.Alive.ChildAdded:Connect(function(i)
						if not c:GetPlayerFromCharacter(i) then
							repeat
								task.wait()
							until i:FindFirstChild("Head")

							local j = b:Add({
								Name = getText(i),

								Model = i,
								TextModel = i.Head,

								Color = h,
								MaxDistance = 1000,

								TextSize = 18,

								ESPType = "Highlight",

								FillColor = h,
								OutlineColor = h,
								FillTransparency = 0.5,
								OutlineTransparency = 0,
								AfterUpdate = function(j)
									if j.CurrentSettings then
										j.CurrentSettings.Name = getText(i)
									end
								end,
							})
							table.insert(f, j)
						end
					end)
				end

				function e.off()
					for h, i in f do
						i:Destroy()
					end
					f = {}
					if g then
						g:Disconnect()
						g = nil
					end
				end
			end)()

			return e
		end
		function a.s(): typeof(__modImpl())
			local b = a.cache.s
			if not b then
				b = { c = __modImpl() }
				a.cache.s = b
			end
			return b.c
		end
	end
	do
		local function __modImpl()
			local b = loadstring(
				game:HttpGet("https://raw.githubusercontent.com/PlisKungZ/MSESP/refs/heads/main/source.luau")
			)()
			local c = game:GetService("Players")
			local d = c.LocalPlayer

			local e = {}

			local f = {}

			LPH_NO_VIRTUALIZE(function()
				local function getText(g)
					return g.Name
				end

				local g

				function e.on(h)
					if g then
						g:Disconnect()
						g = nil
					end

					for i, j in workspace.NPCS:GetChildren() do
						if j:IsA("Model") then
							local k = b:Add({
								Name = getText(j),

								Model = j,
								TextModel = j.PrimaryPart or j,

								Color = h,
								MaxDistance = math.huge,

								TextSize = 18,

								ESPType = "Highlight",

								FillColor = h,
								OutlineColor = h,
								FillTransparency = 0.5,
								OutlineTransparency = 0,
								AfterUpdate = function(k)
									if k.CurrentSettings then
										k.CurrentSettings.Name = getText(j)
									end
								end,
							})
							table.insert(f, k)
						end
					end

					g = workspace.NPCS.ChildAdded:Connect(function(i)
						if i:IsA("Model") then
							local j = b:Add({
								Name = getText(i),

								Model = i,
								TextModel = i.PrimaryPart or i,

								Color = h,
								MaxDistance = 1000,

								TextSize = 18,

								ESPType = "Highlight",

								FillColor = h,
								OutlineColor = h,
								FillTransparency = 0.5,
								OutlineTransparency = 0,
								AfterUpdate = function(j)
									if j.CurrentSettings then
										j.CurrentSettings.Name = getText(i)
									end
								end,
							})
							table.insert(f, j)
						end
					end)
				end

				function e.off()
					for h, i in f do
						i:Destroy()
					end
					f = {}
					if g then
						g:Disconnect()
						g = nil
					end
				end
			end)()

			return e
		end
		function a.t(): typeof(__modImpl())
			local b = a.cache.t
			if not b then
				b = { c = __modImpl() }
				a.cache.t = b
			end
			return b.c
		end
	end
	do
		local function __modImpl()
			local b = game:GetService("Players")
			local c = b.LocalPlayer
			local d = c.PlayerGui

			local e = d:WaitForChild("Leaderboard")
			local f = e:WaitForChild("NameFrame"):WaitForChild("ScrollingFrame")

			local g = {}

			local h

			local i = {}

			local function createButton(j)
				if not j:FindFirstChild("PlayerName2") then
					return
				end

				local k = Instance.new("TextButton")
				k.Name = "Button"
				k.Size = UDim2.fromScale(1, 1)
				k.Position = j.PlayerName2.Position
				k.AnchorPoint = j.PlayerName2.AnchorPoint
				k.BackgroundTransparency = 1
				k.Text = ""
				k.Parent = j

				k.Activated:Connect(function()
					if h == b[j.PlayerName2.Text] then
						h = nil
						workspace.CurrentCamera.CameraSubject = c.Character.Humanoid
						return
					end
					workspace.CurrentCamera.CameraSubject = game.Players[j.PlayerName2.Text].Character.Humanoid
					h = game.Players[j.PlayerName2.Text]
				end)

				table.insert(i, k)
			end

			function g.on()
				for j, k in f:GetChildren() do
					if k:IsA("Frame") then
						createButton(k)
					end
				end
			end

			function g.off()
				for j, k in i do
					k:Destroy()
				end
			end

			return g
		end
		function a.u(): typeof(__modImpl())
			local b = a.cache.u
			if not b then
				b = { c = __modImpl() }
				a.cache.u = b
			end
			return b.c
		end
	end
	do
		local function __modImpl()
			game:GetService("HttpService")

			local b = {}

			function b.on()
				local function changeText(c)
					for d, e in c:GetDescendants() do
						if e.Name == "IconLabel" then
							e.Text = ""
						end
					end
				end

				local c = game:GetService("Players")
				local d = c.LocalPlayer
				local e = d.PlayerGui
				local f = e:WaitForChild("TopbarStandard")
				local g = f:WaitForChild("Holders"):WaitForChild("Left")

				g:WaitForChild("PlayerName")

				for h, i in g:GetChildren() do
					changeText(i)
				end
				local h = e.Leaderboard.NameFrame.ScrollingFrame:FindFirstChild(d.Name)
				if h then
					h:Destroy()
				end
				game:GetService("Players").LocalPlayer.PlayerGui.OverlayGui.SubtitleFrame.Visible = false
			end

			function b.off() end

			return b
		end
		function a.v(): typeof(__modImpl())
			local b = a.cache.v
			if not b then
				b = { c = __modImpl() }
				a.cache.v = b
			end
			return b.c
		end
	end
	do
		local function __modImpl()
			local b = game:GetService("Players")
			local c = game:GetService("RunService")

			local d = b.LocalPlayer
			local e = d.PlayerGui

			local f = {}
			LPH_NO_VIRTUALIZE(function()
				f.GradePointsReq = {
					10000,
					3000,
					2000,
					1900,
					1500,
					1300,
					1200,
					500,
					250,
				}

				local g

				function f.on()
					f.off()
					g = c.Heartbeat:Connect(function(h)
						e.Stats.UI.GradeSlider.Visible = true
						e.Stats.UI.GradeSlider.SliderClip.Size = UDim2.fromScale(
							d:WaitForChild("Data"):WaitForChild("GradeUpPoints").Value
								/ f.GradePointsReq[d.Data.Grade.Value],
							1
						)
					end)

					mouseEnter = d
				end

				function f.off()
					e.Stats.UI.GradeSlider.Visible = false
					if g then
						g:Disconnect()
					end
				end
			end)()
			return f
		end
		function a.w(): typeof(__modImpl())
			local b = a.cache.w
			if not b then
				b = { c = __modImpl() }
				a.cache.w = b
			end
			return b.c
		end
	end
	do
		local function __modImpl()
			local b = a.r()
			local c = a.s()
			local d = a.t()
			local e = a.u()
			local f = a.v()
			local g = a.w()

			local h = {}
			h.init = LPH_NO_VIRTUALIZE(function()
				local i = Window:AddTab("Visuals", "eye")
				local j = i:AddLeftGroupbox("Player")
				local k = i:AddRightGroupbox("Mobs & NPC")

				j:AddButton({
					Text = "Streamer Mode",
					Func = function()
						f.on()
					end,
					Tooltip = "Hide your info when screensharing",
					DoubleClick = false,
				})

				j:AddToggle("spectatePlayerToggle", {
					Text = "Click Leaderboard to View",
					Default = false,
				})
				Toggles.spectatePlayerToggle:OnChanged(function()
					if Toggles.spectatePlayerToggle.Value then
						e.on()
					else
						e.off()
					end
				end)

				j:AddDivider()

				j:AddToggle("espPlayerToggle", {
					Text = "ESP Player",
					Default = false,
					Tooltip = "Show ESP for players",
				})
				j:AddToggle("espPlayerParryVisualize", {
					Text = "Parry Indicator",
					Default = false,
					Tooltip = "Show when to parry for players",
				})

				Toggles.espPlayerToggle:OnChanged(function()
					if Toggles.espPlayerToggle.Value then
						local l = {}
						for m, n in next, Options.espPlayerSelection.Value do
							table.insert(l, m)
						end
						b.on(Options.espPlayerColor.Value, l)
					else
						b.off()
					end
				end)

				j:AddLabel("Player ESP Color"):AddColorPicker("espPlayerColor", {
					Default = Color3.fromRGB(96, 205, 255),
					Title = "Player Color",
				})

				j:AddLabel("Parry Indicator Color"):AddColorPicker("espPlayerParryVisualizeColor", {
					Default = Color3.fromRGB(216, 45, 39),
					Title = "Parry Indicator Color",
				})

				Options.espPlayerColor:OnChanged(function()
					b.off()
					if Toggles.espPlayerToggle.Value then
						local l = {}
						for m, n in next, Options.espPlayerSelection.Value do
							table.insert(l, m)
						end
						b.on(Options.espPlayerColor.Value, l)
					end
				end)

				j:AddDropdown("espPlayerSelection", {
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
				Options.espPlayerSelection:OnChanged(function() end)

				j:AddLabel("ESP Player Keybind"):AddKeyPicker("espPlayerKeybind", {
					Default = "",
					Mode = "Toggle",
					Text = "ESP Player Keybind",
					NoUI = false,
					Callback = function(l)
						if Toggles.espPlayerToggle.Value then
							Toggles.espPlayerToggle:SetValue(false)
						else
							Toggles.espPlayerToggle:SetValue(true)
						end
					end,
				})

				j:AddDivider()

				j:AddToggle("gradePointToggle", {
					Text = "Grade Point UI",
					Default = false,
					Tooltip = "Toggle the grade point UI",
				})
				Toggles.gradePointToggle:OnChanged(function()
					if Toggles.gradePointToggle.Value then
						g.on()
					else
						g.off()
					end
				end)

				k:AddToggle("espMobToggle", {
					Text = "ESP Mob",
					Default = false,
					Tooltip = "Show ESP for mobs",
				})
				Toggles.espMobToggle:OnChanged(function()
					if Toggles.espMobToggle.Value then
						c.on(Options.espMobColor.Value)
					else
						c.off()
					end
				end)

				k:AddLabel("Mob ESP Color"):AddColorPicker("espMobColor", {
					Default = Color3.fromRGB(211, 49, 8),
					Title = "Mob Color",
				})
				Options.espMobColor:OnChanged(function()
					c.off()
					if Toggles.espMobToggle.Value then
						c.on(Options.espMobColor.Value)
					end
				end)

				k:AddLabel("ESP Mob Keybind"):AddKeyPicker("espMobKeybind", {
					Default = "",
					Mode = "Toggle",
					Text = "ESP Mob Keybind",
					NoUI = false,
					Callback = function(l)
						if Toggles.espMobToggle.Value then
							Toggles.espMobToggle:SetValue(false)
						else
							Toggles.espMobToggle:SetValue(true)
						end
					end,
				})

				k:AddDivider()

				k:AddToggle("espNpcToggle", {
					Text = "ESP NPC",
					Default = false,
					Tooltip = "Show ESP for NPCs",
				})
				Toggles.espNpcToggle:OnChanged(function()
					if Toggles.espNpcToggle.Value then
						d.on(Options.espNpcColor.Value)
					else
						d.off()
					end
				end)

				k:AddLabel("NPC ESP Color"):AddColorPicker("espNpcColor", {
					Default = Color3.fromRGB(155, 6, 255),
					Title = "NPC Color",
				})
				Options.espNpcColor:OnChanged(function()
					d.off()
					if Toggles.espNpcToggle.Value then
						d.on(Options.espNpcColor.Value)
					end
				end)

				k:AddLabel("ESP NPC Keybind"):AddKeyPicker("espNpcKeybind", {
					Default = "",
					Mode = "Toggle",
					Text = "ESP NPC Keybind",
					NoUI = false,
					Callback = function(l)
						if Toggles.espNpcToggle.Value then
							Toggles.espNpcToggle:SetValue(false)
						else
							Toggles.espNpcToggle:SetValue(true)
						end
					end,
				})
			end)

			return h
		end
		function a.x(): typeof(__modImpl())
			local b = a.cache.x
			if not b then
				b = { c = __modImpl() }
				a.cache.x = b
			end
			return b.c
		end
	end
	do
		local function __modImpl()
			game:GetService("MarketplaceService")
			game:GetService("VirtualInputManager")
			local b = game:GetService("Players")
			local c = game:GetService("RunService")

			local d = b.LocalPlayer
			local e = {}

			local f
			local g = {}
			local h = false

			local i = {
				Kether = CFrame.new(
					4729.77637,
					338.901337,
					-1197.84521,
					0.998169243,
					-4.15211643E-9,
					0.0604829043,
					1.09101705e-09,
					1,
					5.06440081e-08,
					-6.04829043E-2,
					-5.04853013E-8,
					0.998169243
				),
				Language = CFrame.new(4799.5625, 390.056946, -1166.06909, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				Philosophy = CFrame.new(
					996.82196,
					1746.71643,
					-1511.82288,
					-0.932488382,
					-7.2899481999999995E-8,
					0.361200005,
					-2.38091999E-8,
					1,
					1.40359035e-07,
					-0.361200005,
					1.22283282e-07,
					-0.932488382
				),
			}

			local j = { Kether = "Books", Language = "Language VFX", Philosophy = "Binah Floor" }

			local function clickButton(k)
				for l, m in
					game:GetService("Players").LocalPlayer.PlayerGui.Dialogue.MainFrame.Options.Scroll:GetChildren()
				do
					if m:IsA("Frame") then
						if m.OptionText.Text == k or m.OptionText.Text:find(k) then
							replicatesignal(m.OptionButton.MouseButton1Click)
							return true
						end
					end
				end
				return false
			end

			local k = false

			local l = false
			local m = false
			local n = false
			local o
			local function getDroppedItems()
				local p = {}
				for q, r in workspace.Thrown:GetChildren() do
					for s, t in r:GetDescendants() do
						if t:IsA("ProximityPrompt") and d:DistanceFromCharacter(r:GetPivot().Position) < 500 then
							table.insert(p, r)
						end
					end
				end
				return p
			end

			function e.on(p, q, r)
				e.off()
				h = true
				local s = { "Angelica" }
				o = task.spawn(function()
					local t = false
					if game.PlaceId ~= 99831550635699 then
						return false, "Not in the library"
					end
					if not workspace:GetAttribute("ServerType") == "Library" then
						return false, "Not in the library"
					end
					if not workspace.NPCS:FindFirstChild("Library Director") then
						return false, "Not in the library"
					end
					if not h then
						return
					end
					if not workspace.Map:FindFirstChild(j[Options.libraryFloorSelection.Value]) then
						task.wait(5)
					end
					local u = d.Backpack:FindFirstChild("Book Of The Library")
					if
						Toggles.buffLibrary.Value
						and u
						and not workspace.Map:FindFirstChild(j[Options.libraryFloorSelection.Value])
						and not k
					then
						if not h then
							return
						end
						u.Parent = d.Character
						if not h then
							return
						end
						d.Character:PivotTo(workspace.NPCS["Library Director"]:GetPivot())
						task.wait(1)
						if not h then
							return
						end
						workspace.NPCS["Library Director"].TalkToNPC:FireServer()
						if not d.Data.IsTalking.Value then
							if not h then
								return
							end
							repeat
								if not h then
									return
								end
								d.Character:PivotTo(workspace.NPCS["Library Director"]:GetPivot())
								workspace.NPCS["Library Director"].TalkToNPC:FireServer()
								task.wait(0.5)
							until d.Data.IsTalking.Value
						end
						if not h then
							return
						end
						task.wait(1)
						if not h then
							return
						end
						local v = false
						repeat
							task.wait()
							if not h then
								return
							end
							if clickButton("Bye") then
								v = true
							end
						until v
						if not h then
							return
						end
					end
					if not h then
						return
					end
					if not workspace.Map:FindFirstChild(j[Options.libraryFloorSelection.Value]) and not k then
						d.Character:PivotTo(CFrame.new(731.274353, 525.687317, 1016.26477))
						if not h then
							return
						end
						task.wait(1)
						if not h then
							return
						end
						workspace.NPCS["Ordeal Entrance"].TalkToNPC:FireServer()
						if not h then
							return
						end
						if not d.Data.IsTalking.Value then
							repeat
								if not h then
									return
								end
								d.Character:PivotTo(CFrame.new(731.274353, 525.687317, 1016.26477))
								workspace.NPCS["Ordeal Entrance"].TalkToNPC:FireServer()
								task.wait(0.5)
							until d.Data.IsTalking.Value
						end
						task.wait(1)
						if not h then
							return
						end
						if clickButton("Begin") then
							if not h then
								return
							end
							k = true
						else
							local v = false
							repeat
								task.wait()
								if not h then
									return
								end
								if clickButton("Select") then
									v = true
								end
							until v
							local w = false
							repeat
								task.wait()
								if not h then
									return
								end
								if clickButton(Options.libraryFloorSelection.Value) then
									w = true
								end
							until w
							task.wait(1)
							workspace.NPCS["Ordeal Entrance"].TalkToNPC:FireServer()
							if not d.Data.IsTalking.Value then
								repeat
									if not h then
										return
									end
									d.Character:PivotTo(CFrame.new(731.274353, 525.687317, 1016.26477))
									workspace.NPCS["Ordeal Entrance"].TalkToNPC:FireServer()
									task.wait(0.5)
								until d.Data.IsTalking.Value
							end
							task.wait(1)
							local x = false
							repeat
								task.wait()
								if not h then
									return
								end
								if clickButton("Begin") then
									x = true
								end
							until x
							k = true
						end
					else
						k = true
					end

					local v = workspace:FindFirstChild("KillBricks")
					if v then
						v:Destroy()
					end

					if not d.Character:FindFirstChild("AirTime") then
						local w = Instance.new("Folder")
						w.Name = "AirTime"
						w.Parent = d.Character
					end

					game:GetService("ReplicatedStorage").Events.Equip:FireServer(true)

					repeat
						task.wait()
						if not h then
							return
						end
					until workspace.Map:FindFirstChild(j[Options.libraryFloorSelection.Value])
					d.Character.HumanoidRootPart:PivotTo(i[Options.libraryFloorSelection.Value])
					local w = false
					f = c.PostSimulation:Connect(LPH_NO_VIRTUALIZE(function(x)
						if not f then
							return
						end
						if not h then
							return
						end
						if math.floor(workspace.DistributedGameTime) < 0 then
							game:GetService("ReplicatedStorage").Events.Equip:FireServer(false)
							for y, z in g do
								z:AdjustSpeed(0)
							end
							workspace.CurrentCamera.CameraSubject = d.Character.Humanoid
							d.Character:PivotTo(i[q])
							return true
						end
						t = false
						d.Data.Stamina.Value = 100
						local y = {}

						for z, A in workspace.Alive:GetChildren() do
							if
								not b:GetPlayerFromCharacter(A)
								and A.Humanoid.Health > 0
								and not A:FindFirstChild("GotGripped")
							then
								table.insert(y, A)
							end
						end

						table.sort(y, function(z, A)
							local B = table.find(s, z.Name) ~= nil
							local C = table.find(s, A.Name) ~= nil

							if B ~= C then
								return B
							end
							return z.Humanoid.MaxHealth > A.Humanoid.MaxHealth
						end)

						if #y ~= 0 then
							d.Character.HumanoidRootPart.Anchored = false
							local z = true
							for A, B in y do
								if not B:FindFirstChild("Aggrod") then
									d.Character.HumanoidRootPart:PivotTo(
										y[1].HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0)
											+ Vector3.new(0, 10, 0)
									)
									z = false
								end
							end
							if not z then
								return
							end
							if not w then
								w = true
								game:GetService("ReplicatedStorage").Events.Equip:FireServer(true)
								for A, B in g do
									B:Stop()
									B:Destroy()
								end
								table.clear(g)
								local A = 0
								for B, C in
									game:GetService("ReplicatedStorage").WeaponINFO[game.Players.LocalPlayer.Data.Weapon.Value]
										:GetChildren()
								do
									if C:IsA("Animation") then
										if C.Name:find("AttackAnimation") and C.Name ~= "ChargedAttackAnimation" then
											A = A + 1
										end
									end
								end
								for B = 1, A - 1 do
									local C = d.Character.Humanoid.Animator:LoadAnimation(
										game:GetService("ReplicatedStorage").WeaponINFO[game.Players.LocalPlayer.Data.Weapon.Value]["AttackAnimation" .. tostring(
											B
										)]
									)
									C:Play(0, 0.01, 100000)
									C.Looped = true
									table.insert(g, C)
								end
								task.delay(2.5, function()
									if f then
										for B, C in g do
											C:Stop()
											C:Destroy()
										end
										table.clear(g)
										game:GetService("ReplicatedStorage").Events.Equip:FireServer(false)
									end
									w = false
								end)
							end
							local A = Vector3.new(0, -Options.autoLibYOffset.Value, 0)

							if y[1]:FindFirstChild("GettingGripped") then
								d.Character.HumanoidRootPart.Anchored = true
								return
							end
							if y[1]:FindFirstChild("Knocked") then
								if not l then
									l = true
									game:GetService("ReplicatedStorage")
										:WaitForChild("Events")
										:WaitForChild("Grip")
										:FireServer(d.Character)
									task.delay(1, function()
										l = false
									end)
								end
								d.Character.HumanoidRootPart:PivotTo(
									y[1].HumanoidRootPart.CFrame + Vector3.new(0, 1, 0)
								)
								return
							end
							if y[1].Target.Value ~= d.Character then
								d.Character.HumanoidRootPart:PivotTo(
									y[1].HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0)
										+ Vector3.new(0, 5, 0)
								)
								return
							end
							d.Character.HumanoidRootPart:PivotTo(
								y[1].HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0) + A
							)
							workspace.CurrentCamera.CameraSubject = y[1].Humanoid
							d.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
							d.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
							d.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
						else
							if not f then
								m = false
								return
							end
							if m then
								return
							end
							local z = getDroppedItems()
							if #z ~= 0 then
								m = true
								for A, B in z do
									if not f then
										m = false
										return
									end
									for C, D in B:GetDescendants() do
										if not f then
											m = false
											return
										end
										if D:IsA("ProximityPrompt") then
											d.Character:PivotTo(B:GetPivot())
											fireproximityprompt(D)
											if not f then
												m = false
												return
											end
											repeat
												if not f then
													m = false
													return
												end
												d.Character:PivotTo(B:GetPivot())
												fireproximityprompt(D)
												task.wait()
											until not B.Parent
										end
									end
								end
								m = false
							end

							if not t then
								t = true
								w = false
								d.Character.HumanoidRootPart:PivotTo(i[Options.libraryFloorSelection.Value])
								game:GetService("ReplicatedStorage").Events.Equip:FireServer(false)
								for A, B in g do
									B:Stop()
								end
								workspace.CurrentCamera.CameraSubject = d.Character.Humanoid
								d.Character:PivotTo(i[Options.libraryFloorSelection.Value])
							end
						end
					end))
				end)
				return true
			end

			function e.off(p)
				h = false
				if o then
					task.cancel(o)
					o = nil
				end
				if f then
					f:Disconnect()
					f = nil
					if i[p] then
						d.Character:PivotTo(i[Options.libraryFloorSelection.Value])
					end
				end
				for q, r in g do
					r:Stop()
					r:Destroy()
				end
				table.clear(g)
				workspace.CurrentCamera.CameraSubject = d.Character.Humanoid
				d.Character.HumanoidRootPart.Anchored = false
			end

			local p

			function e.buffLibrary()
				if game.PlaceId ~= 99831550635699 then
					return false, "Not in the library"
				end
				if workspace:GetAttribute("ServerType") ~= "Library" then
					return false, "Not in the library"
				end
				if not workspace.NPCS:FindFirstChild("Library Director") then
					return false, "Not in the library"
				end
				if p then
					p:Disconnect()
					p = nil
				end
				if f then
					return false, ""
				end
				if o then
					task.cancel(o)
					o = nil
				end
				if not n and d.Backpack:FindFirstChild("Book Of The Library") then
					d.Backpack:FindFirstChild("Book Of The Library").Parent = d.Character
					p = c.RenderStepped:Connect(function(q)
						d.Character:PivotTo(workspace.NPCS["Library Director"]:GetPivot())
						if not d.Data.IsTalking.Value then
							workspace.NPCS["Library Director"].TalkToNPC:FireServer()
						else
							p:Disconnect()
							p = nil
						end
						if f then
							p:Disconnect()
							p = nil
						end
					end)
				end
			end

			return e
		end
		function a.y(): typeof(__modImpl())
			local b = a.cache.y
			if not b then
				b = { c = __modImpl() }
				a.cache.y = b
			end
			return b.c
		end
	end
	do
		local function __modImpl()
			game:GetService("VirtualInputManager")
			local b = game:GetService("Players")
			local c = game:GetService("RunService")

			local d = b.LocalPlayer

			local e = {}

			local f
			local g = {}
			local h = false
			local i = false
			local j = false

			local function clickButton(k)
				for l, m in
					game:GetService("Players").LocalPlayer.PlayerGui.Dialogue.MainFrame.Options.Scroll:GetChildren()
				do
					if m:IsA("Frame") then
						if m.OptionText.Text == k or m.OptionText.Text:find(k) then
							replicatesignal(m.OptionButton.MouseButton1Click)
							return true
						end
					end
				end
				return false
			end

			local function openDoorWithTiedToString(k, l)
				for m, n in workspace.Map.Map["Carriage_" .. tostring(l)].Doors:GetChildren() do
					if n:IsA("Model") then
						if n:FindFirstChild("TiedTo") then
							if n.TiedTo.Value.Name == k or n.TiedTo.Value.Name:find(k) then
								if n:FindFirstChildWhichIsA("ProximityPrompt").Enabled then
									d.Character:PivotTo(n:GetPivot())
									fireproximityprompt(n:FindFirstChildWhichIsA("ProximityPrompt"))
									return true
								else
									return false
								end
							end
						end
					end
				end
			end

			local k = false
			local l = false
			local m = false
			local n = false
			local function killMob(o)
				f = c.PostSimulation:Connect(LPH_NO_VIRTUALIZE(function(p)
					d.Data.Stamina.Value = 100
					local q = {}
					for r, s in workspace.Alive:GetChildren() do
						if
							not b:GetPlayerFromCharacter(s)
							and s.Humanoid.Health > 0
							and not s:FindFirstChild("GotGripped")
						then
							table.insert(q, s)
						end
					end

					table.sort(q, function(r, s)
						return r.Humanoid.MaxHealth > s.Humanoid.MaxHealth
					end)

					if #q ~= 0 then
						if not m then
							m = true
							game:GetService("ReplicatedStorage").Events.Equip:FireServer(true)
							for r, s in g do
								s:Stop()
								s:Destroy()
							end
							table.clear(g)
							local r = 0
							for s, t in
								game:GetService("ReplicatedStorage").WeaponINFO[game.Players.LocalPlayer.Data.Weapon.Value]
									:GetChildren()
							do
								if t:IsA("Animation") then
									if t.Name:find("AttackAnimation") and t.Name ~= "ChargedAttackAnimation" then
										r = r + 1
									end
								end
							end
							for s = 1, r - 1 do
								local t = d.Character.Humanoid.Animator:LoadAnimation(
									game:GetService("ReplicatedStorage").WeaponINFO[game.Players.LocalPlayer.Data.Weapon.Value]["AttackAnimation" .. tostring(
										s
									)]
								)
								t:Play(0, 0.01, 100000)
								t.Looped = true
								table.insert(g, t)
							end
							task.delay(5, function()
								if f then
									for s, t in g do
										t:Stop()
										t:Destroy()
									end
									table.clear(g)
									game:GetService("ReplicatedStorage").Events.Equip:FireServer(false)
								end
								m = false
							end)
						end
						d.Character.HumanoidRootPart.Anchored = false
						i = true
						k = false
						for r, s in g do
							s:Play()
							s:AdjustSpeed(1000)
						end
						local r = Vector3.new(0, -Options.autoWarpYOffset.Value, 0)
						if not l then
							l = true
							task.delay(1.5, function()
								l = false
							end)
						end
						if q[1]:FindFirstChild("Knocked") and not n then
							n = true
							d.Character.HumanoidRootPart:PivotTo(q[1].HumanoidRootPart.CFrame)
							game:GetService("ReplicatedStorage")
								:WaitForChild("Events")
								:WaitForChild("Grip")
								:FireServer(d.Character)
							task.delay(1, function()
								n = false
							end)
						end
						if d.Character:FindFirstChild("GripNotInterrupted") then
							d.Character.HumanoidRootPart.Anchored = true
							return
						end
						d.Character.HumanoidRootPart:PivotTo(
							q[1].HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0) + r
						)
						workspace.CurrentCamera.CameraSubject = q[1].Humanoid
						d.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
						d.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
						d.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
					else
						if m then
							m = false
							game:GetService("ReplicatedStorage").Events.Equip:FireServer(false)
						end
						workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
						i = false
						if not k then
							k = true
							d.Character:PivotTo(
								CFrame.new(-318.950195, 391.98999, 551.724976, 1, 0, 0, 0, 1, 0, 0, 0, 1)
							)
							for r, s in g do
								s:Stop()
							end
						end
					end

					if i then
						return
					end
					if not f then
						return
					end
					d.Character.HumanoidRootPart.Anchored = false

					if not openDoorWithTiedToString("CarriageEntranceDoor", 6) then
						d.Character:PivotTo(
							workspace
								:WaitForChild("NPCS")
								:WaitForChild("PrinceFight")
								:WaitForChild("The Prince of the Parade")
								:GetPivot()
						)
						if not j then
							j = true
							workspace
								:WaitForChild("NPCS")
								:WaitForChild("PrinceFight")
								:WaitForChild("The Prince of the Parade")
								:WaitForChild("TalkToNPC")
								:FireServer()
							clickButton("I'm here to end")
							clickButton("...")
							clickButton("What")
							task.delay(1, function()
								j = false
							end)
						end
					end
				end))
			end

			function e.on(o, p)
				e.off()
				h = false

				if game.PlaceId ~= 99831550635699 then
					return false, "Not in the Warp Train"
				end

				if not workspace:GetAttribute("WARPServer") then
					return false, "Not in the Warp Train"
				end

				if not workspace:FindFirstChild("Spawns") then
					if not workspace.Spawns:FindFirstChild("WARPSpawn") then
						return false, "Not in the Warp Train"
					end
					return false, "Not in the Warp Train"
				end

				local q = workspace:FindFirstChild("KillBricks")
				if q then
					q:Destroy()
				end

				if not d.Character:FindFirstChild("AirTime") then
					local r = Instance.new("Folder")
					r.Name = "AirTime"
					r.Parent = d.Character
				end

				game:GetService("ReplicatedStorage").Events.Equip:FireServer(true)

				killMob(o)

				return true
			end

			function e.off()
				h = true
				i = false
				if f then
					f:Disconnect()
					f = nil
					d.Character:PivotTo(
						CFrame.new(
							-331.066559,
							392.213531,
							550.836121,
							-7.475686820000001E-2,
							0.00394378649,
							-0.997193992,
							-1.45631475E-5,
							0.999992192,
							0.00395594304,
							0.997201741,
							0.00031024238,
							-7.4756227399999995E-2
						)
					)
				end
				for o, p in g do
					p:Stop()
					p:Destroy()
					p = nil
				end
				workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
				d.Character.HumanoidRootPart.Anchored = false
			end

			return e
		end
		function a.z(): typeof(__modImpl())
			local b = a.cache.z
			if not b then
				b = { c = __modImpl() }
				a.cache.z = b
			end
			return b.c
		end
	end
	do
		local function __modImpl()
			game:GetService("VirtualInputManager")
			local b = game:GetService("Players")
			local c = game:GetService("RunService")

			local d = b.LocalPlayer

			local e = {}

			local f
			local g = {}

			local h

			local function clickButton(i)
				for j, k in
					game:GetService("Players").LocalPlayer.PlayerGui.Dialogue.MainFrame.Options.Scroll:GetChildren()
				do
					if k:IsA("Frame") then
						if k.OptionText.Text == i or k.OptionText.Text:find(i) then
							replicatesignal(k.OptionButton.MouseButton1Click)
							return true
						end
					end
				end
				return false
			end

			local function checkAnimations(i, j)
				for k, l in j:GetPlayingAnimationTracks() do
					if l.Animation.AnimationId then
						if table.find(i, l.Animation.AnimationId) then
							return false
						end
					end
				end
				return true
			end

			local function checkIfStationYet()
				if not workspace.Map:FindFirstChild("StationDisplay") then
					return false
				end
				for i, j in workspace.Map.StationDisplay:GetChildren() do
					if j:IsA("Attachment") then
						if j:FindFirstChildWhichIsA("ProximityPrompt") then
							if j:FindFirstChildWhichIsA("ProximityPrompt").Enabled then
								return true
							end
						end
					end
				end
				return false
			end

			local function attachmentCounter()
				local i = 0
				if not workspace.Map:FindFirstChild("StationDisplay") then
					return 0
				end
				for j, k in workspace.Map.StationDisplay:GetChildren() do
					if k:IsA("Attachment") and k:FindFirstChildWhichIsA("ProximityPrompt") then
						if k:FindFirstChildWhichIsA("ProximityPrompt").Enabled then
							i = i + 1
						end
					end
				end
				return i
			end

			local function checkForStuffandClick(i)
				if not workspace.Map:FindFirstChild("StationDisplay") then
					return false
				end
				for j, k in workspace.Map.StationDisplay:GetChildren() do
					if k:IsA("Attachment") then
						if k.Name:find(i) or k.Name == i then
							d.Character:PivotTo(k.WorldCFrame)
							if k:FindFirstChildWhichIsA("ProximityPrompt").Enabled then
								fireproximityprompt(k:FindFirstChildWhichIsA("ProximityPrompt"))
								return true
							end
						end
					end
				end
				return false
			end

			local function getDroppedItems()
				local i = {}
				for j, k in workspace.Thrown:GetChildren() do
					for l, m in k:GetDescendants() do
						if
							m:IsA("ProximityPrompt")
							and d:DistanceFromCharacter(k:GetPivot().Position) < 300
							and k.Name ~= "DestroyedParts"
						then
							table.insert(i, k)
						end
					end
				end
				return i
			end

			local function splitString(i, j)
				j = j or ","
				local k = {}
				for l in i:gmatch("[^" .. j .. "]+") do
					table.insert(k, l:lower())
				end
				return k
			end

			local i = { "Nothing There", "Sweeper Brute", "Warm-Hearted Woodsman" }

			local j = {
				"rbxassetid://16428863879",
				"rbxassetid://16390219304",
				"rbxassetid://16390215619",
				"rbxassetid://16390221563",
				"rbxassetid://16390165394",
				"rbxassetid://16390173071",
				"rbxassetid://16390234461",
				"rbxassetid://16390226552",
				"rbxassetid://15151732756",
				"rbxassetid://17452190205",
				"rbxassetid://17450213059",
				"rbxassetid://17450216584",
				"rbxassetid://17452468519",
				"rbxassetid://17457663944",
				"rbxassetid://17460411925",
				"rbxassetid://85510754413939",
			}

			local k = false
			local l = false
			local m

			local function killMob(n)
				local o = {}
				local p = 0
				for q, r in
					game:GetService("ReplicatedStorage").WeaponINFO[game.Players.LocalPlayer.Data.Weapon.Value]
						:GetChildren()
				do
					if r.Name:find("AttackAnimation") and r.Name ~= "ChargedAttackAnimation" then
						p = p + 1
					end
				end
				p = p - 1
				for q = 1, p do
					table.insert(
						o,
						game:GetService("ReplicatedStorage").WeaponINFO[game.Players.LocalPlayer.Data.Weapon.Value]["AttackAnimation" .. tostring(
							q
						)].AnimationId
					)
				end

				for q = 1, p do
					local r = d.Character.Humanoid.Animator:LoadAnimation(
						game:GetService("ReplicatedStorage").WeaponINFO[game.Players.LocalPlayer.Data.Weapon.Value]["AttackAnimation" .. tostring(
							q
						)]
					)
					r:Play(0, 0.01, 100000)
					r.Looped = true
					table.insert(g, r)
				end

				local q = false
				local r = false
				local s = false
				local t = false
				f = c.PostSimulation:Connect(LPH_NO_VIRTUALIZE(function(u)
					if not h and workspace.Map:FindFirstChild("StationDisplay") then
						if workspace.Map:FindFirstChild("StationDisplay"):FindFirstChild("SurfaceGui") then
							if
								workspace.Map
									:FindFirstChild("StationDisplay")
									:FindFirstChild("SurfaceGui")
									:FindFirstChild("TextLabel")
							then
								h = Library:AddDraggableLabel(workspace.Map.StationDisplay.SurfaceGui.TextLabel.Text)
							end
						end
					end
					if workspace.Map:FindFirstChild("StationDisplay") then
						if workspace.Map:FindFirstChild("StationDisplay"):FindFirstChild("SurfaceGui") then
							if
								workspace.Map
									:FindFirstChild("StationDisplay")
									:FindFirstChild("SurfaceGui")
									:FindFirstChild("TextLabel")
							then
								h:SetText(workspace.Map.StationDisplay.SurfaceGui.TextLabel.Text)
							end
						end
					end
					d.Character.HumanoidRootPart.Anchored = false
					if d.Character:FindFirstChild("Grabbed") then
						return
					end
					d.Data.Stamina.Value = 100
					local v = {}
					for w, x in workspace.Alive:GetChildren() do
						if
							not b:GetPlayerFromCharacter(x)
							and x.Humanoid.Health > 0
							and not x:FindFirstChild("GotGripped")
						then
							table.insert(v, x)
						end
					end

					table.sort(v, function(w, x)
						return w.Humanoid.MaxHealth > x.Humanoid.MaxHealth
					end)

					local w = Vector3.new(0, -Options.autoRailwayYOffset.Value, 0)
					d.Character.HumanoidRootPart.Velocity = Vector3.zero
					if #d.Character.Humanoid.Animator:GetPlayingAnimationTracks() > 10 then
						for x, y in d.Character.Humanoid.Animator:GetPlayingAnimationTracks() do
							y:Destroy()
						end
					end
					if #v ~= 0 then
						t = true
						q = false
						r = false
						s = false
						if not l then
							l = true
							game:GetService("ReplicatedStorage").Events.Equip:FireServer(true)
							for x, y in o do
								local z = game.Players.LocalPlayer.Character.Humanoid.Animator:GetTrackByAnimationId(y)
								if z and not z.IsPlaying then
									z:Play(0, 0.01, 100000)
								else
									local A = Instance.new("Animation")
									A.AnimationId = y
									z = game.Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(A)
									z:Play(0, 0.01, 100000)
									z.Looped = true
									table.insert(g, z)
								end
							end
							task.delay(2, function()
								game:GetService("ReplicatedStorage").Events.Equip:FireServer(false)
								l = false
							end)
						end
						d.Character.HumanoidRootPart.Anchored = false
						for x, y in g do
							y:AdjustSpeed(100000)
						end
						if not m1Debounce then
							m1Debounce = true
							task.delay(0.75, function()
								m1Debounce = false
							end)
						end
						if v[1]:FindFirstChild("Knocked") and not gripDebounce then
							gripDebounce = true
							d.Character.HumanoidRootPart:PivotTo(v[1].HumanoidRootPart.CFrame)
							game:GetService("ReplicatedStorage")
								:WaitForChild("Events")
								:WaitForChild("Grip")
								:FireServer(d.Character)
							task.delay(1, function()
								gripDebounce = false
							end)
						end
						if d.Character:FindFirstChild("GripNotInterrupted") then
							d.Character.HumanoidRootPart.Anchored = true
							return
						end
						if not table.find(i, v[1].Name) then
							if v[1].Name == "Sweeper δ" or v[1].Name == "Sweeper α" or v[1].Name == "Sweeper β" then
								if math.floor(v[1].Humanoid.Health) == 1 then
									local x = v[1].HumanoidRootPart
									local y = x.Position
									local z = x.CFrame.LookVector * -5
									local A = y + z
									d.Character.HumanoidRootPart:PivotTo(CFrame.lookAt(A, y))
								else
									d.Character.HumanoidRootPart:PivotTo(
										v[1].HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0) + w
									)
								end
							elseif v[1].Name == "Gnome" then
								d.Character.HumanoidRootPart:PivotTo(
									v[1].HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0)
										+ Vector3.new(0, -5, 0)
								)
							else
								d.Character.HumanoidRootPart:PivotTo(
									v[1].HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0) + w
								)
							end

							workspace.CurrentCamera.CameraSubject = v[1].Humanoid
							d.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
							d.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
							d.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
							if v[1]:FindFirstChild("Knocked") and v[1].Name ~= "Sweeper δ" then
								d.Character.HumanoidRootPart:PivotTo(
									v[1].HumanoidRootPart.CFrame + Vector3.new(0, 4, 0)
								)
							elseif v[1]:FindFirstChild("Knocked") then
								d.Character.HumanoidRootPart:PivotTo(
									v[1].HumanoidRootPart.CFrame + Vector3.new(0, -5, 0)
								)
							end
						else
							if v[1].Name == "Nothing There" then
								if not checkAnimations(j, v[1].Humanoid.Animator) then
									d.Character.HumanoidRootPart:PivotTo(v[1]:GetPivot() + Vector3.new(0, 100, 0))
								else
									d.Character.HumanoidRootPart:PivotTo(v[1].HumanoidRootPart.CFrame)
									workspace.CurrentCamera.CameraSubject = v[1].Humanoid
								end
							elseif v[1].Name == "Sweeper Brute" then
								if math.floor(v[1].Humanoid.Health) == 1 then
									local x = v[1].HumanoidRootPart
									local y = x.Position
									local z = x.CFrame.LookVector * -5
									local A = y + z
									d.Character.HumanoidRootPart:PivotTo(CFrame.lookAt(A, y))
								else
									d.Character.HumanoidRootPart:PivotTo(
										v[1].HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0)
											+ Vector3.new(0, -11, 0)
									)
								end
								workspace.CurrentCamera.CameraSubject = v[1].Humanoid
							elseif v[1].Name == "Warm-Hearted Woodsman" then
								if not checkAnimations(j, v[1].Humanoid.Animator) then
									d.Character.HumanoidRootPart:PivotTo(v[1]:GetPivot() + Vector3.new(0, 100, 0))
								else
									d.Character.HumanoidRootPart:PivotTo(v[1].HumanoidRootPart.CFrame)
									workspace.CurrentCamera.CameraSubject = v[1].Humanoid
								end
							end
						end
					else
						if q then
							return
						end
						t = true
						q = true
						d.Character.HumanoidRootPart.Anchored = false
						workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
						for x, y in g do
							y:Stop()
						end
						if l then
							game:GetService("ReplicatedStorage").Events.Equip:FireServer(false)
							l = false
						end
						if k then
							q = false
							return
						end
						local x = getDroppedItems()
						if #x ~= 0 then
							k = true
							for y, z in x do
								if not f then
									k = false
									q = false
									return
								end
								for A, B in z:GetDescendants() do
									if not f then
										k = false
										return
									end
									if B:IsA("ProximityPrompt") then
										d.Character:PivotTo(z:GetPivot())
										fireproximityprompt(B)
										if not f then
											k = false
											return
										end
										repeat
											if not f then
												k = false
												return
											end
											d.Character:PivotTo(z:GetPivot())
											fireproximityprompt(B)
											task.wait(0.5)
										until not z.Parent
									end
								end
							end
							k = false
						end
						if checkIfStationYet() and not workspace.NPCS:FindFirstChild("Railway Merchant") then
							if attachmentCounter() >= 4 then
								for y, z in ipairs(autoRailwayLootPriority) do
									if checkForStuffandClick(z) then
										q = false
										return
									end
								end
							end
						elseif workspace.NPCS:FindFirstChild("Railway Merchant") then
							if Toggles.autoSellExclude.Value or Toggles.autoSellInclude.Value then
								local y = splitString(Options.sellInput.Value)
								if Toggles.autoSellExclude.Value then
									getSellLists(y, "Exclude")
								end
								if Toggles.autoSellInclude.Value then
									getSellLists(y, "Include")
								end
								if isSellAble then
									q = false
									d.Character:PivotTo(
										workspace.NPCS:FindFirstChild("Railway Merchant"):GetPivot()
											+ Vector3.new(-0.5, 0, 0)
									)
									return
								end
							end
							if not s then
								s = true
								repeat
									task.wait()
									clickButton("Never")
									clickButton("Bye")
								until not game.Players.LocalPlayer.Data.IsTalking.Value
								repeat
									if
										workspace.NPCS
											:FindFirstChild("Railway Merchant")
											:FindFirstChildWhichIsA("ProximityPrompt")
									then
										d.Character:PivotTo(
											workspace.NPCS:FindFirstChild("Railway Merchant"):GetPivot()
												+ Vector3.new(-0.5, 0, 0)
										)
										fireproximityprompt(
											workspace.NPCS
												:FindFirstChild("Railway Merchant")
												:FindFirstChildWhichIsA("ProximityPrompt")
										)
									end
									task.wait()
								until game.Players.LocalPlayer.Data.IsTalking.Value
								repeat
									d.Character:PivotTo(
										workspace.NPCS:FindFirstChild("Railway Merchant"):GetPivot()
											+ Vector3.new(-0.5, 0, 0)
									)
									fireproximityprompt(
										workspace.NPCS
											:FindFirstChild("Railway Merchant")
											:FindFirstChildWhichIsA("ProximityPrompt")
									)
									if clickButton("Heal me") then
										q = false
										return
									end
									task.wait()
								until s
							end
							if not r and s then
								t = false
								r = true
								repeat
									task.wait()
									clickButton("Never")
									clickButton("Bye")
								until not game.Players.LocalPlayer.Data.IsTalking.Value
								repeat
									d.Character:PivotTo(
										workspace.NPCS:FindFirstChild("Railway Merchant"):GetPivot()
											+ Vector3.new(-0.5, 0, 0)
									)
									if
										workspace.NPCS
											:FindFirstChild("Railway Merchant")
											:FindFirstChildWhichIsA("ProximityPrompt")
									then
										fireproximityprompt(
											workspace.NPCS
												:FindFirstChild("Railway Merchant")
												:FindFirstChildWhichIsA("ProximityPrompt")
										)
									end
									task.wait()
								until game.Players.LocalPlayer.Data.IsTalking.Value
								task.delay(3, function()
									t = true
									q = false
								end)
								repeat
									task.wait()
									fireproximityprompt(
										workspace.NPCS
											:FindFirstChild("Railway Merchant")
											:FindFirstChildWhichIsA("ProximityPrompt")
									)
									if clickButton("Claim") then
										q = false
										t = true
										break
									end
									break
								until t
								return
							end
						end
						for y, z in g do
							z:Stop()
							z:Destroy()
						end
						table.clear(g)
						if workspace.Map:FindFirstChild("Exit") and t then
							m = workspace.Map:FindFirstChild("Exit"):GetPivot()
							d.Character:PivotTo(workspace.Map:FindFirstChild("Exit"):GetPivot())
						end
						q = false
					end
				end))
			end

			function e.on(n, o)
				e.off()
				for p, q in g do
					q:Stop()
					q:Destroy()
				end
				table.clear(g)
				if game.PlaceId ~= 99831550635699 then
					return false, "Not in the Railway"
				end
				if workspace:GetAttribute("ServerType") ~= "RefractionRailway" then
					return false, "Not in the Railway"
				end

				local p = workspace:FindFirstChild("KillBricks")
				if p then
					p:Destroy()
				end
				if h then
					h:SetVisible(true)
				end

				if not d.Character:FindFirstChild("AirTime") then
					local q = Instance.new("Folder")
					q.Name = "AirTime"
					q.Parent = d.Character
				end

				game:GetService("ReplicatedStorage").Events.Equip:FireServer(true)
				killMob(n)

				return true
			end

			function e.off()
				if h then
					h:SetVisible(false)
				end
				if f then
					f:Disconnect()
					f = nil
					if workspace.Map:FindFirstChild("Exit") then
						m = workspace.Map:FindFirstChild("Exit"):GetPivot()
						d.Character.HumanoidRootPart.Velocity = Vector3.zero
						d.Character:PivotTo(workspace.Map:FindFirstChild("Exit"):GetPivot())
					end
				end
				for n, o in g do
					o:Stop()
					o:Destroy()
				end
				table.clear(g)
				m1Debounce = false
				gripDebounce = false
				l = false
				k = false
				d.Character.HumanoidRootPart.Anchored = false
				workspace.CurrentCamera.CameraSubject = d.Character.Humanoid
			end

			return e
		end
		function a.A(): typeof(__modImpl())
			local b = a.cache.A
			if not b then
				b = { c = __modImpl() }
				a.cache.A = b
			end
			return b.c
		end
	end
	do
		local function __modImpl()
			game:GetService("MarketplaceService")
			game:GetService("NonReplicatedCSGDictionaryService")
			game:GetService("VirtualInputManager")
			local b = game:GetService("Players")
			local c = game:GetService("RunService")

			local d = b.LocalPlayer
			local e = {}

			local f
			local g = {}

			local function clickButton(h)
				for i, j in
					game:GetService("Players").LocalPlayer.PlayerGui.Dialogue.MainFrame.Options.Scroll:GetChildren()
				do
					if j:IsA("Frame") then
						if j.OptionText.Text == h or j.OptionText.Text:find(h) then
							replicatesignal(j.OptionButton.MouseButton1Click)
							return true
						end
					end
				end
				return false
			end

			local h = false
			local i = false

			local function killMob(j, k)
				f = c.PostSimulation:Connect(LPH_NO_VIRTUALIZE(function(l)
					if k then
						if d.Data.Grade.Value == k then
							f:Disconnect()
							f = nil
						end
					end

					d.Data.Stamina.Value = 100
					local m = {}
					for n, o in workspace.Alive:GetChildren() do
						if
							not b:GetPlayerFromCharacter(o)
							and o.Humanoid.Health > 0
							and not o:FindFirstChild("GotGripped")
						then
							table.insert(m, o)
						end
					end

					table.sort(m, function(n, o)
						return n.Humanoid.MaxHealth > o.Humanoid.MaxHealth
					end)

					if #m ~= 0 then
						if not h then
							h = true
							game:GetService("ReplicatedStorage").Events.Equip:FireServer(true)
							for n, o in g do
								o:Stop()
								o:Destroy()
							end
							table.clear(g)
							local n = 0
							for o, p in
								game:GetService("ReplicatedStorage").WeaponINFO[game.Players.LocalPlayer.Data.Weapon.Value]
									:GetChildren()
							do
								if p:IsA("Animation") then
									if p.Name:find("AttackAnimation") and p.Name ~= "ChargedAttackAnimation" then
										n = n + 1
									end
								end
							end
							for o = 1, n - 1 do
								local p = d.Character.Humanoid.Animator:LoadAnimation(
									game:GetService("ReplicatedStorage").WeaponINFO[game.Players.LocalPlayer.Data.Weapon.Value]["AttackAnimation" .. tostring(
										o
									)]
								)
								p:Play(0, 0.01, 100000)
								p.Looped = true
								table.insert(g, p)
							end
							task.delay(5, function()
								if f then
									for o, p in g do
										p:Stop()
										p:Destroy()
									end
									table.clear(g)
									game:GetService("ReplicatedStorage").Events.Equip:FireServer(false)
								end
								h = false
							end)
						end
						for n, o in g do
							o:AdjustSpeed(1000)
						end

						local n = Vector3.new(0, -Options.autoGradeEvaYOffset.Value, 0)
						if j then
							n = Vector3.new(0, -j, 0)
						end
						d.Character.HumanoidRootPart:PivotTo(
							m[1].HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0) + n
						)
						workspace.CurrentCamera.CameraSubject = m[1].Humanoid
						d.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
						d.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
						d.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
					else
						if h then
							game:GetService("ReplicatedStorage").Events.Equip:FireServer(false)
							h = false
						end
						for n, o in g do
							o:AdjustSpeed(0)
						end
						f:Disconnect()
						workspace.CurrentCamera.CameraSubject = d.Character.Humanoid
					end
				end))
			end

			local j = {
				"rbxassetid://16428863879",
				"rbxassetid://16390219304",
				"rbxassetid://16390215619",
				"rbxassetid://16390221563",
				"rbxassetid://16390165394",
				"rbxassetid://16390173071",
				"rbxassetid://16390234461",
				"rbxassetid://16390226552",
				"rbxassetid://15151732756",
				"rbxassetid://94944102411307",
				"rbxassetid://85510754413939",
				"rbxassetid://15505794653",
				"rbxassetid://137188116311603",
				"rbxassetid://118113959846801",
				"rbxassetid://125475069258276",
				"rbxassetid://106835137675309",
				"rbxassetid://79887420839095",
				"rbxassetid://129289587223029",
			}

			local function checkAnimations(k, l)
				for m, n in l:GetPlayingAnimationTracks() do
					if n.Animation.AnimationId then
						if table.find(k, n.Animation.AnimationId) then
							return false
						end
					end
				end
				return true
			end

			local function killBehind(k, l)
				local m = game.Players.LocalPlayer.Character.Humanoid.Animator
				local n = 0
				for o, p in
					game:GetService("ReplicatedStorage").WeaponINFO[game.Players.LocalPlayer.Data.Weapon.Value]
						:GetChildren()
				do
					if p:IsA("Animation") then
						if p.Name:find("AttackAnimation") and p.Name ~= "ChargedAttackAnimation" then
							n = n + 1
						end
					end
				end
				for o = 1, n - 1 do
					local p = m:LoadAnimation(
						game:GetService("ReplicatedStorage").WeaponINFO[game.Players.LocalPlayer.Data.Weapon.Value]["AttackAnimation" .. tostring(
							o
						)]
					)
					p:Play(0, 0.01, 100000)
					p.Looped = true
					table.insert(g, p)
				end
				f = c.PostSimulation:Connect(LPH_NO_VIRTUALIZE(function(o)
					d.Data.Stamina.Value = 100
					local p = {}
					if l then
						if d.Data.Grade.Value == l then
							f:Disconnect()
							f = nil
						end
					end
					for q, r in workspace.Alive:GetChildren() do
						if
							not b:GetPlayerFromCharacter(r)
							and r.Humanoid.Health > 0
							and not r:FindFirstChild("GotGripped")
						then
							table.insert(p, r)
						end
					end

					table.sort(p, function(q, r)
						return q.Humanoid.MaxHealth > r.Humanoid.MaxHealth
					end)

					if #p ~= 0 then
						if not h then
							game:GetService("ReplicatedStorage").Events.Equip:FireServer(true)
							h = true
						end
						for q, r in g do
							r:AdjustSpeed(1000)
						end
						local q = -p[1].HumanoidRootPart.CFrame.LookVector
						local r = p[1].HumanoidRootPart.CFrame.Position + (q * 3)
						if not checkAnimations(j, p[1].Humanoid.Animator) then
							d.Character.HumanoidRootPart:PivotTo(p[1]:GetPivot() + Vector3.new(0, 100, 0))
						else
							d.Character.HumanoidRootPart:PivotTo(CFrame.new(r, p[1].HumanoidRootPart.CFrame.Position))
							workspace.CurrentCamera.CameraSubject = p[1].Humanoid
						end
						d.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
						d.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
						d.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
					else
						if h then
							game:GetService("ReplicatedStorage").Events.Equip:FireServer(false)
							h = false
						end
						for q, r in g do
							r:AdjustSpeed(0)
						end
						workspace.CurrentCamera.CameraSubject = d.Character.Humanoid
					end
				end))
			end

			local function hitBosses(k, l)
				repeat
					task.wait()
					if not Toggles.autoGradeEva.Value then
						break
					end
					if not workspace.NPCS:FindFirstChild("Hana Association Examiner") then
						break
					end
					if not d.Data.IsTalking.Value then
						d.Character:PivotTo(CFrame.new(2480.207763671875, 2439.3525390625, 2840.808349609375))
						workspace.NPCS["Hana Association Examiner"].TalkToNPC:FireServer()
					end
					clickButton("Begin")
				until workspace.Alive:FindFirstChild("Dream Devouring Siltcurrent")
					or workspace.Alive:FindFirstChild("Warm-Hearted Woodsman")
					or workspace.Alive:FindFirstChild("Nothing There")

				killBehind(k, l)
			end

			local function hanaHit(k)
				repeat
					task.wait()
					if not Toggles.autoGradeEva.Value then
						break
					end
					if not workspace.NPCS:FindFirstChild("Hana Association Examiner") then
						break
					end
					if not d.Data.IsTalking.Value then
						d.Character:PivotTo(CFrame.new(2480.207763671875, 2439.3525390625, 2840.808349609375))
						workspace.NPCS["Hana Association Examiner"].TalkToNPC:FireServer()
					end
					clickButton("Begin")
				until workspace.Alive:FindFirstChild("Hana Association Examiner")
				killMob(3, k)
			end

			local function leaveElavator(k)
				local l
				for m, n in workspace.NPCS:GetChildren() do
					if n.Name == "Elevator" and not n:FindFirstChild("NormalTP") then
						l = n
					end
				end
				repeat
					task.wait()
				until d.Data.Grade.Value == k
				local m = false
				repeat
					task.wait()
					d.Character:PivotTo(l:GetPivot())
					if not d.Data.IsTalking.Value then
						workspace.NPCS.Elevator.TalkToNPC:FireServer()
					end
					if clickButton("Take") then
						m = true
					end
				until m
			end

			local k = {
				[9] = function()
					repeat
						task.wait()
						if not Toggles.autoGradeEva.Value then
							break
						end
						if not d.Data.IsTalking.Value then
							d.Character:PivotTo(CFrame.new(2480.207763671875, 2439.3525390625, 2840.808349609375))
							workspace.NPCS["Hana Association Examiner"].TalkToNPC:FireServer()
						end
						clickButton("Begin")
						clickButton("9")
						clickButton("Every")
						clickButton("125")
						clickButton("13.5")
						clickButton("Tower")
						clickButton("Fixer")
					until d.Data.Grade.Value == 8
					leaveElavator(8)
				end,
				[8] = function(k)
					hanaHit(7)
					leaveElavator(7)
				end,
				[7] = function(k)
					hanaHit(6)
					leaveElavator(6)
				end,
				[6] = function(k)
					hanaHit(5)
					leaveElavator(5)
				end,
				[5] = function(k)
					repeat
						task.wait()
						if not Toggles.autoGradeEva.Value then
							break
						end
						if not workspace.NPCS:FindFirstChild("Hana Association Examiner") then
							break
						end
						if not d.Data.IsTalking.Value then
							d.Character:PivotTo(CFrame.new(2480.207763671875, 2439.3525390625, 2840.808349609375))
							workspace.NPCS["Hana Association Examiner"].TalkToNPC:FireServer()
						end
						clickButton("Begin")
					until workspace.Alive:FindFirstChild("Hana Association Examiner")
					for l, m in workspace.NPCS:GetChildren() do
						if m.Name == "Elevator" and m:FindFirstChild("NormalTP") then
							d.Character:PivotTo(m:GetPivot())
						end
					end
					leaveElavator(4)
				end,
				[4] = function(k)
					hitBosses(k, 3)
					leaveElavator(3)
				end,
				[3] = function(k)
					hitBosses(k, 2)
					leaveElavator(2)
				end,
				[2] = function(k)
					hitBosses(k, 1)
					leaveElavator(1)
				end,
			}

			function e.on(l)
				e.off()
				if game.PlaceId ~= 99831550635699 then
					return false, "Not in the exam"
				end
				if not workspace.Map:FindFirstChild("ExamRoom") then
					return false, "Not in the exam"
				end
				i = true
				if k[tonumber(game:GetService("Players").LocalPlayer.Data.Grade.Value)] then
					k[tonumber(game:GetService("Players").LocalPlayer.Data.Grade.Value)](l)
					return true, "success"
				else
					return false, "not found"
				end
			end

			function e.off()
				i = false
				if f then
					f:Disconnect()
					f = nil
				end
				for l, m in g do
					m:Stop()
					m:Destroy()
					m = nil
				end
				workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
			end

			return e
		end
		function a.B(): typeof(__modImpl())
			local b = a.cache.B
			if not b then
				b = { c = __modImpl() }
				a.cache.B = b
			end
			return b.c
		end
	end
	do
		local function __modImpl()
			game:GetService("MarketplaceService")
			game:GetService("VirtualInputManager")
			local b = game:GetService("Players")
			local c = game:GetService("RunService")

			local d = b.LocalPlayer
			local e = {}

			local f
			local g = {}
			local h = false

			local function clickButton(i)
				for j, k in
					game:GetService("Players").LocalPlayer.PlayerGui.Dialogue.MainFrame.Options.Scroll:GetChildren()
				do
					if k:IsA("Frame") then
						if k.OptionText.Text == i or k.OptionText.Text:find(i) then
							replicatesignal(k.OptionButton.MouseButton1Click)
							return true
						end
					end
				end
				return false
			end
			local i = { "Thumb Soldato", "Thumb Soldato III" }
			local function isInIgnoreLists(j)
				for k, l in i do
					if l:find(j) or l == j then
						return true
					end
				end
				return false
			end

			local function getDroppedItems()
				local j = {}
				for k, l in workspace.Thrown:GetChildren() do
					for m, n in l:GetDescendants() do
						if n:IsA("ProximityPrompt") then
							table.insert(j, l)
						end
					end
				end
				return j
			end

			local j = false
			local k = {
				["Lei Heng"] = "Capo IIII of The Thumb",
				Gloom = "Absolute Gloom",
				Pride = "Absolute Pride",
				Wrath = "Absolute Wrath",
				Desire = "Absolute Desire",
				Sloth = "Absolute Sloth",
				Envy = "Absolute Envy",
				Gluttony = "Absolute Gluttony",
			}

			local l = false
			local m = false

			local n = {
				["Lei Heng"] = function()
					local n = workspace.NPCS:FindFirstChild("Fragmented Self")
					local o = false
					if workspace.NPCS:FindFirstChild("Ordeal Entrance") then
						o = true
						if
							not workspace.Alive:FindFirstChild("Capo IIII of The Thumb")
							and not workspace.NPCS["Ordeal Entrance"]:FindFirstChild("LeiHengRig")
						then
							local p = false
							repeat
								task.wait(0.5)
								if not h then
									break
								end
								workspace.NPCS["Ordeal Entrance"].TalkToNPC:FireServer()
								d.Character:PivotTo(workspace.NPCS["Ordeal Entrance"]:GetPivot())
								if clickButton("Face") then
									p = true
								end
							until p
						end
					end
					if n and not o then
						local p = false
						repeat
							task.wait()
							if not h then
								break
							end
							fireproximityprompt(n.InteractPrompt)
							d.Character:PivotTo(n:GetPivot())
							d.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
							d.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
							d.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
							if clickButton("Worlds") then
								p = true
							end
						until p
						local q = false
						repeat
							task.wait()
							if not h then
								break
							end
							fireproximityprompt(n.InteractPrompt)
							d.Character:PivotTo(n:GetPivot())
							if clickButton("Thumb") then
								q = true
							end
						until q
						repeat
							task.wait()
						until workspace.NPCS:FindFirstChild("Ordeal Entrance")
						local r = false
						repeat
							task.wait(0.5)
							if not h then
								break
							end
							workspace.NPCS["Ordeal Entrance"].TalkToNPC:FireServer()
							d.Character:PivotTo(workspace.NPCS["Ordeal Entrance"]:GetPivot())
							if clickButton("Face") then
								r = true
							end
						until r
					end
				end,
				Gloom = function()
					local n = workspace.NPCS:FindFirstChild("Fragmented Self")
					if not workspace.Alive:FindFirstChild("Absolute Gloom") and n then
						local o = false
						repeat
							if l then
								break
							end
							d.Character:PivotTo(n:GetPivot())
							d.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
							d.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
							d.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
							task.wait()
							if not h then
								break
							end
							d.Character:PivotTo(n:GetPivot())
							fireproximityprompt(n.InteractPrompt)
							if clickButton("Sin") then
								o = true
							end
						until o
						local p = false
						repeat
							if l then
								break
							end
							d.Character:PivotTo(n:GetPivot())
							task.wait()
							if not h then
								break
							end
							d.Character:PivotTo(n:GetPivot())
							fireproximityprompt(n.InteractPrompt)
							if clickButton("Gloom") then
								p = true
							end
						until p
					end
				end,
				Pride = function()
					local n = workspace.NPCS:FindFirstChild("Fragmented Self")
					if not workspace.Alive:FindFirstChild("Absolute Pride") and n then
						local o = false
						repeat
							if l then
								break
							end
							d.Character:PivotTo(n:GetPivot())
							d.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
							d.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
							d.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
							task.wait()
							if not h then
								break
							end
							d.Character:PivotTo(n:GetPivot())
							fireproximityprompt(n.InteractPrompt)
							if clickButton("Sin") then
								o = true
							end
						until o
						local p = false
						repeat
							if l then
								break
							end
							d.Character:PivotTo(n:GetPivot())
							task.wait()
							if not h then
								break
							end
							d.Character:PivotTo(n:GetPivot())
							fireproximityprompt(n.InteractPrompt)
							if clickButton("Pride") then
								p = true
							end
						until p
					end
				end,
				Wrath = function()
					local n = workspace.NPCS:FindFirstChild("Fragmented Self")
					if not workspace.Alive:FindFirstChild("Absolute Wrath") and n then
						local o = false
						repeat
							if l then
								break
							end
							d.Character:PivotTo(n:GetPivot())
							d.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
							d.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
							d.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
							task.wait()
							if not h then
								break
							end
							d.Character:PivotTo(n:GetPivot())
							fireproximityprompt(n.InteractPrompt)
							if clickButton("Sin") then
								o = true
							end
						until o
						local p = false
						repeat
							if l then
								break
							end
							d.Character:PivotTo(n:GetPivot())
							task.wait()
							if not h then
								break
							end
							d.Character:PivotTo(n:GetPivot())
							fireproximityprompt(n.InteractPrompt)
							if clickButton("Wrath") then
								p = true
							end
						until p
					end
				end,
				Desire = function()
					local n = workspace.NPCS:FindFirstChild("Fragmented Self")
					if not workspace.Alive:FindFirstChild("Absolute Desire") and n then
						local o = false
						repeat
							if l then
								break
							end
							d.Character:PivotTo(n:GetPivot())
							d.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
							d.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
							d.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
							task.wait()
							if not h then
								break
							end
							d.Character:PivotTo(n:GetPivot())
							fireproximityprompt(n.InteractPrompt)
							if clickButton("Sin") then
								o = true
							end
						until o
						local p = false
						repeat
							if l then
								break
							end
							d.Character:PivotTo(n:GetPivot())
							task.wait()
							if not h then
								break
							end
							d.Character:PivotTo(n:GetPivot())
							fireproximityprompt(n.InteractPrompt)
							if clickButton("Desire") then
								p = true
							end
						until p
					end
				end,
				Sloth = function()
					local n = workspace.NPCS:FindFirstChild("Fragmented Self")
					if not workspace.Alive:FindFirstChild("Absolute Sloth") and n then
						local o = false
						repeat
							if l then
								break
							end
							d.Character:PivotTo(n:GetPivot())
							d.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
							d.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
							d.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
							task.wait()
							if not h then
								break
							end
							d.Character:PivotTo(n:GetPivot())
							fireproximityprompt(n.InteractPrompt)
							if clickButton("Sin") then
								o = true
							end
						until o
						local p = false
						repeat
							if l then
								break
							end
							d.Character:PivotTo(n:GetPivot())
							d.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
							d.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
							d.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
							task.wait()
							if not h then
								break
							end
							d.Character:PivotTo(n:GetPivot())
							fireproximityprompt(n.InteractPrompt)
							if clickButton("Sloth") then
								p = true
							end
						until p
					end
				end,
				Envy = function()
					local n = workspace.NPCS:FindFirstChild("Fragmented Self")
					if not workspace.Alive:FindFirstChild("Absolute Envy") and n then
						local o = false
						repeat
							if l then
								break
							end
							d.Character:PivotTo(n:GetPivot())
							d.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
							d.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
							d.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
							task.wait()
							if not h then
								break
							end
							d.Character:PivotTo(n:GetPivot())
							fireproximityprompt(n.InteractPrompt)
							if clickButton("Sin") then
								o = true
							end
						until o
						local p = false
						repeat
							if l then
								break
							end
							d.Character:PivotTo(n:GetPivot())
							d.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
							d.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
							d.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
							task.wait()
							if not h then
								break
							end
							d.Character:PivotTo(n:GetPivot())
							fireproximityprompt(n.InteractPrompt)
							if clickButton("Envy") then
								p = true
							end
						until p
					end
				end,
				Gluttony = function()
					local n = workspace.NPCS:FindFirstChild("Fragmented Self")
					if not workspace.Alive:FindFirstChild("Absolute Gluttony") and n then
						local o = false
						repeat
							if l then
								break
							end
							d.Character:PivotTo(n:GetPivot())
							d.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
							d.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
							d.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
							task.wait()
							if not h then
								break
							end
							d.Character:PivotTo(n:GetPivot())
							fireproximityprompt(n.InteractPrompt)
							if clickButton("Sin") then
								o = true
							end
						until o
						local p = false
						repeat
							if l then
								break
							end
							task.wait()
							if not h then
								break
							end
							fireproximityprompt(n.InteractPrompt)
							d.Character:PivotTo(n:GetPivot())
							if clickButton("Gluttony") then
								p = true
							end
						until p
					end
				end,
			}

			local o = false

			function e.on()
				e.off()
				h = true
				if game.PlaceId ~= 99831550635699 then
					return false, "Not in the L Corp"
				end
				if not workspace:GetAttribute("ServerType") == "LCorpBranch" then
					return false, "Not in the L Corp"
				end

				local p = workspace:FindFirstChild("KillBricks")
				if p then
					p:Destroy()
				end

				if not d.Character:FindFirstChild("AirTime") then
					local q = Instance.new("Folder")
					q.Name = "AirTime"
					q.Parent = d.Character
				end

				game:GetService("ReplicatedStorage").Events.Equip:FireServer(true)
				local q = false
				local r = false
				local s = false

				local t = false
				local u = false

				f = c.PostSimulation:Connect(LPH_NO_VIRTUALIZE(function(v)
					if o then
						e.off()
					end
					if not h then
						return
					end

					if d.Character then
						if d.Character:FindFirstChild("Humanoid") then
							workspace.CurrentCamera.CameraSubject = d.Character.Humanoid
						end
					end

					local w = getDroppedItems()
					if #w ~= 0 then
						pickingUpItem = true
						for x, y in w do
							if not f then
								pickingUpItem = false
								return
							end
							for z, A in y:GetDescendants() do
								if not f then
									pickingUpItem = false
									return
								end
								if A:IsA("ProximityPrompt") then
									d.Character:PivotTo(y:GetPivot())
									fireproximityprompt(A)
									if not f then
										pickingUpItem = false
										return
									end
									repeat
										if not f then
											pickingUpItem = false
											return
										end
										d.Character:PivotTo(y:GetPivot())
										fireproximityprompt(A)
										task.wait(1)
									until not y.Parent
								end
							end
						end
						pickingUpItem = false
						r = false
						return
					end
					d.Data.Stamina.Value = 100
					local x = {}

					for y, z in workspace.Alive:GetChildren() do
						if
							not b:GetPlayerFromCharacter(z)
							and z.Humanoid.Health > 0
							and not z:FindFirstChild("GotGripped")
							and not isInIgnoreLists(z.Name)
						then
							table.insert(x, z)
						end
					end

					table.sort(x, function(y, z)
						return y.Humanoid.MaxHealth > z.Humanoid.MaxHealth
					end)

					if #x ~= 0 then
						l = true
						d.Character.HumanoidRootPart.Anchored = false
						if not q then
							q = true
							game:GetService("ReplicatedStorage").Events.Equip:FireServer(true)
							for y, z in g do
								z:Stop()
								z:Destroy()
							end
							table.clear(g)
							local y = 0
							for z, A in
								game:GetService("ReplicatedStorage").WeaponINFO[game.Players.LocalPlayer.Data.Weapon.Value]
									:GetChildren()
							do
								if A:IsA("Animation") then
									if A.Name:find("AttackAnimation") and A.Name ~= "ChargedAttackAnimation" then
										y = y + 1
									end
								end
							end
							for z = 1, y - 1 do
								local A = d.Character.Humanoid.Animator:LoadAnimation(
									game:GetService("ReplicatedStorage").WeaponINFO[game.Players.LocalPlayer.Data.Weapon.Value]["AttackAnimation" .. tostring(
										z
									)]
								)
								A:Play(0, 0.01, 100000)
								A.Looped = true
								table.insert(g, A)
							end
							task.delay(2.5, function()
								if f then
									for z, A in g do
										A:Stop()
										A:Destroy()
									end
									table.clear(g)
									game:GetService("ReplicatedStorage").Events.Equip:FireServer(false)
								end
								q = false
							end)
						end
						local y = Vector3.new(0, -Options.AutoLCorpYOffset.Value, 0)

						if x[1]:FindFirstChild("GettingGripped") and not r then
							if x[1].Name == k[Options.lCorpBossSelection.Value] then
								if x[1].Name == k["Lei Heng"] then
									o = true
								end
								m = true
								r = true
								t = false

								task.delay(5, function()
									s = true
								end)
							end
							return
						end

						if x[1]:FindFirstChild("Knocked") and not j then
							j = true
							d.Character.HumanoidRootPart:PivotTo(x[1].HumanoidRootPart.CFrame + Vector3.new(0, 4, 0))
							game:GetService("ReplicatedStorage")
								:WaitForChild("Events")
								:WaitForChild("Grip")
								:FireServer(d.Character)
							task.delay(1, function()
								j = false
							end)
						end
						if x[1].Target.Value ~= d.Character then
							d.Character.HumanoidRootPart:PivotTo(
								x[1].HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0) + Vector3.new(0, 5, 0)
							)
							return
						end
						d.Character.HumanoidRootPart:PivotTo(
							x[1].HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0) + y
						)
						workspace.CurrentCamera.CameraSubject = x[1].Humanoid
						d.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
						d.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
						d.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
					else
						l = false
						if not u and not l then
							u = true
							n[Options.lCorpBossSelection.Value]()
							u = false
							t = true
						end
					end
				end))
				return true
			end

			function e.off()
				l = false
				h = false
				if f then
					f:Disconnect()
					f = nil
				end
				for p, q in g do
					q:Stop()
					q:Destroy()
				end
				table.clear(g)
				workspace.CurrentCamera.CameraSubject = d.Character.Humanoid
				d.Character.HumanoidRootPart.Anchored = false
			end

			function e.extract()
				if game.PlaceId ~= 99831550635699 then
					return false, "Not in the L Corp"
				end
				if not workspace:GetAttribute("ServerType") == "LCorpBranch" then
					return false, "Not in the L Corp"
				end

				if not m then
					Library:Notify({
						Title = "Error Occurred.",
						Description = "You have to kill a boss first.",
						Time = 8,
					})
					return
				end

				repeat
					Toggles.AutoLCorp:SetValue(false)
					task.wait(1)
					d.Character:PivotTo(CFrame.new(103.09710693359375, 981.3513793945312, -84.36695098876953))
				until workspace.NPCS:FindFirstChild("Elevator Door")
				c.PreRender:Connect(function()
					Toggles.AutoLCorp:SetValue(false)
					workspace.NPCS["Elevator Door"].TalkToNPC:FireServer()
					d.Character:PivotTo(CFrame.new(103.09710693359375, 981.3513793945312, -84.36695098876953))
					clickButton("Extract")
				end)
			end

			function e.lootAll()
				if game.PlaceId ~= 99831550635699 then
					return false, "Not in the L Corp"
				end
				if not workspace:GetAttribute("ServerType") == "LCorpBranch" then
					return false, "Not in the L Corp"
				end

				local function clickButton(p)
					for q, r in
						game:GetService("Players").LocalPlayer.PlayerGui.Dialogue.MainFrame.Options.Scroll:GetChildren()
					do
						if r:IsA("Frame") then
							if r.OptionText.Text == p or r.OptionText.Text:find(p) then
								replicatesignal(r.OptionButton.MouseButton1Click)
								return true
							end
						end
					end
					return false
				end

				local p = {
					"EnkephalinBarrels",
					"Extracted Weapon Crate",
					"Locker",
					"Military Crate",
					"Supply Depot",
					"Rack",
				}
				local q = {}
				for r, s in workspace.NPCS:GetChildren() do
					if table.find(p, s.Name) and not table.find(q, s) then
						table.insert(q, s)
						d.Character:PivotTo(s:GetPivot())
						repeat
							Toggles.AutoLCorp:SetValue(false)
							task.wait()
							s.TalkToNPC:FireServer()
							d.Character:PivotTo(s:GetPivot())
						until game:GetService("Players").LocalPlayer.Data.IsTalking.Value
						repeat
							task.wait()
							Toggles.AutoLCorp:SetValue(false)
							clickButton("Search")
							s.TalkToNPC:FireServer()
							d.Character:PivotTo(s:GetPivot())
						until d.PlayerGui.Dialogue.MainFrame.DialogueHolder.DialogueText.Text:find("nothing")
							or d.PlayerGui.Dialogue.MainFrame.DialogueHolder.DialogueText.Text:find("empty")
						repeat
							task.wait()
							Toggles.AutoLCorp:SetValue(false)
							clickButton("Leave")
						until not d.Data.IsTalking.Value
					end
				end
			end

			return e
		end
		function a.C(): typeof(__modImpl())
			local b = a.cache.C
			if not b then
				b = { c = __modImpl() }
				a.cache.C = b
			end
			return b.c
		end
	end
	do
		local function __modImpl()
			local b = game:GetService("Players")
			local c = game:GetService("RunService")

			local d = b.LocalPlayer
			local e = {}

			local f
			local g = {}
			local h = false

			local function clickButton(i)
				for j, k in
					game:GetService("Players").LocalPlayer.PlayerGui.Dialogue.MainFrame.Options.Scroll:GetChildren()
				do
					if k:IsA("Frame") then
						if k.OptionText.Text == i or k.OptionText.Text:find(i) then
							replicatesignal(k.OptionButton.MouseButton1Click)
							return true
						end
					end
				end
				return false
			end

			local i = false

			function e.on(j, k, l)
				e.off()
				h = true
				local m = false
				if game.PlaceId ~= 99831550635699 then
					return false, "Not in the Ricardo"
				end
				if workspace:GetAttribute("ServerType") ~= "Ricardo" then
					return false, "Not in the Ricardo"
				end

				local n = workspace:FindFirstChild("KillBricks")
				if n then
					n:Destroy()
				end

				if not d.Character:FindFirstChild("AirTime") then
					local o = Instance.new("Folder")
					o.Name = "AirTime"
					o.Parent = d.Character
				end
				local o = workspace.NPCS:FindFirstChild("RicardoChallengePart")
				if o and not workspace.Alive:FindFirstChild("Big Brother Of The Middle") then
					local p = o:FindFirstChild("MainPart")
					if p then
						local q = false
						repeat
							task.wait()
							d.Character:PivotTo(p:GetPivot())
							fireproximityprompt(o.InteractPrompt)
							if clickButton("Bring") then
								q = true
							end
						until q
					end
				end

				game:GetService("ReplicatedStorage").Events.Equip:FireServer(true)
				local p = false
				f = c.PostSimulation:Connect(LPH_NO_VIRTUALIZE(function(q)
					if not h then
						return
					end
					if math.floor(workspace.DistributedGameTime) < 0 then
						game:GetService("ReplicatedStorage").Events.Equip:FireServer(false)
						for r, s in g do
							s:AdjustSpeed(0)
						end
						workspace.CurrentCamera.CameraSubject = d.Character.Humanoid
						d.Character:PivotTo(CFrame.new(-12874, -11, 1070))
						return true
					end
					m = false
					d.Data.Stamina.Value = 100
					local r = {}

					for s, t in workspace.Alive:GetChildren() do
						if
							not b:GetPlayerFromCharacter(t)
							and t.Humanoid.Health > 0
							and not t:FindFirstChild("GotGripped")
						then
							table.insert(r, t)
						end
					end

					table.sort(r, function(s, t)
						return s.Humanoid.MaxHealth > t.Humanoid.MaxHealth
					end)

					if #r ~= 0 then
						d.Character.HumanoidRootPart.Anchored = false
						local s = true
						for t, u in r do
							if u.Target.Value ~= d.Character then
								d.Character.HumanoidRootPart:PivotTo(
									r[1].HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0)
										+ Vector3.new(0, 10, 0)
								)
								s = false
							end
						end
						if not s then
							return
						end
						if not p then
							p = true
							game:GetService("ReplicatedStorage").Events.Equip:FireServer(true)
							for t, u in g do
								u:Stop()
								u:Destroy()
							end
							table.clear(g)
							local t = 0
							for u, v in
								game:GetService("ReplicatedStorage").WeaponINFO[game.Players.LocalPlayer.Data.Weapon.Value]
									:GetChildren()
							do
								if v:IsA("Animation") then
									if v.Name:find("AttackAnimation") and v.Name ~= "ChargedAttackAnimation" then
										t = t + 1
									end
								end
							end
							for u = 1, t - 1 do
								local v = d.Character.Humanoid.Animator:LoadAnimation(
									game:GetService("ReplicatedStorage").WeaponINFO[game.Players.LocalPlayer.Data.Weapon.Value]["AttackAnimation" .. tostring(
										u
									)]
								)
								v:Play(0, 0.01, 100000)
								v.Looped = true
								table.insert(g, v)
							end
							task.delay(2.5, function()
								if f then
									for u, v in g do
										v:Stop()
										v:Destroy()
									end
									table.clear(g)
									game:GetService("ReplicatedStorage").Events.Equip:FireServer(false)
								end
								p = false
							end)
						end
						local t = Vector3.new(0, -Options.AutoRicardoYOffset.Value, 0)

						if r[1]:FindFirstChild("Knocked") and not i then
							i = true
							d.Character.HumanoidRootPart:PivotTo(r[1].HumanoidRootPart.CFrame)
							game:GetService("ReplicatedStorage")
								:WaitForChild("Events")
								:WaitForChild("Grip")
								:FireServer(d.Character)
							task.delay(1, function()
								i = false
							end)
						end

						if r[1]:FindFirstChild("GettingGripped") then
							d.Character.HumanoidRootPart.Anchored = true
							return
						end
						if r[1].Target.Value ~= d.Character then
							d.Character.HumanoidRootPart:PivotTo(
								r[1].HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0) + Vector3.new(0, 5, 0)
							)
							return
						end
						d.Character.HumanoidRootPart:PivotTo(
							r[1].HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0) + t
						)
						workspace.CurrentCamera.CameraSubject = r[1].Humanoid
						d.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
						d.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
						d.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
					else
						if not m then
							m = true
							p = false
							d.Character:PivotTo(CFrame.new(-12874, -11, 1070))
							game:GetService("ReplicatedStorage").Events.Equip:FireServer(false)
							for s, t in g do
								t:AdjustSpeed(0)
							end
							workspace.CurrentCamera.CameraSubject = d.Character.Humanoid
							d.Character:PivotTo(CFrame.new(-12874, -11, 1070))
						end
					end
				end))
				return true
			end

			function e.off(j)
				h = false
				if f then
					f:Disconnect()
					f = nil
				end
				for k, l in g do
					l:Stop()
					l:Destroy()
				end
				table.clear(g)
				workspace.CurrentCamera.CameraSubject = d.Character.Humanoid
				d.Character.HumanoidRootPart.Anchored = false
			end

			return e
		end
		function a.D(): typeof(__modImpl())
			local b = a.cache.D
			if not b then
				b = { c = __modImpl() }
				a.cache.D = b
			end
			return b.c
		end
	end
	do
		local function __modImpl()
			local b = game:GetService("Players")
			local c = game:GetService("RunService")

			local d = b.LocalPlayer

			local e = {}

			local f
			local g = false

			local h = {
				Caches = "Cache",
				["Seed Of Light"] = "Seed Of Light",
				["Fixer's Note"] = "Fixer's Note",
				["Exp Ticket"] = "Training",
			}

			local i = {}

			local function isASingu(j)
				local k = {}
				for l, m in game:GetService("ReplicatedStorage").CraftRecipes.Singularities:GetChildren() do
					table.insert(k, m.Name)
				end
				for l, m in k do
					if j:lower():find(m:lower()) then
						return true
					end
				end
				return false
			end

			function e.on()
				e.off()
				f = c.Heartbeat:Connect(function(j)
					d.PlayerGui.PageSelection.Enabled = false
					local k = d.Character:FindFirstChild("UsedBook")
					if k then
						k:Destroy()
					end
					if g then
						return
					end
					local l = d.Character:FindFirstAncestorWhichIsA("Tool")
					if l then
						l.Parent = d.Backpack
					end
					g = true
					for m, n in d.Backpack:GetChildren() do
						for o, p in Options.autoOpenContainerSelection.Values do
							if n.Name:find(h[p]) and not isASingu(n.Name) and not table.find(i, n) then
								if not f then
									break
								end
								local q = false
								local r = false
								repeat
									if not f then
										break
									end
									if r then
										break
									end
									task.wait()
									firesignal(n.Activated)
									if not q then
										q = true
										task.delay(5, function()
											if n.Parent then
												r = true
												table.insert(i, n)
											end
										end)
									end
								until not n.Parent
							end
						end
					end
					g = false
				end)
			end

			function e.off()
				if f then
					f:Disconnect()
				end
				d.PlayerGui.PageSelection.Enabled = true
			end

			return e
		end
		function a.E(): typeof(__modImpl())
			local b = a.cache.E
			if not b then
				b = { c = __modImpl() }
				a.cache.E = b
			end
			return b.c
		end
	end
	do
		local function __modImpl()
			local b = game:GetService("Players")
			game:GetService("RunService")
			game:GetService("VirtualInputManager")
			local c = b.LocalPlayer

			local d = {}
			local e = LPH_NO_VIRTUALIZE(function(e, f)
				f = f or ","
				local g = {}
				for h in e:gmatch("[^" .. f .. "]+") do
					table.insert(g, h:lower())
				end
				return g
			end)

			local function clickButton(f)
				for g, h in
					game:GetService("Players").LocalPlayer.PlayerGui.Dialogue.MainFrame.Options.Scroll:GetChildren()
				do
					if h:IsA("Frame") then
						if h.OptionText.Text == f or h.OptionText.Text:find(f) then
							replicatesignal(h.OptionButton.MouseButton1Click)
							return true
						end
					end
				end
				return false
			end

			local f
			local g = false
			getgenv().isSellAble = true

			local h = {
				[99831550635699] = "Railway Merchant",
				[14038329225] = "Restaurant Owner",
			}

			local function fetchAutoSellCategory()
				local i = {}
				for j, k in Options.autoSellCategorySelection.Value do
					table.insert(i, j)
				end
				return i
			end

			local function isASingu(i)
				local j = {}
				for k, l in game:GetService("ReplicatedStorage").CraftRecipes.Singularities:GetChildren() do
					table.insert(j, l.Name)
				end
				for k, l in j do
					if i:lower():find(l:lower()) then
						return true
					end
				end
				return false
			end

			local i = {}

			getgenv().getSellLists = function(j, k)
				local l = {}
				local m = {
					Exclude = function()
						for m, n in c.Backpack:GetChildren() do
							if
								not table.find(j, n.Name:lower())
								and n:FindFirstChild("SellPrice")
								and not table.find(fetchAutoSellCategory(), n:GetAttribute("ItemCategory"))
								and not isASingu(n.Name)
								and n.Name ~= "Singularity"
								and not table.find(i, n.Name)
							then
								if n:FindFirstChild("SellPrice").Value ~= 0 then
									if not table.find(l, n.Name) then
										table.insert(l, n.Name)
									end
								end
							end
						end
					end,
					Include = function()
						for m, n in c.Backpack:GetChildren() do
							if
								table.find(j, n.Name:lower())
								and n:FindFirstChild("SellPrice")
								and table.find(fetchAutoSellCategory(), n:GetAttribute("ItemCategory"))
								and not isASingu(n.Name)
								and n.Name ~= "Singularity"
								and not table.find(i, n)
							then
								if n:FindFirstChild("SellPrice").Value ~= 0 then
									if not table.find(l, n.Name) then
										table.insert(l, n.Name)
									end
								end
							end
						end
					end,
				}
				if c.Character:FindFirstChildWhichIsA("Tool") then
					c.Character:FindFirstChildWhichIsA("Tool").Parent = c.Character
				end
				m[k]()
				if #l == 0 then
					getgenv().isSellAble = false
				else
					getgenv().isSellAble = true
				end
				return l
			end

			function d.on(j, k)
				g = true
				local l = e(k)

				local m = false
				local n = false
				local o = {
					Include = function()
						for o, p in getSellLists(l, j) do
							if not workspace.NPCS:FindFirstChild(h[game.PlaceId]) then
								n = false
								return
							end

							local q = c:DistanceFromCharacter(workspace.NPCS[h[game.PlaceId]]:GetPivot().Position)

							if q > 8 then
								n = false
								return
							end
							if not c.PlayerGui.Dialogue.Enabled then
								n = false
								return
							end
							if not g then
								n = false
								return
							end

							if c.Character:FindFirstChildWhichIsA("Tool") then
								c.Character:FindFirstChildWhichIsA("Tool").Parent = c.Backpack
							end

							local r = c.Backpack:FindFirstChild(p)
							if not r then
								continue
							end

							r.Parent = c.Character
							countdown = false
							repeat
								clickButton("Can")
								clickButton("All")
								clickButton("How")
								if not g then
									n = false
									return
								end
								if not c.PlayerGui.Dialogue.Enabled then
									n = false
									return
								end
								task.wait()
								if not countdown then
									countdown = true
									task.delay(10, function()
										if r.Parent then
											n = false
											table.insert(i, r)
										end
									end)
								end
							until not r.Parent
						end
						n = false
					end,
					Exclude = function()
						for o, p in getSellLists(l, j) do
							if not workspace.NPCS:FindFirstChild(h[game.PlaceId]) then
								n = false
								return
							end

							local q = c:DistanceFromCharacter(workspace.NPCS[h[game.PlaceId]]:GetPivot().Position)

							if q > 8 then
								n = false
								return
							end
							if not c.PlayerGui.Dialogue.Enabled then
								n = false
								return
							end
							if not g then
								n = false
								return
							end

							if c.Character:FindFirstChildWhichIsA("Tool") then
								c.Character:FindFirstChildWhichIsA("Tool").Parent = c.Backpack
							end

							local r = c.Backpack:FindFirstChild(p)
							if not r then
								continue
							end

							r.Parent = c.Character
							local s = false
							repeat
								clickButton("Can")
								clickButton("All")
								clickButton("How")
								if not g then
									n = false
									return
								end
								if not c.PlayerGui.Dialogue.Enabled then
									n = false
									return
								end
								task.wait()
								if not s then
									s = true
									task.delay(10, function()
										if r.Parent then
											n = false
											table.insert(i, r)
										end
									end)
								end
							until not r.Parent
						end
						n = false
					end,
				}

				f = game.RunService.Heartbeat:Connect(LPH_NO_VIRTUALIZE(function(p)
					if n then
						return
					end
					if not workspace.NPCS:FindFirstChild(h[game.PlaceId]) then
						return
					end

					local q = c:DistanceFromCharacter(workspace.NPCS[h[game.PlaceId]]:GetPivot().Position)
					if q > 8 then
						return
					end

					if not c.PlayerGui:FindFirstChild("InteractPromptGUI") then
						return
					end

					if not c.Data.IsTalking.Value then
						if m then
							return
						end
						m = true
						fireproximityprompt(
							workspace.NPCS:FindFirstChild(h[game.PlaceId]):FindFirstChildWhichIsA("ProximityPrompt")
						)
						task.delay(2, function()
							m = false
						end)
					else
						if n then
							return
						end
						n = true
						task.spawn(function()
							o[j]()
							n = false
						end)
					end
				end))
			end

			function d.off()
				g = false
				if f then
					f:Disconnect()
					f = nil
				end
			end

			return d
		end
		function a.F(): typeof(__modImpl())
			local b = a.cache.F
			if not b then
				b = { c = __modImpl() }
				a.cache.F = b
			end
			return b.c
		end
	end
	do
		local function __modImpl()
			local b = game:GetService("Players")
			game:GetService("RunService")
			game:GetService("VirtualInputManager")
			local c = b.LocalPlayer

			local d = {}
			local e = LPH_NO_VIRTUALIZE(function(e, f)
				f = f or ","
				local g = {}
				for h in e:gmatch("[^" .. f .. "]+") do
					table.insert(g, h:lower())
				end
				return g
			end)

			local function clickButton(f)
				for g, h in
					game:GetService("Players").LocalPlayer.PlayerGui.Dialogue.MainFrame.Options.Scroll:GetChildren()
				do
					if h:IsA("Frame") then
						if h.OptionText.Text == f or h.OptionText.Text:find(f) then
							replicatesignal(h.OptionButton.MouseButton1Click)
							return true
						end
					end
				end
				return false
			end

			local function getBooks()
				local f = {}
				local g = { "Book", "Book of Unknown Backstreets Dwellers" }
				local h = e(Options.autoTradeBooksExcludeLists.Value)
				for i, j in c.Backpack:GetChildren() do
					if
						not table.find(g, j.Name)
						and not table.find(h, j.Name:lower())
						and j:GetAttribute("ItemCategory") == "Books"
					then
						table.insert(f, j)
					end
				end
				local i = c.Character:FindFirstChildWhichIsA("Tool")
				if not i then
					return f
				end
				if
					not table.find(g, i.Name)
					and not table.find(h, i.Name:lower())
					and i:GetAttribute("ItemCategory") == "Books"
				then
					table.insert(f, i)
				end
				return f
			end

			local f
			local g = false

			function d.on()
				g = true

				local h = false
				local i = false

				f = game.RunService.Stepped:Connect(LPH_NO_VIRTUALIZE(function(j)
					if i then
						return
					end
					if not workspace.NPCS:FindFirstChild("Sara") then
						return
					end

					local k = c:DistanceFromCharacter(workspace.NPCS.Sara:GetPivot().Position)
					if k > 8 then
						return
					end

					if not c.PlayerGui:FindFirstChild("InteractPromptGUI") then
						return
					end
					if #getBooks() == 0 then
						return
					end

					if not c.Data.IsTalking.Value then
						if h then
							return
						end
						h = true
						fireproximityprompt(
							workspace.NPCS:FindFirstChild("Sara"):FindFirstChildWhichIsA("ProximityPrompt")
						)
						h = false
					else
						if i then
							return
						end
						if #getBooks() == 0 then
							return
						end
						local l = c.Character:FindFirstChildWhichIsA("Tool")
						if not l then
							getBooks()[1].Parent = c.Character
						elseif l:GetAttribute("ItemCategory") ~= "Books" then
							l.Parent = c.Backpack
							getBooks()[1].Parent = c.Character
						end
						i = true
						task.spawn(function()
							local m = false
							repeat
								task.wait()
								if not g then
									break
								end
								if not c.Data.IsTalking.Value then
									break
								end
								if #getBooks() == 0 then
									break
								end
								if clickButton("Sure") then
									m = true
								else
									clickButton("Bye")
								end
							until m
							i = false
						end)
					end
				end))
			end

			function d.off()
				g = false
				if f then
					f:Disconnect()
					f = nil
				end
			end

			return d
		end
		function a.G(): typeof(__modImpl())
			local b = a.cache.G
			if not b then
				b = { c = __modImpl() }
				a.cache.G = b
			end
			return b.c
		end
	end
	do
		local function __modImpl()
			local b = a.y()
			local c = a.z()
			local d = a.A()
			local e = a.B()
			local f = a.C()
			local g = a.D()
			local h = a.E()
			local i = a.F()
			local j = a.G()

			local k = {}

			getgenv().autoRailwayLootPriority = {}

			if isfile("TelepathyOverload/Archived/loot_priority.txt") then
				for l in readfile("TelepathyOverload/Archived/loot_priority.txt"):gmatch("[^,]+") do
					table.insert(autoRailwayLootPriority, l)
				end
			end

			k.init = LPH_NO_VIRTUALIZE(function()
				local l = Window:AddTab("Automation", "zap")

				local m = l:AddLeftGroupbox("Automation")

				m:AddToggle("AutoLibrary", {
					Text = "Auto Library",
					Default = false,
					Tooltip = "Only usable when inside the ordeal itself",
				})
				Toggles.AutoLibrary:OnChanged(function()
					if Toggles.AutoLibrary and Options.libraryFloorSelection and Toggles.buffLibrary then
						if Toggles.AutoLibrary.Value then
							local n, o = b.on()
							if not n then
								Library:Notify({
									Title = "Error Occurred.",
									Description = o,
									Time = 8,
								})
							end
						else
							b.off(Options.libraryFloorSelection.Value)
						end
					end
				end)

				m:AddDropdown("libraryFloorSelection", {
					Text = "Library Floor",
					Values = { "Kether", "Language", "Philosophy" },
					Multi = false,
					Default = 1,
				})

				m:AddToggle("buffLibrary", {
					Text = "Buff Library",
					Default = false,
				})

				m:AddSlider("autoLibYOffset", {
					Text = "Library Y Offset",
					Default = 5,
					Min = 0,
					Max = 30,
					Rounding = 0,
					Tooltip = "Depends on your weapons",
				})

				m:AddDivider()

				m:AddToggle("AutoWarp", {
					Text = "Auto Warp Train",
					Default = false,
					Tooltip = "Only usable when inside the Warp Train itself",
				})
				Toggles.AutoWarp:SetValue(false)
				Toggles.AutoWarp:OnChanged(function()
					if Toggles.AutoWarp.Value then
						local n, o = c.on(Options.autoWarpYOffset.Value)
						if not n then
							Library:Notify({ Title = "Error Occurred.", Description = o, Time = 8 })
						end
					else
						c.off()
					end
				end)

				m:AddSlider("autoWarpYOffset", {
					Text = "Warp Y Offset",
					Default = 10,
					Min = 0,
					Max = 30,
					Rounding = 0,
					Tooltip = "Depends on your weapons",
				})

				m:AddDivider()

				m:AddToggle("autoGradeEva", {
					Text = "Auto Grade Evaluation",
					Default = false,
				})
				Toggles.autoGradeEva:SetValue(false)
				Toggles.autoGradeEva:OnChanged(function()
					if Toggles.autoGradeEva.Value then
						local n, o = e.on(Options.autoGradeEvaYOffset.Value)
						if not n then
							Library:Notify({ Title = "Error Occurred.", Description = o, Time = 8 })
						end
					else
						e.off()
					end
				end)

				m:AddSlider("autoGradeEvaYOffset", {
					Text = "Grade Eval Y Offset",
					Default = 30,
					Min = 0,
					Max = 30,
					Rounding = 0,
					Tooltip = "Depends on your weapons",
					Callback = function(n) end,
				})

				m:AddDivider()

				m:AddToggle("AutoRailway", {
					Text = "Auto Railway",
					Default = false,
					Tooltip = "Only usable when inside the Railway itself",
				})
				Toggles.AutoRailway:OnChanged(function()
					if Toggles.AutoRailway.Value then
						local n, o = d.on(Options.autoRailwayYOffset.Value)
						if not n then
							Library:Notify({ Title = "Error Occurred.", Description = o, Time = 8 })
						end
					else
						d.off()
					end
				end)

				m:AddSlider("autoRailwayYOffset", {
					Text = "Railway Y Offset",
					Default = 5,
					Min = 0,
					Max = 30,
					Rounding = 0,
					Tooltip = "Depends on your weapons",
					Callback = function(n) end,
				})

				m:AddDropdown("autoRailwayLootSelection", {
					Text = "Item Priority",
					Values = {
						"Singularity",
						"SkipFloors",
						"RareItems",
						"Item",
						"HugeAhn",
						"Ahn",
						"RareAccessories",
						"Accessories",
						"HugeExperience",
						"Experience",
						"Heal",
					},
					Multi = true,
					Default = 1,
					Tooltip = "Select loot priority order",
					Callback = function(n) end,
				})

				Options.autoRailwayLootSelection:OnChanged(function()
					autoRailwayLootPriority = {}
					local n = {}

					if isfile("TelepathyArchived/loot_priority.txt") then
						for o in readfile("TelepathyArchived/loot_priority.txt"):gmatch("[^,]+") do
							table.insert(n, o)
						end
					end

					for o = #n, 1, -1 do
						if not Options.autoRailwayLootSelection.Value[n[o]] then
							table.remove(n, o)
						end
					end

					for o, p in pairs(Options.autoRailwayLootSelection.Value) do
						if p then
							local q = false
							for r, s in ipairs(n) do
								if s == o then
									q = true
									break
								end
							end
							if not q then
								table.insert(n, o)
							end
						end
					end

					autoRailwayLootPriority = n
					writefile("TelepathyArchived/loot_priority.txt", table.concat(autoRailwayLootPriority, ","))

					local o = table.concat(autoRailwayLootPriority, ", ")
					Library:Notify({
						Title = "Current Item Priority",
						Description = o ~= "" and o or "None selected",
						Time = 8,
					})
				end)

				m:AddDivider()

				m:AddToggle("AutoLCorp", {
					Text = "Auto L Corp Bosses",
					Default = false,
				})

				Toggles.AutoLCorp:OnChanged(function()
					if Toggles.AutoLCorp.Value then
						f.on()
					else
						f.off()
					end
				end)

				m:AddSlider("AutoLCorpYOffset", {
					Text = "L Corp Y Offset",
					Default = 5,
					Min = 0,
					Max = 30,
					Rounding = 0,
					Tooltip = "Depends on your weapons",
				})

				m:AddDropdown("lCorpBossSelection", {
					Text = "Boss Selection",
					Values = {
						"Lei Heng",
						"Gloom",
						"Pride",
						"Wrath",
						"Desire",
						"Sloth",
						"Envy",
						"Gluttony",
					},
					Multi = false,
					Default = 1,
				})

				m:AddButton({
					Text = "Extract",
					Func = function()
						f.extract()
					end,
					Tooltip = "This will extract you possible",
					DoubleClick = false,
				})

				m:AddButton({
					Text = "Loot All Items",
					Func = function()
						f.lootAll()
					end,
					Tooltip = "This will loot everything in the l corp",
					DoubleClick = false,
				})

				m:AddDivider()

				m:AddToggle("AutoRicardo", {
					Text = "Auto Ricardo",
					Default = false,
				})
				Toggles.AutoRicardo:OnChanged(function()
					if Toggles.AutoRicardo.Value then
						g.on()
					else
						g.off()
					end
				end)

				m:AddSlider("AutoRicardoYOffset", {
					Text = "Ricardo Y Offset",
					Default = 5,
					Min = 0,
					Max = 30,
					Rounding = 0,
					Tooltip = "Depends on your weapons",
				})

				local n = l:AddRightGroupbox("More Automation")

				n:AddToggle("autoOpenContainer", {
					Text = "Auto Open Container",
					Default = false,
					Tooltip = "Automatically opens selected container types",
				})
				Toggles.autoOpenContainer:OnChanged(function()
					if Toggles.autoOpenContainer.Value then
						h.on()
					else
						h.off()
					end
				end)

				n:AddDropdown("autoOpenContainerSelection", {
					Text = "Container Types",
					Values = { "Caches", "Seed Of Light", "Fixer's Note", "Exp Ticket" },
					Multi = true,
					Default = {},
				})

				n:AddDivider()

				n:AddToggle("autoSellExclude", {
					Text = "Auto Sell (Exclude Mode)",
					Default = false,
					Tooltip = "Sell everything except listed items",
				})
				Toggles.autoSellExclude:OnChanged(function()
					if Toggles.autoSellExclude.Value and Options.sellInput then
						Toggles.autoSellInclude:SetValue(false)
						i.on("Exclude", Options.sellInput.Value)
					else
						i.off()
					end
				end)

				n:AddToggle("autoSellInclude", {
					Text = "Auto Sell (Include Mode)",
					Default = false,
					Tooltip = "Only sell listed items",
				})
				Toggles.autoSellInclude:OnChanged(function()
					if Toggles.autoSellInclude.Value and Options.sellInput then
						Toggles.autoSellExclude:SetValue(false)
						i.on("Include", Options.sellInput.Value)
					else
						i.off()
					end
				end)

				n:AddDropdown("autoSellCategorySelection", {
					Text = "Sell Categories",
					Values = {
						"Container",
						"Augments",
						"Books",
						"Consumable",
						"General",
						"Gifts",
						"Materials",
						"Rare Materials",
						"Tickets",
						"Unique",
						"Vestige",
					},
					Multi = true,
					Default = 1,
				})
				Options.autoSellCategorySelection:OnChanged(function()
					if Toggles.autoSellExclude.Value then
						i.on("Exclude", Options.sellInput.Value)
					end
					if Toggles.autoSellInclude.Value then
						i.on("Include", Options.sellInput.Value)
					end
				end)

				n:AddInput("sellInput", {
					Text = "Sell List",
					Default = "",
					Placeholder = "Book,Gear,...",
					Numeric = false,
					Finished = true,
					Tooltip = "Comma-separated item names",
					Callback = function(o)
						if Toggles.autoSellExclude.Value then
							Toggles.autoSellInclude:SetValue(false)
							i.on("Exclude", o)
						end
						if Toggles.autoSellInclude.Value then
							Toggles.autoSellExclude:SetValue(false)
							i.on("Include", o)
						end
					end,
				})

				n:AddDivider()

				n:AddToggle("autoTradeBooks", {
					Text = "Auto Trade Books",
					Default = false,
					Tooltip = "Trade Books",
				})

				Toggles.autoTradeBooks:OnChanged(function()
					if Toggles.autoTradeBooks.Value then
						j.on()
					else
						j.off()
					end
				end)

				n:AddInput("autoTradeBooksExcludeLists", {
					Text = "Exclude List",
					Default = "",
					Placeholder = "Book Of Capo,...",
					Numeric = false,
					Finished = true,
					Tooltip = "Comma-separated item names",
					Callback = function(o) end,
				})
			end)

			return k
		end
		function a.H(): typeof(__modImpl())
			local b = a.cache.H
			if not b then
				b = { c = __modImpl() }
				a.cache.H = b
			end
			return b.c
		end
	end
	do
		local function __modImpl()
			game:GetService("GuiService")
			local b = game:GetService("HttpService")
			local c = game:GetService("Players")
			local d = c.LocalPlayer

			local e = {}

			local f = LPH_NO_VIRTUALIZE(function(f, g)
				g = g or ","
				local h = {}
				for i in f:gmatch("[^" .. g .. "]+") do
					table.insert(h, i:lower())
				end
				return h
			end)

			local function sendWebhook()
				local g = {}
				for h, i in d.Backpack:GetChildren() do
					if i:IsA("Tool") then
						if not g[i.Name] then
							g[i.Name] = 1
						else
							g[i.Name] = g[i.Name] + 1
						end
					end
				end

				local h = {}
				for i, j in g do
					local k = d.Backpack:FindFirstChild(i)
					if k then
						local l = k:GetAttribute("ItemCategory")
						if not h[l] then
							h[l] = {}
						end
						table.insert(h[l], { Name = i, Amount = j })
					end
				end

				local i = {
					{
						name = "Player Info",
						value = string.format(
							"**Username** : ||%s||\n**Slot Order** : %s\n**Ahn** : %s\n**Lunacy** : %s",
							d.Name,
							d:GetAttribute("Slot"),
							d.PlayerGui.CurrencyGUI.List.Ahn.Amount.Text,
							d.PlayerGui.CurrencyGUI.List.Lunacy.Amount.Text
						),
					},
				}

				local j = {}
				for k, l in h do
					if not table.find(j, k) then
						table.insert(j, k)
						local m = ""
						for n, o in l do
							m = m .. string.format(" %s %sx\n", o.Name, o.Amount)
						end
						table.insert(i, { name = k, value = m })
					end
				end

				local k = {
					content = Options.mentionText.Value,
					embeds = {
						{
							title = "Telepathy Overload | Archived",
							description = "",
							color = 65280,
							fields = i,
							footer = { text = "📦 Archived • " .. os.date("%m/%d/%Y %I:%M %p") },
							timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
						},
					},
				}

				local l = b:JSONEncode(k)
				request({
					Url = Options.webHookUrl.Value,
					Method = "POST",
					Headers = { ["Content-Type"] = "application/json" },
					Body = l,
				})
			end

			local g
			g = d.Backpack.ChildAdded:Connect(function(h)
				if not Options.webHookState then
					return
				end
				if Toggles.webHookState.Value then
					local i = f(Options.itemNotifyList.Value)
					if table.find(i, h.Name:lower()) then
						sendWebhook()
					end
				end
			end)

			e.init = LPH_NO_VIRTUALIZE(function()
				local h = Window:AddTab("Webhook", "webhook")
				local i = h:AddLeftGroupbox("Webhook")

				i:AddToggle("webHookState", {
					Text = "Webhook Notify",
					Default = false,
					Tooltip = "Enable webhook notifications",
				})

				i:AddDivider()

				i:AddInput("webHookUrl", {
					Text = "Webhook URL",
					Default = "",
					Placeholder = "https://discord.com/api/...",
					Numeric = false,
					Finished = true,
					Tooltip = "Your Discord webhook URL",
					Callback = function(j) end,
				})

				i:AddInput("mentionText", {
					Text = "Mention Text",
					Default = "",
					Placeholder = "<@676767676767>",
					Numeric = false,
					Finished = true,
					Tooltip = "Text content sent with the notification",
					Callback = function(j) end,
				})

				i:AddInput("itemNotifyList", {
					Text = "Item Notify List",
					Default = "",
					Placeholder = "Book,Gear,...",
					Numeric = false,
					Finished = true,
					Tooltip = "Comma-separated list of items to watch for",
					Callback = function(j) end,
				})

				i:AddDivider()

				i:AddButton({
					Text = "Test Webhook",
					Func = function()
						if Options.webHookUrl.Value == "" then
							Library:Notify({
								Title = "Webhook",
								Description = "Please enter a webhook URL first.",
								Time = 4,
							})
							return
						end
						sendWebhook()
						Library:Notify({
							Title = "Webhook",
							Description = "Test notification sent!",
							Time = 4,
						})
					end,
					Tooltip = "Send a test webhook with your current inventory",
					DoubleClick = false,
				})
			end)

			return e
		end
		function a.I(): typeof(__modImpl())
			local b = a.cache.I
			if not b then
				b = { c = __modImpl() }
				a.cache.I = b
			end
			return b.c
		end
	end
end

LPH_NO_VIRTUALIZE(function()
	local b = game:GetService("RunService")
	local c = game:GetService("ScriptContext").Error
	task.spawn(function()
		b.RenderStepped:Connect(function()
			for d, e in getconnections(c) do
				local f = e.Function
				if not f then
					continue
				end
				for g, h in getconstants(f) do
					if h ~= "IsStudio" then
						continue
					end
					setconstant(f, g, "IsClient")
				end
			end
		end)
	end)

	if not game:IsLoaded() then
		repeat
		until task.wait()
		game:IsLoaded()
	end

	repeat
		task.wait()
	until game.Players.LocalPlayer
	repeat
		task.wait()
	until game.Players.LocalPlayer.Character

	local d = { 99831550635699, 14038329225 }

	if not table.find(d, game.PlaceId) then
		return
	end

	repeat
		task.wait()
	until game.Players.LocalPlayer:FindFirstChild("Data")
	repeat
		task.wait()
	until game.Players.LocalPlayer:FindFirstChild("Data"):FindFirstChild("DataImported")
	repeat
		task.wait()
	until game.Players.LocalPlayer:FindFirstChild("Data"):FindFirstChild("DataImported").Value
end)()

local b
local c
local d

local e = a.q()
local f = a.x()
local g = a.H()
local h = a.I()

LPH_NO_VIRTUALIZE(function()
	local i = "https://raw.githubusercontent.com/PlisKungZ/Obsidian/main/"
	b = loadstring(game:HttpGet(i .. "Library.lua"))()
	c = loadstring(game:HttpGet(i .. "addons/SaveManager.lua"))()
	d = loadstring(game:HttpGet(i .. "addons/ThemeManager.lua"))()

	local j = b:CreateWindow({
		Title = "Telepathy",
		Footer = "version: 6.7",
		Icon = 93231363609661,
		NotifySide = "Right",
		ShowCustomCursor = true,
	})
	getgenv().GUI = b
	getgenv().Options = b.Options
	getgenv().Window = j
	getgenv().Toggles = b.Toggles

	e.init(GUI, j)
	f.init(GUI, j)
	g.init(GUI, j)
	h.init()

	local k = {
		["UI Settings"] = j:AddTab("UI Settings", "settings"),
	}
	local l = k["UI Settings"]:AddLeftGroupbox("Menu", "wrench")

	l:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", {
		Default = "RightShift",
		NoUI = true,
		Text = "Menu keybind",
		Callback = function(m)
			b.ToggleKeybind = Options.MenuKeybind
		end,
	})

	b.ToggleKeybind = Options.MenuKeybind

	d:SetLibrary(GUI)
	c:SetLibrary(GUI)

	c:IgnoreThemeSettings()

	c:SetIgnoreIndexes({ "MenuKeybind" })

	d:SetFolder("TelepathyArchived")
	c:SetFolder("TelepathyArchived")

	c:BuildConfigSection(k["UI Settings"])

	d:ApplyToTab(k["UI Settings"])

	c:LoadAutoloadConfig()
	game.Players.LocalPlayer.Idled:Connect(function()
		game:GetService("VirtualUser"):CaptureController()
		game:GetService("VirtualUser"):ClickButton2(Vector2.new())
	end)
end)()
