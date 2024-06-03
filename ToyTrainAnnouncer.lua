local ToyTrainDetector = CreateFrame("Frame")
local ToyTrainSpellID = 61031

--ToyTrainDetector:RegisterEvent("UNIT_SPELLCAST_START")
ToyTrainDetector:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")

ToyTrainDetector:SetScript("OnEvent", function(self, event, unitID, _, spellID)
	if spellID == ToyTrainSpellID then
		local playerName = UnitName(unitID)
		--if event == "UNIT_SPELLCAST_START" then
			--SendChatMessage("Detected Toy Train Set cast by: " .. playerName, "PARTY")
		if event == "UNIT_SPELLCAST_SUCCEEDED" then
			SendChatMessage("Toy Train Set placed by: " .. playerName, "PARTY")
		end
	end
end)
