local tabled = {}
game.RunService.RenderStepped:Connect(function(deltaTime)
	for _, track in game.Players.LocalPlayer.Character.Humanoid.AnimatorGetPlayingAnimationTracks() do
		if not table.find(tabled, track.Animation.Name) then
			table.insert(tabled, track.Animation.Name)
			print(track.Animation.Name)
		end
	end
end)
for _, connection in getconnections(game.RunService.RenderStepped) do
	connection:Disconnect()
end
