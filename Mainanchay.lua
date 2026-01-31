--[[ 
████████╗██╗  ██╗ █████╗ ███╗   ██╗██╗  ██╗
╚══██╔══╝██║  ██║██╔══██╗████╗  ██║██║ ██╔╝
   ██║   ███████║███████║██╔██╗ ██║█████╔╝ 
   ██║   ██╔══██║██╔══██║██║╚██╗██║██╔═██╗ 
   ██║   ██║  ██║██║  ██║██║ ╚████║██║  ██╗
   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝

        SCRIPT CỦA THÁNH LẸO CHÓ 🚫
]]

--------------------------------------------------
-- INTRO LOADING
--------------------------------------------------
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ThanhLeoChoIntro"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.fromScale(1,1)
frame.BackgroundColor3 = Color3.fromRGB(10,10,15)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.fromScale(1,0.2)
title.Position = UDim2.fromScale(0,0.4)
title.BackgroundTransparency = 1
title.Text = "SCRIPT CỦA\nTHÁNH LẸO CHÓ 🚫"
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.new(1,1,1)

task.delay(3, function()
    gui:Destroy()
end)

--------------------------------------------------
-- MENU + CHỨC NĂNG
--------------------------------------------------
local Kavo = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"
))()

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local SoundService = game:GetService("SoundService")
local Debris = game:GetService("Debris")

local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

local currentAnim
local currentSound
local rainbowRunning = false
local spamRunning = false

local function notify(t, x, d)
    StarterGui:SetCore("SendNotification", {
        Title = t,
        Text = x,
        Duration = d or 4
    })
end

local Window = Kavo:CreateLib("Script của Thánh Lẹo Chó 🚫", "Ocean")

--------------------------------------------------
-- TAB
--------------------------------------------------
local ToxicTab = Window:NewTab("Toxic Emote")
local ChillTab = Window:NewTab("Chill Music")
local VisualTab = Window:NewTab("Visual")
local SpamTab = Window:NewTab("Spam Troll")

--------------------------------------------------
-- TOXIC EMOTE (NHƯ ẢNH)
--------------------------------------------------
local ToxicSection = ToxicTab:NewSection("Toxic Emote")

local animations = {
    {"Sóc Lọ","rbxassetid://2315836946",2.5},
    {"Trực Thăng","rbxassetid://180436148",3},
    {"Twerk Mông","rbxassetid://2897268926",2},
    {"Lắc Háng","rbxassetid://3360692912",2},
}

for _,v in ipairs(animations) do
    ToxicSection:NewButton(v[1], "Play emote", function()
        if currentAnim then currentAnim:Stop() end
        local anim = Instance.new("Animation")
        anim.AnimationId = v[2]
        currentAnim = hum:LoadAnimation(anim)
        currentAnim.Looped = true
        currentAnim:AdjustSpeed(v[3])
        currentAnim:Play()
        notify("Emote", v[1].." 🗿💦")
    end)
end

ToxicSection:NewButton("Tắt Emote", "Stop", function()
    if currentAnim then currentAnim:Stop() end
end)

--------------------------------------------------
-- CHILL MUSIC (NHƯ ẢNH)
--------------------------------------------------
local ChillSection = ChillTab:NewSection("Chill Music")

local songs = {
    {"Lofi","rbxassetid://1848354536"},
    {"Rain","rbxassetid://9119707213"},
    {"Night","rbxassetid://138081500"}
}

for _,s in ipairs(songs) do
    ChillSection:NewButton(s[1], "Play", function()
        if currentSound then currentSound:Destroy() end
        currentSound = Instance.new("Sound", SoundService)
        currentSound.SoundId = s[2]
        currentSound.Volume = 0.5
        currentSound.Looped = true
        currentSound:Play()
    end)
end

ChillSection:NewSlider("Volume","Âm lượng",100,0,function(v)
    if currentSound then currentSound.Volume = v/100 end
end)

--------------------------------------------------
-- VISUAL (RAINBOW)
--------------------------------------------------
local VisualSection = VisualTab:NewSection("Visual")

VisualSection:NewToggle("Rainbow Glow", "Highlight", function(state)
    rainbowRunning = state
    if state then
        local h = Instance.new("Highlight", char)
        task.spawn(function()
            local t = 0
            while rainbowRunning and h.Parent do
                h.OutlineColor = Color3.fromHSV(t%1,1,1)
                t += 0.02
                task.wait(0.1)
            end
            h:Destroy()
        end)
    else
        local h = char:FindFirstChildOfClass("Highlight")
        if h then h:Destroy() end
    end
end)

--------------------------------------------------
-- SPAM TROLL
--------------------------------------------------
local SpamSection = SpamTab:NewSection("Spam")

SpamSection:NewToggle("Auto Spam", "Fake spam", function(state)
    spamRunning = state
    task.spawn(function()
        while spamRunning do
            notify("Spam","SÓC LỌ 🗿💦",2)
            task.wait(2)
        end
    end)
end)

print("Script của Thánh Lẹo Chó 🚫 | Loaded")
