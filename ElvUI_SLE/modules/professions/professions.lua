local SLE, T, E, L, V, P, G = unpack(ElvUI_SLE)
local Pr = SLE.Professions

--GLOBALS: unpack, select, LoadAddOn, IsAddOnLoaded
local _G = _G
local GetSpellInfo, IsSpellKnown = GetSpellInfo, IsSpellKnown
local IsNPCCrafting = C_TradeSkillUI.IsNPCCrafting
local IsTradeSkillGuild = C_TradeSkillUI.IsTradeSkillGuild
local IsTradeSkillGuildMember = C_TradeSkillUI.IsTradeSkillGuildMember
local IsTradeSkillLinked = C_TradeSkillUI.IsTradeSkillLinked

Pr.baseTradeSkills = {
	Alchemy = 171,
	Archeology = 794,
	Blacksmithing = 164,
	Cooking = 185,
	Enchanting = 333,
	Engineering = 202,
	FirstAid = 129,
	Fishing = 356,
	Herbalism = 182,
	Inscription = 773,
	Jewelcrafting = 755,
	Leatherworking = 165,
	Mining = 186,
	Skinning = 393,
	Tailoring = 197,
}

function Pr:UpdateSkills(event)
	if event ~= 'CHAT_MSG_SKILL' then
		Pr.DEname, Pr.LOCKname, Pr.SMITHname = false, false, false

		if(IsSpellKnown(13262)) then Pr.DEname = GetSpellInfo(13262) end -- Enchant
		if(IsSpellKnown(1804)) then Pr.LOCKname = GetSpellInfo(1804) end -- Lockpicking
		if(IsSpellKnown(25229)) then Pr.PROSPECTname = GetSpellInfo(25229) end -- Jewelcrating (Prospecting)
		if(IsSpellKnown(45357)) then Pr.MILLname = GetSpellInfo(45357) end -- Inscription (Milling)
	end
end

function Pr:IsSkillMine()
	if IsNPCCrafting() then return false end
	if IsTradeSkillGuild() then return false end
	if IsTradeSkillGuildMember() then return false end
	if IsTradeSkillLinked() then return false end
	return true
end

function Pr:Initialize()
	if not SLE.initialized then return end

	if not IsAddOnLoaded('Blizzard_TradeSkillUI') then LoadAddOn('Blizzard_TradeSkillUI') end
	--Next line is to fix other guys' code cause they feel like being assholes and morons
	-- if SLE._Compatibility["TradeSkillMaster"] and not TradeSkillFrame.RecipeList.collapsedCategories then TradeSkillFrame.RecipeList.collapsedCategories = {} end
	Pr:UpdateSkills()

	Pr:EnchantButton()

	self:RegisterEvent('CHAT_MSG_SKILL', 'UpdateSkills')

	if E.private.sle.professions.deconButton.enable then Pr:InitializeDeconstruct() end
	if E.private.sle.professions.fishing.EasyCast then Pr:FishingInitialize() end
end
SLE:RegisterModule('Professions')
