local Players = game:GetService("Players")

local localPlayer = Players.LocalPlayer
local KillAura = {}
local track = {}

function KillAura.on()
	KillAura.off()
	local player = game.Players.LocalPlayer.Character.Humanoid.Animator
	game:GetService("ReplicatedStorage").Events.Equip:FireServer(true)
	for i = 1, 3 do
		local animtrack = player:LoadAnimation(
			game:GetService("ReplicatedStorage").WeaponINFO[game.Players.LocalPlayer.Data.Weapon.Value]["AttackAnimation" .. tostring(
				i
			)]
		)

		game:GetService("ReplicatedStorage").Events.BegunM1:FireServer(game.Players.LocalPlayer.Data.Weapon.Value)
		animtrack:Play(0, 0.01, 1000)
		animtrack.Looped = true
		table.insert(track, animtrack)
	end
end

function KillAura.off()
	game:GetService("ReplicatedStorage").Events.Equip:FireServer(false)
	for _, anim in track do
		anim:Stop()
		anim:Destroy()
	end
	workspace.CurrentCamera.CameraSubject = localPlayer.Character.Humanoid
end

return KillAura
