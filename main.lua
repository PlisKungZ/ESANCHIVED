LPH_NO_VIRTUALIZE(function()
	local a = game:GetService("RunService")
	local b = game:GetService("ScriptContext").Error
	task.spawn(function()
		a.RenderStepped:Connect(function()
			for c, d in getconnections(b) do
				local e = d.Function
				if not e then
					continue
				end
				for f, g in getconstants(e) do
					if g ~= "IsStudio" then
						continue
					end
					setconstant(e, f, "IsClient")
				end
			end
		end)
	end)
	--[[ 	repeat
		task.wait()
	until game.Players.LocalPlayer
	repeat
		task.wait()
	until game.Players.LocalPlayer.Character

	local studioLogged
	studioLogged = hookmetamethod(
		game,
		"__namecall",
		newcclosure(function(self, ...)
			local caller = getcallingscript()
			local method = getnamecallmethod()
			if caller and method == "IsStudio" then
				if caller:IsA("Script") and caller.RunContext == Enum.RunContext.Client then
					return studioLogged(self, true)
				end
				return studioLogged(self, ...)
			end

			return studioLogged(self, ...)
		end)
	)

	local loggedFireServer
	loggedFireServer = hookmetamethod(
		game,
		"__namecall",
		newcclosure(function(self, ...)
			local caller = getcallingscript()
			local method = getnamecallmethod()

			if caller and method == "FireServer" then
				if caller:IsA("Script") and caller.RunContext == Enum.RunContext.Client then
					return loggedFireServer(self, nil)
				end
				return loggedFireServer(self, ...)
			end

			return loggedFireServer(self, ...)
		end)
	)
 ]]
	if not game:IsLoaded() then
		repeat
		until task.wait()
		game:IsLoaded()
	end
	--[[ 	repeat
		task.wait()
	until game:GetService("ProximityPromptService")
	game:GetService("ProximityPromptService").ChildAdded:Connect(function(a0)
		print(a0, a0.ClassName)
		if a0:IsA("RemoteEvent") or a0:IsA("UnreliableRemoteEvent") then
			a0:FireServer(nil)
		end
	end)

	game.RunService.Stepped:Connect(function()
		for _, stuff in getnilinstances() do
			if stuff:IsA("Script") and stuff.RunContext == Enum.RunContext.Client and stuff.Enabled then
				stuff.Enabled = false
			end
		end
	end)
 ]]
	--[[ 	hookmetamethod(
		game,
		"__namecall",
		newcclosure(LPH_NO_VIRTUALIZE(function(self, ...)
			local method = getnamecallmethod()

			if method == "FireServer" and self.Name == "" then
				return self[method](self, nil)
			end

			return self[method](self, ...)
		end))
	)
 ]]
	repeat
		task.wait()
	until game.Players.LocalPlayer
	repeat
		task.wait()
	until game.Players.LocalPlayer.Character

	local whiteListedPlaceId = { 99831550635699, 14038329225 }

	if not table.find(whiteListedPlaceId, game.PlaceId) then
		return
	end

	repeat
		task.wait()
	until game.Players.LocalPlayer:FindFirstChild("Data")
	repeat
		task.wait()
	until game.Players.LocalPlayer:FindFirstChild("Data"):FindFirstChild("DataImported")
	repeat
		task.wait()
	until game.Players.LocalPlayer:FindFirstChild("Data"):FindFirstChild("DataImported").Value
end)()

local Library
local SaveManager
local ThemeManager

--[[ local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
api.script_id = "567b6e2c33ab5dd588a8a6b7016eec74"
local status = api.check_key(script_key)
if status.code == "KEY_VALID" then
elseif status.code == "KEY_HWID_LOCKED" then
	game.Players.LocalPlayer:Kick("HWID LOCKED PLEASE RESET YOUR HWID")
	return
elseif status.code == "KEY_INCORRECT" then
	game.Players.LocalPlayer:Kick("KEY INCORRECT")
	return
else
	game.Players.LocalPlayer:Kick("Key check failed:" .. status.message .. " Code: " .. status.code)
	return
end ]]

local CharacterTab = require("./Menu/Character")
local VisualTab = require("./Menu/Visuals")
local AutomationTab = require("./Menu/Automation")
local webhookTab = require("./Menu/Webhook")

LPH_NO_VIRTUALIZE(function()
	local repo = "https://raw.githubusercontent.com/PlisKungZ/Obsidian/main/"
	Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
	SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()
	ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()

	local Window = Library:CreateWindow({
		Title = "Telepathy",
		Footer = "version: 6.7",
		Icon = 93231363609661,
		NotifySide = "Right",
		ShowCustomCursor = true,
	})
	getgenv().GUI = Library
	getgenv().Options = Library.Options
	getgenv().Window = Window
	getgenv().Toggles = Library.Toggles

	CharacterTab.init(GUI, Window)
	VisualTab.init(GUI, Window)
	AutomationTab.init(GUI, Window)
	webhookTab.init()

	local Tabs = {
		["UI Settings"] = Window:AddTab("UI Settings", "settings"),
	}
	local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu", "wrench")

	MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", {
		Default = "RightShift",
		NoUI = true,
		Text = "Menu keybind",
		Callback = function(Value)
			Library.ToggleKeybind = Options.MenuKeybind
		end,
	})

	Library.ToggleKeybind = Options.MenuKeybind

	ThemeManager:SetLibrary(GUI)
	SaveManager:SetLibrary(GUI)

	SaveManager:IgnoreThemeSettings()

	SaveManager:SetIgnoreIndexes({ "MenuKeybind" })

	ThemeManager:SetFolder("TelepathyArchived")
	SaveManager:SetFolder("TelepathyArchived")

	SaveManager:BuildConfigSection(Tabs["UI Settings"])

	ThemeManager:ApplyToTab(Tabs["UI Settings"])

	SaveManager:LoadAutoloadConfig()
	game.Players.LocalPlayer.Idled:Connect(function()
		game:GetService("VirtualUser"):CaptureController()
		game:GetService("VirtualUser"):ClickButton2(Vector2.new())
	end)
end)()
