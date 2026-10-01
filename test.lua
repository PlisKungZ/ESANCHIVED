local ErrorConnection = game:GetService("ScriptContext").Error
task.spawn(function()
	local disabled = false
	repeat
		task.wait()
		for _, con in getconnections(ErrorConnection) do
			local hf = con.Function
			if not hf then
				continue
			end
			for i, j in getconstants(hf) do
				if j ~= "IsStudio" then
					continue
				end
				setconstant(hf, i, "IsClient")
				disabled = true
			end
		end
	until disabled
end)
