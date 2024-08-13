local hitboxSize = 0 -- to change the football size

-- Function to resize parts
local function resizePart(part)
    if part:IsA("BasePart") and (part.Name == "Football" or part.Name == "FootballBasePart") then
        part.Size = Vector3.new(hitboxSize, hitboxSize, hitboxSize)
    end
end

Workspace.ChildAdded:Connect(function(child)
    resizePart(child)
end)

for _, child in pairs(Workspace:GetChildren()) do
    resizePart(child)
end


local Luxtl = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Luxware-UI-Library/main/Source.lua"))()

local Luxt = Luxtl.CreateWindow("Ronny Hub", 6105620301)

--tabs
local wr = Luxt:Tab("Catching")
local p1 = Luxt:Tab("Player")
local db = Luxt:Tab("Defense")
local vis = Luxt:Tab("Visual")

--sections
local sec1 = wr:Section("Magnets")
local sec2 = p1:Section("Settings")
local sec3 = p1:Section("Physics")
local sec4 = db:Section("Defense")
local sec5 = vis:Section("Visualizer")

--buttons
sec1:Button("Normal Magnet", function()
    hitboxSize = 10
end)

sec1:Button("Balant Magnet", function()
    hitboxSize = 17
end)

sec1:Button("Legit Magnet", function()
    hitboxSize = 25
end)

sec2:Button("Normal WS", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 20
end)

sec2:Button("Balant WS", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 21
end)

sec2:Button("Legit WS", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 23
end)

sec2:Button("Normal JP", function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
end)

sec2:Button("Balant JP", function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 55
end)

sec2:Button("Legit JP", function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 60
end)

sec2:Button("Fake Angle", function()
    -- LocalScript placed in StarterPlayerScripts

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local originalJumpPower = humanoid.JumpPower
local temporaryJumpPower = 65
local resetDelay = 0.1 -- Time in seconds before resetting the jump power

-- Create UI elements for the indicator
local function createIndicator()
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "JumpPowerIndicator"
	screenGui.Parent = player:WaitForChild("PlayerGui")

	local frame = Instance.new("Frame")
	frame.Name = "IndicatorFrame"
	frame.Size = UDim2.new(1, 0, 0, 20) -- Full width, 20 pixels high
	frame.Position = UDim2.new(0, 0, 0, -40) -- Centered horizontally, 40 pixels from top
	frame.BackgroundColor3 = Color3.new(0, 0, 0) -- Black color
	frame.Visible = true -- Initially hidden
	frame.Parent = screenGui

	local textLabel = Instance.new("TextLabel")
	textLabel.Name = "IndicatorText"
	textLabel.Size = UDim2.new(1, 0, 1, 0) -- Full size of the frame
	textLabel.Position = UDim2.new(0, 0, 0, 3) -- Cover the entire frame
	textLabel.BackgroundTransparency = 1
	textLabel.TextColor3 = Color3.new(1, 1, 1) -- White color
	textLabel.TextScaled = true
	textLabel.TextStrokeTransparency = 0.8
	textLabel.Text = ""
	textLabel.Parent = frame

	return frame, textLabel
end

local indicator, textLabel = createIndicator()

-- Function to handle the key press
local function onKeyPress(input, gameProcessedEvent)
	if gameProcessedEvent then return end

	if input.KeyCode == Enum.KeyCode.Space and UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
		humanoid.JumpPower = temporaryJumpPower
		indicator.Visible = true -- Show the indicator
		textLabel.Text = "Angled!" -- Set text when jump power is 80
		wait(1)
		humanoid.JumpPower = originalJumpPower
		indicator.Visible = true -- Hide the indicator
		textLabel.Text = "" -- Clear text when jump power is reset
	end
end

-- Connect the input action to the function
UserInputService.InputBegan:Connect(onKeyPress)

end)

sec3:Button("Enable Anti Jam", function()
    -- Make sure this script runs in a LocalScript, which should be placed in StarterPlayerScripts or StarterCharacterScripts

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Disable collision with other players
local function setCollisionDisabled()
    -- Wait for character to fully load
    while not character:FindFirstChild("HumanoidRootPart") do
        character.ChildAdded:Wait()
    end

    local humanoidRootPart = character.HumanoidRootPart
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
        end
    end

    -- Optionally, disable collisions with other players' characters too
    game:GetService("Players").PlayerAdded:Connect(function(otherPlayer)
        otherPlayer.CharacterAdded:Connect(function(otherCharacter)
            for _, part in pairs(otherCharacter:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end)
    end)
end

-- Execute collision change
setCollisionDisabled()

end)

sec3:Button("Disable Anti Jam", function()
    -- Make sure this script runs in a LocalScript, which should be placed in StarterPlayerScripts or StarterCharacterScripts

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Enable collision with other players
local function setCollisionEnabled()
    -- Wait for character to fully load
    while not character:FindFirstChild("HumanoidRootPart") do
        character.ChildAdded:Wait()
    end

    local humanoidRootPart = character.HumanoidRootPart
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = true
        end
    end

    -- Optionally, ensure collisions with other players' characters too
    game:GetService("Players").PlayerAdded:Connect(function(otherPlayer)
        otherPlayer.CharacterAdded:Connect(function(otherCharacter)
            for _, part in pairs(otherCharacter:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end)
    end)
end

-- Execute collision change
setCollisionEnabled()

end)

sec5:Button("BallVisualizer", function()
    local grav = 28

local function BallPosAtTime(initial_position, initial_velocity, gravity, t)
    local predicted_position = initial_position + initial_velocity * t + 0.5 * Vector3.new(0, -gravity, 0) * t ^ 2
    return predicted_position
end

local function createPartsAndBeam(x0, v0, airtime, visible)
    local parts = {}
    local attachments = {}
    local transparency = visible and 0.6 or 1
    local lastAttachment = nil

    for t = 0, airtime, 0.05 do
        local POS = BallPosAtTime(x0, v0, grav, t)
        local Part = Instance.new("Part")
        Part.Parent = workspace
        Part.Size = Vector3.new(3, 2, 3)
        Part.Anchored = true
        Part.Color = Color3.fromRGB(0, 147, 204) -- Blue color
        Part.CanCollide = false
        Part.Rotation = Vector3.new(-90, 0, 90)
        Part.Position = POS
        Part.Transparency = 1        table.insert(parts, Part)

        local attachment = Instance.new("Attachment", Part)
        table.insert(attachments, attachment)

        if lastAttachment then
            local beam = Instance.new("Beam")
            beam.Parent = Part
            beam.Color = ColorSequence.new(Color3.fromRGB(52, 235, 183)) -- Purple color
            beam.Texture = "rbxassetid://18231379988"
            beam.Attachment0 = lastAttachment
            beam.Attachment1 = attachment
            beam.Transparency = NumberSequence.new(0.3)
            beam.Width0 = 1.5
            beam.Width1 = 1.5
        end

        lastAttachment = attachment
    end
    return parts
end

workspace.ChildAdded:Connect(function(c)
    game:GetService("RunService").Stepped:Wait()
    if c.Name ~= "Football" or c:IsA("Tool") then return end

    local x0 = c.Position
    local v0 = c.Velocity

    local airtime = (-v0.Y - math.sqrt(v0.Y ^ 2 - 4 * 0.5 * -grav * x0.Y)) / (2 * 0.5 * -grav)

    local parts = createPartsAndBeam(x0, v0, airtime, true)

    task.wait(airtime + 1.75)

    for _, Part in ipairs(parts) do
        Part:Destroy()
    end
end)

end)

sec5:Button("No Textures", function()
    -- Get the Workspace and the "Models" model
local workspace = game:GetService("Workspace")
local modelsFolder = workspace:FindFirstChild("Models")

-- Check if the "Models" model exists
if modelsFolder and modelsFolder:IsA("Model") then
    -- Function to set the material of all parts in a model to SmoothPlastic
    local function setMaterialToSmooth(model)
        for _, item in pairs(model:GetDescendants()) do
            if item:IsA("BasePart") then
                item:SetAttribute("OriginalMaterial", item.Material)  -- Save the original material
                item.Material = Enum.Material.SmoothPlastic
            end
        end
    end

    -- Iterate through all models inside the "Models" model
    for _, model in pairs(modelsFolder:GetChildren()) do
        if model:IsA("Model") then
            setMaterialToSmooth(model)
        end
    end
else
    warn("The 'Models' model does not exist in Workspace.")
end

end)

sec5:Button("Restore Textures", function()
    local workspace = game:GetService("Workspace")
local modelsFolder = workspace:FindFirstChild("Models")

if modelsFolder and modelsFolder:IsA("Model") then
    -- Function to reset the material of all parts in a model to their original material
    local function resetMaterialToOriginal(model)
        for _, item in pairs(model:GetDescendants()) do
            if item:IsA("BasePart") and item:GetAttribute("OriginalMaterial") then
                item.Material = item:GetAttribute("OriginalMaterial")
                item:SetAttribute("OriginalMaterial", nil)  -- Remove the attribute after resetting
            end
        end
    end

    for _, model in pairs(modelsFolder:GetChildren()) do
        if model:IsA("Model") then
            resetMaterialToOriginal(model)
        end
    end
else
    warn("The 'Models' model does not exist in Workspace.")
end

end)

sec3:Button("Disable JPCooldown", function()
    -- This script should be placed in a LocalScript within StarterPlayerScripts or StarterCharacterScripts

-- Get the local player
local player = game.Players.LocalPlayer

-- Get the character
local character = player.Character or player.CharacterAdded:Wait()

-- Get the humanoid
local humanoid = character:WaitForChild("Humanoid")

-- Infinite jump flag
local infiniteJumpEnabled = true

-- Cooldown flag
local canJump = true

-- Function to handle jumping
local function onJumpRequest()
    if infiniteJumpEnabled and humanoid and humanoid.Parent and canJump then
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        canJump = false
        wait(0.5)
        canJump = true
    end
end

-- User input service to detect jump request
local UserInputService = game:GetService("UserInputService")

-- Connect jump request to function
UserInputService.JumpRequest:Connect(onJumpRequest)

end)

sec3:Button("Enable JPCooldown", function()
    -- This script should be placed in a LocalScript within StarterPlayerScripts or StarterCharacterScripts

-- Get the local player
local player = game.Players.LocalPlayer

-- Get the character
local character = player.Character or player.CharacterAdded:Wait()

-- Get the humanoid
local humanoid = character:WaitForChild("Humanoid")

-- Infinite jump flag
local infiniteJumpEnabled = true

-- Cooldown flag
local canJump = true

-- Function to handle jumping
local function onJumpRequest()
    if infiniteJumpEnabled and humanoid and humanoid.Parent and canJump then
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        canJump = false
        wait(3)
        canJump = true
    end
end

-- User input service to detect jump request
local UserInputService = game:GetService("UserInputService")

-- Connect jump request to function
UserInputService.JumpRequest:Connect(onJumpRequest)

end)

sec4:Button("Enable AutoRush", function()
    -- LocalScript to Enable LocalPlayer Following

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")

local function findOpponentWithFootball()
    for _, player in pairs(Players:GetPlayers()) do
        if player.Team ~= LocalPlayer.Team then
            local char = player.Character
            if char and char:FindFirstChild("Football") then
                return char
            end
        end
    end
    return nil
end

local function moveToTarget(target)
    local targetPosition = target.HumanoidRootPart.Position
    Humanoid:MoveTo(targetPosition)
end

local function onStepped()
    local target = findOpponentWithFootball()
    if target then
        moveToTarget(target)
        if (HumanoidRootPart.Position - target.HumanoidRootPart.Position).Magnitude <= 2 then
            -- The local player touched the target's torso
            print("Touched the opponent with the football")
        end
    else
        Humanoid:Move(Vector3.new(0, 0, 0))
    end
end

RunService.Stepped:Connect(onStepped)

end)

sec4:Button("Disable AutoRush", function()
    -- LocalScript to Disable LocalPlayer Following

local RunService = game:GetService("RunService")

-- Assuming the `onStepped` function is accessible from where you disable it
-- You'll need to keep a reference to the connection when enabling following

-- Example of disconnecting the following
if RunService.Stepped then
    for _, connection in pairs(RunService.Stepped:GetConnections()) do
        if connection.Function == onStepped then
            connection:Disconnect()
        end
    end
end

end)

sec4:Button("AutoRush Prediction", function()
    -- LocalScript in StarterPlayerScripts or StarterCharacterScripts

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")

local moveDirection = Vector3.new(0, 0, 0)

local function findOpponentWithFootball()
    for _, player in pairs(Players:GetPlayers()) do
        if player.Team ~= LocalPlayer.Team then
            local char = player.Character
            if char and char:FindFirstChild("Football") then
                return char
            end
        end
    end
    return nil
end

local function moveToTarget(target)
    local targetPosition = target.HumanoidRootPart.Position
    Humanoid:MoveTo(targetPosition)
end

local function onStepped()
    local target = findOpponentWithFootball()
    if target then
        moveToTarget(target)
        if (HumanoidRootPart.Position - target.HumanoidRootPart.Position).Magnitude <= 2 then
            -- The local player touched the target's torso
            print("Touched the opponent with the football")
        end
    else
        Humanoid:Move(Vector3.new(0, 0, 0))
    end

    -- Apply movement direction
    if moveDirection.Magnitude > 0 then
        local moveVelocity = moveDirection * 10 -- Adjust speed as needed
        HumanoidRootPart.Velocity = moveVelocity
    end
end

local function onInputBegan(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.A then
        moveDirection = Vector3.new(-1, 0, 0) -- Move left
    elseif input.KeyCode == Enum.KeyCode.D then
        moveDirection = Vector3.new(1, 0, 0) -- Move right
    end
end

local function onInputEnded(input)
    if input.KeyCode == Enum.KeyCode.A or input.KeyCode == Enum.KeyCode.D then
        moveDirection = Vector3.new(0, 0, 0) -- Stop moving
    end
end

RunService.Stepped:Connect(onStepped)
UserInputService.InputBegan:Connect(onInputBegan)
UserInputService.InputEnded:Connect(onInputEnded)

end)
