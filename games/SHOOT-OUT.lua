local headshotmodule = require(game:GetService("ReplicatedFirst")["_0xS0URC3X"].Shared.IsHeadshot)
function onlyHeadshot()
    headshotmodule = function()
        return true; 
    end
end


local weaponsmodule = game:GetService("ReplicatedFirst")["_0xS0URC3X"].Shared.WeaponDataManager
function gunmods()
    for i,weapon in pairs(weaponsmodule:GetChildren()) do
        local currentmodule = require(weapon)
        currentmodule.Settings.SPREAD = nil
        currentmodule.Settings.AUTOMATIC = true
        currentmodule.Settings.RECOIL_STRENGTH = nil
        currentmodule.Settings.RELOAD_TIME = nil
        currentmodule.Settings.MAX_AMMO = math.huge
    end
end


local damagemodule = require(game:GetService("ReplicatedFirst")["_0xS0URC3X"].Shared.CalculateDamage)
function alwaysmaxdamage()
    damagemodule = function()
        return 100;
    end
end

local highlightSettings = {
    color = Color3.fromRGB(255,0,0),
    outline = false
}
function highlightenemys()
    game:GetService("RunService").Heartbeat:Connect(function()
        for i,player in next, game:GetService("Players"):GetPlayers() do
            if player.Character and not player.Character:FindFirstChild("charm") and player.Character.Head.NameTag.TextLabel.TextColor3 == Color3.new(1,0,0) then
                local charm = Instance.new("Highlight")
                charm.Name = "charm"
                charm.Parent = player.Character
                charm.FillColor = highlightSettings.color
                if highlightSettings.outline then
                    charm.OutlineTransparency = 0
                else
                    charm.OutlineTransparency = 1
                end
            end
        end
    end)    
end
function adcolor()
    for i,player in next, game:GetService("Players"):GetPlayers() do
        if player.Character and player.Character:FindFirstChild("charm") and player.Character.Head.NameTag.TextLabel.TextColor3 == Color3.new(1,0,0) then
            local charm = player.Character:FindFirstChild("charm")
            charm.FillColor = highlightSettings.color
        end
    end
end
function adoutline()
    for i,player in next, game:GetService("Players"):GetPlayers() do
        if player.Character and player.Character:FindFirstChild("charm") and player.Character.Head.NameTag.TextLabel.TextColor3 == Color3.new(1,0,0) then
            local charm = player.Character:FindFirstChild("charm")
            if highlightSettings.outline then
                charm.OutlineTransparency = 0
            else
                charm.OutlineTransparency = 1
            end
        end
    end
end

function hitboxexpander()
    game:GetService("RunService").Stepped:Connect(function()
        for i,player in next, game:GetService("Players"):GetPlayers() do
            if player ~= game.Players.LocalPlayer and player.Character and player.Character.Head.NameTag.TextLabel.TextColor3 == Color3.new(1,0,0) then
                player.Character.Head.Size = Vector3.new(6,6,6)
                player.Character.Head.Transparency = 0.5
                player.Character.Head.CanCollide = false
            end
        end
    end)       
end

--ui
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

local Window = Material.Load({
	Title = "SHOOT OUT! | made with big honkers",
	Style = 1,
	SizeX = 300,
	SizeY = 450,
	Theme = "Dark",
})

local MainTab = Window.New({
	Title = "Main"
})

local VisualTab = Window.New({
	Title = "Visual"
})

local hitboxButton = MainTab.Button({
	Text = "Hitbox Expander",
	Callback = function()
		hitboxexpander()
	end,
})
local droneButton = MainTab.Button({
	Text = "Gun Mods (no spread, no recoil, etc.)",
	Callback = function()
		gunmods() 
	end,
})
local gunmodsButton = MainTab.Button({
	Text = "Always Max Damage (buggy)",
	Callback = function()
		alwaysmaxdamage() 
	end,
})
local norecoilButton = MainTab.Button({
	Text = "Only Headshots (buggy)",
	Callback = function()
		onlyHeadshot()
	end,
})

local highlightbutton = VisualTab.Button({
	Text = "Highlight Enemy",
	Callback = function()
		highlightenemys() 
	end,
})
local highlightColor = VisualTab.ColorPicker({
	Text = "Color",
	Default = Color3.fromRGB(255,0,0),
	Callback = function(Value)
        highlightSettings.color = Color3.fromRGB(Value.R*255, Value.G*255, Value.B*255)
        adcolor()
	end,
})
local outline = VisualTab.Toggle({
	Text = "Outline",
	Callback = function(Value)
        highlightSettings.outline = Value
		adoutline()
	end,
	Enabled = false
})
