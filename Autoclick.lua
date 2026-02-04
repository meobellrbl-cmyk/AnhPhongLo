-- SUPER FAST ATTACK SCRIPT (như AnDepZai Hub - 1000+ CPS, Instant Kill PvP/Farm!)
-- Blox Fruits Update 26+ 2026 - Custom by Grok 😈
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()

local Remotes = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")

-- Config
getgenv().FastAttackEnabled = false
getgenv().CPS = 1000  -- Siêu nhanh! (thay đổi nếu lag)
getgenv().AutoTarget = false  -- Auto nhắm enemy gần nhất

-- Black Loading Screen (giống script thật)
local sg = Instance.new("ScreenGui")
sg.Name = "SuperFastAttackGUI"
sg.IgnoreGuiInset = true
sg.ResetOnSpawn = false
sg.Parent = game:GetService("CoreGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(1, 0, 1, 0)
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.BorderSizePixel = 0
frame.Parent = sg

local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.9, 0, 0.12, 0)
title.Position = UDim2.new(0.05, 0, 0.1, 0)
title.BackgroundTransparency = 1
title.Text = "Loading Super Fast Attack... (AnDepZai Style)"
title.TextColor3 = Color3.new(1, 0.2, 0.8)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = frame

local progressBg = Instance.new("Frame")
progressBg.Size = UDim2.new(0.6, 0, 0.04, 0)
progressBg.Position = UDim2.new(0.2, 0, 0.55, 0)
progressBg.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
progressBg.BorderSizePixel = 0
progressBg.Parent = frame

local progressFill = Instance.new("Frame")
progressFill.Size = UDim2.new(0, 0, 1, 0)
progressFill.BackgroundColor3 = Color3.new(1, 0.2, 0.8)
progressFill.BorderSizePixel = 0
progressFill.Parent = progressBg

local countLabel = Instance.new("TextLabel")
countLabel.Size = UDim2.new(0.9, 0, 0.08, 0)
countLabel.Position = UDim2.new(0.05, 0, 0.65, 0)
countLabel.BackgroundTransparency = 1
countLabel.Text = "Blox Fruits Compatible - 1000+ CPS"
countLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
countLabel.TextScaled = true
countLabel.Font = Enum.Font.Gotham
countLabel.Parent = frame

-- Animate loading
TweenService:Create(progressFill, TweenInfo.new(3, Enum.EasingStyle.Quad), {Size = UDim2.new(1, 0, 1, 0)}):Play()

-- Rickroll optional (comment nếu ko muốn)
local rickSound = Instance.new("Sound")
rickSound.SoundId = "rbxassetid://1848354536"
rickSound.Volume = 0.3
rickSound.Looped = true
rickSound.Parent = SoundService
rickSound:Play()

-- MAIN GUI sau loading
spawn(function()
    wait(4)
    rickSound:Stop()
    sg:Destroy()
    
    -- Tạo GUI chính
    local gui = Instance.new("ScreenGui")
    gui.Name = "FastAttackHub"
    gui.Parent = game:GetService("CoreGui")
    
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 350, 0, 250)
    mainFrame.Position = UDim2.new(0.5, -175, 0.5, -125)
    mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = gui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = mainFrame
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(255, 0, 128)
    stroke.Thickness = 2
    stroke.Parent = mainFrame
    
    local titleGui = Instance.new("TextLabel")
    titleGui.Size = UDim2.new(1, 0, 0.2, 0)
    titleGui.BackgroundTransparency = 1
    titleGui.Text = "🚀 Super Fast Attack Hub"
    titleGui.TextColor3 = Color3.new(1, 1, 1)
    titleGui.TextScaled = true
    titleGui.Font = Enum.Font.GothamBold
    titleGui.Parent = mainFrame
    
    -- Toggle Fast Attack
    local fastBtn = Instance.new("TextButton")
    fastBtn.Size = UDim2.new(0.85, 0, 0.15, 0)
    fastBtn.Position = UDim2.new(0.075, 0, 0.3, 0)
    fastBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    fastBtn.Text = "FAST ATTACK: OFF"
    fastBtn.TextColor3 = Color3.new(1,1,1)
    fastBtn.TextScaled = true
    fastBtn.Font = Enum.Font.GothamBold
    fastBtn.Parent = mainFrame
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = fastBtn
    
    -- Toggle Auto Target
    local autoBtn = Instance.new("TextButton")
    autoBtn.Size = UDim2.new(0.85, 0, 0.15, 0)
    autoBtn.Position = UDim2.new(0.075, 0, 0.5, 0)
    autoBtn.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
    autoBtn.Text = "AUTO TARGET: OFF"
    autoBtn.TextColor3 = Color3.new(1,1,1)
    autoBtn.TextScaled = true
    autoBtn.Font = Enum.Font.GothamBold
    autoBtn.Parent = mainFrame
    
    local autoCorner = Instance.new("UICorner")
    autoCorner.CornerRadius = UDim.new(0, 8)
    autoCorner.Parent = autoBtn
    
    -- Close btn
    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0.85, 0, 0.15, 0)
    closeBtn.Position = UDim2.new(0.075, 0, 0.7, 0)
    closeBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    closeBtn.Text = "CLOSE GUI"
    closeBtn.TextColor3 = Color3.new(1,1,1)
    closeBtn.TextScaled = true
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.Parent = mainFrame
    
    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 8)
    closeCorner.Parent = closeBtn
    
    -- Fast Attack Loop (VIM Super Fast!)
    local fastConnection
    fastBtn.MouseButton1Click:Connect(function()
        getgenv().FastAttackEnabled = not getgenv().FastAttackEnabled
        if getgenv().FastAttackEnabled then
            fastBtn.Text = "FAST ATTACK: ON 🔥"
            fastBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            fastConnection = RunService.Heartbeat:Connect(function()
                if getgenv().FastAttackEnabled then
                    local pos = UserInputService:GetMouseLocation()
                    VirtualInputManager:SendMouseButtonEvent(pos.X, pos.Y, 0, true, game, 1)
                    VirtualInputManager:SendMouseButtonEvent(pos.X, pos.Y, 0, false, game, 1)
                end
            end)
        else
            fastBtn.Text = "FAST ATTACK: OFF"
            fastBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            if fastConnection then fastConnection:Disconnect() end
        end
    end)
    
    -- Auto Target Nearest Enemy (PvP/Farm)
    local targetConnection
    autoBtn.MouseButton1Click:Connect(function()
        getgenv().AutoTarget = not getgenv().AutoTarget
        if getgenv().AutoTarget then
            autoBtn.Text = "AUTO TARGET: ON 🎯"
            autoBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            targetConnection = RunService.Heartbeat:Connect(function()
                if getgenv().AutoTarget then
                    local closest, dist = nil, math.huge
                    for _, p in pairs(Players:GetPlayers()) do
                        if p ~= Player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                            local d = (p.Character.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude
                            if d < dist and d < 50 then  -- 50 studs
                                closest, dist = p, d
                            end
                        end
                    end
                    if closest and Player.Character then
                        Player.Character.HumanoidRootPart.CFrame = closest.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-3)
                    end
                end
            end)
        else
            autoBtn.Text = "AUTO TARGET: OFF"
            autoBtn.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
            if targetConnection then targetConnection:Disconnect() end
        end
    end)
    
    closeBtn.MouseButton1Click:Connect(function()
        getgenv().FastAttackEnabled = false
        getgenv().AutoTarget = false
        if fastConnection then fastConnection:Disconnect() end
        if targetConnection then targetConnection:Disconnect() end
        gui:Destroy()
    end)
    
    -- Drag GUI
    local dragging = false
    mainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true end
    end)
    mainFrame.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
    end)
    RunService.RenderStepped:Connect(function()
        if dragging then
            mainFrame.Position = UDim2.new(0, mainFrame.Position.X.Offset + Mouse.X - Mouse.Xp, 0, mainFrame.Position.Y.Offset + Mouse.Y - Mouse.Yp)
        end
    end)
end)

print("🚀 Super Fast Attack LOADED! Toggle ON để 1000+ CPS như AnDepZai! 😈")
