-- Loading Screen (Thanh % chạy)
print("Loading Redz-Inspired Toxic Chill Hub... [0%]")
wait(0.3)
print("Loading Kavo UI & Services... [20%]")
wait(0.4)
print("Preparing Toxic Emotes... [40%]")
wait(0.3)
print("Adding Chill Music & Fake Features... [60%]")
wait(0.4)
print("Setting up S4 S8 Upgrade & Visuals... [80%]")
wait(0.3)
print("Finalizing Spam Troll & Notify... [100%]")
wait(0.2)
print("Hub Loaded Successfully! 🗿💦")

-- Load Kavo UI
local Kavo = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Kavo:CreateLib("Redz-Inspired Toxic Chill Hub 🗿💦", "Ocean")

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

local currentAnim = nil
local currentSound = nil
local spamRunning = false

-- Helper Notify
local function notify(title, text)
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = title, Text = text, Duration = 5})
end

-- Tab Toxic Emote
local ToxicTab = Window:NewTab("Toxic Emote")
local ToxicSection = ToxicTab:NewSection("Toxic Emotes (Server thấy)")
local anims = {
    {name = "Sóc Lọ", id = "rbxassetid://2315836946", speed = 2.5},
    {name = "Trực Thăng", id = "rbxassetid://180436148", speed = 3.0},
    {name = "Twerk Mông", id = "rbxassetid://2897268926", speed = 2.0},
    {name = "Dí Dí Người", id = "rbxassetid://507770677", speed = 1.5},
    {name = "Fly Pose", id = "rbxassetid://2510238624", speed = 1.0},
    {name = "Lắc Háng", id = "rbxassetid://3360692912", speed = 2.0},
    {name = "Dance Xàm", id = "rbxassetid://507776043", speed = 1.8},
    {name = "Macarena", id = "rbxassetid://128778091", speed = 1.5},
    {name = "Random Xàm", id = "rbxassetid://507771019", speed = math.random(1,4)}
}

for _, data in ipairs(anims) do
    ToxicSection:NewButton(data.name, "Bật emote", function()
        if currentAnim then currentAnim:Stop() end
        local anim = Instance.new("Animation")
        anim.AnimationId = data.id
        currentAnim = hum:LoadAnimation(anim)
        currentAnim.Looped = true
        currentAnim:AdjustSpeed(data.speed)
        currentAnim:Play()
        notify("Emote", data.name .. " Activated! 🗿💦")
    end)
end

ToxicSection:NewButton("Tắt Emote", "Stop animation", function()
    if currentAnim then currentAnim:Stop() end
    notify("Emote", "Tắt hết")
end)

-- Tab Chill Music
local ChillTab = Window:NewTab("Chill Music")
local ChillSection = ChillTab:NewSection("Nhạc Chill (Local)")
local songs = {
    {name = "Lofi Girl", id = "rbxassetid://1848354536"},
    {name = "Rain Jazz", id = "rbxassetid://9119707213"},
    {name = "Chillhop", id = "rbxassetid://184766182"}
}

for _, song in ipairs(songs) do
    ChillSection:NewButton(song.name, "Phát nhạc", function()
        if currentSound then currentSound:Stop() currentSound:Destroy() end
        currentSound = Instance.new("Sound")
        currentSound.SoundId = song.id
        currentSound.Volume = 0.5
        currentSound.Looped = true
        currentSound.Parent = game:GetService("SoundService")
        currentSound:Play()
        notify("Music", "Playing: " .. song.name .. " 🎧")
    end)
end

ChillSection:NewSlider("Volume", "Âm lượng", 100, 0, function(v)
    if currentSound then currentSound.Volume = v/100 end
end)

ChillSection:NewToggle("Pause/Play", "Tạm dừng / Tiếp tục", function(state)
    if currentSound then
        if state then currentSound:Pause() else currentSound:Play() end
    end
end)

-- Tab Fake Luck
local LuckTab = Window:NewTab("Fake Luck")
local LuckSection = LuckTab:NewSection("Fake Booster")
LuckSection:NewToggle("x10 Luck Fake", "", function(state)
    notify("Luck", state and "x10 ON 💰" or "OFF")
end)

LuckSection:NewButton("Random x5-x100", "", function()
    notify("Luck", "x" .. math.random(5,100) .. " 🎲")
end)

-- Tab Fake Fruit
local NotifierTab = Window:NewTab("Fake Fruit")
local NotifierSection = NotifierTab:NewSection("Fake Spawn")
NotifierSection:NewButton("Fake Spawn", "", function()
    local fruits = {"Kitsune","Leopard","Dragon"}
    local fruit = fruits[math.random(#fruits)]
    notify("Fruit", fruit .. " Spawned! 🍉")
end)

-- Tab S4 S8
local STab = Window:NewTab("S4 & S8")
local SSection = STab:NewSection("Sóc Lọ Pro")
SSection:NewButton("S4 Slow Tease", "", function()
    if currentAnim then currentAnim:Stop() end
    local anim = Instance.new("Animation")
    anim.AnimationId = "rbxassetid://2315836946"
    currentAnim = hum:LoadAnimation(anim)
    currentAnim.Looped = true
    currentAnim:AdjustSpeed(1.0)
    currentAnim:Play()
    notify("S4", "Slow Tease 🗿")
end)

SSection:NewButton("S8 Super Fast", "", function()
    if currentAnim then currentAnim:Stop() end
    local anim = Instance.new("Animation")
    anim.AnimationId = "rbxassetid://619521311"
    currentAnim = hum:LoadAnimation(anim)
    currentAnim.Looped = true
    currentAnim:AdjustSpeed(5.0)
    currentAnim:Play()
    notify("S8", "Fast Finish 💦")
end)

-- Tab Visual
local VisualTab = Window:NewTab("Visual")
local VisualSection = VisualTab:NewSection("Hiệu ứng Local")
VisualSection:NewToggle("Rainbow Glow", "", function(state)
    if state then
        local hl = Instance.new("Highlight")
        hl.FillTransparency = 0.5
        hl.OutlineTransparency = 0
        hl.Parent = char
        task.spawn(function()
            while hl.Parent do
                hl.OutlineColor = Color3.fromHSV(tick() % 1, 1, 1)
                task.wait(0.1)
            end
        end)
        notify("Visual", "Rainbow Glow ON 🌈")
    else
        if char:FindFirstChild("Highlight") then char.Highlight:Destroy() end
        notify("Visual", "Rainbow Glow OFF")
    end
end)

-- Tab Spam
local SpamTab = Window:NewTab("Spam")
local SpamSection = SpamTab:NewSection("Spam Chat")
SpamSection:NewToggle("Auto Spam 'Sóc Lọ'", "", function(state)
    spamRunning = state
    if state then
        task.spawn(function()
            while spamRunning do
                ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("sóc lọ cho đã 🗿💦", "All")
                task.wait(3)
            end
        end)
        notify("Spam", "Auto Spam ON")
    else
        notify("Spam", "Auto Spam OFF")
    end
end)

-- Loading complete & credit
print("Redz-Inspired Hub Loaded Successfully! 🗿💦")
print("Script được làm Bởi Thánh Lẹo Chó🚫")
