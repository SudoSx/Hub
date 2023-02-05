--/ check
if game:GetService("CoreGui"):FindFirstChild("playerbackpack") then
    game:GetService("CoreGui").playerbackpack:Destroy()
end

--/ ui 
local playerbackpack = Instance.new("ScreenGui")
local container = Instance.new("Frame")
local frame = Instance.new("Frame")
local backpack = Instance.new("TextLabel")
local listframe = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local UIPadding = Instance.new("UIPadding")
local UIPadding_2 = Instance.new("UIPadding")
local UIPadding_3 = Instance.new("UIPadding")

local UIStroke = Instance.new("UIStroke")
local UIStroke_1 = Instance.new("UIStroke")


playerbackpack.Name = "playerbackpack"
playerbackpack.Parent = game:GetService("CoreGui")
playerbackpack.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

container.Name = "container"
container.Parent = playerbackpack
container.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
container.BorderColor3 = Color3.fromRGB(84, 101, 255)
container.Size = UDim2.new(0, 180, 0, 200)
container.Position = UDim2.new(0,0,0.3,0)

frame.Name = "frame"
frame.Parent = container
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
frame.BorderColor3 = Color3.fromRGB(33, 33, 33)
frame.BorderSizePixel = 2
frame.Size = UDim2.new(1, 0, 1, 0)

backpack.Name = "backpack:"
backpack.Parent = frame
backpack.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
backpack.BorderColor3 = Color3.fromRGB(33, 33, 33)
backpack.BorderSizePixel = 2
backpack.Size = UDim2.new(1, 0, 0.0860000029, 0)
backpack.Font = Enum.Font.Ubuntu
backpack.Text = "Backpack:"
backpack.TextColor3 = Color3.fromRGB(255, 255, 255)
backpack.TextSize = 14.000

listframe.Name = "listframe"
listframe.Parent = frame
listframe.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
listframe.BackgroundTransparency = 1.000
listframe.BorderColor3 = Color3.fromRGB(33, 33, 33)
listframe.Position = UDim2.new(0, 0, 0.0826446265, 0)
listframe.Size = UDim2.new(1, 0, 0.913999975, 0)
listframe.ClipsDescendants = true

UIListLayout.Parent = listframe
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 4)

UIPadding.Parent = listframe
UIPadding.PaddingBottom = UDim.new(0, 4)
UIPadding.PaddingLeft = UDim.new(0, 4)
UIPadding.PaddingRight = UDim.new(0, 4)
UIPadding.PaddingTop = UDim.new(0, 4)

UIPadding_2.Parent = container
UIPadding_2.PaddingBottom = UDim.new(0, 4)
UIPadding_2.PaddingLeft = UDim.new(0, 4)
UIPadding_2.PaddingRight = UDim.new(0, 4)
UIPadding_2.PaddingTop = UDim.new(0, 4)

UIPadding_3.Parent = playerbackpack
UIPadding_3.PaddingBottom = UDim.new(0, 5)
UIPadding_3.PaddingLeft = UDim.new(0, 6)
UIPadding_3.PaddingRight = UDim.new(0, 5)
UIPadding_3.PaddingTop = UDim.new(0, 10)

UIStroke.Color = Color3.fromRGB(0,0,0)
UIStroke.Parent = frame
UIStroke.LineJoinMode = "Miter"

UIStroke_1.Color = Color3.fromRGB(0,0,0)
UIStroke_1.Parent = backpack
UIStroke_1.ApplyStrokeMode = "Border"
UIStroke_1.LineJoinMode = "Miter"

--/ FUNCTION
local player = game:GetService("Players").LocalPlayer
local mouse = player:GetMouse()

local blacklist = {"Fists","Gear","Blade","Spring","Cola","Bagel","Burger","Water","Milk","Orange Juice","Chicken"}

mouse.Move:Connect(function()
    if not mouse.Target then 
        return
    end
    
    if game.Players:FindFirstChild(mouse.Target.Parent.Name) and mouse.Target.Parent:FindFirstChild("Humanoid") then
        
        for i,v in pairs(listframe:GetChildren()) do
            if v.ClassName == "TextLabel" then 
                v:Destroy() 
            end
        end
        backpack.Text = mouse.Target.Parent.Name 
        
        local targetPlayer = game.Players[mouse.Target.Parent.Name]
        
        local equipedTool = targetPlayer.Character:FindFirstChildOfClass("Tool")
        if equipedTool then
            local item = Instance.new("TextLabel")
            item.Text = equipedTool.Name
            item.Name = "item"
            item.Parent = listframe
            item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            item.BackgroundTransparency = 1.000
            item.BorderSizePixel = 0
            item.Size = UDim2.new(1, 0, 0, 15)
            item.Font = Enum.Font.Ubuntu
            item.TextColor3 = Color3.fromRGB(84, 101, 255)
            item.TextSize = 14.000
        end
        
        for i,tool in pairs(targetPlayer.Backpack:GetChildren()) do
            if tool.ClassName == "Tool" then
                if not table.find(blacklist,tool.Name) then 
                    local item = Instance.new("TextLabel")
                    item.Text = tool.Name
                    item.Name = "item"
                    item.Parent = listframe
                    item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    item.BackgroundTransparency = 1.000
                    item.BorderSizePixel = 0
                    item.Size = UDim2.new(1, 0, 0, 15)
                    item.Font = Enum.Font.Ubuntu
                    item.TextColor3 = Color3.fromRGB(255, 255, 255)
                    item.TextSize = 14.000
                end
            end
        end
    else
        
    end
end)


