local Luxtl = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Luxware-UI-Library/main/Source.lua"))()

local Luxt = Luxtl.CreateWindow("Ronny Hub", 6105620301)

--tabs
local sg = Luxt:Tab("Shooting")
local db = Luxt:Tab("Defense")
local p1 = Luxt:Tab("Player")

--sections
local sec1 = sg:Section("Shooter")
local sec2 = db:Section("Defense")
local sec3 = p1:Section("Player")

--keybind
sec1:KeyBind("Aimbot", Enum.KeyCode.F, function() --Enum.KeyCode.R is starting Key
    -- LocalScript

local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Define the function to execute when 'F' is pressed
local function onKeyPress(input)
    if input.KeyCode == Enum.KeyCode.F then
        for i = 1, 2 do
            local args = {
                [1] = "Shoot",
                [2] = 0.9913833141326904
            }
            
            ReplicatedStorage.Remotes.Action:FireServer(unpack(args))
        end
    end
end

-- Connect the function to the input event
UserInputService.InputBegan:Connect(onKeyPress)

end)

sec3:Button("Normal WS", function()
    -- Local script

-- Desired speed in studs per second
local desiredSpeed = 4

-- Service references
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

-- Get the local player and their character
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- Last update time
local lastUpdateTime = tick()

-- Function to update character's position
local function updatePosition()
    -- Get the time delta since the last update
    local currentTime = tick()
    local deltaTime = currentTime - lastUpdateTime
    lastUpdateTime = currentTime

    -- Get the direction the player is moving in
    local moveDirection = Vector3.new(0, 0, 0)
    local humanoid = character:FindFirstChildWhichIsA("Humanoid")

    if humanoid then
        moveDirection = humanoid.MoveDirection
    end

    -- Calculate the new position
    local movementDelta = moveDirection * desiredSpeed * deltaTime
    humanoidRootPart.CFrame = humanoidRootPart.CFrame + movementDelta
end

-- Connect the update function to the RenderStepped event
RunService.RenderStepped:Connect(updatePosition)

end)
