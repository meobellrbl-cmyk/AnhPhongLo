local player = game.Players.LocalPlayer
local char = player.CharacterAdded:Connect(function(c) char = c hum = c:WaitForChild("Humanoid") end) or player.Character
local hum = char:WaitForChild("Humanoid")
local gui = Instance.new("ScreenGui")
gui.Name = "ToxicHubFull"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.45, 0, 0.7, 0)
frame.Position = UDim2.new(0.275, 0, 0.15, 0)
frame.BackgroundColor3 = Color3.fromRGB(5, 5, 10)
frame.BackgroundTransparency = 0.4
frame.BorderSizePixel = 0
frame.Visible = false
frame.Parent = gui

local fc = Instance.new("UICorner")
fc.CornerRadius = UDim.new(0, 25)
fc.Parent = frame

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 0, 150)
stroke.Thickness = 6
stroke.Transparency = 0.2
stroke.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.1, 0)
title.BackgroundTransparency = 1
title.Text = "TOXIC XÀM HUB FULL 🗿💦 (Cả Server Thấy!)"
title.TextColor3 = Color3.fromRGB(255, 100, 200)
title.TextScaled = true
title.Font = Enum.Font.GothamBlack
title.Parent = frame

local list = Instance.new("ScrollingFrame")
list.Size = UDim2.new(0.92, 0, 0.78, 0)
list.Position = UDim2.new(0.04, 0, 0.12, 0)
list.BackgroundTransparency = 1
list.ScrollBarThickness = 8
list.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 150)
list.Parent = frame

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 8)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Parent = list

local tog = Instance.new("TextButton")
tog.Size = UDim2.new(0, 85, 0, 85)
tog.Position = UDim2.new(0.92, -42, 0.87, -42)
tog.BackgroundColor3 = Color3.fromRGB(255, 50, 150)
tog.Text = "🗿"
tog.TextScaled = true
tog.Font = Enum.Font.GothamBlack
tog.Parent = gui

local tc = Instance.new("UICorner")
tc.CornerRadius = UDim.new(1, 0)
tc.Parent = tog

local currentAnim

local animations = {
    {name = "1. Sóc Lọ (Jerk Off)", id = "rbxassetid://2315836946", speed = 2.5},
    {name = "2. Trực Thăng (Helicopter)", id = "rbxassetid://180436148", speed = 3.0},
    {name = "3. Twerk Mông", id = "rbxassetid://2897268926
