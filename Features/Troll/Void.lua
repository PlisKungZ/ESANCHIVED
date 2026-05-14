local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local localPlayer = Players.LocalPlayer

local Void = {}
local voidVelocity = {}
local connection

function Void.on()
	Void.off()
	if setsimulationradius then
		setsimulationradius(math.huge, math.huge)
	else
		sethiddenproperty(localPlayer, "MaxSimulationRadius", 9e9)
		sethiddenproperty(localPlayer, "SimulationRadius", 9e9)
	end
	connection = RunService.Heartbeat:Connect(LPH_NO_VIRTUALIZE(function()
		for _, character in workspace.Alive:GetChildren() do
			if character:FindFirstChild("HumanoidRootPart") and character.Name ~= localPlayer.Name then
				if isnetworkowner(character.HumanoidRootPart) then
					if localPlayer.Character.HumanoidRootPart:FindFirstChild("GrabWeld") then
						localPlayer.Character.HumanoidRootPart:FindFirstChild("GrabWeld"):Destroy()
					end
					if not character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
						local partConstantVelocity = Instance.new("BodyVelocity")
						partConstantVelocity.MaxForce = Vector3.new(1 / 0, 1 / 0, 1 / 0)
						partConstantVelocity.Velocity = Vector3.new(100, -100000, 0)
						partConstantVelocity.P = 1 / 0
						table.insert(voidVelocity, partConstantVelocity)
					end

					-- Set part properties.
					character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(1000, -10000, 0)
					character.HumanoidRootPart.Position =
						Vector3.new(character.HumanoidRootPart.Position.X, -4000, character.HumanoidRootPart.Position.Z)
					character.HumanoidRootPart.CanCollide = false

					-- Stop part from sleeping.
					sethiddenproperty(character.HumanoidRootPart, "NetworkIsSleeping", false)
				end
			end
		end
	end))
	for _, velocity in voidVelocity do
		velocity:Destroy()
		velocity = nil
	end
end

function Void.off()
	if connection then
		connection:Disconnect()
		connection = nil
	end
end

return Void
