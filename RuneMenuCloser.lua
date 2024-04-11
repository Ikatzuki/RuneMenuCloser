-- Create a frame for handling the OnShow event
local frame = CreateFrame("Frame")

-- List of frames to hook
local framesToHook = {
    "CharacterFrame",
    "ReputationFrame",
    "SkillFrame",
    "HonorFrame"
    -- Add more frame names here as needed
}

-- Function to perform the action
local function onClick()
    if RuneFrameControlButton then
        RuneFrameControlButton:Click()
    end
end

-- Set up the OnShow hook for multiple frames
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function(self, event, ...)
    for _, frameName in ipairs(framesToHook) do
        local targetFrame = _G[frameName]
        if targetFrame then
            targetFrame:HookScript("OnShow", onClick)
        end
    end
end)
