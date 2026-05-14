if not game:IsLoaded() then
	repeat
	until task.wait()
	game:IsLoaded()
end

repeat
	task.wait()
until game.Players.LocalPlayer
repeat
	task.wait()
until game.Players.LocalPlayer.Character

function SendMessage(url, message)
	local http = game:GetService("HttpService")
	local headers = {
		["Content-Type"] = "application/json",
	}
	local data = {
		["content"] = message,
	}
	local body = http:JSONEncode(data)
	local response = request({
		Url = url,
		Method = "POST",
		Headers = headers,
		Body = body,
	})
end

function SendMessageEMBED(url, embed)
	local http = game:GetService("HttpService")
	local headers = {
		["Content-Type"] = "application/json",
	}
	local data = {
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
	local body = http:JSONEncode(data)
	local response = request({
		Url = url,
		Method = "POST",
		Headers = headers,
		Body = body,
	})
end

--Examples
local url =
	"https://discordapp.com/api/webhooks/1503707530185150605/hd-e5XCV_iys_xJlZIiYPYdnOT6blScV5GUaRDkF2xayMInWyTJuZBgWdwl4yRo8e3WY"

local embed = {
	["title"] = "Warp Train",
	["description"] = "",
	["color"] = 65280,
	["fields"] = {
		{
			["name"] = "Backpack",
			["value"] = "",
		},
	},
	["footer"] = {
		["text"] = "",
	},
}

game.Players.LocalPlayer
	:WaitForChild("PlayerGui")
	:WaitForChild("OverlayGui")
	:WaitForChild("Contracts").ChildAdded
	:Connect(function(child)
		local state, err = pcall(function()
			local counts = {}
			for _, item in game.Players.LocalPlayer.Backpack:GetChildren() do
				if item:IsA("Tool") and item:FindFirstChild("ActivateEvent") or item:FindFirstChild("Use") then
					if not counts[item.Name] then
						counts[item.Name] = 1
					else
						counts[item.Name] += 1
					end
				end
			end

			for itemName, amount in counts do
				if itemName:find("First") then
					SendMessage(url, "FKB <@1091197583747207268>")
				end
				embed.fields[1].value = embed.fields[1].value .. itemName .. " x" .. tostring(amount) .. "\n"
			end

			SendMessageEMBED(url, embed)
		end)
	end)
