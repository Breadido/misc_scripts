local jbremote
local oldjbremote
for i,v in next, getgc(true) do
    if type(v) == "function" and getinfo(v).name == "EventFireServer" and tostring(getfenv(v).script) == "LocalScript" then
        jbremote = v
        oldjbremote = v
    end
    if type(v) == "function" and getinfo(v).name:find("CheatCheck") and tostring(getfenv(v).script) == "LocalScript" then
        hookfunction(v, function() end)
    end
end

hookfunction(jbremote, function(...)
    local args = {...}
    if #args == 3 and debug.traceback():find("LocalScript:1346") then
        return
    end
    return oldjbremote(...)
end)
