local anti
if game:GetService("Players").LocalPlayer.Backpack.Local:FindFirstChild("Dead") then
    anti = game:GetService("Players").LocalPlayer.Backpack.Local.Dead
end
if anti then
    anti:Destroy()
end




local playersService = game:GetService("Players")
local localPlayer = playersService.LocalPlayer

local dwCamera = workspace.CurrentCamera
local dwRunService = game:GetService("RunService")
local dwUIS = game:GetService("UserInputService")
local dwEntities = game:GetService("Players")
local dwLocalPlayer = dwEntities.LocalPlayer
local dwMouse = dwLocalPlayer:GetMouse()



--/////////////////////////////// TELEPORTS ///////////////////////////////--
local bountysPos = Vector3.new(102.30421447753906, 4.463308334350586, -90.75252532958984)
local antiStompThingPos = Vector3.new(-25.172048568725586, -36.8372802734375, 59.772708892822266)
local OutOfMapPos = Vector3.new(61.01539611816406, -83.79203796386719, -43.17143630981445)
local OutOfMapPos2 = Vector3.new(40.276206970214844, 52.557823181152344, -149.0100555419922)
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
local spawnroomPos = Vector3.new(-567.302978515625, 30.822784423828125, 10.521495819091797)
local pickaxePos = Vector3.new(-98.82332611083984, 3.1709282398223877, -179.2113037109375)
local ammoPos = Vector3.new(60.894290924072266, -37.784507751464844, -151.66392517089844)

function tp(v)
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v)
end

--////////////////////////////////////////////////////////////////////////////////--



local playerBoxEsp = {
    active = false,
    prisonerColor = Color3.fromRGB(255, 170, 0),
    copColor = Color3.fromRGB(0, 170, 255)
}
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
        if playerBoxEsp.active then
            for _,v in next, game:GetService("Players"):GetPlayers() do
                if v.Name ~= game.Players.LocalPlayer.Name then
                    local c1 
                    if v.Character == nil then
                        v.CharacterAdded:wait()
                    else
                        if v.Character:FindFirstChild("Sudo") == nil then 
                            if game:GetService("ReplicatedStorage").PlayerStats[v.Name].Cop.Value == true then
                                FrameStroke.Color = playerBoxEsp.copColor
                            else
                                FrameStroke.Color = playerBoxEsp.prisonerColor
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











local settings = {
    Aimbot = false,
    Aiming = false,
    Aimbot_ToggleKey = Enum.UserInputType.MouseButton2,
    Aimbot_AimPart = "Head",
    Aimbot_TeamCheck = false,
    Aimbot_Draw_FOV = false,
    Aimbot_FOV_Radius = 200,
    Aimbot_FOV_Color = Color3.fromRGB(255,255,255)
}
function aimlock()
    local fovcircle = Drawing.new("Circle")
    fovcircle.Thickness = 1
    fovcircle.Filled = false
    fovcircle.Transparency = 1
    fovcircle.Position = Vector2.new(dwCamera.ViewportSize.X / 2, dwCamera.ViewportSize.Y / 2)

    dwRunService.RenderStepped:Connect(function()

        fovcircle.Visible = settings.Aimbot_Draw_FOV
        if settings.Aimbot_Draw_FOV then
            fovcircle.Radius = settings.Aimbot_FOV_Radius
            fovcircle.Color = settings.Aimbot_FOV_Color
        end

        if settings.Aimbot then
            local dist = math.huge
            local closest_char = nil
        
            if settings.Aiming then
        
                for i,v in next, dwEntities:GetChildren() do 
        
                    if v ~= dwLocalPlayer and
                    v.Character and
                    v.Character:FindFirstChild("HumanoidRootPart") and
                    v.Character:FindFirstChild("Humanoid") and
                    v.Character:FindFirstChild("Humanoid").Health > 0 then
        
                        if settings.Aimbot_TeamCheck == true and
                        v.Team ~= dwLocalPlayer.Team or
                        settings.Aimbot_TeamCheck == false then
        
                            local char = v.Character
                            local char_part_pos, is_onscreen = dwCamera:WorldToViewportPoint(char.Head.Position)
        
                            if is_onscreen then
        
                                local mag = (Vector2.new(dwMouse.X, dwMouse.Y) - Vector2.new(char_part_pos.X, char_part_pos.Y)).Magnitude
        
                                if mag < dist and mag < settings.Aimbot_FOV_Radius then
        
                                    dist = mag
                                    closest_char = char
        
                                end
                            end
                        end
                    end
                end
        
                if closest_char ~= nil and
                closest_char:FindFirstChild("HumanoidRootPart") and
                closest_char:FindFirstChild("Humanoid") and
                closest_char:FindFirstChild("Humanoid").Health > 0 then
        
                    dwCamera.CFrame = CFrame.new(dwCamera.CFrame.Position, closest_char[settings.Aimbot_AimPart].Position)
                end
            end
        end
    end)
end
dwUIS.InputBegan:Connect(function(i)
    if i.UserInputType == settings.Aimbot_ToggleKey then
        settings.Aiming = true
    end
end)
dwUIS.InputEnded:Connect(function(i)
    if i.UserInputType == settings.Aimbot_ToggleKey then
        settings.Aiming = false
    end
end)











local hitbox = {
    active = false,
    size = 3,
    transparency = 0.5,
    bodyPart = "HumanoidRootPart",
    color = Color3.fromRGB(255,255,255)
}
function hitboxExpander()
    game:GetService("RunService").Stepped:Connect(function()
        if hitbox.active then
            for i,player in next, playersService:GetPlayers() do
                if player.Name ~= localPlayer.Name and player.Character ~= nil then
                    if hitbox.bodyPart == "HumanoidRootPart" then
                        if player.Character.HumanoidRootPart.Transparency ~= hitbox.transparency or player.Character.HumanoidRootPart.Size ~= Vector3.new(hitbox.size, hitbox.size, hitbox.size) or player.Character.HumanoidRootPart.Color ~= hitbox.color then
                            player.Character.HumanoidRootPart.Size = Vector3.new(hitbox.size, hitbox.size, hitbox.size)
                            player.Character.HumanoidRootPart.Transparency = hitbox.transparency
                            player.Character.HumanoidRootPart.Color = hitbox.color
                        end
                    elseif hitbox.bodyPart == "Head" then
                        if player.Character.Head.Transparency ~= hitbox.transparency or player.Character.Head.Size ~= player.Character.Head.OriginalSize.Value * hitbox.size or player.Character.Head.Color ~= hitbox.color then
                            player.Character.Head.Size = player.Character.Head.OriginalSize.Value * hitbox.size
                            player.Character.Head.Transparency = hitbox.transparency
                            player.Character.Head.Color = hitbox.color
                        end
                    end
                end
            end
        else
            for i,player in next, playersService:GetPlayers() do
                if player.Name ~= localPlayer.Name and player.Character ~= nil then
                    if hitbox.bodyPart == "HumanoidRootPart" then
                        if player.Character.HumanoidRootPart.Transparency ~= 1 or player.Character.HumanoidRootPart.Size ~= player.Character.HumanoidRootPart.OriginalSize then
                            player.Character.HumanoidRootPart.Size = player.Character.HumanoidRootPart.OriginalSize.Value
                            player.Character.HumanoidRootPart.Transparency = 1
                            player.Character.HumanoidRootPart.Color = Color3.fromRGB(255,255,255)
                        end
                    elseif hitbox.bodyPart == "Head" then
                        if player.Character.Head.Transparency ~= 0 or player.Character.Head.Size ~= player.Character.Head.OriginalSize.Value then
                            player.Character.Head.Size = player.Character.Head.OriginalSize.Value
                            player.Character.Head.Transparency = 0
                            player.Character.Head.Color = Color3.fromRGB(255,255,255)
                        end
                    end
                end
            end
        end
    end)
end



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


local function deleteDoors()
    for i,v in pairs(game.Workspace:FindFirstChild("Doors"):GetChildren()) do
        v:Destroy()
    end
    game.Workspace:FindFirstChild("CellRoomDoor1"):Destroy()
    game.Workspace:FindFirstChild("CellRoomDoor2"):Destroy()
    game.Workspace:FindFirstChild("Ignore"):Destroy()
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



local playerBounty = {
    active = false,
    lowlevelBounty = 100,
    lowlevelColor = Color3.fromRGB(85, 255, 127),
    midlevelBounty = 200,
    midlevelColor = Color3.fromRGB(255,255, 127),
    highlevelBounty = 300,
    highlevelColor = Color3.fromRGB(255, 0, 0)
}
function addBounty()
    local Bounty = Instance.new("BillboardGui")
    local icon = Instance.new("ImageLabel")

    Bounty.Name = "Bounty"
    Bounty.Active = true
    Bounty.AlwaysOnTop = true
    Bounty.LightInfluence = 0
    Bounty.Size = UDim2.new(1, 0, 1, 0)

    icon.Name = "icon"
    icon.Parent = Bounty
    icon.BackgroundTransparency = 1
    icon.Size = UDim2.new(1, 0, 1, 0)
    icon.Image = "http://www.roblox.com/asset/?id=6034973115"
    icon.ImageColor3 = Color3.fromRGB(85, 255, 127)



    game:GetService("RunService").RenderStepped:Connect(function()
        if playerBounty.active then
            for i,player in next, game:GetService("Players"):GetPlayers() do
                for i,bounty in pairs(game:GetService("ReplicatedStorage").BountyListings:GetChildren()) do 
                    if bounty.Name == (player.DisplayName or player.Name or player) then
                        if not player.Character:FindFirstChild("Bounty") then
                            if bounty.Value >= playerBounty.highlevelBounty then
                                icon.ImageColor3 = playerBounty.highlevelColor
                            elseif bounty.Value >= playerBounty.midlevelBounty then 
                                icon.ImageColor3 = playerBounty.midlevelColor
                            elseif bounty.Value >= playerBounty.lowlevelBounty then
                                icon.ImageColor3 = playerBounty.lowlevelColor
                            else
                                icon.ImageColor3 = playerBounty.lowlevelColor
                            end
                            Bounty:Clone().Parent = player.Character
                        end
                    end
                end
            end
        else
            for i,player in next, game:GetService("Players"):GetPlayers() do
                if player.Character:FindFirstChild("Bounty") then
                    player.Character:FindFirstChild("Bounty"):Destroy()
                else

                end
            end
        end
    end)

    game:GetService("ReplicatedStorage").BountyListings.ChildAdded:Connect(function(bounty)
        for i,player in next, game:GetService("Players"):GetPlayers() do
            if bounty.Name == (player.DisplayName or player.Name or player) then 
                if not player.Character:FindFirstChild("Bounty") then
                    if bounty.Value >= playerBounty.highlevelBounty then
                        icon.ImageColor3 = playerBounty.highlevelColor
                    elseif bounty.Value >= playerBounty.midlevelBounty then 
                        icon.ImageColor3 = playerBounty.midlevelColor
                    elseif bounty.Value >= playerBounty.lowlevelBounty then
                        icon.ImageColor3 = playerBounty.lowlevelColor
                    else
                        icon.ImageColor3 = playerBounty.lowlevelColor
                    end
                    Bounty:Clone().Parent = player.Character
                end
            end
        end
    end)

    game:GetService("ReplicatedStorage").BountyListings.ChildRemoved:Connect(function(bounty)
        for i,player in next, game:GetService("Players"):GetPlayers() do
            if player.Character:FindFirstChild("Bounty") then
                player.Character:FindFirstChild("Bounty"):Destroy()
            end
        end
    end)
end


local antidownActive = false
local antidownLowestHealth = 20
function antidown()
    local debounce = false
    game:GetService("RunService").RenderStepped:Connect(function()
        if antidownActive then
            if antidownLowestHealth >= game:GetService("Players").LocalPlayer.Character.Humanoid.Health then
                if game:GetService("Players").LocalPlayer.Backpack.Stats.Downed.Value == true then return end --/ Check
                
                tp(OutOfMapPos2)
            end
        end
    end)
end















local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/matas3535/PoopLibrary/main/Library.lua"))() -- Could Also Save It In Your Workspace And Do loadfile("Library.lua")()

local currentName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

local Window = Library:New({Name = "Life Sentence | Monke.lua", Accent = Color3.fromRGB(73,230,117)})
local CombatTab = Window:Page({Name = "Main"})
local VisualsTab = Window:Page({Name = "Visuals"})
local AutomationTab = Window:Page({Name = "Automation"})
local TeleportTab = Window:Page({Name = "Teleport"})
local Settings = Window:Page({Name = "Settings"})


local aimlock_Section = CombatTab:Section({Name = "Aimlock:", Middle = true,  Side = "Left"})
local fovcircle_Section = CombatTab:Section({Name = "Fov Circle:", Middle = true,  Side = "Right"})
local hitbox_Section = CombatTab:Section({Name = "Hitbox:", Side = "Left"})
local misc_Section = CombatTab:Section({Name = "Misc:", Side = "Right"})


local playerEsp_Section = VisualsTab:Section({Name = "Players:", Side = "Left"})
local playerBountyEsp_Section = VisualsTab:Section({Name = "Player Bountys:", Side = "Right"})
local itemEsp_Section = VisualsTab:Section({Name = "Items:", Side = "Right"})


local automation_Section = AutomationTab:Section({Name = "Automation:", Side = "Left"})
local gym_Section = AutomationTab:Section({Name = "Gym:", Side = "Right"})
local mine_Section = AutomationTab:Section({Name = "Coal Mine:", Side = "Right"})


local teleport_Section = TeleportTab:Section({Name = "Teleports:", Side = "Left"})


local Settings_Main = Settings:Section({Name = "Main:", Side = "Left"})
local Settings_Config = Settings:Section({Name = "Config:", Side = "Right"})



--/ Aimlock
aimlock_Section:Toggle({Name = "Toggle", Default = false, Callback = function(Value)
    settings.Aimbot = Value
    if Value then
        aimlock()
    end
end})
aimlock_Section:Keybind({Name = "Toggle Key", Default = Enum.UserInputType.MouseButton2, Mode = "Hold", Callback = function(key)
    settings.Aimbot_ToggleKey = key
end})




--/ Fov Circle
fovcircle_Section:Toggle({Name = "Visible", Default = false, Callback = function(Value)
    settings.Aimbot_Draw_FOV = Value
end})
fovcircle_Section:Slider({Name = "Radius", Minimum = 0, Maximum = 500, Default = 200, Decimals = 1, Callback = function(Value)
    settings.Aimbot_FOV_Radius = Value
end})
fovcircle_Section:Colorpicker({Name = "Color", Default = Color3.fromRGB(255, 255, 255), Callback = function(color)
    settings.Aimbot_FOV_Color = Color3.fromRGB(color.r*255, color.g*255, color.b*255)
end})



--/ Hitbox Expander
hitbox_Section:Toggle({Name = "Hitbox Expander", Default = false, Callback = function(Value)
    hitbox.active = Value
    if Value then
        hitboxExpander()
    end
end})
hitbox_Section:Label({Name = "Disable Hitbox Expander\nbefore changing bodypart.", Middle = true})
hitbox_Section:ButtonHolder({Buttons = {{"Torso", function() hitbox.bodyPart = "HumanoidRootPart" end}, {"Head", function() hitbox.bodyPart = "Head" end}}})
hitbox_Section:Slider({Name = "Size", Minimum = 1, Maximum = 30, Default = hitbox.size, Decimals = 1, Callback = function(Value)
    hitbox.size = Value
end})
hitbox_Section:Slider({Name = "Transparency", Minimum = 0, Maximum = 1, Default = 0.5, Decimals = 0.1, Callback = function(Value)
    hitbox.transparency = Value
end})
hitbox_Section:Colorpicker({Name = "Color", Default = Color3.fromRGB(255, 255, 255), Callback = function(color)
    hitbox.color = Color3.fromRGB(color.r*255, color.g*255, color.b*255)
end})

--/ misc_Section
misc_Section:Toggle({Name = "Anit-Stomp", Default = false, Callback = function(Value)
    antiStompActive = Value
    if Value then
        antiStomp()
    end
end})
misc_Section:Toggle({Name = "Anti-Down", Default = false, Callback = function(Value)
    antidownActive = Value
    if Value then
        antidown()
    end
end})
misc_Section:Slider({Name = "Anti-Down Health", Minimum = 5, Maximum = 100, Default = antidownLowestHealth, Decimals = 1, Callback = function(Value)
    antidownLowestHealth = Value
end})
misc_Section:Button({Name = "Delete Doors", Callback = function() deleteDoors() end})
misc_Section:Slider({Name = "Camera Fov", Minimum = 60, Maximum = 120, Default = 80, Decimals = 1, Callback = function(Value)
    game:GetService("Workspace").CurrentCamera.FieldOfView = Value
end})




--/ Players ESP
playerEsp_Section:Toggle({Name = "Names", Default = false, Callback = function(Value)
    addNamesActive = Value
    if Value then
        addNames()
    end
end})
playerEsp_Section:Toggle({Name = "Box", Default = false, Callback = function(Value)
    playerBoxEsp.active = Value
    if Value then
        addBox()
    end
end})
playerEsp_Section:Colorpicker({Name = "Prisoner Color", Default = playerBoxEsp.prisonerColor, Callback = function(color)
    playerBoxEsp.prisonerColor = Color3.fromRGB(color.r*255, color.g*255, color.b*255)
end})
playerEsp_Section:Colorpicker({Name = "Cop Color", Default = playerBoxEsp.copColor, Callback = function(color)
    playerBoxEsp.copColor = Color3.fromRGB(color.r*255, color.g*255, color.b*255)
end})
playerEsp_Section:Toggle({Name = "Health", Default = false, Callback = function(Value)
    playerHealthbarActive = Value
    if Value then
        addHealthbar()
    end
end})

--/ Player Bounty ESP
playerBountyEsp_Section:Toggle({Name = "Toggle", Default = false, Callback = function(Value)
    playerBounty.active = Value
    if Value then
        addBounty()
    end
end})
playerBountyEsp_Section:Colorpicker({Name = "High-Bounty Color ( > 300 )", Default = playerBounty.highlevelColor, Callback = function(color)
    playerBounty.highlevelColor = Color3.fromRGB(color.r*255, color.g*255, color.b*255)
end})
playerBountyEsp_Section:Colorpicker({Name = "Mid-Bounty Color ( > 200 )", Default = playerBounty.midlevelColor, Callback = function(color)
    playerBounty.midlevelColor = Color3.fromRGB(color.r*255, color.g*255, color.b*255)
end})
playerBountyEsp_Section:Colorpicker({Name = "Low-Bounty Color ( > 100 )", Default = playerBounty.lowlevelColor, Callback = function(color)
    playerBounty.lowlevelColor = Color3.fromRGB(color.r*255, color.g*255, color.b*255)
end})

--/ Item ESP
itemEsp_Section:Toggle({Name = "Names", Default = false, Callback = function(Value)
    addItemsNameActive = Value
    if Value then
        addItemsName()
    end
end})


--/ Automation
automation_Section:Toggle({Name = "Auto Farm Items", Default = false, Callback = function(Value)
    autofarmItemsActive = Value
    if Value then
        autofarmItems()
    end
end})
automation_Section:Toggle({Name = "Auto Farm Safes (requires Auto Pick-Up Cash)", Default = false, Callback = function(Value)
    autofarmSafesActive = Value
    if Value then
        autofarmSafes()
    end
end})
automation_Section:Toggle({Name = "Auto Pick-Up Cash", Default = false, Callback = function(Value)
    autopickupMoneyActive = Value
    if Value then
        autopickupMoney()
    end
end})

--Gym
gym_Section:Toggle({Name = "Auto Dumbell", Default = false, Callback = function(Value)
    autoStrengthActive = Value
    if Value then
        autoStrength()
    end
end})
gym_Section:Button({Name = "Teleport to Dumbell", Callback = function() tp(dumbellPos) end})

--Coal Mine
mine_Section:Toggle({Name = "Auto Farm Rocks", Default = false, Callback = function(Value)
    autofarmRocksActive = Value
    if Value then
        autofarmRocks()
    end
end})
mine_Section:Button({Name = "Teleport to Pickaxe", Callback = function() tp(pickaxePos) end})




--/ Teleport
teleport_Section:Button({Name = "Bountys", Callback = function() tp(bountysPos) end})
teleport_Section:Button({Name = "Roof", Callback = function() tp(roofPos) end})
teleport_Section:Button({Name = "Spawnroom", Callback = function() tp(spawnroomPos) end})
teleport_Section:Button({Name = "OutOfMap1", Callback = function() tp(OutOfMapPos) end})
teleport_Section:Button({Name = "OutOfMap2", Callback = function() tp(OutOfMapPos2) end})
teleport_Section:Button({Name = "Locker", Callback = function() tp(lockerPos) end})
teleport_Section:Button({Name = "Gym", Callback = function() tp(gymPos) end})
teleport_Section:Button({Name = "Freezer", Callback = function() tp(freezerRoomPos) end})
teleport_Section:Button({Name = "Workshop", Callback = function() tp(workshopPos) end})
teleport_Section:Button({Name = "Library", Callback = function() tp(libraryPos) end})
teleport_Section:Button({Name = "Sewage", Callback = function() tp(sewagePos) end})
teleport_Section:Button({Name = "Solitary", Callback = function() tp(solitaryPos) end})
teleport_Section:Button({Name = "Coal Mine", Callback = function() tp(minePos) end})
teleport_Section:Button({Name = "Research Table", Callback = function() tp(researchPos) end})
teleport_Section:Button({Name = "Cell Block", Callback = function() tp(cellBlockPos) end})




--/ Settings_Main
Settings_Main:Keybind({Name = "Open/Close Key", Default = Enum.KeyCode.Z, Mode = "Toggle", Callback = function(key)
    Window.uibind = key
end})

--/ Settings_Config
Settings_Config:ConfigBox({})
Settings_Config:ButtonHolder({Buttons = {{"Load", function() end}, {"Save", function() end}}})
Settings_Config:Label({Name = "Unloading will fully unload\neverything, so save your\nconfig before unloading.", Middle = true})
Settings_Config:Button({Name = "Unload", Callback = function() Window:Unload() end})


-- // Initialisation
Window:Initialize()
