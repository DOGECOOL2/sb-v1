local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()



function Script()
    local Window = Library.CreateLib("Slap Battles op script admin", "Ocean")



    local Main = Window:NewTab("Main")
    local MainSection = Tab:NewSection("Main")



    -script Maim

    MainSection:NewSlider("WalkSPeed", "How Fast you will walk", 50, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)


    MainSection:NewSlider("JumpPower", "How much you will jump", 50, 1, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
    end)
end



MainSectionSection:NewButton("infinite yield", "Gives you the script", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", true))()
    print("activated yield script")
end)

local ESP_ENABLED = false

-- Function to create ESP for a player
local function createESP(player)
    if player == game.Players.LocalPlayer then return end

    local highlight = Instance.new("Highlight")
    highlight.Adornee = player.Character
    highlight.FillColor = Color3.new(1, 0, 0) -- Red color
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
    highlight.Parent = player.Character
end

-- Function to remove ESP from a player
local function removeESP(player)
    if player.Character then
        local highlight = player.Character:FindFirstChildOfClass("Highlight")
        if highlight then
            highlight:Destroy()
        end
    end
end

-- Toggle ESP
local function toggleESP(state)
    ESP_ENABLED = state

    for _, player in pairs(game.Players:GetPlayers()) do
        if state then
            createESP(player)
        else
            removeESP(player)
        end
    end

    if state then
        print("ESP Enabled")
    else
        print("ESP Disabled")
    end
end

-- Event to handle new players joining
game.Players.PlayerAdded:Connect(function(player)
    if ESP_ENABLED then
        player.CharacterAdded:Connect(function()
            createESP(player)
        end)
    end
end)

-- Event to handle players leaving
game.Players.PlayerRemoving:Connect(function(player)
    removeESP(player)
end)

-- Refresh ESP every minute
local function refreshESP()
    while true do
        if ESP_ENABLED then
            for _, player in pairs(game.Players:GetPlayers()) do
                if player.Character then
                    removeESP(player)
                    createESP(player)
                end
            end
        end
        wait(60) -- Wait for 60 seconds
    end
end

-- Start the refresh loop
spawn(refreshESP)

-- Toggle UI
local ScreenGui = Instance.new("ScreenGui")
local ToggleButton = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

ToggleButton.Parent = ScreenGui
ToggleButton.Size = UDim2.new(0, 200, 0, 50)
ToggleButton.Position = UDim2.new(0, 100, 0, 100)
ToggleButton.Text = "ESP: OFF"
ToggleButton.BackgroundColor3 = Color3.new(1, 1, 1)
ToggleButton.TextColor3 = Color3.new(0, 0, 0)
ToggleButton.Font = Enum.Font.SourceSans
ToggleButton.TextSize = 24

ToggleButton.MouseButton1Click:Connect(function()
    ESP_ENABLED = not ESP_ENABLED
    toggleESP(ESP_ENABLED)
    if ESP_ENABLED then
        ToggleButton.Text = "ESP: ON"
    else
        ToggleButton.Text = "ESP: OFF"
    end
end)

print("ESP Script Loaded")











end


if game.PlaceId == 17833106912 then
    Script()
end
