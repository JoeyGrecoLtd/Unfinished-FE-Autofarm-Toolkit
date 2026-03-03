local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

local player = Players.LocalPlayer
local mouse = player:GetMouse()

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AutofarmToolkit"
screenGui.Parent = CoreGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 420, 0, 600)
mainFrame.Position = UDim2.new(0.5, -210, 0.5, -300)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 0, 35)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "FE Autofarm Toolkit"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 22
title.Parent = mainFrame

local noteLabel = Instance.new("TextLabel")
noteLabel.Size = UDim2.new(1, -40, 0, 18)
noteLabel.Position = UDim2.new(0, 0, 0, 33)
noteLabel.BackgroundTransparency = 1
noteLabel.Text = "use with explorer"
noteLabel.TextColor3 = Color3.new(0.6, 0.6, 0.6)
noteLabel.Font = Enum.Font.SourceSansItalic
noteLabel.TextSize = 14
noteLabel.Parent = mainFrame

local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 30, 0, 30)
toggleBtn.Position = UDim2.new(1, -35, 0, 5)
toggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
toggleBtn.Text = "-"
toggleBtn.TextColor3 = Color3.new(1, 1, 1)
toggleBtn.Font = Enum.Font.SourceSansBold
toggleBtn.TextSize = 20
toggleBtn.Parent = mainFrame

local isExpanded = true
local originalSize = UDim2.new(0, 420, 0, 600)
local collapsedSize = UDim2.new(0, 420, 0, 55)

local function createCheckbox(parent, position)
    local checkbox = Instance.new("TextButton")
    checkbox.Size = UDim2.new(0, 20, 0, 20)
    checkbox.Position = position
    checkbox.BackgroundColor3 = Color3.fromRGB(55, 55, 60)
    checkbox.Text = ""
    checkbox.TextColor3 = Color3.new(1, 1, 1)
    checkbox.Font = Enum.Font.SourceSansBold
    checkbox.TextSize = 16
    checkbox.Parent = parent
    
    local checked = false
    checkbox.MouseButton1Click:Connect(function()
        checked = not checked
        checkbox.Text = checked and "X" or ""
        checkbox.BackgroundColor3 = checked and Color3.fromRGB(0, 120, 0) or Color3.fromRGB(55, 55, 60)
    end)
    
    return checkbox, function() return checked end
end

local touchFrame = Instance.new("Frame")
touchFrame.Size = UDim2.new(1, -20, 0, 150)
touchFrame.Position = UDim2.new(0, 10, 0, 55)
touchFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
touchFrame.Parent = mainFrame

local touchLabel = Instance.new("TextLabel")
touchLabel.Size = UDim2.new(1, -10, 0, 28)
touchLabel.Position = UDim2.new(0, 5, 0, 5)
touchLabel.BackgroundTransparency = 1
touchLabel.Text = "Touch Transmitter"
touchLabel.TextColor3 = Color3.new(0.4, 0.8, 1)
touchLabel.Font = Enum.Font.SourceSansBold
touchLabel.TextSize = 20
touchLabel.Parent = touchFrame

local touchNameLabel = Instance.new("TextLabel")
touchNameLabel.Size = UDim2.new(0.4, 0, 0, 25)
touchNameLabel.Position = UDim2.new(0, 5, 0, 38)
touchNameLabel.BackgroundTransparency = 1
touchNameLabel.Text = "Name:"
touchNameLabel.TextColor3 = Color3.new(1, 1, 1)
touchNameLabel.Font = Enum.Font.SourceSans
touchNameLabel.TextSize = 16
touchNameLabel.TextXAlignment = Enum.TextXAlignment.Left
touchNameLabel.Parent = touchFrame

local touchNameBox = Instance.new("TextBox")
touchNameBox.Size = UDim2.new(0.55, 0, 0, 28)
touchNameBox.Position = UDim2.new(0.4, 5, 0, 38)
touchNameBox.BackgroundColor3 = Color3.fromRGB(55, 55, 60)
touchNameBox.TextColor3 = Color3.new(1, 1, 1)
touchNameBox.Font = Enum.Font.SourceSans
touchNameBox.TextSize = 16
touchNameBox.PlaceholderText = "e.g., Coin"
touchNameBox.Parent = touchFrame

local touchParentCheckbox, touchGetParentMode = createCheckbox(touchFrame, UDim2.new(0, 5, 0, 70))
local touchParentLabel = Instance.new("TextLabel")
touchParentLabel.Size = UDim2.new(0.7, 0, 0, 20)
touchParentLabel.Position = UDim2.new(0, 30, 0, 70)
touchParentLabel.BackgroundTransparency = 1
touchParentLabel.Text = "Match Parent Object Name"
touchParentLabel.TextColor3 = Color3.new(1, 1, 1)
touchParentLabel.Font = Enum.Font.SourceSans
touchParentLabel.TextSize = 14
touchParentLabel.TextXAlignment = Enum.TextXAlignment.Left
touchParentLabel.Parent = touchFrame

local touchDelayLabel = Instance.new("TextLabel")
touchDelayLabel.Size = UDim2.new(0.4, 0, 0, 25)
touchDelayLabel.Position = UDim2.new(0, 5, 0, 95)
touchDelayLabel.BackgroundTransparency = 1
touchDelayLabel.Text = "Delay (s):"
touchDelayLabel.TextColor3 = Color3.new(1, 1, 1)
touchDelayLabel.Font = Enum.Font.SourceSans
touchDelayLabel.TextSize = 16
touchDelayLabel.TextXAlignment = Enum.TextXAlignment.Left
touchDelayLabel.Parent = touchFrame

local touchDelayBox = Instance.new("TextBox")
touchDelayBox.Size = UDim2.new(0.2, 0, 0, 28)
touchDelayBox.Position = UDim2.new(0.4, 5, 0, 95)
touchDelayBox.BackgroundColor3 = Color3.fromRGB(55, 55, 60)
touchDelayBox.TextColor3 = Color3.new(1, 1, 1)
touchDelayBox.Font = Enum.Font.SourceSans
touchDelayBox.TextSize = 16
touchDelayBox.Text = "1"
touchDelayBox.Parent = touchFrame

local touchStartBtn = Instance.new("TextButton")
touchStartBtn.Size = UDim2.new(0.25, -5, 0, 28)
touchStartBtn.Position = UDim2.new(0.65, 5, 0, 95)
touchStartBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
touchStartBtn.Text = "Start"
touchStartBtn.TextColor3 = Color3.new(1, 1, 1)
touchStartBtn.Font = Enum.Font.SourceSansBold
touchStartBtn.TextSize = 16
touchStartBtn.Parent = touchFrame

local touchStopBtn = Instance.new("TextButton")
touchStopBtn.Size = UDim2.new(0.25, -5, 0, 28)
touchStopBtn.Position = UDim2.new(0.65, 5, 0, 125)
touchStopBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
touchStopBtn.Text = "Stop"
touchStopBtn.TextColor3 = Color3.new(1, 1, 1)
touchStopBtn.Font = Enum.Font.SourceSansBold
touchStopBtn.TextSize = 16
touchStopBtn.Parent = touchFrame

local touchStatus = Instance.new("TextLabel")
touchStatus.Size = UDim2.new(0.6, 0, 0, 25)
touchStatus.Position = UDim2.new(0, 5, 0, 125)
touchStatus.BackgroundTransparency = 1
touchStatus.Text = "Status: Idle"
touchStatus.TextColor3 = Color3.new(0.7, 0.7, 0.7)
touchStatus.Font = Enum.Font.SourceSans
touchStatus.TextSize = 15
touchStatus.TextXAlignment = Enum.TextXAlignment.Left
touchStatus.Parent = touchFrame

local promptFrame = Instance.new("Frame")
promptFrame.Size = UDim2.new(1, -20, 0, 150)
promptFrame.Position = UDim2.new(0, 10, 0, 215)
promptFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
promptFrame.Parent = mainFrame

local promptLabel = Instance.new("TextLabel")
promptLabel.Size = UDim2.new(1, -10, 0, 28)
promptLabel.Position = UDim2.new(0, 5, 0, 5)
promptLabel.BackgroundTransparency = 1
promptLabel.Text = "Proximity Prompt"
promptLabel.TextColor3 = Color3.new(0.4, 1, 0.4)
promptLabel.Font = Enum.Font.SourceSansBold
promptLabel.TextSize = 20
promptLabel.Parent = promptFrame

local promptNameLabel = Instance.new("TextLabel")
promptNameLabel.Size = UDim2.new(0.4, 0, 0, 25)
promptNameLabel.Position = UDim2.new(0, 5, 0, 38)
promptNameLabel.BackgroundTransparency = 1
promptNameLabel.Text = "Name:"
promptNameLabel.TextColor3 = Color3.new(1, 1, 1)
promptNameLabel.Font = Enum.Font.SourceSans
promptNameLabel.TextSize = 16
promptNameLabel.TextXAlignment = Enum.TextXAlignment.Left
promptNameLabel.Parent = promptFrame

local promptNameBox = Instance.new("TextBox")
promptNameBox.Size = UDim2.new(0.55, 0, 0, 28)
promptNameBox.Position = UDim2.new(0.4, 5, 0, 38)
promptNameBox.BackgroundColor3 = Color3.fromRGB(55, 55, 60)
promptNameBox.TextColor3 = Color3.new(1, 1, 1)
promptNameBox.Font = Enum.Font.SourceSans
promptNameBox.TextSize = 16
promptNameBox.PlaceholderText = "e.g., HarvestPrompt"
promptNameBox.Parent = promptFrame

local promptParentCheckbox, promptGetParentMode = createCheckbox(promptFrame, UDim2.new(0, 5, 0, 70))
local promptParentLabel = Instance.new("TextLabel")
promptParentLabel.Size = UDim2.new(0.7, 0, 0, 20)
promptParentLabel.Position = UDim2.new(0, 30, 0, 70)
promptParentLabel.BackgroundTransparency = 1
promptParentLabel.Text = "Match Parent Object Name"
promptParentLabel.TextColor3 = Color3.new(1, 1, 1)
promptParentLabel.Font = Enum.Font.SourceSans
promptParentLabel.TextSize = 14
promptParentLabel.TextXAlignment = Enum.TextXAlignment.Left
promptParentLabel.Parent = promptFrame

local promptDelayLabel = Instance.new("TextLabel")
promptDelayLabel.Size = UDim2.new(0.4, 0, 0, 25)
promptDelayLabel.Position = UDim2.new(0, 5, 0, 95)
promptDelayLabel.BackgroundTransparency = 1
promptDelayLabel.Text = "Delay (s):"
promptDelayLabel.TextColor3 = Color3.new(1, 1, 1)
promptDelayLabel.Font = Enum.Font.SourceSans
promptDelayLabel.TextSize = 16
promptDelayLabel.TextXAlignment = Enum.TextXAlignment.Left
promptDelayLabel.Parent = promptFrame

local promptDelayBox = Instance.new("TextBox")
promptDelayBox.Size = UDim2.new(0.2, 0, 0, 28)
promptDelayBox.Position = UDim2.new(0.4, 5, 0, 95)
promptDelayBox.BackgroundColor3 = Color3.fromRGB(55, 55, 60)
promptDelayBox.TextColor3 = Color3.new(1, 1, 1)
promptDelayBox.Font = Enum.Font.SourceSans
promptDelayBox.TextSize = 16
promptDelayBox.Text = "1"
promptDelayBox.Parent = promptFrame

local promptStartBtn = Instance.new("TextButton")
promptStartBtn.Size = UDim2.new(0.25, -5, 0, 28)
promptStartBtn.Position = UDim2.new(0.65, 5, 0, 95)
promptStartBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
promptStartBtn.Text = "Start"
promptStartBtn.TextColor3 = Color3.new(1, 1, 1)
promptStartBtn.Font = Enum.Font.SourceSansBold
promptStartBtn.TextSize = 16
promptStartBtn.Parent = promptFrame

local promptStopBtn = Instance.new("TextButton")
promptStopBtn.Size = UDim2.new(0.25, -5, 0, 28)
promptStopBtn.Position = UDim2.new(0.65, 5, 0, 125)
promptStopBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
promptStopBtn.Text = "Stop"
promptStopBtn.TextColor3 = Color3.new(1, 1, 1)
promptStopBtn.Font = Enum.Font.SourceSansBold
promptStopBtn.TextSize = 16
promptStopBtn.Parent = promptFrame

local promptStatus = Instance.new("TextLabel")
promptStatus.Size = UDim2.new(0.6, 0, 0, 25)
promptStatus.Position = UDim2.new(0, 5, 0, 125)
promptStatus.BackgroundTransparency = 1
promptStatus.Text = "Status: Idle"
promptStatus.TextColor3 = Color3.new(0.7, 0.7, 0.7)
promptStatus.Font = Enum.Font.SourceSans
promptStatus.TextSize = 15
promptStatus.TextXAlignment = Enum.TextXAlignment.Left
promptStatus.Parent = promptFrame

local clickFrame = Instance.new("Frame")
clickFrame.Size = UDim2.new(1, -20, 0, 150)
clickFrame.Position = UDim2.new(0, 10, 0, 375)
clickFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
clickFrame.Parent = mainFrame

local clickLabel = Instance.new("TextLabel")
clickLabel.Size = UDim2.new(1, -10, 0, 28)
clickLabel.Position = UDim2.new(0, 5, 0, 5)
clickLabel.BackgroundTransparency = 1
clickLabel.Text = "Click Detector"
clickLabel.TextColor3 = Color3.new(1, 0.6, 0.2)
clickLabel.Font = Enum.Font.SourceSansBold
clickLabel.TextSize = 20
clickLabel.Parent = clickFrame

local clickNameLabel = Instance.new("TextLabel")
clickNameLabel.Size = UDim2.new(0.4, 0, 0, 25)
clickNameLabel.Position = UDim2.new(0, 5, 0, 38)
clickNameLabel.BackgroundTransparency = 1
clickNameLabel.Text = "Name:"
clickNameLabel.TextColor3 = Color3.new(1, 1, 1)
clickNameLabel.Font = Enum.Font.SourceSans
clickNameLabel.TextSize = 16
clickNameLabel.TextXAlignment = Enum.TextXAlignment.Left
clickNameLabel.Parent = clickFrame

local clickNameBox = Instance.new("TextBox")
clickNameBox.Size = UDim2.new(0.55, 0, 0, 28)
clickNameBox.Position = UDim2.new(0.4, 5, 0, 38)
clickNameBox.BackgroundColor3 = Color3.fromRGB(55, 55, 60)
clickNameBox.TextColor3 = Color3.new(1, 1, 1)
clickNameBox.Font = Enum.Font.SourceSans
clickNameBox.TextSize = 16
clickNameBox.PlaceholderText = "e.g., CollectButton"
clickNameBox.Parent = clickFrame

local clickParentCheckbox, clickGetParentMode = createCheckbox(clickFrame, UDim2.new(0, 5, 0, 70))
local clickParentLabel = Instance.new("TextLabel")
clickParentLabel.Size = UDim2.new(0.7, 0, 0, 20)
clickParentLabel.Position = UDim2.new(0, 30, 0, 70)
clickParentLabel.BackgroundTransparency = 1
clickParentLabel.Text = "Match Parent Object Name"
clickParentLabel.TextColor3 = Color3.new(1, 1, 1)
clickParentLabel.Font = Enum.Font.SourceSans
clickParentLabel.TextSize = 14
clickParentLabel.TextXAlignment = Enum.TextXAlignment.Left
clickParentLabel.Parent = clickFrame

local clickDelayLabel = Instance.new("TextLabel")
clickDelayLabel.Size = UDim2.new(0.4, 0, 0, 25)
clickDelayLabel.Position = UDim2.new(0, 5, 0, 95)
clickDelayLabel.BackgroundTransparency = 1
clickDelayLabel.Text = "Delay (s):"
clickDelayLabel.TextColor3 = Color3.new(1, 1, 1)
clickDelayLabel.Font = Enum.Font.SourceSans
clickDelayLabel.TextSize = 16
clickDelayLabel.TextXAlignment = Enum.TextXAlignment.Left
clickDelayLabel.Parent = clickFrame

local clickDelayBox = Instance.new("TextBox")
clickDelayBox.Size = UDim2.new(0.2, 0, 0, 28)
clickDelayBox.Position = UDim2.new(0.4, 5, 0, 95)
clickDelayBox.BackgroundColor3 = Color3.fromRGB(55, 55, 60)
clickDelayBox.TextColor3 = Color3.new(1, 1, 1)
clickDelayBox.Font = Enum.Font.SourceSans
clickDelayBox.TextSize = 16
clickDelayBox.Text = "1"
clickDelayBox.Parent = clickFrame

local clickStartBtn = Instance.new("TextButton")
clickStartBtn.Size = UDim2.new(0.25, -5, 0, 28)
clickStartBtn.Position = UDim2.new(0.65, 5, 0, 95)
clickStartBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
clickStartBtn.Text = "Start"
clickStartBtn.TextColor3 = Color3.new(1, 1, 1)
clickStartBtn.Font = Enum.Font.SourceSansBold
clickStartBtn.TextSize = 16
clickStartBtn.Parent = clickFrame

local clickStopBtn = Instance.new("TextButton")
clickStopBtn.Size = UDim2.new(0.25, -5, 0, 28)
clickStopBtn.Position = UDim2.new(0.65, 5, 0, 125)
clickStopBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
clickStopBtn.Text = "Stop"
clickStopBtn.TextColor3 = Color3.new(1, 1, 1)
clickStopBtn.Font = Enum.Font.SourceSansBold
clickStopBtn.TextSize = 16
clickStopBtn.Parent = clickFrame

local clickStatus = Instance.new("TextLabel")
clickStatus.Size = UDim2.new(0.6, 0, 0, 25)
clickStatus.Position = UDim2.new(0, 5, 0, 125)
clickStatus.BackgroundTransparency = 1
clickStatus.Text = "Status: Idle"
clickStatus.TextColor3 = Color3.new(0.7, 0.7, 0.7)
clickStatus.Font = Enum.Font.SourceSans
clickStatus.TextSize = 15
clickStatus.TextXAlignment = Enum.TextXAlignment.Left
clickStatus.Parent = clickFrame

local globalFrame = Instance.new("Frame")
globalFrame.Size = UDim2.new(1, -20, 0, 60)
globalFrame.Position = UDim2.new(0, 10, 0, 535)
globalFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
globalFrame.Parent = mainFrame

local globalLabel = Instance.new("TextLabel")
globalLabel.Size = UDim2.new(1, -10, 0, 25)
globalLabel.Position = UDim2.new(0, 5, 0, 5)
globalLabel.BackgroundTransparency = 1
globalLabel.Text = "Global Controls"
globalLabel.TextColor3 = Color3.new(1, 0.8, 0.2)
globalLabel.Font = Enum.Font.SourceSansBold
globalLabel.TextSize = 18
globalLabel.Parent = globalFrame

local globalStartBtn = Instance.new("TextButton")
globalStartBtn.Size = UDim2.new(0.45, -5, 0, 28)
globalStartBtn.Position = UDim2.new(0, 5, 0, 30)
globalStartBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
globalStartBtn.Text = "Start All"
globalStartBtn.TextColor3 = Color3.new(1, 1, 1)
globalStartBtn.Font = Enum.Font.SourceSansBold
globalStartBtn.TextSize = 16
globalStartBtn.Parent = globalFrame

local globalStopBtn = Instance.new("TextButton")
globalStopBtn.Size = UDim2.new(0.45, -5, 0, 28)
globalStopBtn.Position = UDim2.new(0.5, 5, 0, 30)
globalStopBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
globalStopBtn.Text = "Stop All"
globalStopBtn.TextColor3 = Color3.new(1, 1, 1)
globalStopBtn.Font = Enum.Font.SourceSansBold
globalStopBtn.TextSize = 16
globalStopBtn.Parent = globalFrame

toggleBtn.MouseButton1Click:Connect(function()
    isExpanded = not isExpanded
    if isExpanded then
        mainFrame.Size = originalSize
        toggleBtn.Text = "-"
        touchFrame.Visible = true
        promptFrame.Visible = true
        clickFrame.Visible = true
        globalFrame.Visible = true
    else
        mainFrame.Size = collapsedSize
        toggleBtn.Text = "+"
        touchFrame.Visible = false
        promptFrame.Visible = false
        clickFrame.Visible = false
        globalFrame.Visible = false
    end
end)

local touchActive = false
local promptActive = false
local clickActive = false
local touchConnection
local promptConnection
local clickConnection
local rootPart = nil

local function getRoot(character)
    return character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso")
end

local function fireTouchInterest(part)
    if not part or not rootPart then return end
    
    local oldPosition = rootPart.CFrame
    rootPart.CFrame = part.CFrame + Vector3.new(0, 2, 0)
    wait(0.1)
    
    if firetouchinterest then
        firetouchinterest(part, rootPart, 1)
        wait(0.05)
        firetouchinterest(part, rootPart, 0)
    else
        part.CFrame = rootPart.CFrame
    end
    
    rootPart.CFrame = oldPosition
end

local function fireProximityPrompt(prompt)
    if not prompt then return end
    
    if fireproximityprompt then
        fireproximityprompt(prompt)
    end
end

local function fireClickDetector(detector)
    if not detector then return end
    
    if fireclickdetector then
        fireclickdetector(detector)
    end
end

local function updateStatus(label, text)
    label.Text = "Status: " .. text
end

local function startTouch()
    if touchActive then return end
    touchActive = true
    updateStatus(touchStatus, "Running...")
    
    local delay = tonumber(touchDelayBox.Text) or 1
    
    touchConnection = RunService.Heartbeat:Connect(function()
        if not touchActive then return end
        
        local character = player.Character
        if not character then return end
        
        rootPart = getRoot(character)
        if not rootPart then return end
        
        local touchName = touchNameBox.Text
        if touchName ~= "" then
            local useParentMode = touchGetParentMode()
            for _, descendant in ipairs(workspace:GetDescendants()) do
                if descendant:IsA("TouchTransmitter") then
                    local match = false
                    if useParentMode then
                        match = descendant.Parent and descendant.Parent.Name == touchName
                    else
                        match = descendant.Name == touchName
                    end
                    if match then
                        fireTouchInterest(descendant.Parent)
                    end
                end
            end
        end
        
        wait(delay)
    end)
end

local function stopTouch()
    touchActive = false
    if touchConnection then
        touchConnection:Disconnect()
        touchConnection = nil
    end
    updateStatus(touchStatus, "Idle")
end

local function startPrompt()
    if promptActive then return end
    promptActive = true
    updateStatus(promptStatus, "Running...")
    
    local delay = tonumber(promptDelayBox.Text) or 1
    
    promptConnection = RunService.Heartbeat:Connect(function()
        if not promptActive then return end
        
        local promptName = promptNameBox.Text
        if promptName ~= "" then
            local useParentMode = promptGetParentMode()
            for _, descendant in ipairs(workspace:GetDescendants()) do
                if descendant:IsA("ProximityPrompt") then
                    local match = false
                    if useParentMode then
                        match = descendant.Parent and descendant.Parent.Name == promptName
                    else
                        match = descendant.Name == promptName
                    end
                    if match then
                        fireProximityPrompt(descendant)
                    end
                end
            end
        end
        
        wait(delay)
    end)
end

local function stopPrompt()
    promptActive = false
    if promptConnection then
        promptConnection:Disconnect()
        promptConnection = nil
    end
    updateStatus(promptStatus, "Idle")
end

local function startClick()
    if clickActive then return end
    clickActive = true
    updateStatus(clickStatus, "Running...")
    
    local delay = tonumber(clickDelayBox.Text) or 1
    
    clickConnection = RunService.Heartbeat:Connect(function()
        if not clickActive then return end
        
        local clickName = clickNameBox.Text
        if clickName ~= "" then
            local useParentMode = clickGetParentMode()
            for _, descendant in ipairs(workspace:GetDescendants()) do
                if descendant:IsA("ClickDetector") then
                    local match = false
                    if useParentMode then
                        match = descendant.Parent and descendant.Parent.Name == clickName
                    else
                        match = descendant.Name == clickName
                    end
                    if match then
                        fireClickDetector(descendant)
                    end
                end
            end
        end
        
        wait(delay)
    end)
end

local function stopClick()
    clickActive = false
    if clickConnection then
        clickConnection:Disconnect()
        clickConnection = nil
    end
    updateStatus(clickStatus, "Idle")
end

touchStartBtn.MouseButton1Click:Connect(startTouch)
touchStopBtn.MouseButton1Click:Connect(stopTouch)

promptStartBtn.MouseButton1Click:Connect(startPrompt)
promptStopBtn.MouseButton1Click:Connect(stopPrompt)

clickStartBtn.MouseButton1Click:Connect(startClick)
clickStopBtn.MouseButton1Click:Connect(stopClick)

globalStartBtn.MouseButton1Click:Connect(function()
    startTouch()
    startPrompt()
    startClick()
end)

globalStopBtn.MouseButton1Click:Connect(function()
    stopTouch()
    stopPrompt()
    stopClick()
end)

player.CharacterAdded:Connect(function(character)
    rootPart = getRoot(character)
end)

if player.Character then
    rootPart = getRoot(player.Character)
end

print("FE Autofarm Toolkit loaded!")
