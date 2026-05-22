local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local localPlayer = Players.LocalPlayer
local KillAura = {}
local track = {}
local connection
function KillAura.on()
	KillAura.off()
	local player = game.Players.LocalPlayer.Character.Humanoid.Animator
	game:GetService("ReplicatedStorage").Events.Equip:FireServer(true)
	local m1Count = 0
	for _, animation in
		game:GetService("ReplicatedStorage").WeaponINFO[game.Players.LocalPlayer.Data.Weapon.Value]:GetChildren()
	do
		if animation.Name:find("AttackAnimation") and animation.Name ~= "ChargedAttackAnimation" then
			m1Count = m1Count + 1
		end
	end
	for i = 1, m1Count - 1 do
		local animtrack = player:LoadAnimation(
			game:GetService("ReplicatedStorage").WeaponINFO[game.Players.LocalPlayer.Data.Weapon.Value]["AttackAnimation" .. tostring(
				i
			)]
		)
		game:GetService("ReplicatedStorage").Events.BegunM1:FireServer(game.Players.LocalPlayer.Data.Weapon.Value)
		animtrack:Play(0, 0.01, 100000)
		animtrack.Looped = true
		table.insert(track, animtrack)
	end
	connection = RunService.RenderStepped:Connect(function(deltaTime)
		localPlayer.Data.Stamina.Value = 100
	end)
end

function KillAura.off()
	if connection then
		connection:Disconnect()
	end
	game:GetService("ReplicatedStorage").Events.Equip:FireServer(false)
	for _, anim in track do
		anim:Stop()
		anim:Destroy()
	end
	workspace.CurrentCamera.CameraSubject = localPlayer.Character.Humanoid
end

return KillAura
