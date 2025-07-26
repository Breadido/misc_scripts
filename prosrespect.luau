-- i'm not going to explain what this does but it does :>
if getgenv().client == nil then
    getgenv().client = {}
    for i,v in next, getgc() do
        if type(v) == "function" and islclosure(v) then
            local sc = getfenv(v).script
            if sc ~= nil and sc.Parent.Name == "Scripts" and sc.Name == "PanClient" then
				if getinfo(v).name == "stopDigging" then
                    client.originalstopdigging = clonefunction(v)
                end
                client[getinfo(v).name] = v
            end
        end
    end
end
setconstant(client.startDigging, 15, -9e9)
setconstant(client.startDigging, 39, -9e9)
setconstant(client.startDigging, 60, -9e9)
setconstant(client.shake, 18, -9e9)
pcall(function()
    setconstant(client.toggleCamera, 12, 0)
    hookfunction(client.toggleCamera, function() end)
end)
hookfunction(client.stopDigging, function()
	getupvalue(client.originalstopdigging, 1):Stop(0)
	getupvalue(client.originalstopdigging, 2):Stop(0)
	setupvalue(client.originalstopdigging, 3, false)
	setupvalue(client.originalstopdigging, 4, false)
	getupvalue(client.originalstopdigging, 5).DigBar.Visible = false
	getupvalue(client.originalstopdigging, 6).WalkSpeed = 16
    getupvalue(client.originalstopdigging, 6).JumpPower = 50
    getupvalue(client.originalstopdigging, 6).AutoRotate = true
	getupvalue(client.originalstopdigging, 7):FireServer(false)
end)
setconstant(client.startDigging, 41, "workspace")
setconstant(client.startDigging, 43, "Archivable")
setconstant(client.startDigging, 44, 9e9)
