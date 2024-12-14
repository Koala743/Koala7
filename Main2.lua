


local Fernando = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local Cuadro1 = Instance.new("Frame")
local Cuadro2 = Instance.new("Frame")
local Barra1 = Instance.new("ScrollingFrame")
local Barra2 = Instance.new("ScrollingFrame")
local Siguiente = Instance.new("TextButton")
local Mix = Instance.new("TextButton")
local Borde1 = Instance.new("UIStroke")
local Borde2 = Instance.new("UIStroke")
local lplr = game.Players.LocalPlayer
local data = game.ReplicatedStorage:WaitForChild("Datas"):WaitForChild(lplr.UserId)

Fernando.Name = "Fernando"
Fernando.Parent = game.CoreGui


Frame.Parent = Fernando
Frame.BackgroundTransparency = 1
Frame.Position = UDim2.new(0.5, -150, 0.4, -130)
Frame.Size = UDim2.new(0, 410, 0, 30)
Frame.Active = true
Frame.Draggable = true

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Text = "DBU                                                "
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextStrokeColor3 = Color3.fromRGB(0, 255, 0)
TextLabel.TextSize = 14
TextLabel.TextStrokeTransparency = 0
TextLabel.TextScaled = true


Cuadro1.Parent = TextLabel
Cuadro1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Cuadro1.Position = UDim2.new(0, 0, 1, 0)
Cuadro1.Size = UDim2.new(0, 410, 0, 400)
Cuadro1.Visible = false  -- Comienza oculto

Cuadro2.Parent = TextLabel
Cuadro2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Cuadro2.Position = UDim2.new(0, 0, 1, 0)
Cuadro2.Size = UDim2.new(0, 410, 0, 400)
Cuadro2.Visible = false  -- Comienza oculto

Barra1.Parent = Cuadro1
Barra1.Size = UDim2.new(1, 0, 1, 0)
Barra1.CanvasSize = UDim2.new(0, 0, 2, 0)
Barra1.ScrollBarThickness = 10
Barra1.BackgroundTransparency = 1
Barra1.ScrollingDirection = Enum.ScrollingDirection.Y 

Barra2.Parent = Cuadro2
Barra2.Size = UDim2.new(1, 0, 1, 0)
Barra2.CanvasSize = UDim2.new(0, 0, 2, 0)
Barra2.ScrollBarThickness = 10
Barra2.BackgroundTransparency = 1
Barra2.ScrollingDirection = Enum.ScrollingDirection.Y 

Siguiente.Parent = Frame
Siguiente.BackgroundTransparency = 1
Siguiente.Position = UDim2.new(0.9, 17, 0, 0)
Siguiente.Size = UDim2.new(0, 30, 0, 30)
Siguiente.Text = ">"
Siguiente.TextColor3 = Color3.fromRGB(255, 255, 255)
Siguiente.TextSize = 20

Mix.Parent = Frame
Mix.BackgroundTransparency = 1
Mix.Position = UDim2.new(0.880, 0, 0, 0)
Mix.Size = UDim2.new(0, 30, 0, 30)
Mix.Text = "+"
Mix.TextColor3 = Color3.fromRGB(255, 255, 255)
Mix.TextSize = 20

local ligaLabel = Instance.new("TextLabel")
ligaLabel.Size = UDim2.new(0, 200, 0, 50)
ligaLabel.Position = UDim2.new(0.5, -210, 0.5, -25)
ligaLabel.Text = "Loading..."
ligaLabel.TextSize = 24
ligaLabel.TextStrokeTransparency = 0.8
ligaLabel.BackgroundTransparency = 1
ligaLabel.Parent = TextLabel

local questLabel = Instance.new("TextLabel")
questLabel.Size = UDim2.new(0, 200, 0, 30)
questLabel.Position = UDim2.new(0.3, 36, 0, 0)
questLabel.BackgroundTransparency = 1
questLabel.TextSize = 9
questLabel.Text = "Mission: | Form: "
questLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
questLabel.TextStrokeColor3 = Color3.fromRGB(0, 255, 255)
questLabel.TextStrokeTransparency = 0
questLabel.TextScaled = false
questLabel.Parent = TextLabel


--incio Borde color\/
Borde1.Parent = Cuadro1
Borde1.Thickness = 2
Borde1.Color = Color3.fromRGB(255, 0, 0) 

Borde2.Parent = Cuadro2
Borde2.Thickness = 2
Borde2.Color = Color3.fromRGB(255, 0, 0) 
--parte 2 de color Borde\/


task.spawn(function()
    local colors = {
        Color3.fromRGB(255, 0, 0), -- Rojo
        Color3.fromRGB(0, 255, 0), -- Verde
        Color3.fromRGB(0, 0, 255), -- Azul
        Color3.fromRGB(255, 255, 0) -- Amarillo
    }
    local index = 1

    while true do
        Borde1.Color = colors[index]
        Borde2.Color = colors[index]
        index = index + 1
        if index > #colors then
            index = 1
        end
        task.wait(1) 
    end
end)
--Fin color Borde/\

--incio de color txt\/
local textProperties = {
    {text = "Farm", position = UDim2.new(-0.155, 0, 0.115, 0), color = Color3.fromRGB(255, 0, 0)},
    {text = "Ozaru", position = UDim2.new(0.350, 0, 0.115, 0), color = Color3.fromRGB(0, 255, 0)},
    {text = "Atck", position = UDim2.new(-0.160, 0, 0.195, 0), color = Color3.fromRGB(0, 255, 255)},   
    {text = "Puch", position = UDim2.new(0.360, 0, 0.195, 0), color = Color3.fromRGB(0, 0, 255)},
    {text = "Reb", position = UDim2.new(-0.160, 0, 0.270, 0), color = Color3.fromRGB(255, 255, 0)},
    {text = "Main", position = UDim2.new(0.350, 0, 0.270, 0), color = Color3.fromRGB(255, 0, 255)},
    {text = "Fly", position = UDim2.new(-0.04, 0, 0.320, 0), color = Color3.fromRGB(300, 100, 12)},
    {text = "Duck", position = UDim2.new(-0.160, 0, 0.420, 0), color = Color3.fromRGB(300, 100, 12)},
    {text = "Ɓºrª", position = UDim2.new(0.350, 0, 0.420, 0), color = Color3.fromRGB(300, 100, 12)},    
    {text = "Graf", position = UDim2.new(-0.160, 0, 0.495, 0), color = Color3.fromRGB(300, 100, 12)},
    {text = "Brillo", position = UDim2.new(0.473, 0, 0.320, 0), color = Color3.fromRGB(300, 100, 12)},
}

for _, props in pairs(textProperties) do
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Parent = Barra1
    TextLabel.Size = UDim2.new(0, 200, 0, 36)
    TextLabel.Position = props.position
    TextLabel.BackgroundTransparency = 1
    TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.TextStrokeColor3 = props.color
    TextLabel.TextStrokeTransparency = 0
    TextLabel.Text = props.text
    TextLabel.TextScaled = true
end
 --Fin del color txt/\
 
--Codeg Para Button Minimizar = Maximizar
local currentPanel = 1
local isMinimized = true  
Siguiente.MouseButton1Click:Connect(function()
    if not isMinimized then
        if currentPanel == 1 then
            Cuadro1.Visible = false
            currentPanel = 2
            Cuadro2.Visible = true
        else
            Cuadro2.Visible = false
            currentPanel = 1
            Cuadro1.Visible = true
        end
    end
end)

Mix.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        Cuadro1.Visible = false
        Cuadro2.Visible = false
        Mix.Text = "+"
    else
        if currentPanel == 1 then
            Cuadro1.Visible = true
        else
            Cuadro2.Visible = true
        end
        Mix.Text = "×"
    end
end)

--Aki ya es del interrutor <: \/
local function SaveSwitchState(isActive, switchName)
    writefile(switchName.."_SwitchState.json", game:GetService("HttpService"):JSONEncode({SwitchOn = isActive, LastModified = os.time()}))
end

local function LoadSwitchState(switchName)
    return isfile(switchName.."_SwitchState.json") and game:GetService("HttpService"):JSONDecode(readfile(switchName.."_SwitchState.json")).SwitchOn or false
end
local function createSwitch(parent, position, switchName, initialState)
    local switchButton = Instance.new("TextButton")
    switchButton.Parent = parent
    switchButton.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    switchButton.BorderSizePixel = 0
    switchButton.Position = position
    switchButton.Size = UDim2.new(0, 84, 0, 30)
    switchButton.Text = ""
    Instance.new("UICorner", switchButton).CornerRadius = UDim.new(0.4, 0)

    local switchBall = Instance.new("Frame")
    switchBall.Parent = switchButton
    switchBall.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    switchBall.Size = UDim2.new(0, 30, 0, 30)
    switchBall.Position = UDim2.new(0, 5, 0.5, -15)
    switchBall.BorderSizePixel = 0
    Instance.new("UICorner", switchBall).CornerRadius = UDim.new(0.5, 0)

    local isActive = initialState

    switchBall.Position, switchBall.BackgroundColor3 = 
        isActive and UDim2.new(1, -35, 0.5, -15) or UDim2.new(0, 5, 0.5, -15), 
        isActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)

    switchButton.MouseButton1Click:Connect(function()
        isActive = not isActive
        switchBall.Position, switchBall.BackgroundColor3 = 
            isActive and UDim2.new(1, -35, 0.5, -15) or UDim2.new(0, 5, 0.5, -15), 
            isActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)        
        SaveSwitchState(isActive, switchName)
    end)

    return function() return isActive end
end

local getIsActive1 = createSwitch(Barra1, UDim2.new(0.2, 0, 0.120, 0), "Switch1", LoadSwitchState("Switch1"))
local getIsActive2 = createSwitch(Barra1, UDim2.new(0.735, 0, 0.115, 0), "Switch2", LoadSwitchState("Switch2"))
local getIsActive3 = createSwitch(Barra1, UDim2.new(0.2, 0, 0.2, 0), "Switch3", LoadSwitchState("Switch3"))
local getIsActive4 = createSwitch(Barra1, UDim2.new(0.735, 0, 0.195, 0), "Switch4", LoadSwitchState("Switch4"))
local getIsActive5 = createSwitch(Barra1, UDim2.new(0.2, 0, 0.275, 0), "Switch5", LoadSwitchState("Switch5"))
local getIsActive6 = createSwitch(Barra1, UDim2.new(0.740, 0, 0.275, 0), "Switch6", LoadSwitchState("Switch6"))
local getIsActive7 = createSwitch(Barra1, UDim2.new(0.2, 0, 0.420, 0), "Switch7", LoadSwitchState("Switch7"))
local getIsActive8 = createSwitch(Barra1, UDim2.new(0.740, 0, 0.420, 0), "Switch8", LoadSwitchState("Switch8"))
local getIsActive9 = createSwitch(Barra1, UDim2.new(0.2, 0, 0.495, 0), "Switch9", LoadSwitchState("Switch9"))
--Casi fin del interrutor /\


task.spawn(function()
    pcall(function()
    
local sts = {"Strength", "Speed", "Defense", "Energy"}
function yo()
    local l = math.huge
    for _, v in pairs(sts) do
        local stat = data:FindFirstChild(v)
        if not stat then return end
        local st = stat.Value
        if st < l then
            l = st
        end
    end
    return l
end

local lplr = game.Players.LocalPlayer
local data = game.ReplicatedStorage:WaitForChild("Datas"):WaitForChild(lplr.UserId)

local boss = {
    {"Vekuta (SSJBUI)", "Wukong Rose", 3.5e9},
    {"Wukong (LBSSJ4)", "Vegetable (LBSSJ4)", 2.5e9},
    {"Vis (20%)", "Vegetable (LBSSJ4)", 1.5e9},
    {"Vills (50%)", "Vis (20%)", 6e8},
    {"Vegetable (GoD in-training)", "Wukong (Omen)", 1e8},
    {"SSJG Kakata", "Broccoli", 8e7},
    {"Broccoli", "SSJB Wukong", 3.4e7},
    {"SSJB Wukong", "Kai-fist Master", 2e7},
    {"Perfect Atom", "SSJ2 Wukong", 5e6},
    {"Super Vegetable", "Chilly", 3.5e6},
    {"Top X Fighter", "Super Vegetable", 8.5e5},
    {"Mapa", "Radish", 2e5},
    {"Klirin", "Kid Nohag", 0},
}

task.spawn(function()
    while true do
        pcall(function()
            if data.Rebirth.Value >= 2000 then
                boss[13] = {"Mapa", "Radish", 0}
            else
                boss[13] = {"Klirin", "Kid Nohag", 0}
            end
            local checkValue = math.min(data.Strength.Value, data.Energy.Value, data.Defense.Value, data.Speed.Value)
            for i, mission in ipairs(boss) do
                if checkValue >= mission[3] and data.Quest.Value == "" then
                    local currentBoss = game.Workspace.Living:FindFirstChild(mission[1])
                    local nextNpc = game.Workspace.Others.NPCs:FindFirstChild(mission[2])
                    if currentBoss and currentBoss:FindFirstChild("Humanoid") and currentBoss.Humanoid.Health <= 0 then
                        if nextNpc and nextNpc:FindFirstChild("HumanoidRootPart") then
                            lplr.Character.HumanoidRootPart.CFrame = nextNpc.HumanoidRootPart.CFrame
                            game:GetService("ReplicatedStorage").Package.Events.Qaction:InvokeServer(nextNpc)
                            if data.Quest.Value == "" then return end
                        end
                    elseif game.Workspace.Others.NPCs:FindFirstChild(mission[1]) then
                        local npc = game.Workspace.Others.NPCs[mission[1]]
                        lplr.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame
                        game:GetService("ReplicatedStorage").Package.Events.Qaction:InvokeServer(npc)
                        if getIsActive1() and data.Quest.Value == "" then return end
                    end
                    break
                end
            end
        end)
        wait()
    end
end)


local boss = {"SSJG Kakata", "Broccoli", 1e8}
task.spawn(function()
    while true do
        pcall(function()
        if getIsActive1() then
            if math.min(data.Strength.Value, data.Energy.Value, data.Defense.Value, data.Speed.Value) >= boss[3] and data.Quest.Value == "" then
                local currentBoss = game.Workspace.Living:FindFirstChild(boss[1])
                local target = currentBoss and currentBoss.Humanoid.Health <= 0 and game.Workspace.Others.NPCs:FindFirstChild(boss[2]) or game.Workspace.Others.NPCs:FindFirstChild(boss[1])
                if target then
                    lplr.Character.HumanoidRootPart.CFrame = target.HumanoidRootPart.CFrame  * CFrame.new(0, 0, 4)
                    game.ReplicatedStorage.Package.Events.Qaction:InvokeServer(target)
                    end
                end
            end
        end)
        wait()
    end
end)


--Ciclo Para Auto = Tp Boss A Cualquier Tipo De Boss
task.spawn(function()
    while true do
        pcall(function()
            local questValue = data.Quest.Value
            if getIsActive1() or getIsActive2() and questValue ~= "" then
                local boss = game.Workspace.Living:FindFirstChild(questValue)
                if boss and boss:FindFirstChild("HumanoidRootPart") then
                    if boss:FindFirstChild("Humanoid") and boss.Humanoid.Health <= 0 then
                        wait(1)
                    end
                    lplr.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame * CFrame.new(0, 0, 6)
                end
            end
        end)
        task.wait()
    end
end)


task.spawn(function()
    while true do
        pcall(function()
            if data.Quest.Value ~= "" then
                wait(2)
                local npcFolder = game:GetService("Workspace").Others.NPCs
                for _, npc in ipairs(npcFolder:GetChildren()) do
                    if npc:FindFirstChild("HumanoidRootPart") then
                        local distance = (npc.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).Magnitude
                        if distance <= 500 and npc.Name ~= "Halloween NPC" then
                            data.Quest.Value = ""
                            break
                        end
                    end
                end
            end
        end)
        wait()
    end
end)

--Ciclo Para Auto = Quest y Tp Con Tiempo
task.spawn(function()
    while true do
        pcall(function()
            if getIsActive2() then
                local currentGameHour = math.floor(game.Lighting.ClockTime)
                if currentGameHour >= 20 or currentGameHour < 6 then
                    if data.Quest.Value == "" then
                        lplr.Character.HumanoidRootPart.CFrame = game.Workspace.Others.NPCs["Kid Nohag"].HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                        game.ReplicatedStorage.Package.Events.Qaction:InvokeServer(workspace.Others.NPCs["Kid Nohag"])
                    end
                else
                    if data.Quest.Value == "" then
                        lplr.Character.HumanoidRootPart.CFrame = game.Workspace.Others.NPCs["SSJG Kakata"].HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                        game.ReplicatedStorage.Package.Events.Qaction:InvokeServer(workspace.Others.NPCs["SSJG Kakata"])
                    end
                end
            end
        end)
        wait(0.1)
    end
end)

--Ciclo Para Auto = Tp Boss y Halloween_Farm
task.spawn(function()
    while true do
        pcall(function()
        if yo() >=70000000 and game.PlaceId ~= 5151400895 then
            if getIsActive1() or getIsActive2() and  data.Quest.Value ~= "" then
                local npc = game.Workspace.Living:FindFirstChild(data.Quest.Value)
                if npc and npc.Humanoid.Health <= 0 then
                    lplr.Character.HumanoidRootPart.CFrame = CFrame.new(-35233, 18, -28942)
                    local boss = game.Workspace.Living:FindFirstChild("Halloween NPC")
                    if boss then
                        lplr.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame * CFrame.new(0, 0, 8)
                        end
                    end
                end
            end
        end)
        task.wait()
    end
end)

task.spawn(function()
    while true do
        pcall(function()
        if getIsActive4() then
            keypress(Enum.KeyCode.R)
                  game:GetService("ReplicatedStorage").Package.Events.block:InvokeServer(true)
            end
        end)
        wait(1)
    end
end)


--Ciclo Para Auto = Tp Boss y Ozaru
spawn(function()
    while true do
        pcall(function()
            if getIsActive2() and data.Quest.Value == "Kid Nohag" then
                local currentGameHour = math.floor(game.Lighting.ClockTime)
                if currentGameHour >= 20 or currentGameHour < 6 then
                    local boss = game.Workspace.Living:FindFirstChild("Oozaru")
                    if boss and boss:FindFirstChild("HumanoidRootPart") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                    end
                end
            end
        end)
        task.wait()
    end
end)


spawn(function()
    while true do
        if getIsActive9() then
            pcall(function()
                for _, v in next, game:GetDescendants() do
                    if v:IsA("Part") or v:IsA("BasePart") then v.Material = Enum.Material.SmoothPlastic end
                    if v:IsA("ParticleEmitter") then v.Enabled = false end
                    if v:IsA("Decal") then v.Texture = "" end
                    if v:IsA("Sky") then v.Parent = nil end
                end
            end)
            break
        end
        wait(.1)
    end
end)

--Ciclo Para = Traformation.Value           
task.spawn(function()
    while true do
        pcall(function()
            game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer("Divine Rose Prominence")
        end)
        wait()
        if game.Workspace.Living[lplr.Name].Status.SelectedTransformation.Value == "None" then
            game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer("Astral Instinct")
        elseif game.Workspace.Living[lplr.Name].Status.SelectedTransformation.Value == "Divine Rose Prominence" then
        end
       wait()
    end
end)
 


task.spawn(function()
    while true do
        pcall(function()
            if game.Workspace.Living[lplr.Name].Status.Transformation.Value == "None" then
                game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
            end
        end)
        wait()
    end
end)



--Ciclo Para Auto = Tierra 
task.spawn(function()
    while true do
        pcall(function()
            if getIsActive1() and game.PlaceId == 5151400895 and data.Strength.Value <= 200000000 then
                game:GetService("ReplicatedStorage").Package.Events.TP:InvokeServer("Earth")
                task.wait(4)
            end
        end)
        wait(1)
    end
end)

--Ciclo Para Auto = Bills 
task.spawn(function()
    while true do
        if getIsActive1() and  game.PlaceId ~= 5151400895 and data.Strength.Value >= 200000000 then
            game:GetService("ReplicatedStorage").Package.Events.TP:InvokeServer("Vills Planet")
            task.wait(4)
        end
        wait(1)
    end
end)


--Ciclos de  Trafomaciones
task.spawn(function()
    while true do
        pcall(function()
            if yo()  >= 95000 and yo()  < 8e6 and lplr.Status.Transformation.Value == "None" then
                game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer("SSJ3")
                game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
            elseif yo()  >= 8e6 and lplr.Status.Transformation.Value == "SSJ3" then
                game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
            end
        end)
        wait()
    end
end)


task.spawn(function()
    while true do
        pcall(function()
            if yo()  >= 8e6 and yo()  < 120e6 and lplr.Status.Transformation.Value == "None" then
                game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer("Godly SSJ2")
                game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
            elseif yo()  >= 120e6 and lplr.Status.Transformation.Value == "Godly SSJ2" then
                game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
            end
        end)
        wait()
    end
end)
local moves = {"Super Dragon Fist", "God Slicer", "Spirit Barrage", "Mach Kick", "Wolf Fang Fist", 
               "High Power Rush", "Meteor Strike", "Meteor Charge", "Spirit Breaking Cannon", 
               "Vital Strike", "Flash Kick", "Vanish Strike", "Uppercut", "Sledgehammer", "Rock Impact"}
--Ciclo Para Auto = Atakes
task.spawn(function()
    while true do
        pcall(function()
        local boss = game.Workspace.Living:FindFirstChild(data.Quest.Value)           
            local dat = (game.PlaceId == 5151400895) and game.Workspace.Living:FindFirstChild(lplr.Name) or lplr
            if boss and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 and yo() >= 2e5 and yo() <= 20000000000 and data.Quest.Value ~= "" and getIsActive3() then
                if dat:FindFirstChild("Status") then
                    for _, move in ipairs(moves) do
                        if not dat.Status:FindFirstChild(move) then
                            task.spawn(function()
                                game:GetService("ReplicatedStorage").Package.Events.mel:InvokeServer(move, "Blacknwhite27")
                                game.ReplicatedStorage.Package.Events.voleys:InvokeServer("Energy Volley", {FaceMouse = false, MouseHit = CFrame.new()}, "Blacknwhite27")                                    
                            end)
                        end
                    end
                end
            end
        end)
        wait()
    end
end)

local mel = {"Super Dragon Fist", "God Slicer", "Spirit Barrage", "Mach Kick", "Wolf Fang Fist", 
               "High Power Rush"}
task.spawn(function()
    while true do
        pcall(function()
        local boss = game.Workspace.Living:FindFirstChild(data.Quest.Value)           
            if boss and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 and yo() >= 200e8 and game.PlaceId == 5151400895 then
                for i = 1, #moves, 3 do
                    task.spawn(function()
                        for j = i, math.min(i + 2, #mel) do
                            game:GetService("ReplicatedStorage").Package.Events.mel:InvokeServer(mel[j], "Blacknwhite27")
                        end
                    end)
                end
            end
        end)
        task.wait()
    end
end)


--Ciclo para Auto = Puños
task.spawn(function()
    while true do
        pcall(function()
            if data.Quest.Value ~= "" and  getIsActive4() then
                game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27", 1)
                game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27", 2)                    
            end
        end)
        wait()
    end
end)

--Ciclo para ancti afk
task.spawn(function()
    while true do
        pcall(function()
            game:GetService('Players').LocalPlayer.Idled:Connect(function()
                local bb = game:GetService('VirtualUser')
                bb:CaptureController()
                bb:ClickButton2(Vector2.new())
            end)
        end)
        wait(1)
    end
end)

spawn(function()
    while true do
        pcall(function()
            local workspace = game:GetService("Workspace")
            local replicatedStorage = game:GetService("ReplicatedStorage")
            local others = workspace:FindFirstChild("Others")

            if others then
                local bossMaps = others:FindFirstChild("BossMaps") or replicatedStorage:FindFirstChild("BossMaps")
                if bossMaps then
                    if getIsActive8() then
                        bossMaps.Parent = replicatedStorage
                    else
                        bossMaps.Parent = others
                    end
                end
            end
        end)
        wait()
    end
end)

local p = game.Players.LocalPlayer

spawn(function()
    while true do
        pcall(function()
            if getIsActive7() then
                local accessories = {}            
                for _, v in pairs(p.Character:GetChildren()) do 
                    if v:IsA("Hat") or v:IsA("Accessory") or v.Name:lower():find("hair") then
                        v.Parent = game.ReplicatedStorage
                        table.insert(accessories, v)
                    elseif v:IsA("BasePart") then
                        v.Transparency = 1
                    end
                end             
                local duck = Instance.new("SpecialMesh", p.Character.HumanoidRootPart)
                duck.MeshId = "http://www.roblox.com/asset/?id=9419831"
                duck.TextureId = "http://www.roblox.com/asset/?id=9419827"
                duck.Scale = Vector3.new(5, 5, 5)
                p.Character.HumanoidRootPart.Transparency = 0
            end
        end)
        wait(.1)
    end
end)

--Ciclo Para el Ozaru tp tierra
task.spawn(function()
    while true do
        pcall(function()
            if getIsActive2() then
                local currentGameHour = math.floor(game.Lighting.ClockTime)
                local currentGameMinute = math.floor((game.Lighting.ClockTime % 1) * 60)
                if currentGameHour == 6 and currentGameMinute >= 0 and currentGameMinute < 20 then
                    game.ReplicatedStorage.Package.Events.TP:InvokeServer("Earth")
                end
            end
        end)
        task.wait(0.3)
    end
end)

--Ciclo para Auto = Carga en bills
task.spawn(function()
    while true do
        pcall(function()
            local Work = game.Workspace.Living[lplr.Name]
            if Work and Work.Status.Transformation.Value ~= "None" then
                if getIsActive4() then
                    game:GetService("ReplicatedStorage").Package.Events.cha:InvokeServer("Blacknwhite27")
                end
            end
        end)
        wait()
    end
end)

--Ciclo de Auto carga en  tierra
task.spawn(function()
    while true do
        pcall(function()
            if getIsActive4() then
         game:GetService("ReplicatedStorage").Package.Events.cha:InvokeServer("Blacknwhite27")            
            end
        end)
        task.wait()
    end
end)

--Ciclo para Auto = Rebirth
task.spawn(function()
    while true do
        pcall(function()
            if getIsActive5() then
                game:GetService("ReplicatedStorage").Package.Events.reb:InvokeServer()
            end
        end)
        wait()
    end
end)

spawn(function()
    if data:FindFirstChild("Allignment") then
        local alignment = data.Allignment.Value
        if alignment == "Evil" then
            ligaLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
            ligaLabel.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)
            ligaLabel.TextStrokeTransparency = 0
        elseif alignment == "Good" then
            ligaLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
            ligaLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 250)
            ligaLabel.TextStrokeTransparency = 0
        end
        ligaLabel.Text = alignment
    end
end)


task.spawn(function()
    while true do
        pcall(function()
            local questValue = data.Quest.Value or ""
            local Trf = (game.PlaceId == 5151400895 and game.Workspace.Living[lplr.Name].Status.Transformation.Value) or lplr.Status.Transformation.Value
            questLabel.Text = "Mission: " .. questValue .. " | Form: " .. Trf
        end)
        wait()
    end
end)

--Ciclo Para Auto = Main y Start
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

spawn(function()
    if lplr.PlayerGui:FindFirstChild("Start") then
        ReplicatedStorage.Package.Events.Start:InvokeServer()
        if Workspace.Others:FindFirstChild("Title") then
            Workspace.Others.Title:Destroy()
        end
        local cam = Workspace.CurrentCamera
        cam.CameraType = Enum.CameraType.Custom
        cam.CameraSubject = lplr.Character.Humanoid
        _G.Ready = true
        game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, true)
        lplr.PlayerGui.Main.Enabled = true
        if lplr.PlayerGui:FindFirstChild("Start") then
            lplr.PlayerGui.Start:Destroy()
        end
        lplr.PlayerGui.Main.bruh.Enabled = false
        lplr.PlayerGui.Main.bruh.Enabled = true
    end
end)
            


spawn(function()
    while true do
        pcall(function()
            local playerCount = #game.Players:GetPlayers()
            if playerCount > 1 then
                if game.PlaceId == 5151400895 then
                    game.ReplicatedStorage.Package.Events.TP:InvokeServer("Vills Planet")
                else
                    game.ReplicatedStorage.Package.Events.TP:InvokeServer("Earth")
                end
            end
        end)
        wait(10)
    end
end)



spawn(function()
    while true do
        pcall(function()
           if getIsActive6() then
            local MainFrame = lplr.PlayerGui.Main.MainFrame
            local StatsFrame = MainFrame.Frames.Stats
            local ZeniLabel = MainFrame.Indicator:FindFirstChild("Zeni")
            local Bars = MainFrame:WaitForChild("Bars")

            local function format_number(num)
                local suffixes = {"", "K", "M", "B", "T", "QT"}
                local i = 1
                while math.abs(num) >= 1000 do 
                    num, i = num / 1000, i + 1 
                end
                return string.format("%.1f%s", num, suffixes[i])
            end

            local stats = {"Strength", "Speed", "Defense", "Energy"}
            for _, stat in ipairs(stats) do
                local statLabel = StatsFrame:FindFirstChild(stat)
                if statLabel then
                    statLabel.Text = stat .. ": " .. format_number(data[stat].Value)
                end
            end

            if ZeniLabel then 
                ZeniLabel.Text = format_number(data.Zeni.Value) .. " Zeni"
            end

            Bars.Health.TextLabel.Text = "SALUD: " .. format_number(lplr.Character.Humanoid.Health) .. " / " .. format_number(lplr.Character.Humanoid.MaxHealth)
            Bars.Energy.TextLabel.Text = "ENERGÍA: " .. format_number(lplr.Character.Stats.Ki.Value) .. " / " .. format_number(lplr.Character.Stats.Ki.MaxValue)
            end
        end)
        task.wait()
    end
end)


local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))

local activeBar = nil
local speed = 0
local flying = true

local function SaveBarState(barValue, barName)
    writefile(barName.."_Valor.json", game:GetService("HttpService"):JSONEncode({Value = barValue, LastModified = os.time()}))
end

local function LoadBarState(barName)
    local fileName = barName.."_Valor.json"
    if isfile(fileName) then
        local fileContent = readfile(fileName)
        local data = game:GetService("HttpService"):JSONDecode(fileContent)
        return data.Value
    end
    return 0
end

local function create(parent, xPos, labelText, barColor, position, maxValue, updateFunc, barName)
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(0.41, 0, 0.020, 0)
    frame.Position = UDim2.new(xPos, 0, position, 0)
    frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)

    local bar = Instance.new("Frame", frame)
    bar.Size = UDim2.new(0, 0, 1, 0)
    bar.BackgroundColor3 = barColor
    local barCorner = Instance.new("UICorner", bar)
    barCorner.CornerRadius = UDim.new(0, 10)

    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.new(1, 1, 1)
    label.TextScaled = true
    label.Text = labelText

    local frameCorner = Instance.new("UICorner", frame)
    frameCorner.CornerRadius = UDim.new(0, 10)

    local value = LoadBarState(barName)

    bar.Size = UDim2.new(value / maxValue, 0, 1, 0)
    label.Text = tostring(value)

    local function updateBar(value)
        bar.Size = UDim2.new(value / maxValue, 0, 1, 0)
        label.Text = tostring(value)
        SaveBarState(value, barName)
        updateFunc(value)
    end

    local value = 0

    frame.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then
            if activeBar then
                return
            end

            activeBar = bar

            local move
            move = game:GetService("UserInputService").InputChanged:Connect(function(m)
                if m.UserInputType == Enum.UserInputType.MouseMovement or m.UserInputType == Enum.UserInputType.Touch then
                    local x = math.clamp((m.Position.X - frame.AbsolutePosition.X) / frame.AbsoluteSize.X, 0, 1)
                    value = math.floor(x * maxValue)
                    updateBar(value)
                end
            end)

            i.Changed:Connect(function()
                if i.UserInputState == Enum.UserInputState.End then
                    move:Disconnect()
                    activeBar = nil
                end
            end)
        end
    end)
end

local function updateFlySpeed(value)
    speed = value
end

local function updateAmbient(value)
    game:GetService("Lighting").Ambient = Color3.fromRGB(value, value, value)
end

create(Barra1, 0, "Vuelo", Color3.new(1, 0, 0), 0.37, 100, updateFlySpeed, "Vuelo")
create(Barra1, 0.513, "Ambient", Color3.new(0, 1, 0), 0.37, 700, updateAmbient, "Ambient")

spawn(function()
    while flying do
        pcall(function()
            local hum = player.Character:WaitForChild("Humanoid")
            if hum.MoveDirection.Magnitude > 0 then
                player.Character:TranslateBy(hum.MoveDirection * speed)
            elseif hum.MoveDirection.Y < 0 then
                speed = speed + 0.1
            end
        end)
        wait()
    end
end)

--fin de todo \/
       end)    
    wait(1)
end)


 
