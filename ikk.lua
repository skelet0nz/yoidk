game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "fr bro";
	Text = "you wont be able to sync so dont try tha!!";
	Duration = 20;
	Button1 = "waaaa";
})

---frr

game.Players.LocalPlayer.PlayerScripts.SyncClient:Destroy()
wait()
game.Players.LocalPlayer.PlayerGui.EmoteUI:Destroy()

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local TextButton = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Frame.Parent = ScreenGui
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.Position = UDim2.new(0.100000001, 0, 0.5, 0)
Frame.Size = UDim2.new(0.200000003, 0, 0.5, 0)

ScrollingFrame.Parent = Frame
ScrollingFrame.Active = true
ScrollingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
ScrollingFrame.Size = UDim2.new(1, 0, 1, 0)

UIListLayout.Parent = ScrollingFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

TextButton.Parent = game.StarterGui.ScreenGui.LocalScript
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.Size = UDim2.new(1, 0, 0.100000001, 0)
TextButton.Font = Enum.Font.SourceSans
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true

-- Scripts:

local function QTCGR_fake_script() -- ScreenGui.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui)

	local Template = script.TextButton
	
	for i,v in pairs(game:GetService("ReplicatedFirst").LocalEmoteData:GetChildren()) do 
		local Clone = Template:Clone()
		Clone.Text = v.Name
		Clone.Name = v.Name
		Clone.MouseButton1Down:Connect(function()
			game:GetService("ReplicatedStorage").EmoteSystemEvent:FireServer("DoEmote",Clone.Name)
		end)
		Clone.Parent = script.Parent.Frame.ScrollingFrame
	end
end
coroutine.wrap(QTCGR_fake_script)()
