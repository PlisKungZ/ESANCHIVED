local walkSpeed = require("Features/Character/WalkSpeed")
local infJump = require("Features/Character/Infjump")
local noclip = require("Features/Character/Noclip")
local noRagdoll = require("Features/Character/RagdollCancel")
local fly = require("Features/Character/Fly")
local hitFloat = require("Features/Character/hitFloat")
local bringBackHitRotate = require("Features/Character/BringBackHitRotate")

local Character = {}

function Character.init()
	LPH_NO_VIRTUALIZE(function()
		local Tab = window:AddTab({ Title = "Character", Icon = "" })
		local flyToggle = Tab:AddToggle("Fly", { Title = "Fly", Default = false })

		flyToggle:OnChanged(function()
			if Options.Fly.Value then
				fly.on(Options.flySpeedSlider.Value)
			else
				fly.off()
			end
		end)

		local flySpeedSlider = Tab:AddSlider("flySpeedSlider", {
			Title = "Fly Speed",
			Description = "Increase your fly speed",
			Default = 1,
			Min = 50,
			Max = 200,
			Rounding = 1,
			Callback = function(Value)
				fly.off()
				if Options.Fly.Value then
					fly.on(Value)
				end
			end,
		})

		local WalkSpeedmultiplierToggle =
			Tab:AddToggle("WalkSpeed", { Title = "WalkSpeed Multiplier", Default = false })

		WalkSpeedmultiplierToggle:OnChanged(function()
			if Options.WalkSpeed.Value then
				walkSpeed.on(Options.walkSpeedSlider.Value)
			else
				walkSpeed.off(1)
			end
		end)

		local walkSpeedSlider = Tab:AddSlider("walkSpeedSlider", {
			Title = "Walk Speed",
			Description = "Increase your WalkSpeed",
			Default = 1,
			Min = 1,
			Max = 50,
			Rounding = 1,
			Callback = function(Value)
				walkSpeed.off()
				if Options.WalkSpeed.Value then
					walkSpeed.on(Value)
				end
			end,
		})

		local noClipToggle = Tab:AddToggle("Noclip", { Title = "Noclip", Default = false })

		noClipToggle:OnChanged(function()
			if Options.Noclip.Value then
				noclip.on()
			else
				noclip.off()
			end
		end)

		local infJumpToggle = Tab:AddToggle("InfJump", { Title = "Infinite Jump", Default = false })

		infJumpToggle:OnChanged(function()
			if Options.InfJump.Value then
				infJump.on()
			else
				infJump.off()
			end
		end)

		local ragDollToggle = Tab:AddToggle("ragdollCancel", { Title = "Auto Ragdoll Cancel", Default = false })

		ragDollToggle:OnChanged(function()
			if Options.ragdollCancel.Value then
				noRagdoll.on()
			else
				noRagdoll.off()
			end
		end)

		local bringBackHitRotateToggle =
			Tab:AddToggle("bringBackRotate", { Title = "Bring Back Hit Rotate", Default = false })
		Options.bringBackRotate:SetValue(false)

		bringBackHitRotateToggle:OnChanged(function()
			if Options.bringBackRotate.Value then
				bringBackHitRotate.on()
			else
				bringBackHitRotate.off()
			end
		end)

		local hitWhenFloatToggle = Tab:AddToggle("airHit", { Title = "M1 On Air Spoof", Default = false })

		hitWhenFloatToggle:OnChanged(function()
			if Options.airHit.Value then
				hitFloat.on()
			else
				hitFloat.off()
			end
		end)

		Tab:AddButton({
			Title = "Instant Log",
			Description = "Instantly leave the game.",
			Callback = function()
				game.Players.LocalPlayer:Destroy()
			end,
		})
	end)()
end

return Character
