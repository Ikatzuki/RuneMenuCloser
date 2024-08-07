-- Create a frame for handling the OnShow event
local frame = CreateFrame("Frame")

-- List of frames to hook
local framesToHook = {
    "CharacterFrame",
    "ReputationFrame",
    "SkillFrame",
    "HonorFrame"
}

-- Function to perform the action
local function onClick()
    if RuneFrameControlButton then
        RuneFrameControlButton:Click()
    end
end

-- Function to handle tab changes
local function onTabClick(self)
    onClick()
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
    
    -- Hook tab buttons if they exist
    if CharacterFrameTab1 then
        CharacterFrameTab1:HookScript("OnClick", onTabClick)
    end
    if CharacterFrameTab3 then
        CharacterFrameTab3:HookScript("OnClick", onTabClick)
    end
    if CharacterFrameTab4 then
        CharacterFrameTab4:HookScript("OnClick", onTabClick)
    end
    if CharacterFrameTab5 then
        CharacterFrameTab5:HookScript("OnClick", onTabClick)
    end
end)
