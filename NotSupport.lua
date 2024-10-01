local XameitzFrame = Instance.new("ScreenGui")
XameitzFrame.Name = "XameitzFrame"
XameitzFrame.Parent = game.CoreGui
XameitzFrame.ZIndexBehavior = Enum.ZIndexBehavior.Global

local function createNotification(config, duration)
    if XameitzFrame:FindFirstChild("Frame") then
        XameitzFrame.Frame:Destroy()
    end

    local All = {
        ["Stroke"] = config.StrokeColor or Color3.fromRGB(75, 0, 130),
        ["TitleColor"] = config.TitleColor or Color3.fromRGB(255, 255, 255),
        ["DescColor"] = config.DescColor or Color3.fromRGB(200, 200, 200)
    }

    local Frame = Instance.new("Frame")
    Frame.Name = "Frame"
    Frame.Active = true
    Frame.Parent = XameitzFrame
    Frame.Draggable = true
    Frame.Size = UDim2.new(0, config.UiWidth, 0, 60)
    Frame.Position = UDim2.new(0.5, -config.UiWidth / 2, 0, -60)
    Frame:TweenPosition(UDim2.new(0.5, -config.UiWidth / 2, 0, 10), "Out", "Quad", 0.4, true)

    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 30)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(75, 75, 75))
    })
    gradient.Parent = Frame

    local stroke = Instance.new("UIStroke")
    stroke.Color = All["Stroke"]
    stroke.Thickness = 2.5
    stroke.Transparency = 0
    stroke.Parent = Frame

    local Image = Instance.new("ImageLabel")
    Image.Name = "Icon"
    Image.Parent = Frame
    Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Image.BackgroundTransparency = 1.0
    Image.Position = UDim2.new(0, 8, 0, 8)
    Image.Size = UDim2.new(0, 45, 0, 45)
    Image.Image = config.Image

    local ImageCorner = Instance.new("UICorner")
    ImageCorner.CornerRadius = UDim.new(0, 5)
    ImageCorner.Parent = Image

    Image:TweenSize(UDim2.new(0, 50, 0, 50), "Out", "Quad", 0.4, true)
    Image:TweenPosition(UDim2.new(0, 5, 0, 5), "Out", "Quad", 0.4, true)

    local warning = Instance.new("ImageLabel")
    warning.Parent = Frame
    warning.Image = "rbxassetid://96009740357973"
    warning.BackgroundTransparency = 1.0
    warning.Position = UDim2.new(1, -30, 0, 10)
    warning.Size = UDim2.new(0, 20, 0, 20)

    local Title = Instance.new("TextLabel")
    Title.Parent = Frame
    Title.BackgroundTransparency = 1.0
    Title.Position = UDim2.new(0, 60, 0, 8)
    Title.Size = UDim2.new(0, config.UiWidth - 60, 0, 20)
    Title.Font = Enum.Font.GothamBold
    Title.Text = config.Name
    Title.TextColor3 = All["TitleColor"]
    Title.TextSize = 16.0
    Title.TextXAlignment = Enum.TextXAlignment.Left

    local Desc = Instance.new("TextLabel")
    Desc.Parent = Frame
    Desc.BackgroundTransparency = 1.0
    Desc.Position = UDim2.new(0, 60, 0, 30)
    Desc.Size = UDim2.new(0, config.UiWidth - 60, 0, 20)
    Desc.Font = Enum.Font.GothamSemibold
    Desc.TextTransparency = 0
    Desc.Text = config.DescText or ""
    Desc.TextColor3 = All["DescColor"]
    Desc.TextSize = 12.0
    Desc.TextXAlignment = Enum.TextXAlignment.Left

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 5)
    UICorner.Parent = Frame

    if duration then
        delay(duration, function()
            if Frame then
                for i = 0, 1, 0.1 do
                    Image.BackgroundTransparency = i
                    warning.ImageTransparency = i
                    Image.ImageTransparency = i
                    Frame.BackgroundTransparency = i
                    Title.TextTransparency = i
                    Desc.TextTransparency = i
                    stroke.Transparency = i
                    gradient.Transparency = NumberSequence.new(i)
                    wait(0.1)
                end
                Frame:Destroy()
            end
        end)
    end
end

local warning = {
    Name = "Error",
    Image = "rbxassetid://134204200422920",
    UiWidth = 300,
    StrokeColor = Color3.fromRGB(100, 100, 100),
    TitleColor = Color3.fromRGB(255, 0, 0),
    DescText = "Place.Id Not Found",
    DescColor = Color3.fromRGB(255, 230, 0)
}

createNotification(warning, 2.5)
