local zoom = 140
local FOV = 7
local zoomincrement = 10
local maxzoom = 150
local minzoom = 35

local Player = game.Players.LocalPlayer
local Mouse = Player:GetMouse()
local UIS = game:GetService("UserInputService")
local Character = Player.Character or Player.CharacterAdded:Wait()
local camera = game.Workspace.CurrentCamera
camera.CameraType = Enum.CameraType.Custom

Player.CameraMinZoomDistance = 5

local RunService = game:GetService("RunService")
RunService.RenderStepped:Connect(function()
	camera.FieldOfView = FOV
	if Character then
		if Character:FindFirstChild("Head") then
			game:GetService("SoundService"):SetListener(Enum.ListenerType.ObjectCFrame, Character.Head)
			camera.CFrame =
				CFrame.new(Vector3.new(Character.Head.Position.X + zoom, Character.Head.Position.Y + zoom, Character.Head.Position.Z + zoom), Character.Head.Position)
		end
	end
end)
--Zoom in/Zoom out
Mouse.WheelForward:Connect(function()
	if zoom > minzoom then
		zoom -= zoomincrement
	end
end)
Mouse.WheelBackward:Connect(function()
	if zoom < maxzoom then
		zoom += zoomincrement
	end
end)