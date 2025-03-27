-- ik it looks absolutely shit but idc
getgenv().instantpick = true
local client = {
    ropedata = {};
}
local old = require(game:GetService("ReplicatedStorage").VehicleLink.VehicleLinkBinder)._constructor._updateSeeking
require(game:GetService("ReplicatedStorage").VehicleLink.VehicleLinkBinder)._constructor._updateSeeking = (function(ropedata)
    client.ropedata = ropedata
    return old(ropedata)
end)
while instantpick do task.wait()
    pcall(function() -- i'm lazy
        if client.ropedata.nearestObj ~= nil then
            local cframe = client.ropedata.nearestObj.PrimaryPart.CFrame:PointToObjectSpace(require(game:GetService("ReplicatedStorage"):WaitForChild("Std"):WaitForChild("GeomUtils")).closestPointInPart(client.ropedata.nearestObj.PrimaryPart, client.ropedata.obj.Position))
            client.ropedata.manifest.reqLinkRemote:FireServer(client.ropedata.nearestObj, cframe)
        end
    end)
end
