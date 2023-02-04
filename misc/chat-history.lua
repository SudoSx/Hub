if game:GetService("CoreGui"):FindFirstChild("HistoryChat") then
    game:GetService("CoreGui"):FindFirstChild("HistoryChat"):Destroy()
end

local Chat = Instance.new("ScreenGui")
local msg = Instance.new("TextLabel")
local container = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local UIPadding = Instance.new("UIPadding")

Chat.Name = "HistoryChat"
Chat.Parent = game:GetService("CoreGui")
Chat.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Chat.ResetOnSpawn = false

container.Name = "container"
container.Parent = Chat
container.Active = true
container.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
container.BackgroundTransparency = 0.9
container.BorderSizePixel = 0
container.Size = UDim2.new(0, 350, 0, 150)
container.ScrollBarThickness = 0
container.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left
container.CanvasPosition = Vector2.new(0,9999)

UIListLayout.Parent = container
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.VerticalAlignment = "Bottom"

UIPadding.Parent = container
UIPadding.PaddingBottom = UDim.new(0, 4)
UIPadding.PaddingLeft = UDim.new(0, 4)
UIPadding.PaddingRight = UDim.new(0, 4)
UIPadding.PaddingTop = UDim.new(0, 4)

function sendMessage(plr, msg)
	local msgr = Instance.new("TextLabel")
    msgr.Parent = container
    msgr.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    msgr.BackgroundTransparency = 1.000
    msgr.BorderSizePixel = 0
    msgr.Position = UDim2.new(1, 0, 0, 0)
    msgr.Size = UDim2.new(1, 0, 0, 15)
    msgr.Font = Enum.Font.Arial
    msgr.Text = plr.Name..": "..msg
    msgr.TextColor3 = Color3.fromRGB(255, 255, 255)
    msgr.TextSize = 12.000
    msgr.TextStrokeTransparency = 0.000
    msgr.TextXAlignment = Enum.TextXAlignment.Left
end

for i,v in pairs(game.Players:GetChildren()) do
	v.Chatted:Connect(function(msg)
		sendMessage(v, msg)
	end)
end

game.Players.ChildAdded:Connect(function(plr)
	if plr:IsA("Player") then
		plr.Chatted:Connect(function(msg)
			sendMessage(plr, msg)
		end)
	end
end)
