-- ImGay | Full Universal Troll + Movement + Music + Meme Sticker | by ThanhLeoCho🚫 🔥
-- Update 2026: Draggable, resize, minimize menu + meme random ngáo vl
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "ImGay",
   LoadingTitle = "ImGay",
   LoadingSubtitle = "by ThanhLeoCho🚫 - Meme Ngáo & Party 2026 🔥",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "ImGayConfig",
      FileName = "ImGayFullMeme"
   },
   KeySystem = false
})

-- Meme IDs troll (decal Roblox working)
local memeIDs = {
   "rbxassetid://7072718362",  -- Troll Face
   "rbxassetid://7072721035",  -- Pepe sad
   "rbxassetid://7072724150",  -- Doge wow
   "rbxassetid://7072726532",  -- This is fine
   "rbxassetid://7072728921",  -- Distracted boyfriend
   "rbxassetid://7072731300",  -- Spongebob mocking
   "rbxassetid://7072733679"   -- Change my mind
}

-- Function show random meme sticker
local function ShowRandomMeme()
   local id = memeIDs[math.random(1, #memeIDs)]
   local gui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
   gui.IgnoreGuiInset = true
   
   local frame = Instance.new("Frame", gui)
   frame.Size = UDim2.new(0, 350, 0, 350)
   frame.Position = UDim2.new(0.5, -175, 0.5, -175)
   frame.BackgroundTransparency = 1
   
   local img = Instance.new("ImageLabel", frame)
   img.Size = UDim2.new(1, 0, 1, 0)
   img.BackgroundTransparency = 1
   img.Image = id
   
   wait(5)
   for i = 1, 10 do
      img.ImageTransparency = i/10
      wait(0.08)
   end
   gui:Destroy()
   
   Rayfield:Notify({Title = "ImGay Meme", Content = "Meme sticker random! 😂", Duration = 3})
end

-- Global vars
_G.Bhop = false
_G.Fly = false
_G.Helico = false
_G.AutoTPPlayer = false
_G.SpeedHack = 16
_G.InfJump = false
_G.NoClip = false
_G.FlySpeed = 50
_G.FlingPower = 2000
_G.FlingTarget = "Nearest"

local player = game.Players.LocalPlayer
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Tab Movement
local MoveTab = Window:CreateTab("🚀 Movement", 4483362458)
MoveTab:CreateSection("Movement Hacks")

spawn(function()
   while true do
      RunService.Heartbeat:Wait()
      if _G.Bhop and player.Character and player.Character:FindFirstChild("Humanoid") then
         local hum = player.Character.Humanoid
         hum.WalkSpeed = 80
         hum.JumpPower = 80
         if hum:GetState() == Enum.HumanoidStateType.Landed then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
         end
      end
   end
end)

local BV, BG
spawn(function()
   while true do
      wait()
      if _G.Fly and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
         local root = player.Character.HumanoidRootPart
         if not BV then BV = Instance.new("BodyVelocity", root) BV.MaxForce = Vector3.new(1e9,1e9,1e9) BV.Velocity = Vector3.new() end
         if not BG then BG = Instance.new("BodyGyro", root) BG.MaxTorque = Vector3.new(1e9,1e9,1e9) BG.P = 9e4 end
         BG.CFrame = workspace.CurrentCamera.CFrame
         BV.Velocity = Vector3.new()
      else
         if BV then BV:Destroy() BV = nil end
         if BG then BG:Destroy() BG = nil end
      end
   end
end)

UIS.InputBegan:Connect(function(input)
   if _G.Fly then
      local cam = workspace.CurrentCamera
      local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
      if not root then return end
      local dir = Vector3.new()
      if input.KeyCode == Enum.KeyCode.W then dir = cam.CFrame.LookVector end
      if input.KeyCode == Enum.KeyCode.S then dir = -cam.CFrame.LookVector end
      if input.KeyCode == Enum.KeyCode.A then dir = -cam.CFrame.RightVector end
      if input.KeyCode == Enum.KeyCode.D then dir = cam.CFrame.RightVector end
      if input.KeyCode == Enum.KeyCode.Space then dir = cam.CFrame.UpVector end
      if input.KeyCode == Enum.KeyCode.LeftShift then dir = -cam.CFrame.UpVector end
      if BV then BV.Velocity = dir * _G.FlySpeed end
   end
end)

UIS.InputEnded:Connect(function(input)
   if _G.Fly and BV then
      if input.KeyCode == Enum.KeyCode.W or input.KeyCode == Enum.KeyCode.S or input.KeyCode == Enum.KeyCode.A or input.KeyCode == Enum.KeyCode.D or input.KeyCode == Enum.KeyCode.Space or input.KeyCode == Enum.KeyCode.LeftShift then
         BV.Velocity = Vector3.new()
      end
   end
end)

spawn(function()
   while true do
      wait(0.1)
      if _G.Helico and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
         local root = player.Character.HumanoidRootPart
         local angular = Instance.new("BodyAngularVelocity")
         angular.AngularVelocity = Vector3.new(0, 200, 0)
         angular.MaxTorque = Vector3.new(0, math.huge, 0)
         angular.Parent = root
         game.Debris:AddItem(angular, 0.2)
         for _, part in pairs(player.Character:GetDescendants()) do if part:IsA("BasePart") then part.CanCollide = false end end
      end
   end
end)

spawn(function()
   while true do
      wait(0.3)
      if _G.AutoTPPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
         local root = player.Character.HumanoidRootPart
         local closest, minDist = nil, math.huge
         for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character.Humanoid.Health > 0 then
               if not (player.Team and plr.Team and player.Team == plr.Team) then
                  local dist = (plr.Character.HumanoidRootPart.Position - root.Position).Magnitude
                  if dist < minDist then minDist = dist closest = plr end
               end
            end
         end
         if closest then root.CFrame = closest.Character.HumanoidRootPart.CFrame * CFrame.new(0, 3, 0) end
      end
   end
end)

UIS.JumpRequest:Connect(function()
   if _G.InfJump and player.Character then
      player.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
   end
end)

spawn(function()
   while true do
      wait(0.05)
      if _G.NoClip and player.Character then
         for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
         end
      end
   end
end)

MoveTab:CreateToggle({Name = "Sóc Lọ (Bhop)", CurrentValue = false, Callback = function(Value) _G.Bhop = Value Rayfield:Notify({Title = "ImGay", Content = Value and "ON 🐿️" or "OFF", Duration = 3}) end})
MoveTab:CreateToggle({Name = "Bay (Fly)", CurrentValue = false, Callback = function(Value) _G.Fly = Value Rayfield:Notify({Title = "ImGay", Content = Value and "ON ✈️" or "OFF", Duration = 3}) end})
MoveTab:CreateSlider({Name = "Fly Speed", Range = {20, 300}, Increment = 10, CurrentValue = 50, Callback = function(Value) _G.FlySpeed = Value end})
MoveTab:CreateToggle({Name = "Helicopter (Spin + Noclip)", CurrentValue = false, Callback = function(Value) _G.Helico = Value Rayfield:Notify({Title = "ImGay", Content = Value and "ON 🚁" or "OFF", Duration = 3}) end})
MoveTab:CreateToggle({Name = "Auto Tele Dí Player", CurrentValue = false, Callback = function(Value) _G.AutoTPPlayer = Value Rayfield:Notify({Title = "ImGay", Content = Value and "ON 👊" or "OFF", Duration = 3}) end})
MoveTab:CreateToggle({Name = "NoClip", CurrentValue = false, Callback = function(Value) _G.NoClip = Value Rayfield:Notify({Title = "ImGay", Content = Value and "ON 👻" or "OFF", Duration = 3}) end})
MoveTab:CreateToggle({Name = "Infinite Jump", CurrentValue = false, Callback = function(Value) _G.InfJump = Value end})
MoveTab:CreateSlider({Name = "Walk Speed", Range = {16, 300}, Increment = 5, CurrentValue = 16, Callback = function(Value) _G.SpeedHack = Value if player.Character and player.Character:FindFirstChild("Humanoid") then player.Character.Humanoid.WalkSpeed = Value end end})

-- Tab Troll Ngáo
local TrollTab = Window:CreateTab("😈 Troll Ngáo", 4483362458)
TrollTab:CreateSection("Fling & Meme Sticker")

TrollTab:CreateButton({Name = "Random Meme Sticker (Ngáo Vl)", Callback = ShowRandomMeme})

local function Fling(target)
   if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
      local root = target.Character.HumanoidRootPart
      local old = root.Velocity
      root.Velocity = Vector3.new(math.random(-_G.FlingPower, _G.FlingPower), _G.FlingPower, math.random(-_G.FlingPower, _G.FlingPower))
      wait(0.1)
      root.Velocity = old
      Rayfield:Notify({Title = "ImGay", Content = "Fling " .. target.Name .. " bay vèo! 🚀", Duration = 3})
   end
end

local function FlingAll()
   for _, plr in pairs(Players:GetPlayers()) do if plr ~= player then Fling(plr) end end
   Rayfield:Notify({Title = "ImGay", Content = "Fling ALL! Server ngáo vl 😂", Duration = 4})
end

TrollTab:CreateButton({Name = "Fling All Players (Ngáo Nhất)", Callback = FlingAll})
TrollTab:CreateDropdown({Name = "Fling Target", Options = {"Nearest", "Random", "All (Button above)"}, CurrentOption = "Nearest", Callback = function(Option) _G.FlingTarget = Option end})
TrollTab:CreateButton({Name = "Fling Selected Target", Callback = function()
   local target
   if _G.FlingTarget == "Nearest" then
      local closest, dist = nil, math.huge
      for _, plr in pairs(Players:GetPlayers()) do
         if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local d = (plr.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
            if d < dist then closest = plr dist = d end
         end
      end
      target = closest
   elseif _G.FlingTarget == "Random" then
      local list = {}
      for _, plr in pairs(Players:GetPlayers()) do if plr ~= player then table.insert(list, plr) end end
      if #list > 0 then target = list[math.random(1, #list)] end
   end
   if target then Fling(target) end
end})
TrollTab:CreateSlider({Name = "Fling Power (Càng cao càng bay)", Range = {500, 10000}, Increment = 500, CurrentValue = 2000, Callback = function(Value) _G.FlingPower = Value end})

-- Tab Nhạc
local MusicTab = Window:CreateTab("🎵 Nhạc Việt & Quốc Tế", 4483362458)
MusicTab:CreateSection("Boombox / Sound Player")

local songs = {
   ["Nhạc Việt Nam Classic"] = "2592767512",
   ["Good Morning Vietnam"] = "8295016126",
   ["Blinding Lights - The Weeknd"] = "7091664339",
   ["Levitating - Dua Lipa"] = "6606223785",
   ["Mood - 24kGoldn"] = "5519565135",
   ["Despacito"] = "673605737",
   ["Take On Me"] = "4606705490",
   ["God's Plan - Drake"] = "1665926924",
   ["Raining Tacos"] = "142376088",
   ["Stronger - Kanye West"] = "136209425"
}

local songOptions = {}
for name, id in pairs(songs) do table.insert(songOptions, name .. " - " .. id) end

local selectedID = ""
MusicTab:CreateDropdown({
   Name = "Chọn Nhạc",
   Options = songOptions,
   CurrentOption = songOptions[1] or "No songs",
   Callback = function(Option)
      selectedID = Option:match("%d+$") or ""
      Rayfield:Notify({Title = "ImGay Music", Content = "Selected: " .. Option, Duration = 3})
   end
})

local customID = ""
MusicTab:CreateInput({
   Name = "Nhập Sound ID Custom",
   PlaceholderText = "Paste ID (ví dụ 7091664339)",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text) customID = Text end
})

MusicTab:CreateButton({
   Name = "Play Sound",
   Callback = function()
      local id = customID ~= "" and customID or selectedID
      if id == "" then Rayfield:Notify({Title = "ImGay", Content = "Nhập hoặc chọn ID trước!", Duration = 4}) return end
      
      local soundParent = player.Character and player.Character:FindFirstChild("RightHand") or workspace
      local sound = Instance.new("Sound")
      sound.SoundId = "rbxassetid://" .. id
      sound.Volume = 1
      sound.Looped = true
      sound.Parent = soundParent
      sound:Play()
      
      Rayfield:Notify({Title = "ImGay Music", Content = "Playing " .. id .. " 🔥", Duration = 5})
      game.Debris:AddItem(sound, 300)
   end
})

-- Settings
local SettingsTab = Window:CreateTab("⚙️ Settings", 4483362458)
SettingsTab:CreateKeybind({
   Name = "Menu Keybind",
   CurrentKeybind = "RightControl",
   Callback = function() end
})

-- Meme khi load
spawn(function()
   wait(2)
   ShowRandomMeme()
end)

-- Respawn handler
player.CharacterAdded:Connect(function(char)
   wait(1)
   if _G.SpeedHack then char:WaitForChild("Humanoid").WalkSpeed = _G.SpeedHack end
end)

Rayfield:Notify({
   Title = "ImGay Full Loaded!",
   Content = "by ThanhLeoCho🚫 | Kéo thả, resize, minimize menu nhé! Meme sticker random, fling, nhạc, movement ready 🔥 Right Ctrl mở",
   Duration = 7
})

print("ImGay Full Meme by ThanhLeoCho🚫 Loaded! Copy lên GitHub đi bro!")
