local userinput = game:GetService("UserInput")
local character = script.Parent:FindFirstChild("Humanoid") -- Replace "script.Parent" with the character if needed

local sprintSpeed = 26 -- Adjust this value to your desired sprint speed (default walk speed is 16)
local isSprinting = false

local function toggleSprint()
  isSprinting = not isSprinting
  character.WalkSpeed = isSprinting and sprintSpeed or 16
end

-- UI Button Setup (replace with your actual button object)
local sprintButton = script.Parent:FindFirstChild("sprintToggle") -- Change this to match your button name

if sprintButton then
  sprintButton.MouseButton1Click:Connect(toggleSprint)
end

userinput.KeyDown:Connect(function(key) -- Listen for key press for alternative control
  if key.KeyCode == Enum.KeyCode.LeftShift or key.KeyCode == Enum.KeyCode.RightShift then
    toggleSprint()
  end
end)
