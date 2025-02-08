local Client = {};

-- getting arrest functions
for i,v in next, getgc(true) do
	if type(v) == "function" and getfenv(v).script == game:GetService("Players").LocalPlayer.PlayerScripts.LocalScript then
		if getinfo(v).name == "UseHandcuffs" then
			Client.AttemptArrest = v
		end
	end
end

-- getting nearest player functions
Client.GetNearestPlayer = (function()
    local maxdistance = 12
    local player = nil;
    for i,v in next, game:GetService("Players"):GetPlayers() do
        if tostring(v.Team) == "Criminal" then
            local character = v.Character or nil
            if character ~= nil then
                local hrp = character:FindFirstChild("Head") or nil
                if hrp ~= nil then
                    local mag = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - hrp.Position).magnitude
                    if mag < maxdistance then
                        player = v
                        if player ~= nil then
                            return player
                        end
                    end
                end
            end
        end
    end
	return player
end)

-- attempting arrest nearest player/criminal function
Client.AttemptArrestNearest = (function()
	local nearestPlayer = Client.GetNearestPlayer()
	if nearestPlayer ~= nil then
		Client.AttemptArrest({
			PlayerName = nearestPlayer.Name
		})
		print("[DEBUG] attemting to arrest: ".. nearestPlayer.Name) -- you can remove this if you want to
	end
end)

task.spawn(function()
	while hahaArrestgobrrr do task.wait(0.2)
		Client.AttemptArrestNearest()
	end
end)
