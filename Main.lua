local player=game.Players.LocalPlayer
local pg=player:WaitForChild("PlayerGui")
local gui=Instance.new("ScreenGui")
gui.Name="X10Luck"
gui.ResetOnSpawn=false
gui.IgnoreGuiInset=true
gui.Parent=pg
local frame=Instance.new("Frame")
frame.Size=UDim2.new(0.4,0,0.5,0)
frame.Position=UDim2.new(0.3,0,0.25,0)
frame.BackgroundColor3=Color3.fromRGB(25,25,25)
frame.BorderSizePixel=0
frame.Visible=false
frame.Parent=gui
local fc=Instance.new("UICorner")
fc.CornerRadius=UDim.new(0,15)
fc.Parent=frame
local title=Instance.new("TextLabel")
title.Size=UDim2.new(1,0,0.15,0)
title.BackgroundTransparency=1
title.Text="x10 LUCK 🔥"
title.TextColor3=Color3.fromRGB(255,200,0)
title.TextScaled=true
title.Font=Enum.Font.GothamBold
title.Parent=frame
local luck=Instance.new("TextLabel")
luck.Size=UDim2.new(0.9,0,0.3,0)
luck.Position=UDim2.new(0.05,0,0.2,0)
luck.BackgroundTransparency=1
luck.Text="x1 (OFF)"
luck.TextColor3=Color3.fromRGB(200,200,200)
luck.TextScaled=true
luck.Font=Enum.Font.Arcade
luck.Parent=frame
local act=Instance.new("TextButton")
act.Size=UDim2.new(0.8,0,0.2,0)
act.Position=UDim2.new(0.1,0,0.55,0)
act.BackgroundColor3=Color3.fromRGB(0,200,0)
act.Text="ON x10!"
act.TextColor3=Color3.new(1,1,1)
act.TextScaled=true
act.Font=Enum.Font.GothamBold
act.Parent=frame
local ac=Instance.new("UICorner")
ac.CornerRadius=UDim.new(0,10)
ac.Parent=act
local tog=Instance.new("TextButton")
tog.Size=UDim2.new(0,70,0,70)
tog.Position=UDim2.new(0.92,0,0.88,0)
tog.BackgroundColor3=Color3.fromRGB(255,80,80)
tog.Text="😈"
tog.TextScaled=true
tog.Font=Enum.Font.GothamBlack
tog.Parent=gui
local tc=Instance.new("UICorner")
tc.CornerRadius=UDim.new(1,0)
tc.Parent=tog
local active=false
local function sound()
local s=Instance.new("Sound")
s.SoundId="rbxassetid://1848354536"
s.Volume=0.8
s.Parent=gui
s:Play()
game.Debris:AddItem(s,3)
end
act.MouseButton1Click:Connect(function()
active=not active
if active then
luck.Text="x10 ACTIVE! 💰"
luck.TextColor3=Color3.fromRGB(255,255,0)
act.Text="OFF"
act.BackgroundColor3=Color3.fromRGB(200,0,0)
sound()
else
luck.Text="x1 (OFF)"
luck.TextColor3=Color3.fromRGB(200,200,200)
act.Text="ON x10!"
act.BackgroundColor3=Color3.fromRGB(0,200,0)
end
end)
tog.MouseButton1Click:Connect(function()
frame.Visible=not frame.Visible
tog.BackgroundColor3=frame.Visible and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,80,80)
end)
