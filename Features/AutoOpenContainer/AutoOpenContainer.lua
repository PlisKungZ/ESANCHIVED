local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local localPlayer = Players.LocalPlayer

local AutoOpenContainer = {}

local connection
local onCd = false

local itemListsKeyword = {
	["Caches"] = "Cache",
	["Seed Of Light"] = "Seed Of Light",
	["Fixer's Note"] = "Fixer's Note",
	["Exp Ticket"] = "Training",
}

local ignoreLists = {}

local function isASingu(itemName)
	local lists = {}
	for _, singularity in game:GetService("ReplicatedStorage").CraftRecipes.Singularities:GetChildren() do
		table.insert(lists, singularity.Name)
	end
	for _, singuName in lists do
		if itemName:lower():find(singuName:lower()) then
			return true
		end
	end
	return false
end

function AutoOpenContainer.on()
	AutoOpenContainer.off()
	connection = RunService.Heartbeat:Connect(function(deltaTime)
		localPlayer.PlayerGui.PageSelection.Enabled = false
		local usedBook = localPlayer.Character:FindFirstChild("UsedBook")
		if usedBook then
			usedBook:Destroy()
		end
		if onCd then
			return
		end
		local oldTool = localPlayer.Character:FindFirstAncestorWhichIsA("Tool")
		if oldTool then
			oldTool.Parent = localPlayer.Backpack
		end
		onCd = true
		for _, item in localPlayer.Backpack:GetChildren() do
			for _, value in Options.autoOpenContainerSelection.Values do
				if
					item.Name:find(itemListsKeyword[value])
					and not isASingu(item.Name)
					and not table.find(ignoreLists, item)
				then
					if not connection then
						break
					end
					local failSafe = false
					local breakLoop = false
					repeat
						if not connection then
							break
						end
						if breakLoop then
							break
						end
						task.wait()
						firesignal(item.Activated)
						if not failSafe then
							failSafe = true
							task.delay(5, function()
								if item.Parent then
									breakLoop = true
									table.insert(ignoreLists, item)
								end
							end)
						end
					until not item.Parent
				end
			end
		end
		onCd = false
	end)
end

function AutoOpenContainer.off()
	if connection then
		connection:Disconnect()
	end
	localPlayer.PlayerGui.PageSelection.Enabled = true
end

return AutoOpenContainer
