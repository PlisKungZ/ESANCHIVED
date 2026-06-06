local GuiService = game:GetService("GuiService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

local Webhook = {}

local splitString = LPH_NO_VIRTUALIZE(function(str, sep)
	sep = sep or ","
	local result = {}
	for item in str:gmatch("[^" .. sep .. "]+") do
		table.insert(result, item:lower())
	end
	return result
end)

local function sendWebhook()
	local itemNames = {}
	for _, item in localPlayer.Backpack:GetChildren() do
		if item:IsA("Tool") then
			if not itemNames[item.Name] then
				itemNames[item.Name] = 1
			else
				itemNames[item.Name] = itemNames[item.Name] + 1
			end
		end
	end

	local categorized = {}
	for itemName, amount in itemNames do
		local item = localPlayer.Backpack:FindFirstChild(itemName)
		if item then
			local category = item:GetAttribute("ItemCategory")
			if not categorized[category] then
				categorized[category] = {}
			end
			table.insert(categorized[category], { Name = itemName, Amount = amount })
		end
	end

	local fields = {
		{
			["name"] = "Player Info",
			["value"] = string.format(
				"**Username** : ||%s||\n**Slot Order** : %s\n**Ahn** : %s\n**Lunacy** : %s",
				localPlayer.Name,
				localPlayer:GetAttribute("Slot"),
				localPlayer.PlayerGui.CurrencyGUI.List.Ahn.Amount.Text,
				localPlayer.PlayerGui.CurrencyGUI.List.Lunacy.Amount.Text
			),
		},
	}

	local isInserted = {}
	for categoryName, items in categorized do
		if not table.find(isInserted, categoryName) then
			table.insert(isInserted, categoryName)
			local text = ""
			for _, item in items do
				text = text .. string.format(" %s %sx\n", item.Name, item.Amount)
			end
			table.insert(fields, { ["name"] = categoryName, ["value"] = text })
		end
	end

	local data = {
		["content"] = Options.mentionText.Value,
		["embeds"] = {
			{
				["title"] = "Telepathy Overload | Archived",
				["description"] = "",
				["color"] = 65280,
				["fields"] = fields,
				["footer"] = {
					["text"] = "📦 Archived • " .. os.date("%m/%d/%Y %I:%M %p"),
				},
				["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ"),
			},
		},
	}

	local body = HttpService:JSONEncode(data)
	request({
		Url = Options.webHookUrl.Value,
		Method = "POST",
		Headers = { ["Content-Type"] = "application/json" },
		Body = body,
	})
end

local connection
connection = localPlayer.Backpack.ChildAdded:Connect(function(child)
	if not Options.webHookState then
		return
	end
	if Toggles.webHookState.Value then
		local translatedItems = splitString(Options.itemNotifyList.Value)
		if table.find(translatedItems, child.Name:lower()) then
			sendWebhook()
		end
	end
end)

Webhook.init = LPH_NO_VIRTUALIZE(function()
	local Tab = Window:AddTab("Webhook", "webhook")
	local leftSide = Tab:AddLeftGroupbox("Webhook")

	leftSide:AddToggle("webHookState", {
		Text = "Webhook Notify",
		Default = false,
		Tooltip = "Enable webhook notifications",
	})

	leftSide:AddDivider()

	leftSide:AddInput("webHookUrl", {
		Text = "Webhook URL",
		Default = "",
		Placeholder = "https://discord.com/api/...",
		Numeric = false,
		Finished = true,
		Tooltip = "Your Discord webhook URL",
		Callback = function(Value) end,
	})

	leftSide:AddInput("mentionText", {
		Text = "Mention Text",
		Default = "",
		Placeholder = "<@676767676767>",
		Numeric = false,
		Finished = true,
		Tooltip = "Text content sent with the notification",
		Callback = function(Value) end,
	})

	leftSide:AddInput("itemNotifyList", {
		Text = "Item Notify List",
		Default = "",
		Placeholder = "Book,Gear,...",
		Numeric = false,
		Finished = true,
		Tooltip = "Comma-separated list of items to watch for",
		Callback = function(Value) end,
	})

	leftSide:AddDivider()

	leftSide:AddButton({
		Text = "Test Webhook",
		Func = function()
			if Options.webHookUrl.Value == "" then
				Library:Notify({
					Title = "Webhook",
					Description = "Please enter a webhook URL first.",
					Time = 4,
				})
				return
			end
			sendWebhook()
			Library:Notify({
				Title = "Webhook",
				Description = "Test notification sent!",
				Time = 4,
			})
		end,
		Tooltip = "Send a test webhook with your current inventory",
		DoubleClick = false,
	})
end)

return Webhook
