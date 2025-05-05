getgenv().acbypassed = false
getgenv().debugOutput = false
local key, jbremote = loadstring(game:HttpGet('https://raw.githubusercontent.com/Introvert1337/RobloxReleases/refs/heads/main/Scripts/Jailbreak/KeyFetcher.lua'))()
local oldjbremote = getupvalue(network.FireServer, 1)
	setupvalue(jbremote.FireServer, 1, function(key,...) 
		task.wait()
		local args = {...}
		if #args == 2 and debug.traceback():find("LocalScript:1346") then 
			getgenv().acbypassed = true
			return 
		end
		return oldjbremote(key, ...)
	end)
task.wait(1)
print(getgenv().acbypassed)
