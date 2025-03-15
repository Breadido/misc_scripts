-- took not even 5 min to bypass
for i,v in next, getconnections(game:GetService("Players").LocalPlayer.PlayerScripts.LocalScript2.Changed) do
    hookfunction(v.Function, function() end)
end
for i,v in next, getconnections(game:GetService("Players").LocalPlayer.PlayerScripts.LocalScript.Changed) do
    hookfunction(v.Function, function() end)
end
game:GetService("Players").LocalPlayer.PlayerScripts.LocalScript.Disabled = true
game:GetService("Players").LocalPlayer.PlayerScripts.LocalScript2.Disabled = true
