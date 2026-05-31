local AutoOpenContainerReq = require("Features/AutoOpenContainer/AutoOpenContainer")

local AutoOpenCache = {}

function AutoOpenCache.init()
	LPH_NO_VIRTUALIZE(function()
		local Tab = window:AddTab({ Title = "Auto Open Container", Icon = "" })

		local autoOpenContainer = Tab:AddToggle("autoOpenContainer", { Title = "Auto Open Container", Default = false })

		autoOpenContainer:OnChanged(function()
			if Options.autoOpenContainer.Value and #Options.autoOpenContainerSelection.Values ~= 0 then
				AutoOpenContainerReq.on()
			else
				AutoOpenContainerReq.off()
			end
		end)

		local autoOpenContainerSelection = Tab:AddDropdown("autoOpenContainerSelection", {
			Title = "Auto Open Container Selection",
			Values = {
				"Caches",
				"Seed Of Light",
				"Fixer's Note",
				"Exp Ticket",
			},
			Multi = true,
			Default = {},
		})
	end)()
end

return AutoOpenCache
