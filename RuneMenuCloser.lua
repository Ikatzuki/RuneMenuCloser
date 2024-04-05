-- Create a frame for handling the OnShow event
local frame = CreateFrame("Frame")

-- Set up the OnShow hook for the CharacterFrame
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function(self, event, ...)
    if CharacterFrame then
        CharacterFrame:HookScript("OnShow", function()
            -- Perform the action you want when the CharacterFrame is shown
            if RuneFrameControlButton then
                RuneFrameControlButton:Click()
            end
        end)
    end
end)
