-- functions
local playerteam = game:GetService("Players").LocalPlayer.Team

function infinitedroneFunction()
    game:GetService("RunService").RenderStepped:Connect(function()
        for i,player in next, game:GetService("Players"):GetPlayers() do
            if player.Team ~= playerteam and player.Name ~= game.Players.LocalPlayer.Name then
                if player.Character.Highlight.DepthMode == "AlwaysOnTop" then 
                    
                else 
                    player.Character.Highlight.DepthMode = "AlwaysOnTop"
                end
            end
        end
    end)
end

function gunmodsFunction()
   local gunsmodule = require(game:GetService("ReplicatedStorage").Modules.Guns)
    for i,v in pairs(gunsmodule) do
        v.Reload = 0.01
        v.Range = 1000000000
        v.BulletSize = 10
        v.Automatic = true
    end 
end

-- ui
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

local Window = Material.Load({
	Title = "RAYS! (FPS) | made with big honkers",
	Style = 1,
	SizeX = 300,
	SizeY = 450,
	Theme = "Dark",
})

local MainTab = Window.New({
	Title = "Main"
})

local VisualTab = Window.New({
	Title = "Visuals"
})

local droneButton = MainTab.Button({
	Text = "Infinite Drone",
	Callback = function()
		infinitedroneFunction() 
	end,
})

local gunmodsButton = MainTab.Button({
	Text = "Gun Mods",
	Callback = function()
		gunmodsFunction() 
	end,
})

local norecoilButton = MainTab.Button({
	Text = "No Recoil",
	Callback = function()
		local recoilmodule = require(game:GetService("ReplicatedStorage").Modules.CameraController)
        recoilmodule.SetRecoil = function()
            return nil; 
        end
	end,
})




local cameramodule = require(game:GetService("ReplicatedStorage").Modules.CameraController)

local defaultFovSlider = VisualTab.Slider({
	Text = "Default FOV",
	Callback = function(Value)
		cameramodule.CameraSettings.Default.FieldOfView = Value
	end,
	Min = 70,
	Max = 120,
	Def = cameramodule.CameraSettings.Default.FieldOfView
})
local aimingFovSlider = VisualTab.Slider({
	Text = "Aiming FOV (Broken)",
	Callback = function(Value)
		cameramodule.CameraSettings.Aiming.FieldOfView = Value
	end,
	Min = 70,
	Max = 120,
	Def = cameramodule.CameraSettings.Aiming.FieldOfView
})
local sprintingFovSlider = VisualTab.Slider({
	Text = "Sprinting FOV",
	Callback = function(Value)
		cameramodule.CameraSettings.Sprinting.FieldOfView = Value
	end,
	Min = 70,
	Max = 120,
	Def = cameramodule.CameraSettings.Sprinting.FieldOfView
})
