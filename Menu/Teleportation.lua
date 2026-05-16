local Players = game:GetService("Players")

local Teleportation = {}

local function getPlayerNames()
	local names = {}
	for _, player in Players:GetPlayers() do
		if player ~= Players.LocalPlayer then
			table.insert(names, player.Name)
		end
	end
	return names
end

function Teleportation.init()
	LPH_NO_VIRTUALIZE(function()
		local Tab = window:AddTab({ Title = "Teleportation", Icon = "" })
		local playerSelectionDropDown = Tab:AddDropdown("playerSelection", {
			Title = "Teleport Target",
			Values = getPlayerNames(),
			Multi = false,
			Default = "",
		})

		for _, player in Players:GetPlayers() do
			if player ~= Players.LocalPlayer then
				Options.playerSelection:SetValues(getPlayerNames())
			end
		end

		Players.PlayerAdded:Connect(function(player)
			if player == Players.LocalPlayer then
				return
			end
			Options.playerSelection:SetValues(getPlayerNames())
		end)

		Players.PlayerRemoving:Connect(function(player)
			if player == Players.LocalPlayer then
				return
			end
			Options.playerSelection:SetValues(getPlayerNames())
		end)

		Tab:AddButton({
			Title = "Refresh Player Lists",
			Callback = function()
				for _, player in Players:GetPlayers() do
					if player ~= Players.LocalPlayer then
						Options.playerSelection:SetValues(getPlayerNames())
					end
				end
			end,
		})
		Tab:AddButton({
			Title = "Teleport",
			Description = "Teleport To Chosen Player.",
			Callback = function()
				Players.LocalPlayer.Character:PivotTo(Players[Options.playerSelection.Value].Character:GetPivot())
			end,
		})
	end)()
end

return Teleportation
