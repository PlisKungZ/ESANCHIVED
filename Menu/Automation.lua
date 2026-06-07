local autoLib = require("Features/Automation/AutoLibrary")
local autoWarp = require("Features/Automation/AutoWarp")
local autoRailway = require("Features/Automation/AutoRailway")
local autoGrade = require("Features/Automation/AutoGradeEvaluation")
local autoLCorp = require("Features/Automation/AutoLCorpBosses")
local autoRicardo = require("Features/Automation/AutoRicardo")
local AutoOpenContainerReq = require("Features/AutoOpenContainer/AutoOpenContainer")
local autoSellReq = require("Features/AutoSell/AutoSell")

local Automation = {}

getgenv().autoRailwayLootPriority = {}

if isfile("TelepathyOverload/Archived/loot_priority.txt") then
	for item in readfile("TelepathyOverload/Archived/loot_priority.txt"):gmatch("[^,]+") do
		table.insert(autoRailwayLootPriority, item)
	end
end

Automation.init = LPH_NO_VIRTUALIZE(function()
	local Tab = Window:AddTab("Automation", "zap")

	-- ── LEFT SIDE ──────────────────────────────────────────────
	local leftSide = Tab:AddLeftGroupbox("Automation")

	-- Auto Library
	leftSide:AddToggle("AutoLibrary", {
		Text = "Auto Library",
		Default = false,
		Tooltip = "Only usable when inside the ordeal itself",
	})
	Toggles.AutoLibrary:OnChanged(function()
		if Toggles.AutoLibrary and Options.libraryFloorSelection and Toggles.buffLibrary then
			if Toggles.AutoLibrary.Value then
				local state, err = autoLib.on()
				if not state then
					Library:Notify({
						Title = "Error Occurred.",
						Description = err,
						Time = 8,
					})
				end
			else
				autoLib.off(Options.libraryFloorSelection.Value)
			end
		end
	end)

	leftSide:AddDropdown("libraryFloorSelection", {
		Text = "Library Floor",
		Values = { "Kether", "Language", "Philosophy" },
		Multi = false,
		Default = 1,
	})

	leftSide:AddToggle("buffLibrary", {
		Text = "Buff Library",
		Default = false,
	})

	leftSide:AddSlider("autoLibYOffset", {
		Text = "Library Y Offset",
		Default = 5,
		Min = 0,
		Max = 30,
		Rounding = 0,
		Tooltip = "Depends on your weapons",
	})

	leftSide:AddDivider()

	-- Auto Warp Train
	leftSide:AddToggle("AutoWarp", {
		Text = "Auto Warp Train",
		Default = false,
		Tooltip = "Only usable when inside the Warp Train itself",
	})
	Toggles.AutoWarp:SetValue(false)
	Toggles.AutoWarp:OnChanged(function()
		if Toggles.AutoWarp.Value then
			local state, err = autoWarp.on(Options.autoWarpYOffset.Value)
			if not state then
				Library:Notify({ Title = "Error Occurred.", Description = err, Time = 8 })
			end
		else
			autoWarp.off()
		end
	end)

	leftSide:AddSlider("autoWarpYOffset", {
		Text = "Warp Y Offset",
		Default = 10,
		Min = 0,
		Max = 30,
		Rounding = 0,
		Tooltip = "Depends on your weapons",
	})

	leftSide:AddDivider()

	-- Auto Grade Evaluation
	leftSide:AddToggle("autoGradeEva", {
		Text = "Auto Grade Evaluation",
		Default = false,
	})
	Toggles.autoGradeEva:SetValue(false)
	Toggles.autoGradeEva:OnChanged(function()
		if Toggles.autoGradeEva.Value then
			local state, err = autoGrade.on(Options.autoGradeEvaYOffset.Value)
			if not state then
				Library:Notify({ Title = "Error Occurred.", Description = err, Time = 8 })
			end
		else
			autoGrade.off()
		end
	end)

	leftSide:AddSlider("autoGradeEvaYOffset", {
		Text = "Grade Eval Y Offset",
		Default = 30,
		Min = 0,
		Max = 30,
		Rounding = 0,
		Tooltip = "Depends on your weapons",
		Callback = function(Value) end,
	})

	leftSide:AddDivider()

	-- Auto Railway
	leftSide:AddToggle("AutoRailway", {
		Text = "Auto Railway",
		Default = false,
		Tooltip = "Only usable when inside the Railway itself",
	})
	Toggles.AutoRailway:OnChanged(function()
		if Toggles.AutoRailway.Value then
			local state, err = autoRailway.on(Options.autoRailwayYOffset.Value)
			if not state then
				Library:Notify({ Title = "Error Occurred.", Description = err, Time = 8 })
			end
		else
			autoRailway.off()
		end
	end)

	leftSide:AddSlider("autoRailwayYOffset", {
		Text = "Railway Y Offset",
		Default = 5,
		Min = 0,
		Max = 30,
		Rounding = 0,
		Tooltip = "Depends on your weapons",
		Callback = function(Value)
			--[[ 			if Toggles.AutoRailway.Value then
				local state, err = autoRailway.on(Value)
				if not state then
					Toggles.AutoRailway:SetValue(false)
					Library:Notify({ Title = "Error Occurred.", Description = err, Time = 8 })
				end
			end ]]
		end,
	})

	leftSide:AddDropdown("autoRailwayLootSelection", {
		Text = "Item Priority",
		Values = {
			"Singularity",
			"SkipFloors",
			"RareItems",
			"Item",
			"HugeAhn",
			"Ahn",
			"RareAccessories",
			"Accessories",
			"HugeExperience",
			"Experience",
			"Heal",
		},
		Multi = true,
		Default = 1,
		Tooltip = "Select loot priority order",
		Callback = function(Value) end,
	})

	Options.autoRailwayLootSelection:OnChanged(function()
		autoRailwayLootPriority = {}
		local savedPriority = {}

		if isfile("TelepathyArchived/loot_priority.txt") then
			for item in readfile("TelepathyArchived/loot_priority.txt"):gmatch("[^,]+") do
				table.insert(savedPriority, item)
			end
		end

		for i = #savedPriority, 1, -1 do
			if not Options.autoRailwayLootSelection.Value[savedPriority[i]] then
				table.remove(savedPriority, i)
			end
		end

		for item, selected in pairs(Options.autoRailwayLootSelection.Value) do
			if selected then
				local found = false
				for _, v in ipairs(savedPriority) do
					if v == item then
						found = true
						break
					end
				end
				if not found then
					table.insert(savedPriority, item)
				end
			end
		end

		autoRailwayLootPriority = savedPriority
		writefile("TelepathyArchived/loot_priority.txt", table.concat(autoRailwayLootPriority, ","))

		local display = table.concat(autoRailwayLootPriority, ", ")
		Library:Notify({
			Title = "Current Item Priority",
			Description = display ~= "" and display or "None selected",
			Time = 8,
		})
	end)

	-- ── RIGHT SIDE ─────────────────────────────────────────────
	local rightSide = Tab:AddRightGroupbox("More Automation")

	-- Auto L Corp Bosses
	rightSide:AddToggle("AutoLCorp", {
		Text = "Auto L Corp Bosses",
		Default = false,
	})
	Toggles.AutoLCorp:OnChanged(function()
		if Toggles.AutoLCorp.Value then
			autoLCorp.on()
		else
			autoLCorp.off()
		end
	end)

	rightSide:AddSlider("AutoLCorpYOffset", {
		Text = "L Corp Y Offset",
		Default = 5,
		Min = 0,
		Max = 30,
		Rounding = 0,
		Tooltip = "Depends on your weapons",
	})

	rightSide:AddDropdown("lCorpBossSelection", {
		Text = "Boss Selection",
		Values = {
			"Lei Heng",
			"Gloom",
			"Pride",
			"Wrath",
			"Desire",
			"Sloth",
			"Envy",
			"Gluttony",
		},
		Multi = false,
		Default = 1,
	})

	rightSide:AddDivider()

	-- Auto Ricardo
	rightSide:AddToggle("AutoRicardo", {
		Text = "Auto Ricardo",
		Default = false,
	})
	Toggles.AutoRicardo:OnChanged(function()
		if Toggles.AutoRicardo.Value then
			autoRicardo.on()
		else
			autoRicardo.off()
		end
	end)

	rightSide:AddSlider("AutoRicardoYOffset", {
		Text = "Ricardo Y Offset",
		Default = 5,
		Min = 0,
		Max = 30,
		Rounding = 0,
		Tooltip = "Depends on your weapons",
	})

	rightSide:AddDivider()

	-- Auto Open Container
	rightSide:AddToggle("autoOpenContainer", {
		Text = "Auto Open Container",
		Default = false,
		Tooltip = "Automatically opens selected container types",
	})
	Toggles.autoOpenContainer:OnChanged(function()
		if Toggles.autoOpenContainer.Value then
			AutoOpenContainerReq.on()
		else
			AutoOpenContainerReq.off()
		end
	end)

	rightSide:AddDropdown("autoOpenContainerSelection", {
		Text = "Container Types",
		Values = { "Caches", "Seed Of Light", "Fixer's Note", "Exp Ticket" },
		Multi = true,
		Default = {},
	})

	rightSide:AddDivider()

	-- Auto Sell
	rightSide:AddToggle("autoSellExclude", {
		Text = "Auto Sell (Exclude Mode)",
		Default = false,
		Tooltip = "Sell everything except listed items",
	})
	Toggles.autoSellExclude:OnChanged(function()
		if Toggles.autoSellExclude.Value and Options.sellInput then
			Toggles.autoSellInclude:SetValue(false)
			autoSellReq.on("Exclude", Options.sellInput.Value)
		else
			autoSellReq.off()
		end
	end)

	rightSide:AddToggle("autoSellInclude", {
		Text = "Auto Sell (Include Mode)",
		Default = false,
		Tooltip = "Only sell listed items",
	})
	Toggles.autoSellInclude:OnChanged(function()
		if Toggles.autoSellInclude.Value and Options.sellInput then
			Toggles.autoSellExclude:SetValue(false)
			autoSellReq.on("Include", Options.sellInput.Value)
		else
			autoSellReq.off()
		end
	end)

	rightSide:AddDropdown("autoSellCategorySelection", {
		Text = "Sell Categories",
		Values = {
			"Container",
			"Augments",
			"Books",
			"Consumable",
			"General",
			"Gifts",
			"Materials",
			"Rare Materials",
			"Tickets",
			"Unique",
			"Vestige",
		},
		Multi = true,
		Default = 1,
	})
	Options.autoSellCategorySelection:OnChanged(function()
		if Toggles.autoSellExclude.Value then
			autoSellReq.on("Exclude", Options.sellInput.Value)
		end
		if Toggles.autoSellInclude.Value then
			autoSellReq.on("Include", Options.sellInput.Value)
		end
	end)

	rightSide:AddInput("sellInput", {
		Text = "Sell List",
		Default = "",
		Placeholder = "Book,Gear,...",
		Numeric = false,
		Finished = true,
		Tooltip = "Comma-separated item names",
		Callback = function(Value)
			if Toggles.autoSellExclude.Value then
				Toggles.autoSellInclude:SetValue(false)
				autoSellReq.on("Exclude", Value)
			end
			if Toggles.autoSellInclude.Value then
				Toggles.autoSellExclude:SetValue(false)
				autoSellReq.on("Include", Value)
			end
		end,
	})
end)

return Automation
