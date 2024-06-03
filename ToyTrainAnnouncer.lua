--[[ 
Wondering if there is a way to auto-find the offsets for spell/item IDs and update them "on-the-go" when the plugin is loading. 
It's possible with the Source Engine, but Blizz' API sucks even more imo. Soon™.

Note to self: It should be able to, I think. Depends what Blizzard lets you do with the files inside of the /addons folder.
Possible breach detected xd
]]

-- Create a frame for the addon
local ToyTrainDetector = CreateFrame("Frame")

-- Define the Toy Train Set spell ID - Don't wanna hardcode it... at least yet.
local TOY_TRAIN_SPELL_ID = 61031

-- Register the UNIT_SPELLCAST_SUCCEEDED event to detect when the spell is successfully cast
ToyTrainDetector:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")

-- Event handler function
ToyTrainDetector:SetScript("OnEvent", function(self, event, unitID, _, spellID)
	if spellID == TOY_TRAIN_SPELL_ID then
		local playerName = UnitName(unitID)
		if playerName then
			-- Send a chat message to the party channel
			SendChatMessage("Toy Train Set placed by: " .. playerName, "PARTY")
		end
	end
end)
