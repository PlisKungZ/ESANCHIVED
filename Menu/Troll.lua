local Players = game:GetService("Players")
local void = require("Features/Troll/Void")
local killSomeone = require("Features/Troll/KillSomeone")
local killAura = require("Features/Troll/KillAura")
local Troll = {}

local function getPlayerNames()
	local names = {}
	for _, player in Players:GetPlayers() do
		task.wait()
		if player ~= Players.LocalPlayer then
			table.insert(names, player.Name)
		end
	end
	return names
end

function Troll.init()
	LPH_NO_VIRTUALIZE(function()
		local Tab = window:AddTab({ Title = "Troll", Icon = "" })
		Tab:AddParagraph({
			Title = "Void Character Usage",
			Content = "Probably not working at the moment.\n It's something to do with network ownership.",
		})

		local voidCharacterToggle = Tab:AddToggle("voidCharacter", { Title = "Void Character", Default = false })

		voidCharacterToggle:OnChanged(function()
			if Options.voidCharacter.Value then
				void.on()
			else
				void.off()
			end
		end)

		Tab:AddParagraph({
			Title = "Teleport To Sky Usage",
			Content = "I suggest use Index Cleaver and then press the keybind to take people to the sky.",
		})
		local teleportToSkyKeybind = Tab:AddKeybind("teleportToSky", {
			Title = "Teleport To Sky Kebind",
			Mode = "Toggle",
			Default = "",
			Callback = function(Value)
				local oldPos = game.Players.LocalPlayer.Character:GetPivot()
				game.Players.LocalPlayer.Character:PivotTo(oldPos + Vector3.new(0, 2000, 0))
				task.delay(3, function()
					game.TextChatService.TextChannels.RBXGeneral:SendAsync("mb all")
				end)
				task.delay(5, function()
					game.Players.LocalPlayer.Character:PivotTo(oldPos)
				end)
			end,
		})

		local killAuraPlayer = Tab:AddToggle("KillAura", { Title = "Kill Selected Target", Default = false })
		Options.KillAura:SetValue(false)

		killAuraPlayer:OnChanged(function()
			if Options.KillAura.Value then
				killSomeone.on(-7, Players[Options.playerKillAuraSelection.Value].Character)
			else
				killSomeone.off()
			end
		end)

		local playerKillAuraSelection = Tab:AddDropdown("playerKillAuraSelection", {
			Title = "Kill Target",
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
			Options.playerSelection:SetValues(getPlayerNames())
		end)

		Players.PlayerRemoving:Connect(function(player)
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
		local hitAuraPlayer = Tab:AddToggle("hitAura", { Title = "Hit Aura", Default = false })
		Options.hitAura:SetValue(false)

		hitAuraPlayer:OnChanged(function()
			if Options.hitAura.Value then
				killAura.on()
			else
				killAura.off()
			end
		end)
	end)()
end

return Troll
