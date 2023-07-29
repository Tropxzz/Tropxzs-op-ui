
local sadasdasdasdas8da90sd8sad798a6sd7sa68d7 = Instance.new("ScreenGui", game.CoreGui)
sadasdasdasdas8da90sd8sad798a6sd7sa68d7.Name = "Atlas"

if game.CoreGui.Atlas then
	game.CoreGui.Atlas:Destroy()
end

local Atlas = loadstring(game:HttpGet("https://siegehub.net/Atlas.lua"))()
local UI = Atlas.new({
	Name = "Tropxz's op ui - Da hood modded"; -- script name (required)
	ConfigFolder = "TOP-ON-TOp"; -- folder name to save configs to, set this to nil if you want to disable configs saving
	Credit = "Made By tropx__z#0"; -- text to appear if player presses the "i" button on their UI (optional)
	Color = Color3.fromRGB(255,255,255); -- theme color for UI (required)
	Bind = "LeftControl"; -- keybind for toggling the UI, must be a valid KeyCode name
	-- Atlas Loader:
	UseLoader = false; -- whether to use Atlas Loader or not, if set to false than CheckKey and Discord are ignored
	FullName = "My Script Hub"; -- works if UseLoader is set to true, can be same as Name argument, shown on loader frame
})

-- Tabs
local Ho = UI:CreatePage("Home") -- creates a page
local T = UI:CreatePage("Teleport") -- creates a page\
local Pl = UI:CreatePage("Player") -- creates a page\
local M = UI:CreatePage("Misc") -- creates a page\
local S = UI:CreatePage("Settings") -- creates a page\
-- Sections
local HomeS = Ho:CreateSection("Main")
local TS = T:CreateSection("Main")
local PlS = Pl:CreateSection("Main")
local MS = M:CreateSection("Main")
local SS = S:CreateSection("Main")
-- Player
local p = game.Players.LocalPlayer
local c = p.Character
local h = c.Humanoid
local hrp = c.HumanoidRootPart
local LocalPlayer = p
-- Tables
local players = {}
local uis = {}
local remotes = {}
local connections = {}
local houses = {
	CFrame.new(-298.23642, 330.652527, -208.210114, -0.671361685, 3.27546061e-08, 0.741129875, 5.13948208e-08, 1, 2.36113373e-09, -0.741129875, 3.96754132e-08, -0.671361685), 
	CFrame.new(-269.865845, 330.147491, -212.899292, 0.415382534, -1.9325558e-08, -0.909646809, -8.72599593e-09, 1, -2.52297738e-08, 0.909646809, 1.84175821e-08, 0.415382534), 
	CFrame.new(-1151.34485, 330.147491, -338.33963, 0.0498556904, 6.95128861e-08, 0.998756409, -2.92454305e-09, 1, -6.94534492e-08, -0.998756409, 5.41743483e-10, 0.0498556904), -- hotel
	CFrame.new(-1052.95691, 330.654236, -267.598175, -0.179751024, 3.348962e-08, -0.983712137, 5.05526643e-08, 1, 2.48067771e-08, 0.983712137, -4.52702231e-08, -0.179751024),
	CFrame.new(-1072.1051, 330.654236, -239.123077, -0.990114629, -4.51087487e-08, 0.140260711, -4.70440611e-08, 1, -1.04823616e-08, -0.140260711, -1.69771734e-08, -0.990114629),
	CFrame.new(-1109.62341, 330.735748, -136.574371, -0.873721123, 2.33744291e-09, 0.486427128, -4.60062433e-10, 1, -5.63169467e-09, -0.486427128, -5.14431742e-09, -0.873721123),
	CFrame.new(-1107.86523, 330.654327, -73.7731476, 0.600871265, 6.41669899e-08, 0.799345791, -1.28609043e-08, 1, -7.0606788e-08, -0.799345791, 3.21452802e-08, 0.600871265),
	CFrame.new(-1153.84717, 330.654327, -61.9971466, -0.292688012, -3.40159438e-08, 0.956207991, -4.48210269e-09, 1, 3.42018538e-08, -0.956207991, 5.72465098e-09, -0.292688012),
	CFrame.new(-1280.04321, 330.654327, -10.7147913, -0.219322652, -1.06360645e-07, 0.975652397, -3.20570237e-08, 1, 1.0180861e-07, -0.975652397, -8.9475769e-09, -0.219322652),
	CFrame.new(-182.966904, 330.647491, 82.2873764, -0.998533905, -7.01015246e-09, 0.0541302077, -3.36039996e-09, 1, 6.75164458e-08, -0.0541302077, 6.72355611e-08, -0.998533905)
}

-- Varibles
local sped = 16
local JP = 50
local Request = (syn and syn.request) or (http and http.request) or (http_request) or (fluxus and fluxus.request) or (request)
local localplayer
local animation2
local animation
local animation3
local animation4
local hover = "rbxassetid://"
local plr = game.Players.LocalPlayer
local fly = "rbxassetid://"
local r = "rbxassetid://"
local l = "rbxassetid://"
local character
local loader
local loader2
local loader3
local loader4
local L_143_
local L_144_
local flying
local L_147_
local L_148_
local L_149_
local L_150_
-- Aimbot Stuff
_G.AimbotEnabled = true
_G.TeamCheck = false -- If set to true then the script would only lock your aim at enemy team members.
_G.AimPart = "Head" -- Where the aimbot script would lock at.
_G.Sensitivity = 0 -- How many seconds it takes for the aimbot script to officially lock onto the target's aimpart.

-- Sum Services
local runService = game:GetService("RunService")
local client = p
local https = game:GetService("HttpService")
local TweenService = game.TweenService
local Camera = workspace.CurrentCamera
local Players = game.Players
local UserInputService = game.UserInputService
-- dum functions

local function GetClosestPlayer()
	local MaximumDistance = math.huge
	local Target = nil

	local function ResetMaximumDistance()
		wait(20)
		MaximumDistance = math.huge
	end

	for _, v in next, Players:GetPlayers() do
		if v.Name ~= LocalPlayer.Name then
			if _G.TeamCheck == true then
				if v.Team ~= LocalPlayer.Team then
					if v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
						local ScreenPoint = Camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
						local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude

						if VectorDistance < MaximumDistance then
							Target = v
							MaximumDistance = VectorDistance
						end
					end
				end
			else
				if v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
					local ScreenPoint = Camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
					local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude

					if VectorDistance < MaximumDistance then
						Target = v
						MaximumDistance = VectorDistance
					end
				end
			end
		end
	end

	spawn(ResetMaximumDistance)

	return Target
end


local function findPlayerByShortenedName(shortName)
	local lowerShortName = shortName:lower()  -- Convert the input to lowercase for case-insensitivity
	for _, player in pairs(game.Players:GetPlayers()) do
		local lowerFullName = player.Name:lower()
		if lowerFullName:sub(1, #lowerShortName) == lowerShortName then
			return player
		end
	end
	return nil
end

local function getRootPart()
	local character = client.Character or client.CharacterAdded:Wait()

	return character:WaitForChild("HumanoidRootPart")
end

local function choose1(tab)
	return tab[math.random(1, #tab)] -- Select a random element from the table
end

local function teleport(cframe)
	local rootPart = getRootPart()

	connections["Heartbeat"] = runService.Heartbeat:Connect(function()
		local oldVelocity = rootPart.Velocity

		rootPart.Velocity = Vector3.new(0, -550, 0)
		runService.RenderStepped:Wait()
		rootPart.Velocity = oldVelocity

		task.wait(.4)
		connections["Heartbeat"]:Disconnect()
	end)

	task.wait(.2)
	rootPart.CFrame = cframe
end

-- Main Home Functions
HomeS:CreateButton({
	Name = "Hi "..tostring(game.Players.LocalPlayer).." Welcome to my UI"; -- required: name of element
	Callback = function() -- required: function to be called when button is pressed
		print("Button pressed!")
	end
})

-- Main functions for teleport

TS:CreateButton({
	Name = "Teleport to"..' "Dabank"';
	Callback = function()
		teleport(CFrame.new(-387,330,-77))
	end,
})

TS:CreateButton({
	Name = "Teleport to"..' "Revolver"';
	Callback = function()
		teleport(game:GetService("Workspace").Ignored.Shop.Guns["[Revolver] - $1600"].Head.CFrame)
	end,
})

TS:CreateButton({
	Name = "Teleport to"..' "PopCorn"';
	Callback = function()
		teleport(game:GetService("Workspace").Ignored.Shop.Others["[Popcorn] - $3"].Head.CFrame)
	end,
})
-- 

TS:CreateButton({
	Name = "Teleport to"..' "the gun store"';
	Callback = function()
		teleport(CFrame.new(-566, 317.212189, -546, 1, 0, 0, 0, 1, 0, 0, 0, 1))
	end,
})


TS:CreateButton({
	Name = "Teleport to"..' "Double Barrel SG"';
	Callback = function()
		teleport(game:GetService("Workspace").Ignored.Shop.Guns["[Double Barrel SG] - $800"].Head.CFrame)
	end,
})

TS:CreateButton({
	Name = "Teleport to"..' "A random h0use"';
	Callback = function()
		teleport(choose1(houses))
	end,
})

TS:CreateButton({
	Name = "Teleport to"..' "The motel"';
	Callback = function()
		teleport(CFrame.new(-1151.34485, 330.147491, -338.33963, 0.0498556904, 6.95128861e-08, 0.998756409, -2.92454305e-09, 1, -6.94534492e-08, -0.998756409, 5.41743483e-10, 0.0498556904))
	end,
})	

TS:CreateButton({
	Name = "Teleport to"..' "The FireStation"';
	Callback = function()
		teleport(CFrame.new(-105.564941, 336.709015, 89.1277847, 0.77449429, -2.50230361e-08, 0.632580876, 6.10276558e-08, 1, -3.51615626e-08, -0.632580876, 6.58373551e-08, 0.77449429))
	end,
})	

-- plr
PlS:CreateTextBox({
	Name = "Speed"; -- required: name of element
	Flag = "Sped"; -- required: unique flag name to use
	Callback = function(inputtedText,enterPressed) -- function to be called when the textbox's focus is lost
		sped = tonumber(inputtedText)
	end;
	DefaultText = "16"; -- required: text that will be in the textbox when there is no configurations saved or config saving is disabled
	PlaceholderText = "Numbers"; -- optional: placeholder text that will show when no text is written
	ClearTextOnFocus = true; -- optional: whether to clear text when the textbox is focused, default is false
	-- Scroll to the bottom of the page to read more about the following two:
	Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
	WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})


PlS:CreateButton({
	Name = "Set speed"; -- required: name of element
	Callback = function() -- required: function to be called when button is pressed
		h.WalkSpeed = sped
	end
})

PlS:CreateTextBox({
	Name = "JumpPower"; -- required: name of element
	Flag = "IlovePrimeOMFGistgifyouraskidiwillkillya"; -- required: unique flag name to use
	Callback = function(inputtedText,enterPressed) -- function to be called when the textbox's focus is lost
		JP = tonumber(inputtedText)
	end;
	DefaultText = "50"; -- required: text that will be in the textbox when there is no configurations saved or config saving is disabled
	PlaceholderText = "Numbers"; -- optional: placeholder text that will show when no text is written
	ClearTextOnFocus = true; -- optional: whether to clear text when the textbox is focused, default is false
	-- Scroll to the bottom of the page to read more about the following two:
	Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
	WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})


PlS:CreateButton({
	Name = "Set Jumppower"; -- required: name of element
	Callback = function() -- required: function to be called when button is pressed
		h.JumpPower = JP
	end
})

PlS:CreateButton({
	Name = "Lock First person"; -- required: name of element
	Callback = function() -- required: function to be called when button is pressed
		p.CameraMode = Enum.CameraMode.LockFirstPerson
	end
})

PlS:CreateButton({
	Name = "Classic"; -- required: name of element
	Callback = function() -- required: function to be called when button is pressed
		p.CameraMode = Enum.CameraMode.Classic
	end
})

PlS:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
	Name = "Fly"; -- required: name of element
	Flag = "Flying"; -- required: unique flag name to use
	Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
	Callback = function(newValue) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
		if newValue then
			localplayer = game.Players.LocalPlayer
			animation2 = Instance.new("Animation")
			animation = Instance.new("Animation")
			animation3 = Instance.new("Animation")
			animation4 = Instance.new("Animation")
			hover = "rbxassetid://"
			plr = game.Players.LocalPlayer
			fly = "rbxassetid://"
			r = "rbxassetid://"
			l = "rbxassetid://"
			character = plr.Character
			animation.AnimationId = fly
			animation2.AnimationId = hover
			animation3.AnimationId = r
			animation4.AnimationId = l
			loader = character:WaitForChild("Humanoid"):LoadAnimation(animation)
			loader2 = character:WaitForChild("Humanoid"):LoadAnimation(animation2)
			loader3 = character:WaitForChild("Humanoid"):LoadAnimation(animation3)
			loader4 = character:WaitForChild("Humanoid"):LoadAnimation(animation4)
			L_143_ = game.Players.LocalPlayer
			L_144_ = L_143_:GetMouse()
			localplayer = L_143_
			if workspace:FindFirstChild("Core") then
				workspace.Core:Destroy()
			end
			local L_145_ = Instance.new("Part")
			L_145_.Name = "Core"
			L_145_.Size = Vector3.new(0.05, 0.05, 0.05)
			spawn(
				function()
					L_145_.Parent = workspace
					local L_152_ = Instance.new("Weld", L_145_)
					L_152_.Part0 = L_145_
					L_152_.Part1 = localplayer.Character.LowerTorso
					L_152_.C0 = CFrame.new(0, 0, 0)
				end
			)
			workspace:WaitForChild("Core")
			local L_146_ = workspace.Core
			flying = true
			L_147_ = 10
			L_148_ = {
				a = false,
				d = false,
				w = false,
				s = false
			}

			L_149_ =
				L_144_.KeyDown:connect(
					function(L_156_arg0)
						if not L_146_ or not L_146_.Parent then
						flying = false
						L_149_:disconnect()
						L_150_:disconnect()
						return
					end
						if L_156_arg0 == "x" then
						if flying == true then
							flying = false
							loader:Play()
							loader:Stop()
							-- hover
							loader2:Play()
							loader2:Stop()
						else
							flying = true
							local animation3 = Instance.new("Animation")
							local r = "rbxassetid://9798901178"
							animation3.AnimationId = r
							local loader3111 = character:WaitForChild("Humanoid"):LoadAnimation(animation3)
							loader3111:Play()
							wait(3)
							loader:Play()
							loader:Stop()
							-- hover
							loader2:Play()
							L_151_func()
						end
					elseif L_156_arg0 == "w" then
						if flying == true then
							L_148_.w = true
							loader2:Play()
							loader2:Stop()
							loader:Play()
							loader2:Play()
							-- fly
							loader2:Stop()
						end
					elseif L_156_arg0 == "s" then
						L_148_.s = true
						if flying == true then
							loader2:Play()
							loader2:Stop()
							loader:Play()
							loader2:Play()
							loader2:Stop()
						end
					elseif L_156_arg0 == "a" then
						L_148_.a = true
						if flying == true then
							loader:Play()
							loader:Stop()
							loader2:Play()
							loader2:Stop()
							loader3:Play()
							loader4:Play()
							loader4:Stop()
						end
					elseif L_156_arg0 == "d" then
						L_148_.d = true
						if flying == true then
							loader:Play()
							loader:Stop()
							loader2:Play()
							loader2:Stop()
							loader3:Play()
							loader3:Stop()
							loader4:Play()
						end
					end
					end
				)

			L_150_ =
				L_144_.KeyUp:connect(
					function(L_157_arg0)
						if L_157_arg0 == "w" then
						L_148_.w = false
						wait()
						if flying == true then
							loader:Play()
							--]]
							loader:Stop()
							-- hover
							loader3:Play()
							loader3:Stop()
							loader4:Play()
							loader4:Stop()
							loader2:Play()
						end
					elseif L_157_arg0 == "s" then
						L_148_.s = false
						if flying == true then
							loader:Play()
							loader:Stop()
							-- hover
							loader2:Play()
							loader3:Play()
							loader3:Stop()
							loader4:Play()
							loader4:Stop()
						end
					elseif L_157_arg0 == "a" then
						L_148_.a = false
						if flying == true then
							loader:Play()
							loader:Stop()
							loader2:Play()
							loader3:Play()
							loader3:Stop()
							loader4:Play()
							loader4:Stop()
						end
					elseif L_157_arg0 == "d" then
						L_148_.d = false
						if flying == true then
							loader:Play()
							loader:Stop()
							loader2:Play()
							loader3:Play()
							loader3:Stop()
							loader4:Play()
							loader4:Stop()
						end
					end
					end
				)

			local function L_151_func()
				local L_153_ = Instance.new("BodyPosition", L_146_)
				local L_154_ = Instance.new("BodyGyro", L_146_)
				L_153_.Name = "EPIXPOS"
				L_153_.maxForce = Vector3.new(math.huge, math.huge, math.huge)
				L_153_.position = L_146_.Position
				L_154_.maxTorque = Vector3.new(9e9, 9e9, 9e9)
				L_154_.cframe = L_146_.CFrame
				repeat
					wait()
					localplayer.Character.Humanoid.PlatformStand = true
					local L_155_ = L_154_.cframe - L_154_.cframe.p + L_153_.position
					if not L_148_.w and not L_148_.s and not L_148_.a and not L_148_.d then
						L_147_ = 10
					end
					if L_148_.w then
						L_155_ = L_155_ + workspace.CurrentCamera.CoordinateFrame.lookVector * L_147_
						L_147_ = L_147_ + 0
					end
					if L_148_.s then
						L_155_ = L_155_ - workspace.CurrentCamera.CoordinateFrame.lookVector * L_147_
						L_147_ = L_147_ + 0
					end
					if L_148_.d then
						L_155_ = L_155_ * CFrame.new(L_147_, 0, 0)
						L_147_ = L_147_ + 0
					end
					if L_148_.a then
						L_155_ = L_155_ * CFrame.new(-L_147_, 0, 0)
						L_147_ = L_147_ + 0
					end
					if L_147_ > 10 then
						L_147_ = 10
					end
					L_153_.position = L_155_.p
					if L_148_.w then
						L_154_.cframe =
							workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad(L_147_ * 0), 0, 0)
					elseif L_148_.s then
						L_154_.cframe =
							workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(math.rad(L_147_ * 0), 0, 0)
					else
						L_154_.cframe = workspace.CurrentCamera.CoordinateFrame
					end
				until flying == false
				if L_154_ then
					L_154_:Destroy()
				end
				if L_153_ then
					L_153_:Destroy()
				end
				flying = false
				localplayer.Character.Humanoid.PlatformStand = false
				L_147_ = 25
			end

			L_151_func()
		else
			flying = false
			L_149_:Disconnect()
			L_150_:Disconnect()
			localplayer.Character.Humanoid.PlatformStand = false
			if workspace:FindFirstChild("Core") then
				workspace.Core:Destroy()
			end
			-- Additional cleanup code...
			if loader then
				loader:Stop()
				loader:Destroy()
			end
			if loader2 then
				loader2:Stop()
				loader2:Destroy()
			end
			if loader3 then
				loader3:Stop()
				loader3:Destroy()
			end
			if loader4 then
				loader4:Stop()
				loader4:Destroy()
			end
			if character then
				character.Humanoid.PlatformStand = false
			end
			if workspace:FindFirstChild("Core") then
				workspace.Core:Destroy()
			end
		end
	end;
	-- Scroll to the bottom of the page to read more about the following two:
	Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
	WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})

-- Misc

MS:CreateButton({
	Name = "Get all Guns"; -- required: name of element
	Callback = function() -- required: function to be called when button is pressed
		teleport(CFrame.new(-1015,330,-49))
		fireclickdetector(game:GetService("Workspace").Ignored.Shop.Guns["[Double Barrel SG] - $800"].ClickDetector)
		fireclickdetector(game:GetService("Workspace").Ignored.Shop.Guns["[Deagle] - $750"].ClickDetector)
		task.wait(0.1)
		teleport(CFrame.new(-613,329,90))
		fireclickdetector(game:GetService("Workspace").Ignored.Shop.Guns["[Revolver] - $1600"].ClickDetector)
		task.wait(.1)
		teleport(CFrame.new(-568,317,-536))
		fireclickdetector(game:GetService("Workspace").Ignored.Shop.Guns["[UMP] - $1100"].ClickDetector)
		fireclickdetector(game:GetService("Workspace").Ignored.Shop.Guns["[Sniper] - $2000"].ClickDetector)
		fireclickdetector(game:GetService("Workspace").Ignored.Shop.Guns["[SilencerAR] - $1550"].ClickDetector)
		task.wait(.1)
		teleport(CFrame.new(-566,317,-546))
		fireclickdetector(game:GetService("Workspace").Ignored.Shop.Guns["[AR] - $1350"].ClickDetector)
		fireclickdetector(game:GetService("Workspace").Ignored.Shop.Guns["[P90] - $1000"].ClickDetector)
		fireclickdetector(game:GetService("Workspace").Ignored.Shop.Guns["[AK-47] - $2250"].ClickDetector)
	end
})

MS:CreateButton({
	Name = "Get Sturdy",
	Callback = function()
		local A_1 = "Emote"
		local A_2 = "Getting Sturdy"
		local Event = game:GetService("ReplicatedStorage").MainRemote
		Event:FireServer(A_1, A_2)
	end,
})

MS:CreateButton({
	Name = "Pray",
	Callback = function()
		local A_1 = "Emote"
		local A_2 = "Pray"
		local Event = game:GetService("ReplicatedStorage").MainRemote
		Event:FireServer(A_1, A_2)
	end,
})

MS:CreateTextBox({
	Name = "Tp to plr";
	Flag = "Uh";
	Callback = function(inputtedText, enterPressed)
		local player = findPlayerByShortenedName(inputtedText)
		if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			teleport(player.Character.HumanoidRootPart.CFrame)
		else
			print("Player not found or missing HumanoidRootPart.")
		end
	end;
	DefaultText = "Enter plr name";
	PlaceholderText = "Plr name";
	ClearTextOnFocus = false;
})

MS:CreateToggle({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
	Name = "Aimbot"; -- required: name of element
	Flag = "BestAimBotInTownBitches"; -- required: unique flag name to use
	Default = false; -- optional: default value for toggle, will be used if config saving is disabled and there is no saved data, will be false if left nil
	Callback = function(v) -- optional: function that will be called when toggled, it is reccomended to modify flags directly
		_G.AimbotEnabled = v
		while _G.AimbotEnabled == true do
			local closestPlayer = GetClosestPlayer()
			if closestPlayer then
				local aimPartPosition = closestPlayer.Character[_G.AimPart].Position
				local aimCFrame = CFrame.new(Camera.CFrame.Position, aimPartPosition)
				TweenService:Create(Camera, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = aimCFrame}):Play()
			end
			wait(0.3)
		end
	end;
	-- Scroll to the bottom of the page to read more about the following two:
	Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
	WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
})
