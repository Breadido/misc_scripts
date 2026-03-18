-- not gonna explain what is ts
local client = {
    pl = game:GetService("Players");
    tw = game:GetService("TweenService");
    rs = game:GetService("ReplicatedStorage");
    blacklistedaction = {};
    targettedropcframe = nil;
    ownedvehicles = {"Camaro", "Jeep", "Heli"}; 
    bettertablefind = (function(tbl, n)
		for i,v in next, tbl do
			if tostring(v) == tostring(n) then
				return i
			end
		end
		return nil
	end);
}
client.itemsys = require(client.rs.Game.ItemSystem.ItemSystem);
client.circleactions = require(client.rs.Module.UI).CircleAction
client.actionbutton = require(client.rs.ActionButton.ActionButtonService).active
client.humanoidunloadutils = require(client.rs.HumanoidUnload.HumanoidUnloadUtils)
client.humanoidunloadconsts = require(client.rs.HumanoidUnload.HumanoidUnloadConsts)
-- setreadonly(client.humanoidunloadconsts, false)
-- client.humanoidunloadconsts.MAX_DIST_TO_LOAD = math.huge
-- client.humanoidunloadutils.setMaxDistToLoad(math.huge)
task.spawn(function()
    while true do task.wait(0.1)
        pcall(function()
            client.pl.LocalPlayer.Character.HumanoidRootPart:AddTag("NoRagdoll")
            client.pl.LocalPlayer.Character.HumanoidRootPart:AddTag("NoFallDamage")
        end)
    end
end)
client.getoutcar = (function()
    for i,v in client.actionbutton do
        if v.image == "rbxassetid://7858404863" then
            v.onPressed()
            task.wait()
            v.onReleased()
        end
    end
end)
client.distancefromcharacter = (function(pos: Vector3)
    if not client.pl.LocalPlayer.Character then
        client.pl.LocalPlayer.CharacterAdded:Wait()
    end
    if not pos then
        return nil, nil
    end
    local charpos = client.pl.LocalPlayer.Character:GetPivot().Position
    local pos1 = Vector3.new(charpos.X, 0, charpos.Z)
    local pos2 = Vector3.new(pos.X, 0, pos.Z)
    return (pos1 - pos2).Magnitude, pos
    --return client.pl.LocalPlayer:DistanceFromCharacter(pos), pos
end)
client.distancefromcharacterup = (function(pos: Vector3)
    if not client.pl.LocalPlayer.Character then
        client.pl.LocalPlayer.CharacterAdded:Wait()
    end
    if not pos then
        return nil, nil
    end
    local charpos = client.pl.LocalPlayer.Character:GetPivot().Position
    local pos1 = Vector3.new(0, charpos.Y, 0)
    local pos2 = Vector3.new(0, pos.Y, 0)
    return (pos1 - pos2).Magnitude, pos
    --return client.pl.LocalPlayer:DistanceFromCharacter(pos), pos
end)
client.calculatespeed = (function(target: Vector3, speed: number)
    local dist = client.distancefromcharacter(target)
    if not dist then
        return nil
    end
    return dist / speed
end)
client.calculatespeedup = (function(target: Vector3, speed: number)
    local dist = client.distancefromcharacterup(target)
    if not dist then
        return nil
    end
    return dist / speed
end)
client.modelpivottp = (function(model: Model, tweeninfo: TweenInfo, destination: CFrame) -- much more (un) detected
	local cframevalue = Instance.new("CFrameValue")
    cframevalue.Value = model:GetPivot()
    cframevalue:GetPropertyChangedSignal("Value"):Connect(function()
        task.wait()
        model:PivotTo(cframevalue.Value)
    end)
    local tween = client.tw:Create(cframevalue, tweeninfo, {Value = destination})
    tween:Play()
    tween.Completed:Wait()
    cframevalue:Destroy()
end)
client.tryescape = (function()
    if not client.pl.LocalPlayer.Character then
        client.pl.LocalPlayer.CharacterAdded:Wait()
    end
    local char = client.pl.LocalPlayer.Character
    local savedpos = CFrame.new(char:GetPivot().Position.X, 400, char:GetPivot().Position.Z)
    client.modelpivottp(char, TweenInfo.new(client.calculatespeedup(savedpos.Position, 50), Enum.EasingStyle.Linear), savedpos)
    repeat task.wait()
        char:PivotTo(savedpos)
    until tostring(client.pl.LocalPlayer.Team) == "Criminal"
end)
client.spawnvehicle = (function()
    client.rs:WaitForChild("GarageSpawnVehicle"):FireServer("Chassis", "Camaro")
end)
client.simpleraycastthing = (function(v)
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
    raycastParams.FilterDescendantsInstances = {workspace.Vehicles}
    local result = workspace:Raycast(v.Position, Vector3.new(0, 500, 0), raycastParams)
    return result
end)
client.destroypassenger = (function()
    for i,v in next, workspace.Vehicles:GetChildren() do
        if v:FindFirstChild("Passenger") and v.Passenger:FindFirstChild("PlayerName") and v.Passenger.PlayerName.Value == client.pl.LocalPlayer.Name then
            print(v)
            --v:Destroy()
        end
    end
end)
client.getinvehicle = (function(part)
    for i,v in client.circleactions do
        if v.Name == "Enter Driver" and v.Part == part then
            v:Callback(true)
        end
    end
end)
client.runaction = (function(actionpart)
    local passengerpart
    for i,v in client.circleactions.Specs do
        if v.Part == actionpart then
            v:Callback(true)
            passengerpart = v.Part
        end
    end
    --return passengerpart
end)
client.getnearestcar = (function()
    local targetdistance = math.huge
    local target
    for i,v in client.circleactions.Specs do
        if v.Name == "Enter Driver" and v.Part and client.simpleraycastthing(v.Part.CFrame) == nil and client.pl.LocalPlayer:DistanceFromCharacter(v.Part.Position) < targetdistance and client.blacklistedaction[v.Part] ~= true and client.bettertablefind({"Camaro", "Jeep", "Heli"}, v.Part.Parent.Name) then
            targetdistance = client.pl.LocalPlayer:DistanceFromCharacter(v.Part.Position)
            target = v.Part
        end
    end
    return target
end)
client.playerteleport = (function(speed: number, dest: CFrame)
    local iscriminal = false
    if not client.pl.LocalPlayer.Character then
        client.pl.LocalPlayer.CharacterAdded:Wait()
    end
    local char = client.pl.LocalPlayer.Character
    if tostring(client.pl.LocalPlayer.Team) == "Prisoner" then
        iscriminal = true
        client.tryescape()
    end
    local savedpos = CFrame.new(char:GetPivot().Position.X, 400, char:GetPivot().Position.Z)
    client.modelpivottp(char, TweenInfo.new(client.calculatespeedup(savedpos.Position, 100), Enum.EasingStyle.Linear), savedpos)
    task.wait(0.01)
    client.modelpivottp(char, TweenInfo.new(client.calculatespeed(dest.Position, speed), Enum.EasingStyle.Linear), CFrame.new(dest.Position.X, char:GetPivot().Position.Y, dest.Position.Z))
    task.wait(0.01)
    local tw = client.tw:Create(char.HumanoidRootPart, TweenInfo.new(0.1), {CFrame = dest})
    tw:Play()
    tw.Completed:Wait()
    -- pcall(function()
        
    -- end)
    task.wait(0.01)
    for i = 1, 10 do task.wait()
        client.pl.LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = vector.zero
    end
end)
-- client.dounderground = (function(passenger: Instance)
--     --if passenger then
--         print("yes")
--         --task.wait(0.5)
--         game.Destroy(client.getnearestpassenger())
--         --repeat task.wait() until client.pl.LocalPlayer.Character:GetPivot().Y <= -400
--         task.wait(2)
--         client.undergroundpart.Position = Vector3.new(client.pl.LocalPlayer.Character:GetPivot().Position.X, -400, client.pl.LocalPlayer.Character:GetPivot().Position.Z)
--         repeat task.wait(0.01)
--             client.getoutcar()
--         until client.pl.LocalPlayer.Character.Humanoid.Sit == false
--         --client.spawnvehicle()
--     --end
-- end)
client.getincar = (function()
    if client.pl.LocalPlayer.Character.Humanoid.Sit == true then
        return true
    else
        local car = client.getnearestcar()
        client.playerteleport(100, car.CFrame)
        for i = 1, 5 do task.wait(0.5)
            if client.pl.LocalPlayer.Character.Humanoid.Sit ~= true then
                client.pl.LocalPlayer.Character:PivotTo(car.CFrame)
                client.runaction(car)
            end
        end
        task.wait(1)
        if client.pl.LocalPlayer.Character.Humanoid.Sit == false then
            --client.blacklistedaction[car] = true
            return client.getincar()
        else
            return car
        end
    end
end)
client.teleporttodrop = (function()
    if client.targettedropcframe then
        local car = client.getincar()
        if car and client.targettedropcframe then
            client.playerteleport(300, client.targettedropcframe)
            task.wait(0.1)
            if workspace:FindFirstChild("Drop") then
                client.getoutcar()
                task.wait(0.1)
                client.pl.LocalPlayer.Character:PivotTo(workspace.Drop:GetPivot())
            end
        end
    end
end)
client.collectdrop = (function()
    if workspace:FindFirstChild("Drop") then
        client.teleporttodrop()
        if workspace:FindFirstChild("Drop") and workspace.Drop:GetAttribute("BriefcaseCollected") ~= true then
            repeat task.wait()
                client.pl.LocalPlayer.Character:PivotTo(workspace.Drop:GetPivot())
            until workspace.Drop:GetAttribute("BriefcaseLanded") == true
            local drop = workspace.Drop
            repeat task.wait()
                for i,v in next, getupvalue(client.itemsys.GetEquipped, 1) do
                    if v.Character and v.BulletEmitter and v.BulletEmitter.IgnoreGuards then
                        v.BulletEmitter.IgnoreLocalPlayer = true
                    end
                end
                drop.BriefcasePress:FireServer()
                drop.BriefcaseCollect:FireServer()
            until workspace.Drop:GetAttribute("BriefcaseCollected") == true
            task.wait(0.5)
            for i,v in client.circleactions.Specs do
                if v.Name:sub(1, 7) == "Collect" then
                    v:Callback(true)
                end
            end
        end
    end
end)

client.getincar()
for i,v in next, {
    CFrame.new(1107, 145, 1359);
    CFrame.new(548, 109, -510);
    CFrame.new(1998, 145, -384);
    CFrame.new(1523, 196, -3447);
    CFrame.new(-689, 216, -5980);
    CFrame.new(-1405, 96, -3812);
    CFrame.new(764, 44, -3325);
} do
    client.modelpivottp(client.pl.LocalPlayer.Character, TweenInfo.new(1, Enum.EasingStyle.Linear), v)
    for i = 1, 20 do task.wait()
        task.spawn(function()
            client.pl.LocalPlayer:RequestStreamAroundAsync(v.Position, 1000)
        end)
        if workspace:FindFirstChild("Drop") then
            print(workspace:FindFirstChild("Drop"))
            client.targettedropcframe = workspace.Drop:GetPivot()
            break
        end
        client.pl.LocalPlayer.Character:PivotTo(v)
    end
    if workspace:FindFirstChild("Drop") then
        print(workspace:FindFirstChild("Drop"))
        client.targettedropcframe = workspace.Drop:GetPivot()
        break
    end
end
task.wait(0.5)
if client.targettedropcframe then
    client.collectdrop()
end

-- client.collectdrop()
--client.getinpassenger()
-- game.Destroy(client.getnearestpassenger())
-- repeat task.wait() until client.pl.LocalPlayer.Character:GetPivot().Position.Y <= 50
-- client.undergroundpart.Position = Vector3.new(client.pl.LocalPlayer.Character:GetPivot().Position.X, -60, client.pl.LocalPlayer.Character:GetPivot().Position.Z)
-- client.vehicleteleport = (function()

-- end)
-- task.wait(0.5)
-- client.spawnvehicle()

-- task.wait(0.5)
-- client.getinvehicle()
-- for i,v in client.circleactions.Specs do
--     if v.Name == "Enter Passenger" then
--         print(v.Part.Parent)
--     end
-- end
