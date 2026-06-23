local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local localPlayer = Players.LocalPlayer

local autoTradeBooks = {}
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

local function getBooks()
	local books = {}
	local blackListed = { "Book", "Book of Unknown Backstreets Dwellers" }
	local excludeLists = splitString(Options.autoTradeBooksExcludeLists.Value)
	for _, book in localPlayer.Backpack:GetChildren() do
		if
			not table.find(blackListed, book.Name)
			and not table.find(excludeLists, book.Name:lower())
			and book:GetAttribute("ItemCategory") == "Books"
		then
			table.insert(books, book)
		end
	end
	local findTool = localPlayer.Character:FindFirstChildWhichIsA("Tool")
	if not findTool then
		return books
	end
	if
		not table.find(blackListed, findTool.Name)
		and not table.find(excludeLists, findTool.Name:lower())
		and findTool:GetAttribute("ItemCategory") == "Books"
	then
		table.insert(books, findTool)
	end
	return books
end

local connection
local state = false

function autoTradeBooks.on()
	state = true
	local talkToNpcDb = false
	local promptCooldown = false
	local db = false

	connection = game.RunService.Stepped:Connect(LPH_NO_VIRTUALIZE(function(deltaTime)
		if db then
			return
		end
		if not workspace.NPCS:FindFirstChild("Sara") then
			return
		end

		local dist = localPlayer:DistanceFromCharacter(workspace.NPCS.Sara:GetPivot().Position)
		if dist > 8 then
			return
		end

		if not localPlayer.PlayerGui:FindFirstChild("InteractPromptGUI") then
			return
		end
		if #getBooks() == 0 then
			return
		end

		if not localPlayer.Data.IsTalking.Value then
			if promptCooldown then
				return
			end
			promptCooldown = true
			fireproximityprompt(workspace.NPCS:FindFirstChild("Sara"):FindFirstChildWhichIsA("ProximityPrompt"))
			promptCooldown = false
		else
			if db then
				return
			end
			if #getBooks() == 0 then
				return
			end
			local findTool = localPlayer.Character:FindFirstChildWhichIsA("Tool")
			if not findTool then
				getBooks()[1].Parent = localPlayer.Character
			elseif findTool:GetAttribute("ItemCategory") ~= "Books" then
				findTool.Parent = localPlayer.Backpack
				getBooks()[1].Parent = localPlayer.Character
			end
			db = true
			task.spawn(function()
				local clickedSure = false
				repeat
					task.wait()
					if not state then
						break
					end
					if not localPlayer.Data.IsTalking.Value then
						break
					end
					if #getBooks() == 0 then
						break
					end
					if clickButton("Sure") then
						clickedSure = true
					else
						clickButton("Bye")
					end
				until clickedSure
				db = false
			end)
		end
	end))
end

function autoTradeBooks.off()
	state = false
	if connection then
		connection:Disconnect()
		connection = nil
	end
end

return autoTradeBooks
