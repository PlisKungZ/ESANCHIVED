local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Events = ReplicatedStorage:WaitForChild("Events")
local RagdollCancelEvent = Events:WaitForChild("RagdollCancel")

local localPlayer = Players.LocalPlayer

local connection

local autoRagdollCancel = {}

function autoRagdollCancel.on()
	connection = localPlayer.Character.ChildAdded:Connect(function(child)
		if child:IsA("Folder") and child.Name == "Ragdolled" then
			RagdollCancelEvent:FireServer(localPlayer.Character)
		end
	end)
end

function autoRagdollCancel.off()
	if connection then
		connection:Disconnect()
		connection = nil
	end
end

return autoRagdollCancel
