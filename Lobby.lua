local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local TeleportService = game:GetService("TeleportService")
local TweenService = game:GetService("TweenService")
local isOpen = false

-- สร้าง Container สำหรับกล่อง UI ทั้งหมด
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 200, 0, 200)
mainFrame.Position = UDim2.new(0.5, -100, 0.6, -100)
mainFrame.BackgroundColor3 = Color3.fromRGB(128, 128, 128)
mainFrame.BackgroundTransparency = 1
mainFrame.Visible = false
mainFrame.Parent = screenGui
mainFrame.Active = true
mainFrame.Draggable = true

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
    imageLabel.ImageTransparency = 0.7
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
        TeleportService:Teleport(placeId, game.Players.LocalPlayer)
    end)

    imageLabel.Parent = frame
    frame.Parent = mainFrame
end

-- สร้างปุ่มเปิด/ปิดเป็น ImageButton
local toggleButton = Instance.new("ImageButton")
toggleButton.Size = UDim2.new(0.07, 0, 0.15, 0)
toggleButton.Position = UDim2.new(0.5, -50, 0, 0)
toggleButton.AnchorPoint = Vector2.new(0.5, 0)
toggleButton.BackgroundTransparency = 1
toggleButton.Image = "rbxassetid://134204200422920"
toggleButton.ImageTransparency = 0
toggleButton.BorderSizePixel = 0
toggleButton.Active = true
toggleButton.Draggable = true

-- เพิ่มขอบให้ปุ่ม
local buttonStroke = Instance.new("UIStroke")
buttonStroke.Thickness = 2
buttonStroke.Color = Color3.fromRGB(128, 128, 128)
buttonStroke.Parent = toggleButton

-- ทำให้ขอบปุ่มมน
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 8)
buttonCorner.Parent = toggleButton

local function toggleUI()
    isOpen = not isOpen
    local targetSize = isOpen and UDim2.new(
