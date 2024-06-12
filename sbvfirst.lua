local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()



function Script()
    local Window = Library.CreateLib("Slap Battles op script admin", "Ocean")



    local Main = Window:NewTab("Main")
    local MainSection = Tab:NewSection("Main")



    -script Maim

    MainSection:NewSlider("WalkSPeed", "How Fast you will walk", 50, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)


    MainSection:NewSlider("JumpPower", "How much you will jump", 50, 1, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
    end)
end

if game.PlaceId == 17833106912 then
    Script()
end
