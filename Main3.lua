local ArchivoClaveGuardada = "ClaveGuardada.json"
local ArchivoHistorial = "HistorialClaves.json"
local HttpService = game:GetService("HttpService")

local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "Key_7"
KeyGui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0.3, 0, 0.25, 0)
Frame.Position = UDim2.new(0.35, 0, 0.35, 0)
Frame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
Frame.BorderSizePixel = 0
Frame.BackgroundTransparency = 0.1
Frame.Parent = KeyGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0.1, 0)
UICorner.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0.3, 0)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.Text = "Introduce tu clave"
Title.Parent = Frame

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.8, 0, 0.25, 0)
TextBox.Position = UDim2.new(0.1, 0, 0.4, 0)
TextBox.PlaceholderText = "Introduce la clave"
TextBox.Font = Enum.Font.Gotham
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TextBox.BorderSizePixel = 0
TextBox.TextScaled = true
TextBox.ClearTextOnFocus = false
TextBox.Parent = Frame

local UICornerTextBox = Instance.new("UICorner")
UICornerTextBox.CornerRadius = UDim.new(0.1, 0)
UICornerTextBox.Parent = TextBox

local BotonInvitacion = Instance.new("TextButton")
BotonInvitacion.Size = UDim2.new(0.2, 0, 0.2, 0)
BotonInvitacion.Position = UDim2.new(0.8, 0, 0.8, 0)
BotonInvitacion.Text = "ðŸ«‚"
BotonInvitacion.Font = Enum.Font.GothamBold
BotonInvitacion.TextScaled = true
BotonInvitacion.TextColor3 = Color3.fromRGB(255, 255, 255)
BotonInvitacion.BackgroundTransparency = 1
BotonInvitacion.BorderSizePixel = 0
BotonInvitacion.Parent = Frame

local BotonUrl = Instance.new("TextButton")
BotonUrl.Size = UDim2.new(0.6, 0, 0.25, 0)
BotonUrl.Position = UDim2.new(0.2, 0, 0.75, 0)
BotonUrl.Text = "Copiar Url Key"
BotonUrl.Font = Enum.Font.GothamBold
BotonUrl.TextScaled = true
BotonUrl.TextColor3 = Color3.fromRGB(255, 255, 255)
BotonUrl.BackgroundColor3 = Color3.fromRGB(0, 122, 204)
BotonUrl.BorderSizePixel = 0
BotonUrl.Parent = Frame

local claveValida = false

local function guardarClaveGuardada(clave)
    writefile(ArchivoClaveGuardada, HttpService:JSONEncode({clave = clave, fecha = os.time()}))
end

local function actualizarHistorial(clave)
    local historial = {}
    if isfile(ArchivoHistorial) then
        historial = HttpService:JSONDecode(readfile(ArchivoHistorial))
    end
    table.insert(historial, clave)
    if #historial > 5 then
        table.remove(historial, 1)
    end
    writefile(ArchivoHistorial, HttpService:JSONEncode(historial))
end

local function claveEsValida()
    if isfile(ArchivoClaveGuardada) then
        local datos = HttpService:JSONDecode(readfile(ArchivoClaveGuardada))
        if os.time() - datos.fecha < (24 * 60 * 60) then
            return true
        end
    end
    return false
end

local function resetearClave()
    if isfile(ArchivoClaveGuardada) then
        delfile(ArchivoClaveGuardada)
    end
end

local function lopoi()
local Fernando = game.CoreGui:FindFirstChild("Fernando")
if Fernando then
    return  
end

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
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)
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
    {text = "Farm", position = UDim2.new(-0.150, 0, 0, 0), color = Color3.fromRGB(255, 0, 0)},
    {text = "Mel", position = UDim2.new(-0.140, 0, 0.06), color = Color3.fromRGB(0, 0, 255)},
    {text = "Reb", position = UDim2.new(-0.130, 0, 0.115, 0), color = Color3.fromRGB(255, 255, 0)},
    {text = "Puch", position = UDim2.new(-0.180, 0, 0.176, 0), color = Color3.fromRGB(0, 255, 255)},
    {text = "Main", position = UDim2.new(-0.160, 0, 0.236, 0), color = Color3.fromRGB(255, 0, 255)},
}

for _, props in pairs(textProperties) do
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Parent = Barra1
    TextLabel.Size = UDim2.new(0, 200, 0, 36)
    TextLabel.Position = props.position
    TextLabel.BackgroundTransparency = 1
    TextLabel.TextColor3 = props.color
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
        Mix.Text = "-"
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

local getIsActive1 = createSwitch(Barra1, UDim2.new(0.1, 50, 0, 1), "Switch1", LoadSwitchState("Switch1"))
local getIsActive2 = createSwitch(Barra1, UDim2.new(0.1, 75, 0, 52, 0), "Switch2", LoadSwitchState("Switch2"))
local getIsActive3 = createSwitch(Barra1, UDim2.new(0.1, 45, 0.120), "Switch3", LoadSwitchState("Switch3"))
local getIsActive4 = createSwitch(Barra1, UDim2.new(0.1, 25, 0.180, 0), "Switch4", LoadSwitchState("Switch4"))
local getIsActive5 = createSwitch(Barra1, UDim2.new(0.1, 45, 0.240, 0), "Switch5", LoadSwitchState("Switch5"))

--Casi fin del interrutor /\


task.spawn(function()
    pcall(function()
local lplr = game.Players.LocalPlayer
local data = game.ReplicatedStorage:WaitForChild("Datas"):WaitForChild(lplr.UserId)
local npcList = {
    {"Vekuta (SSJBUI)", 5.375e9},
    {"Wukong Rose", 4.25e9},
    {"Vekuta (LBSSJ4)", 3.35e9},
    {"Wukong (LBSSJ4)", 2.35e9},
    {"Vegetable (LBSSJ4)", 1.65e9},
    {"Vis (20%)", 1.00e9},
    {"Vills (50%)", 650e6},
    {"Wukong (Omen)", 350e6},
    {"Vegetable (GoD in-training)", 150e6},
    {"SSJG Kakata", 150e6},
    {"Broccoli", 50e6},
    {"SSJB Wukong", 8e6},
    {"Kai-fist Master", 4.825e6},
    {"SSJ2 Wukong", 3.05e6},
    {"Perfect Atom", 1.075e6},
    {"Chilly", 950000},
    {"Super Vegetable", 428000},
    {"Mapa", 95000},
    {"Radish", 65000},
    {"Kid Nohag", 7000},
    {"Klirin", 0}
}

task.spawn(function()
    while true do
        pcall(function()
            if getIsActive1() and data.Quest.Value == "" then
                local checkValue = math.min(data.Strength.Value, data.Energy.Value, data.Defense.Value, data.Speed.Value)
                for _, npc in ipairs(npcList) do
                    local npcName = npc[1]
                    local targetNPC = game.Workspace.Others.NPCs:FindFirstChild(npcName)
                    if targetNPC and checkValue >= npc[2] then
                        lplr.Character:SetPrimaryPartCFrame(targetNPC.PrimaryPart.CFrame)
                        game:GetService("ReplicatedStorage").Package.Events.Qaction:InvokeServer(targetNPC)
                        break
                    end
                end
            end
        end)
        task.wait()
    end
end)


--Ciclo Para Auto = Tp Boss A Cualquier Tipo De Boss
task.spawn(function()
    while true do
        pcall(function()
            local questValue = data.Quest.Value
            if getIsActive1() and questValue ~= "" then
                local boss = game.Workspace.Living:FindFirstChild(questValue)
                if boss and boss:FindFirstChild("HumanoidRootPart") then
                    if boss:FindFirstChild("Humanoid") and boss.Humanoid.Health <= 0 then
                        wait(1)
                    end
                    lplr.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame * CFrame.new(0, 0, 4.5)
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
                wait(1)
                local npcFolder = game:GetService("Workspace").Others.NPCs
                for _, npc in ipairs(npcFolder:GetChildren()) do
                    if npc:FindFirstChild("HumanoidRootPart") then
                        local distance = (npc.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).Magnitude
                        if distance <= 300 and npc.Name ~= "Halloween NPC" then
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


--Ciclo Para Auto = Tierra 
task.spawn(function()
    while true do
        pcall(function()
            if getIsActive1() and game.PlaceId == 5151400895 and data.Strength.Value <= 200000000 then
                game:GetService("ReplicatedStorage").Package.Events.TP:InvokeServer("Earth")
                wait(2)
            end
        end)
        task.wait()
    end
end)

--Ciclo Para Auto = Bills 
task.spawn(function()
    while true do
        if getIsActive1() and  game.PlaceId ~= 5151400895 and data.Strength.Value >= 200000000 then
            game:GetService("ReplicatedStorage").Package.Events.TP:InvokeServer("Vills Planet")
            wait(2)
        end
        wait()
    end
end)

--Ciclo Para Auto = Atakes
task.spawn(function()
    while true do
        pcall(function()
            local moves = { "Wolf Fang Fist", "Meteor Crash", "High Power Rush", "Mach Kick", "Spirit Barrage", 
               "God Slicer" }                          
            local dat = (game.PlaceId == 5151400895) and game.Workspace.Living:FindFirstChild(lplr.Name) or lplr
            local boss = game.Workspace.Living:FindFirstChild(data.Quest.Value)           
            if boss and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 and data.Quest.Value ~= "" and getIsActive2() then            
                if dat:FindFirstChild("Status") then
                    for _, move in ipairs(moves) do
                        if not dat.Status:FindFirstChild(move) then
                            task.spawn(function()
                            game.ReplicatedStorage.Package.Events.voleys:InvokeServer("Energy Volley", {FaceMouse = false, MouseHit = CFrame.new()}, "Blacknwhite27")       
                                game:GetService("ReplicatedStorage").Package.Events.mel:InvokeServer(move, "Blacknwhite27")
                            end)
                        end
                    end
                end
            end
        end)
        wait()
    end
end)

--Ciclo para Auto = PuÃƒÂ±os
task.spawn(function()
    while true do
        pcall(function()
        local boss = game.Workspace.Living:FindFirstChild(data.Quest.Value)           
             
            if data.Quest.Value ~= "" and boss and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 and  getIsActive4() then
                game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27", 1)
                game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27", 2)                    
            end
        end)
        wait()
    end
end)

--Ciclo para Auto = Carga
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



task.spawn(function()
    while true do
        pcall(function()
            if getIsActive4() and game.PlaceId ~= 5151400895 then
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
            if getIsActive3() then
                game:GetService("ReplicatedStorage").Package.Events.reb:InvokeServer()
            end
        end)
        wait(.5)
    end
end)

task.spawn(function()
    if data:FindFirstChild("Allignment") then
        local alignment = data.Allignment.Value
        if alignment == "Evil" then
            ligaLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
            ligaLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        elseif alignment == "Good" then
            ligaLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
            ligaLabel.TextColor3 = Color3.fromRGB(0, 0, 255)
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
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local lplr = Players.LocalPlayer

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
            
--Ciclo Para = Traformation.Value           
task.spawn(function()
    while true do
    pcall(function()
        local Forms = {
            'Divine Rose Prominence', 'Astral Instinct', 'Ultra Ego', 'SSJB4', 'True God of Creation', 
            'True God of Destruction', 'Super Broly', 'LSSJG', 'LSSJ4', 'SSJG4', 'LSSJ3', 'Mystic Kaioken', 
            'LSSJ Kaioken', 'SSJR3', 'SSJB3', 'God Of Destruction', 'God Of Creation', 'Jiren Ultra Instinct', 
            'Mastered Ultra Instinct', 'Godly SSJ2', 'Ultra Instinct Omen', 'Evil SSJ', 'Blue Evolution', 
            'Dark Rose', 'Kefla SSJ2', 'SSJ Berserker', 'True Rose', 'SSJB Kaioken', 'SSJ Rose', 
            'SSJ Blue', 'Corrupt SSJ', 'SSJ Rage', 'SSJG', 'SSJ4', 'Mystic', 'LSSJ', 'SSJ3', 
            'Spirit SSJ', 'SSJ2 Majin', 'SSJ2', 'SSJ Kaioken', 'SSJ', 'FSSJ', 'Kaioken'
        }

        local equipRemote = game:GetService("ReplicatedStorage").Package.Events.equipskill
        local transformRemote = game:GetService("ReplicatedStorage").Package.Events.ta
        local player = game.Players.LocalPlayer
        local workspacePlayer = game.Workspace.Living:FindFirstChild(player.Name)

        if getIsActive1() or getIsActive2() then
            if player.Character and player.Character.Humanoid and player.Character.Humanoid.Health > 0 and player.Character:FindFirstChild("HumanoidRootPart") then
                for _, transformation in ipairs(Forms) do
                    if equipRemote:InvokeServer(transformation) then
                        break
                    end
                end

                if workspacePlayer and workspacePlayer:FindFirstChild("Status") then
                    local status = workspacePlayer.Status
                    if status.SelectedTransformation.Value ~= status.Transformation.Value then
                        transformRemote:InvokeServer()
                    end
                elseif player.Status then
                    local status = player.Status
                    if status.SelectedTransformation.Value ~= status.Transformation.Value then
                        transformRemote:InvokeServer()
                    end
                end
            end
        end
        end)
        wait(3)
    end
end)


task.spawn(function()
    while true do
        pcall(function()
            game.ReplicatedStorage.Package.Events.equipskill:InvokeServer("Divine Rose Prominence")       
            if game.Workspace.Living[lplr.Name].Status.SelectedTransformation.Value == "None" then
                game.ReplicatedStorage.Package.Events.equipskill:InvokeServer("Astral Instinct")
            elseif game.Workspace.Living[lplr.Name].Status.SelectedTransformation.Value == "Divine Rose Prominence" then
            end
        end)
        task.wait()
    end
end)

task.spawn(function()
    while true do
        pcall(function()
            if game.Workspace.Living[lplr.Name].Status.Transformation.Value == "None" then
                game.ReplicatedStorage.Package.Events.ta:InvokeServer()
            end
        end)
        wait()
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
        wait(5)
    end
end)

local lplr = game.Players.LocalPlayer
local ldata = game.ReplicatedStorage:WaitForChild("Datas"):WaitForChild(lplr.UserId)

spawn(function()
    while true do
        pcall(function()
           if getIsActive5() then
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
                    statLabel.Text = stat .. ": " .. format_number(ldata[stat].Value)
                end
            end

            if ZeniLabel then 
                ZeniLabel.Text = format_number(ldata.Zeni.Value) .. " Zeni"
            end

            Bars.Health.TextLabel.Text = "SALUD: " .. format_number(lplr.Character.Humanoid.Health) .. " / " .. format_number(lplr.Character.Humanoid.MaxHealth)
            Bars.Energy.TextLabel.Text = "ENERGÃƒÂA: " .. format_number(lplr.Character.Stats.Ki.Value) .. " / " .. format_number(lplr.Character.Stats.Ki.MaxValue)
            end
        end)
        task.wait()
    end
end)

local TiempoValidez = 24 * 60 * 60
local ArchivoClave = "ClaveGuardada.json"
local HttpService = game:GetService("HttpService")

local TiempoGui = Instance.new("ScreenGui")

local TiempoLabel = Instance.new("TextLabel")
TiempoLabel.Size = UDim2.new(0.3, 0, 0.1, 0)
TiempoLabel.Position = UDim2.new(0.6, 0, -0.02, 0)
TiempoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TiempoLabel.TextScaled = true
TiempoLabel.BackgroundTransparency = 1
TiempoLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TiempoLabel.BorderSizePixel = 0
TiempoLabel.Text = "Cargando..."
TiempoLabel.Parent = Barra1

local function claveEsValida()
    if isfile(ArchivoClave) then
        local datosClave = HttpService:JSONDecode(readfile(ArchivoClave))
        local tiempoRestante = TiempoValidez - (os.time() - datosClave.fecha)
        return tiempoRestante > 0, tiempoRestante
    end
    return false, 0
end

local function mostrarTiempoRestante(tiempoRestante)
    TiempoGui.Enabled = true

    spawn(function()
        while tiempoRestante > 0 do
            tiempoRestante = tiempoRestante - 1
            TiempoLabel.Text = string.format("%02d:%02d:%02d", 
                math.floor(tiempoRestante / 3600), 
                math.floor((tiempoRestante % 3600) / 60), 
                tiempoRestante % 60)
            wait(1)
        end

        TiempoGui.Enabled = false
        print("El tiempo ha expirado. Debes ingresar una nueva clave.")
    end)
end

local esValida, tiempoRestante = claveEsValida()
if esValida then
    mostrarTiempoRestante(tiempoRestante)
else
    print("La clave ha expirado o no existe. Debes ingresar una nueva clave.")
end
--fin de todo \/
       end)    
    wait(.5)
end)


task.spawn(function()
    while true do
        pcall(function()
            if claveEsValida() then
                for _, obj in pairs(game.CoreGui:GetChildren()) do
                    if (obj.Name == "KeyGui" or obj.Name == "Fernando") and obj ~= game.CoreGui:FindFirstChild(obj.Name) then
                        obj:Destroy()
                    end
                end
            end
        end)
        wait()
    end
end)
--fin del Function ()
end

spawn(function()
    if claveEsValida() then
        lopoi()
    end
end)

spawn(function()
    if claveEsValida() then
        KeyGui.Enabled = false
    else
        KeyGui.Enabled = true
    end
end)

task.spawn(function()
    while true do
        pcall(function()
                for _, obj in pairs(game.CoreGui:GetChildren()) do
                    if (obj.Name == "KeyGui" or obj.Name == "Key_7") and obj ~= game.CoreGui:FindFirstChild(obj.Name) then
                        obj:Destroy()                    
                end
            end
        end)
        wait()
    end
end)

TextBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local texto = TextBox.Text
        local clave = texto:match("KEY:%[(.-)%]$")
        
        if clave and #clave >= 10 and #clave <= 17 then
            local historial = HttpService:JSONDecode(isfile(ArchivoHistorial) and readfile(ArchivoHistorial) or "[]")
            local claveExistente = false
            for _, v in pairs(historial) do
                if v == clave then
                    claveExistente = true
                    break
                end
            end

            if not claveExistente then
                guardarClaveGuardada(clave)
                actualizarHistorial(clave)
                KeyGui.Enabled = false
                lopoi()
            else
                TextBox.Text = "Clave ya usada"
                TextBox.TextColor3 = Color3.fromRGB(255, 0, 0)
                wait(1)
                TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextBox.Text = ""
            end
        else
            TextBox.Text = "Clave invalidad ðŸš«"
            TextBox.TextColor3 = Color3.fromRGB(255, 0, 0)
            wait(1)
            TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextBox.Text = ""
        end
    end
end)

BotonInvitacion.MouseButton1Click:Connect(function()
    setclipboard("https://discord.com/invite/3pjp7ufjWv")
end)

BotonUrl.MouseButton1Click:Connect(function()
    setclipboard("https://luatt11.github.io/Keysistema/")
end)

while true do
    wait()
    if not claveEsValida() then
        resetearClave()
        KeyGui.Enabled = true
    end
end
