local TweenService = game:GetService("TweenService")

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local TeleportService = game:GetService("TeleportService")
local isOpen = false

-- สร้าง Container สำหรับกล่อง UI ทั้งหมด
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 200, 0, 200)
mainFrame.Position = UDim2.new(0.5, -100, 0.6, -100)
mainFrame.BackgroundColor3 = Color3.fromRGB(128, 128, 128)
mainFrame.BackgroundTransparency = 1
mainFrame.Visible = false
mainFrame.Parent = screenGui

-- ฟังก์ชันสร้างกล่อง UI
local function createUIContainer(text, placeId, imageId, index)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 50)
    frame.Position = UDim2.new(0, 0, 0, index * 50)
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    frame.BorderSizePixel = 0

    local imageLabel = Instance.new("ImageLabel")
    imageLabel.Size = UDim2.new(1, 0, 1, 0)
    imageLabel.BackgroundTransparency = 1
    imageLabel.Image = imageId
    imageLabel.ImageTransparency = 0.4
    imageLabel.ScaleType = Enum.ScaleType.Stretch

    local imageStroke = Instance.new("UIStroke")
    imageStroke.Thickness = 2
    imageStroke.Color = Color3.fromRGB(0, 170, 255)
    imageStroke.Parent = imageLabel

    local textLabel = Instance.new("TextLabel")
    textLabel.Text = text
    textLabel.Size = UDim2.new(0.7, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.TextSize = 18
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.Parent = imageLabel

    local button = Instance.new("TextButton")
    button.Text = "Teleport"
    button.Size = UDim2.new(0.25, 0, 0.5, 0)
    button.Position = UDim2.new(0.70, 0, 0.25, 0)
    button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    button.Font = Enum.Font.SourceSansBold
    button.TextScaled = true
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Parent = imageLabel

    button.MouseButton1Click:Connect(function()
            _G.auto = true
            while _G.auto do
            wait(0)
            TeleportService:Teleport(placeId, game.Players.LocalPlayer)
            end
    end)

    imageLabel.Parent = frame
    frame.Parent = mainFrame
end

-- สร้างปุ่มเปิด/ปิดเป็น ImageButton
local toggleButton = Instance.new("ImageButton")
toggleButton.Size = UDim2.new(0.07, 0, 0.15, 0)
toggleButton.Position = UDim2.new(0.5, -50, 0, 0)
toggleButton.AnchorPoint = Vector2.new(0.5, 0)
toggleButton.BackgroundTransparency = 1  -- โปร่งใส
toggleButton.Image = "rbxassetid://134204200422920"  -- Asset ID ของรูปภาพที่ต้องการใช้
toggleButton.ImageTransparency = 0  -- ตั้งให้ภาพไม่โปร่งใส
toggleButton.BorderSizePixel = 0  -- ไม่มีขอบ
toggleButton.Parent = screenGui

-- เพิ่มขอบให้ปุ่ม
local buttonStroke = Instance.new("UIStroke")
buttonStroke.Thickness = 2
buttonStroke.Color = Color3.fromRGB(128, 128, 128)  -- ขอบสีเทา
buttonStroke.Parent = toggleButton

-- ทำให้ขอบปุ่มมน
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 8)  -- รัศมีขอบมน
buttonCorner.Parent = toggleButton

local function toggleUI()
    isOpen = not isOpen
    local targetSize = isOpen and UDim2.new(0, 200, 0, 200) or UDim2.new(0, 0, 0, 0)
    
    mainFrame.Visible = true

    local tweenSize = TweenService:Create(mainFrame, TweenInfo.new(0.5), {
        Size = targetSize,
        Position = UDim2.new(0.5, -100, 0.6, -100)
    })
    tweenSize:Play()

    tweenSize.Completed:Connect(function()
        if not isOpen then
            mainFrame.Visible = false
        end
    end)

    -- ปรับสถานะของ TextLabel
    for _, child in ipairs(mainFrame:GetChildren()) do
        if child:IsA("Frame") then
            for _, lbl in ipairs(child:GetChildren()) do
                if lbl:IsA("TextLabel") then
                    lbl.Visible = isOpen
                end
            end
        end
    end
end

toggleButton.MouseButton1Click:Connect(toggleUI)

-- สร้างฟังก์ชันลาก
local dragging, dragInput, mousePos, startPos

local function updateDrag()
    local delta = mousePos - startPos
    mainFrame.Position = UDim2.new(mainFrame.Position.X.Scale, mainFrame.Position.X.Offset + delta.X, mainFrame.Position.Y.Scale, mainFrame.Position.Y.Offset + delta.Y)
end

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        startPos = input.Position
        mousePos = input.Position
    end
end)

mainFrame.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        mousePos = input.Position
        updateDrag()
    end
end)

game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- ทำให้ปุ่มเปิดปิดสามารถลากได้ด้วย
toggleButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        startPos = input.Position
        mousePos = input.Position
    end
end)

toggleButton.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        mousePos = input.Position
        updateDrag()
    end
end)

game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- สร้าง 3 UI Container พร้อม placeId ที่แตกต่างกันและ Image ID ที่แตกต่างกัน
local buttons = {
    {text = "Jigoku", placeId = 7618863566, imageId = "rbxassetid://86908192888417"},
    {text = "Gamemode", placeId = 7068737459, imageId = "rbxassetid://111930875771722"},
    {text = "Classic", placeId = 15989427413, imageId = "rbxassetid://95356967293561"}
}

for index, btn in ipairs(buttons) do
    createUIContainer(btn.text, btn.placeId, btn.imageId, index - 1)
end
