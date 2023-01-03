--/ Whitelist
local blacklist_userid = {}

for i,id in pairs(blacklist_userid) do
    if id == game:GetService("Players").LocalPlayer.UserId then
        local AkaliNotif = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))();
        local Notify = AkaliNotif.Notify;
    
        Notify({
            Description = "Zu schwul um monke hub zu benutzen.";
            Title = "Ups!";
            Duration = 5;
        });
    
        return
    end
end


--/ CHECK
if game.PlaceId ~= 10427037408 then
    local AkaliNotif = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))();
    local Notify = AkaliNotif.Notify;

    Notify({
        Description = "Game is not supported.";
        Title = "Error!";
        Duration = 5;
    });

    return
end
---------








local playerBoxActive = false
function addBox()
    local BillboardGui = Instance.new("BillboardGui")
    local Frame = Instance.new("Frame")
    local Frame_2 = Instance.new("Frame")
    local Frame_3 = Instance.new("Frame")
    
    local FrameStroke = Instance.new("UIStroke")
    local Frame_2Stroke = Instance.new("UIStroke")
    local Frame_3Stroke = Instance.new("UIStroke")
    
    BillboardGui.Name = "Sudo"
    BillboardGui.Active = true
    BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    BillboardGui.Active = true
    BillboardGui.AlwaysOnTop = true
    BillboardGui.LightInfluence = 0.000
    BillboardGui.Size = UDim2.new(4, 0, 5, 0)
    
    Frame.Parent = BillboardGui
    Frame.Active = true
    Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Frame.BackgroundTransparency = 1.000
    Frame.Size = UDim2.new(1, 0, 1, 0)
    
    FrameStroke.Parent = Frame
    FrameStroke.Color = Color3.fromRGB(255,255,255)
    FrameStroke.Thickness = 1
    
    Frame_2.Parent = BillboardGui
    Frame_2.Active = true
    Frame_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Frame_2.BackgroundTransparency = 1.000
    Frame_2.Position = UDim2.new(0, -1, 0, -1)
    Frame_2.Size = UDim2.new(1, 2, 1, 2)
    
    Frame_2Stroke.Parent = Frame_2
    Frame_2Stroke.Color = Color3.fromRGB(0,0,0)
    Frame_2Stroke.Thickness = 1
    
    Frame_3.Parent = BillboardGui
    Frame_3.Active = true
    Frame_3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Frame_3.BackgroundTransparency = 1.000
    Frame_3.Position = UDim2.new(0, 1, 0, 1)
    Frame_3.Size = UDim2.new(1, -2, 1, -2)
    
    Frame_3Stroke.Parent = Frame_3
    Frame_3Stroke.Color = Color3.fromRGB(0,0,0)
    Frame_3Stroke.Thickness = 1

    game:GetService("RunService").RenderStepped:Connect(function()
        if playerBoxActive then
            for _,v in next, game:GetService("Players"):GetPlayers() do
                if v.Name ~= game.Players.LocalPlayer.Name then
                    local c1 
                    if v.Character == nil then
                        v.CharacterAdded:wait()
                    else
                        if v.Character:FindFirstChild("Sudo") == nil then 
                            if game:GetService("ReplicatedStorage").PlayerStats[v.Name].Cop.Value == true then
                                FrameStroke.Color = Color3.fromRGB(0, 170, 255)
                            else
                                FrameStroke.Color = Color3.fromRGB(255, 170, 0)
                            end
                            BillboardGui:Clone().Parent = v.Character
                        end
                    end
                end
            end
        else
            for _,v in next, game:GetService("Players"):GetPlayers() do
                if v.Name ~= game.Players.LocalPlayer.Name then
                    local c1 
                    if v.Character == nil then
                        v.CharacterAdded:wait()
                    else
                        if v.Character:FindFirstChild("Sudo") then 
                            v.Character:FindFirstChild("Sudo"):Destroy()
                        end
                    end
                end
            end
        end
    end)
end

local playerHealthbarActive = false
function addHealthbar()
    local BillboardGui = Instance.new("BillboardGui")
    local Frame = Instance.new("Frame")
    local Frame_2 = Instance.new("Frame")
    
    BillboardGui.Name = "SudoHealth"
    BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    BillboardGui.MaxDistance = 9999999999
    BillboardGui.Active = true
    BillboardGui.AlwaysOnTop = true
    BillboardGui.LightInfluence = 1.000
    BillboardGui.Size = UDim2.new(0.08, 0, 5, 0)
    BillboardGui.StudsOffset = Vector3.new(2.3, 0, 0)
    
    Frame.Parent = BillboardGui
    Frame.Active = true
    Frame.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
    Frame.BorderColor3 = Color3.fromRGB(22, 22, 22)
    Frame.Size = UDim2.new(1, 0, 1, 0)
    
    Frame_2.Parent = BillboardGui
    Frame_2.Active = true
    Frame_2.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    Frame_2.BorderSizePixel = 0
    --Frame_2.Size = UDim2.new(1, 0, 1, 0)

    game:GetService("RunService").RenderStepped:Connect(function()
        if playerHealthbarActive then
            for _,v in next, game:GetService("Players"):GetPlayers() do
                Frame_2.Size = UDim2.new(1, 0, v.Character.Humanoid.Health / v.Character.Humanoid.maxHealth, 0)
                if v.Name ~= game.Players.LocalPlayer.Name then
                    local c1 
                    if v.Character == nil then
                        v.CharacterAdded:wait()
                    else
                        if v.Character:FindFirstChild("SudoHealth") then 
                            v.Character:FindFirstChild("SudoHealth"):Destroy()
                        end
                        if v.Character:FindFirstChild("SudoHealth") == nil then 
                            BillboardGui:Clone().Parent = v.Character
                        end
                    end
                end
            end
        else
            for _,v in next, game:GetService("Players"):GetPlayers() do
                if v.Name ~= game.Players.LocalPlayer.Name then
                    local c1 
                    if v.Character == nil then
                        v.CharacterAdded:wait()
                    else
                        if v.Character:FindFirstChild("SudoHealth") then 
                            v.Character:FindFirstChild("SudoHealth"):Destroy()
                        end
                    end
                end
            end
        end
    end)
end


local addNamesActive = false
function addNames()
    local BillboardGui = Instance.new("BillboardGui")
    local TextLabel = Instance.new("TextLabel")
    
    BillboardGui.Name = "SudoName"
    BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    BillboardGui.Active = true
    BillboardGui.AlwaysOnTop = true
    BillboardGui.LightInfluence = 1.000
    BillboardGui.Size = UDim2.new(1, 0, 1, 0)
    BillboardGui.StudsOffset = Vector3.new(0, -3.4, 0)

    TextLabel.Parent = BillboardGui
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.Font = "Code"
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 12.000
    TextLabel.TextStrokeTransparency = 0.000
    TextLabel.Text = ""
    
    game:GetService("RunService").RenderStepped:Connect(function()
        if addNamesActive then
            for i,v in next, game:GetService("Players"):GetPlayers() do
                if v.Name ~= game.Players.LocalPlayer.Name then
                    local c1 
                    if v.Character == nil then
                        v.CharacterAdded:wait()
                    else
                        if v.Character:FindFirstChild("SudoName") == nil then 
                            if v.DisplayName == v.Name then
                                TextLabel.Text = v.DisplayName
                            else
                                TextLabel.Text = v.DisplayName..' ('..v.Name..')'
                            end
                            BillboardGui:Clone().Parent = v.Character
                        end
                    end
                end
            end
        else
            for i,v in next, game:GetService("Players"):GetPlayers() do
                if v.Name ~= game.Players.LocalPlayer.Name then
                    local c1 
                    if v.Character == nil then
                        v.CharacterAdded:wait()
                    else
                        if v.Character:FindFirstChild("SudoName") then 
                            v.Character:FindFirstChild("SudoName"):Destroy()
                        end
                    end
                end
            end
        end
        
    end)
end

local addWeaponInHandActive = false
function addWeaponInHand()
    local whitelistTools = {"Glock","Uzi","Sawed-Off","Flare","Revolver","Assault Rifle","Spaz","TEC-9","Garand","LMG","RPG","Guard Glock","Guard Spaz","Guard AR"}

    local weaponIcons = {
        Glock = "rbxassetid://10222819954",
        Uzi = "rbxassetid://10343998817",
        SawedOff  = "rbxassetid://10216148443",
        Flare = "rbxassetid://11822721536",
        Revolver = "rbxassetid://11809990574",
        AssaultRifle = "rbxassetid://10630750858",
        Spaz = "rbxassetid://10641432874",
        TEC = "rbxassetid://10525080983",
        Garand = "rbxassetid://10637949127",
        LMG = "rbxassetid://11164557456",
        RPG = "rbxassetid://10481912157",
        GuardGlock = "rbxassetid://8327297171",
        GuardSpaz = "rbxassetid://8327299054",
        GuardAR = "rbxassetid://10637784737"
    }

    local Hand = Instance.new("BillboardGui")
    local Frame = Instance.new("Frame")
    local ImageLabel = Instance.new("ImageLabel")
    local UICorner = Instance.new("UICorner")

    Hand.Name = "Hand"
    Hand.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    Hand.Active = true
    Hand.AlwaysOnTop = true
    Hand.LightInfluence = 1.000
    Hand.Size = UDim2.new(1, 0, 1, 0)

    Frame.Name = "Frame"
    Frame.Parent = Hand
    Frame.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
    Frame.Size = UDim2.new(1, 0, 1, 0)

    ImageLabel.Name = "Icon"
    ImageLabel.Parent = Frame
    ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel.BackgroundTransparency = 1.000
    ImageLabel.Size = UDim2.new(1, 0, 1, 0)

    UICorner.CornerRadius = UDim.new(1, 8)
    UICorner.Parent = Frame


    game:GetService("RunService").RenderStepped:Connect(function()
    if addWeaponInHandActive then
        for i,player in next, game:GetService("Players"):GetPlayers() do
            local c1 = player.Character:FindFirstChild("Hand")
            if player.Name ~= game.Players.LocalPlayer.Name then
                if c1 then
                    c1:Destroy() 
                end
            
                for _,item in pairs(player.Character:GetChildren()) do
                    if item.ClassName == "Tool" then
                        for _,whitelistTool in pairs(whitelistTools) do
                            if whitelistTool == item.Name then
    
                                if item.Name == "Assault Rifle" then
                                    ImageLabel.Image = weaponIcons.AssaultRifle
                                    Hand:Clone().Parent = player.Character
                                    break
                                end
                                if item.Name == "Sawed-Off" then
                                    ImageLabel.Image = weaponIcons.SawedOff
                                    Hand:Clone().Parent = player.Character
                                    break
                                end
                                if item.Name == "TEC-9" then
                                    ImageLabel.Image = weaponIcons.TEC
                                    Hand:Clone().Parent = player.Character
                                    break
                                end
                                if item.Name == "Guard Glock" then
                                    ImageLabel.Image = weaponIcons.GuardGlock
                                    Hand:Clone().Parent = player.Character
                                    break
                                end
                                if item.Name == "Guard Spaz" then
                                    ImageLabel.Image = weaponIcons.GuardSpaz
                                    Hand:Clone().Parent = player.Character
                                    break
                                end
                                if item.Name == "Guard AR" then
                                    ImageLabel.Image = weaponIcons.GuardAR
                                    Hand:Clone().Parent = player.Character
                                    break
                                end
                                ImageLabel.Image = weaponIcons[item.Name]
                            
                                Hand:Clone().Parent = player.Character
                            end
                        end
                    end
                end
            end
        end
    else
        for i,player in next, game:GetService("Players"):GetPlayers() do
            local c1 = player.Character:FindFirstChild("Hand")
            if player.Name ~= game.Players.LocalPlayer.Name then
                if c1 then
                    c1:Destroy() 
                end
            end
        end
    end
end)
end



local addItemsNameActive = false 
function addItemsName()
    local BillboardGui = Instance.new("BillboardGui")
    local TextLabel = Instance.new("TextLabel")
    
    BillboardGui.Name = "SudoName"
    BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    BillboardGui.Active = true
    BillboardGui.AlwaysOnTop = true    BillboardGui.LightInfluence = 1.000
    BillboardGui.Size = UDim2.new(1, 0, 1, 0)

    TextLabel.Active = true
    TextLabel.Parent = BillboardGui
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.Font = "Code"
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 11.000
    TextLabel.TextStrokeTransparency = 0.000
    TextLabel.Text = ""
    
    local spawnsLoot = game:GetService("Workspace").SpawnsLoot
    
    game:GetService("RunService").RenderStepped:Connect(function()
        if addItemsNameActive then
            for i,folder in pairs(spawnsLoot:GetChildren()) do
                for i,v in pairs(folder:GetChildren()) do
                    if v.Transparency == 0 and v:FindFirstChild("SudoName") == nil then
                        TextLabel.Text = v.Name
                        BillboardGui:Clone().Parent = v 
                    end
                    if v.Transparency == 1 and v:FindFirstChild("SudoName") then
                        v:FindFirstChild("SudoName"):Destroy()
                    end
                end
            end
        else
            for i,folder in pairs(spawnsLoot:GetChildren()) do
                for i,v in pairs(folder:GetChildren()) do
                    if v:FindFirstChild("SudoName") then
                        v:FindFirstChild("SudoName"):Destroy()
                    end
                end
            end
        end
    end)
end



local hitboxExtenderActive = false 
local hitboxSize = 10
local hitboxTransparency = 0.5
local hitboxColor = Color3.fromRGB(255,255,255)
function hitboxExtender()
    game:GetService("RunService").RenderStepped:Connect(function()
        if hitboxExtenderActive then
            for i,v in next, game:GetService("Players"):GetPlayers() do
                if v.Name ~= game.Players.LocalPlayer.Name then
                    if v.Character.HumanoidRootPart.Size ~= Vector3.new(hitboxSize,hitboxSize,hitboxSize) or v.Character.HumanoidRootPart.Transparency ~= hitboxTransparency then
                        v.Character.HumanoidRootPart.Transparency = hitboxTransparency
                        v.Character.HumanoidRootPart.CanCollide = false
                        v.Character.HumanoidRootPart.Size = Vector3.new(hitboxSize,hitboxSize,hitboxSize)
                        v.Character.HumanoidRootPart.Color = hitboxColor
                    end
                end
            end
        else
            for i,v in next, game:GetService("Players"):GetPlayers() do
                if v.Name ~= game.Players.LocalPlayer.Name then
                    if v.Character.HumanoidRootPart.Size ~= Vector3.new(1.54,1.96,0.88) or v.Character.HumanoidRootPart.Transparency ~= 1 then
                        v.Character.HumanoidRootPart.Transparency = 1
                        v.Character.HumanoidRootPart.CanCollide = true
                        v.Character.HumanoidRootPart.Size = Vector3.new(1.54,1.96,0.88)
                    end
                    
                end
            end
        end
        
    end)
end


local makeDoorsNotCollideActive = false
local makeDoorsNotCollideTransparency = 0.5
function makeDoorsNotCollide()
    game:GetService("RunService").Stepped:Connect(function()
        if makeDoorsNotCollideActive then
            for i,door in pairs(game:GetService("Workspace").Doors:GetDescendants()) do
                for i,part in pairs(door:GetDescendants()) do
                    if part.ClassName == "Part" or part.ClassName == "UnionOperation" and part.Transparency ~= makeDoorsNotCollideTransparency then
                        part.CanCollide = false
                        part.Transparency = makeDoorsNotCollideTransparency
                    end
                end
            end
        
            for i,part in pairs(game:GetService("Workspace").CellRoomDoor1:GetDescendants()) do 
                if part.ClassName == "Part" or part.ClassName == "UnionOperation" and part.Transparency ~= makeDoorsNotCollideTransparency then
                    part.CanCollide = false
                    part.Transparency = makeDoorsNotCollideTransparency
                end
            end
        
            for i,part in pairs(game:GetService("Workspace").CellRoomDoor2:GetDescendants()) do 
                if part.ClassName == "Part" or part.ClassName == "UnionOperation" and part.Transparency ~= makeDoorsNotCollideTransparency then
                    part.CanCollide = false
                    part.Transparency = makeDoorsNotCollideTransparency
                end
            end
        else
            for i,door in pairs(game:GetService("Workspace").Doors:GetDescendants()) do
                for i,part in pairs(door:GetChildren()) do
                    if part.ClassName == "Part" or part.ClassName == "UnionOperation" and part.CanCollide ~= true then
                        part.CanCollide = true
                        part.Transparency = 0
                    end
                end
            end
        
            for i,part in pairs(game:GetService("Workspace").CellRoomDoor1:GetDescendants()) do 
                if part.ClassName == "Part" or part.ClassName == "UnionOperation" and part.CanCollide ~= true then
                    part.CanCollide = true
                    part.Transparency = 0
                end 
            end
        
            for i,part in pairs(game:GetService("Workspace").CellRoomDoor2:GetDescendants()) do 
                if part.ClassName == "Part" or part.ClassName == "UnionOperation" and part.CanCollide ~= true then
                    part.CanCollide = true
                    part.Transparency = 0
                end 
            end
        end
        task.wait(0.1)
    end)
end

function deleteDoors()
    for i,door in pairs(game:GetService("Workspace").Doors:GetDescendants()) do
        for i,part in pairs(door:GetDescendants()) do
            if part.ClassName == "Part" or part.ClassName == "UnionOperation" and part.Transparency ~= makeDoorsNotCollideTransparency then
                part:Destroy()
            end
        end
    end

    for i,part in pairs(game:GetService("Workspace").CellRoomDoor1:GetDescendants()) do 
        if part.ClassName == "Part" or part.ClassName == "UnionOperation" and part.Transparency ~= makeDoorsNotCollideTransparency then
            part:Destroy()
        end
    end

    for i,part in pairs(game:GetService("Workspace").CellRoomDoor2:GetDescendants()) do 
        if part.ClassName == "Part" or part.ClassName == "UnionOperation" and part.Transparency ~= makeDoorsNotCollideTransparency then
            part:Destroy()
        end
    end
end



------------------- TELEPORT FUNCTIONS --------------------------

local bountysPos = Vector3.new(102.30421447753906, 4.463308334350586, -90.75252532958984)
local antiStompThingPos = Vector3.new(-25.172048568725586, -36.8372802734375, 59.772708892822266)
local OutOfMapPos = Vector3.new(61.01539611816406, -83.79203796386719, -43.17143630981445)
local OutOfMapPos2 = Vector3.new(40.276206970214844, 52.557823181152344, -149.0100555419922)
local spawnroomPos = Vector3.new(-567.302978515625, 30.822784423828125, 10.521495819091797)
local lockerPos = Vector3.new(120.11381530761719, 11.523313522338867, 108.81651306152344)
local dumbellPos = Vector3.new(192.8385602734375, 5.165857315063477, 75.56653594970703)
local gymPos = Vector3.new(170.4764404296875, 5.165856838226318, 78.85028076171875)
local freezerRoomPos = Vector3.new(176.93592834472656, 5.059755802154541, 34.677581787109375)
local workshopPos = Vector3.new(206.17926025390625, 5.059754848480225, -104.42450714111328)
local libraryPos = Vector3.new(154.5070037841797, 5.052845478057861, -167.75328063964844)
local sewagePos = Vector3.new(94.60062408447266, 5.059755802154541, -168.23550415039062)
local solitaryPos = Vector3.new(-15.982107162475586, 5.059754848480225, -195.19342041015625)
local minePos = Vector3.new(-79.38677978515625, 4.119339942932129, -197.54736328125)
local researchPos = Vector3.new(-115.79100799560547, 5.059754848480225, -86.23844146728516)
local cellBlockPos = Vector3.new(48.59902572631836, 19.44986343383789, 86.1889419555664)
local roofPos = Vector3.new(40.82529067993164, 36.31513595581055, -150.22024536132812) 

function bypass_tp(v)
    local lplayer = game:GetService("Players").LocalPlayer

    local tween_s = game:GetService("TweenService")
    local tweenInfo = TweenInfo.new(0.2,Enum.EasingStyle.Linear)

	if lplayer.Character and lplayer.Character:FindFirstChild("HumanoidRootPart") then
		local cf = CFrame.new(v)
		local a = tween_s:Create(lplayer.Character.HumanoidRootPart,tweenInfo,{CFrame=cf})
		a:Play()
	end
end

function tp(v)
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v)
end
----------------------------------------------------------------------------


local antiStompActive = false
function antiStomp()
    game:GetService("RunService").Stepped:Connect(function()
        if antiStompActive then 
            if game:GetService("Players").LocalPlayer.Backpack.Stats.Downed.Value == true then
                tp(OutOfMapPos)
            end
        end
    end)
end


local autoStrengthActive = false
function autoStrength()
    game:GetService("RunService").Stepped:Connect(function()
        if autoStrengthActive then
            if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dumbell") then
                game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dumbell"):Activate()
            end
        end
    end)
end

-- When player is idled
game:GetService('Players').LocalPlayer.Idled:connect(function()

end)

local autofarmItemsActive = true 
function autofarmItems()
    local virtualUser = game:GetService('VirtualUser')
    virtualUser:CaptureController()

    local spawnsLoot = game:GetService("Workspace").SpawnsLoot

    game:GetService("RunService").RenderStepped:Connect(function()
        if autofarmItemsActive then
            for i,folder in pairs(spawnsLoot:GetChildren()) do
                for i,v in pairs(folder:GetChildren()) do
                    if v.Transparency == 0 then
                        tp(v.Position)
                        wait(0.1)
                        virtualUser:SetKeyDown('0x65')
                        virtualUser:SetKeyUp('0x65')
                        wait(0.1)
                    end
                end
            end
        end
    end)
end


local autofarmSafesActive = false
function autofarmSafes()
    local robbableFolder = game:GetService("Workspace").Robbable

    local debounce = false
    game:GetService("RunService").Stepped:Connect(function()
        if autofarmSafesActive then
            for i,v in pairs(robbableFolder:GetChildren()) do
                if v.Name == "Safe" then
                    if v.Door.Attachment.ProximityPrompt.Enabled and not debounce then
                        debounce = true
                        tp(v.Back.Position)
            
                        wait(0.5)
                        v.Door.Attachment.ProximityPrompt:InputHoldBegin()
                        wait(10)
                        v.Door.Attachment.ProximityPrompt:InputHoldEnd()
                        wait(0.1)
                        debounce = false
                    end
                end
            end
        end
    end)
end


local autofarmRocksActive = false
function autofarmRocks()
    local virtualUser = game:GetService('VirtualUser')
    virtualUser:CaptureController()
    
    local folder = game:GetService("Workspace").MiningRocks
    local deboune = false
    game:GetService("RunService").Stepped:Connect(function()
        if autofarmRocksActive then 
            for i,rock in pairs(folder:GetChildren()) do
                if deboune == false then
                    deboune = true
                    tp(Vector3.new(rock.Position.x, rock.Position.y + 2, rock.Position.z))
                    virtualUser:Button1Down(Vector2.new(0,0))
                    wait(1)
                    virtualUser:Button1Up(Vector2.new(0,0))
                    wait(1.1)
                    deboune = false
                    wait(0.1)
                end
            end
        end
    end)
end




local autopickupMoneyActive = false
function autopickupMoney()
    game:GetService("RunService").RenderStepped:Connect(function()
        if autopickupMoneyActive then
            for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                if v.Name == "DroppedCash" then
                    tp(v.Position)
                    v.ProximityPrompt:InputHoldBegin()
                    wait(0.1)
                    v.ProximityPrompt:InputHoldEnd()
                end
            end
        end
    end)
end









--/ Rayfield 
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local currentName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local Window = Rayfield:CreateWindow({
    Name = "🐵 Monke Hub | "..currentName,
    LoadingTitle = "🐵 Monke Hub",
    LoadingSubtitle = "by Nicker",
    ConfigurationSaving = {
       Enabled = false,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Big Hub"
    },
    Discord = {
       Enabled = false,
       Invite = "sirius", -- The Discord invite code, do not include discord.gg/
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "Sirius Hub",
       Subtitle = "Key System",
       Note = "Join the discord (discord.gg/sirius)",
       FileName = "SiriusKey",
       SaveKey = true,
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = "Hello"
    }
})

local combatTab = Window:CreateTab("Combat", 4483345998)
local teleportTab = Window:CreateTab("Teleport", 6035190846) 
local gymTab = Window:CreateTab("Gym/Strength", 6035121907) 
local playersTab = Window:CreateTab("Players", 6034287513)
local automationTab = Window:CreateTab("Automation", 6023565901)
local visualTab = Window:CreateTab("Visual", 6031075931)
local lightingTab = Window:CreateTab("Lighting", 6035047381)
local miscTab = Window:CreateTab("Misc", 6034509993)


--/ automationTab
--/ AUTOFARM SECTION
local automationSection = automationTab:CreateSection("Automation")
automationTab:CreateToggle({
    Name = "Farm Items",
    CurrentValue = false,
    Flag = "",
    Callback = function(Value)
        autofarmItemsActive = Value
        if Value then
            autofarmItems()
        end
    end,
})
automationTab:CreateToggle({
    Name = "Farm Safes (activate Pick-Up Cash)",
    CurrentValue = false,
    Flag = "",
    Callback = function(Value)
        autofarmSafesActive = Value
        if Value then
            autofarmSafes()
        end
    end,
})
automationTab:CreateToggle({
    Name = "Farm Rocks (need pickaxe)",
    CurrentValue = false,
    Flag = "",
    Callback = function(Value)
        autofarmRocksActive = Value
        if Value then
            autofarmRocks()
        end
    end,
})
automationTab:CreateToggle({
    Name = "Pick-Up Cash",
    CurrentValue = false,
    Flag = "",
    Callback = function(Value)
        autopickupMoneyActive = Value
        if Value then
            autopickupMoney()
        end
    end,
})




--/ combatTab https://pastebin.com/raw/eqirAjbP
--/ Silent Aim Section
local silentaimSection = combatTab:CreateSection("Aim")
combatTab:CreateButton({
    Name = "Load Silent-Aim (FPS loss)",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/eqirAjbP", true))()
    end,
})


--/ Hitbox Section
local hitboxSection = combatTab:CreateSection("Hitbox")
combatTab:CreateToggle({
    Name = "Hitbox Extender",
    CurrentValue = false,
    Flag = "",
    Callback = function(Value)
        hitboxExtenderActive = Value
        if Value then
            hitboxExtender()
        end
    end,
})
combatTab:CreateSlider({
    Name = "Hitbox Size",
    Range = {0, 30},
    Increment = 1,
    Suffix = "",
    CurrentValue = hitboxSize,
    Flag = "Slider1",
    Callback = function(Value)
        hitboxSize = Value
    end,
})
combatTab:CreateSlider({
    Name = "Hitbox Transparency",
    Range = {0, 1},
    Increment = 0.1,
    Suffix = "",
    CurrentValue = hitboxTransparency,
    Flag = "Slider1",
    Callback = function(Value)
        hitboxTransparency = Value
    end,
})
combatTab:CreateColorPicker({
    Name = "Hitbox Color",
    Color = Color3.fromRGB(255,255,255),
    Flag = "ColorPicker1",
    Callback = function(Value)
        for i,player in next, game:GetService("Players"):GetPlayers() do
            if player.Character:FindFirstChild("HumanoidRootPart") == nil then break end

            player.Character.HumanoidRootPart.Color = Color3.fromRGB(Value.r*255, Value.g*255, Value.b*255)
        end
        hitboxColor = Color3.fromRGB(Value.r*255, Value.g*255, Value.b*255)
    end
})


--/ Misc Section
local miscSection = combatTab:CreateSection("Misc")
combatTab:CreateToggle({
    Name = "Anti Stomp",
    CurrentValue = false,
    Flag = "", 
    Callback = function(Value)
        antiStompActive = Value
        if Value then
            antiStomp()
        end
    end,
})


--/ teleportTab
local teleportMethod = "Tween"
teleportTab:CreateSection("Teleports")
teleportTab:CreateDropdown({
    Name = "Teleport Method",
    Options = {"Tween", "Instant"},
    CurrentOption = "Tween",
    Flag = "Dropdown1", 
    Callback = function(Option)
        teleportMethod = Option
    end,
})
teleportTab:CreateLabel("⚠️ Buggy if weapon/tool is equipped")
teleportTab:CreateButton({
    Name = "Locker",
    Callback = function()
        if teleportMethod == "Tween" then
            bypass_tp(lockerPos)
        else
            tp(lockerPos)
        end
    end,
})
teleportTab:CreateButton({
    Name = "Roof",
    Callback = function()
        if teleportMethod == "Tween" then
            bypass_tp(roofPos)
        else
            tp(roofPos)
        end
    end,
})
teleportTab:CreateButton({
    Name = "Bountys",
    Callback = function()
        if teleportMethod == "Tween" then
            bypass_tp(bountysPos)
        else
            tp(bountysPos)
        end
    end,
})
teleportTab:CreateButton({
    Name = "Out of map",
    Callback = function()
        if teleportMethod == "Tween" then
            bypass_tp(OutOfMapPos)
        else
            tp(OutOfMapPos)
        end
    end,
})
teleportTab:CreateButton({
    Name = "Out of map 2",
    Callback = function()
        if teleportMethod == "Tween" then
            bypass_tp(OutOfMapPos2)
        else
            tp(OutOfMapPos2)
        end
    end,
})
teleportTab:CreateButton({
    Name = "Spawnroom",
    Callback = function()
        if teleportMethod == "Tween" then
            bypass_tp(spawnroomPos)
        else
            tp(spawnroomPos)
        end
    end,
})
teleportTab:CreateButton({
    Name = "Gym",
    Callback = function()
        if teleportMethod == "Tween" then
            bypass_tp(gymPos)
        else
            tp(gymPos)
        end
    end,
})
teleportTab:CreateButton({
    Name = "Freezer",
    Callback = function()
        if teleportMethod == "Tween" then
            bypass_tp(freezerRoomPos)
        else
            tp(freezerRoomPos)
        end
    end,
})
teleportTab:CreateButton({
    Name = "Workshop",
    Callback = function()
        if teleportMethod == "Tween" then
            bypass_tp(workshopPos)
        else
            tp(workshopPos)
        end
    end,
})
teleportTab:CreateButton({
    Name = "Library",
    Callback = function()
        if teleportMethod == "Tween" then
            bypass_tp(libraryPos)
        else
            tp(libraryPos)
        end
    end,
})
teleportTab:CreateButton({
    Name = "Sewage",
    Callback = function()
        if teleportMethod == "Tween" then
            bypass_tp(sewagePos)
        else
            tp(sewagePos)
        end
    end,
})
teleportTab:CreateButton({
    Name = "Solitary",
    Callback = function()
        if teleportMethod == "Tween" then
            bypass_tp(solitaryPos)
        else
            tp(solitaryPos)
        end
    end,
})
teleportTab:CreateButton({
    Name = "Coal Mine",
    Callback = function()
        if teleportMethod == "Tween" then
            bypass_tp(minePos)
        else
            tp(minePos)
        end
    end,
})
teleportTab:CreateButton({
    Name = "Research Table",
    Callback = function()
        if teleportMethod == "Tween" then
            bypass_tp(researchPos)
        else
            tp(researchPos)
        end
    end,
})
teleportTab:CreateButton({
    Name = "Cell Block",
    Callback = function()
        if teleportMethod == "Tween" then
            bypass_tp(cellBlockPos)
        else
            tp(cellBlockPos)
        end
    end,
})


--/ playersTab

--/ BOUNTY SECTION
local bountySection = playersTab:CreateSection("Bounty")

--/ BOUNTYLIST FUNCTION
local bountyListingsFolder = game:GetService("ReplicatedStorage").BountyListings
local bountyTable = {}

for i,v in pairs(bountyListingsFolder:GetChildren()) do
    table.insert(bountyTable, v.Name)
end

bountyListingsFolder.ChildAdded:Connect(function(child)
    table.insert(bountyTable, child.Name)
end)

bountyListingsFolder.ChildRemoved:Connect(function(child)
    for i,v in pairs(bountyListingsFolder:GetChildren()) do
        if child.Name == v.Name then
            table.remove(bountyTable, i)
        end
    end
end)
--/

local bountyLabel = playersTab:CreateLabel("Bounty: $")
playersTab:CreateDropdown({
    Name = "Bountylist",
    Options = bountyTable,
    CurrentOption = "Pick Player",
    Flag = "Dropdown1", 
    Callback = function(Option)
        bountyLabel:Set("Bounty: $"..bountyListingsFolder[Option].Value)
    end,
})



--/ gymTab

local infoSection = gymTab:CreateSection("Info")
local lplayer = game:GetService("Players").LocalPlayer
local currentStrengthLabel = gymTab:CreateLabel("Current Strength: "..game:GetService("ReplicatedStorage").PlayerStats[game:GetService("Players").LocalPlayer.Name].Strength.Value)
game:GetService("ReplicatedStorage").PlayerStats[lplayer.Name].Strength:GetPropertyChangedSignal("Value"):Connect(function()
    currentStrengthLabel:Set("Current Strength: "..game:GetService("ReplicatedStorage").PlayerStats[lplayer.Name].Strength.Value)
end)

local autofarmSection = gymTab:CreateSection("Auto Farm")
gymTab:CreateToggle({
    Name = "Toggle",
    CurrentValue = false,
    Flag = "",
    Callback = function(Value)
        autoStrengthActive = Value
        if Value then
            autoStrength()
        end
    end,
})

local gymTps = gymTab:CreateSection("Teleports")
gymTab:CreateButton({
    Name = "Dumbell",
    Callback = function()
        bypass_tp(dumbellPos)
    end,
})


--/ visualTab

--//// PLAYER SECTION
local playerSection = visualTab:CreateSection("Players")
visualTab:CreateToggle({
    Name = "Name",
    CurrentValue = false,
    Flag = "",
    Callback = function(Value)
        addNamesActive = Value
        if Value then
            addNames()
        end
    end,
})
visualTab:CreateToggle({
    Name = "Box (Color Coded)",
    CurrentValue = false,
    Flag = "",
    Callback = function(Value)
        playerBoxActive = Value
        if Value then
            addBox()
        end
    end,
})
visualTab:CreateToggle({
    Name = "Health (Distance Limited)",
    CurrentValue = false,
    Flag = "",
    Callback = function(Value)
        playerHealthbarActive = Value
        if Value then
            addHealthbar()
        end
    end,
})

visualTab:CreateToggle({
    Name = "Active Weapon",
    CurrentValue = false,
    Flag = "",
    Callback = function(Value)
        addWeaponInHandActive = Value
        if Value then
            addWeaponInHand()
        end
    end,
})

--//// Item SECTION
local itemSection = visualTab:CreateSection("Items")
visualTab:CreateToggle({
    Name = "Names",
    CurrentValue = false,
    Flag = "",
    Callback = function(Value)
        addItemsNameActive = Value
        if Value then
            addItemsName()
        end
    end,
})


--/ lightingTab
local lightingSection = lightingTab:CreateSection("Lighting")
lightingTab:CreateToggle({
    Name = "Global shadows",
    CurrentValue = true,
    Flag = "",
    Callback = function(Value)
        game:GetService("Lighting").GlobalShadows = Value
    end,
})
lightingTab:CreateToggle({
    Name = "SunRays",
    CurrentValue = true,
    Flag = "",
    Callback = function(Value)
        game:GetService("Lighting").SunRays.Enabled = Value
    end,
})
lightingTab:CreateSlider({
    Name = "Brightness",
    Range = {0, 100},
    Increment = 1,
    Suffix = "",
    CurrentValue = 2,
    Flag = "Slider1", 
    Callback = function(Value)
        game:GetService("Lighting").Brightness = Value
    end,
})
lightingTab:CreateSlider({
    Name = "Fog (higher = less fog)",
    Range = {0, 10000},
    Increment = 10,
    Suffix = "",
    CurrentValue = 10000,
    Flag = "Slider1", 
    Callback = function(Value)
        game:GetService("Lighting").FogEnd = Value
    end,
})


--/ miscTab
local doorsSection = miscTab:CreateSection("Doors")
miscTab:CreateButton({
    Name = "Delete Doors",
    Callback = function()
        deleteDoors()
    end,
})
miscTab:CreateToggle({
    Name = "Make door non-collidible",
    CurrentValue = false,
    Flag = "",
    Callback = function(Value)
        makeDoorsNotCollideActive = Value
        if Value then
            makeDoorsNotCollide()
        end
    end,
})
miscTab:CreateSlider({
    Name = "Door Transparency",
    Range = {0, 1},
    Increment = 0.1,
    Suffix = "",
    CurrentValue = 0.5,
    Flag = "Slider1", 
    Callback = function(Value)
        makeDoorsNotCollideTransparency = Value
    end,
})

local librarySection = miscTab:CreateSection("UI Library")
miscTab:CreateButton({
    Name = "Destroy UI",
    Callback = function()
        Rayfield:Destroy()
    end,
})
