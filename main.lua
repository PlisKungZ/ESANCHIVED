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

				wax.shared.Hooks[DetectionFunc] = wax.shared.Hooking.HookFunction(
					DetectionFunc,
					function(action, info, nocrash)
						coroutine.yield()
						return task.wait(9e9)
					end
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

local GUI
local SaveManager
local InterfaceManager

LPH_NO_VIRTUALIZE(function()
	GUI = require("GUI/main")
	SaveManager = require("GUI/SaveManager")
	InterfaceManager = require("GUI/InterfaceManager")
end)()

local CharacterTab = require("Menu/Character")
local VisualTab = require("Menu/Visuals")
local AutomationTab = require("Menu/Automation")
local RemovalTab = require("Menu/Removal")
local TrollTab = require("Menu/Troll")
local TeleportationTab = require("Menu/Teleportation")
local AutoSellTab = require("Menu/AutoSell")
local webhookTab = require("Menu/Webhook")

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

LPH_NO_VIRTUALIZE(function()
	local Window = GUI:CreateWindow({
		Title = "Telepathy Overload - Paid Edition",
		SubTitle = "by Telepathy",
		TabWidth = 160,
		Size = UDim2.fromOffset(580, 460),
		Acrylic = false,
		Theme = "Rose",
		MinimizeKey = Enum.KeyCode.F8,
	})

	local Options = GUI.Options

	getgenv().Options = Options
	getgenv().GUI = GUI
	getgenv().window = Window

	CharacterTab.init(GUI, Window)
	TeleportationTab.init(GUI, Window)
	VisualTab.init(GUI, Window)
	RemovalTab.init(GUI, Window)
	TrollTab.init(GUI, Window)
	AutoSellTab.init(GUI, Window)
	AutomationTab.init(GUI, Window)
	webhookTab.init()
	local Tabs = {
		Settings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
	}
	-- Addons:
	-- SaveManager (Allows you to have a configuration system)
	-- InterfaceManager (Allows you to have a interface managment system)

	-- Hand the library over to our managers
	SaveManager:SetLibrary(GUI)
	InterfaceManager:SetLibrary(GUI)

	-- Ignore keys that are used by ThemeManager.
	-- (we dont want configs to save themes, do we?)
	SaveManager:IgnoreThemeSettings()

	-- You can add indexes of elements the save manager should ignore
	SaveManager:SetIgnoreIndexes({})

	-- use case for doing it this way:
	-- a script hub could have themes in a global folder
	-- and game configs in a separate folder per game
	InterfaceManager:SetFolder("TelepathyOverload")
	SaveManager:SetFolder("TelepathyOverload/Archived")

	InterfaceManager:BuildInterfaceSection(Tabs.Settings)
	SaveManager:BuildConfigSection(Tabs.Settings)

	Window:SelectTab(1)

	GUI:Notify({
		Title = "Join Our Discord for more stuff!",
		Content = "Invite is set to your clipboard join in.",
		Duration = 8,
	})
	setclipboard("https://discord.gg/8Ae4Axagq6")
	if request then
		request({ Url = "https://discord.gg/8Ae4Axagq6" })
	end
	task.spawn(function()
		while true do
			task.wait(1)

			if GUI.Unloaded then
				for name, option in GUI.Options do
					if typeof(option.Value) == "boolean" then
						option.Value = false
						GUI.Options[name]:SetValue(false)
					end
				end
				break
			end
		end
	end)

	-- You can use the SaveManager:LoadAutoloadConfig() to load a config
	-- which has been marked to be one that auto loads!
	SaveManager:LoadAutoloadConfig()
	getgenv().loaded = true
	game.Players.LocalPlayer.Idled:Connect(function()
		game:GetService("VirtualUser"):CaptureController()
		game:GetService("VirtualUser"):ClickButton2(Vector2.new())
	end)
end)()
