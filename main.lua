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
end)()

task.spawn(LPH_NO_VIRTUALIZE(function()
	local Adonis = {
		Name = "Adonis",
		Game = "*",
	}

	local AdonisAnticheatThreads = {}
	function Adonis.Detect()
		if not getreg or not getgc or not isfunctionhooked then
			return false
		end

		local AdonisDetected = false

		for _, thread in getreg() do
			if typeof(thread) ~= "thread" then
				continue
			end

			local Source = debug.info(thread, 1, "s")
			if Source and (Source:match(".Core.Anti") or Source:match(".Plugins.Anti_Cheat")) then
				AdonisDetected = true
				table.insert(AdonisAnticheatThreads, thread)
			end
		end

		return AdonisDetected
	end
	function Adonis.Bypass()
		for _, thread in AdonisAnticheatThreads do
			pcall(coroutine.close, thread)
		end

		local AdonisTables = {}
		if filtergc then
			local ContendorAdonisTables = filtergc("table", {
				Keys = { "Detected", "RLocked" },
			}, false)

			for _, AdonisTable in ContendorAdonisTables do
				if typeof(rawget(AdonisTable, "Detected")) ~= "function" then
					continue
				end
				table.insert(AdonisTables, AdonisTable)
			end
		else
			for _, Table in getgc(true) do
				if typeof(Table) ~= "table" then
					continue
				end

				local IsAdonisOrigin = typeof(rawget(Table, "Detected")) == "function" and rawget(Table, "RLocked")
				if not IsAdonisOrigin then
					continue
				end

				table.insert(AdonisTables, Table)
			end
		end

		for _, Adonis in AdonisTables do
			for _, DetectionFunc in Adonis do
				-- Just in case they already loaded a custom anticheat bypass for adonis
				if typeof(DetectionFunc) ~= "function" or isfunctionhooked(DetectionFunc) then
					continue
				end

				hooks[DetectionFunc] = hookfunction(
					DetectionFunc,
					newcclosure(function(action, info, nocrash)
						coroutine.yield()
						return task.wait(9e9)
					end)
				)
			end
		end

		return true
	end
	repeat
		task.wait()
		Adonis.Detect()
	until Adonis.Bypass()
end))

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

Library = require("GUI/Library")
SaveManager = require("GUI/SaveManager")
ThemeManager = require("GUI/ThemeManager")

local CharacterTab = require("Menu/Character")
local VisualTab = require("Menu/Visuals")
local AutomationTab = require("Menu/Automation")
--[[ local RemovalTab = require("Menu/Removal")
local TrollTab = require("Menu/Troll")
local TeleportationTab = require("Menu/Teleportation")
local AutoOpenCacheTab = require("Menu/AutoOpenCache")
local AutoSellTab = require("Menu/AutoSell") ]]
local webhookTab = require("Menu/Webhook")
local Window = Library:CreateWindow({
	-- Set Center to true if you want the menu to appear in the center
	-- Set AutoShow to true if you want the menu to appear when it is created
	-- Set Resizable to true if you want to have in-game resizable Window
	-- Set MobileButtonsSide to "Left" or "Right" if you want the ui toggle & lock buttons to be on the left or right side of the window
	-- Set ShowCustomCursor to false if you don't want to use the Linoria cursor
	-- NotifySide = Changes the side of the notifications (Left, Right) (Default value = Left)
	-- Position and Size are also valid options here
	-- but you do not need to define them unless you are changing them :)

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
--[[ 	TeleportationTab.init(GUI, Window) ]]
--[[ 	RemovalTab.init(GUI, Window) ]]
--TrollTab.init(GUI, Window)
--[[ 	AutoSellTab.init(GUI, Window)
	AutoOpenCacheTab.init() ]]
local Tabs = {
	["UI Settings"] = Window:AddTab("UI Settings", "settings"),
}

-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
ThemeManager:SetLibrary(GUI)
SaveManager:SetLibrary(GUI)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- Adds our MenuKeybind to the ignore list
-- (do you want each config to have a different menu key? probably not.)
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
ThemeManager:SetFolder("TelepathyArchived")
SaveManager:SetFolder("TelepathyArchived")

-- Builds our config menu on the right side of our tab
SaveManager:BuildConfigSection(Tabs["UI Settings"])

-- Builds our theme menu (with plenty of built in themes) on the left side
-- NOTE: you can also call ThemeManager:ApplyToGroupbox to add it to a specific groupbox
ThemeManager:ApplyToTab(Tabs["UI Settings"])

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
game.Players.LocalPlayer.Idled:Connect(function()
	game:GetService("VirtualUser"):CaptureController()
	game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)
