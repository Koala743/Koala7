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
local fffg = game.CoreGui:FindFirstChild("fffg")
if fffg then
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
local Ex = game.ReplicatedStorage.Package.Events

Fernando.Name = "fffg"
Fernando.Parent = game.CoreGui

local function formatNumber(number)
    if number < 1000 then
        return tostring(number)
    end
    local suffixes = {"", "K", "M", "B", "T", "QD"}
    local suffix_index = 1
    while math.abs(number) >= 1000 and suffix_index < #suffixes do
        number = number / 1000.0
        suffix_index = suffix_index + 1
    end
    return string.format("%.2f%s", number, suffixes[suffix_index])
end

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


local userId = lplr.UserId
local thumbnailUrl = game.Players:GetUserThumbnailAsync(userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)

local imageLabel = Instance.new("ImageLabel")
imageLabel.Size = UDim2.new(0, 58, 0, 58)
imageLabel.Position = UDim2.new(0.07, 0, 0.04, 0)
imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
imageLabel.BackgroundTransparency = 1
imageLabel.Image = thumbnailUrl
imageLabel.Parent = Barra1

local masteryLabel = Instance.new("TextLabel")
masteryLabel.Size = UDim2.new(0, 100, 0, 10)
masteryLabel.Position = UDim2.new(0.120, 0, 0.009, 0)
masteryLabel.BackgroundTransparency = 1
masteryLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
masteryLabel.TextScaled = true
masteryLabel.Text = "Mastery"
masteryLabel.Parent = Barra1


local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(0, 100, 0, 23)
statusLabel.Position = UDim2.new(0.134, 0, 0.03, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
statusLabel.TextScaled = true
statusLabel.Font = Enum.Font.SourceSansBold
statusLabel.Text = "Stats..."
statusLabel.Parent = Barra1

local pingLabel = Instance.new("TextLabel")
pingLabel.Size = UDim2.new(0, 40, 0, 10)
pingLabel.Position = UDim2.new(0.380, 0, 0.009, 0)
pingLabel.BackgroundTransparency = 1 
pingLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
pingLabel.TextSize = 7
pingLabel.Parent = Barra1


local timeLabel = Instance.new("TextLabel")
timeLabel.Size = UDim2.new(0, 100, 0, 10)
timeLabel.Position = UDim2.new(0.490, 0, 0.009, 0)
timeLabel.BackgroundTransparency = 1
timeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
timeLabel.TextSize = 7
timeLabel.Parent = Barra1

local Fps = Instance.new("TextLabel")
Fps.Size = UDim2.new(0, 100, 0, 10)
Fps.Position = UDim2.new(0.663, 0, 0.009, 0)
Fps.TextSize = 7
Fps.BackgroundTransparency = 1
Fps.TextColor3 = Color3.fromRGB(255, 255, 255)
Fps.Parent = Barra1

local VS = Instance.new("TextLabel")
VS.Parent = Barra1
VS.Text = "V [0.5]"
VS.Size = UDim2.new(0, 100, 0, 10)
VS.Position = UDim2.new(0.783, 0, 0.009, 0)
VS.TextColor3 = Color3.fromRGB(255, 255, 255)
VS.BackgroundTransparency = 1
VS.TextSize = 7
VS.TextStrokeTransparency = 0.8

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
    {text = "Fly", position = UDim2.new(-0.04, 0, 0.320, 0), color = Color3.fromRGB(200, 300, 400)},
    {text = "Brillo", position = UDim2.new(0.473, 0, 0.320, 0), color = Color3.fromRGB(180, 200, 100)},
    {text = "Duck", position = UDim2.new(-0.160, 0, 0.420, 0), color = Color3.fromRGB(200, 100, 300)},
    {text = "Ɓºrª", position = UDim2.new(0.350, 0, 0.420, 0), color = Color3.fromRGB(200, 30, 70)},    
    {text = "Graf", position = UDim2.new(-0.160, 0, 0.495, 0), color = Color3.fromRGB(100, 200, 100)},   
    {text = "Plant", position = UDim2.new(0.350, 0, 0.495, 0), color = Color3.fromRGB(100, 200, 100)},
    {text = "Zom", position = UDim2.new(-0.160, 0, 0.570, 0), color = Color3.fromRGB(200, 380, 90)},   
    {text = "HA🎃", position = UDim2.new(0.360, 0, 0.570, 0), color = Color3.fromRGB(100, 200, 100)},  
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
    switchButton.BackgroundColor3 = Color3.fromRGB(190, 190, 190)
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
        isActive and Color3.fromRGB(0, 0, 200) or Color3.fromRGB(255, 0, 0)

    switchButton.MouseButton1Click:Connect(function()
        isActive = not isActive
        switchBall.Position, switchBall.BackgroundColor3 = 
            isActive and UDim2.new(1, -35, 0.5, -15) or UDim2.new(0, 5, 0.5, -15), 
            isActive and Color3.fromRGB(0, 0, 250) or Color3.fromRGB(255, 0, 0)        
        SaveSwitchState(isActive, switchName)
    end)

    return function() return isActive end
end

local getIsActive1 = createSwitch(Barra1, UDim2.new(0.2, 0, 0.120, 0), "Switch1", LoadSwitchState("Switch1"))--Farm
local getIsActive2 = createSwitch(Barra1, UDim2.new(0.735, 0, 0.115, 0), "Switch2", LoadSwitchState("Switch2"))--Ozaru
local getIsActive3 = createSwitch(Barra1, UDim2.new(0.2, 0, 0.2, 0), "Switch3", LoadSwitchState("Switch3"))--Atack
local getIsActive4 = createSwitch(Barra1, UDim2.new(0.735, 0, 0.195, 0), "Switch4", LoadSwitchState("Switch4"))--Puch
local getIsActive5 = createSwitch(Barra1, UDim2.new(0.2, 0, 0.275, 0), "Switch5", LoadSwitchState("Switch5"))--Rebirth
local getIsActive6 = createSwitch(Barra1, UDim2.new(0.740, 0, 0.275, 0), "Switch6", LoadSwitchState("Switch6"))--Main
local getIsActive7 = createSwitch(Barra1, UDim2.new(0.2, 0, 0.420, 0), "Switch7", LoadSwitchState("Switch7"))--Duck
local getIsActive8 = createSwitch(Barra1, UDim2.new(0.740, 0, 0.420, 0), "Switch8", LoadSwitchState("Switch8"))--Bºrª
local getIsActive9 = createSwitch(Barra1, UDim2.new(0.2, 0, 0.495, 0), "Switch9", LoadSwitchState("Switch9"))--Graf
local getIsActive10 = createSwitch(Barra1, UDim2.new(0.740, 0, 0.495, 0), "Switch10", LoadSwitchState("Switch10"))--Planet
local getIsActive11 = createSwitch(Barra1, UDim2.new(0.2, 0, 0.570, 0), "Switch11", LoadSwitchState("Switch11"))--Zom
local getIsActive12 = createSwitch(Barra1, UDim2.new(0.740, 0, 0.570, 0), "Switch12", LoadSwitchState("Switch12"))--Hall🎃

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
    {"Broccoli", "SSJB Wukong", 3e7},
    {"SSJB Wukong", "Kai-fist Master", 5e6},
    {"Perfect Atom", "SSJ2 Wukong", 1625000},
    {"Super Vegetable", "Chilly", 228000},
    {"Mapa", "Super Vegetable", 138000},
    {"Mapa", "Radish", 75000},
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
                if getIsActive1() and checkValue >= mission[3] and data.Quest.Value == "" then
                    local currentBoss = game.Workspace.Living:FindFirstChild(mission[1])
                    local nextNpc = game.Workspace.Others.NPCs:FindFirstChild(mission[2])
                    if currentBoss and currentBoss:FindFirstChild("Humanoid") and currentBoss.Humanoid.Health <= 0 then
                        if nextNpc and nextNpc:FindFirstChild("HumanoidRootPart") then
                            lplr.Character.HumanoidRootPart.CFrame = nextNpc.HumanoidRootPart.CFrame
                            Ex.Qaction:InvokeServer(nextNpc)
                            if getIsActive1() and data.Quest.Value == "" then return end
                        end
                    elseif game.Workspace.Others.NPCs:FindFirstChild(mission[1]) then
                        local npc = game.Workspace.Others.NPCs[mission[1]]
                        lplr.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame
                        Ex.Qaction:InvokeServer(npc)
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


--Quest Para el Hallowen solito y la mission de este
task.spawn(function()
    while true do
        pcall(function()
            if getIsActive12() and data.Quest.Value == "" then
            lplr.Character.HumanoidRootPart.CFrame = game.Workspace.Others.NPCs["SSJG Kakata"].HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
           game.ReplicatedStorage.Package.Events.Qaction:InvokeServer(game.Workspace.Others.NPCs["SSJG Kakata"])                    
            end
        end)
        wait(0.1)
    end
end)


--Ciclo Para Auto = Tp Boss A Cualquier Tipo De Boss
task.spawn(function()
    while true do
        pcall(function()
            local questValue = data.Quest.Value
            if getIsActive1() or getIsActive2() or getIsActive12() and questValue ~= "" then
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


--Borrador de Quets si algun Npc esta serca
task.spawn(function()
    while true do
        pcall(function()
            if getIsActive1() or getIsActive2() or getIsActive12()  and data.Quest.Value ~= "" then
                wait(.5)
                local npcFolder = game:GetService("Workspace").Others.NPCs
                for _, npc in ipairs(npcFolder:GetChildren()) do
                    if npc:FindFirstChild("HumanoidRootPart") then
                        local distance = (npc.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).Magnitude
                        if distance <= 500 and npc.Name ~= "Halloween NPC" and npc.Name ~= "Top X Fighter"  then
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


--Ciclo Para Auto = Quest y Tp Con Tiempo/Ozaruu
task.spawn(function()
    while true do
        pcall(function()
            if getIsActive2() then
                local currentGameHour = math.floor(game.Lighting.ClockTime)
                if currentGameHour >= 20 or currentGameHour < 6 then
                    if data.Quest.Value == "" then
                        lplr.Character.HumanoidRootPart.CFrame = game.Workspace.Others.NPCs["Kid Nohag"].HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                        game.ReplicatedStorage.Package.Events.Qaction:InvokeServer(game.Workspace.Others.NPCs["Kid Nohag"])
                    end
                else
                    if data.Quest.Value == "" then
                        lplr.Character.HumanoidRootPart.CFrame = game.Workspace.Others.NPCs["SSJG Kakata"].HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                        game.ReplicatedStorage.Package.Events.Qaction:InvokeServer(game.Workspace.Others.NPCs["SSJG Kakata"])
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
            if game.PlaceId ~= 5151400895 and getIsActive1() or getIsActive2() and getIsActive12() and data.Quest.Value ~= "" then
                    local npc = game.Workspace.Living:FindFirstChild(data.Quest.Value)
                    if npc and npc.Humanoid.Health <= 0 then
                        lplr.Character.HumanoidRootPart.CFrame = CFrame.new(-35233, 18, -28942)
                        local boss = game.Workspace.Living:FindFirstChild("Halloween Boss")
                        if boss and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
                            lplr.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame * CFrame.new(0, 0, 4)
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
            if getIsActive2() or getIsActive12() and data.Quest.Value == "" then
                local halloweenBoss = game.Workspace.Living:FindFirstChild("Halloween Boss")
                if halloweenBoss and halloweenBoss.Humanoid.Health <= 0 then
                    lplr.Character.HumanoidRootPart.CFrame = CFrame.new(2869, 531, -1816)
                    local evilSayas = game.Workspace.Living:GetChildren()                        
                    for _, evilSaya in ipairs(evilSayas) do
                        if evilSaya.Name == "Evil Saya" and evilSaya:FindFirstChild("Humanoid") then
                            while evilSaya.Humanoid.Health > 0 do
                                lplr.Character.HumanoidRootPart.CFrame = evilSaya.HumanoidRootPart.CFrame * CFrame.new(0, 0, 4)
                                Ex.p:FireServer("Blacknwhite27", 1)
                                Ex.p:FireServer("Blacknwhite27", 2)
                                task.wait()
                            end
                        end
                    end
                end
            end
        end)
        task.wait()
    end
end)

task.spawn(function()
    local clickCount = 0
    while true do
        pcall(function()
            if getIsActive11() then
                if data.Quest.Value == "" then
                    if clickCount < 22 then
                        keypress(Enum.KeyCode.I)
                        clickCount = clickCount + 1
                    end
                elseif data.Quest.Value ~= "" then
                    keypress(Enum.KeyCode.O)
                    clickCount = 0 
                end
            end
        end)
        task.wait()
    end
end)

--Ciclo Para Auto = Tp Boss y Ozaru
task.spawn(function()
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


--Ciclo para eleminar el Caht de los boss
local npcChatsBackup = {}
task.spawn(function()
    while true do
        pcall(function()
            if getIsActive9() then
                for _, npc in ipairs(game.Workspace.Others.NPCs:GetChildren()) do
                    local chat = npc:FindFirstChild("Chat")
                    if chat then npcChatsBackup[npc] = chat; chat.Parent = nil end
                end
            else
                for npc, chat in pairs(npcChatsBackup) do chat.Parent = npc end
            end
        end)
        wait(1)
    end
end)


--Ciclo Para Auto = Tierra/Bills
task.spawn(function()
    while true do
        pcall(function()         
            if getIsActive10() and game.PlaceId == 5151400895 and yo() <= 200000000 then
                Ex.TP:InvokeServer("Earth")
                wait(2)
            elseif getIsActive10() and game.PlaceId ~= 5151400895 and yo() >= 200000000 then
               Ex.TP:InvokeServer("Vills Planet")
                wait(2)                
            end
        end)
       wait()
    end
end)

task.spawn(function()
    while true do
        pcall(function()         
       if getIsActive4() then
            local kiValue = game.Players.LocalPlayer.Character:WaitForChild("Stats").Ki.Value
            local maxKi = game.Players.LocalPlayer.Character:WaitForChild("Stats").Ki.MaxValue
            local kiPercentage = kiValue / maxKi
            if data.Quest.Value == "" and kiPercentage <= 0.3 then
                keypress(Enum.KeyCode.C)
            else
              keyrelease(Enum.KeyCode.C)
               keypress(Enum.KeyCode.R)
                Ex.block:InvokeServer(true)
                end 
            end
        end)
       wait()
    end
end)

local moves = {"Wolf Fang Fist", "Meteor Crash", "High Power Rush", "Mach Kick", "Spirit Barrage", 
               "God Slicer"}
--Ciclo Para Auto = Atakes
task.spawn(function()
data.Quest.Value = ""
    while true do
        pcall(function()
        local boss = game.Workspace.Living:FindFirstChild(data.Quest.Value)           
            local dat = (game.PlaceId == 5151400895) and game.Workspace.Living:FindFirstChild(lplr.Name) or lplr
            if boss and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 and yo() >= 2e5  and data.Quest.Value ~= "" and getIsActive3() then
                if dat:FindFirstChild("Status") then
                    for _, move in ipairs(moves) do
                        if not dat.Status:FindFirstChild(move) then
                            task.spawn(function()
                                Ex.mel:InvokeServer(move, "Blacknwhite27")
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

--Ciclo para ancti afk
task.spawn(function()
    while true do
        pcall(function()
            game:GetService('Players').LocalPlayer.Idled:Connect(function()
                local bb = game:GetService('VirtualUser')
                bb:CaptureController()
                bb:ClickButton2(Vector2.new())
            end)
            if game.Workspace.Living[lplr.Name].Status.Transformation.Value == "None" then
                Ex.ta:InvokeServer()
            end
        end)
        wait(.2)
    end
end)

--Ciclo Congelamiento  de movimiento /Puños
task.spawn(function()
    while true do
        pcall(function()
            if data.Quest.Value ~= "" and getIsActive4() then
                Ex.p:FireServer("Blacknwhite27", 1)
                Ex.p:FireServer("Blacknwhite27", 2)
            end
            if getIsActive1() or getIsActive2() then
                lplr.Character.Humanoid:ChangeState(11)
                lplr.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
            end
            for _, obj in pairs(game.CoreGui:GetChildren()) do
                if (obj.Name == "KeyGui" or obj.Name == "fffg") and obj ~= game.CoreGui:FindFirstChild(obj.Name) then
                    obj:Destroy()
                end
            end
            if getIsActive5() then
                Ex.reb:InvokeServer()
            end
        end)
        wait()
    end
end)


task.spawn(function()
    while true do
        pcall(function()
            local bossMaps = game.Workspace.Others:FindFirstChild("BossMaps") or game.ReplicatedStorage:FindFirstChild("BossMaps")
            if bossMaps then
                if getIsActive8()  then
                lplr.PlayerGui:WaitForChild("Main").Enabled = false
                    bossMaps.Parent = game.ReplicatedStorage
                else
                lplr.PlayerGui:WaitForChild("Main").Enabled = true
                    bossMaps.Parent = game.Workspace.Others                  
                end
            end
        end)
        wait()
    end
end)

local p = game.Players.LocalPlayer
task.spawn(function()
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
        wait(1)
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
              local playerCount = #game.Players:GetPlayers()
            if playerCount > 1 then
                if game.PlaceId == 5151400895 then
                    game.ReplicatedStorage.Package.Events.TP:InvokeServer("Vills Planet")
                else
                    game.ReplicatedStorage.Package.Events.TP:InvokeServer("Earth")
                end
            end
            for _, obj in pairs(game.Workspace:GetDescendants()) do
            if obj:IsA("Sound") or obj.Name == "Effects" or obj:IsA("ParticleEmitter") then
              obj:Destroy()
                end
            end          
        end)
        task.wait(0.3)
    end
end)

--Ciclo para Auto = Carga en bills/Tierra
task.spawn(function()
    while true do
        pcall(function()                    
            if getIsActive4() and game.PlaceId ~= 5151400895 then
                Ex.cha:InvokeServer("Blacknwhite27")
            else
                local Work = game.Workspace.Living[lplr.Name].Status.Transformation.Value
                if Work and Work ~= "None" then
                    Ex.cha:InvokeServer("Blacknwhite27")
                end
            end
        end)
        task.wait()
    end
end)


task.spawn(function()
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
    game:GetService("Lighting").ClockTime = 18
end)
            
            
  task.spawn(function()
    while true do
        local rebirthValue = data.Rebirth.Value
        local strengthValue = data.Strength.Value
        local nextRebirth = (rebirthValue * 3e6) + 2e6
        local additionalStrength = lplr.Character and lplr.Character:FindFirstChild("Stats") and lplr.Character.Stats:FindFirstChild("Strength") and lplr.Character.Stats.Strength.Value or 0
        statusLabel.Text = string.format(
            "%s/%s/%s\n%s",
            formatNumber(nextRebirth),
            formatNumber(strengthValue),
            formatNumber(additionalStrength),
            formatNumber(rebirthValue)
        )
        wait(.2)
    end
end)


--Ciclode maestria
local playerGui = lplr:WaitForChild("PlayerGui")
local maxMastery = 332526

task.spawn(function()
    while true do
    pcall(function()
        local currentMastery = 0
        if game.PlaceId == 5151400895 then
            local transformation = game.Workspace.Living[lplr.Name] and game.Workspace.Living[lplr.Name].Status.Transformation.Value
            if transformation then
                currentMastery = data:FindFirstChild(transformation) and data[transformation].Value or 0
            end
        else
            local transformation = lplr.Status.Transformation.Value
            currentMastery = data:FindFirstChild(transformation) and data[transformation].Value or 0
        end
        if currentMastery > 0 then
            masteryLabel.Text = (currentMastery) .. " (" .. string.format("%.1f", (currentMastery / maxMastery) * 100) .. "%)"
        else
            masteryLabel.Text = "Mastery"
        end
      end)
        wait()
    end
end)


task.spawn(function()
    while true do
    pcall(function()
        local ping = math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
        pingLabel.Text = "Ping: " .. (ping < 1000 and ping or math.floor(ping / 10) * 10) .. " ms"---PING

        local fpsValue = math.floor(game:GetService("Stats").Workspace["Heartbeat"]:GetValue())
        Fps.Text = "FPS: " .. tostring(fpsValue)
         
         local questValue = data.Quest.Value or ""
            local Trf = (game.PlaceId == 5151400895 and game.Workspace.Living[lplr.Name].Status.Transformation.Value) or lplr.Status.Transformation.Value
            questLabel.Text = "Mission: " .. questValue .. " | Form: " .. Trf
            
        local clockTime = game.Lighting.ClockTime
        local hour = math.floor(clockTime)
        local minute = math.floor((clockTime - hour) * 60)
        local period = (hour >= 7 and hour < 19) and "Dia" or "Nch"
        local ampm = (hour >= 12) and "PM" or "AM"
        local displayHour = (hour % 12 == 0) and 12 or hour % 12
        timeLabel.Text = string.format("%s: %02d:%02d %s", period, displayHour, minute, ampm)
            end)
        wait(.2)
    end
end)




--Detroy de Ropa Boss
if getIsActive9() then
    for _, obj in ipairs(game.Workspace.Living:GetChildren()) do
        if obj:FindFirstChild("Humanoid") and obj ~= game.Players.LocalPlayer.Character then
            if obj:FindFirstChild("Shirt") then obj.Shirt:Destroy() end
            if obj:FindFirstChild("Pants") then obj.Pants:Destroy() end
        end
    end
    for _, obj in ipairs(game.Workspace.Others.NPCs:GetChildren()) do
        if obj:FindFirstChild("Shirt") then obj.Shirt:Destroy() end
        if obj:FindFirstChild("Pants") then obj.Pants:Destroy() end
    end
end


    --Ciclo Para = Traformation.Value           
task.spawn(function()
    while true do
        pcall(function()
            Ex.equipskill:InvokeServer("Divine Rose Prominence")
            wait()
            if game.Workspace.Living[lplr.Name].Status.SelectedTransformation.Value == "None" then
                Ex.equipskill:InvokeServer("Astral Instinct")
            elseif game.Workspace.Living[lplr.Name].Status.SelectedTransformation.Value == "Divine Rose Prominence" then
            end
        end)
        wait()
    end
end)

task.spawn(function()
    while true do
        pcall(function()
           if getIsActive6() then
            local MainFrame = lplr.PlayerGui.Main.MainFrame
            local StatsFrame = MainFrame.Frames.Stats
            local ZeniLabel = MainFrame.Indicator:FindFirstChild("Zeni")
            local Bars = MainFrame:WaitForChild("Bars")
            local stats = {"Strength", "Speed", "Defense", "Energy"}
            for _, stat in ipairs(stats) do
                local statLabel = StatsFrame:FindFirstChild(stat)
                if statLabel then
                    statLabel.Text = stat .. ": " .. formatNumber(data[stat].Value)
                end
            end
            if ZeniLabel then 
                ZeniLabel.Text = formatNumber(data.Zeni.Value) .. " Zeni"
            end            
            Bars.Health.TextLabel.Text = "SALUD: " .. formatNumber(lplr.Character.Humanoid.Health) .. " / " .. formatNumber(lplr.Character.Humanoid.MaxHealth)
            Bars.Energy.TextLabel.Text = "ENERGÍA: " .. formatNumber(lplr.Character.Stats.Ki.Value) .. " / " .. formatNumber(lplr.Character.Stats.Ki.MaxValue)
             local s = lplr.PlayerGui.Main.MainFrame.Frames.Quest
                s.Visible = false
                s.Position = UDim2.new(0.01, 0, 0.4, 0)
                s.Position = UDim2.new(2, 0, 0, 0)
            end
         end)
        task.wait()
    end
end)

--Ciclo Para Auto = Main y Start
local gui = lplr.PlayerGui.Main.bruh
if workspace.Others:FindFirstChild("Title") then
    Ex.Start:InvokeServer()
    gui.Disabled = true
    gui.Disabled = false
end

game.Workspace.FallenPartsDestroyHeight = 0/0


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

task.spawn(function()
    while flying do
        pcall(function()
            local hum = player.Character:WaitForChild("Humanoid")
            if hum.MoveDirection.Magnitude > 0 then
                player.Character:TranslateBy(hum.MoveDirection * speed)
            elseif hum.MoveDirection.Y < 0 then
                speed = speed + 0.1
            end
        end)
        wait(.2)
    end
end)

getgenv().Stats = {}

local lplr = game.Players.LocalPlayer
local ldata = game.ReplicatedStorage:WaitForChild("Datas"):WaitForChild(lplr.UserId)

local stats = getgenv().Stats

local planet = "Earth"

-- Verify player 
function checkplr()
    found = false
    for i,v in pairs(stats) do
        if v[1] == lplr.Name then
            found = false
            return v
        end
    end
    local table = {lplr.Name, math.huge, math.huge, }
    if not found then return table end
end

function getrebprice()
    return (ldata.Rebirth.Value * 3e6) + 2e6
end

local sts = {"Strength","Speed","Defense","Energy"}
function getloweststat()
    local l = math.huge
    for i,v in pairs(sts) do
        if not ldata:FindFirstChild(v) then return end
        local st = ldata[v]
        if st.Value < l then l = st.Value end
    end
    return l
end


-- New Script
function FindChar()
    while (not lplr.Character) and (not lplr.Character:FindFirstChild("Humanoid")) and (not lplr.Character.Humanoid.Health > 0) do task.wait() end
    return lplr.Character
end



local r = math.random(1,1e9)
_G.Key = r
-- ResetOnSpawn, Name = "Autofarm", 



local Directory = lplr.PlayerGui
pcall(function() Directory.Autofarm:Destroy()end)
local ScGui = Instance.new("ScreenGui")
ScGui.ResetOnSpawn = false
ScGui.Name = "Autofarm"
ScGui.Parent = lplr.PlayerGui
-- Instances:

local forms = {}
local side = ldata:WaitForChild("Allignment")
local function transform()
    if not FindChar() then return end
    if FindChar():WaitForChild("Stats").Ki.Value < 200 then return end
    if getloweststat() < 34000 then return end
    while not lplr.Status:FindFirstChild("Transformation") do task.wait() end
    if side.Value == "Good" then
        forms = {
	    {"Astral Instinct",120e6,"Blanco"},	
            {"Beast",120e6,"Blanco"},
            {"SSJBUI",120e6,"Blanco"},
            {"LBSSJ4",100e6},
            {"SSJB3",50e6,"SSJB4"},
            {"God of Creation",30e6,"True God of Creation"},
            {"Mastered Ultra Instinct",14e6},
            {"Godly SSJ2",8e6,"Super Broly"},
            {"Blue Evolution",3.5e6,"Super Broly"},
            {"Kefla SSJ2",3e6},
            {"SSJB Kaioken",2.2e6},
            {"SSJ Blue",1.2e6},
            {"SSJ Rage",700000},
            {"SSJG",450000},
            {"SSJ4",300000},
            {"Mystic",200000},
            {"LSSJ",140000},
            {"SSJ3",95000},
            {"Spirit SSJ",65000},
            {"SSJ2",34000},
            {"SSJ Kaioken",16000},
            {"SSJ",6000},
            {"FSSJ",2500},
            {"Kaioken",1000},
        }
    elseif side.Value == "Evil" then
        forms = {
          {"Astral Instinct",120e6,"Blanco"},	
            {"Beast",120e6,"Blanco"},
            {"Ultra Ego",120e6,"Blanco"},
            {"LBSSJ4",100e6},
            {"SSJR3",50e6,"SSJB4"},
            {"God of Destruction",30e6,"True God of Destruction"},
            {"Jiren Ultra Instinct",14e6},
            {"Godly SSJ2",8e6,"Super Broly"},
            {"Evil SSJ",4e6,"Super Broly"},
            {"Dark Rose",3.5e6,"Super Broly"},
            {"SSJ Berserker",3e6},
            {"True Rose",2.4e6},
            {"SSJ Rose",1.4e6},
            {"Corrupt SSJ",700000},
            {"SSJG",450000},
            {"SSJ4",300000},
            {"Mystic",200000},
            {"LSSJ",140000},
            {"SSJ3",95000},
            {"SSJ2 Majin",65000},
            {"SSJ2",34000},
            {"SSJ Kaioken",16000},
            {"SSJ",6000},
            {"FSSJ",2500},
            {"Kaioken",1000},
        }
    end
    -- Don't transform if stat grinding
    local lstatus = lplr.Status
    local currentform = lstatus.Transformation.Value
    if planet == "Earth" and ldata.Rebirth.Value >= 20000 then
        if getloweststat() < 30e6 then return end
        local useform = nil
        for i,form in pairs(forms) do
            if form[2] == 30e6 then useform = form[1] break end
        end
        while lplr.Status.Transformation.Value ~= useform do
            game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer(useform)
            if lplr.Status.Transformation.Value == useform then return end
            pcall(function()
                game.ReplicatedStorage.Package.Events.ta:InvokeServer()
            end)
            task.wait(.01)
        end
        return
    end
    if FindChar() then
        if getloweststat() < 1e12 then -- (ldata.Rebirth.Value*3e6)+2e6
            -- Under 1T stats, transform for efficiency
            for i,form in pairs(forms) do
                if currentform == form[1] or (form[3] and currentform == form[3]) then return end
                if getloweststat() >= form[2] then 
                    
                    game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer(form[1])
                    if form[3] ~= nil  then
                        game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer(form[3])
                    end
                    CanAttack = true
                    pcall(function()                                  
                        game.ReplicatedStorage.Package.Events.ta:InvokeServer()
                    end)
                    while FindChar().HumanoidRootPart.Anchored == true do wait() end
                    CanAttack = true
                    break
                end
            end
        else -- Transform for mastery, should be over 1T so no need to check for req
            for i,form in pairs(forms) do -- 5,767/332,526"
                if ldata[form[1]].Value < 5767 then
                    local useform = form[1] -- Name of the form you SHOULD use
                    if form[1] == lplr.Status.Transformation.Value then return -- If already in this form then don't do it again lol
                    else                       
                        game.ReplicatedStorage.Package.Events.equipskill:InvokeServer(form[1])
                        CanAttack = false
                        killtarget = nil
                        while lplr.Status.Transformation.Value ~= useform do
                            game.ReplicatedStorage.Package.Events.equipskill:InvokeServer(form[1])
                            pcall(function()
                                game.ReplicatedStorage.Package.Events.ta:InvokeServer()
                            end)
                            task.wait(.01)
                        end
                        while FindChar().HumanoidRootPart.Anchored == true do wait() end
                        CanAttack = true
                    end
                    Stacking = true
                    return
                end
            end
           
            useform = "Beast"
            if ldata[useform].Value < 332526 then
                if useform == lplr.Status.Transformation.Value then return -- If already in this form then don't do it again lol
                else
                    game.ReplicatedStorage.Package.Events.equipskill:InvokeServer(useform)
                    CanAttack = true
                    killtarget = nil
                    
                    while lplr.Status.Transformation.Value ~= useform do
                        pcall(function()
                            game.ReplicatedStorage.Package.Events.ta:InvokeServer()
                        end)
                        task.wait(.01)
                    end
                    while FindChar().HumanoidRootPart.Anchored == true do wait() end
                    CanAttack = true
                end
                return
            end -- 332526
            for i,form in pairs(forms) do -- 5,767/332,526"
                if ldata[form[1]].Value < 332526 then
                    local useform = form[1] -- Name of the form you SHOULD use
                    if form[1] == lplr.Status.Transformation.Value then return -- If already in this form then don't do it again lol
                    else                        
                        game.ReplicatedStorage.Package.Events.equipskill:InvokeServer(form[1])
                        CanAttack = true
                        killtarget = nil
                        while lplr.Status.Transformation.Value ~= useform do
                            pcall(function()
                                game.ReplicatedStorage.Package.Events.ta:InvokeServer()
                            end)
                            task.wait(0.01)
                        end
                       CanAttack = true                                   
                    end
                    return
                end
            end
        end
    end
end

local part = Instance.new("Part")
part.Parent = Workspace
part.Position = Vector3.new(0,20000,0)
part.Anchored = true
part.Transparency = .9



while not lplr:FindFirstChild("Status") do task.wait() print("Waiting for status") end -- staack
if planet == "Bills" and lplr.Status.Transformation.Value == "None" and getloweststat() < getrebprice()*1.2 then
    Stacking = true
    print("wait to stack")
    print("stacking now")
    local form = lplr:WaitForChild("Status"):WaitForChild("Transformation").Value
    --[[if form ~= "None" then
        game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer(form)
        game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
        -- unform
    end]]
end

task.spawn(function() -- Pick quest
    while ScGui and getloweststat() < checkplr()[3] do
            transform()
       wait()
    end
end)  


--fin de todo \/
       end)    
    task.wait()
end)
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
