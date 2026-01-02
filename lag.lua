local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

-- Remote
local Remote = ReplicatedStorage:FindFirstChild("LagTest") or Instance.new("RemoteEvent")
Remote.Name = "LagTest"
Remote.Parent = ReplicatedStorage

-- UI VIP
Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Wait()

	local gui = Instance.new("ScreenGui")
	gui.Name = "VIPMenu"
	gui.ResetOnSpawn = false
	gui.Parent = player:WaitForChild("PlayerGui")

	local frame = Instance.new("Frame", gui)
	frame.Size = UDim2.fromScale(0.28, 0.22)
	frame.Position = UDim2.fromScale(0.36, 0.38)
	frame.BackgroundColor3 = Color3.fromRGB(18,18,18)
	frame.BorderSizePixel = 0
	frame.Active = true
	frame.Draggable = true
	Instance.new("UICorner", frame).CornerRadius = UDim.new(0,20)

	local stroke = Instance.new("UIStroke", frame)
	stroke.Thickness = 2
	stroke.Color = Color3.fromRGB(170, 85, 255)

	local grad = Instance.new("UIGradient", frame)
	grad.Color = ColorSequence.new{
		ColorSequenceKeypoint.new(0, Color3.fromRGB(120,60,255)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(30,30,30))
	}
	grad.Rotation = 45

	local title = Instance.new("TextLabel", frame)
	title.Size = UDim2.fromScale(1,0.32)
	title.BackgroundTransparency = 1
	title.Text = "VIP LAG PANEL"
	title.Font = Enum.Font.GothamBlack
	title.TextScaled = true
	title.TextColor3 = Color3.new(1,1,1)

	local sub = Instance.new("TextLabel", frame)
	sub.Size = UDim2.fromScale(1,0.15)
	sub.Position = UDim2.fromScale(0,0.28)
	sub.BackgroundTransparency = 1
	sub.Text = "Exclusive Test Tool"
	sub.Font = Enum.Font.Gotham
	sub.TextScaled = true
	sub.TextColor3 = Color3.fromRGB(180,180,180)

	local button = Instance.new("TextButton", frame)
	button.Size = UDim2.fromScale(0.8,0.28)
	button.Position = UDim2.fromScale(0.1,0.6)
	button.Text = "EJECUTAR"
	button.Font = Enum.Font.GothamBold
	button.TextScaled = true
	button.TextColor3 = Color3.new(1,1,1)
	button.BackgroundColor3 = Color3.fromRGB(90,40,200)
	button.BorderSizePixel = 0
	Instance.new("UICorner", button).CornerRadius = UDim.new(0,14)

	local glow = Instance.new("UIStroke", button)
	glow.Thickness = 1.5
	glow.Color = Color3.fromRGB(220,180,255)

	-- Animación hover
	button.MouseEnter:Connect(function()
		TweenService:Create(button, TweenInfo.new(0.15), {
			BackgroundColor3 = Color3.fromRGB(120,60,255)
		}):Play()
	end)
	button.MouseLeave:Connect(function()
		TweenService:Create(button, TweenInfo.new(0.15), {
			BackgroundColor3 = Color3.fromRGB(90,40,200)
		}):Play()
	end)

	-- Click
	button.MouseButton1Click:Connect(function()
		TweenService:Create(button, TweenInfo.new(0.08), {
			Size = UDim2.fromScale(0.78,0.26)
		}):Play()
		task.delay(0.08, function()
			TweenService:Create(button, TweenInfo.new(0.08), {
				Size = UDim2.fromScale(0.8,0.28)
			}):Play()
		end)
		Remote:FireServer(player)
	end)
end)

-- Lag (sin límites)
Remote.OnServerEvent:Connect(function(player)
	for i = 1,2000 do
		local p = Instance.new("Part")
		p.Size = Vector3.new(1,1,1)
		p.Position = Vector3.new(math.random(-50,50),10,math.random(-50,50))
		p.Parent = workspace
	end
end)
