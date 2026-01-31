-- ImGay | Fixed All Bugs - Mobile Friendly | by ThanhLeoCho🚫 🔥
-- Fix: Sóc lọ animate tay bụng + hop, Fly mobile mượt, Tele tween + dập, Nhạc play ok, Bỏ troll/meme
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "ImGay",
   LoadingTitle = "ImGay Fixed",
   LoadingSubtitle = "by ThanhLeoCho🚫 - Mobile OK 2026 🔥",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "ImGayConfig",
      FileName = "ImGayFixed"
   },
   KeySystem = false
})

-- Global vars
_G.Bhop = false
_G.Fly = false
_G.AutoDi = false
_G.SpeedHack = 16
_G.InfJump = false
_G.NoClip = false
_G.FlySpeed = 50

local player = game.Players.LocalPlayer
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local TS = game:GetService("TweenService")

-- Current music sound (for stop)
local currentSound = nil

-- Tab Movement
local MoveTab = Window:CreateTab("🚀 Movement", 4483362458)
MoveTab:CreateSection("Movement Hacks")

-- Sóc Lọ FIXED: Animate tay bụng + hop sóc
spawn(function()
   while true do
      wait(0.1)
      if _G.Bhop and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") then
         local char = player.Character
         local hum = char.Humanoid
         local root = char.HumanoidRootPart
         local rightArm = char:FindFirstChild("RightUpperArm") or char:FindFirstChild("Right Arm")
         
         -- Tay phải đặt lên bụng
         if rightArm then
            local weld = rightArm:FindFirstChildOfClass("Motor6D")
            if weld then
               weld.C0 = CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(90), 0, 0)  -- Tay bụng
            end
         end
         
         -- Hop sóc cao + spin
         hum.JumpPower = 120
         hum.WalkSpeed = 60
         root.Velocity = Vector3.new(root.Velocity.X * 1.1, 50, root.Velocity.Z * 1.1)  -- Hop + speed
         root.AngularVelocity = Vector3.new(0, 10, 0)  -- Spin nhẹ
         
         if hum.FloorMaterial ~= Enum.Material.Air then
            hum.Jump = true
         end
      end
   end
end)

-- Bay FIXED Mobile: Bay theo camera direction, mượt đt
local BV = nil
spawn(function()
   RunService.Heartbeat:Connect(function()
      if _G.Fly and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
         local root = player.Character.HumanoidRootPart
         local cam = workspace.CurrentCamera
         
         if not BV then
            BV = Instance.new("BodyVelocity")
            BV.MaxForce = Vector3.new(4000, 4000, 4000)
            BV.Velocity = Vector3.new(0, 0, 0)
            BV.Parent = root
         end
         
         -- Mobile: Bay forward theo camera + up/down tự động (touch ko cần phím)
         local vel = cam.CFrame.LookVector * _G.FlySpeed
         vel = vel + Vector3.new(0, 0, 0)  -- Adjust nếu cần up/down bằng touch tilt
         BV.Velocity = vel
      else
         if BV then BV:Destroy() BV = nil end
      end
   end)
end)

-- Auto Tele Dí FIXED: Tween smooth + dập (fling down)
spawn(function()
   while true do
      wait(0.5)
      if _G.AutoDi and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
         local root = player.Character.HumanoidRootPart
         local closest, minDist = nil, math.huge
         for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character.Humanoid.Health > 0 then
               local dist = (plr.Character.HumanoidRootPart.Position - root.Position).Magnitude
               if dist < minDist then
                  minDist = dist
                  closest = plr
               end
            end
         end
         if closest then
            -- Tween smooth TP trên đầu
            local tweenInfo = TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            local tween = TS:Create(root, tweenInfo, {CFrame = closest.Character.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)})
            tween:Play()
            tween.Completed:Connect(function()
               -- Dập: Fling down + damage sim
               closest.Character.HumanoidRootPart.Velocity = Vector3.new(0, -100, 0)
               Rayfield:Notify({Title = "ImGay", Content = "Dập " .. closest.Name .. " thành công! 💥", Duration = 2})
            end)
         end
      end
   end
end)

-- Inf Jump + NoClip + Speed (giữ nguyên fix)
UIS.JumpRequest:Connect(function()
   if _G.InfJump then player.Character.Humanoid:ChangeState("Jumping") end
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

-- Toggles
MoveTab:CreateToggle({
   Name = "Sóc Lọ (Tay bụng + Hop)",
   CurrentValue = false,
   Callback = function(Value)
      _G.Bhop = Value
      Rayfield:Notify({Title = "ImGay", Content = Value and "Sóc Lọ ON 🐿️" or "OFF", Duration = 3})
   end
})

MoveTab:CreateToggle({
   Name = "Bay (Mobile Mượt)",
   CurrentValue = false,
   Callback = function(Value)
      _G.Fly = Value
      Rayfield:Notify({Title = "ImGay", Content = Value and "Bay ON ✈️ (Theo camera)" or "OFF", Duration = 3})
   end
})

MoveTab:CreateSlider({
   Name = "Fly Speed",
   Range = {20, 200},
   Increment = 10,
   CurrentValue = 50,
   Callback = function(Value) _G.FlySpeed = Value end
})

MoveTab:CreateToggle({
   Name = "Auto Tele Dí + Dập",
   CurrentValue = false,
   Callback = function(Value)
      _G.AutoDi = Value
      Rayfield:Notify({Title = "ImGay", Content = Value and "Auto Dí ON 💥" or "OFF", Duration = 3})
   end
})

MoveTab:CreateToggle({Name = "NoClip", CurrentValue = false, Callback = function(Value) _G.NoClip = Value end})
MoveTab:CreateToggle({Name = "Infinite Jump", CurrentValue = false, Callback = function(Value) _G.InfJump = Value end})
MoveTab:CreateSlider({
   Name = "Walk Speed",
   Range = {16, 200},
   Increment = 5,
   CurrentValue = 16,
   Callback = function(Value)
      _G.SpeedHack = Value
      if player.Character and player.Character.Humanoid then player.Character.Humanoid.WalkSpeed = Value end
   end
})

-- Tab Nhạc FIXED
local MusicTab = Window:CreateTab("🎵 Nhạc", 4483362458)
MusicTab:CreateSection("Sound Player Fixed")

local songs = {
   ["Blinding Lights"] = "7091664339",
   ["Levitating"] = "6606223785",
   ["Despacito"] = "673605737",
   ["Take On Me"] = "4606705490",
   ["Raining Tacos"] = "142376088",
   ["Good Morning Vietnam"] = "8295016126"
}

local songOptions = {}
for name, id in pairs(songs) do table.insert(songOptions, name .. " - " .. id) end

local selectedID = ""
MusicTab:CreateDropdown({
   Name = "Chọn Nhạc",
   Options = songOptions,
   CurrentOption = songOptions[1],
   Callback = function(Option) selectedID = Option:match("%d+$") end
})

local customID = ""
MusicTab:CreateInput({
   Name = "Custom ID",
   PlaceholderText = "Nhập ID",
   Callback = function(Text) customID = Text end
})

MusicTab:CreateButton({
   Name = "Play",
   Callback = function()
      local id = customID ~= "" and customID or selectedID
      if id == "" then return Rayfield:Notify({Title = "Error", Content = "Chọn ID!", Duration = 3}) end
      
      if currentSound then currentSound:Stop() currentSound:Destroy() end
      
      currentSound = Instance.new("Sound", workspace)
      currentSound.SoundId = "rbxassetid://" .. id
      currentSound.Volume = 5  -- Cao cho nghe rõ
      currentSound.Looped = true
      currentSound:Play()
      
      Rayfield:Notify({Title = "ImGay Music", Content = "Playing " .. id .. " 🔥", Duration = 4})
   end
})

MusicTab:CreateButton({
   Name = "Stop Music",
   Callback = function()
      if currentSound then
         currentSound:Stop()
         currentSound:Destroy()
         currentSound = nil
         Rayfield:Notify({Title = "ImGay", Content = "Stopped! 🔇", Duration = 2})
      end
   end
})

-- Settings
local SettingsTab = Window:CreateTab("⚙️ Settings", 4483362458)
SettingsTab:CreateKeybind({Name = "Menu Key", CurrentKeybind = "RightControl", Callback = function() end})

-- Respawn fix
player.CharacterAdded:Connect(function()
   wait(1)
   if _G.SpeedHack then player.Character.Humanoid.WalkSpeed = _G.SpeedHack end
end)

Rayfield:Notify({
   Title = "ImGay Fixed Loaded!",
   Content = "Tất cả lỗi fix! Sóc lọ tay bụng, bay mobile, dí tween dập, nhạc play ok. Right Ctrl mở 🔥",
   Duration = 6
})

print("ImGay Fixed by ThanhLeoCho🚫 Loaded!")
