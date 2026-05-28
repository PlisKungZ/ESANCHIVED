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
	local inventory = ""
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
			if not categorized[item:GetAttribute("ItemCategory")] then
				categorized[item:GetAttribute("ItemCategory")] = {}
				table.insert(
					categorized[item:GetAttribute("ItemCategory")],
					{ ["Name"] = itemName, ["Amount"] = amount }
				)
			else
				table.insert(
					categorized[item:GetAttribute("ItemCategory")],
					{ ["Name"] = itemName, ["Amount"] = amount }
				)
			end
		end
	end

	local headers = {
		["Content-Type"] = "application/json",
	}
	local embed = {
		["content"] = Options.mentionText.Value,
		["title"] = "Telepathy Overload | Archived",
		["description"] = "",
		["color"] = 65280,
		["fields"] = {
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
			{
				["name"] = "Player Inventory",
				["value"] = inventory,
			},
		},
		["footer"] = {
			["text"] = "📦 Archived • " .. os.date("%m/%d/%Y %I:%M %p"),
		},
		["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ"),
	}

	local isInserted = {}

	for categoryName, items in categorized do
		if not table.find(isInserted, categoryName) then
			table.insert(isInserted, categoryName)
			local text = ""
			for _, item in items do
				text = text .. string.format(" %s %sx\n", item.Name, item.Amount)
			end
			table.insert(embed.fields, { ["name"] = categoryName, ["value"] = text })
		end
	end

	local data = {
		["content"] = Options.mentionText.Value,
		["embeds"] = {
			{
				["title"] = embed.title,
				["description"] = embed.description,
				["color"] = embed.color,
				["fields"] = embed.fields,
				["footer"] = {
					["text"] = embed.footer.text,
				},
			},
		},
	}
	local body = HttpService:JSONEncode(data)
	local response = request({
		Url = Options.webHookUrl.Value,
		Method = "POST",
		Headers = headers,
		Body = body,
	})
end

local fetchedTable = {}
local connection
connection = localPlayer.Backpack.ChildAdded:Connect(function(child)
	if game.PlaceId ~= 99831550635699 then
		return
	end
	if Options.webHookState.Value then
		local translatedItems = splitString(Options.itemNotifyList.Value)
		if table.find(translatedItems, child.Name:lower()) then
			sendWebhook()
		end
	end
end)

task.spawn(function()
	while true do
		task.wait(1)
		if GUI.Unloaded then
			connection:Disconnect()
			break
		end
	end
end)

function Webhook.init()
	LPH_NO_VIRTUALIZE(function()
		local Tab = window:AddTab({ Title = "Webhook", Icon = "" })

		local webHookState = Tab:AddToggle("webHookState", { Title = "Webhook Notify", Default = false })

		local webHookUrl = Tab:AddInput("webHookUrl", {
			Title = "Webhook Url",
			Default = "",
			Placeholder = "https://discord.com/api/...",
			Numeric = false,
			Finished = true,
			Callback = function(Value) end,
		})
		local mentionText = Tab:AddInput("mentionText", {
			Title = "Text Content When Notify",
			Default = "",
			Placeholder = "<@676767676767>",
			Numeric = false,
			Finished = true,
			Callback = function(Value) end,
		})
		local itemNotifyList = Tab:AddInput("itemNotifyList", {
			Title = "Item Notify Lists",
			Default = "",
			Placeholder = "Book,Gear,...",
			Numeric = false,
			Finished = true,
			Callback = function(Value) end,
		})
	end)()
end

return Webhook
