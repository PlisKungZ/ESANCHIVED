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

local TeleportTable = {
	["Great Height (Yuria)"] = CFrame.new(747.6103515625, 770.224853515625, -51.407676696777344),
	["Sentenza"] = CFrame.new(439.9958801269531, -7.5, 438.1730651855469),
	["Hana Association"] = CFrame.new(310.8846740722656, 27.500045776367188, 570.3676147460938),
	["The Darius"] = CFrame.new(94.9479751586914, 30.540618896484375, 851.0762329101562),
	["The Tower"] = CFrame.new(-1003.6781616210938, 697.5252685546875, 1431.3994140625),
	["Ocean Appoarch"] = CFrame.new(-1193.6763916015625, -10.500003814697266, 976.7411499023438),
	["Chemical Factory"] = CFrame.new(-1277.293701171875, 190.02536010742188, -83.25059509277344),
	["Construction Site"] = CFrame.new(-776.7263793945312, 63.62499237060547, -32.27681350708008),
	["Everything Workshop"] = CFrame.new(159.12794494628906, 64.49998474121094, 112.2244644165039),
	["Dumpster Guy (Dungeon)"] = CFrame.new(295.69189453125, 64.49998474121094, -147.36453247070312),
}
local TeleportText = {
	"Great Height (Yuria)",
	"Sentenza",
	"Hana Association",
	"The Darius",
	"The Tower",
	"Ocean Appoarch",
	"Chemical Factory",
	"Construction Site",
	"Everything Workshop",
	"Dumpster Guy (Dungeon)",
}

function Teleportation.init()
	LPH_NO_VIRTUALIZE(function()
		local Tab = window:AddTab({ Title = "Teleportation", Icon = "" })

		local areaSelectionDropDown = Tab:AddDropdown("areaSelection", {
			Title = "Teleport Area",
			Values = TeleportText,
			Multi = false,
			Default = "",
		})

		Tab:AddButton({
			Title = "Teleport",
			Description = "Teleport To Chosen Area.",
			Callback = function()
				if TeleportTable[Options.areaSelection.Value] then
					Players.LocalPlayer.Character:PivotTo(TeleportTable[Options.areaSelection.Value])
				end
			end,
		})

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
