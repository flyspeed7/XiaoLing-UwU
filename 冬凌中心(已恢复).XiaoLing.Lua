local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Credits"
ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

local playerGui = game.Players.LocalPlayer.PlayerGui

local health = 100

local healthGui = Instance.new("ScreenGui")
healthGui.Name = "HealthGui"
healthGui.Parent = playerGui

local healthFrame = Instance.new("Frame")
healthFrame.Name = "HealthFrame"
healthFrame.Size = UDim2.new(0, 150, 0, 20)
healthFrame.Position = UDim2.new(1, -170, 0, 20)
healthFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
healthFrame.BorderSizePixel = 0
healthFrame.Parent = healthGui
local healthBar = Instance.new("Frame")
healthBar.Name = "HealthBar"
healthBar.Size = UDim2.new(1, 0, 1, 0)
healthBar.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
healthBar.BorderSizePixel = 0
healthBar.Parent = healthFrame

local function updateHealthGUI()
   healthBar.Size = UDim2.new(health / 100, 0, 1, 0)
end

updateHealthGUI()

game.Players.LocalPlayer.Character.Humanoid.HealthChanged:Connect(function(newHealth)
   health = newHealth
   updateHealthGUI()
end)

local playerGui = game.Players.LocalPlayer.PlayerGui

local fpsGui = Instance.new("ScreenGui")
fpsGui.Name = "FpsGui"
fpsGui.Parent = playerGui

local fpsLabel = Instance.new("TextLabel")
fpsLabel.Name = "FpsLabel"
fpsLabel.Size = UDim2.new(0, 100, 0, 20)
fpsLabel.Position = UDim2.new(0, 20, 0, 20)
fpsLabel.BackgroundColor3 = Color3.new(0, 0, 0)
fpsLabel.TextColor3 = Color3.new(1, 1, 1)
fpsLabel.Font = Enum.Font.SourceSans
fpsLabel.FontSize = Enum.FontSize.Size14
fpsLabel.Text = "帧数: "
fpsLabel.Parent = fpsGui

local lastUpdate = tick()

local fps = 0

local function updateFpsCounter()
    local deltaTime = tick() - lastUpdate
    lastUpdate = tick()

    fps = math.floor(1 / deltaTime)

    fpsLabel.Text = "帧数: " .. fps
end

game:GetService("RunService").RenderStepped:Connect(updateFpsCounter)

local ImageLabel = Instance.new("ImageLabel")
ImageLabel.Name = "Image"
ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel.Position = UDim2.new(0.5, 0, 0.4, 0)
ImageLabel.Size = UDim2.new(0.2, 0, 0.2, 0)
ImageLabel.Image = "rbxassetid://16060333448"
ImageLabel.Parent = ScreenGui

local TextLabel = Instance.new("TextLabel")
TextLabel.Name = "Text"
TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
TextLabel.Position = UDim2.new(0.5, 0, 0.6, 0)
TextLabel.Size = UDim2.new(0.5, 0, 0.1, 0)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.TextScaled = true
TextLabel.Text = "冬凌中心-1.3.1"
TextLabel.Parent = ScreenGui

local function animateCredits()
    local TweenService = game:GetService("TweenService")
    local imageTween = TweenService:Create(ImageLabel, TweenInfo.new(10, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 0, -0.2, 0)})
    local textTween = TweenService:Create(TextLabel, TweenInfo.new(10, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 0, -0.1, 0)})
    imageTween:Play()
    textTween:Play()

    wait(10)

    ImageLabel.Position = UDim2.new(0.5, 0, 0.4, 0)
    TextLabel.Position = UDim2.new(0.5, 0, 0.6, 0)
    ScreenGui:Destroy()
end

animateCredits()

local creditText = "作者：小凌,谢谢"
local creditDuration = 5

local decalIds = {
    5479567228,
    5479565074,
    5479559610,
}

local decalId = decalIds[math.random(#decalIds)]
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NotificationCreditsGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui

local Frame = Instance.new("Frame")
Frame.BackgroundTransparency = 1
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(1, -200, 1, -50)
Frame.Size = UDim2.new(0, 200, 0, 50)
Frame.Parent = ScreenGui

local Decal = Instance.new("Decal")
Decal.Texture = "rbxassetid://16060333448" .. decalId
Decal.Face = Enum.NormalId.Back
Decal.Parent = Frame

local TextLabel = Instance.new("TextLabel")
TextLabel.BackgroundTransparency = 1
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = creditText
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 16
TextLabel.Position = UDim2.new(0, 10, 0, 10)
TextLabel.Size = UDim2.new(1, -20, 1, -20)
TextLabel.Parent = Frame

local function animateNotification()
    Frame:TweenPosition(UDim2.new(1, -200, 1, -50), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.5, true)
    wait(creditDuration - 1)
    Frame:TweenPosition(UDim2.new(1, 0, 1, -50), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.5, true)
    wait(0.5)
    ScreenGui:Destroy()
end

animateNotification()
local Notification = loadstring(game:HttpGet("https://api.irisapp.ca/Scripts/IrisBetterNotifications.lua"))
local bindable = Instance.new("BindableFunction")
bindable.OnInvoke = function(button)
print("1")
end

game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "已开启反挂机、动态模糊",
    Text = "冬凌UwU",
    Icon = "rbxassetid://16060333448",
    Duration = 60,
    Callback = bindable,
    Button1 = "谢谢",
    Button2 = "关闭"
})
local CoreGui = game:GetService("StarterGui")
CoreGui:SetCore("SendNotification", {
    Title = "冬凌中心的欢迎",
    Text = "欢迎"..game.Players.LocalPlayer.Name.."执行小凌中心",
    Duration = 5,
})
local CoreGui = game:GetService("StarterGui")
CoreGui:SetCore("SendNotification", {
    Title = "你的注入器是？",
    Text = "我....我的注入器是："..identifyexecutor().."",
    Duration = 5,
})
  	local camera = workspace.CurrentCamera
local blurAmount = 10
local blurAmplifier = 5
local lastVector = camera.CFrame.LookVector

local motionBlur = Instance.new("BlurEffect", camera)

local runService = game:GetService("RunService")

workspace.Changed:Connect(function(property)
 if property == "CurrentCamera" then
  print("Changed")
  local camera = workspace.CurrentCamera
  if motionBlur and motionBlur.Parent then
   motionBlur.Parent = camera
  else
   motionBlur = Instance.new("BlurEffect", camera)
  end
 end
end)

runService.Heartbeat:Connect(function()
 if not motionBlur or motionBlur.Parent == nil then
  motionBlur = Instance.new("BlurEffect", camera)
 end
 
 local magnitude = (camera.CFrame.LookVector - lastVector).magnitude
 motionBlur.Size = math.abs(magnitude)*blurAmount*blurAmplifier/2
 lastVector = camera.CFrame.LookVector
end)

print("冬凌中心滴反挂机已经为你开好了 喵~")
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
		   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		   wait(1)
		   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		end)

local LBLG = Instance.new("ScreenGui", getParent)
local LBL = Instance.new("TextLabel", getParent)
local player = game.Players.LocalPlayer

LBLG.Name = "LBLG"
LBLG.Parent = game.CoreGui
LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LBLG.Enabled = true
LBL.Name = "LBL"
LBL.Parent = LBLG
LBL.BackgroundColor3 = Color3.new(1, 1, 1)
LBL.BackgroundTransparency = 1
LBL.BorderColor3 = Color3.new(0, 0, 0)
LBL.Position = UDim2.new(0.75,0,0.010,0)
LBL.Size = UDim2.new(0, 133, 0, 30)
LBL.Font = Enum.Font.GothamSemibold
LBL.Text = "TextLabel"
LBL.TextColor3 = Color3.new(1, 1, 1)
LBL.TextScaled = true
LBL.TextSize = 14
LBL.TextWrapped = true
LBL.Visible = true

local FpsLabel = LBL
local Heartbeat = game:GetService("RunService").Heartbeat
local LastIteration, Start
local FrameUpdateTable = { }

local function HeartbeatUpdate()
	LastIteration = tick()
	for Index = #FrameUpdateTable, 1, -1 do
		FrameUpdateTable[Index + 1] = (FrameUpdateTable[Index] >= LastIteration - 1) and FrameUpdateTable[Index] or nil
	end
	FrameUpdateTable[1] = LastIteration
	local CurrentFPS = (tick() - Start >= 1 and #FrameUpdateTable) or (#FrameUpdateTable / (tick() - Start))
	CurrentFPS = CurrentFPS - CurrentFPS % 1
	FpsLabel.Text = ("冬凌时间 = "..os.date("%H").."时"..os.date("%M").."分"..os.date("%S"))
end
Start = tick()
Heartbeat:Connect(HeartbeatUpdate)
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/flyspeed7/ShenJiaoBen/8bbcd1a30293fcf766cff342b1dd73578532347b/OrionLib.lua'))()
local Window = OrionLib:MakeWindow({IntroText = "感谢"..game.Players.LocalPlayer.Name.."使用冬凌中心",Name = "冬凌中心-1.3.1", HidePremium = false, SaveConfig = true, ConfigFolder = "大哥这缝合脚本啊"})
local about = Window:MakeTab({
    Name = "₪信息",
    Icon = "rbxassetid://7734053495",
    PremiumOnly = false
})
about:AddParagraph("您的用户名:"," "..game.Players.LocalPlayer.Name.."")
about:AddParagraph("您的注入器:"," "..identifyexecutor().."")
about:AddParagraph("您当前服务器的ID"," "..game.GameId.."")
about:AddParagraph("你好!小云我用了你的UI叫我删马上删除你的UI.","")
about:AddParagraph("大家多多支持小云、Krx、丁丁dingding等...脚本作者","")
about:AddParagraph("再见!再也不玩水滴轮、路亚、雷蛙、铁板","")
local Tab = Window:MakeTab({
  Name = "₪通用",
  Icon = "rbxassetid://7743866903",
  PremiumOnly = false
  })

  local Section = Tab:AddSection({

	Name = "By：小凌.AEX"

})
Tab:AddSlider({

	Name = "速度展示：",

	Min = 16,

	Max = 200,

	Default = 16,

	Color = Color3.fromRGB(255,255,255),

	Increment = 1,

	ValueName = "数值",

	Callback = function(Value)

		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value

	end    

})
Tab:AddSlider({

	Name = "跳跃高度",

	Min = 50,

	Max = 200,

	Default = 50,

	Color = Color3.fromRGB(255,255,255),

	Increment = 1,

	ValueName = "数值",

	Callback = function(Value)

		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value

	end    

})

 Tab:AddButton({
	Name = "₪Krx(落叶中心)〔推荐〕",
	Callback = function()
getgenv().LS="落叶中心" loadstring(game:HttpGet("https://raw.githubusercontent.com/krlpl/Deciduous-center-LS/main/%E8%90%BD%E5%8F%B6%E4%B8%AD%E5%BF%83%E6%B7%B7%E6%B7%86.txt"))()
end
})
Tab:AddButton({
  Name = "飞行V3GUI",
  Callback = function ()
    local main = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local up = Instance.new("TextButton")
local down = Instance.new("TextButton")
local onof = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local plus = Instance.new("TextButton")
local speed = Instance.new("TextLabel")
local mine = Instance.new("TextButton")
local closebutton = Instance.new("TextButton")
local mini = Instance.new("TextButton")
local mini2 = Instance.new("TextButton") 

main.Name = "main"
main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = false 

Frame.Parent = main
Frame.BackgroundColor3 = Color3.fromRGB(163, 255, 137)
Frame.BorderColor3 = Color3.fromRGB(103, 221, 213)
Frame.Position = UDim2.new(0.100320168, 0, 0.379746825, 0)
Frame.Size = UDim2.new(0, 190, 0, 57) 

up.Name = "up"
up.Parent = Frame
up.BackgroundColor3 = Color3.fromRGB(79, 255, 152)
up.Size = UDim2.new(0, 44, 0, 28)
up.Font = Enum.Font.SourceSans
up.Text = "UP"
up.TextColor3 = Color3.fromRGB(0, 0, 0)
up.TextSize = 14.000 

down.Name = "down"
down.Parent = Frame
down.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
down.Position = UDim2.new(0, 0, 0.491228074, 0)
down.Size = UDim2.new(0, 44, 0, 28)
down.Font = Enum.Font.SourceSans
down.Text = "DOWN"
down.TextColor3 = Color3.fromRGB(0, 0, 0)
down.TextSize = 14.000 

onof.Name = "onof"
onof.Parent = Frame
onof.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
onof.Position = UDim2.new(0.702823281, 0, 0.491228074, 0)
onof.Size = UDim2.new(0, 56, 0, 28)
onof.Font = Enum.Font.SourceSans
onof.Text = "fly"
onof.TextColor3 = Color3.fromRGB(0, 0, 0)
onof.TextSize = 14.000 

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(242, 60, 255)
TextLabel.Position = UDim2.new(0.469327301, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 100, 0, 28)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Fly GUI V3"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true 

plus.Name = "plus"
plus.Parent = Frame
plus.BackgroundColor3 = Color3.fromRGB(133, 145, 255)
plus.Position = UDim2.new(0.231578946, 0, 0, 0)
plus.Size = UDim2.new(0, 45, 0, 28)
plus.Font = Enum.Font.SourceSans
plus.Text = "+"
plus.TextColor3 = Color3.fromRGB(0, 0, 0)
plus.TextScaled = true
plus.TextSize = 14.000
plus.TextWrapped = true 

speed.Name = "speed"
speed.Parent = Frame
speed.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
speed.Position = UDim2.new(0.468421042, 0, 0.491228074, 0)
speed.Size = UDim2.new(0, 44, 0, 28)
speed.Font = Enum.Font.SourceSans
speed.Text = "1"
speed.TextColor3 = Color3.fromRGB(0, 0, 0)
speed.TextScaled = true
speed.TextSize = 14.000
speed.TextWrapped = true 

mine.Name = "mine"
mine.Parent = Frame
mine.BackgroundColor3 = Color3.fromRGB(123, 255, 247)
mine.Position = UDim2.new(0.231578946, 0, 0.491228074, 0)
mine.Size = UDim2.new(0, 45, 0, 29)
mine.Font = Enum.Font.SourceSans
mine.Text = "-"
mine.TextColor3 = Color3.fromRGB(0, 0, 0)
mine.TextScaled = true
mine.TextSize = 14.000
mine.TextWrapped = true 

closebutton.Name = "Close"
closebutton.Parent = main.Frame
closebutton.BackgroundColor3 = Color3.fromRGB(225, 25, 0)
closebutton.Font = "SourceSans"
closebutton.Size = UDim2.new(0, 45, 0, 28)
closebutton.Text = "X"
closebutton.TextSize = 30
closebutton.Position = UDim2.new(0, 0, -1, 27) 

mini.Name = "minimize"
mini.Parent = main.Frame
mini.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
mini.Font = "SourceSans"
mini.Size = UDim2.new(0, 45, 0, 28)
mini.Text = "-"
mini.TextSize = 40
mini.Position = UDim2.new(0, 44, -1, 27) 

mini2.Name = "minimize2"
mini2.Parent = main.Frame
mini2.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
mini2.Font = "SourceSans"
mini2.Size = UDim2.new(0, 45, 0, 28)
mini2.Text = "+"
mini2.TextSize = 40
mini2.Position = UDim2.new(0, 44, -1, 57)
mini2.Visible = false 

speeds = 1 

local speaker = game:GetService("Players").LocalPlayer 

local chr = game.Players.LocalPlayer.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid") 

nowe = false 

game:GetService("StarterGui"):SetCore("SendNotification", { 
Title = "Fly GUI V3";
Text = "By me_ozone and Quandale The Dinglish XII#3550";
Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"})
Duration = 5; 

Frame.Active = true -- main = gui
Frame.Draggable = true 

onof.MouseButton1Down:connect(function() 

if nowe == true then
nowe = false 

speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
else 
nowe = true



for i = 1, speeds do
spawn(function() 

local hb = game:GetService("RunService").Heartbeat


tpwalking = true
local chr = game.Players.LocalPlayer.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
while tpwalking and hb:Wait() and chr and hum and hum.Parent do
if hum.MoveDirection.Magnitude > 0 then
chr:TranslateBy(hum.MoveDirection)
end
end 

end)
end
game.Players.LocalPlayer.Character.Animate.Disabled = true
local Char = game.Players.LocalPlayer.Character
local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController") 

for i,v in next, Hum:GetPlayingAnimationTracks() do
v:AdjustSpeed(0)
end
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
end




if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then



local plr = game.Players.LocalPlayer
local torso = plr.Character.Torso
local flying = true
local deb = true
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local lastctrl = {f = 0, b = 0, l = 0, r = 0}
local maxspeed = 50
local speed = 0


local bg = Instance.new("BodyGyro", torso)
bg.P = 9e4
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
bg.cframe = torso.CFrame
local bv = Instance.new("BodyVelocity", torso)
bv.velocity = Vector3.new(0,0.1,0)
bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
if nowe == true then
plr.Character.Humanoid.PlatformStand = true
end
while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
game:GetService("RunService").RenderStepped:Wait() 

if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
speed = speed+.5+(speed/maxspeed)
if speed > maxspeed then
speed = maxspeed
end
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
speed = speed-1
if speed < 0 then
speed = 0
end
end
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
else
bv.velocity = Vector3.new(0,0,0)
end
--game.Players.LocalPlayer.Character.Animate.Disabled = true
bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
end
ctrl = {f = 0, b = 0, l = 0, r = 0}
lastctrl = {f = 0, b = 0, l = 0, r = 0}
speed = 0
bg:Destroy()
bv:Destroy()
plr.Character.Humanoid.PlatformStand = false
game.Players.LocalPlayer.Character.Animate.Disabled = false
tpwalking = false



end





end) 

local tis 

up.MouseButton1Down:connect(function()
tis = up.MouseEnter:connect(function()
while tis do
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,0)
end
end)
end) 

up.MouseLeave:connect(function()
if tis then
tis:Disconnect()
tis = nil
end
end) 

local dis 

down.MouseButton1Down:connect(function()
dis = down.MouseEnter:connect(function()
while dis do
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1,0)
end
end)
end) 

down.MouseLeave:connect(function()
if dis then
dis:Disconnect()
dis = nil
end
end)


game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
wait(0.7)
game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
game.Players.LocalPlayer.Character.Animate.Disabled = false 

end)


plus.MouseButton1Down:connect(function()
speeds = speeds + 1
speed.Text = speeds
if nowe == true then


tpwalking = false
for i = 1, speeds do
spawn(function() 

local hb = game:GetService("RunService").Heartbeat


tpwalking = true
local chr = game.Players.LocalPlayer.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
while tpwalking and hb:Wait() and chr and hum and hum.Parent do
if hum.MoveDirection.Magnitude > 0 then
chr:TranslateBy(hum.MoveDirection)
end
end 

end)
end
end
end)
mine.MouseButton1Down:connect(function()
if speeds == 1 then
speed.Text = 'cannot be less than 1'
wait(1)
speed.Text = speeds
else
speeds = speeds - 1
speed.Text = speeds
if nowe == true then
tpwalking = false
for i = 1, speeds do
spawn(function() 

local hb = game:GetService("RunService").Heartbeat


tpwalking = true
local chr = game.Players.LocalPlayer.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
while tpwalking and hb:Wait() and chr and hum and hum.Parent do
if hum.MoveDirection.Magnitude > 0 then
chr:TranslateBy(hum.MoveDirection)
end
end 

end)
end
end
end
end) 

closebutton.MouseButton1Click:Connect(function()
main:Destroy()
end) 

mini.MouseButton1Click:Connect(function()
up.Visible = false
down.Visible = false
onof.Visible = false
plus.Visible = false
speed.Visible = false
mine.Visible = false
mini.Visible = false
mini2.Visible = true
main.Frame.BackgroundTransparency = 1
closebutton.Position = UDim2.new(0, 0, -1, 57)
end) 

mini2.MouseButton1Click:Connect(function()
up.Visible = true
down.Visible = true
onof.Visible = true
plus.Visible = true
speed.Visible = true
mine.Visible = true
mini.Visible = true
mini2.Visible = false
main.Frame.BackgroundTransparency = 0 
closebutton.Position = UDim2.new(0, 0, -1, 27)
end)
  end
})

Tab:AddButton({
	Name = "飞行装备（可控制物体）",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/zaochuan2"))()		
  	end
})

Tab:AddTextbox({
	Name = "移动速度",
	Default = "Speed",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end	 
})

 Tab:AddTextbox({
	Name = "跳跃高度Copy How-Hiw",
	Default = "Jump",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end	 
})

Tab:AddTextbox({
	Name = "最大血量",
	Default = "HP",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.MaxHealth = Value
	end	 
})

Tab:AddTextbox({
	Name = "当前血量",
	Default = "U.HP",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.Health = Value
	end	 
})

Tab:AddButton({
	Name = "回满血",
	Callback = function()
game.Players.LocalPlayer.Character.Humanoid.Health = game.Players.LocalPlayer.Character.Humanoid.MaxHealth 
end
})

Tab:AddTextbox({
	Name = "重力设置",
	Default = "GR",
	TextDisappear = true,
	Callback = function(Value)
		game.Workspace.Gravity = Value
	end
})

Tab:AddButton({
	Name = "Acrylix（通用）",
	Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/3dsonsuce/acrylix/main/Acrylix'))()
end
})

Tab:AddButton({
	Name = "空范围",
	Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/BINjiaobzx6/BINjiao/main/%E7%A9%BA%E9%80%8F%E8%A7%86.lua"))()
end
})

Tab:AddButton({
	Name = "墙行走",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
end
})

Tab:AddToggle({
	Name = "夜视",
	Default = false,
	Callback = function(Value)
		if Value then
		    game.Lighting.Ambient = Color3.new(1, 1, 1)
		else
		    game.Lighting.Ambient = Color3.new(0, 0, 0)
		end
	end
})

Tab:AddButton({
	Name = "通用ESP",
	Callback = function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP'))()
	end
})

Tab:AddButton({
	Name = "电脑键盘",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
  	end    
})

Tab:AddToggle({
	Name = "穿墙",
	Default = false,
	Callback = function(Value)
		if Value then
		    Noclip = true
		    Stepped = game.RunService.Stepped:Connect(function()
			    if Noclip == true then
				    for a, b in pairs(game.Workspace:GetChildren()) do
                        if b.Name == game.Players.LocalPlayer.Name then
                            for i, v in pairs(game.Workspace[game.Players.LocalPlayer.Name]:GetChildren()) do
                                if v:IsA("BasePart") then
                                    v.CanCollide = false
                                end
                            end
                        end
                    end
			    else
				    Stepped:Disconnect()
			    end
		    end)
	    else
		    Noclip = false
	    end
	end
})

Tab:AddButton({
	Name = "甩飞别人",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/GnvPVBEi"))()
  	end    
})

Tab:AddButton({
	Name = "转圈fling GUI",
	Callback = function()
loadstring(game:HttpGet('https://pastebin.com/raw/r97d7dS0', true))()
end
})

Tab:AddButton({
  Name = "稳定穿墙",
  Callback = function()
    local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local Clipon = true

Stepped = game:GetService("RunService").Stepped:Connect(function()
	if not Clipon == false then
		for a, b in pairs(Workspace:GetChildren()) do
        if b.Name == Players.LocalPlayer.Name then
        for i, v in pairs(Workspace[Players.LocalPlayer.Name]:GetChildren()) do
        if v:IsA("BasePart") then
        v.CanCollide = false
        end end end end
	else
		Stepped:Disconnect()
	end
end)
  end
})

Tab:AddButton({
    Name="我要紫砂",
    Callback=function()
        game.Players.LocalPlayer.Character.Humanoid.Health=0
HumanDied = true
    end
})

Tab:AddButton({
	Name = "不死但不完全不死（点紫砂去除）",
	Callback = function()
HumanDied = false
end
})

Tab:AddButton({
	Name = "跟踪玩家",
	Callback = function()
      	loadstring(game:HttpGet("https://pastebin.com/raw/F9PNLcXk"))()
  	end
})

Tab:AddButton({
	Name = "伪名说话",
	Callback = function()
loadstring(game:HttpGet(('https://pastefy.ga/zCFEwaYq/raw'),true))()
	end 
})

Tab:AddButton({
	Name = "人物无敌",
	Callback = function()
     loadstring(game:HttpGet('https://pastebin.com/raw/H3RLCWWZ'))()
	end    
})

Tab:AddButton({
	Name = "无敌",
	Callback = function()
local lp = game:GetService "Players".LocalPlayer
if lp.Character:FindFirstChild "Head" then
    local char = lp.Character
    char.Archivable = true
    local new = char:Clone()
    new.Parent = workspace
    lp.Character = new
    wait(2)
    local oldhum = char:FindFirstChildWhichIsA "Humanoid"
    local newhum = oldhum:Clone()
    newhum.Parent = char
    newhum.RequiresNeck = false
    oldhum.Parent = nil
    wait(2)
    lp.Character = char
    new:Destroy()
    wait(1)
    newhum:GetPropertyChangedSignal("Health"):Connect(
        function()
            if newhum.Health <= 0 then
                oldhum.Parent = lp.Character
                wait(1)
                oldhum:Destroy()
            end
        end)
    workspace.CurrentCamera.CameraSubject = char
    if char:FindFirstChild "Animate" then
        char.Animate.Disabled = true
        wait(.1)
        char.Animate.Disabled = false
    end
    lp.Character:FindFirstChild "Head":Destroy()
end
end
})

Tab:AddButton({
	Name = "点击传送工具",
	Callback = function()
mouse = game.Players.LocalPlayer:GetMouse() tool = Instance.new("Tool") tool.RequiresHandle = false tool.Name = "小凌NB" tool.Activated:connect(function() local pos = mouse.Hit+Vector3.new(0,2.5,0) pos = CFrame.new(pos.X,pos.Y,pos.Z) game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos end) tool.Parent = game.Players.LocalPlayer.Backpack
	end
})

Tab:AddButton({
	Name = "Dex",
	Callback = function()
loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
end
})

local Tab = Window:MakeTab({
  Name = "₪极速传奇",
  Icon = "rbxassetid://4483345998",
  PremiumOnly = false
  })
  
  Tab:AddButton({
	Name = "极速传奇",
	Callback = function()
      	loadstring(game:HttpGet('\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\98\111\121\115\99\112\47\98\101\116\97\47\109\97\105\110\47\37\69\57\37\56\48\37\57\70\37\69\53\37\66\65\37\65\54\37\69\55\37\56\50\37\66\56\37\69\56\37\66\53\37\66\55\46\108\117\97'))()
  	end
})

local Tab = Window:MakeTab({
  Name = "₪脚本中心",
  Icon = "rbxassetid://7072725342",
  PremiumOnly = false
  })
  
Tab:AddButton({
	Name = "脚本中心",
	Callback = function()
  loadstring(game:HttpGet("https://pastebin.com/raw/De4aYHDY"))()
  	end
})

local Tab = Window:MakeTab({
	Name = "₪DOORS",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "神光脚本",
	Callback = function()

  _G["神光脚本作者TA"]="xdjhadgdsrfcyefjhsadcctyseyr6432478rudghfvszhxcaheey"loadstring(game:HttpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,109,119,48,112,102,69,70,77})end)())))()--神光
    end
})

Tab:AddButton({
	Name = "面包脚本",
	Callback = function()

  _G["面包脚本作者TA"]="xdjhadgdsrfcyefjhsadcctyseyr6432478rudghfvszhxcaheey"loadstring(game:HttpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,109,119,48,112,102,69,70,77})end)())))()--神光
    end
})

Tab:AddButton({
	Name = "Ohio doors",
	Callback = function()
 loadstring(game:HttpGet("https://raw.githubusercontent.com/rxn-xyz/Ohio./main/Ohio.lua",true))()
    end
})

Tab:AddButton({
	Name = "云doors",
	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/hsjakajaaa.lua"))()
    end
})

Tab:AddButton({
	Name = "吸铁石",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/MagnetByNerd.lua"))()
    end
})
Tab:AddButton({
	Name = "剪刀",
	Callback = function()
   
loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/shears_done.lua"))()
    end
})    
Tab:AddButton({
	Name = "激光枪",
	Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/K0t1n/Public/main/Laser%20Gun"))()
    end
})
Tab:AddButton({
	Name = "夜视仪",
	Callback = function()
   
  _G.OnShop = trueloadstring(game:HttpGet('https://raw.githubusercontent.com/DeividComSono/Scripts/main/Scanner.lua'))()
    end
})    

Tab:AddButton({
	Name = "最强",
	Callback = function()
   loadstring(game:HttpGet('https://pastebin.com/raw/R8QMbhzv'))()
  	end    
})

Tab:AddButton({
	Name = "十字架",
	Callback = function()
   
loadstring(game:HttpGet('https://pastebin.com/raw/ibbWwU6q'))()
  	end
})
Tab:AddButton({
	Name = "能量罐（清岩提供）",
	Callback = function()  
  loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/nengliangtiao"))()
    end
})   

Tab:AddButton({
	Name = "紫色手电筒（在电梯购买东西的时候使用）",
	Callback = function()
   
  loadstring(game:HttpGet("https://raw.githubusercontent.com/K0t1n/Public/main/Purple%20Flashlight"))()
    end
})  
local Tab = Window:MakeTab({
  Name = "₪国王遗产",
  Icon = "rbxassetid://4483345998",
  PremiumOnly = false
  })

Tab:AddButton({
	Name = "trick",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Strikehubv2z/StormSKz/main/All_in_one"))()
end
})

Tab:AddButton({
	Name = "ipper hub",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/hajibeza/RIPPER-HUB/main/King%20Leagacy"))()
end
})

Tab:AddButton({
	Name = "Xenon Hub",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/master/legacy"))()
end
})

Tab:AddButton({
	Name = "lack",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/sannin9000/scripts/main/kinglegacy.lua"))()
end
})

Tab:AddButton({
	Name = "yper hub",
	Callback = function()
repeat wait() until game:IsLoaded()loadstring(game:HttpGet("https://raw.githubusercontent.com/DookDekDEE/Hyper/main/script.lua"))() 
end
})

local Tab = Window:MakeTab({
	Name = "₪脚本区",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "青蛙",
	Callback = function()
   
getgenv().eom = "青蛙"
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\39\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\68\122\120\115\81\82\68\85\39\41\41\40\41")()
    end
})
Tab:AddButton({
	Name = "地岩",
	Callback = function()
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\98\98\97\109\120\98\98\97\109\120\98\98\97\109\120\47\99\111\100\101\115\112\97\99\101\115\45\98\108\97\110\107\47\109\97\105\110\47\37\69\55\37\57\57\37\66\68\34\41\41\40\41")()
    end
})
Tab:AddButton({
	Name = "ato",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/atoyayaya/jiaoben/main/jiamilist"))()
end
})
Tab:AddButton({
	Name = "龙",
	Callback = function()
loadstring(game:HttpGet "https://pastebin.com/raw/bXApbsu8")()
    end
})
Tab:AddButton({
	Name = "云脚本",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/Xiaos______________________________________________________________Yun__________________________________________________________________________betaV2.3------------------------------------------------------------------------------------jsjalololololololololololololololololololllololol.lua"))()
    end
})
Tab:AddButton({
  Name = "USA（卡密：USA AER）",
  Callback = function()
    getgenv().USA="作者莫羽免费请勿倒卖"loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/beta/main/USA.lua"))()
   end
})local Tab = Window:MakeTab({
	Name = "₪脚本大全",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "自动刷金条(造船寻宝)",	
Callback = function()	loadstring(game:HttpGet("https://pastebin.com/raw/Lyy77rnr",true))()
  	end
})
Tab:AddButton({
	Name = "巴掌模拟器",
	Callback = function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/Unknownkellymc1/Unknownscripts/main/slap-battles')))()
    end
})

Tab:AddButton({
	Name = "Slap Battles fanmode（无冷却）",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/C6wNFT0r"))()
end
})

Tab:AddButton({
	Name = "Blox Fruit",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Frerfgzz/free-script/main/SMZHUBv2BETA"))()
end
})

Tab:AddButton({
	Name = "一路向西",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/pHN96bvq"))()
end
})

Tab:AddButton({
	Name = "力量传奇",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/harisiskandar178/Roblox-Script/main/Muscle%20Legend"))()
  	end    
})

Tab:AddButton({
	Name = "The Mimic",
	Callback = function()
loadstring(game:HttpGet("https://scriptblox.com/raw/UPDATE-The-Mimic-Instant-Finish-Nightmare-Normal-TWT-And-Halloween-Trials-6497"))()
end
})

Tab:AddButton({
	Name = "The Mimic auto win",
	Callback = function()
loadstring(game:HttpGet("https://scriptblox.com/raw/NIGHTMARE-The-Mimic-Complete-Chapters-1687"))()
end
})

local Tab = Window:MakeTab({
  Name = "₪鲨口求生",
  Icon = "rbxassetid://4483345998",
  PremiumOnly = false
  })
  
Tab:AddDropdown({
	Name = "选择你的免费船(鲨2)",
	Default = "1",
	Options = {"无", "DuckyBoatBeta", "DuckyBoat", "BlueCanopyMotorboat", "BlueWoodenMotorboat", "UnicornBoat", "Jetski", "RedMarlin", "Sloop", "TugBoat", "SmallDinghyMotorboat", "JetskiDonut", "Marlin", "TubeBoat", "FishingBoat", "VikingShip", "SmallWoodenSailboat", "RedCanopyMotorboat", "Catamaran", "CombatBoat", "TourBoat", "Duckmarine", "PartyBoat", "MilitarySubmarine", "GingerbreadSteamBoat", "Sleigh2022", "Snowmobile", "CruiseShip"},
	Callback = function(Value)
local ohString1 = (Value)
game:GetService("ReplicatedStorage").EventsFolder.BoatSelection.UpdateHostBoat:FireServer(ohString1)
	end 
})
Tab:AddButton({
	Name = "自动杀鲨鱼（鲨2）",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/Sw1ndlerScripts/RobloxScripts/main/Misc%20Scripts/sharkbite2.lua",true))()
  	end    
})

local Tab = Window:MakeTab({
  Name = "关反挂机",
  Icon = "rbxassetid://4483345998",
  PremiumOnly = false
  })

Tab:AddButton({
	Name = "点我关",
	Callback = function()
game.Players.LocalPlayer:Kick('Because you used the actuator, you were forced to quit the game')
end
})

local Tab = Window:MakeTab({
    Name = " ₪监狱人生",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({
	Name = "Moon Hub",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/Gae7YC84"))();
  	end    
})

Tab:AddButton({
	Name = "菜单",
	Callback = function()
     loadstring(game:HttpGet('https://raw.githubusercontent.com/LiverMods/xRawnder/main/HubMoblie'))()
  	end    
})

Tab:AddButton({
	Name = "PRISONWARE_V1.3",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/Denverrz/scripts/master/PRISONWARE_v1.3.txt"))();
  	end    
})

Tab:AddButton({
	Name = "PRISONWARE V1.5",
	Callback = function()
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/h17s3/TIGERADMIN/main/TIGERADMINSCRIPTFREE'),true))()
	end
})

local Tab = Window:MakeTab({
  Name = "₪脚本大全2",
  Icon = "rbxassetid://4483345998",
  PremiumOnly = false
  })
  
Tab:AddButton({
	Name = "动感星期五",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/wally-rblx/funky-friday-autoplay/main/main.lua",true))()
  	end    
})

Tab:AddButton({
	Name = "战斗勇士",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/frkfx/Combat-Warriors/main/Script"))()
	end
})
Tab:AddButton({
	Name = "强壮传奇",
	Callback = function()
loadstring(game:HttpGet('https://ghostbin.co/paste/ctpa/raw'))()
	end
})

Tab:AddButton({
	Name = "进击的僵尸",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/Zombie%20Attack", true))()
	end
})

Tab:AddButton({
	Name = "宠物模拟器X",
	Callback = function()
     loadstring(game:HttpGet'https://raw.githubusercontent.com/RunDTM/ZeeroxHub/main/Loader.lua')()
  	end    
})
Tab:AddButton({
	Name = "蜂群模拟器",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/3A61hnGA", true))()
  	end    
})
Tab:AddButton({
	Name = "Evade",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Evade/main.lua"))()
  	end    
})
Tab:AddButton({
	Name = "后室",
	Callback = function()
     loadstring(game:HttpGet('https://pastebin.com/raw/Gsqd40fL'))()
  	end    
})
Tab:AddButton({
	Name = "Synapse X",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/tWGxhNq0"))()
  	end    
})
Tab:AddButton({
	Name = "彩虹朋友",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/JNHHGaming/Rainbow-Friends/main/Rainbow%20Friends"))()
  	end    
})
Tab:AddButton({
	Name = "HoHo blox fruit",
	Callback = function()
     loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI'))()
  	end    
})

local player = Window:MakeTab({
	Name = "₪能力大战",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

player:AddButton({ 
	Name = "能力大战（会覆盖）",
	Callback = function()
      	loadstring(game:HttpGet("https://raw.githubusercontent.com/castycheat/abilitywars/main/Protected%20(29).lua"))()
  	end
})

local player = Window:MakeTab({
	Name = "₪Piggy",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

player:AddButton({ 
	Name = "Piggy（恐怖佩奇）",
	Callback = function()
      	loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe2/ToraIsMe2/main/0piggy2", true))()
  	end
})

local player = Window:MakeTab({
	Name = "₪视觉",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

player:AddButton({ 
	Name = "动态模糊",
	Callback = function()
       	local camera = workspace.CurrentCamera
local blurAmount = 10
local blurAmplifier = 5
local lastVector = camera.CFrame.LookVector

local motionBlur = Instance.new("BlurEffect", camera)

local runService = game:GetService("RunService")

workspace.Changed:Connect(function(property)
 if property == "CurrentCamera" then
  print("Changed")
  local camera = workspace.CurrentCamera
  if motionBlur and motionBlur.Parent then
   motionBlur.Parent = camera
  else
   motionBlur = Instance.new("BlurEffect", camera)
  end
 end
end)

runService.Heartbeat:Connect(function()
 if not motionBlur or motionBlur.Parent == nil then
  motionBlur = Instance.new("BlurEffect", camera)
 end
 
 local magnitude = (camera.CFrame.LookVector - lastVector).magnitude
 motionBlur.Size = math.abs(magnitude)*blurAmount*blurAmplifier/2
 lastVector = camera.CFrame.LookVector
end)
  	end
})

player:AddButton({ 
	Name = "光影（浅）",
	Callback = function()
       	loadstring(game:HttpGet("https://pastebin.com/raw/jHBfJYmS"))()
  	end
})

player:AddButton({ 
	Name = "光影（深）",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
  	end
})

local Tab = Window:MakeTab({
	Name = "₪RobloxUI",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "新的moon让画面变得更流畅",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/Empire4946/Mightix/main/loader.lua",true))()
  	end
})

Tab:AddButton({
	Name = "red界面",
	Callback = function()
     loadstring(game:HttpGet("https://eternityhub.xyz/BetterRoblox/Loader"))()
  	end
})

local Tab = Window:MakeTab({
    Name = "₪伐木脚本",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
      Name = "小云bark2.0",
      Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/bark2.0.lua"))()
      end
      })

local Tab = Window:MakeTab({
	Name = "₪通用2",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({	
Name = "工具包",	
Callback = function()	loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()	  	
     end
})
Tab:AddButton({
	Name = "透视",
	Callback = function()
     loadstring(game:HttpGet('https://pastebin.com/raw/MA8jhPWT'))()
  	end    
})
Tab:AddButton({
	Name = "飞车",
	Callback = function() loadstring(game:HttpGet("https://pastebin.com/raw/MHE1cbWF"))()
	end
})
Tab:AddButton({
	Name = "甩飞",
	Callback = function() loadstring(game:HttpGet("https://pastebin.com/raw/GnvPVBEi"))()
	end
})
Tab:AddButton({
	Name = "无限跳",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0", true))()
    end
})

Tab:AddButton({
      Name = "阿尔宙斯V3.0 UI",
      Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20X%20V3"))()
      end
})

Tab:AddButton({
  Name = "光影_2",
  Default = false,
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
  end
})

Tab:AddButton({
  Name = "美丽天空",
  Callback = function()
    -- Roblox Graphics Enhancher
    local light = game.Lighting
    for i, v in pairs(light:GetChildren()) do
      v:Destroy()
    end

    local ter = workspace.Terrain
    local color = Instance.new("ColorCorrectionEffect")
    local bloom = Instance.new("BloomEffect")
    local sun = Instance.new("SunRaysEffect")
    local blur = Inst
  end
})

Tab:AddButton({
	Name = "超高画质",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/jHBfJYmS"))()
end
})    

local Tab = Window:MakeTab({
	Name = "₪FE脚本",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "C00lgui",
	Callback = function()
   loadstring(game:GetObjects("rbxassetid://8127297852")[1].Source)()
  	end    
})
Tab:AddButton({
	Name = "1x1x1x1",
	Callback = function()
     loadstring(game:HttpGet(('https://pastebin.com/raw/JipYNCht'),true))()
  	end    
})
Tab:AddButton({
	Name = "变玩家（R6）",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/XR4sGcgJ"))()
  	end    
})
Tab:AddButton({
	Name = "动画中心",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Animation-Hub/main/Animation%20Gui", true))()
  	end    
})

local Tab = Window:MakeTab({
  Name = "₪FE变身脚本",
  Icon = "rbxassetid://4483345998",
  PremiumOnly = false
  })

Tab:AddButton({
	Name = "FE SANS",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/i0yEjAry"))()
end
})

Tab:AddButton({
	Name = "FE Reaper",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/5rVDct9n"))()
end
})

Tab:AddButton({
	Name = "FE死侍",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/NVvdEySK"))()
end
})

Tab:AddButton({
	Name = "FE Knife",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/uAnpMVZR"))()
end
})

Tab:AddButton({
	Name = "Void BOSS",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/uP0MV6As"))()
end
})

Tab:AddButton({
	Name = "变大变小真的奇妙～",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/yRyNgpGE"))()
end
})

Tab:AddButton({
	Name = "FE PUNCH",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/gBrRFj8K"))()
end
})

Tab:AddButton({
	Name = "FE DEATH",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/sUcgGXkC"))()
end
})

Tab:AddButton({
	Name = "炸服（不要问我为什么加到这）",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/eU2wngHG"))()
end
})

Tab:AddButton({
	Name = "FE Giant AXE",
	Callback = function()
loadstring(game:HttpGet(('https://pastefy.ga/lrjtanrp/raw'),true))()
end
})

Tab:AddButton({
	Name = "FE Saitama",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/HgbE1e6E"))()
end
})

Tab:AddButton({
	Name = "FE giant eye",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/nXEnZrdH"))()
end
})

Tab:AddButton({
	Name = "FE帅气小刀刀",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/PTQQGkYG"))()
end
})

Tab:AddButton({
	Name = "FE月亮之刃",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/rTSxZGSQ"))()
end
})

Tab:AddButton({
	Name = "Among us（逆天）",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/f1LTmTPZ"))()
end
})

local Tab = Window:MakeTab({
  Name = "₪定制脚本",
  Icon = "rbxassetid://4483345998",
  PremiumOnly = false
  })

Tab:AddButton({
	Name = "tagu定制",
	Callback = function()
end
})

Tab:AddButton({
	Name = "电脑专用Evade",
	Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/9Strew/roblox/main/gamescripts/evade.lua'))()
end
})

Tab:AddButton({
	Name = "手机电脑通用Evade",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/Evade"))()
end
})

local Tab = Window:MakeTab({
	Name = "₪doors2",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "脚本doors",
	Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/whXp1Ca2"))()
  	end    
})

local Tab = Window:MakeTab({
  Name = "₪DOORS娱乐十字架(只对自己召唤的怪有用)",
  Icon = "rbxassetid://4483345998",
  PremiumOnly = false
})
Tab:AddButton({
  Name = "刷怪菜单",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shuaguai"))()
  end
})
Tab:AddButton({
	Name = "DOORS变身脚本",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/Public-Scripts/main/Morphing/MorphScript.lua"))();
end
}) 
Tab:AddButton({
  Name = "耶稣十字架",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shizi2"))()
  end
})
Tab:AddButton({
  Name = "紫光十字架",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shizi3"))()
  end
})
Tab:AddButton({
  Name = "万圣节十字架",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shizi4"))()
  end
})
Tab:AddButton({
  Name = "普通十字架",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/shizizhen"))()
  end
})

local Tab = Window:MakeTab({	Name = "₪公告/新的脚本在下面",	Icon = "rbxassetid://7734068321",	PremiumOnly = false})
Tab:AddButton({
	Name = "缝合！",
	Callback = function()
	setclipboard("3543438303")
end
})
Tab:AddButton({
	Name = "qq",
	Callback = function()
	setclipboard("1211373508")
end
})
Tab:AddParagraph("₪一个小公告ᴿᴼ̴ᴮᴸᴼ̴ˣ")
Tab:AddParagraph("制作：小凌")
Tab:AddParagraph("该脚本云端更新！")
Tab:AddParagraph("谢谢群里的《你猜 喵~》帮我测试")
Tab:AddParagraph("《一根葱是一个furry!!!》")
Tab:AddParagraph("大哥们V50看看实力(大哥如果没50就剪坤巴)")
Tab:AddParagraph("缝合大佬小凌")
Tab:AddParagraph("QB脚本对不起我不该骂你💔！！！")
Tab:AddParagraph("退休对不起我不该开源的💀")
about:AddParagraph("看得出来你是真心喜欢第五人格，有空我带带你吧，我现在五阶五，会在出刀时用飞轮，带你体验一下高端局。","")
about:AddParagraph("退休用一下你的页面UI嘿嘿","")
Tab:AddButton({
	Name = "小凌UwU",
	Callback = function()
end
})
Tab:AddButton({
	Name = "⭐阿凌.AEX⭐",
	Callback = function()
end
})
Tab:AddButton({
  Name = "doors汉化",
  Callback = function ()
    loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\54\53\84\119\84\56\106\97"))()
    
  end
})
Tab:AddButton({
  Name = "收养我吧",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/lf4d7/daphie/main/ame.lua"))()
    
  end
})
Tab:AddButton({
  Name = "doors中转站卡密：114514xhxh",
  Callback = function ()
    loadstring(game:HttpGet("https://shz.al/ySeKWSdaes8TiJbZTc2XzDiS"))()
    
  end
})
Tab:AddButton({
  Name = "小云doors",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/EntitySpawner/main/doors(orionlib).lua"))()
  end
})
Tab:AddButton({
  Name = "林脚本要白名(已破解)",
  Callback = function ()
    AL = "Advanced Logic团队破解"
loadstring(game:HttpGet("https://raw.githubusercontent.com/longshu886/longscript/main/linpojie"))()
  end
})
Tab:AddButton({
  Name = "HB中心(推荐)",
  Callback = function ()
    loadstring(game:HttpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,82,66,119,107,107,117,55,49})end)())))()
    
  end
})
Tab:AddButton({
  Name = "HB中心-Beta(推荐)",
  Callback = function ()
    loadstring(game:HttpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,86,83,89,71,99,122,78,115})end)())))()
    
  end
})
Tab:AddButton({
  Name = "导管中心(推荐)",
  Callback = function ()
 loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\117\115\101\114\97\110\101\119\114\102\102\47\114\111\98\108\111\120\45\47\109\97\105\110\47\37\69\54\37\57\68\37\65\49\37\69\54\37\65\67\37\66\69\37\69\53\37\56\68\37\56\70\37\69\56\37\65\69\37\65\69\34\41\41\40\41\10")()
    
  end
})
Tab:AddButton({
  Name = "剑客v4",
  Callback = function ()
    jianke_V4 = "作者_初夏"jianke__V4 = "作者QQ1412152634"jianke___V4 = "剑客QQ群347724155"loadstring(game:HttpGet(('https://shz.al/~JianKeV4')))()
    
  end
})
Tab:AddButton({
  Name = "脚本中心XC",
  Callback = function ()
    loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\103\101\109\120\72\119\65\49"))()
    
  end
})
Tab:AddButton({
  Name = "DOORS后门有源码",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/Scripts/main/mspaint/backdoor.lua"))()
  end
})
Tab:AddButton({
  Name = "微山doors1.0.4(可用)",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/weishanteam/Script/main/doors/WeiShan_Loader.lua"))()
  end
})
Tab:AddButton({
  Name = "IY5.5.9(指令挂)",
  Callback = function ()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
    
  end
})
Tab:AddButton({
  Name = "林霓脚本",
  Callback = function ()
    loadstring(game:HttpGet("https://shz.al/~LinnifreeScript"))()
    
  end
})
Tab:AddButton({
  Name = "脚本中心3",
  Callback = function ()
    loadstring(game:HttpGet("https://pastebin.com/raw/XhQpcE5m9"))()
    
  end
})
Tab:AddButton({
  Name = "XSC超牛逼脚本",
  Callback = function ()
    getgenv().XC="作者XC"loadstring(game:HttpGet("https://pastebin.com/raw/PAFzYx0F"))()
  end
})
Tab:AddButton({
  Name = "刺客脚本破解",
  Callback = function ()
    long = "刺客破解版"loadstring(game:HttpGet(('https://raw.githubusercontent.com/XT-CN/UwU/main/Cikefree')))()
  end
})
Tab:AddButton({
  Name = "SF脚本",
  Callback = function ()
    Cike_V2 = "作者_神罚"SheFa = "刺客群637340150"loadstring(game:HttpGet(('https://raw.githubusercontent.com/WDQi/SF/main/%E7%9C%8B%E4%BD%A0M.txt')))()
  end
})
Tab:AddButton({
  Name = "静新脚本修复",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/zuohongjian/bjb/main/jingxinjiaoben"))()
  end
})
Tab:AddButton({
  Name = "星云",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/%E5%85%B6%E4%BB%96%E5%9B%BD%E5%86%85%E8%84%9A%E6%9C%AC/%E6%98%9F%E7%A9%BA%E8%84%9A%E6%9C%AC/MoonSecV3.lua"))()
  end
})
Tab:AddButton({
  Name = "fofo",
  Callback = function ()
    loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\102\117\122\101\110\97\110\48\48\47\102\111\102\111\108\105\110\110\105\47\109\97\105\110\47\102\111\102\111\37\69\70\37\66\67\37\56\56\37\69\57\37\57\67\37\57\54\37\69\54\37\66\65\37\66\65\85\73\37\69\70\37\66\67\37\56\57\34\41\41\40\41")()
  end
})
Tab:AddButton({
  Name = "踏空脚本",
  Callback = function ()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
  end
})
Tab:AddParagraph("以后就更新1.4(云端更新学会了)")
Tab:AddParagraph("感谢小云教我云端更新mua~")
Tab:AddParagraph("呃呃呃")
Tab:AddButton({
  Name = "MSDOORS",
  Callback = function ()
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/mstudio45/MSDOORS/main/MSHUB_Loader.lua"),true))()

  end
})
Tab:AddButton({
  Name = "猫猫2.0",
  Callback = function ()
    getgenv().MAO = "猫猫王者脚本群935143896"loadstring(game:HttpGet("https://raw.githubusercontent.com/dkfkfkfjfkfjdj/longshu/main/%E6%B7%B7%E6%B7%86%E6%96%87%E4%BB%B6.lua"))()("猫猫脚本 V2.0")

  end
})
Tab:AddButton({
  Name = "不知名",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/Public-Scripts/main/Morphing/MorphScript.lua"))();

  end
})
Tab:AddButton({
  Name = "不知名",
  Callback = function ()
   loadstring(game:HttpGet("https://ayangwp.cn/api/v3/file/get/9281/m%E8%84%9A%E6%9C%AC%E4%BA%8C%E4%BB%A3.txt?sign=JBB6aabVopKLdV2EdLGV0RUN1kDDNLxk7fWCcbZlDkk%3D%3A0"))()

  end
})
Tab:AddButton({
  Name = "msdoors2.0",
  Callback = function ()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/mstudio45/MSDOORS/7bd97c2d956a775d683c2d7973d79715b30998ea/MSDOORS/Moonsec.lua'))()

  end
})
Tab:AddButton({
  Name = "青脚本1",
  Callback = function ()
    loadstring(game:HttpGet('https://rentry.co/ct293/raw'))()

  end
})
Tab:AddButton({
  Name = "青脚本2",
  Callback = function ()
    loadstring(game:HttpGet('https://rentry.co/cyq78/raw'))()

  end
})
Tab:AddButton({
  Name = "鲨脚本",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/sharksharksharkshark/shark-shark-shark-shark-shark/main/shark-scriptlollol.txt",true))()

  end
})
Tab:AddButton({
  Name = "白？",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/2dgeneralspam1/scripts-and-stuff/master/scripts/LoadstringUjHI6RQpz2o8", true))()

  end
})
Tab:AddButton({
  Name = "忍者ui？",
  Callback = function ()
    loadstring(game:HttpGet("https://pastebin.com/raw/2UjrXwTV"))()

  end
})
Tab:AddButton({
  Name = "FE半死不活",
  Callback = function ()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/PYXDYT/DinoBlox/main/FE Script'),true))()

  end
})
Tab:AddButton({
  Name = "说话ui",
  Callback = function ()
    loadstring(game:GetObjects("rbxassetid://1262435912")[1].Source)()

  end
})
Tab:AddButton({
  Name = "龙",
  Callback = function ()
    long = "龙脚本"qun = "群号:786515108"loadstring(game:HttpGet("https://raw.githubusercontent.com/longshulol/long/main/longshu/long"))()

  end
})
Tab:AddButton({
  Name = "小云伐木大亨",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CloudX-ScriptsWane/ScriptsDache/main/伐木大亨22.lua", true))()

  end
})
Tab:AddButton({
  Name = "云脚本？",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/LOL/main/云脚本Cloud script.lua", true))()

  end
})
Tab:AddButton({
  Name = "建船寻宝",
  Callback = function ()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/urmomjklol69/GoldFarmBabft/main/GoldFarm.lua'),true))()

  end
})
Tab:AddButton({
  Name = "战斗大亨Enginr",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/megamoeus/UI-Engine-V2/main/OWTPublic"))()
  end
})
Tab:AddButton({
  Name = "战斗大亨Chill HUB",
  Callback = function ()
   loadstring(game:HttpGet'https://raw.githubusercontent.com/Macintosh1983/ChillHubMain/main/ChillHubOilWarfareTycoon.lua')() 
  end
})
Tab:AddButton({
  Name = "河北唐县",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Sw1ndlerScripts/RobloxScripts/main/Tang%20Country.lua"))()
  end
})
Tab:AddButton({
  Name = "不知名",
  Callback = function ()
    loadstring(game:HttpGet(('https://pastefy.app/G2ewUbqj/raw'),true))()
  end
})
Tab:AddButton({
  Name = "吃掉世界hub",
  Callback = function ()
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/AppleScript001/Eat_World_Simulator/main/README.md"),true))()
  end
})
Tab:AddButton({
  Name = "战斗勇士",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/frkfx/Combat-Warriors/main/Script"))();
  end
})
Tab:AddButton({
  Name = "一路向西",
  Callback = function ()
    loadstring(game:HttpGetAsync("https://pastebin.com/raw/fYMnAEeJ"))()
  end
})
Tab:AddParagraph("球球 湘鲁 别吹更战争大亨了😭😭😭")
Tab:AddButton({
  Name = "披萨店内食物乱飞(厨师职业)",
  Callback = function ()
    -- Subscribe to ZhenX on Youtube
-- Credits to the owner of this Script

_G.cookroomfucker = true -- change to false and re execute if you wanna turn it off 
local lp = game:GetService("Players").LocalPlayer
local remote
local ffc = game.FindFirstChild

do
    local reg = (getreg or debug.getregistry)()
	for i=1,#reg do
		local f = reg[i]
		if type(f)=="table" and rawget(f,"FireServer") and rawget(f,"BindEvents") then
			remote = f
		end
	end
end

function moveThing(bmd, location)
    remote:FireServer("UpdateProperty", bmd, "CFrame", location)
    wait()
    remote:FireServer("SquishDough", bmd)
end

-- cook room fucker main script

for i,v in pairs(workspace.AllSupplyBoxes:GetChildren()) do
    v.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
end
wait()


spawn(function()
    while _G.cookroomfucker and wait() do
        spawn(function()
            for i,v in pairs(workspace.AllDough:GetChildren()) do
                moveThing(v, CFrame.new(Random.new():NextNumber(22.6,51.6),Random.new():NextNumber(3.6,14.6),Random.new():NextNumber(55.5,70.5)))
            end
        end)
        spawn(function()
            for i,v in pairs(workspace.AllMountainDew:GetChildren()) do
                moveThing(v, CFrame.new(Random.new():NextNumber(22.6,51.6),Random.new():NextNumber(3.6,14.6),Random.new():NextNumber(55.5,70.5)))
            end
        end)
        spawn(function()
            for i,v in pairs(workspace.BoxingRoom:GetChildren()) do
                moveThing(v, CFrame.new(Random.new():NextNumber(22.6,51.6),Random.new():NextNumber(3.6,14.6),Random.new():NextNumber(55.5,70.5)))
            end
        end)
        spawn(function()
            for i,v in pairs(workspace.AllBox:GetChildren()) do
                moveThing(v, CFrame.new(Random.new():NextNumber(22.6,51.6),Random.new():NextNumber(3.6,14.6),Random.new():NextNumber(55.5,70.5)))
            end
        end)
        spawn(function()
            for i,v in pairs(workspace.AllSupplyBoxes:GetChildren()) do
                moveThing(v, CFrame.new(Random.new():NextNumber(22.6,51.6),Random.new():NextNumber(3.6,14.6),Random.new():NextNumber(55.5,70.5)))
            end
        end)
    end
end)

spawn(function()
    while _G.cookroomfucker and wait() do
        for i,v in pairs(game:GetService("Workspace").Ovens:GetChildren()) do
            v.Door.ClickDetector.Detector:FireServer()
            wait(.15)
        end
    end
end)

  end
})
Tab:AddButton({
  Name = "最强战场",
  Callback = function ()
    loadstring(Game:HttpGet("https://pastefy.app/oKLqVHKF/raw"))()
  end
})
Tab:AddButton({
  Name = "地岩脚本",
  Callback = function ()
    loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\98\98\97\109\120\98\98\97\109\120\98\98\97\109\120\47\99\111\100\101\115\112\97\99\101\115\45\98\108\97\110\107\47\109\97\105\110\47\37\69\55\37\57\57\37\66\68\34\41\41\40\41")()
  end
})
Tab:AddButton({
  Name = "小星脚本",
  Callback = function ()
    loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\115\104\122\46\97\108\47\82\112\55\100\34\41\41\40\41\10")()
  end
})
Tab:AddButton({
  Name = "天脚本",
  Callback = function ()
    loadstring(game:HttpGet("https://shz.al/~xiaotianScript"))()
  end
})
Tab:AddButton({
  Name = "黑洞(E)",
  Callback = function ()
    local UserInputService = game:GetService("UserInputService")
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local Folder = Instance.new("Folder", game:GetService("Workspace"))
local Part = Instance.new("Part", Folder)
local Attachment1 = Instance.new("Attachment", Part)
Part.Anchored = true
Part.CanCollide = false
Part.Transparency = 1
local Updated = Mouse.Hit + Vector3.new(0, 5, 0)
local NetworkAccess = coroutine.create(function()
    settings().Physics.AllowSleep = false
    while game:GetService("RunService").RenderStepped:Wait() do
        for _, Players in next, game:GetService("Players"):GetPlayers() do
            if Players ~= game:GetService("Players").LocalPlayer then
                Players.MaximumSimulationRadius = 0 
                sethiddenproperty(Players, "SimulationRadius", 0) 
            end 
        end
        game:GetService("Players").LocalPlayer.MaximumSimulationRadius = math.pow(math.huge, math.huge)
        setsimulationradius(math.huge) 
    end 
end) 
coroutine.resume(NetworkAccess)

local function EnhanceAndInvinciblePart(part)
    if part:IsA("Part") and part.Anchored == false and part.Parent:FindFirstChild("Humanoid") == nil and part.Parent:FindFirstChild("Head") == nil and part.Name ~= "Handle" then
        Mouse.TargetFilter = part
        for _, x in next, part:GetChildren() do
            if x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or x:IsA("BodyThrust") or x:IsA("BodyVelocity") or x:IsA("RocketPropulsion") then
                x:Destroy()
            end
        end
        if part:FindFirstChild("Attachment") then
            part:FindFirstChild("Attachment"):Destroy()
        end
        if part:FindFirstChild("AlignPosition") then
            part:FindFirstChild("AlignPosition"):Destroy()
        end
        if part:FindFirstChild("Torque") then
            part:FindFirstChild("Torque"):Destroy()
        end
        part.CanCollide = false
        local Torque = Instance.new("Torque", part)
        Torque.Torque = Vector3.new(100000, 100000, 100000)
        local AlignPosition = Instance.new("AlignPosition", part)
        local Attachment2 = Instance.new("Attachment", part)
        Torque.Attachment0 = Attachment2
        AlignPosition.MaxForce = 9999999999999999
        AlignPosition.MaxVelocity = math.huge
        AlignPosition.Responsiveness = 200
        AlignPosition.Attachment0 = Attachment2 
        AlignPosition.Attachment1 = Attachment1
    end
end

for _, part in next, game:GetService("Workspace"):GetDescendants() do
    EnhanceAndInvinciblePart(part)
end

game:GetService("Workspace").DescendantAdded:Connect(function(part)
    EnhanceAndInvinciblePart(part)
end)

UserInputService.InputBegan:Connect(function(input, isProcessed)
    if input.KeyCode == Enum.KeyCode.E and not isProcessed then
       Updated = Mouse.Hit + Vector3.new(0, 5, 0)
    end
end)

spawn(function()
    while game:GetService("RunService").RenderStepped:Wait() do
        Attachment1.WorldCFrame = Updated
    end
end)
  end
})
Tab:AddButton({
  Name = "绿脚本",
  Callback = function ()
    loadstring(game:HttpGet("https://pastebin.com/raw/Esw6YQKR"))()
  end
})
Tab:AddButton({
  Name = "雷脚本",
  Callback = function ()
    loadstring(game:HttpGet(('https://pastebin.com/raw/tPB47inG')))()
  end
})
Tab:AddButton({
  Name = "冰脚本",
  Callback = function ()
    loadstring(game:HttpGet("https://pastebin.com/raw/GR4ChWKv"))()
  end
})
Tab:AddButton({
  Name = "俄亥(指令)",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/longshulol/long/main/longshu/Ohio"))()
  end
})
Tab:AddButton({
  Name = "巴掌",
  Callback = function ()
    loadstring(game:HttpGet("https://lkhub.net/s/loader.lua"))()
  end
})
Tab:AddButton({
  Name = "FE动作",
  Callback = function ()
    loadstring(game:HttpGet(('https://pastebin.com/raw/1p6xnBNf'),true))()
  end
})
Tab:AddButton({
  Name = "走路甩飞",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe./main/Fling%20GUI"))()
  end
})
Tab:AddButton({
  Name = "陈脚本",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MarkCX3/Mark/main/%E6%98%AF%E9%99%88"))()
  end
})
Tab:AddButton({
	Name = "点击复制陈脚本卡密",
	Callback = function()
	setclipboard("U2FsdGVkX1/gbhCW+xDOFYcV1pydxb/ni+9cAk72+WM=")
end
})
Tab:AddButton({
  Name = "猫猫脚本",
  Callback = function ()
   loadstring(game:HttpGet("https://ayangwp.cn/api/v3/file/get/9281/m%E8%84%9A%E6%9C%AC%E4%BA%8C%E4%BB%A3.txt?sign=JBB6aabVopKLdV2EdLGV0RUN1kDDNLxk7fWCcbZlDkk%3D%3A0"))() 
  end
})
Tab:AddButton({
	Name = "复制猫猫脚本卡密",
	Callback = function()
	setclipboard("猫王")
end
})
Tab:AddButton({
  Name = "皇脚本",
  Callback = function ()
    loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\80\100\84\55\99\65\82\84"))()
  end
})
Tab:AddButton({
  Name = "静新脚本",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/jxdjbx/gggggghjjnbb/main/jdjdd"))()
  end
})
Tab:AddButton({
  Name = "兵工厂",
  Callback = function ()
    function getplrsname()
for i,v in pairs(game:GetChildren()) do
if v.ClassName == "Players" then
return v.Name
end
end
end
local players = getplrsname()
local plr = game[players].LocalPlayer
coroutine.resume(coroutine.create(function()
while wait(1) do
coroutine.resume(coroutine.create(function()
for _,v in pairs(game[players]:GetPlayers()) do
if v.Name ~= plr.Name and v.Character then
v.Character.HeadHB.CanCollide = false
v.Character.HeadHB.Transparency = 10
v.Character.HeadHB.Size = Vector3.new(100,100,100)
v.Character.HumanoidRootPart.CanCollide = false
v.Character.HumanoidRootPart.Transparency = 10
v.Character.HumanoidRootPart.Size = Vector3.new(100,100,100)
end
end
end))
end
end))
function CreateSG(name,parent,face)
local SurfaceGui = Instance.new("SurfaceGui",parent)
SurfaceGui.Parent = parent
SurfaceGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
SurfaceGui.Face = Enum.NormalId[face]
SurfaceGui.LightInfluence = 0
SurfaceGui.ResetOnSpawn = false
SurfaceGui.Name = name
SurfaceGui.AlwaysOnTop = true
local Frame = Instance.new("Frame",SurfaceGui)
Frame.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
Frame.Size = UDim2.new(1,0,1,0)
end
while wait(1) do
for i,v in pairs (game:GetService("Players"):GetPlayers()) do
if v ~= game:GetService("Players").LocalPlayer and v.Character ~= nil and
v.Character:FindFirstChild("LowerTorso") and v.Character.LowerTorso:FindFirstChild("cham") == nil then
for i,v in pairs (v.Character:GetChildren()) do
if v:IsA("MeshPart") or v.Name == "LowerTorso" then
CreateSG("cham",v,"Back")
CreateSG("cham",v,"Front")
CreateSG("cham",v,"Left")
CreateSG("cham",v,"Right")
CreateSG("cham",v,"Right")
CreateSG("cham",v,"Top")
CreateSG("cham",v,"Bottom")
end
end
end
end
end
  end
})
Tab:AddButton({
  Name = "钉钉脚本(免费)",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/vvbnn/main/%E4%B8%81%E4%B8%81%E8%84%9A%E6%9C%AC%E9%98%89%E5%89%B2.txt"))()
  end
})
Tab:AddButton({
  Name = "空脚本",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BINjiaobzx6/BINjiao/main/%E7%A9%BA%E8%84%9A%E6%9C%AC666.txt"))()
  end
})
Tab:AddButton({
  Name = "皇脚本",
  Callback = function ()
    loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\80\100\84\55\99\65\82\84"))()
  end
})
Tab:AddButton({
	Name = "复制皇脚本卡密",
	Callback = function()
	setclipboard("U2FsdGVkX1/gbhCW+xDOFYcV1pydxb/ni+9cAk72+WM=")
end
})
Tab:AddButton({
  Name = "Tian脚本(需要白名单)",
  Callback = function ()
loadstring(game:HttpGet("https://raw.githubusercontent.com/LinAntian/TianV1/main/TianV1QQqun495186854"))()
  end
})
Tab:AddButton({
  Name = "不知名",
  Callback = function () loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\66\73\78\106\105\97\111\98\122\120\54\47\66\73\78\106\105\97\111\47\109\97\105\110\47\50\46\108\117\97\34\41\41\40\41\10")()
  end
})
Tab:AddButton({
  Name = "武脚本",
  Callback = function () loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\66\73\78\106\105\97\111\98\122\120\54\47\66\73\78\106\105\97\111\47\109\97\105\110\47\50\46\108\117\97\34\41\41\40\41\10")()
  end
})
Tab:AddParagraph("骗你的")
Tab:AddParagraph("每天一更")
Tab:AddButton({
  Name = "☯︎退休脚本☯︎",
  Callback = function ()
    TUIXUI="作者退休☯︎"JIAOBEN="永久免费缝合"qun="809771141"loadstring(game:HttpGet("https://pastebin.com/raw/yPhwFHy4"))()
  end
})
Tab:AddButton({
  Name = "情云脚本",
  Callback = function ()
    loadstring(utf8.char((function() return table.unpack({108,111,97,100,115,116,114,105,110,103,40,103,97,109,101,58,72,116,116,112,71,101,116,40,34,104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,67,104,105,110,97,81,89,47,45,47,109,97,105,110,47,37,69,54,37,56,51,37,56,53,37,69,52,37,66,65,37,57,49,46,108,117,97,34,41,41,40,41})end)()))()
  end
})
Tab:AddButton({
  Name = "河北唐县",
  Callback = function ()
    loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\80\100\84\55\99\65\82\84"))()
  end
})
Tab:AddButton({
  Name = "The Rake(小云☁)",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/Cloud-script/main/The%20Rake.lua"))()
  end
})
Tab:AddParagraph("这几天懒得更新了😂")

local Tab= Window:MakeTab({
	Name = "其他脚本",
	Icon = "rbxassetid://7733779610",
	PremiumOnly = false
})
Tab:AddButton({
  Name = "陈脚本",
  Callback = function () 
getgenv().long = "陈脚本，加载时间长请耐心"loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\68\50\57\110\56\122\67\105\34\41\41\40\41\10")()
  end
})
Tab:AddButton({
	Name = "复制陈脚本卡密",
	Callback = function()
	setclipboard("U2FsdGVkX1/gbhCW+xDOFYcV1pydxb/ni+9cAk72+WM=")
end
})
Tab:AddButton({
  Name = "导管中心无需协议👍",
  Callback = function ()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/useranewrff/roblox-/main/%E5%AF%BC%E7%AE%A1%E6%B7%B7%E6%B7%86.lua"))() 
  end
})
Tab:AddButton({
  Name = "斌脚本2.0小凌破解卡密",
  Callback = function () loadstring(game:HttpGet("https://raw.githubusercontent.com/BINjiaobzx6/BINjiao/main/bin%E6%96%8C%E8%84%9A%E6%9C%ACV2.0.0.txt"))()
  end
})
Tab:AddButton({
  Name = "情云脚本",
  Callback = function ()
    loadstring(utf8.char((function() return table.unpack({108,111,97,100,115,116,114,105,110,103,40,103,97,109,101,58,72,116,116,112,71,101,116,40,34,104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,67,104,105,110,97,81,89,47,45,47,109,97,105,110,47,37,69,54,37,56,51,37,56,53,37,69,52,37,66,65,37,57,49,34,41,41,40,41})end)()))()
  end
})
Tab:AddButton({
  Name = "白灰脚本",
  Callback = function ()
    _G.Clouduilib = "白灰脚作者小云，加载出十几秒"loadstring(game:HttpGet("https://raw.githubusercontent.com/CloudX-ScriptsWane/White-ash-script/main/%E7%99%BD%E7%81%B0%E8%84%9A%E6%9C%ACbeta.lua", true))()
  end
})
Tab:AddButton({
  Name = "浮萍中心",
  Callback = function () loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\34\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\69\55\97\57\84\56\65\109\34\41\40\41\10")()
  end
})
Tab:AddButton({
  Name = "北极中心",
  Callback = function ()
    loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\103\117\54\110\71\97\120\88"))()
  end
})
Tab:AddButton({
  Name = "LG脚本",
  Callback = function () loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\117\115\101\114\97\110\101\119\114\102\102\47\114\111\98\108\111\120\45\47\109\97\105\110\47\37\69\54\37\57\68\37\65\49\37\69\54\37\65\67\37\66\69\37\69\53\37\56\68\37\56\70\37\69\56\37\65\69\37\65\69\34\41\41\40\41\10")()
  end
})
Tab:AddButton({
  Name = "钢筋脚本1.0",
  Callback = function ()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Zyb150933/kk/main/%EF%BC%9F%EF%BC%81%EF%BC%81%EF%BC%81%EF%BC%9F%E3%80%82'))()
  end
})
Tab:AddButton({
  Name = "小魔脚本",
  Callback = function ()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaomoNB666/xiaomoNB666/main/%E6%9E%81.lua"))()  
  end
})
Tab:AddButton({
  Name = "走马观花🌸3.0",
  Callback = function () loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\65\115\121\110\99\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\65\88\88\68\79\71\47\86\73\80\47\109\97\105\110\47\232\181\176\233\169\172\232\167\130\232\138\177\86\51\65\46\108\117\97\34\41\41\40\41")('zhanghuihuihui#7211')  
  end
})

Tab:AddParagraph("不知道要不要卡密")

local Tab= Window:MakeTab({
	Name = "鲨,NN中心特供!",
	Icon = "rbxassetid://7733779610",
	PremiumOnly = false
})
Tab:AddButton({
  Name = "NN中心",
  Callback = function () loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\115\100\104\100\98\120\117\98\47\110\110\115\105\101\106\119\47\109\97\105\110\47\71\85\73\89\68\83\83\46\108\117\97\34\41\41\40\41\10")()
  end
})
Tab:AddParagraph("NN中心有中国最牛的doors")
Tab:AddButton({
  Name = "鲨脚本",
  Callback = function ()  loadstring(game:HttpGet("https://raw.githubusercontent.com/sharksharksharkshark/shark-shark-shark-shark-shark/main/shark-scriptlollol.txt",true))()
  end
})

Tab:AddButton({
  Name = "高亮",
  Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/4LDKiJ5a"))()
    end
})
local Tab= Window:MakeTab({
	Name = "犯罪率 家里 提供!",
	Icon = "rbxassetid://7733779610",
	PremiumOnly = false
})
Tab:AddButton({
  Name = "FemWare 电脑端",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/JackHiggly/FemWare/main/FemWare%20Alternative", true))()
  end
})
Tab:AddButton({
  Name = "FemWare 手机端",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GlobeReverse/Moonlight/main/Criminality.lua"))()
  end
})
Tab:AddButton({
  Name = "Moonlight-Hub",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GlobeReverse/Moonlight/main/Criminality.lua"))()
  end
})
Tab:AddParagraph("感谢QQ群里的《家里》提供!!!!")
Tab:AddParagraph("火速给他QQ点赞!!!")
local Tab = Window:MakeTab({
	Name = "驾驶帝国",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})
Tab:AddButton({
  Name = "Lightu-X(NEO)",
  Callback = function ()
   loadstring(game:HttpGet(('https://raw.githubusercontent.com/cool83birdcarfly02six/Lightux/main/README.md'),true))() 
  end
})
Tab:AddButton({
  Name = "Scienco HUB",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/drivingempire", true))()
  end
})
Tab:AddParagraph("群友提供")

local Tab= Window:MakeTab({
	Name = "小凌-执行器",
	Icon = "rbxassetid://7733779610",
	PremiumOnly = false
})
Tab:AddButton({
  Name = "Kato-UI",
  Callback = function ()  loadstring(game:HttpGet("https://raw.githubusercontent.com/flyspeed7/Xiao-Ling-Kato-Executer/main/Kato%E6%BA%90%E7%A0%81%E6%9C%80%E6%96%B0%EF%BC%88%E7%9C%9F%E7%9A%84%E6%B3%A8%E5%85%A5%E5%99%A8%EF%BC%89.txt"))()
  end
})
Tab:AddButton({
  Name = "Vega X-UI",
  Callback = function () loadstring(game:HttpGet("https://raw.githubusercontent.com/SPDM-Team/Arceus-X-NEO-public/main/Costumers/vegax.lua"))()
  end
})
Tab:AddButton({
  Name = "Code X-UI",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SPDM-Team/Arceus-X-NEO-public/main/Costumers/codex.lua"))()
  end
})
Tab:AddButton({
  Name = "Evon-UI",
  Callback = function ()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/SPDM-Team/Arceus-X-NEO-public/main/Costumers/evon.lua"))()
  end
})
Tab:AddButton({
  Name = "Code X-ios",
  Callback = function () loadstring(game:HttpGet("https://raw.githubusercontent.com/SPDM-Team/Arceus-X-NEO-public/main/Costumers/codex_ios.lua"))()
  end
})
Tab:AddButton({
  Name = "Tx3Xploit-UI",
  Callback = function () loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/Cloud-script/main/%E6%B3%A8%E5%85%A5%E5%99%A8"))()
  end
})
Tab:AddButton({
  Name = "Arceus X-UI",
  Callback = function () loadstring(game:HttpGet("https://raw.githubusercontent.com/flyspeed7/Xiao_Ling-Arceus.Executer/main/Arceus%20X%E6%BA%90%E7%A0%81.lua"))("小凌改Arceus X") 
  end
})
local Tab= Window:MakeTab({
	Name = "空脚本特供!(推荐)",
	Icon = "rbxassetid://7733779610",
	PremiumOnly = false
})
Tab:AddButton({
  Name = "空脚本最新(推荐)",
  Callback = function ()
   getgenv().LS="空脚本最新" loadstring(game:HttpGet("https://raw.githubusercontent.com/BINjiaobzx6/BINjiao/main/obf_8AT8q36zDJ1F59bRSuHJi8dH4kHcd8uJQaj7r5eKYwt0JjMt1MWdwdvdA26AG85U.lua"))() 
  end
})

Tab:AddButton({
  Name = "空脚本",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BINjiaobzx6/BINjiao/main/%E7%A9%BA%E8%84%9A%E6%9C%AC1.0.3.txt"))()
  end
})
Tab:AddButton({
  Name = "空,XSC合作脚本卡密：x或e或a",
  Callback = function ()
    getgenv().XC="作者XC"loadstring(game:HttpGet("https://pastebin.com/raw/PAFzYx0F"))()
  end
})
Tab:AddButton({
  Name = "空脚本3",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BINjiaobzx6/BINjiao/main/%E7%A9%BA%E8%84%9A%E6%9C%AC666.txt"))()
  end
})

local Tab= Window:MakeTab({
	Name = "林脚本破解版",
	Icon = "rbxassetid://7733779610",
	PremiumOnly = false
})
Tab:AddParagraph("SB林脚本还要付费")
Tab:AddParagraph("缝合脚本还付费龙叔不同意!")
Tab:AddButton({
  Name = "林脚本AL团队破解",
  Callback = function ()
    AL = "Advanced Logic团队破解"
loadstring(game:HttpGet("https://raw.githubusercontent.com/longshu886/longscript/main/linpojie"))()
  end
})
local Tab= Window:MakeTab({
	Name = "战争大亨全是改版",
	Icon = "rbxassetid://7733779610",
	PremiumOnly = false
})
Tab:AddButton({
  Name = "Tycoon-HUB",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Nivex123456/War-Tycoon/main/Script"))() 
  end
})
Tab:AddButton({
  Name = "WarTycoon-HUB",
  Callback = function ()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/MariyaFurmanova/Library/main/WarTycoon", true))() 
  end
})
Tab:AddButton({
  Name = "GN-HUB",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/nici002018/GNHub/master/GNHub.lua", true))()  
  end
})
Tab:AddButton({
  Name = "WaeSTycoon-Home",
  Callback = function ()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/MariyaFurmanova/Library/main/WarTycoon", true))()
  end
})
Tab:AddButton({
  Name = "WateedTucoon-HUB",
  Callback = function ()
     loadstring(game:HttpGet('https://raw.githubusercontent.com/ToraScript/Script/main/WarTycoon'))()
  end
})
Tab:AddButton({
  Name = "自动偷油桶?",
  Callback = function ()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1007, 46, -32.)
wait(0)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-986, 44, -29.)
wait(0)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-932, 44, -26.)
wait(0)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-908, 44, -26.)
wait(0)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-909, 46, -5.)
wait(0)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1006, 46, -5.)
wait(0)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-987, 44, -2.)
wait(0)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-908, 45, -6.)
wait(0)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-935, 46, -6.)
wait(0)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1028, 46, -49.)
wait(0)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1051, 46, -49.)
wait(0)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1050, 42, -69.)
wait(0)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1022, 43, -71.)
wait(0)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-998, 43, -68.)
wait(0)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-973, 43, -69.)
wait(0)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-969, 44, -91.)
wait(0)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-994, 45, -88.)
wait(0)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1025, 47, -10.)
wait(0)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1083, 47, -118.)
wait(0)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1080, 45, -138.)
wait(0)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1053, 43, -140.)
wait(0)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1057, 47, -118.)
wait(0)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-996, 44, -150.)
wait(0)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-972, 47, -150.)
wait(0)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-976, 49, -127.)
wait(0)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-915, 44, -125.)
wait(0)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-887, 43, -126.)
wait(0)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-890, 45, -105.)
wait(0)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-916, 46, -104.)
wait(0)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1001, 49, -129.)
wait(0)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1026, 47, -10.)
wait(0)
  end
})
Tab:AddButton({
  Name = "改版Tycoon",
  Callback = function ()
   loadstring(gameHttpGet(httpsraw.githubusercontent.comNivex123456War-TycoonmainScript))() 
  end
})
Tab:AddButton({
  Name = "Oilwarfare-HUB",
  Callback = function ()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Vortex194/main/main/oilwarfare", true))() 
  end
})
Tab:AddButton({
  Name = "Owartycoon-HUB",
  Callback = function ()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0wartycoon", true))() 
  end
})
Tab:AddButton({
  Name = "EngineV2-HUB",
  Callback = function ()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/megamoeus/UI-Engine-V2/main/OWTPublic"))()
  end
})
Tab:AddParagraph("由Krx提供")

local Tab= Window:MakeTab({
	Name = "汽车破坏机",
	Icon = "rbxassetid://7733779610",
	PremiumOnly = false
})
Tab:AddButton({
  Name = "T7ERd3e8脚本",
  Callback = function ()
   loadstring(game:HttpGet('https://pastebin.com/raw/T7ERd3e8'))() 
  end
})
Tab:AddButton({
  Name = "Saucekid(Plus)",
  Callback = function ()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/saucekid/scripts/main/CarCrushers.lua"))()
  end
})
Tab:AddButton({
  Name = "电脑OP通用",
  Callback = function ()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/saucekid/scripts/main/CarCrushers.lua"))()
  end
})
Tab:AddParagraph("脚本由〔湘鲁)安心c屎版提供〕")
local Tab= Window:MakeTab({
	Name = "俄亥俄州",
	Icon = "rbxassetid://7733779610",
	PremiumOnly = false
})
Tab:AddButton({
  Name = "Rxn.xyz-HUB",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/rxn-xyz/Ohio./main/Ohio.lua",true))()
  end
})
Tab:AddButton({
  Name = "神奇的指令",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/longshulol/long/main/longshu/Ohio"))()
  end
})
Tab:AddButton({
  Name = "HkvHeHed-HUB",
  Callback = function ()
    loadstring(game:HttpGet("https://pastebin.com/raw/hkvHeHed",true))()
  end
})
Tab:AddButton({
  Name = "剑客工作室",
  Callback = function ()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/jiankeQWQ/jiankeV3/main/ehaiezhou"))()
  end
})
Tab:AddParagraph("功能自己猜")

local Tab= Window:MakeTab({
	Name = "勇气与黑火药G＆B",
	Icon = "rbxassetid://7733779610",
	PremiumOnly = false
})
Tab:AddButton({
  Name = "清风-劳大版",
  Callback = function () loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\34\104\116\116\112\115\58\47\47\102\114\101\101\110\111\116\101\46\98\105\122\47\114\97\119\47\109\117\122\110\104\101\114\104\114\117\34\41\44\116\114\117\101\41\41\40\41\10")()
  end
})
Tab:AddButton({
  Name = "清风原版",
  Callback = function () loadstring(game:HttpGet(("\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\115\120\99\115\114\49\49\52\53\49\52\47\115\120\99\115\114\49\49\52\53\49\52\49\47\109\97\105\110\47\115\120\99\115\114\49\51\52\56\52\56\52\56\56\46\108\117\97"),true))()
  end
})
