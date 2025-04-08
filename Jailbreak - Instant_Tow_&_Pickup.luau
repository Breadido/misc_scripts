
local client = {
    geomUtils = require(game:GetService("ReplicatedStorage"):WaitForChild("Std"):WaitForChild("GeomUtils"));
    vehiclelinkbinder = require(game:GetService("ReplicatedStorage").VehicleLink.VehicleLinkBinder);
    vehiclelinkutils =  require(game:GetService("ReplicatedStorage").VehicleLink.VehicleLinkUtils);
}
local uh = client.vehiclelinkbinder
local old = uh._constructor._hookNearest
uh._constructor._hookNearest = (function(...)
    local args = {...}
    local rope = args[1].obj
    local obj = args[1].nearestObj
    local requestLink = args[1].manifest.reqLinkRemote
    local cf = obj.PrimaryPart.CFrame:PointToObjectSpace(client.geomUtils.closestPointInPart(obj.PrimaryPart, rope.Position), rope.Position)
    requestLink:FireServer(obj, cf)
    return
end)
