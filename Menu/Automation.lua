local autoLib = require("Features/Automation/AutoLibrary")
local autoWarp = require("Features/Automation/AutoWarp")
local autoRailway = require("Features/Automation/AutoRailway")
local autoGrade = require("Features/Automation/AutoGradeEvaluation")

local Automation = {}

function Automation.init()
	LPH_NO_VIRTUALIZE(function()
		local Tab = window:AddTab({ Title = "Automation", Icon = "" })
		Tab:AddParagraph({
			Title = "Auto Library Usage",
			Content = "This is only usable when in the ordeal itself.",
		})

		local autoLibraryToggle = Tab:AddToggle("AutoLibrary", { Title = "Auto Library", Default = false })

		autoLibraryToggle:OnChanged(function()
			if Options.AutoLibrary.Value then
				local state, err = autoLib.on(
					Options.autoLibYOffset.Value,
					Options.libraryFloorSelection.Value,
					Options.buffLibrary.Value
				)
				if not state then
					GUI:Notify({
						Title = "Error Occurred.",
						Content = err,
						Duration = 8,
					})
				end
			else
				if Options.libraryFloorSelection then
					autoLib.off(Options.libraryFloorSelection.Value)
				end
			end
		end)

		local libraryFloorSelectionDropDown = Tab:AddDropdown("libraryFloorSelection", {
			Title = "Library Floor Selection",
			Values = {
				"Kether",
				"Language",
				"Philosophy",
			},
			Multi = false,
			Default = 1,
		})

		local buffLibraryToggle = Tab:AddToggle("buffLibrary", { Title = "Buff Library", Default = false })

		buffLibraryToggle:OnChanged(function()
			if Options.AutoLibrary.Value then
				local state, err = autoLib.on(
					Options.autoLibYOffset.Value,
					Options.libraryFloorSelection.Value,
					Options.buffLibrary.Value
				)
				if not state then
					GUI:Notify({
						Title = "Error Occurred.",
						Content = err,
						Duration = 8,
					})
				end
			end
		end)
		local autoLibraryYOffset = Tab:AddSlider("autoLibYOffset", {
			Title = "Y Offset",
			Description = "Depends on your weapons",
			Default = 5,
			Min = 0,
			Max = 30,
			Rounding = 0,
			Callback = function(Value)
				if Options.AutoLibrary.Value then
					local state, err = autoLib.on(Value, Options.libraryFloorSelection.Value, Options.buffLibrary.Value)
					if not state then
						Options.AutoLibrary:SetValue(false)
						GUI:Notify({
							Title = "Error Occurred.",
							Content = err,
							Duration = 8,
						})
					end
				end
			end,
		})

		Tab:AddParagraph({
			Title = "Auto Warp Train Usage",
			Content = "This is only usable when in the Warp Train itself.",
		})

		local AutoWarpToggle = Tab:AddToggle("AutoWarp", { Title = "Auto Warp Train", Default = false })
		Options.AutoWarp:SetValue(false)

		AutoWarpToggle:OnChanged(function()
			if Options.AutoWarp.Value then
				local state, err = autoWarp.on(Options.autoWarpYOffset.Value)
				if not state then
					GUI:Notify({
						Title = "Error Occurred.",
						Content = err,
						Duration = 8,
					})
				end
			else
				autoWarp.off()
			end
		end)

		local autoWarpYOffset = Tab:AddSlider("autoWarpYOffset", {
			Title = "Y Offset",
			Description = "Depends on your weapons",
			Default = 10,
			Min = 0,
			Max = 30,
			Rounding = 0,
			Callback = function(Value)
				if Options.AutoWarp.Value then
					local state, err = autoWarp.on(Value)
					if not state then
						Options.AutoWarp:SetValue(false)
						GUI:Notify({
							Title = "Error Occurred.",
							Content = err,
							Duration = 8,
						})
					end
				end
			end,
		})
		local autoGradeEva = Tab:AddToggle("autoGradeEva", { Title = "Auto Grade Evaluation", Default = false })
		Options.autoGradeEva:SetValue(false)

		autoGradeEva:OnChanged(function()
			if Options.autoGradeEva.Value then
				local state, err = autoGrade.on(Options.autoGradeEvaYOffset.Value)
				if not state then
					GUI:Notify({
						Title = "Error Occurred.",
						Content = err,
						Duration = 8,
					})
				end
			else
				autoGrade.off()
			end
		end)

		local autoGradeEvaYOffset = Tab:AddSlider("autoGradeEvaYOffset", {
			Title = "Y Offset",
			Description = "Depends on your weapons",
			Default = 30,
			Min = 0,
			Max = 30,
			Rounding = 0,
			Callback = function(Value)
				if Options.autoGradeEva.Value then
					local state, err = autoGrade.on(Value)
					if not state then
						Options.autoGradeEva:SetValue(false)
						GUI:Notify({
							Title = "Error Occurred.",
							Content = err,
							Duration = 8,
						})
					end
				end
			end,
		})
		Tab:AddParagraph({
			Title = "Auto Railway Usage",
			Content = "This is only usable when in the Railway itself.",
		})

		local AutoRailwayToggle = Tab:AddToggle("AutoRailway", { Title = "Auto Railway", Default = false })

		AutoRailwayToggle:OnChanged(function()
			if Options.AutoRailway.Value then
				local state, err = autoRailway.on(Options.autoRailwayYOffset.Value)
				if not state then
					Options.AutoRailway:SetValue(false)
					GUI:Notify({
						Title = "Error Occurred.",
						Content = err,
						Duration = 8,
					})
				end
			else
				autoRailway.off()
			end
		end)

		local autoRailwayYOffset = Tab:AddSlider("autoRailwayYOffset", {
			Title = "Y Offset",
			Description = "Depends on your weapons",
			Default = 5,
			Min = 0,
			Max = 30,
			Rounding = 0,
			Callback = function(Value)
				if Options.AutoRailway.Value then
					local state, err = autoRailway.on(Value)
					if not state then
						Options.AutoRailway:SetValue(false)
						GUI:Notify({
							Title = "Error Occurred.",
							Content = err,
							Duration = 8,
						})
					end
				end
			end,
		})
	end)()
end

return Automation
