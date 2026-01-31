-- ImGay Elite | Tool-based Sóc Lọ + Tween Dí | by ThanhLeoCho🚫 🔥
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "ImGay Elite",
   LoadingTitle = "ImGay Elite",
   LoadingSubtitle = "by ThanhLeoCho🚫 - Tool Mode 2026",
   ConfigurationSaving = {Enabled = true, FolderName = "ImGayElite", FileName = "EliteTool"}
})

local player = game.Players.LocalPlayer
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

-- Global
local currentSound = nil

-- Function tạo tool sóc lọ
local function createSocLoTool()
   local tool = Instance.new("Tool")
   tool.Name = "Sóc Lọ Tool"
   tool.RequiresHandle = false
   tool.Parent = player.Backpack
   
   tool.Equipped:Connect(function()
      Rayfield:Notify({Title = "ImGay", Content = "Cầm sóc lọ → BẬT 🐿️", Duration = 3})
      local conn = RunService.Heartbeat:Connect(function()
         if not tool.Parent then conn:Disconnect() return end
         local char = player.Character
         if not char then return end
         local hum = char.Humanoid
         local root = char.HumanoidRootPart
         
         -- Tay bụng
         local rightArm = char:FindFirstChild("RightUpperArm") or char:FindFirstChild("Right Arm")
         if rightArm then
            local weld = rightArm:FindFirstChildOfClass("Motor6D") or rightArm:FindFirstChildOfClass("Weld")
            if weld then weld.C0 = CFrame.new(0.5, -1, 0) * CFrame.Angles(math.rad(90), 0, 0) end
         end
         
         hum.JumpPower = 120
         hum.WalkSpeed = 60
         root.Velocity = Vector3.new(root.Velocity.X * 1.1, 50, root.Velocity.Z * 1.1)
         root.AngularVelocity = Vector3.new(0, 10, 0)
         if hum:GetState() == Enum.HumanoidStateType.Landed then hum.Jump = true end
      end)
   end)
   
   tool.Unequipped:Connect(function()
      Rayfield:Notify({Title = "ImGay", Content = "Thả sóc lọ → TẮT", Duration = 2})
   end)
   
   return tool
end

-- Function tạo tool Tween Dí
local function createDiTool()
   local tool = Instance.new("Tool")
   tool.Name = "Dí Tool"
   tool.RequiresHandle = false
   tool.Parent = player.Backpack
   
   tool.Equipped:Connect(function()
      Rayfield:Notify({Title = "ImGay", Content = "Cầm dí tool → BẬT dí + dập", Duration = 3})
      local conn = RunService.Heartbeat:Connect(function()
         if not tool.Parent then conn:Disconnect() return end
         local char = player.Character
         if not char or not char:FindFirstChild("HumanoidRootPart") then return end
         local root = char.HumanoidRootPart
         
         local closest, minDist = nil, math.huge
         for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
               local dist = (plr.Character.HumanoidRootPart.Position - root.Position).Magnitude
               if dist < minDist then minDist = dist closest = plr end
            end
         end
         
         if closest then
            local tween = TweenService:Create(root, TweenInfo.new(0.8, Enum.EasingStyle.Quint), {CFrame = closest.Character.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)})
            tween:Play()
            tween.Completed:Connect(function()
               closest.Character.HumanoidRootPart.Velocity = Vector3.new(0, -150, 0)
            end)
         end
      end)
   end)
   
   tool.Unequipped:Connect(function()
      Rayfield:Notify({Title = "ImGay", Content = "Thả dí tool → TẮT", Duration = 2})
   end)
   
   return tool
end

-- Tab Movement
local MoveTab = Window:CreateTab("🚀 Movement", 7072726532)
MoveTab:CreateSection("Tool Controls")

MoveTab:CreateButton({
   Name = "Bật Sóc Lọ (Tạo + Cầm Tool)",
   Callback = function()
      local tool = createSocLoTool()
      player.Character.Humanoid:EquipTool(tool)
   end
})

MoveTab:CreateButton({
   Name = "Bật Auto Dí + Dập (Tạo + Cầm Tool)",
   Callback = function()
      local tool = createDiTool()
      player.Character.Humanoid:EquipTool(tool)
   end
})

-- FlyGuiV3 (giữ nguyên mượt)
-- ... (paste phần toggleFly + BodyVelocity từ code trước nếu cần)

-- Tab Nhạc (giữ)
local MusicTab = Window:CreateTab("🎵 Nhạc", 7072733679)
-- (paste phần play/stop nếu cần)

-- Settings
local SettingsTab = Window:CreateTab("⚙️ Settings", 7072726532)
SettingsTab:CreateKeybind({Name = "Menu Key", CurrentKeybind = "RightControl", Callback = function() end})

Rayfield:Notify({
   Title = "ImGay Elite Tool Loaded!",
   Content = "Nhấn nút 'Bật Sóc Lọ' hoặc 'Bật Auto Dí' → Tạo tool + tự cầm → sóc lọ/dí hoạt động. Thả tool để tắt 🔥",
   Duration = 6
})

print("ImGay Elite Tool Mode by ThanhLeoCho🚫 Loaded!")
