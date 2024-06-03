ToyTrainDetector = CreateFrame("Frame")
ToyTrainDetectorSuccess = CreateFrame("Frame")

local toyTrainSpellID = 61031

ToyTrainDetector:RegisterEvent("UNIT_SPELLCAST_START")
ToyTrainDetectorSuccess:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")

ToyTrainDetector:SetScript("OnEvent", function(self, event, ...)
	local unitID, _, spellID = ...
	if spellID == toyTrainSpellID then
		local playerName = UnitName(unitID)

		--print("Debug: " .. playerName .. " started casting Toy Train Set (Spell ID: " .. spellID .. ")")

		SendChatMessage("Detected Toy Train Set cast by: " .. playerName, "PARTY")
	end
end)

ToyTrainDetectorSuccess:SetScript("OnEvent", function(self, event, ...)
	local unitID, _, spellID = ...
	if spellID == toyTrainSpellID then
		local playerName = UnitName(unitID)
		SendChatMessage("Toy Train Set placed by: " .. playerName, "PARTY")
	end
end)