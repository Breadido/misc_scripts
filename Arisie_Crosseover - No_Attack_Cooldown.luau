-- does not work on shit executors(ex. xeno, solara, etc)
local wow = require(game:GetService("ReplicatedStorage").SharedModules.WeaponsModule).Click
-- getting auto click loop function
local loopFunc
for i,v in next, getgc() do
    if type(v) == 'function' and tostring(getfenv(v).script) == "AutoClick" then 
        loopFunc = v
    end
end
-- changes auto click cooldown
setconstant(loopFunc, 21, 0)
setconstant(loopFunc, 25, 0)
-- changes attacking cooldown
setconstant(wow, 58, 0)
setconstant(wow, 12, 0)
