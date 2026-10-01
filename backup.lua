local ReflectionService = game:GetService("ReflectionService")
local ProximityPromptService = game:GetService("ProximityPromptService")

local selfed, methoded
hookmetamethod(
	game,
	"__namecall",
	newcclosure(function(self, ...)
		local method = getnamecallmethod()

		if method == "FireServer" and self.Name == "" then
			selfed = self
			methoded = method
			return self[method](self, nil)
		end

		return self[method](self, ...)
	end)
)

ProximityPromptService.ChildAdded:Connect(function(instance)
	if not selfed and not methoded then
		return
	end
	if instance:IsA("Script") then
		if instance.RunContext == Enum.RunContext.Client then
			instance.Enabled = false
		end
	end
end)

task.spawn(function()
	repeat
		task.wait()
	until selfed and methoded
	for _, instance in getnilinstances() do
		if instance:IsA("Script") then
			if instance.RunContext == Enum.RunContext.Client then
				instance.Enabled = false
			end
		end
	end

	for _, instance in ProximityPromptService:GetChildren() do
		if instance:IsA("Script") then
			if instance.RunContext == Enum.RunContext.Client then
				instance.Enabled = false
			end
		end
	end
	while true do
		task.wait(1)
		selfed[methoded](selfed, nil)
	end
end)
