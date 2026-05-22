local autoSellReq = require("Features/AutoSell/AutoSell")
local AutoSell = {}

function AutoSell.init()
	LPH_NO_VIRTUALIZE(function()
		local Tab = window:AddTab({ Title = "Auto Sell", Icon = "" })

		local autoSellExclude = Tab:AddToggle("autoSellExclude", { Title = "Auto Sell Exclude Mode", Default = false })

		autoSellExclude:OnChanged(function()
			if Options.autoSellExclude.Value and Options.sellInput then
				Options.autoSellInclude:SetValue(false)
				autoSellReq.on("Exclude", Options.sellInput.Value)
			else
				autoSellReq.off()
			end
		end)

		local autoSellInclude = Tab:AddToggle("autoSellInclude", { Title = "Auto Sell Include Mode", Default = false })

		autoSellInclude:OnChanged(function()
			if Options.autoSellInclude.Value and Options.sellInput then
				Options.autoSellExclude:SetValue(false)
				autoSellReq.on("Include", Options.sellInput.Value)
			else
				autoSellReq.off()
			end
		end)

		local autoSellCategorySelection = Tab:AddDropdown("autoSellCategorySelection", {
			Title = "Auto Sell Category Selection",
			Values = {
				"Augments",
				"Books",
				"Consumable",
				"General",
				"Gifts",
				"Materials",
				"Rare Materials",
				"Tickets",
				"Unique",
			},
			Multi = true,
			Default = {},
		})

		autoSellCategorySelection:OnChanged(function(Value)
			if Options.autoSellExclude.Value then
				autoSellReq.on("Exclude", Options.sellInput.Value)
			end
			if Options.autoSellInclude.Value then
				autoSellReq.on("Include", Options.sellInput.Value)
			end
		end)

		local Input = Tab:AddInput("sellInput", {
			Title = "Sell Lists",
			Default = "",
			Placeholder = "Book,Gear,...",
			Numeric = false, -- Only allows numbers
			Finished = true, -- Only calls callback when you press enter
			Callback = function(Value)
				if Options.autoSellExclude.Value then
					Options.autoSellInclude:SetValue(false)
					autoSellReq.on("Exclude", Value)
				end
				if Options.autoSellInclude.Value then
					Options.autoSellExclude:SetValue(false)
					autoSellReq.on("Include", Value)
				end
			end,
		})
	end)()
end

return AutoSell
