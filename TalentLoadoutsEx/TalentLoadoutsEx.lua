TLX = {};
TalentLoadoutsEx = TalentLoadoutsEx or {};

-- For C_Traits.GetNodeInfo() Issue
-- Node IDs in this list are always treated as single-choice talents.
-- https://www.curseforge.com/wow/addons/talent-loadout-ex#c34
local singleEntryNodeIDs = {
	[76180] = true, -- Unholy Pact(Unholy DK)
};

local InitTable = function()
	local localizedClass, englishClass, classIndex = UnitClass("player");
	TalentLoadoutsEx[englishClass] = TalentLoadoutsEx[englishClass] or {};

	local currentSpec = GetSpecialization();
	TalentLoadoutsEx[englishClass][currentSpec] = TalentLoadoutsEx[englishClass][currentSpec] or {};

	return englishClass, currentSpec;
end

local GetNodeIDs = function(configID, treeID)
	local nodeOrder = {};
	for i, nodeID in pairs(C_Traits.GetTreeNodes(treeID)) do
		local nodeInfo = C_Traits.GetNodeInfo(configID, nodeID);
		if nodeInfo.isVisible then
			table.insert(nodeOrder, {nodeInfo.posY, nodeInfo.posX, nodeID});
		end
	end

	table.sort(
		nodeOrder,
		function(a, b)
			if a[1] ~= b[1] then
				return a[1] < b[1]
			else
				return a[2] < b[2]
			end
		end
	)

	local nodeIDs = {};
	for i, node in ipairs(nodeOrder) do
		table.insert(nodeIDs, node[3]);
	end

	return nodeIDs;
end

local prefix = "TLX_Updated";
C_ChatInfo.RegisterAddonMessagePrefix(prefix);

TLX.SendUpdateMessage = function()
	local message = prefix;
	C_ChatInfo.SendAddonMessage(prefix, message, "whisper", UnitName("player"));
end

TLX.DeleteConfig = function(option)
	if ClassTalentFrame:IsShown() and option and #option > 0 then
		local englishClass, currentSpec = InitTable();
		if TalentLoadoutsEx[englishClass][currentSpec][option] then
			TalentLoadoutsEx[englishClass][currentSpec][option] = nil;
			TLX.SendUpdateMessage();
		end
	end
end

TLX.GetConfig = function(option)
	if option and #option > 0 then
		local englishClass, currentSpec = InitTable();
		return TalentLoadoutsEx[englishClass][currentSpec][option];
	else
		return TLX.GetRanks();
	end
end

TLX.GetRanks = function(isActive)
	local configID = C_ClassTalents.GetActiveConfigID();
	if configID == nil then
		return nil;
	end

	local config = "";
	local configInfo = C_Traits.GetConfigInfo(configID);
	for i, nodeID in pairs(GetNodeIDs(configID, configInfo.treeIDs[1])) do
		local nodeInfo = C_Traits.GetNodeInfo(configID, nodeID);
		local state = isActive and nodeInfo.currentRank or nodeInfo.activeRank;
		if state > 0 and not singleEntryNodeIDs[nodeID] and #nodeInfo.entryIDs > 1 then
			local entryID = nodeInfo.activeEntry.entryID;
			if isActive then
				entryID = nodeInfo.entryIDsWithCommittedRanks[1];
			end

			if nodeInfo.entryIDs[1] == entryID then
				state = 1;
			else
				state = 2;
			end
		end

		config = config..state;
	end

	for i, pvpTalentID in pairs(C_SpecializationInfo.GetAllSelectedPvpTalentIDs()) do
		config = config.."@"..pvpTalentID;
	end

	return config;
end

TLX.LoadConfig = function(option)
	local configID = C_ClassTalents.GetActiveConfigID();
	if configID == nil then
		return false;
	end

	local configInfo = C_Traits.GetConfigInfo(configID);
	local treeID = configInfo.treeIDs[1];

	if option and #option > 0 then
		local config = TLX.GetConfig(option);
		if config then
			local talentInfo = {};
			for text in config:gmatch("([^@]+)") do
				table.insert(talentInfo, text);
			end

			-- Class/Spec
			if talentInfo[1] then
				C_Traits.ResetTree(configID, treeID);
				for i, nodeID in pairs(GetNodeIDs(configID, treeID)) do
					if i > #talentInfo[1] then
						break;
					end

					local state = tonumber(talentInfo[1]:sub(i, i));
					if state > 0 then
						local nodeInfo = C_Traits.GetNodeInfo(configID, nodeID);
						if not singleEntryNodeIDs[nodeID] and #nodeInfo.entryIDs > 1 then
							C_Traits.SetSelection(configID, nodeID, nodeInfo.entryIDs[state]);
						else
							for j = 1, state do
								C_Traits.PurchaseRank(configID, nodeID);
							end
						end
					end
				end
			end

			-- PvP
			if #talentInfo > 1 then
				local isUIErrorsFrameShown = UIErrorsFrame:IsShown();
				if isUIErrorsFrameShown then
					UIErrorsFrame:Hide();
					C_Timer.After(
						1,
						function()
							UIErrorsFrame:Clear();
							UIErrorsFrame:Show();
						end
					);
				end

				LearnPvpTalent = LearnPvpTalent;
				unpack = unpack;

				local pvpTalentID1, pvpTalentID2, pvpTalentID3 = unpack(talentInfo, 2);
				LearnPvpTalent(tonumber(pvpTalentID3 or pvpTalentID1), 3);
				LearnPvpTalent(tonumber(pvpTalentID2 or pvpTalentID1), 2);
				LearnPvpTalent(tonumber(pvpTalentID1), 1);
			end

			return true;
		end
	end

	return false;
end

TLX.SaveConfig = function(option)
	if ClassTalentFrame:IsShown() and option and #option > 0 then
		local englishClass, currentSpec = InitTable();
		TalentLoadoutsEx[englishClass][currentSpec][option] = TLX.GetConfig();
		TLX.SendUpdateMessage();
	end
end

SlashCmdList["TLX"] = function(msg)
	local config = SecureCmdOptionParse(msg);
	if TLX.LoadConfig(config) then
		print("|cff00ff00Talent Loadout Ex|r: Successfully loaded: |cff00ffff"..config.."|r");
		ClassTalentFrame.TalentsTab:CommitConfig();
	end
end

SLASH_TLX1 = "/tlx";
