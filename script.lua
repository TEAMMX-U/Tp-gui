--[[ WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk! ]]
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui

-- Particles Setup
local particlePart = Instance.new("Part")
particlePart.Transparency = 1
particlePart.CanCollide = false
particlePart.Anchored = true
particlePart.Parent = game.Workspace

local attachment = Instance.new("Attachment")
attachment.Parent = particlePart

local emitter = Instance.new("ParticleEmitter")
emitter.Enabled = false
emitter.Texture = "rbxassetid://244221448" 
emitter.Color = ColorSequence.new(Color3.fromRGB(0, 255, 0)) 
emitter.Size = NumberSequence.new(0.5, 0)
emitter.Lifetime = NumberRange.new(0.5, 1)
emitter.Rate = 100
emitter.Speed = NumberRange.new(5, 10)
emitter.SpreadAngle = Vector2.new(360, 360)
emitter.Parent = attachment

-- Create the toggle button
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 25, 0, 25)
toggleButton.Position = UDim2.new(0, 10, 0, 10)
toggleButton.Text = "+"
toggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
toggleButton.Parent = screenGui

-- Create the main menu (Solid Black)
local mainMenu = Instance.new("Frame")
mainMenu.Size = UDim2.new(0, 400, 0, 400)
mainMenu.Position = UDim2.new(0.5, -200, 0.5, -200)
mainMenu.BackgroundTransparency = 0 
mainMenu.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainMenu.Visible = false
mainMenu.Parent = screenGui

-- Added Credit Label
local creditLabel = Instance.new("TextLabel")
creditLabel.Size = UDim2.new(1, 0, 0, 30)
creditLabel.Position = UDim2.new(0, 0, 0, 10)
creditLabel.Text = "by Hayn---/・一一仁＝＝＝sbbskwkqkwbs＝＝＝フ"
creditLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
creditLabel.BackgroundTransparency = 1
creditLabel.TextSize = 14
creditLabel.Parent = mainMenu

-- Create 8 buttons and labels
local labels = { "Main Map", "Mountain 1", "Mountain 2", "Death counter room", "Atomic slash room", "Upper baseplate", "Lower baseplate", "Void" }
local buttons = {}

for i = 1, 8 do 
    local button = Instance.new("TextButton") 
    button.Size = UDim2.new(0, 100, 0, 50) 
    button.Position = UDim2.new(0, ((i-1)%4) * 105, 0, math.floor((i-1)/4) * 55 + 75) 
    button.Text = "" 
    button.BackgroundColor3 = Color3.fromRGB(255, 255, 255) 
    button.Parent = mainMenu 
    
    local label = Instance.new("TextLabel") 
    label.Size = UDim2.new(1, 0, 1, 0) 
    label.Text = labels[i] 
    label.TextColor3 = Color3.fromRGB(0, 0, 0) 
    label.BackgroundTransparency = 1 
    label.TextSize = 10 
    label.Parent = button 
    table.insert(buttons, button)
end

-- Function to toggle menu and fire particles
local function toggleMenu() 
    mainMenu.Visible = not mainMenu.Visible
    if mainMenu.Visible and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        particlePart.Position = player.Character.HumanoidRootPart.Position
        emitter:Emit(30)
    end
end

toggleButton.MouseButton1Click:Connect(toggleMenu)

-- Teleport Logic
local function teleportToPosition(position) 
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then 
        player.Character.HumanoidRootPart.CFrame = CFrame.new(position) 
    end
end

local originalPosition = nil
local baseplateCreated = false

buttons[1].MouseButton1Click:Connect(function() teleportToPosition(Vector3.new(219.81, 437.76, -62.96)) end)
buttons[2].MouseButton1Click:Connect(function() teleportToPosition(Vector3.new(-100.45, 649.84, -381.81)) end)
buttons[3].MouseButton1Click:Connect(function() teleportToPosition(Vector3.new(343.55, 696.10, 370.36)) end)
buttons[4].MouseButton1Click:Connect(function() teleportToPosition(Vector3.new(-35.38, 34.95, 20348.53)) end)
buttons[5].MouseButton1Click:Connect(function() teleportToPosition(Vector3.new(1086.53, 142.31, 23007.97)) end)
buttons[6].MouseButton1Click:Connect(function() teleportToPosition(Vector3.new(1163.84, 402.99, 22901.67)) end)
buttons[7].MouseButton1Click:Connect(function() teleportToPosition(Vector3.new(1144.79, 16.93, 22928.82)) end)
buttons[8].MouseButton1Click:Connect(function() 
    if originalPosition == nil then 
        originalPosition = player.Character.HumanoidRootPart.CFrame.Position 
        teleportToPosition(Vector3.new(-6896.53, 873.40, -6729.34)) 
        if not baseplateCreated then 
            local baseplate = Instance.new("Part") 
            baseplate.Size = Vector3.new(100, 1, 100) 
            baseplate.Position = Vector3.new(-6896.53, 871.40, -6729.34) 
            baseplate.Anchored = true 
            baseplate.Parent = game.Workspace 
            baseplateCreated = true 
        end 
    else 
        teleportToPosition(originalPosition) 
        originalPosition = nil 
    end
end)
