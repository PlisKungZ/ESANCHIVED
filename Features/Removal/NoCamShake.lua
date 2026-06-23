local Players = game:GetService("Players")

local localPlayer = Players.LocalPlayer

local connection

local noCamShake = {}
local state = false

local foundModules

repeat
	task.wait()

	for _, script in getloadedmodules() do
		if script.Name == "CameraShaker" then
			foundModules = script
		end
	end
until foundModules

local oldShakeOnce
oldShakeOnce = hookfunction(
	require(foundModules)["ShakeOnce"],
	newcclosure(function()
		if Toggles.noRecoil.Value then
			return
		else
			return oldShakeOnce
		end
	end)
)
local oldShakeScreen
oldShakeScreen = hookfunction(
	require(foundModules)["ShakeOnce"],
	newcclosure(function()
		if Toggles.noRecoil.Value then
			return
		else
			return oldShakeOnce
		end
	end)
)

return noCamShake
