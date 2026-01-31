local player = game.Players.LocalPlayer
local pg = player:WaitForChild("PlayerGui")
local gui = Instance.new("ScreenGui")
gui.Name = "X10LuckPro"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = pg

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.35, 0, 0.45, 0)
frame.Position = UDim2.new(0.325, 0, 0.275, 0)
frame.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
frame.BackgroundTransparency = 0.5
frame.BorderSizePixel = 0
frame.Visible = false
frame.Parent = gui

local fc = Instance.new("UICorner")
fc.CornerRadius = UDim.new(0, 18)
fc.Parent = frame

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(0, 255, 200)
stroke.Thickness = 4
stroke.Transparency = 0.3
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Parent = frame

local glow = Instance.new("UIGradient")
glow.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(0,255,200)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0,100,255))}
glow.Rotation = 45
glow.Parent = stroke

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.18, 0)
title.BackgroundTransparency = 1
title.Text = "x10 LUCK BOOST 🔥"
title.TextColor3 = Color3.fromRGB(0, 255, 200)
title.TextScaled = true
title.Font = Enum.Font.GothamBlack
title.Parent = frame

local luck = Instance.new("TextLabel")
luck.Size = UDim2.new(0.9, 0, 0.3, 0)
luck.Position = UDim2.new(0.05, 0, 0.2, 0)
luck.BackgroundTransparency = 1
luck.Text = "x1 (OFF)"
luck.TextColor3 = Color3.fromRGB(200, 200, 200)
luck.TextScaled = true
luck.Font = Enum.Font.Arcade
luck.Parent = frame

local act = Instance.new("TextButton")
act.Size = UDim2.new(0.8, 0, 0.2, 0)
act.Position = UDim2.new(0.1, 0, 0.55, 0)
act.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
act.Text = "ACTIVATE x10!"
act.TextColor3 = Color3.new(1,1,1)
act.TextScaled = true
act.Font = Enum.Font.GothamBold
act.Parent = frame

local ac = Instance.new("UICorner")
ac.CornerRadius = UDim.new(0, 12)
ac.Parent = act

local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0, 40, 0, 40)
minBtn.Position = UDim2.new(1, -45, 0, 5)
minBtn.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
minBtn.Text = "-"
minBtn.TextColor3 = Color3.new(1,1,1)
minBtn.Font = Enum.Font.GothamBold
minBtn.Parent = frame

local mc = Instance.new("UICorner")
mc.CornerRadius = UDim.new(1, 0)
mc.Parent = minBtn

local tog = Instance.new("TextButton")
tog.Size = UDim2.new(0, 60, 0, 60)
tog.Position = UDim2.new(0.95, -30, 0.9, -30)
tog.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
tog.Text = "🔥"
tog.TextScaled = true
tog.Font = Enum.Font.GothamBlack
tog.Parent = gui

local tc = Instance.new("UICorner")
tc.CornerRadius = UDim.new(1, 0)
tc.Parent = tog

local active = false
local minimized = false

local function playDramatic()
    local s = Instance.new("Sound")
    s.SoundId = "rbxassetid://184766182"  -- Epic intense victory (longer dramatic)
    s.Volume = 0.9
    s.Looped = false
    s.Parent = gui
    s:Play()
    game.Debris:AddItem(s, 15)
end

local function showNotify(text)
    local notify = Instance.new("TextLabel")
    notify.Size = UDim2.new(0.4, 0, 0.08, 0)
    notify.Position = UDim2.new(0.3, 0, 0.05, 0)
    notify.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    notify.BackgroundTransparency = 0.6
    notify.Text = text
    notify.TextColor3 = Color3.fromRGB(0, 255, 200)
    notify.TextScaled = true
    notify.Font = Enum.Font.GothamBold
    notify.Parent = gui
    local nc = Instance.new("UICorner")
    nc.CornerRadius = UDim.new(0, 10)
    nc.Parent = notify
    local tween = game:GetService("TweenService"):Create(notify, TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.3, 0, -0.1, 0), BackgroundTransparency = 1, TextTransparency = 1})
    tween:Play()
    tween.Completed:Connect(function() notify:Destroy() end)
end

act.MouseButton1Click:Connect(function()
    active = not active
    if active then
        luck.Text = "x10 ACTIVE! 💰🔥"
        luck.TextColor3 = Color3.fromRGB(0, 255, 200)
        act.Text = "DEACTIVATE"
        act.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
        playDramatic()
        showNotify("x10 Luck Activated! 🔥")
    else
        luck.Text = "x1 (OFF)"
        luck.TextColor3 = Color3.fromRGB(200, 200, 200)
        act.Text = "ACTIVATE x10!"
        act.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
    end
end)

minBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        frame.Size = UDim2.new(0, 80, 0, 80)
        frame.Position = UDim2.new(0.9, -80, 0.1, 0)
        title.Visible = false
        luck.Visible = false
        act.Visible = false
        minBtn.Text = "+"
    else
        frame.Size = UDim2.new(0.35, 0, 0.45, 0)
        frame.Position = UDim2.new(0.325, 0, 0.275, 0)
        title.Visible = true
        luck.Visible = true
        act.Visible = true
        minBtn.Text = "-"
    end
end)

-- Draggable
local dragging, dragInput, dragStart, startPos
frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)

frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

tog.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
    tog.BackgroundColor3 = frame.Visible and Color3.fromRGB(0, 255, 100) or Color3.fromRGB(0, 200, 255)
end)

print("x10 Luck Pro loaded! Chạm 🔥 để mở")
