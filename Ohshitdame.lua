-- ===== WAIT GAME LOAD =====
if not game:IsLoaded() then
	game.Loaded:Wait()
end

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")

local player = Players.LocalPlayer
repeat task.wait() until player:FindFirstChild("PlayerGui")

-- ===== LOAD KAVO UI =====
local Kavo = loadstring(game:HttpGet(
	"https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"
))()

local Window = Kavo:CreateLib("Toxic Chill Hub", "Ocean")

-- ===== PLAYER =====
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

player.CharacterAdded:Connect(function(c)
	char = c
	hum = c:WaitForChild("Humanoid")
end)

-- ===== STATES =====
local currentAnim
local currentSound
local spamRunning = false
local rainbowRunning = false

-- ===== NOTIFY =====
local function notify(t, m)
	pcall(function()
		StarterGui:SetCore("SendNotification", {
			Title = t,
			Text = m,
			Duration = 3
		})
	end)
end

-- =================================================
-- TOXIC EMOTE
-- =================================================
local ToxicTab = Window:NewTab("Toxic Emote")
local ToxicSection = ToxicTab:NewSection("Emotes")

local anims = {
	{name="Sóc Lọ", id="rbxassetid://2315836946", speed=2.5},
	{name="Trực Thăng", id="rbxassetid://180436148", speed=3},
	{name="Twerk", id="rbxassetid://2897268926", speed=2},
	{name="Dí Người", id="rbxassetid://507770677", speed=1.5},
	{name="Fly Pose", id="rbxassetid://2510238624", speed=1},
	{name="Macarena", id="rbxassetid://128778091", speed=1.5},
}

local function playAnim(data)
	if currentAnim then
		currentAnim:Stop()
		currentAnim:Destroy()
	end
	local anim = Instance.new("Animation")
	anim.AnimationId = data.id
	currentAnim = hum:LoadAnimation(anim)
	currentAnim.Looped = true
	currentAnim:AdjustSpeed(data.speed)
	currentAnim:Play()
	notify("Emote", data.name)
end

for _,a in ipairs(anims) do
	ToxicSection:NewButton(a.name, "", function()
		playAnim(a)
	end)
end

ToxicSection:NewButton("Stop Emote", "", function()
	if currentAnim then currentAnim:Stop() end
end)

-- =================================================
-- CHILL MUSIC
-- =================================================
local ChillTab = Window:NewTab("Chill Music")
local ChillSection = ChillTab:NewSection("Local Music")

local songs = {
	{name="Lofi Girl", id="rbxassetid://1848354536"},
	{name="Rain Jazz", id="rbxassetid://9119707213"},
	{name="Chillhop", id="rbxassetid://184766182"},
}

local function playMusic(song)
	if currentSound then
		currentSound:Stop()
		currentSound:Destroy()
	end
	currentSound = Instance.new("Sound")
	currentSound.SoundId = song.id
	currentSound.Volume = 0.5
	currentSound.Looped = true
	currentSound.Parent = SoundService
	currentSound:Play()
	notify("Music", song.name)
end

for _,s in ipairs(songs) do
	ChillSection:NewButton(s.name, "", function()
		playMusic(s)
	end)
end

ChillSection:NewSlider("Volume", "", 100, 0, function(v)
	if currentSound then currentSound.Volume = v/100 end
end)

ChillSection:NewButton("Stop Music", "", function()
	if currentSound then currentSound:Stop() end
end)

-- =================================================
-- FAKE LUCK
-- =================================================
local LuckTab = Window:NewTab("Fake Luck")
local LuckSection = LuckTab:NewSection("Fake Booster")

LuckSection:NewToggle("x10 Luck", "", function(state)
	notify("Luck", state and "x10 ON" or "OFF")
end)

LuckSection:NewButton("Random x5-x100", "", function()
	notify("Luck", "x"..math.random(5,100))
end)

-- =================================================
-- S4 / S8
-- =================================================
local STab = Window:NewTab("S4 & S8")
local SSection = STab:NewSection("Upgrade")

SSection:NewButton("S4 Slow", "", function()
	playAnim({id="rbxassetid://2315836946", speed=1})
end)

SSection:NewButton("S8 Fast", "", function()
	playAnim({id="rbxassetid://2315836946", speed=5})
end)

-- =================================================
-- VISUAL
-- =================================================
local VisualTab = Window:NewTab("Visual")
local VisualSection = VisualTab:NewSection("Effects")

VisualSection:NewToggle("Rainbow Glow", "", function(state)
	rainbowRunning = state
	if state then
		local hl = Instance.new("Highlight")
		hl.Parent = char
		task.spawn(function()
			while rainbowRunning and hl.Parent do
				hl.OutlineColor = Color3.fromHSV(tick()%1,1,1)
				task.wait(0.1)
			end
			if hl then hl:Destroy() end
		end)
	else
		if char:FindFirstChild("Highlight") then
			char.Highlight:Destroy()
		end
	end
end)

-- =================================================
-- SPAM CHAT
-- =================================================
local SpamTab = Window:NewTab("Spam")
local SpamSection = SpamTab:NewSection("Chat Spam")

SpamSection:NewToggle("Auto Spam", "", function(state)
	spamRunning = state
	if state then
		task.spawn(function()
			while spamRunning do
				ReplicatedStorage.DefaultChatSystemChatEvents
					.SayMessageRequest:FireServer("sóc lọ 🗿", "All")
				task.wait(3)
			end
		end)
	end
end)
