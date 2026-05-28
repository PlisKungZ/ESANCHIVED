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

-- tag -> { entries = { {part, quads, textLines, options, tick, sX, sY, sZ} } }
local tagLoops = {}

local camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")

-- ─── Drawing helpers ────────────────────────────────────────────────────────
local SafeColor = LPH_NO_VIRTUALIZE(function(c)
	return typeof(c) == "Color3" and c or ESP.Settings.Color
end)

local NewQuad = LPH_NO_VIRTUALIZE(function(color)
	local q = Drawing.new("Quad")
	q.Visible = false
	q.PointA = Vector2.zero
	q.PointB = Vector2.zero
	q.PointC = Vector2.zero
	q.PointD = Vector2.zero
	q.Color = SafeColor(color)
	q.Filled = true
	q.Thickness = 1
	q.Transparency = ESP.Settings.BoxTransparency
	return q
end)

local NewTextLine = LPH_NO_VIRTUALIZE(function(color)
	local t = Drawing.new("Text")
	t.Visible = false
	t.Size = ESP.Settings.TextSize
	t.Color = SafeColor(color)
	t.Outline = true
	t.OutlineColor = Color3.fromRGB(0, 0, 0)
	t.Center = true
	return t
end)

local RemoveDrawings = LPH_NO_VIRTUALIZE(function(drawings)
	for _, d in pairs(drawings) do
		d:Remove()
	end
end)

local SetQuadsVisible = LPH_NO_VIRTUALIZE(function(quads, v)
	quads.quad1.Visible = v
	quads.quad2.Visible = v
	quads.quad3.Visible = v
	quads.quad4.Visible = v
	quads.quad5.Visible = v
	quads.quad6.Visible = v
end)

local Colorize = LPH_NO_VIRTUALIZE(function(quads, c)
	quads.quad1.Color = c
	quads.quad2.Color = c
	quads.quad3.Color = c
	quads.quad4.Color = c
	quads.quad5.Color = c
	quads.quad6.Color = c
end)

-- ─── Quad geometry ──────────────────────────────────────────────────────────
local vp = LPH_NO_VIRTUALIZE(function(v)
	local p = camera:WorldToViewportPoint(v)
	return Vector2.new(p.X, p.Y)
end)

local UpdateQuads = LPH_NO_VIRTUALIZE(function(quads, cf, sX, sY, sZ)
	local p = cf.Position
	local rX = cf.RightVector * sX
	local rY = cf.UpVector * sY
	local rZ = cf.LookVector * sZ

	-- 8 corners, built from vectors (no CFrame allocation)
	local Top1 = vp(p - rX + rY - rZ)
	local Top2 = vp(p - rX + rY + rZ)
	local Top3 = vp(p + rX + rY + rZ)
	local Top4 = vp(p + rX + rY - rZ)
	local Bot1 = vp(p - rX - rY - rZ)
	local Bot2 = vp(p - rX - rY + rZ)
	local Bot3 = vp(p + rX - rY + rZ)
	local Bot4 = vp(p + rX - rY - rZ)

	local q1 = quads.quad1
	q1.PointA = Top1
	q1.PointB = Top2
	q1.PointC = Top3
	q1.PointD = Top4

	local q2 = quads.quad2
	q2.PointA = Bot1
	q2.PointB = Bot2
	q2.PointC = Bot3
	q2.PointD = Bot4

	local q3 = quads.quad3
	q3.PointA = Top1
	q3.PointB = Top2
	q3.PointC = Bot2
	q3.PointD = Bot1

	local q4 = quads.quad4
	q4.PointA = Top2
	q4.PointB = Top3
	q4.PointC = Bot3
	q4.PointD = Bot2

	local q5 = quads.quad5
	q5.PointA = Top3
	q5.PointB = Top4
	q5.PointC = Bot4
	q5.PointD = Bot3

	local q6 = quads.quad6
	q6.PointA = Top4
	q6.PointB = Top1
	q6.PointC = Bot1
	q6.PointD = Bot4
end)
-- ─── Internal per-entry update ──────────────────────────────────────────────
local UpdateEntry = LPH_NO_VIRTUALIZE(function(entry, camCF, camPos)
	local part = entry.part

	-- check alive
	if not entry.isAlive() then
		SetQuadsVisible(entry.quads, false)
		for _, l in ipairs(entry.textLines) do
			l.Visible = false
		end
		entry.dead = true
		return
	end

	local partPos = part.Position
	local screenPos, onScreen = camera:WorldToViewportPoint(partPos)

	if not onScreen then
		SetQuadsVisible(entry.quads, false)
		for _, l in ipairs(entry.textLines) do
			l.Visible = false
		end
		return
	end

	-- distance-based throttle
	local dist = (camPos - partPos).Magnitude
	local rate = dist > 100 and 4 or dist > 50 and 2 or 1

	entry.tick = entry.tick + 1
	if entry.tick % rate ~= 0 then
		-- still make quads visible between throttled frames
		SetQuadsVisible(entry.quads, true)
		return
	end

	-- update box
	UpdateQuads(entry.quads, part.CFrame, entry.sX, entry.sY, entry.sZ)
	Colorize(entry.quads, SafeColor(entry.getColor()))
	SetQuadsVisible(entry.quads, true)

	-- update text labels
	if entry.getLines then
		local lines = entry.getLines(math.floor(dist))
		if type(lines) == "table" and #lines > 0 then
			-- reuse cached top-position: screenPos.Y - sY projected
			local topScreen = camera:WorldToViewportPoint(partPos + part.CFrame.UpVector * (entry.sY + 0.3))
			local topX = topScreen.X
			local startY = topScreen.Y - #lines * ESP.Settings.LineHeight - 4

			local textLines = entry.textLines
			for i, lineText in ipairs(lines) do
				local line = textLines[i]
				if not line then
					line = NewTextLine(SafeColor(entry.getColor()))
					textLines[i] = line
				end
				line.Text = tostring(lineText)
				line.Position = Vector2.new(topX, startY + (i - 1) * ESP.Settings.LineHeight)
				line.Visible = true
			end

			-- hide leftover lines
			for i = #lines + 1, #textLines do
				textLines[i].Visible = false
			end
		else
			for _, l in ipairs(entry.textLines) do
				l.Visible = false
			end
		end
	end
end)
-- ─── Tag loop management ────────────────────────────────────────────────────
local EnsureTagLoop = LPH_NO_VIRTUALIZE(function(tag)
	if tagLoops[tag] then
		return
	end

	local loop = { entries = {} }
	tagLoops[tag] = loop

	local bindName = "ESP_Tag_" .. tag

	RunService:BindToRenderStep(bindName, Enum.RenderPriority.Camera.Value + 1, function()
		local entries = loop.entries
		if #entries == 0 then
			return
		end

		local camCF = camera.CFrame
		local camPos = camCF.Position

		local i = 1
		while i <= #entries do
			local entry = entries[i]
			UpdateEntry(entry, camCF, camPos)

			if entry.dead then
				-- clean up and remove from list
				RemoveDrawings(entry.quads)
				for _, l in ipairs(entry.textLines) do
					l:Remove()
				end
				table.remove(entries, i)
				-- don't increment i
			else
				i = i + 1
			end
		end
	end)

	loop.bindName = bindName
end)

-- ─── Public API ─────────────────────────────────────────────────────────────

--[[
	ESP.ESPPart(part, options)

	options = {
		tag      = string,                   -- groups parts into one render loop
		getLines = function(dist) -> table,  -- optional text labels above box
		getColor = function() -> Color3,     -- optional per-frame color
		isAlive  = function() -> bool,       -- when false, entry is removed
	}
]]

ESP.ESPPart = LPH_NO_VIRTUALIZE(function(part, options)
	options = options or {}

	local tag = options.tag or "default"
	local getColor = options.getColor or function()
		return ESP.Settings.Color
	end
	local isAlive = options.isAlive or function()
		return part and part.Parent ~= nil
	end

	local color = SafeColor(getColor())

	local quads = {
		quad1 = NewQuad(color),
		quad2 = NewQuad(color),
		quad3 = NewQuad(color),
		quad4 = NewQuad(color),
		quad5 = NewQuad(color),
		quad6 = NewQuad(color),
	}

	local entry = {
		part = part,
		quads = quads,
		textLines = {},
		getColor = getColor,
		getLines = options.getLines,
		isAlive = isAlive,
		tick = 0,
		dead = false,
		sX = part.Size.X / 2,
		sY = part.Size.Y / 2,
		sZ = part.Size.Z / 2,
	}

	EnsureTagLoop(tag)
	table.insert(tagLoops[tag].entries, entry)
end)

-- Remove all ESP for a given tag
ESP.Disable = LPH_NO_VIRTUALIZE(function(tag)
	local loop = tagLoops[tag]
	if not loop then
		return
	end

	pcall(function()
		RunService:UnbindFromRenderStep(loop.bindName)
	end)

	for _, entry in ipairs(loop.entries) do
		pcall(function()
			RemoveDrawings(entry.quads)
		end)
		pcall(function()
			for _, l in ipairs(entry.textLines) do
				l:Remove()
			end
		end)
	end

	tagLoops[tag] = nil
end)

ESP.DisableAll = LPH_NO_VIRTUALIZE(function()
	for tag in pairs(tagLoops) do
		ESP.Disable(tag)
	end
end)

-- True if tag has at least one live entry

ESP.IsEnabled = LPH_NO_VIRTUALIZE(function()
	return tagLoops[tag] ~= nil and #tagLoops[tag].entries > 0
end)

return ESP
