-- Function to create and tween the UI
local TweenService = game:GetService("TweenService")

function showInvalidGameWarning()
    -- Create a ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    
    -- Create the TextLabel
    local textLabel = Instance.new("TextLabel")
    textLabel.Parent = screenGui
    textLabel.Size = UDim2.new(0.5, 0, 0.5, 0)  -- 50% of screen width and height
    textLabel.Position = UDim2.new(0.25, 0, 0.25, 0)  -- Centered on the screen
    textLabel.BackgroundTransparency = 1  -- No background
    textLabel.Text = "This game is not Support - Invalid game.PlaceId"
    textLabel.TextColor3 = Color3.new(1, 0, 0)  -- Red text
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.TextTransparency = 1  -- Start as fully transparent
    
    -- Tween settings
    local tweenInfo = TweenInfo.new(
        2, -- Duration: 2 seconds for fade-in
        Enum.EasingStyle.Sine, -- Easing style
        Enum.EasingDirection.InOut -- Easing direction
    )
    
    -- Tween to fade in
    local fadeInTween = TweenService:Create(textLabel, tweenInfo, {TextTransparency = 0})
    fadeInTween:Play()
    
    -- Wait 5 seconds before fading out
    fadeInTween.Completed:Wait()
    wait(5)
    
    -- Tween to fade out
    local fadeOutTween = TweenService:Create(textLabel, tweenInfo, {TextTransparency = 1})
    fadeOutTween:Play()
    
    -- Destroy the GUI once the tween is completed
    fadeOutTween.Completed:Connect(function()
        screenGui:Destroy()
    end)
end

-- Call the function to show the warning
showInvalidGameWarning()
