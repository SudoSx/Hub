local AkaliNotif = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))();
local Notify = AkaliNotif.Notify;


if game.PlaceId == 3214114884 then --/ Flag Wars
    Notify({
        Description = "Loading Flag Wars.";
        Title = "Game Found!";
        Duration = 5;
    });
    
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/SudoSx/Hub/main/games/FlagWars.lua"),true))()
elseif game.PlaceId == 10427037408 then --/ Life Sentence/Prison Sentence
    Notify({
        Description = "Loading Life Sentence/Prison Sentence.";
        Title = "Game Found!";
        Duration = 5;
    });

    loadstring(game:HttpGet(("https://raw.githubusercontent.com/SudoSx/Hub/main/games/lifesen.lua"),true))()
elseif game.PlaceId == 10784373080 then --/ RAYS! (FPS)
    Notify({
        Description = "Loading RAYS! (FPS).";
        Title = "Game Found!";
        Duration = 5;
    });

    loadstring(game:HttpGet(("https://raw.githubusercontent.com/SudoSx/Hub/main/games/rays-fps.lua"),true))()
else --/ If no game was found
    Notify({
        Description = "Game is not supported.";
        Title = "Error!";
        Duration = 5;
    });
end

