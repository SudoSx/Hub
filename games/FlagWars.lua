-- ui
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = "💥 Flag Wars!",
    LoadingTitle = "💥 Flag Wars! | Made with big honkers",
    LoadingSubtitle = "",
    ConfigurationSaving = {
       Enabled = false,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Big Hub"
    },
    Discord = {
       Enabled = false,
       Invite = "ABCD", -- The Discord invite code, do not include discord.gg/
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

local mainTab = Window:CreateTab("Main", 4483362458) -- Title, Image

local dirtSection = mainTab:CreateSection("Dirt")
mainTab:CreateButton({
    Name = "Destroy dirt",
    Callback = function()
        for i,chunk in pairs(game:GetService("Workspace").Core.CurrentDirt:GetChildren()) do 
            for i,dirt in pairs(chunk:GetChildren()) do
                dirt:Destroy()
            end
        end
    end,
})
mainTab:CreateButton({
    Name = "Make dirt transparent",
    Callback = function()
        for i,chunk in pairs(game:GetService("Workspace").Core.CurrentDirt:GetChildren()) do 
            for i,dirt in pairs(chunk:GetChildren()) do
                dirt.Transparency = 0.9
                dirt.CanCollide = false
            end
        end
    end,
})

local hitboxSection = mainTab:CreateSection("Hitbox")
mainTab:CreateButton({
    Name = "Make hitbox bigger (blue hitboxes)",
    Callback = function()
        loadstring(game:HttpGet(("https://pastebin.com/raw/zn1ZpFue"),true))()
    end,
})

local espSection = mainTab:CreateSection("ESP")
mainTab:CreateButton({
    Name = "Activate",
    Callback = function()
        loadstring(game:HttpGet(("https://pastebin.com/raw/hVheahav"),true))()
    end,
})
