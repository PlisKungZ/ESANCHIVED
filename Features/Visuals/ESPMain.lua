local ESP = {}

ESP.Settings = {
	TeamCheck = true,
	Red = Color3.fromRGB(255, 0, 0),
	Green = Color3.fromRGB(0, 255, 0),
	Color = Color3.fromRGB(255, 0, 0),
	TeamColor = false,
	TextSize = 15,
	TextColor = Color3.fromRGB(255, 255, 255),
	BoxTransparency = 0.25,
	LineHeight = 17,
}

local activeConnections = {}
local camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")

local function SafeColor(c)
	if typeof(c) == "Color3" then
		return c
	end
	return ESP.Settings.Color
end

local function NewQuad(color)
	local quad = Drawing.new("Quad")
	quad.Visible = false
	quad.PointA = Vector2.new(0, 0)
	quad.PointB = Vector2.new(0, 0)
	quad.PointC = Vector2.new(0, 0)
	quad.PointD = Vector2.new(0, 0)
	quad.Color = SafeColor(color)
	quad.Filled = true
	quad.Thickness = 1
	quad.Transparency = ESP.Settings.BoxTransparency
	return quad
end

local function NewTextLine(color)
	local text = Drawing.new("Text")
	text.Visible = false
	text.Size = ESP.Settings.TextSize
	text.Color = SafeColor(color)
	text.Outline = true
	text.OutlineColor = Color3.fromRGB(0, 0, 0)
	text.Center = true
	return text
end

local function Colorize(color, quads)
	local c = SafeColor(color)
	for _, quad in pairs(quads) do
		quad.Color = c
	end
end

local function SetQuadsVisible(quads, visible)
	for _, quad in pairs(quads) do
		quad.Visible = visible
	end
end

local function RemoveDrawings(drawings)
	for _, d in pairs(drawings) do
		d:Remove()
	end
end

local function UpdateQuads(quads, cf, sX, sY, sZ)
	local function vp(v)
		local p = camera:WorldToViewportPoint(v)
		return Vector2.new(p.X, p.Y)
	end

	local Top1 = vp((cf * CFrame.new(-sX, sY, -sZ)).p)
	local Top2 = vp((cf * CFrame.new(-sX, sY, sZ)).p)
	local Top3 = vp((cf * CFrame.new(sX, sY, sZ)).p)
	local Top4 = vp((cf * CFrame.new(sX, sY, -sZ)).p)
	local Bot1 = vp((cf * CFrame.new(-sX, -sY, -sZ)).p)
	local Bot2 = vp((cf * CFrame.new(-sX, -sY, sZ)).p)
	local Bot3 = vp((cf * CFrame.new(sX, -sY, sZ)).p)
	local Bot4 = vp((cf * CFrame.new(sX, -sY, -sZ)).p)

	quads.quad1.PointA = Top1
	quads.quad1.PointB = Top2
	quads.quad1.PointC = Top3
	quads.quad1.PointD = Top4
	quads.quad2.PointA = Bot1
	quads.quad2.PointB = Bot2
	quads.quad2.PointC = Bot3
	quads.quad2.PointD = Bot4
	quads.quad3.PointA = Top1
	quads.quad3.PointB = Top2
	quads.quad3.PointC = Bot2
	quads.quad3.PointD = Bot1
	quads.quad4.PointA = Top2
	quads.quad4.PointB = Top3
	quads.quad4.PointC = Bot3
	quads.quad4.PointD = Bot2
	quads.quad5.PointA = Top3
	quads.quad5.PointB = Top4
	quads.quad5.PointC = Bot4
	quads.quad5.PointD = Bot3
	quads.quad6.PointA = Top4
	quads.quad6.PointB = Top1
	quads.quad6.PointC = Bot1
	quads.quad6.PointD = Bot4
end

local bindCounter = 0

function ESP.ESPPart(part, options)
	options = options or {}

	local tag = options.tag or "untagged"
	local getLines = options.getLines
	local getColor = options.getColor or function()
		return ESP.Settings.Color
	end
	local isAlive = options.isAlive or function()
		return part and part.Parent ~= nil
	end

	local function safeColor()
		return SafeColor(getColor())
	end

	local quads = {
		quad1 = NewQuad(safeColor()),
		quad2 = NewQuad(safeColor()),
		quad3 = NewQuad(safeColor()),
		quad4 = NewQuad(safeColor()),
		quad5 = NewQuad(safeColor()),
		quad6 = NewQuad(safeColor()),
	}

	local sX = part.Size.X / 2
	local sY = part.Size.Y / 2
	local sZ = part.Size.Z / 2

	local textLines = {}
	local tick = 0

	bindCounter = bindCounter + 1
	local bindName = "ESP_" .. tag .. "_" .. bindCounter

	local function GetOrCreateLine(i)
		if not textLines[i] then
			textLines[i] = NewTextLine(safeColor())
		end
		return textLines[i]
	end

	local function HideAllLines()
		for _, line in ipairs(textLines) do
			line.Visible = false
		end
	end

	local function RemoveAllLines()
		for _, line in ipairs(textLines) do
			line:Remove()
		end
		textLines = {}
	end

	local function Unbind()
		RunService:UnbindFromRenderStep(bindName)
	end

	RunService:BindToRenderStep(
		bindName,
		Enum.RenderPriority.Camera.Value + 1,
		LPH_NO_VIRTUALIZE(function()
			if not isAlive() then
				SetQuadsVisible(quads, false)
				HideAllLines()
				Unbind()
				RemoveDrawings(quads)
				RemoveAllLines()
				return
			end

			tick = tick + 1

			local pos, onScreen = camera:WorldToViewportPoint(part.Position)

			if onScreen then
				local dist = (camera.CFrame.Position - part.Position).Magnitude
				local rate
				if dist > 100 then
					rate = 4
				elseif dist > 50 then
					rate = 2
				else
					rate = 1
				end

				if tick % rate == 0 then
					local cf = part.CFrame
					UpdateQuads(quads, cf, sX, sY, sZ)
					Colorize(safeColor(), quads)

					-- moved inside rate throttle to avoid per-frame allocation/updates
					if getLines then
						local distance = math.floor((camera.CFrame.Position - part.Position).Magnitude)
						local lines = getLines(distance)
						if type(lines) == "table" then
							local topPos = camera:WorldToViewportPoint((part.CFrame * CFrame.new(0, sY + 0.3, 0)).p)
							local startY = topPos.Y - #lines * ESP.Settings.LineHeight - 4

							for i, lineText in ipairs(lines) do
								local line = GetOrCreateLine(i)
								line.Text = tostring(lineText)
								line.Position = Vector2.new(topPos.X, startY + (i - 1) * ESP.Settings.LineHeight)
								line.Visible = true
							end

							for i = #lines + 1, #textLines do
								textLines[i].Visible = false
							end
						end
					end
				end

				SetQuadsVisible(quads, true)
			else
				SetQuadsVisible(quads, false)
				HideAllLines()
			end
		end)
	)

	if not activeConnections[tag] then
		activeConnections[tag] = {}
	end
	table.insert(activeConnections[tag], {
		bindName = bindName,
		drawings = quads,
		textLines = textLines,
		removeLines = RemoveAllLines,
	})
end

function ESP.Disable(tag)
	if not activeConnections[tag] then
		return
	end
	for _, entry in ipairs(activeConnections[tag]) do
		pcall(function()
			RunService:UnbindFromRenderStep(entry.bindName)
		end)
		pcall(function()
			RemoveDrawings(entry.drawings)
		end)
		pcall(function()
			entry.removeLines()
		end)
	end
	activeConnections[tag] = {}
end

function ESP.DisableAll()
	for tag in pairs(activeConnections) do
		ESP.Disable(tag)
	end
end

function ESP.IsEnabled(tag)
	return activeConnections[tag] ~= nil and #activeConnections[tag] > 0
end

return ESP
