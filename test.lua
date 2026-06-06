local animationIds = {}
local m1Count = 0
for _, animation in
	game:GetService("ReplicatedStorage").WeaponINFO[game.Players.LocalPlayer.Data.Weapon.Value]:GetChildren()
do
	if animation.Name:find("AttackAnimation") and animation.Name ~= "ChargedAttackAnimation" then
		m1Count = m1Count + 1
	end
end
m1Count = m1Count - 1
for i = 1, m1Count do
	table.insert(
		animationIds,
		game:GetService("ReplicatedStorage").WeaponINFO[game.Players.LocalPlayer.Data.Weapon.Value]["AttackAnimation" .. tostring(
			i
		)]
	)
end

--[[ for i = 1, m1Count do
	local animtrack = game.Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(
		game:GetService("ReplicatedStorage").WeaponINFO[game.Players.LocalPlayer.Data.Weapon.Value]["AttackAnimation" .. tostring(
			i
		)]
	)
	animtrack:Play(0, 0.01, 100000)
	animtrack.Looped = true
end ]]

for _, id in animationIds do
	local track = game.Players.LocalPlayer.Character.Humanoid.Animator:GetTrackByAnimationId(id.AnimationId)
	if track then
		track:Play(0, 0.01, 100000)
		track.Looped = true
	else
		local animationInstance = Instance.new("Animation")
		animationInstance.AnimationId = id
		local animtrack = game.Players.LocalPlayer.Character.Humanoid.Animator:LoadAnimation(animationInstance)
		animtrack:Play(0, 0.01, 100000)
		animtrack.Looped = true
	end
end
