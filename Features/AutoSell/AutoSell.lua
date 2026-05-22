local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local localPlayer = Players.LocalPlayer

local autoSell = {}
local splitString = LPH_NO_VIRTUALIZE(function(str, sep)
	sep = sep or ","
	local result = {}
	for item in str:gmatch("[^" .. sep .. "]+") do
		table.insert(result, item:lower())
	end
	return result
end)

local function clickButton(text)
	for _, frame in game:GetService("Players").LocalPlayer.PlayerGui.Dialogue.MainFrame.Options.Scroll:GetChildren() do
		if frame:IsA("Frame") then
			if frame.OptionText.Text == text or frame.OptionText.Text:find(text) then
				replicatesignal(frame.OptionButton.MouseButton1Click)
				return true
			end
		end
	end
	return false
end

local connection
local state = false
getgenv().isSellAble = true

local merchant = {
	[99831550635699] = "Railway Merchant",
	[14038329225] = "Restaurant Owner",
}

local function fetchAutoSellCategory()
	local tabled = {}
	for name, _ in Options.autoSellCategorySelection.Value do
		table.insert(tabled, name)
	end
	return tabled
end

getgenv().getSellLists = function(translatedItems, mode)
	local tabled = {}
	local modesLists = {
		["Exclude"] = function()
			for _, item in localPlayer.Backpack:GetChildren() do
				if
					not table.find(translatedItems, item.Name:lower())
					and item:FindFirstChild("SellPrice")
					and not table.find(fetchAutoSellCategory(), item:GetAttribute("ItemCategory"))
				then
					if item:FindFirstChild("SellPrice").Value ~= 0 then
						if not table.find(tabled, item.Name) then
							table.insert(tabled, item.Name)
							print(item.Name)
						end
					end
				end
			end
		end,
		["Include"] = function()
			for _, item in localPlayer.Backpack:GetChildren() do
				if
					table.find(translatedItems, item.Name:lower())
					and item:FindFirstChild("SellPrice")
					and table.find(fetchAutoSellCategory(), item:GetAttribute("ItemCategory"))
				then
					if item:FindFirstChild("SellPrice").Value ~= 0 then
						if not table.find(tabled, item.Name) then
							table.insert(tabled, item.Name)
						end
					end
				end
			end
		end,
	}
	if localPlayer.Character:FindFirstChildWhichIsA("Tool") then
		localPlayer.Character:FindFirstChildWhichIsA("Tool").Parent = localPlayer.Character
	end
	modesLists[mode]()
	if #tabled == 0 then
		getgenv().isSellAble = false
	else
		getgenv().isSellAble = true
	end
	return tabled
end

function autoSell.on(mode, items)
	state = true
	local translatedItems = splitString(items)
	local talkToNpcDb = false
	local promptCooldown = false
	local db = false
	local modeFunctions = {
		["Include"] = function()
			for _, itemName in getSellLists(translatedItems, mode) do
				if not workspace.NPCS:FindFirstChild(merchant[game.PlaceId]) then
					db = false
					return
				end

				local dist =
					localPlayer:DistanceFromCharacter(workspace.NPCS[merchant[game.PlaceId]]:GetPivot().Position)

				if dist > 8 then
					db = false
					return
				end
				if not localPlayer.PlayerGui.Dialogue.Enabled then
					db = false
					return
				end
				if not state then
					db = false
					return
				end

				if localPlayer.Character:FindFirstChildWhichIsA("Tool") then
					localPlayer.Character:FindFirstChildWhichIsA("Tool").Parent = localPlayer.Backpack
				end

				local item = localPlayer.Backpack:FindFirstChild(itemName)
				if not item then
					continue
				end

				item.Parent = localPlayer.Character
				repeat
					clickButton("Can")
					clickButton("All")
					clickButton("How")
					if not state then
						db = false
						return
					end
					if not localPlayer.PlayerGui.Dialogue.Enabled then
						db = false
						return
					end
					task.wait()
				until not item.Parent
			end
			db = false
		end,
		["Exclude"] = function()
			for _, itemName in getSellLists(translatedItems, mode) do
				if not workspace.NPCS:FindFirstChild(merchant[game.PlaceId]) then
					db = false
					return
				end

				local dist =
					localPlayer:DistanceFromCharacter(workspace.NPCS[merchant[game.PlaceId]]:GetPivot().Position)

				if dist > 8 then
					db = false
					return
				end
				if not localPlayer.PlayerGui.Dialogue.Enabled then
					db = false
					return
				end
				if not state then
					db = false
					return
				end

				if localPlayer.Character:FindFirstChildWhichIsA("Tool") then
					localPlayer.Character:FindFirstChildWhichIsA("Tool").Parent = localPlayer.Backpack
				end

				local item = localPlayer.Backpack:FindFirstChild(itemName)
				if not item then
					continue
				end

				item.Parent = localPlayer.Character
				repeat
					clickButton("Can")
					clickButton("All")
					clickButton("How")
					if not state then
						db = false
						return
					end
					if not localPlayer.PlayerGui.Dialogue.Enabled then
						db = false
						return
					end
					task.wait()
				until not item.Parent
			end
			db = false
		end,
	}

	connection = game.RunService.Stepped:Connect(LPH_NO_VIRTUALIZE(function(deltaTime)
		if db then
			return
		end
		if not workspace.NPCS:FindFirstChild(merchant[game.PlaceId]) then
			return
		end

		local dist = localPlayer:DistanceFromCharacter(workspace.NPCS[merchant[game.PlaceId]]:GetPivot().Position)
		if dist > 8 then
			return
		end

		if not localPlayer.PlayerGui:FindFirstChild("InteractPromptGUI") then
			return
		end

		if not localPlayer.Data.IsTalking.Value then
			if promptCooldown then
				return
			end
			promptCooldown = true
			fireproximityprompt(
				workspace.NPCS:FindFirstChild(merchant[game.PlaceId]):FindFirstChildWhichIsA("ProximityPrompt")
			)
			task.delay(2, function()
				promptCooldown = false
			end)
		else
			if db then
				return
			end
			db = true
			task.spawn(function() -- spawn so task.wait() inside doesn't block Stepped
				modeFunctions[mode]()
				db = false
			end)
		end
	end))
end

function autoSell.off()
	state = false
	if connection then
		connection:Disconnect()
		connection = nil
	end
end

return autoSell
