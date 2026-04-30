local IconsV2 = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Footagesus/Icons/main/Main-v2.lua"))()
local Blackscreen = Instance.new("CanvasGroup")
Blackscreen.GroupTransparency = 1
Blackscreen.Visible = false
local mainui = {}
local ts = game:GetService("TweenService")
local resources = {}
local elements = {}
mainui = {
	Color = mainui.Color or Color3.new(1, 0, 0);
	ColorElements = {};
}

mainui.addcolorelements = (function(elementinst)
	mainui.ColorElements[#mainui.ColorElements + 1] = elementinst
end)

resources.doripple = function(button)
	local player = game:GetService("Players").LocalPlayer
	if not player then
		return
	end
	local mouse = player:GetMouse()
	local circle = Instance.new("ImageLabel")
	circle.Name = "Circle"
	circle.BackgroundColor3 = Color3.new(1, 1, 1)
	circle.BackgroundTransparency = 1
	circle.Image = "rbxassetid://266543268"
	circle.ImageTransparency = 0.5
	circle.ZIndex = 1000
	circle.Parent = button
	button.ClipsDescendants = true
	local size = math.max(button.AbsoluteSize.X, button.AbsoluteSize.Y) * 1.5
	circle.Position = UDim2.new(0, mouse.X - button.AbsolutePosition.X, 0, mouse.Y - button.AbsolutePosition.Y)
	circle.Size = UDim2.new(0, 0, 0, 0)
	ts:Create(circle, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Size = UDim2.new(0, size, 0, size),
		Position = UDim2.new(0.5, -size / 2, 0.5, -size / 2),
	}):Play()
	ts:Create(circle, TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		ImageTransparency = 1,
	}):Play()
	task.delay(0.7, function()
		if circle and circle.Parent then
			circle:Destroy()
		end
	end)
end

resources.DraggingEnabled = (function(frame, parent)
	parent = parent or frame

	local gui = parent
	local dragging
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		game:GetService("TweenService"):Create(gui,TweenInfo.new(0.1), {
			Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		}):Play()
		--gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end

	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end)


resources.switch = (function(inst)
	local Switch = Instance.new("Frame")
	local SwitchPadding = Instance.new("UIPadding")
	local SwitchMain = Instance.new("Frame")
	local SwitchCorner = Instance.new("UICorner")
	local SwitchMainText = Instance.new("TextLabel")
	local SwitchMainPadding = Instance.new("UIPadding")
	local SwitchFrame = Instance.new("TextButton")
	local SwitchFrameStroke = Instance.new("UIStroke")
	local SwitchFrameCorner = Instance.new("UICorner")
	local SwitchFrameTextOn = Instance.new("TextLabel")
	local SwitchFramePadding = Instance.new("UIPadding")
	local SwitchFrameTextOff = Instance.new("TextLabel")
	local SwitchFrameCircle = Instance.new("Frame")
	local SwitchFrameCircleCorner = Instance.new("UICorner")

	Switch.Name = "Switch"
	Switch.Parent = inst
	Switch.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Switch.BackgroundTransparency = 1.000
	Switch.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Switch.BorderSizePixel = 0
	Switch.Size = UDim2.new(1, 0, 0, 30)

	SwitchPadding.Name = "SwitchPadding"
	SwitchPadding.Parent = Switch
	SwitchPadding.PaddingLeft = UDim.new(0, 5)
	SwitchPadding.PaddingRight = UDim.new(0, 5)

	SwitchMain.Name = "SwitchMain"
	SwitchMain.Parent = Switch
	SwitchMain.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	SwitchMain.BackgroundTransparency = 0.700
	SwitchMain.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SwitchMain.BorderSizePixel = 0
	SwitchMain.Size = UDim2.new(1, 0, 1, 0)

	SwitchCorner.CornerRadius = UDim.new(0, 3)
	SwitchCorner.Name = "SwitchCorner"
	SwitchCorner.Parent = SwitchMain

	SwitchMainText.Name = "SwitchMainText"
	SwitchMainText.Parent = SwitchMain
	SwitchMainText.AnchorPoint = Vector2.new(0, 0.5)
	SwitchMainText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SwitchMainText.BackgroundTransparency = 1.000
	SwitchMainText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SwitchMainText.BorderSizePixel = 0
	SwitchMainText.Position = UDim2.new(0, 0, 0.5, 0)
	SwitchMainText.Size = UDim2.new(1, -60, 1, 0)
	SwitchMainText.Font = Enum.Font.GothamBold
	SwitchMainText.Text = "Initiate Farming"
	SwitchMainText.TextColor3 = Color3.fromRGB(200, 200, 200)
	SwitchMainText.TextSize = 13.000
	SwitchMainText.TextWrapped = true
	SwitchMainText.TextXAlignment = Enum.TextXAlignment.Left

	SwitchMainPadding.Name = "SwitchMainPadding"
	SwitchMainPadding.Parent = SwitchMain
	SwitchMainPadding.PaddingLeft = UDim.new(0, 10)
	SwitchMainPadding.PaddingRight = UDim.new(0, 5)

	SwitchFrame.Name = "SwitchFrame"
	SwitchFrame.Parent = SwitchMain
	SwitchFrame.AnchorPoint = Vector2.new(0, 0.5)
	SwitchFrame.BackgroundColor3 = mainui.Color
	SwitchFrame.BackgroundTransparency = 1.000
	SwitchFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SwitchFrame.BorderSizePixel = 0
	SwitchFrame.Position = UDim2.new(1, -50, 0.5, 0)
	SwitchFrame.Size = UDim2.new(0, 50, 0, 17)
	SwitchFrame.AutoButtonColor = false
	SwitchFrame.Font = Enum.Font.SourceSans
	SwitchFrame.Text = ""
	SwitchFrame.TextColor3 = Color3.fromRGB(0, 0, 0)
	SwitchFrame.TextSize = 14.000

	SwitchFrameStroke.Name = "SwitchFrameStroke"
	SwitchFrameStroke.Parent = SwitchFrame
	SwitchFrameStroke.Color = mainui.Color
	SwitchFrameStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

	SwitchFrameCorner.CornerRadius = UDim.new(0, 3)
	SwitchFrameCorner.Name = "SwitchFrameCorner"
	SwitchFrameCorner.Parent = SwitchFrame

	SwitchFrameTextOn.Name = "SwitchFrameTextOn"
	SwitchFrameTextOn.Parent = SwitchFrame
	SwitchFrameTextOn.AnchorPoint = Vector2.new(0, 0.5)
	SwitchFrameTextOn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SwitchFrameTextOn.BackgroundTransparency = 1.000
	SwitchFrameTextOn.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SwitchFrameTextOn.BorderSizePixel = 0
	SwitchFrameTextOn.Position = UDim2.new(0, 0, 0.5, 0)
	SwitchFrameTextOn.Size = UDim2.new(0, 20, 0, 20)
	SwitchFrameTextOn.ZIndex = 0
	SwitchFrameTextOn.Font = Enum.Font.GothamBold
	SwitchFrameTextOn.Text = "On"
	SwitchFrameTextOn.TextColor3 = Color3.fromRGB(255, 255, 255)
	SwitchFrameTextOn.TextSize = 10.000

	SwitchFramePadding.Name = "SwitchFramePadding"
	SwitchFramePadding.Parent = SwitchFrame
	SwitchFramePadding.PaddingBottom = UDim.new(0, 4)
	SwitchFramePadding.PaddingLeft = UDim.new(0, 1)
	SwitchFramePadding.PaddingRight = UDim.new(0, 1)
	SwitchFramePadding.PaddingTop = UDim.new(0, 4)

	SwitchFrameTextOff.Name = "SwitchFrameTextOff"
	SwitchFrameTextOff.Parent = SwitchFrame
	SwitchFrameTextOff.AnchorPoint = Vector2.new(0, 0.5)
	SwitchFrameTextOff.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SwitchFrameTextOff.BackgroundTransparency = 1.000
	SwitchFrameTextOff.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SwitchFrameTextOff.BorderSizePixel = 0
	SwitchFrameTextOff.Position = UDim2.new(1, -20, 0.5, 0)
	SwitchFrameTextOff.Size = UDim2.new(0, 20, 0, 20)
	SwitchFrameTextOff.ZIndex = 0
	SwitchFrameTextOff.Font = Enum.Font.GothamBold
	SwitchFrameTextOff.Text = "Off"
	SwitchFrameTextOff.TextColor3 = Color3.fromRGB(255, 255, 255)
	SwitchFrameTextOff.TextSize = 10.000
	SwitchFrameTextOff.TextXAlignment = Enum.TextXAlignment.Left

	SwitchFrameCircle.Name = "SwitchFrameCircle"
	SwitchFrameCircle.Parent = SwitchFrame
	SwitchFrameCircle.AnchorPoint = Vector2.new(0, 0.5)
	SwitchFrameCircle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
	SwitchFrameCircle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SwitchFrameCircle.BorderSizePixel = 0
	SwitchFrameCircle.Position = UDim2.new(0, 0, 0.5, 0)
	SwitchFrameCircle.Size = UDim2.new(0, 20, 0, 15)
	SwitchFrameCircle.ZIndex = 2

	SwitchFrameCircleCorner.CornerRadius = UDim.new(0, 3)
	SwitchFrameCircleCorner.Name = "SwitchFrameCircleCorner"
	SwitchFrameCircleCorner.Parent = SwitchFrameCircle

	return Switch
end)

resources.slider = (function(inst)
    local Slider = Instance.new("Frame")
    local SliderPadding = Instance.new("UIPadding")
    local SliderMain = Instance.new("Frame")
    local SliderMainCorner = Instance.new("UICorner")
    local SliderMainText = Instance.new("TextLabel")
    local SliderMainPadding = Instance.new("UIPadding")
    local SliderMainBar = Instance.new("Frame")
    local SliderMainBarCorner = Instance.new("UICorner")
    local SliderMainBarFill = Instance.new("Frame")
    local SliderMainBarFillCorner = Instance.new("UICorner")
    local SliderMainBarFillCircle = Instance.new("TextButton")
    local SliderMainBarFillCircleCorner = Instance.new("UICorner")
    local SliderMainBarFillCircleStroke = Instance.new("UIStroke")
	local SliderMainBarFillCircleStrokeInner = Instance.new("UIStroke")
    local SliderMainBarFillPadding = Instance.new("UIPadding")
    local SliderMainValue = Instance.new("TextLabel")
    local SliderMainValue2 = Instance.new("TextLabel")

    Slider.Name = "Slider"
    Slider.Parent = inst
    Slider.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Slider.BackgroundTransparency = 1.000
    Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Slider.BorderSizePixel = 0
    Slider.Size = UDim2.new(1, 0, 0, 40)

    SliderPadding.Name = "SliderPadding"
    SliderPadding.Parent = Slider
    SliderPadding.PaddingLeft = UDim.new(0, 5)
    SliderPadding.PaddingRight = UDim.new(0, 5)

    SliderMain.Name = "SliderMain"
    SliderMain.Parent = Slider
    SliderMain.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    SliderMain.BackgroundTransparency = 0.700
    SliderMain.BorderColor3 = Color3.fromRGB(0, 0, 0)
    SliderMain.BorderSizePixel = 0
    SliderMain.Size = UDim2.new(1, 0, 1, 0)

    SliderMainCorner.CornerRadius = UDim.new(0, 3)
    SliderMainCorner.Name = "SliderMainCorner"
    SliderMainCorner.Parent = SliderMain

    SliderMainText.Name = "SliderMainText"
    SliderMainText.Parent = SliderMain
    SliderMainText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SliderMainText.BackgroundTransparency = 1.000
    SliderMainText.BorderColor3 = Color3.fromRGB(0, 0, 0)
    SliderMainText.BorderSizePixel = 0
    SliderMainText.Size = UDim2.new(1, -60, 0.5, -1)
    SliderMainText.Font = Enum.Font.GothamBold
    SliderMainText.Text = "Tweening Speed"
    SliderMainText.TextColor3 = Color3.fromRGB(200, 200, 200)
    SliderMainText.TextSize = 13.000
    SliderMainText.TextWrapped = true
    SliderMainText.TextXAlignment = Enum.TextXAlignment.Left
    SliderMainText.TextYAlignment = Enum.TextYAlignment.Bottom

    SliderMainPadding.Name = "SliderMainPadding"
    SliderMainPadding.Parent = SliderMain
    SliderMainPadding.PaddingLeft = UDim.new(0, 10)
    SliderMainPadding.PaddingRight = UDim.new(0, 5)

    SliderMainBar.Name = "SliderMainBar"
    SliderMainBar.Parent = SliderMain
    SliderMainBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SliderMainBar.BackgroundTransparency = 0.950
    SliderMainBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
    SliderMainBar.BorderSizePixel = 0
    SliderMainBar.Position = UDim2.new(0, 0, 1, -12)
    SliderMainBar.Size = UDim2.new(1, -5, 0, 5)

    SliderMainBarCorner.CornerRadius = UDim.new(0, 2)
    SliderMainBarCorner.Name = "SliderMainBarCorner"
    SliderMainBarCorner.Parent = SliderMainBar

    SliderMainBarFill.Name = "SliderMainBarFill"
    SliderMainBarFill.Parent = SliderMainBar
    SliderMainBarFill.BackgroundColor3 = mainui.Color
    SliderMainBarFill.BorderColor3 = Color3.fromRGB(0, 0, 0)
    SliderMainBarFill.BorderSizePixel = 0
    SliderMainBarFill.Size = UDim2.new(0, 0, 1, 0)

    SliderMainBarFillCorner.CornerRadius = UDim.new(0, 2)
    SliderMainBarFillCorner.Name = "SliderMainBarFillCorner"
    SliderMainBarFillCorner.Parent = SliderMainBarFill

    SliderMainBarFillCircle.Name = "SliderMainBarFillCircle"
    SliderMainBarFillCircle.Parent = SliderMainBarFill
    SliderMainBarFillCircle.AnchorPoint = Vector2.new(0, 0.5)
    SliderMainBarFillCircle.BackgroundColor3 = mainui.Color
    SliderMainBarFillCircle.BorderColor3 = Color3.fromRGB(0, 0, 0)
    SliderMainBarFillCircle.BorderSizePixel = 0
    SliderMainBarFillCircle.Position = UDim2.new(1, -10, 0.5, 0)
    SliderMainBarFillCircle.Size = UDim2.new(0, 8, 0, 8)
    SliderMainBarFillCircle.AutoButtonColor = false
    SliderMainBarFillCircle.Font = Enum.Font.SourceSans
    SliderMainBarFillCircle.Text = ""
    SliderMainBarFillCircle.TextColor3 = Color3.fromRGB(0, 0, 0)
    SliderMainBarFillCircle.TextSize = 14.000

    SliderMainBarFillCircleCorner.CornerRadius = UDim.new(0, 99)
    SliderMainBarFillCircleCorner.Name = "SliderMainBarFillCircleCorner"
    SliderMainBarFillCircleCorner.Parent = SliderMainBarFillCircle

    SliderMainBarFillCircleStroke.Name = "SliderMainBarFillCircleStroke"
    SliderMainBarFillCircleStroke.Parent = SliderMainBarFillCircle
    SliderMainBarFillCircleStroke.Color = Color3.fromRGB(255, 255, 255)
    SliderMainBarFillCircleStroke.Thickness = 2.000
    SliderMainBarFillCircleStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

	SliderMainBarFillCircleStrokeInner.Name = "SliderMainBarFillCircleStrokeInner"
	SliderMainBarFillCircleStrokeInner.Parent = SliderMainBarFillCircle
	SliderMainBarFillCircleStrokeInner.Color = Color3.fromRGB(255, 255, 255)
	SliderMainBarFillCircleStrokeInner.Thickness = 0.000
	SliderMainBarFillCircleStrokeInner.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	SliderMainBarFillCircleStrokeInner.BorderStrokePosition = Enum.BorderStrokePosition.Inner

    SliderMainBarFillPadding.Name = "SliderMainBarFillPadding"
    SliderMainBarFillPadding.Parent = SliderMainBarFill
    SliderMainBarFillPadding.PaddingLeft = UDim.new(0, 10)

    SliderMainValue.Name = "SliderMainValue"
    SliderMainValue.Parent = SliderMain
    SliderMainValue.AnchorPoint = Vector2.new(1, 0)
    SliderMainValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SliderMainValue.BackgroundTransparency = 1.000
    SliderMainValue.BorderColor3 = Color3.fromRGB(0, 0, 0)
    SliderMainValue.BorderSizePixel = 0
    SliderMainValue.Position = UDim2.new(1, -5, 0, 7)
    SliderMainValue.Size = UDim2.new(1, -300, 0, 13)
    SliderMainValue.Font = Enum.Font.GothamBold
    SliderMainValue.Text = "123"
    SliderMainValue.TextColor3 = Color3.fromRGB(175, 175, 175)
    SliderMainValue.TextSize = 13.000
    SliderMainValue.TextXAlignment = Enum.TextXAlignment.Right

    SliderMainValue2.Name = "SliderMainValue2"
    SliderMainValue2.Parent = SliderMain
    SliderMainValue2.AnchorPoint = Vector2.new(1, 0)
    SliderMainValue2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SliderMainValue2.BackgroundTransparency = 1.000
    SliderMainValue2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    SliderMainValue2.BorderSizePixel = 0
    SliderMainValue2.Position = UDim2.new(1, -5, 0, 7)
    SliderMainValue2.Size = UDim2.new(1, -300, 0, 13)
    SliderMainValue2.Visible = false
    SliderMainValue2.ZIndex = 2
    SliderMainValue2.Font = Enum.Font.GothamBold
    SliderMainValue2.Text = "122"
    SliderMainValue2.TextColor3 = Color3.fromRGB(175, 175, 175)
    SliderMainValue2.TextSize = 13.000
    SliderMainValue2.TextTransparency = 0.500
    SliderMainValue2.TextXAlignment = Enum.TextXAlignment.Right

    return Slider
end)

resources.button = (function(inst)
	local Button = Instance.new("Frame")
	local ButtonPadding = Instance.new("UIPadding")
	local ButtonMain = Instance.new("TextButton")
	local ButtonMain2 = Instance.new("Frame")
	local ButtonMainCorner = Instance.new("UICorner")
	local ButtonMainPadding = Instance.new("UIPadding")
	local ButtonMainLabel = Instance.new("ImageLabel")
	local ButtonMainLayout = Instance.new("UIListLayout")
	local ButtonMainText = Instance.new("TextLabel")

	Button.Name = "Button"
	Button.Parent = inst
	Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Button.BackgroundTransparency = 1.000
	Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Button.BorderSizePixel = 0
	Button.Size = UDim2.new(1, 0, 0, 30)

	ButtonPadding.Name = "ButtonPadding"
	ButtonPadding.Parent = Button
	ButtonPadding.PaddingLeft = UDim.new(0, 5)
	ButtonPadding.PaddingRight = UDim.new(0, 5)

	ButtonMain.Name = "ButtonMain"
	ButtonMain.Parent = Button
	ButtonMain.BackgroundColor3 = mainui.Color
	ButtonMain.BackgroundTransparency = 0.700
	ButtonMain.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ButtonMain.BorderSizePixel = 0
	ButtonMain.Size = UDim2.new(1, 0, 1, 0)
	ButtonMain.AutoButtonColor = false
	ButtonMain.Font = Enum.Font.SourceSans
	ButtonMain.Text = ""
	ButtonMain.TextColor3 = Color3.fromRGB(0, 0, 0)
	ButtonMain.TextSize = 14.000

	ButtonMain2.Name = "ButtonMain2"
	ButtonMain2.Parent = Button
	ButtonMain2.BackgroundColor3 = mainui.Color
	ButtonMain2.BackgroundTransparency = 1
	ButtonMain2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ButtonMain2.BorderSizePixel = 0
	ButtonMain2.Size = UDim2.new(1, 0, 1, 0)
	
	ButtonMainCorner.CornerRadius = UDim.new(0, 3)
	ButtonMainCorner.Name = "ButtonMainCorner"
	ButtonMainCorner.Parent = ButtonMain

	ButtonMainPadding.Name = "ButtonMainPadding"
	ButtonMainPadding.Parent = ButtonMain
	ButtonMainPadding.PaddingLeft = UDim.new(0, 8)
	ButtonMainPadding.PaddingRight = UDim.new(0, 5)

	ButtonMainLabel.Name = "ButtonMainLabel"
	ButtonMainLabel.Parent = ButtonMain
	ButtonMainLabel.AnchorPoint = Vector2.new(0, 0.5)
	ButtonMainLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ButtonMainLabel.BackgroundTransparency = 1.000
	ButtonMainLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ButtonMainLabel.BorderSizePixel = 0
	ButtonMainLabel.Position = UDim2.new(0, 0, 0.5, 0)
	ButtonMainLabel.Size = UDim2.new(0, 18, 0, 18)
	ButtonMainLabel.Image = "rbxassetid://125035817741526"

	ButtonMainLayout.Name = "ButtonMainLayout"
	ButtonMainLayout.Parent = ButtonMain
	ButtonMainLayout.FillDirection = Enum.FillDirection.Horizontal
	ButtonMainLayout.SortOrder = Enum.SortOrder.LayoutOrder
	ButtonMainLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	ButtonMainLayout.Padding = UDim.new(0, 6)

	ButtonMainText.Name = "ButtonMainText"
	ButtonMainText.Parent = ButtonMain
	ButtonMainText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ButtonMainText.BackgroundTransparency = 1.000
	ButtonMainText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ButtonMainText.BorderSizePixel = 0
	ButtonMainText.Size = UDim2.new(1, -20, 1, 0)
	ButtonMainText.Font = Enum.Font.GothamBold
	ButtonMainText.Text = ""
	ButtonMainText.TextColor3 = Color3.fromRGB(255, 255, 255)
	ButtonMainText.TextSize = 13.000
	ButtonMainText.TextXAlignment = Enum.TextXAlignment.Left

	return Button
end)

resources.listelement = (function(inst)
	local List = Instance.new("Frame")
	local ListPadding = Instance.new("UIPadding")
	local ListMain = Instance.new("Frame")
	local ListMainCorner = Instance.new("UICorner")
	local ListMainText = Instance.new("TextLabel")
	local ListMainPadding = Instance.new("UIPadding")
	local ListMainLayout = Instance.new("UIListLayout")
	local ListList = Instance.new("TextButton")
    local ListListPadding = Instance.new("UIPadding")
	local ListListCorner = Instance.new("UICorner")
	local ListListText = Instance.new("TextLabel")

	List.Name = "List"
	List.Parent = inst
	List.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	List.BackgroundTransparency = 1.000
	List.BorderColor3 = Color3.fromRGB(0, 0, 0)
	List.BorderSizePixel = 0
	List.Size = UDim2.new(1, 0, 0, 0)
	List.AutomaticSize = Enum.AutomaticSize.Y

	ListPadding.Name = "ListPadding"
	ListPadding.Parent = List
	ListPadding.PaddingLeft = UDim.new(0, 5)
	ListPadding.PaddingRight = UDim.new(0, 5)

	ListMain.Name = "ListMain"
	ListMain.Parent = List
	ListMain.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	ListMain.BackgroundTransparency = 0.700
	ListMain.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ListMain.BorderSizePixel = 0
	ListMain.Size = UDim2.new(1, 0, 1, 0)

	ListMainCorner.CornerRadius = UDim.new(0, 3)
	ListMainCorner.Name = "ListMainCorner"
	ListMainCorner.Parent = ListMain

	ListMainText.Name = "ListMainText"
	ListMainText.Parent = ListMain
	ListMainText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ListMainText.BackgroundTransparency = 1.000
	ListMainText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ListMainText.BorderSizePixel = 0
	ListMainText.Size = UDim2.new(1, 0, 0, 19)
	ListMainText.Font = Enum.Font.GothamBold
	ListMainText.Text = "Teleport Mode"
	ListMainText.TextColor3 = Color3.fromRGB(200, 200, 200)
	ListMainText.TextSize = 13.000
	ListMainText.TextWrapped = true
	ListMainText.TextXAlignment = Enum.TextXAlignment.Left
	ListMainText.TextYAlignment = Enum.TextYAlignment.Bottom

	ListMainPadding.Name = "ListMainPadding"
	ListMainPadding.Parent = ListMain
	ListMainPadding.PaddingBottom = UDim.new(0, 10)
	ListMainPadding.PaddingLeft = UDim.new(0, 10)
	ListMainPadding.PaddingRight = UDim.new(0, 10)

	ListMainLayout.Name = "ListMainLayout"
	ListMainLayout.Parent = ListMain
	ListMainLayout.SortOrder = Enum.SortOrder.LayoutOrder
	ListMainLayout.Padding = UDim.new(0, 5)

	ListList.Name = "ListList"
	ListList.Parent = ListMain
	ListList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ListList.BackgroundTransparency = 0.950
	ListList.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ListList.BorderSizePixel = 0
	ListList.Size = UDim2.new(1, -5, 0, 20)
	ListList.Text = ""
	ListList.TextTransparency = 1
	ListList.AutoButtonColor = false
    ListList.AutomaticSize = Enum.AutomaticSize.Y

    -- ListListPadding.Name = "ListListPadding"
    -- ListListPadding.Parent = ListList
    -- ListListPadding.PaddingBottom = UDim.new(0, 2)
    -- ListListPadding.PaddingTop = UDim.new(0, 2)

	ListListCorner.CornerRadius = UDim.new(0, 3)
	ListListCorner.Name = "ListListCorner"
	ListListCorner.Parent = ListList

	ListListText.Name = "ListListText"
	ListListText.Parent = ListList
	ListListText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ListListText.BackgroundTransparency = 1.000
	ListListText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ListListText.BorderSizePixel = 0
	ListListText.Position = UDim2.new(0, 5, 0, 0)
	ListListText.Size = UDim2.new(1, -10, 1, 0)
	ListListText.Font = Enum.Font.GothamBold
	ListListText.Text = "felix mom"
	ListListText.TextColor3 = Color3.fromRGB(141, 141, 141)
	ListListText.TextSize = 12.000
	ListListText.TextWrapped = true
	ListListText.TextXAlignment = Enum.TextXAlignment.Left
    ListListText.AutomaticSize = Enum.AutomaticSize.Y

	return List
end)

resources.listblackscreen = (function(inst)
	local List = Instance.new("Frame")
	local ListCorner = Instance.new("UICorner")
	local ListTitle = Instance.new("TextLabel")
	local ListClose = Instance.new("ImageButton")
	local ListCloseStroke = Instance.new("UIStroke")
	local ListApply = Instance.new("ImageButton")
	local ListApplyStroke = Instance.new("UIStroke")
	local ListPadding = Instance.new("UIPadding")
	local ListSelected = Instance.new("TextLabel")
	local ListStroke = Instance.new("UIStroke")
	local ListScroll = Instance.new("ScrollingFrame")
	local ListScrollLayout = Instance.new("UIListLayout")
	local ListScrollPadding = Instance.new("UIPadding")

	List.Name = "List"
	List.Parent = Blackscreen
	List.AnchorPoint = Vector2.new(0.5, 0.5)
	List.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
	List.BorderColor3 = Color3.fromRGB(0, 0, 0)
	List.BorderSizePixel = 0
	List.Position = UDim2.new(0.5, 0, 0.5, 0)
	List.Size = UDim2.new(0.5, 35, 0.5, 60)

	ListCorner.Name = "ListCorner"
	ListCorner.Parent = List

	ListTitle.Name = "ListTitle"
	ListTitle.Parent = List
	ListTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ListTitle.BackgroundTransparency = 1.000
	ListTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ListTitle.BorderSizePixel = 0
	ListTitle.Position = UDim2.new(0, 10, 0, 0)
	ListTitle.Size = UDim2.new(1, -15, 0, 20)
	ListTitle.Font = Enum.Font.GothamBold
	ListTitle.Text = "Farming Mode"
	ListTitle.TextColor3 = Color3.fromRGB(181, 181, 181)
	ListTitle.TextSize = 14.000
	ListTitle.TextXAlignment = Enum.TextXAlignment.Left
	ListTitle.TextYAlignment = Enum.TextYAlignment.Bottom

	ListClose.Name = "ListClose"
	ListClose.Parent = ListTitle
	ListClose.AnchorPoint = Vector2.new(1, 0)
	ListClose.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ListClose.BackgroundTransparency = 0.950
	ListClose.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ListClose.BorderSizePixel = 0
	ListClose.Position = UDim2.new(1, 0, 0, 10)
	ListClose.Size = UDim2.new(0, 20, 0, 20)
	ListClose.AutoButtonColor = false
	ListClose.Image = "rbxassetid://10747384394"
	ListClose.ImageColor3 = Color3.fromRGB(190, 190, 190)

	ListCloseStroke.Name = "ListCloseStroke"
	ListCloseStroke.Parent = ListClose
	ListCloseStroke.Color = Color3.fromRGB(59, 59, 59)
	ListCloseStroke.Transparency = 0.630
	ListCloseStroke.Thickness = 2.000

	ListApply.Name = "ListApply"
	ListApply.Parent = ListTitle
	ListApply.AnchorPoint = Vector2.new(1, 0)
	ListApply.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ListApply.BackgroundTransparency = 0.950
	ListApply.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ListApply.BorderSizePixel = 0
	ListApply.Position = UDim2.new(1, -25, 0, 10)
	ListApply.Size = UDim2.new(0, 20, 0, 20)
	ListApply.AutoButtonColor = false
	ListApply.Image = "rbxassetid://10709790644"
	ListApply.ImageColor3 = Color3.fromRGB(190, 190, 190)
	ListApply.Visible = false

	ListApplyStroke.Name = "ListApplyStroke"
	ListApplyStroke.Parent = ListApply
	ListApplyStroke.Color = Color3.fromRGB(59, 59, 59)
	ListApplyStroke.Transparency = 0.630
	ListApplyStroke.Thickness = 2.000

	ListPadding.Name = "ListPadding"
	ListPadding.Parent = List
	ListPadding.PaddingBottom = UDim.new(0, 5)
	ListPadding.PaddingLeft = UDim.new(0, 5)
	ListPadding.PaddingRight = UDim.new(0, 5)
	ListPadding.PaddingTop = UDim.new(0, 5)

	ListSelected.Name = "ListSelected"
	ListSelected.Parent = List
	ListSelected.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ListSelected.BackgroundTransparency = 1.000
	ListSelected.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ListSelected.BorderSizePixel = 0
	ListSelected.Position = UDim2.new(0, 10, 0, 20)
	ListSelected.Size = UDim2.new(1, -15, 0, 20)
	ListSelected.Font = Enum.Font.GothamBold
	ListSelected.Text = "Selected: "
	ListSelected.TextColor3 = Color3.fromRGB(97, 97, 97)
	ListSelected.TextSize = 13.000
	ListSelected.TextXAlignment = Enum.TextXAlignment.Left

	ListStroke.Name = "ListStroke"
	ListStroke.Parent = List
	ListStroke.Color = Color3.fromRGB(59, 59, 59)
	ListStroke.Transparency = 0.630
	ListStroke.Thickness = 2.000

	ListScroll.Name = "ListScroll"
	ListScroll.Parent = List
	ListScroll.Active = true
	ListScroll.AnchorPoint = Vector2.new(0, 1)
	ListScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ListScroll.BackgroundTransparency = 1.000
	ListScroll.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ListScroll.BorderSizePixel = 0
	ListScroll.Position = UDim2.new(0, 0, 1, 0)
	ListScroll.Size = UDim2.new(1, 0, 1, -45)
	ListScroll.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	ListScroll.ScrollBarThickness = 1
	ListScroll.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

	ListScrollLayout.Name = "ListScrollLayout"
	ListScrollLayout.Parent = ListScroll
	ListScrollLayout.SortOrder = Enum.SortOrder.LayoutOrder
	ListScrollLayout.Padding = UDim.new(0, 2)

	game:GetService("RunService").RenderStepped:Connect(function()
		ListScroll.CanvasSize = UDim2.new(0, 0, 0, ListScrollLayout.AbsoluteContentSize.Y + 5)
	end)

	ListScrollPadding.Name = "ListScrollPadding"
	ListScrollPadding.Parent = ListScroll
	ListScrollPadding.PaddingLeft = UDim.new(0, 5)
	ListScrollPadding.PaddingRight = UDim.new(0, 5)

	return List
end)

resources.paragraph = (function(inst)
	local Paragraph = Instance.new("Frame")
	local ParagraphPadding = Instance.new("UIPadding")
	local ParagraphMain = Instance.new("Frame")
	local ParagraphMainCorner = Instance.new("UICorner")
	local ParagraphMainTitle = Instance.new("TextLabel")
	local ParagraphMainPadding = Instance.new("UIPadding")
	local ParagraphMainLayout = Instance.new("UIListLayout")
	local ParagraphMainContent = Instance.new("TextLabel")

	Paragraph.Name = "Paragraph"
	Paragraph.Parent = inst
	Paragraph.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Paragraph.BackgroundTransparency = 1.000
	Paragraph.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Paragraph.BorderSizePixel = 0
	Paragraph.Size = UDim2.new(1, 0, 0, 0)
	Paragraph.AutomaticSize = Enum.AutomaticSize.Y

	ParagraphPadding.Name = "ParagraphPadding"
	ParagraphPadding.Parent = Paragraph
	ParagraphPadding.PaddingLeft = UDim.new(0, 5)
	ParagraphPadding.PaddingRight = UDim.new(0, 5)

	ParagraphMain.Name = "ParagraphMain"
	ParagraphMain.Parent = Paragraph
	ParagraphMain.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	ParagraphMain.BackgroundTransparency = 0.700
	ParagraphMain.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ParagraphMain.BorderSizePixel = 0
	ParagraphMain.Size = UDim2.new(1, 0, 1, 0)
	ParagraphMain.AutomaticSize = Enum.AutomaticSize.Y

	ParagraphMainCorner.CornerRadius = UDim.new(0, 3)
	ParagraphMainCorner.Name = "ParagraphMainCorner"
	ParagraphMainCorner.Parent = ParagraphMain

	ParagraphMainTitle.Name = "ParagraphMainTitle"
	ParagraphMainTitle.Parent = ParagraphMain
	ParagraphMainTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ParagraphMainTitle.BackgroundTransparency = 1.000
	ParagraphMainTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ParagraphMainTitle.BorderSizePixel = 0
	ParagraphMainTitle.Size = UDim2.new(1, 0, 0, 19)
	ParagraphMainTitle.Font = Enum.Font.GothamBold
	ParagraphMainTitle.Text = ""
	ParagraphMainTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
	ParagraphMainTitle.TextSize = 13.000
	ParagraphMainTitle.TextWrapped = true
	ParagraphMainTitle.TextXAlignment = Enum.TextXAlignment.Left
	ParagraphMainTitle.TextYAlignment = Enum.TextYAlignment.Bottom

	ParagraphMainPadding.Name = "ParagraphMainPadding"
	ParagraphMainPadding.Parent = ParagraphMain
	ParagraphMainPadding.PaddingBottom = UDim.new(0, 10)
	ParagraphMainPadding.PaddingLeft = UDim.new(0, 10)
	ParagraphMainPadding.PaddingRight = UDim.new(0, 10)

	ParagraphMainLayout.Name = "ParagraphMainLayout"
	ParagraphMainLayout.Parent = ParagraphMain
	ParagraphMainLayout.SortOrder = Enum.SortOrder.LayoutOrder
	ParagraphMainLayout.Padding = UDim.new(0, 5)

	ParagraphMainContent.Name = "ParagraphMainContent"
	ParagraphMainContent.Parent = ParagraphMain
	ParagraphMainContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ParagraphMainContent.BackgroundTransparency = 1.000
	ParagraphMainContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ParagraphMainContent.BorderSizePixel = 0
	ParagraphMainContent.Size = UDim2.new(1, 0, 0, 0)
	ParagraphMainContent.Font = Enum.Font.GothamBold
	ParagraphMainContent.Text = "dfgbxb"
	ParagraphMainContent.TextColor3 = Color3.fromRGB(141, 141, 141)
	ParagraphMainContent.TextSize = 11.000
	ParagraphMainContent.TextWrapped = true
	ParagraphMainContent.TextXAlignment = Enum.TextXAlignment.Left
	ParagraphMainContent.TextYAlignment = Enum.TextYAlignment.Top
	ParagraphMainContent.AutomaticSize = Enum.AutomaticSize.Y

	return Paragraph
end)

resources.clipboard = (function(inst)
	local Clipboard = Instance.new("Frame")
	local ClipboardPadding = Instance.new("UIPadding")
	local ClipboardMain = Instance.new("Frame")
	local ClipboardMainCorner = Instance.new("UICorner")
	local ClipboardMainTItle = Instance.new("TextLabel")
	local ClipboardMainPadding = Instance.new("UIPadding")
	local ClipboardMainLayout = Instance.new("UIListLayout")
	local ClipboardContent = Instance.new("Frame")
	local ClipboardContentCorner = Instance.new("UICorner")
	local ClipboardContentText = Instance.new("TextLabel")
	local ClipboardContentPadding = Instance.new("UIPadding")
	local ClipboardContentTrigger = Instance.new("ImageButton")

	Clipboard.Name = "Clipboard"
	Clipboard.Parent = inst
	Clipboard.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Clipboard.BackgroundTransparency = 1.000
	Clipboard.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Clipboard.BorderSizePixel = 0
	Clipboard.Size = UDim2.new(1, 0, 0, 0)
	Clipboard.AutomaticSize = Enum.AutomaticSize.Y

	ClipboardPadding.Name = "ClipboardPadding"
	ClipboardPadding.Parent = Clipboard
	ClipboardPadding.PaddingLeft = UDim.new(0, 5)
	ClipboardPadding.PaddingRight = UDim.new(0, 5)

	ClipboardMain.Name = "ClipboardMain"
	ClipboardMain.Parent = Clipboard
	ClipboardMain.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	ClipboardMain.BackgroundTransparency = 0.700
	ClipboardMain.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ClipboardMain.BorderSizePixel = 0
	ClipboardMain.Size = UDim2.new(1, 0, 1, 0)
	ClipboardMain.AutomaticSize = Enum.AutomaticSize.Y

	ClipboardMainCorner.CornerRadius = UDim.new(0, 3)
	ClipboardMainCorner.Name = "ClipboardMainCorner"
	ClipboardMainCorner.Parent = ClipboardMain

	ClipboardMainTItle.Name = "ClipboardMainTItle"
	ClipboardMainTItle.Parent = ClipboardMain
	ClipboardMainTItle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ClipboardMainTItle.BackgroundTransparency = 1.000
	ClipboardMainTItle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ClipboardMainTItle.BorderSizePixel = 0
	ClipboardMainTItle.Size = UDim2.new(1, 0, 0, 19)
	ClipboardMainTItle.Font = Enum.Font.GothamBold
	ClipboardMainTItle.Text = ""
	ClipboardMainTItle.TextColor3 = Color3.fromRGB(200, 200, 200)
	ClipboardMainTItle.TextSize = 13.000
	ClipboardMainTItle.TextWrapped = true
	ClipboardMainTItle.TextXAlignment = Enum.TextXAlignment.Left
	ClipboardMainTItle.TextYAlignment = Enum.TextYAlignment.Bottom

	ClipboardMainPadding.Name = "ClipboardMainPadding"
	ClipboardMainPadding.Parent = ClipboardMain
	ClipboardMainPadding.PaddingBottom = UDim.new(0, 10)
	ClipboardMainPadding.PaddingLeft = UDim.new(0, 10)
	ClipboardMainPadding.PaddingRight = UDim.new(0, 10)

	ClipboardMainLayout.Name = "ClipboardMainLayout"
	ClipboardMainLayout.Parent = ClipboardMain
	ClipboardMainLayout.SortOrder = Enum.SortOrder.LayoutOrder
	ClipboardMainLayout.Padding = UDim.new(0, 5)

	ClipboardContent.Name = "ClipboardContent"
	ClipboardContent.Parent = ClipboardMain
	ClipboardContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ClipboardContent.BackgroundTransparency = 0.950
	ClipboardContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ClipboardContent.BorderSizePixel = 0
	ClipboardContent.Size = UDim2.new(1, -25, 0, 20)

	ClipboardContentCorner.CornerRadius = UDim.new(0, 3)
	ClipboardContentCorner.Name = "ClipboardContentCorner"
	ClipboardContentCorner.Parent = ClipboardContent

	ClipboardContentText.Name = "ClipboardContentText"
	ClipboardContentText.Parent = ClipboardContent
	ClipboardContentText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ClipboardContentText.BackgroundTransparency = 1.000
	ClipboardContentText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ClipboardContentText.BorderSizePixel = 0
	ClipboardContentText.Position = UDim2.new(0, 5, 0, 0)
	ClipboardContentText.Size = UDim2.new(1, -10, 0, 0)
	ClipboardContentText.Font = Enum.Font.GothamBold
	ClipboardContentText.Text = ""
	ClipboardContentText.TextColor3 = Color3.fromRGB(141, 141, 141)
	ClipboardContentText.TextSize = 12.000
	ClipboardContentText.TextWrapped = true
	ClipboardContentText.TextXAlignment = Enum.TextXAlignment.Left
	ClipboardContentText.AutomaticSize = Enum.AutomaticSize.Y
	ClipboardContentText.AutomaticSize = Enum.AutomaticSize.Y

	ClipboardContentPadding.Name = "ClipboardContentPadding"
	ClipboardContentPadding.Parent = ClipboardContent
	ClipboardContentPadding.PaddingTop = UDim.new(0, 4)
	ClipboardContentPadding.PaddingBottom = UDim.new(0, 5)

	ClipboardContentTrigger.Name = "ClipboardContentTrigger"
	ClipboardContentTrigger.Parent = ClipboardContent
	ClipboardContentTrigger.Active = false
	ClipboardContentTrigger.AnchorPoint = Vector2.new(1, 0.5)
	ClipboardContentTrigger.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ClipboardContentTrigger.BackgroundTransparency = 1.000
	ClipboardContentTrigger.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ClipboardContentTrigger.BorderSizePixel = 0
	ClipboardContentTrigger.Position = UDim2.new(1, 25, 0.5, -2)
	ClipboardContentTrigger.Size = UDim2.new(0, 18, 0, 18)
	ClipboardContentTrigger.Image = "rbxassetid://10709798574"

	return Clipboard
end)

resources.textbox = (function(inst)
	local Textbox = Instance.new("Frame")
	local TextboxPadding = Instance.new("UIPadding")
	local TextboxMain = Instance.new("Frame")
	local TextboxMainCorner = Instance.new("UICorner")
	local TextboxMainTItle = Instance.new("TextLabel")
	local TextboxMainPadding = Instance.new("UIPadding")
	local TextboxMainLayout = Instance.new("UIListLayout")
	local TextboxContent = Instance.new("Frame")
	local TextboxContentCorner = Instance.new("UICorner")
	local TextboxContentText_2 = Instance.new("TextLabel")
	local TextboxContentPadding = Instance.new("UIPadding")
	local TextboxContentTrigger = Instance.new("ImageButton")
	local TextboxContentText = Instance.new("TextBox")

	Textbox.Name = "Textbox"
	Textbox.Parent = inst
	Textbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Textbox.BackgroundTransparency = 1.000
	Textbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Textbox.BorderSizePixel = 0
	Textbox.Size = UDim2.new(1, 0, 0, 0)
	Textbox.AutomaticSize = Enum.AutomaticSize.Y

	TextboxPadding.Name = "TextboxPadding"
	TextboxPadding.Parent = Textbox
	TextboxPadding.PaddingLeft = UDim.new(0, 5)
	TextboxPadding.PaddingRight = UDim.new(0, 5)

	TextboxMain.Name = "TextboxMain"
	TextboxMain.Parent = Textbox
	TextboxMain.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	TextboxMain.BackgroundTransparency = 0.700
	TextboxMain.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextboxMain.BorderSizePixel = 0
	TextboxMain.Size = UDim2.new(1, 0, 1, 0)
	TextboxMain.AutomaticSize = Enum.AutomaticSize.Y

	TextboxMainCorner.CornerRadius = UDim.new(0, 3)
	TextboxMainCorner.Name = "TextboxMainCorner"
	TextboxMainCorner.Parent = TextboxMain

	TextboxMainTItle.Name = "TextboxMainTItle"
	TextboxMainTItle.Parent = TextboxMain
	TextboxMainTItle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextboxMainTItle.BackgroundTransparency = 1.000
	TextboxMainTItle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextboxMainTItle.BorderSizePixel = 0
	TextboxMainTItle.Size = UDim2.new(1, 0, 0, 19)
	TextboxMainTItle.Font = Enum.Font.GothamBold
	TextboxMainTItle.Text = "Discord Link"
	TextboxMainTItle.TextColor3 = Color3.fromRGB(200, 200, 200)
	TextboxMainTItle.TextSize = 13.000
	TextboxMainTItle.TextWrapped = true
	TextboxMainTItle.TextXAlignment = Enum.TextXAlignment.Left
	TextboxMainTItle.TextYAlignment = Enum.TextYAlignment.Bottom

	TextboxMainPadding.Name = "TextboxMainPadding"
	TextboxMainPadding.Parent = TextboxMain
	TextboxMainPadding.PaddingBottom = UDim.new(0, 10)
	TextboxMainPadding.PaddingLeft = UDim.new(0, 10)
	TextboxMainPadding.PaddingRight = UDim.new(0, 10)

	TextboxMainLayout.Name = "TextboxMainLayout"
	TextboxMainLayout.Parent = TextboxMain
	TextboxMainLayout.SortOrder = Enum.SortOrder.LayoutOrder
	TextboxMainLayout.Padding = UDim.new(0, 5)

	TextboxContent.Name = "TextboxContent"
	TextboxContent.Parent = TextboxMain
	TextboxContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextboxContent.BackgroundTransparency = 0.950
	TextboxContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextboxContent.BorderSizePixel = 0
	TextboxContent.Size = UDim2.new(1, -25, 0, 0)
	TextboxContent.AutomaticSize = Enum.AutomaticSize.Y

	TextboxContentCorner.CornerRadius = UDim.new(0, 3)
	TextboxContentCorner.Name = "TextboxContentCorner"
	TextboxContentCorner.Parent = TextboxContent

	TextboxContentText_2.Name = "TextboxContentText_2"
	TextboxContentText_2.Parent = TextboxContent
	TextboxContentText_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextboxContentText_2.BackgroundTransparency = 1.000
	TextboxContentText_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextboxContentText_2.BorderSizePixel = 0
	TextboxContentText_2.Position = UDim2.new(0, 5, 0, 0)
	TextboxContentText_2.Size = UDim2.new(1, -10, 0, 0)
	TextboxContentText_2.Visible = false
	TextboxContentText_2.Font = Enum.Font.GothamBold
	TextboxContentText_2.Text = "discord.gg/codeline"
	TextboxContentText_2.TextColor3 = Color3.fromRGB(141, 141, 141)
	TextboxContentText_2.TextSize = 12.000
	TextboxContentText_2.TextWrapped = true
	TextboxContentText_2.TextXAlignment = Enum.TextXAlignment.Left

	TextboxContentPadding.Name = "TextboxContentPadding"
	TextboxContentPadding.Parent = TextboxContent
	TextboxContentPadding.PaddingBottom = UDim.new(0, 5)
	TextboxContentPadding.PaddingTop = UDim.new(0, 4)

	TextboxContentTrigger.Name = "TextboxContentTrigger"
	TextboxContentTrigger.Parent = TextboxContent
	TextboxContentTrigger.Active = false
	TextboxContentTrigger.AnchorPoint = Vector2.new(1, 0.5)
	TextboxContentTrigger.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextboxContentTrigger.BackgroundTransparency = 1.000
	TextboxContentTrigger.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextboxContentTrigger.BorderSizePixel = 0
	TextboxContentTrigger.Position = UDim2.new(1, 25, 0.5, 0)
	TextboxContentTrigger.Size = UDim2.new(0, 18, 0, 18)
	TextboxContentTrigger.Image = "rbxassetid://10723416765"

	TextboxContentText.Name = "TextboxContentText"
	TextboxContentText.Parent = TextboxContent
	TextboxContentText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextboxContentText.BackgroundTransparency = 1.000
	TextboxContentText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextboxContentText.BorderSizePixel = 0
	TextboxContentText.Position = UDim2.new(0, 5, 0, 0)
	TextboxContentText.Size = UDim2.new(1, -10, 0, 0)
	TextboxContentText.ClearTextOnFocus = false
	TextboxContentText.Font = Enum.Font.GothamBold
	TextboxContentText.Text = ""
	TextboxContentText.TextColor3 = Color3.fromRGB(141, 141, 141)
	TextboxContentText.TextSize = 12.000
	TextboxContentText.TextWrapped = true
	TextboxContentText.TextXAlignment = Enum.TextXAlignment.Left
	TextboxContentText.AutomaticSize = Enum.AutomaticSize.Y

	return Textbox
end)

resources.section = (function(inst)
	local Section = Instance.new("Frame")
	local SectionCorner = Instance.new("UICorner")
	local SectionTopbar = Instance.new("Frame")
	local SectionTopbarCorner = Instance.new("UICorner")
	local SectionTopbarTitle = Instance.new("TextLabel")
	local SectionTopbarPadding = Instance.new("UIPadding")
	local SectionTopbarLayout = Instance.new("UIListLayout")
	local SectionTopbarDescription = Instance.new("TextLabel")
	local SectionTopbarCornerHider = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")

	Section.Name = "Section"
	Section.Parent = inst
	Section.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Section.BackgroundTransparency = 0.700
	Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Section.BorderSizePixel = 0
	Section.Size = UDim2.new(1, 0, 0, 250)

	SectionCorner.CornerRadius = UDim.new(0, 5)
	SectionCorner.Name = "SectionCorner"
	SectionCorner.Parent = Section

	SectionTopbar.Name = "SectionTopbar"
	SectionTopbar.Parent = Section
	SectionTopbar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	SectionTopbar.BackgroundTransparency = 0.700
	SectionTopbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SectionTopbar.BorderSizePixel = 0
	SectionTopbar.Size = UDim2.new(1, 0, 0, 0)
	SectionTopbar.AutomaticSize = Enum.AutomaticSize.Y

	SectionTopbarCorner.CornerRadius = UDim.new(0, 5)
	SectionTopbarCorner.Name = "SectionTopbarCorner"
	SectionTopbarCorner.Parent = SectionTopbar

	SectionTopbarTitle.Name = "SectionTopbarTitle"
	SectionTopbarTitle.Parent = SectionTopbar
	SectionTopbarTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SectionTopbarTitle.BackgroundTransparency = 1.000
	SectionTopbarTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SectionTopbarTitle.BorderSizePixel = 0
	SectionTopbarTitle.Position = UDim2.new(0, 10, 0, 0)
	SectionTopbarTitle.Size = UDim2.new(1, -10, 0, 0)
	SectionTopbarTitle.Font = Enum.Font.GothamBold
	SectionTopbarTitle.Text = "Farming"
	SectionTopbarTitle.TextColor3 = Color3.fromRGB(222, 222, 222)
	SectionTopbarTitle.TextSize = 14.000
	SectionTopbarTitle.TextWrapped = true
	SectionTopbarTitle.TextXAlignment = Enum.TextXAlignment.Left
	SectionTopbarTitle.AutomaticSize = Enum.AutomaticSize.Y

	SectionTopbarPadding.Name = "SectionTopbarPadding"
	SectionTopbarPadding.Parent = SectionTopbar
	SectionTopbarPadding.PaddingTop = UDim.new(0, 8)
	SectionTopbarPadding.PaddingBottom = UDim.new(0, 8)

	SectionTopbarLayout.Name = "SectionTopbarLayout"
	SectionTopbarLayout.Parent = SectionTopbar
	SectionTopbarLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
	SectionTopbarLayout.SortOrder = Enum.SortOrder.LayoutOrder
	SectionTopbarLayout.Padding = UDim.new(0, 3)

	SectionTopbarDescription.Name = "SectionTopbarDescription"
	SectionTopbarDescription.Parent = SectionTopbar
	SectionTopbarDescription.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SectionTopbarDescription.BackgroundTransparency = 1.000
	SectionTopbarDescription.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SectionTopbarDescription.BorderSizePixel = 0
	SectionTopbarDescription.Position = UDim2.new(0.0266666673, 0, -0.266666681, 0)
	SectionTopbarDescription.Size = UDim2.new(1, -10, 0, 10)
	SectionTopbarDescription.Font = Enum.Font.GothamBold
	SectionTopbarDescription.Text = "farms your shit and gets tons of money. just sleep and you wake up with hell tons of money!"
	SectionTopbarDescription.TextColor3 = Color3.fromRGB(156, 156, 156)
	SectionTopbarDescription.TextSize = 11.000
	SectionTopbarDescription.TextWrapped = true
	SectionTopbarDescription.TextXAlignment = Enum.TextXAlignment.Left
	SectionTopbarDescription.AutomaticSize = Enum.AutomaticSize.Y

	SectionTopbarCornerHider.Name = "SectionTopbarCornerHider"
	SectionTopbarCornerHider.Parent = SectionTopbar
	SectionTopbarCornerHider.BackgroundColor3 = mainui.Color
	SectionTopbarCornerHider.BackgroundTransparency = 0.7
	SectionTopbarCornerHider.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SectionTopbarCornerHider.BorderSizePixel = 0
	SectionTopbarCornerHider.Size = UDim2.new(1, 0, 0, 3)
	SectionTopbarCornerHider.Visible = false
	SectionTopbarCornerHider.AnchorPoint = Vector2.new(0, 1)

	UIListLayout.Parent = Section
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 3)

	return Section
end)

elements.switch = (function(inst, con)
	print("switch")
	con = con or {}
	con.Name = con.Name or "epic switch"
	con.Default = con.Default or false
	con.Callback = con.Callback or function() end

	local switch = resources.switch(inst)
	local switchfunctions = {}
	local toggled = false

	switch.SwitchMain.SwitchMainText.Text = con.Name

	switchfunctions.Toggle = (function()
		if not toggled then
			ts:Create(switch.SwitchMain.SwitchFrame.SwitchFrameCircle, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {Position = UDim2.new(1, -21, 0.5, 0)}):Play()
			ts:Create(switch.SwitchMain.SwitchFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {BackgroundTransparency = 0}):Play()
			--ts:Create(switch.SwitchMain.SwitchFrame.SwitchFrameStroke, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {Transparency = 1}):Play()
		else
			ts:Create(switch.SwitchMain.SwitchFrame.SwitchFrameCircle, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {Position = UDim2.new(0, 0, 0.5, 0)}):Play()
			ts:Create(switch.SwitchMain.SwitchFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {BackgroundTransparency = 1}):Play()
			--ts:Create(switch.SwitchMain.SwitchFrame.SwitchFrameStroke, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {Transparency = 0}):Play()
		end
		toggled = not toggled
	end)

	switch.SwitchMain.SwitchFrame.MouseButton1Click:Connect(function()
		switchfunctions.Toggle()
		con.Callback(toggled)
	end)

	return switchfunctions
end)

elements.slider = (function(inst, con)
	con = con or {}
	con.Name = con.Name or "slider"
	con.Default = con.Default or 0
	con.Min = con.Min or 0
	con.Max = con.Max or 100
	con.Step = con.Step or 0
	con.Prefix = con.Prefix or ""
	con.Callback = con.Callback or function(a)  end

    local slider = resources.slider(inst)
    local sliderfunctions = {}

    slider.SliderMain.SliderMainText.Text = con.Name

    local mouse = game:GetService("Players").LocalPlayer:GetMouse()
	local uis = game:GetService("UserInputService")
	local Min_Value = con.Min
	local Max_Value = con.Max
	local Bar = slider.SliderMain.SliderMainBar.SliderMainBarFill
	local Sliderbox = slider.SliderMain.SliderMainValue
	local Trigger = slider.SliderMain.SliderMainBar.SliderMainBarFill.SliderMainBarFillCircle
	local DefaultValue = con.Default
	local isSliding = false
	local sliderFormat = "%."..tostring(con.Step or 0).."f"
	
	if DefaultValue then 
		if DefaultValue <= Min_Value then 
            DefaultValue = Min_Value 
        elseif DefaultValue >= Max_Value then 
            DefaultValue = Max_Value 
        end
		Bar.Size = UDim2.new(1 - ((Max_Value - DefaultValue) / (Max_Value - Min_Value)),0, 0, slider.SliderMain.SliderMainBar.AbsoluteSize.Y)
		Sliderbox.Text = tostring(DefaultValue).. con.Prefix
		con.Callback(DefaultValue)
	end
	
	Trigger.MouseButton1Down:Connect(function()
		isSliding = true
		local value = tonumber(string.format(sliderFormat,(((Max_Value - Min_Value) / (slider.SliderMain.SliderMainBar.AbsoluteSize.X - 0)) * Bar.AbsoluteSize.X) + tonumber(Min_Value)))
		pcall(function()
			con.Callback(value)
			Sliderbox.Text = tostring(value).. con.Prefix
			--CONFIG[name][con.Name] = value
		end)
		Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, (slider.SliderMain.SliderMainBar.AbsoluteSize.X - 0)), 0, slider.SliderMain.SliderMainBar.AbsoluteSize.Y)
		ts:Create(Trigger.SliderMainBarFillCircleStrokeInner, TweenInfo.new(1, Enum.EasingStyle.Quart), {Thickness = 15}):Play()
		moveconnection = mouse.Move:Connect(function()   
			local value = tonumber(string.format(sliderFormat,(((Max_Value - Min_Value) / (slider.SliderMain.SliderMainBar.AbsoluteSize.X - 0)) * Bar.AbsoluteSize.X) + tonumber(Min_Value)))
			pcall(function()
				con.Callback(value)
				Sliderbox.Text = tostring(value).. con.Prefix
				--CONFIG[name][con.Name] = value
			end)
			Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, (slider.SliderMain.SliderMainBar.AbsoluteSize.X - 0)), 0, slider.SliderMain.SliderMainBar.AbsoluteSize.Y)
		end)
		releaseconnection = uis.InputEnded:Connect(function(Mouse)
			if Mouse.UserInputType == Enum.UserInputType.MouseButton1 or Mouse.UserInputType == Enum.UserInputType.Touch then
				local value = tonumber(string.format(sliderFormat,(((Max_Value - Min_Value) / (slider.SliderMain.SliderMainBar.AbsoluteSize.X - 0)) * Bar.AbsoluteSize.X) + tonumber(Min_Value)))
				pcall(function()
					con.Callback(value)
					Sliderbox.Text = tostring(value).. con.Prefix
					--CONFIG[name][con.Name] = value
				end)
				Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, (slider.SliderMain.SliderMainBar.AbsoluteSize.X - 0)), 0, slider.SliderMain.SliderMainBar.AbsoluteSize.Y)
			end
		end)
		uis.InputEnded:Connect(function(Mouse)
			if Mouse.UserInputType == Enum.UserInputType.MouseButton1 or Mouse.UserInputType == Enum.UserInputType.Touch then
				ts:Create(Trigger.SliderMainBarFillCircleStrokeInner, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {Thickness = 0}):Play()
				moveconnection:Disconnect()
				releaseconnection:Disconnect()
				isSliding = false
			end
		end)
	end)

    sliderfunctions.SetValue = (function(value)
        if value <= Min_Value then 
            value = Min_Value 
        elseif value >= Max_Value then 
            value = Max_Value 
        end
        Bar.Size = UDim2.new(1 - ((Max_Value - value) / (Max_Value - Min_Value)), 0, 0, slider.SliderMain.SliderMainBar.AbsoluteSize.Y)
        Sliderbox.Text = tostring(value).. con.Prefix
        con.Callback(value)
    end)

    return sliderfunctions
end)

elements.button = (function(inst, con)
	con = con or {}
	con.Name = con.Name or "button"
	con.Image = con.Image or "rbxassetid://10734898355"
	con.HideImage = con.HideImage or false
	con.Callback = con.Callback or function() end

	local button = resources.button(inst)
	local buttonfunctions = {}

	button.ButtonMain.ButtonMainText.Text = con.Name
	button.ButtonMain.ButtonMainLabel.Image = con.Image

	if con.HideImage then
		button.ButtonMain.ButtonMainLabel.Visible = false
	end

	button.ButtonMain.MouseButton1Click:Connect(function()
		con.Callback(button)
		resources.doripple(button.ButtonMain2)
	end)

	return buttonfunctions, button
end)

elements.list = (function(inst, con)
    -- TODO: refactor almost the entire function because i uses ai for this
	con = con or {}
	con.Name = con.Name or "List"
	con.List = con.List or {"Option 1", "Option 2", "Option 3"}
	con.Default = con.Default or con.List[1] or "nil"
	con.MultiSelect = con.MultiSelect or false
	con.Callback = con.Callback or function() end

	local list = resources.listelement(inst)
	local listcontent = resources.listblackscreen()
	local listfunctions = {}

	list.ListMain.ListMainText.Text = con.Name
	listcontent.ListTitle.Text = con.Name

	local selectedValues = {}
	local selectedOrder = {}

	local function selectionText()
		if #selectedOrder == 0 then
			return "None"
		end
		return table.concat(selectedOrder, ", ")
	end

	local function updateSelectionDisplay()
		local text = selectionText()
		listcontent.ListSelected.Text = "Selected: " .. text
		list.ListMain.ListList.ListListText.Text = text
		if con.MultiSelect then
			con.Callback(selectedOrder)
		else
			con.Callback(selectedOrder[1])
		end
	end

	local function selectValue(value)
		if not selectedValues[value] then
			selectedValues[value] = true
			table.insert(selectedOrder, value)
		end
	end

	local function deselectValue(value)
		if selectedValues[value] then
			selectedValues[value] = nil
			for idx, stored in ipairs(selectedOrder) do
				if stored == value then
					table.remove(selectedOrder, idx)
					break
				end
			end
		end
	end

	local function shouldDefaultValue(value)
		if con.MultiSelect and type(con.Default) == "table" then
			for _, defaultValue in ipairs(con.Default) do
				if defaultValue == value then
					return true
				end
			end
			return false
		end
		return value == con.Default
	end

	for i,v in con.List do
		local _, option = elements.button(listcontent.ListScroll, {
			Name = tostring(v);
			Image = "rbxassetid://10709790644";
			Callback = function(buttoninst)
				if con.MultiSelect then
					if selectedValues[v] then
						deselectValue(v)
						ts:Create(buttoninst.ButtonMain.ButtonMainLabel, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {Size = UDim2.new(0, 0, 0, 0)}):Play()
					else
						selectValue(v)
						ts:Create(buttoninst.ButtonMain.ButtonMainLabel, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {Size = UDim2.new(0, 18, 0, 18)}):Play()
					end
					updateSelectionDisplay()
				else
					for i2,v2 in listcontent.ListScroll:GetChildren() do
						if v2:IsA("Frame") then
							ts:Create(v2.ButtonMain.ButtonMainLabel, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {Size = UDim2.new(0, 0, 0, 0)}):Play()
						end
					end
					ts:Create(buttoninst.ButtonMain.ButtonMainLabel, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {Size = UDim2.new(0, 18, 0, 18)}):Play()
					selectedValues[v] = true
					selectedOrder = {v}
					updateSelectionDisplay()
				end
			end;
		})
		option.ButtonMain.ButtonMainLabel.Size = UDim2.new(0, 0, 0, 0)

		if shouldDefaultValue(v) then
			selectValue(v)
			ts:Create(option.ButtonMain.ButtonMainLabel, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {Size = UDim2.new(0, 18, 0, 18)}):Play()
		end
	end

	if #selectedOrder > 0 then
		updateSelectionDisplay()
	end

	list.ListMain.ListList.MouseButton1Click:Connect(function()
		for i,v in Blackscreen:GetChildren() do
			if v:IsA("Frame") then
				v.Visible = false
			end
		end
		Blackscreen.Visible = true
		listcontent.Visible = true
		ts:Create(Blackscreen, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {
			GroupTransparency = 0;
			Size = UDim2.new(1, 0, 1, 0);
		}):Play()
	end)

	listcontent.ListTitle.ListClose.MouseButton1Click:Connect(function()
		ts:Create(Blackscreen, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {
			GroupTransparency = 1;
			Size = UDim2.new(1, -10, 1, -10);
		}):Play()
		task.delay(0.25, function()
			Blackscreen.Visible = false
		end)
	end)

	listfunctions.Refresh = (function(newlist)
		selectedValues = {}
		selectedOrder = {}
		listcontent.ListSelected.Text = "Selected: None"
		list.ListMain.ListList.ListListText.Text = ""

		for i,v in listcontent.ListScroll:GetChildren() do
			if v:IsA("Frame") then
				v:Destroy()
			end
		end
		for i,v in newlist do
			local _, option = elements.button(listcontent.ListScroll, {
				Name = tostring(v);
				Image = "rbxassetid://10709790644";
				Callback = function(buttoninst)
					if con.MultiSelect then
						if selectedValues[v] then
							deselectValue(v)
							ts:Create(buttoninst.ButtonMain.ButtonMainLabel, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {Size = UDim2.new(0, 0, 0, 0)}):Play()
						else
							selectValue(v)
							ts:Create(buttoninst.ButtonMain.ButtonMainLabel, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {Size = UDim2.new(0, 18, 0, 18)}):Play()
						end
						updateSelectionDisplay()
					else
						for i2,v2 in listcontent.ListScroll:GetChildren() do
							if v2:IsA("Frame") then
								ts:Create(v2.ButtonMain.ButtonMainLabel, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {Size = UDim2.new(0, 0, 0, 0)}):Play()
							end
						end
						ts:Create(buttoninst.ButtonMain.ButtonMainLabel, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {Size = UDim2.new(0, 18, 0, 18)}):Play()
						selectedValues[v] = true
						selectedOrder = {v}
						updateSelectionDisplay()
					end
				end
			})
			option.ButtonMain.ButtonMainLabel.Size = UDim2.new(0, 0, 0, 0)
		end
	end)

	return listfunctions
end)

elements.paragraph = (function(inst, name, desc)
	local paragraph = resources.paragraph(inst)
	local paragraphfunctions = {}

	paragraph.ParagraphMain.ParagraphMainTitle.Text = name or "Paragraph"
	paragraph.ParagraphMain.ParagraphMainContent.Text = desc or "Description"

	paragraphfunctions.SetTitle = (function(newtitle)
		paragraph.ParagraphMain.ParagraphMainTitle.Text = newtitle
	end)

	paragraphfunctions.SetDesc = (function(newdesc)
		paragraph.ParagraphMain.ParagraphMainContent.Text = newdesc
	end)

	return paragraph
end)

elements.clipboard = (function(inst, name, cont)
	local setclipboard = setclipboard or function() end
	local clipboard = resources.clipboard(inst)
	local clipboardfunctions = {}

	clipboard.ClipboardMain.ClipboardMainTItle.Text = name or "Clipboard"
	clipboard.ClipboardMain.ClipboardContent.ClipboardContentText.Text = cont or "Content"

	clipboardfunctions.SetTitle = (function(newtitle)
		clipboard.ClipboardMain.ClipboardMainTItle.Text = newtitle
	end)

	clipboardfunctions.SetContent = (function(newcontent)
		clipboard.ClipboardMain.ClipboardContent.ClipboardContentText.Text = newcontent
	end)

	clipboard.ClipboardMain.ClipboardContent.ClipboardContentTrigger.MouseButton1Click:Connect(function()
		setclipboard(clipboard.ClipboardMain.ClipboardContent.ClipboardContentText.Text)
		ts:Create(clipboard.ClipboardMain.ClipboardContent.ClipboardContentTrigger, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {ImageColor3 = mainui.Color}):Play()
		task.delay(0.25, function()
			ts:Create(clipboard.ClipboardMain.ClipboardContent.ClipboardContentTrigger, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
		end)
		print("Copied to clipboard: ".. clipboard.ClipboardMain.ClipboardContent.ClipboardContentText.Text)
	end)

	return clipboardfunctions
end)

elements.textbox = (function(inst, con)
	con = con or {}
	con.Name = con.Name or "textbox"
	con.Placeholder = con.Placeholder or "..."
	con.FocusLostApply = con.FocusLostApply or true
	con.NumbersOnly = con.NumbersOnly or false
	con.Callback = con.Callback or function() end

	local textbox = resources.textbox(inst)
	local textboxfunctions = {}

	textbox.TextboxMain.TextboxMainTItle.Text = con.Name
	textbox.TextboxMain.TextboxContent.TextboxContentText.PlaceholderText = con.Placeholder

	if con.NumbersOnly then
		textbox.TextboxMain.TextboxContent.TextboxContentText:GetPropertyChangedSignal("Text"):Connect(function()
			local text = textbox.TextboxMain.TextboxContent.TextboxContentText.Text
			if text ~= "" and not tonumber(text) then
				textbox.TextboxMain.TextboxContent.TextboxContentText.Text = text:sub(1, #text - 1)
			end
		end)
	end
	
	textbox.TextboxMain.TextboxContent.TextboxContentText.FocusLost:Connect(function(enter)
		if con.FocusLostApply then
			con.Callback(textbox.TextboxMain.TextboxContent.TextboxContentText.Text, enter)
		elseif enter then
			con.Callback(textbox.TextboxMain.TextboxContent.TextboxContentText.Text, enter)
		end
	end)

	textbox.TextboxMain.TextboxContent.TextboxContentTrigger.MouseButton1Click:Connect(function()
		con.Callback(textbox.TextboxMain.TextboxContent.TextboxContentText.Text, true)
	end)

	return textboxfunctions
end)

elements.section = (function(inst, name, desc)
	local section = resources.section(inst)
	local sectionelements = {}

	section.SectionTopbar.SectionTopbarTitle.Text = name or "Section"
	if desc then
		section.SectionTopbar.SectionTopbarDescription.Text = desc
		print(desc)
	else
		section.SectionTopbar.SectionTopbarDescription:Destroy()
		section.SectionTopbar.SectionTopbarLayout:Destroy()
		section.SectionTopbar.SectionTopbarTitle.AnchorPoint = Vector2.new(0, 0.5)
		section.SectionTopbar.SectionTopbarTitle.Position = UDim2.new(0, 10, 0.5, -2)
		section.SectionTopbar.SectionTopbarPadding.PaddingTop = UDim.new(0, 0)
		section.SectionTopbar.SectionTopbarPadding.PaddingBottom = UDim.new(0, 0)
		section.SectionTopbar.SectionTopbarCornerHider.Visible = true
		section.SectionTopbar.SectionTopbarCornerHider.Position = UDim2.new(0, 0, 1, 0)
		section.SectionTopbar.Size = UDim2.new(1, 0, 0, 33)
	end

	game:GetService("RunService").RenderStepped:Connect(function()
		-- if desc then
		-- 	section.SectionTopbar.Size = UDim2.new(1, 0, 0, section.SectionTopbar.SectionTopbarLayout.AbsoluteContentSize.Y + 15)
		-- end
		section.Size = UDim2.new(1, 0, 0, section.UIListLayout.AbsoluteContentSize.Y + 5)
	end)
	
	for i,v in elements do
		local name = i:sub(1,1):upper().. i:sub(2)
		sectionelements["Add".. name] = (function(...)
			return elements[i](section, ...)
		end)
	end

	return sectionelements
end)

mainui.StartUi = (function(con)
	con = con or {}
	con.Name = con.Name or "Codeline"
	con.SubName = con.SubName or "UI Library"
	con.BottomSubText = con.BottomSubText or "hmm"
	con.MaximizeImage = con.MaximizeImage or nil
	con.Size = con.Size or UDim2.new(0, 510, 0, 355)

	local test = Instance.new("ScreenGui")
	local Window = Instance.new("CanvasGroup")
	local WindowCorner = Instance.new("UICorner")
	local WindowStroke = Instance.new("UIStroke")
	local SubText = Instance.new("TextLabel")
	local Actions = Instance.new("Frame")
	local ActionsLayout = Instance.new("UIListLayout")
	local MainWindow = Instance.new("CanvasGroup")
	local MainWindowCorner = Instance.new("UICorner")
	local Container = Instance.new("CanvasGroup")
	local Sidebar = Instance.new("Frame")
	local SidebarPadding = Instance.new("UIPadding")
	local SidebarLayout = Instance.new("UIListLayout")
	local Topbar = Instance.new("Frame")
	local TopbarCorner = Instance.new("UICorner")
	local TopbarSubtext = Instance.new("TextLabel")
	local TopbarTitle = Instance.new("TextLabel")
	local TopbarLine = Instance.new("Frame")
	local TopbarImage = Instance.new("ImageLabel")
	local TopbarMinimze = Instance.new("ImageButton")
    local Intro = Instance.new("CanvasGroup")
    local IntroCorner = Instance.new("UICorner")
    local IntroStroke = Instance.new("UIStroke")
	local Maximize = Instance.new("TextButton")
	local MaximizeStroke = Instance.new("UIStroke")
	local MaximizeCorner = Instance.new("UICorner")
	local MaximizeLayout = Instance.new("UIListLayout")
	local MaximizePadding = Instance.new("UIPadding")
	local MaximizeImage = Instance.new("ImageButton")
	local MaximizeText = Instance.new("TextLabel")

	test.Name = "test"
	test.Parent = game:GetService("RunService"):IsStudio() and game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui") or game:GetService("CoreGui")
	test.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Window.Name = "Window"
	Window.Parent = test
	Window.AnchorPoint = Vector2.new(0.5, 0.5)
	Window.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
	Window.BackgroundTransparency = 0.550
	Window.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Window.BorderSizePixel = 0
	Window.Position = UDim2.new(0.5, 0, 0.5, 0)
	Window.Size = UDim2.new(0,0,0,0) --con.Size

	WindowCorner.Name = "WindowCorner"
	WindowCorner.Parent = Window

	WindowStroke.Name = "WindowStroke"
	WindowStroke.Parent = Window
	WindowStroke.Color = Color3.fromRGB(59, 59, 59)
	WindowStroke.Transparency = 0.630
	WindowStroke.Thickness = 2.000

	SubText.Name = "SubText"
	SubText.Parent = Window
	SubText.AnchorPoint = Vector2.new(0, 1)
	SubText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SubText.BackgroundTransparency = 1.000
	SubText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SubText.BorderSizePixel = 0
	SubText.Position = UDim2.new(0, 7, 1, 0)
	SubText.Size = UDim2.new(0, 200, 0, 18)
	SubText.Font = Enum.Font.SourceSans
	SubText.Text = con.BottomSubText
	SubText.TextColor3 = Color3.fromRGB(255, 255, 255)
	SubText.TextSize = 14.000
	SubText.TextXAlignment = Enum.TextXAlignment.Left

	Actions.Name = "Actions"
	Actions.Parent = Window
	Actions.AnchorPoint = Vector2.new(0, 1)
	Actions.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Actions.BackgroundTransparency = 1.000
	Actions.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Actions.BorderSizePixel = 0
	Actions.Position = UDim2.new(1, -105, 1, 0)
	Actions.Size = UDim2.new(1, -5, 1, -20)

	ActionsLayout.Name = "ActionsLayout"
	ActionsLayout.Parent = Actions
	ActionsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
	ActionsLayout.SortOrder = Enum.SortOrder.LayoutOrder
	ActionsLayout.VerticalAlignment = Enum.VerticalAlignment.Center

	MainWindow.Name = "MainWindow"
	MainWindow.Parent = Window
	MainWindow.AnchorPoint = Vector2.new(0.5, 0)
	MainWindow.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
	MainWindow.BackgroundTransparency = 0.200
	MainWindow.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MainWindow.BorderSizePixel = 0
	MainWindow.Position = UDim2.new(0.5, 0, 0, 3)
	MainWindow.Size = UDim2.new(1, -5, 1, -20)

	Blackscreen.Name = "Blackscreen"
	Blackscreen.Parent = MainWindow
	Blackscreen.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Blackscreen.BackgroundTransparency = 0.5
	Blackscreen.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Blackscreen.BorderSizePixel = 0
	Blackscreen.Size = UDim2.new(1, -10, 1, -10)
	Blackscreen.ZIndex = 2
	-- Blackscreen.AnchorPoint = Vector2.new(0.5, 0.5)
	-- Blackscreen.Position = UDim2.new(0.5, 0, 0.5, 0)

	MainWindowCorner.Name = "MainWindowCorner"
	MainWindowCorner.Parent = MainWindow

	Container.Name = "Container"
	Container.Parent = MainWindow
	Container.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Container.BackgroundTransparency = 1.000
	Container.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Container.BorderSizePixel = 0
	Container.Position = UDim2.new(0, 120, 0, 65)
	Container.Size = UDim2.new(1, -125, 1, -80)
	Container.ZIndex = -1

	Sidebar.Name = "Sidebar"
	Sidebar.Parent = MainWindow
	Sidebar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Sidebar.BackgroundTransparency = 0.800
	Sidebar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Sidebar.BorderSizePixel = 0
	Sidebar.Position = UDim2.new(0, 0, 0, 55)
	Sidebar.Size = UDim2.new(0, 110, 1, -50)

	SidebarPadding.Name = "SidebarPadding"
	SidebarPadding.Parent = Sidebar
	SidebarPadding.PaddingTop = UDim.new(0, 1)

	SidebarLayout.Name = "SidebarLayout"
	SidebarLayout.Parent = Sidebar
	SidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
	SidebarLayout.Padding = UDim.new(0, 2)

	Topbar.Name = "Topbar"
	Topbar.Parent = MainWindow
	Topbar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Topbar.BackgroundTransparency = 0.800
	Topbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Topbar.BorderSizePixel = 0
	Topbar.Size = UDim2.new(1, 0, 0, 55)
	resources.DraggingEnabled(Topbar, Window)

	TopbarCorner.Name = "TopbarCorner"
	TopbarCorner.Parent = Topbar

	TopbarSubtext.Name = "TopbarSubtext"
	TopbarSubtext.Parent = Topbar
	TopbarSubtext.AnchorPoint = Vector2.new(0, 0.5)
	TopbarSubtext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TopbarSubtext.BackgroundTransparency = 1.000
	TopbarSubtext.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TopbarSubtext.BorderSizePixel = 0
	TopbarSubtext.Position = UDim2.new(0, 15, 0.5, 0)
	TopbarSubtext.Size = UDim2.new(0, 200, 0, 35)
	TopbarSubtext.Font = Enum.Font.GothamBold
	TopbarSubtext.Text = con.SubName
	TopbarSubtext.TextColor3 = Color3.fromRGB(93, 93, 93)
	TopbarSubtext.TextSize = 18.000
	TopbarSubtext.TextXAlignment = Enum.TextXAlignment.Left
	TopbarSubtext.TextYAlignment = Enum.TextYAlignment.Bottom

	TopbarTitle.Name = "TopbarTitle"
	TopbarTitle.Parent = Topbar
	TopbarTitle.AnchorPoint = Vector2.new(0, 0.5)
	TopbarTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TopbarTitle.BackgroundTransparency = 1.000
	TopbarTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TopbarTitle.BorderSizePixel = 0
	TopbarTitle.Position = UDim2.new(0, 15, 0.5, 0)
	TopbarTitle.Size = UDim2.new(0, 200, 0, 35)
	TopbarTitle.Font = Enum.Font.GothamBold
	TopbarTitle.Text = con.Name
	TopbarTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	TopbarTitle.TextSize = 18.000
	TopbarTitle.TextXAlignment = Enum.TextXAlignment.Left
	TopbarTitle.TextYAlignment = Enum.TextYAlignment.Top

	TopbarLine.Name = "TopbarLine"
	TopbarLine.Parent = Topbar
	TopbarLine.AnchorPoint = Vector2.new(0, 1)
	TopbarLine.BackgroundColor3 = mainui.Color
	TopbarLine.BackgroundTransparency = 0.700
	TopbarLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TopbarLine.BorderSizePixel = 0
	TopbarLine.Position = UDim2.new(0, 0, 1, 0)
	TopbarLine.Size = UDim2.new(1, 0, 0, 4)

	TopbarImage.Name = "TopbarImage"
	TopbarImage.Parent = Topbar
	TopbarImage.AnchorPoint = Vector2.new(0, 0.5)
	TopbarImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TopbarImage.BackgroundTransparency = 1.000
	TopbarImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TopbarImage.BorderSizePixel = 0
	TopbarImage.Position = UDim2.new(0, 15, 0.5, 0)
	TopbarImage.Size = UDim2.new(0, 200, 0, 35)
	TopbarImage.Image = "https://felixxx.my.id/assets/logo/logo-text.svg"

	TopbarMinimze.Name = "TopbarMinimze"
	TopbarMinimze.Parent = Topbar
	TopbarMinimze.AnchorPoint = Vector2.new(1, 0.5)
	TopbarMinimze.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TopbarMinimze.BackgroundTransparency = 1.000
	TopbarMinimze.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TopbarMinimze.BorderSizePixel = 0
	TopbarMinimze.Position = UDim2.new(1, -15, 0.5, -2)
	TopbarMinimze.Size = UDim2.new(0, 25, 0, 25)
	TopbarMinimze.AutoButtonColor = false
	TopbarMinimze.Image = "rbxassetid://10734895530"

    Intro.Name = "Intro"
    Intro.Parent = Window
    Intro.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
    Intro.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Intro.BorderSizePixel = 0
    Intro.Size = UDim2.new(1, 0, 1, 0)
    Intro.AnchorPoint = Vector2.new(0.5, 0.5)
    Intro.Position = UDim2.new(0.5, 0, 0.5, 0)

    IntroCorner.Name = "IntroCorner"
    IntroCorner.Parent = Intro

    IntroStroke.Name = "IntroStroke"
    IntroStroke.Parent = Intro
    IntroStroke.Color = Color3.fromRGB(59, 59, 59)
    IntroStroke.Transparency = 0.630
    IntroStroke.Thickness = 2.000

	Maximize.Name = "Maximize"
	Maximize.Parent = test
	Maximize.AnchorPoint = Vector2.new(0.5, 0)
	Maximize.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Maximize.BackgroundTransparency = 0.500
	Maximize.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Maximize.BorderSizePixel = 0
	Maximize.Position = UDim2.new(0.5, 0, 0, 20)
	Maximize.Size = UDim2.new(0, 0, 0, 35)
	Maximize.AutoButtonColor = false
	Maximize.Font = Enum.Font.SourceSans
	Maximize.Text = ""
	Maximize.TextColor3 = Color3.fromRGB(0, 0, 0)
	Maximize.TextSize = 14.000
	Maximize.AutomaticSize = Enum.AutomaticSize.X
	Maximize.Visible = false
	resources.DraggingEnabled(Maximize, Maximize)

	MaximizeStroke.Name = "MaximizeStroke"
	MaximizeStroke.Parent = Maximize
	MaximizeStroke.Color = Color3.fromRGB(59, 59, 59)
	MaximizeStroke.Transparency = 0.630
	MaximizeStroke.Thickness = 2.000
	MaximizeStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

	MaximizeCorner.Name = "MaximizeCorner"
	MaximizeCorner.Parent = Maximize

	MaximizeLayout.Name = "MaximizeLayout"
	MaximizeLayout.Parent = Maximize
	MaximizeLayout.FillDirection = Enum.FillDirection.Horizontal
	MaximizeLayout.SortOrder = Enum.SortOrder.LayoutOrder
	MaximizeLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	MaximizeLayout.Padding = UDim.new(0, 5)

	MaximizePadding.Name = "MaximizePadding"
	MaximizePadding.Parent = Maximize
	MaximizePadding.PaddingBottom = UDim.new(0, 10)
	MaximizePadding.PaddingLeft = UDim.new(0, 10)
	MaximizePadding.PaddingRight = UDim.new(0, 10)
	MaximizePadding.PaddingTop = UDim.new(0, 10)

	MaximizeImage.Name = "MaximizeImage"
	MaximizeImage.Parent = Maximize
	MaximizeImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MaximizeImage.BackgroundTransparency = 1.000
	MaximizeImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MaximizeImage.BorderSizePixel = 0
	MaximizeImage.Size = UDim2.new(0, 15, 0, 15)
	MaximizeImage.Image = con.MaximizeImage or "rbxassetid://10734886735"

	MaximizeText.Name = "MaximizeText"
	MaximizeText.Parent = Maximize
	MaximizeText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MaximizeText.BackgroundTransparency = 1.000
	MaximizeText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MaximizeText.BorderSizePixel = 0
	MaximizeText.Size = UDim2.new(0, 0, 0, 14)
	MaximizeText.Font = Enum.Font.GothamBold
	MaximizeText.Text = con.Name
	MaximizeText.TextColor3 = Color3.fromRGB(255, 255, 255)
	MaximizeText.TextSize = 14.000
	MaximizeText.TextXAlignment = Enum.TextXAlignment.Left
	MaximizeText.TextYAlignment = Enum.TextYAlignment.Bottom
	MaximizeText.AutomaticSize = Enum.AutomaticSize.X
	MaximizeText.Visible = con.MaximizeImage == nil

    local easingsty = Enum.EasingStyle.Quint
	local minimized = false

    ts:Create(Window, TweenInfo.new(1, easingsty), {Size = con.Size}):Play()
    task.delay(1.5, function()
        ts:Create(Intro, TweenInfo.new(1, easingsty), {Size = UDim2.new(0,0,0,0)}):Play()
        task.delay(0.7, function()
            Intro:Destroy()
        end)
    end)

	TopbarMinimze.MouseButton1Click:Connect(function()
		-- if not minimized then
		-- 	ts:Create(MainWindow, TweenInfo.new(0.5, easingsty), {Size = UDim2.new(1, -5, 0, 0)}):Play()
		-- 	ts:Create(Sidebar, TweenInfo.new(0.5, easingsty), {Size = UDim2.new(0, 110, 0, 0)}):Play()
		-- 	ts:Create(TopbarLine, TweenInfo.new(0.5, easingsty), {Size = UDim2.new(1, 0, 0, 0)}):Play()
		-- else
		-- 	ts:Create(MainWindow, TweenInfo.new(0.5, easingsty), {Size = UDim2.new(1, -5, 1, -20)}):Play()
		-- 	ts:Create(Sidebar, TweenInfo.new(0.5, easingsty), {Size = UDim2.new(0, 110, 1, -50)}):Play()
		-- 	ts:Create(TopbarLine, TweenInfo.new(0.5, easingsty), {Size = UDim2.new(1, 0, 0, 4)}):Play()
		-- end
		-- minimized = not minimized
		ts:Create(Window, TweenInfo.new(0.25, easingsty), {GroupTransparency = 1, Size = con.Size - UDim2.fromOffset(10, 10)}):Play()
		ts:Create(WindowStroke, TweenInfo.new(0.25, easingsty), {Transparency = 1}):Play()
		Maximize.Visible = true
	end)

	Maximize.MouseButton1Click:Connect(function()
		ts:Create(Window, TweenInfo.new(0.25, easingsty), {GroupTransparency = 0, Size = con.Size}):Play()
		ts:Create(WindowStroke, TweenInfo.new(0.25, easingsty), {Transparency = 0.630}):Play()
		Maximize.Visible = false
	end)

	local pagefunction = {}

	local hadopenfirstpage = false
	pagefunction.AddPage = (function(name, iconlib, iconname)
		local pagefunctions = {}

		local Main = Instance.new("ScrollingFrame")
		local MainLayout = Instance.new("UIListLayout")
		local MainPadding = Instance.new("UIPadding")
		local Main_2 = Instance.new("TextButton")
		local UIListLayout_2 = Instance.new("UIListLayout")
		local UIPadding = Instance.new("UIPadding")
		local ImageLabel = Instance.new("ImageLabel")
		local TextLabel = Instance.new("TextLabel")
		local Frame = Instance.new("Frame")
		local UIGradient = Instance.new("UIGradient")

		Main.Name = "Main"
		Main.Parent = Container
		Main.Active = true
		Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Main.BackgroundTransparency = 1.000
		Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Main.BorderSizePixel = 0
		Main.Size = UDim2.new(1, 0, 1, 0)
		Main.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
		Main.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
		Main.ScrollBarThickness = 5
		Main.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
		Main.Visible = false

		MainLayout.Name = "MainLayout"
		MainLayout.Parent = Main
		MainLayout.SortOrder = Enum.SortOrder.LayoutOrder
        MainLayout.Padding = UDim.new(0, 5)

		game:GetService("RunService").RenderStepped:Connect(function()
			Main.CanvasSize = UDim2.new(0, 0, 0, MainLayout.AbsoluteContentSize.Y)
		end)

		MainPadding.Name = "MainPadding"
		MainPadding.Parent = Main
		MainPadding.PaddingRight = UDim.new(0, 10)

		Main_2.Name = "Main"
		Main_2.Parent = Sidebar
		Main_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Main_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Main_2.BorderSizePixel = 1
		Main_2.Size = UDim2.new(1, 0, 0, 25)
		Main_2.AutoButtonColor = false
		Main_2.Font = Enum.Font.SourceSans
		Main_2.Text = ""
		Main_2.TextColor3 = Color3.fromRGB(0, 0, 0)
		Main_2.TextSize = 14.000
		Main_2.BackgroundTransparency = 1

		UIListLayout_2.Parent = Main_2
		UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
		UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Right
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center
		UIListLayout_2.Padding = UDim.new(0, 3)

		UIPadding.Parent = Main_2
		UIPadding.PaddingLeft = UDim.new(0, 7)

		ImageLabel.Parent = Main_2
		ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ImageLabel.BackgroundTransparency = 1.000
		ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ImageLabel.BorderSizePixel = 0
		ImageLabel.Size = UDim2.new(0, 17, 0, 17)
		--ImageLabel.Image = "rbxassetid://10734950309"

		local iconimageid = "nil"
		local iconlib = iconlib or "lucide"
		if iconlib and iconname and IconsV2 then
			iconimageid = IconsV2.GetIcon(iconlib.. ":".. iconname)
			print(iconimageid)
		elseif iconname:find("rbxassetid://") then
			iconimageid = iconname
		end
		ImageLabel.Image = iconimageid

		TextLabel.Parent = Main_2
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel.BorderSizePixel = 0
		TextLabel.Size = UDim2.new(1, -27, 1, 0)
		TextLabel.Font = Enum.Font.GothamBold
		TextLabel.Text = name
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextSize = 12.000
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left

		Frame.Parent = Main_2
		Frame.BackgroundColor3 = mainui.Color
		Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Frame.BorderSizePixel = 0
		Frame.Size = UDim2.new(0, 0, 1, 0)

		UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(131, 131, 131)), ColorSequenceKeypoint.new(1.00, mainui.Color)}
		UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(1.00, 0.63)}
		UIGradient.Parent = Main_2

		if hadopenfirstpage == false then
			hadopenfirstpage = true
			Container.GroupTransparency = 1
			Container.Position = UDim2.new(0, 120, 0, 75)
			ts:Create(Container, TweenInfo.new(0.15), {GroupTransparency = 0, Position = UDim2.new(0, 120, 0, 65)}):Play()
			for i,v in next, Sidebar:GetChildren() do
				if v:IsA("TextButton") then
					ts:Create(v.Frame, TweenInfo.new(0.15), {Size = UDim2.new(0, 0, 1, 0)}):Play()
					ts:Create(v, TweenInfo.new(0.15), {BackgroundTransparency = 1}):Play()
				end
			end
			ts:Create(Main_2.Frame, TweenInfo.new(0.15), {Size = UDim2.new(0, 4, 1, 0)}):Play()
			ts:Create(Main_2, TweenInfo.new(0.15), {BackgroundTransparency = 0}):Play()
			for i,v in next, Container:GetChildren() do
				if v:IsA("ScrollingFrame") then
					v.Visible = false
				end
			end
			Main.Visible = true
		end

		Main_2.MouseButton1Click:Connect(function()
			Container.GroupTransparency = 1
			Container.Position = UDim2.new(0, 120, 0, 75)
			ts:Create(Container, TweenInfo.new(0.15), {GroupTransparency = 0, Position = UDim2.new(0, 120, 0, 65)}):Play()
			for i,v in next, Sidebar:GetChildren() do
				if v:IsA("TextButton") then
					ts:Create(v.Frame, TweenInfo.new(0.15), {Size = UDim2.new(0, 0, 1, 0)}):Play()
					ts:Create(v, TweenInfo.new(0.15), {BackgroundTransparency = 1}):Play()
				end
			end
			ts:Create(Main_2.Frame, TweenInfo.new(0.15), {Size = UDim2.new(0, 4, 1, 0)}):Play()
			ts:Create(Main_2, TweenInfo.new(0.15), {BackgroundTransparency = 0}):Play()
			for i,v in next, Container:GetChildren() do
				if v:IsA("ScrollingFrame") then
					v.Visible = false
				end
			end
			Main.Visible = true
		end)

		for i,v in elements do
			local name = i:sub(1,1):upper().. i:sub(2)
			pagefunctions["Add".. name] = (function(...)
				return elements[i](Main, ...)
			end)
		end

		return pagefunctions
	end)

	return pagefunction
end)

return mainui
