local noEndlag = require("Features/Removal/noEndlag")
local dashNoCD = require("Features/Removal/DashNoCD")
local noFall = require("Features/Removal/NoFall")
local noKillBrick = require("Features/Removal/noKillBrick")
local noWeather = require("Features/Removal/noWeather")

local Removal = {}

function Removal.init()
	LPH_NO_VIRTUALIZE(function()
		local Tab = window:AddTab({ Title = "Removal", Icon = "" })
		local fallDamageToggle = Tab:AddToggle("fallDamage", { Title = "No Fall Damage", Default = false })

		fallDamageToggle:OnChanged(function()
			if Options.fallDamage.Value then
				noFall.on()
			else
				noFall.off()
			end
		end)

		local noDashCDToggle = Tab:AddToggle("noDashCD", { Title = "No Dash Cooldown", Default = false })

		noDashCDToggle:OnChanged(function()
			if Options.noDashCD.Value then
				dashNoCD.on()
			else
				dashNoCD.off()
			end
		end)

		local noStunToggle = Tab:AddToggle("noStun", { Title = "No Slow", Default = false })

		noStunToggle:OnChanged(function()
			if Options.noStun.Value then
				noEndlag.on()
			else
				noEndlag.off()
			end
		end)

		local noKillBrickToggle = Tab:AddToggle("noKillBrick", { Title = "No Kill Bricks", Default = false })

		noKillBrickToggle:OnChanged(function()
			if Options.noKillBrick.Value then
				noKillBrick.on()
			else
				noKillBrick.off()
			end
		end)

		local noWeatherToggle = Tab:AddToggle("noWeather", { Title = "No Weather", Default = false })

		noWeatherToggle:OnChanged(function()
			if Options.noWeather.Value then
				noWeather.on()
			else
				noWeather.off()
			end
		end)
	end)()
end

return Removal
