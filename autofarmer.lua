local player = game.Players.LocalPlayer
local buttons = {
    -- Specify the buttons you want to teleport to here
    game.Workspace.Lifebricks["1"],
    game.Workspace.Lifebricks["2"],
    game.Workspace.Lifebricks["3"],
    game.Workspace.Lifebricks["4"]
}

local startTime = tick()  -- Record the start time

local currentLifebrickIndex = 1  -- Start teleporting to the first Lifebrick

-- Function to get the executor name
local function getExecutorName()
    return syn and syn.executor.name or "Unknown"
end

while true do
    local executorName = getexecutorname()
    if executorName == "Solara" or executorName == "Solara ALPHA" or executorName == "Wave" or executorName == "Wave 5.0" then
        if currentLifebrickIndex > #buttons then
            currentLifebrickIndex = 1  -- Reset to the first Lifebrick if all have been visited
        end
        
        local currentButton = buttons[currentLifebrickIndex]
        
        if currentButton and currentButton:IsA("BasePart") then
            -- Teleport the player to the current Lifebrick
            player.Character:SetPrimaryPartCFrame(currentButton.CFrame)
            wait(1)  -- Wait for 4 seconds before teleporting to the next Lifebrick
        end
        
        currentLifebrickIndex = currentLifebrickIndex + 1  -- Move to the next Lifebrick
        wait(1)  -- Wait for 3 seconds before teleporting to the next Lifebrick
        
        -- Check if 25 seconds have passed
        if tick() - startTime > 11 then
            -- Set player's health to 0
            player.Character:FindFirstChild("Humanoid").Health = 0
            -- Reset the start time to continue the loop
            startTime = tick()
            wait(1)  -- Wait for 6 seconds before teleporting again
        end
    else
        print("Executor not supported!")
        break  -- End the script
    end
end
