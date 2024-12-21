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
 loadstring(game:HttpGet("https://raw.githubusercontent.com/Koala743/Koala7/refs/heads/main/Main3.lua"))()
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
