local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local hitFloat = {}
local instance

function hitFloat.on()
	if instance then
		instance:Destroy()
	end
	local folder = Instance.new("Folder")
	folder.Name = "AirTime"
	folder.Parent = localPlayer.Character
	instance = folder
end

function hitFloat.off()
	if instance then
		instance:Destroy()
	end
end

return hitFloat
