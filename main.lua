LPH_NO_VIRTUALIZE(function()
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

local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
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
end

local CharacterTab = require("Menu/Character")
local VisualTab = require("Menu/Visuals")
local AutomationTab = require("Menu/Automation")
local webhookTab = require("Menu/Webhook")
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
