local modeFunctions = {
	["Include"] = function()
		if not isSellAbleItemLeft(translatedItems) then
			return
		end
		for _, item in localPlayer.Backpack:GetChildren() do
			if localPlayer.Character:FindFirstChildWhichIsA("Tool") then
				localPlayer.Character:FindFirstChildWhichIsA("Tool").Parent = localPlayer.Backpack
			end
			if
				table.find(translatedItems, item.Name:lower())
				and item:FindFirstChild("SellPrice")
				and item:FindFirstChild("SellPrice").Value ~= 0
			then
				if
					localPlayer:DistanceFromCharacter(workspace.NPCS[merchant[game.PlaceId]]:GetPivot().Position)
					< 8
				then
					item.Parent = localPlayer.Character
					talkToNpcDb = true
					workspace.NPCS[merchant[game.PlaceId]].TalkToNPC:FireServer()
					task.delay(1, function()
						talkToNpcDb = false
					end)
				end
				if
					localPlayer:DistanceFromCharacter(workspace.NPCS[merchant[game.PlaceId]]:GetPivot().Position)
					< 8
				then
					repeat
						task.wait()
						talkToNpcDb = true
						workspace.NPCS[merchant[game.PlaceId]].TalkToNPC:FireServer()
						task.delay(1, function()
							talkToNpcDb = false
						end)
						item.Parent = localPlayer.Character
						clickButton("look")
						clickButton("All")
						clickButton("How")
						clickButton("Nevermind")
						if not state then
							break
						end
					until not item.Parent
				end
			end
		end
	end,
	["Exclude"] = function()
		if not isSellAbleItemLeft(translatedItems) then
			return
		end
		for _, item in localPlayer.Backpack:GetChildren() do
			if localPlayer.Character:FindFirstChildWhichIsA("Tool") then
				localPlayer.Character:FindFirstChildWhichIsA("Tool").Parent = localPlayer.Backpack
			end
			if
				not table.find(translatedItems, item.Name:lower())
				and item:FindFirstChild("SellPrice")
				and item:FindFirstChild("SellPrice").Value ~= 0
			then
				if
					localPlayer:DistanceFromCharacter(workspace.NPCS[merchant[game.PlaceId]]:GetPivot().Position)
					< 8
				then
					if item.Parent then
						item.Parent = localPlayer.Character
					end
					talkToNpcDb = true
					workspace.NPCS[merchant[game.PlaceId]].TalkToNPC:FireServer()
					task.delay(1, function()
						talkToNpcDb = false
					end)
				end
				if
					localPlayer:DistanceFromCharacter(workspace.NPCS[merchant[game.PlaceId]]:GetPivot().Position)
					< 8
				then
					repeat
						task.wait()
						talkToNpcDb = true
						workspace.NPCS[merchant[game.PlaceId]].TalkToNPC:FireServer()
						task.delay(1, function()
							talkToNpcDb = false
						end)
						if item.Parent then
							item.Parent = localPlayer.Character
						end
						clickButton("look")
						clickButton("All")
						clickButton("How")
						clickButton("Nevermind")
						if not state then
							break
						end
					until not item.Parent
				end
			end
		end
	end,
}
