getgenv().hooked = true
print("runned")
local oldCd
repeat
	task.wait()
until getrenv()._G.HandleCD
oldCd = hookfunction(
	getrenv()._G.HandleCD,
	newcclosure(function(...)
		if getgenv().hooked then
			return
		end
		return oldCd(...)
	end)
)
repeat
	task.wait()
until getrenv()._G.PriorityCD
local oldProrityCD
oldProrityCD = hookfunction(
	getrenv()._G.PriorityCD,
	newcclosure(function(...)
		if getgenv().hooked then
			return
		end
		return oldProrityCD(...)
	end)
)

for _, script in getloadedmodules() do
	if script.Name == "CoolDownModule" then
		local oldSkillCD
		oldSkillCD = hookfunction(
			require(script)["CD"],
			newcclosure(function(character, tool, cooldown)
				if getgenv().hooked then
					return oldSkillCD(character, tool, cooldown / 2)
				end
				return oldSkillCD(character, tool, cooldown)
			end)
		)
	end
end
for _, v in getconnections(game:GetService("CollectionService"):GetInstanceAddedSignal("OnCD")) do
	local handler
	handler = hookfunction(
		v.Function,
		newcclosure(function(...)
			if getgenv().hooked then
				return
			end
			return handler(...)
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
			if self == targetRemote and getgenv().hooked then
				print("CD FIRE MODIFIED", ...)
				local args = { ... }
				args[1] = args[1] / 2
				return oldFireServer(self, table.unpack(args)) -- ✅ sends 0 to server instead
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
		if
			caller
			and caller.Parent
			and caller.Parent:IsA("Tool")
			and caller.Parent:GetAttribute("CD")
			and getgenv().hooked
		then
			print("halved", caller:GetFullName())
			return oldTaskDelay(t / 2, f, ...)
		end
		return oldTaskDelay(t, f, ...)
	end)
)
