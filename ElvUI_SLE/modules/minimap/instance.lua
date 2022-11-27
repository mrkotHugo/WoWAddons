local SLE, T, E, L, V, P, G = unpack(select(2, ...))
local I = SLE.InstDif

--GLOBALS: CreateFrame
local _G = _G
local format = format
local sub = string.utf8sub
local GetDifficultyInfo = GetDifficultyInfo

local InstanceDifficulty = _G.MinimapCluster.InstanceDifficulty
local Instance = InstanceDifficulty.Instance
local ChallengeMode = InstanceDifficulty.ChallengeMode
local Guild = InstanceDifficulty.Guild

local Difficulties = {
	[1] = 'normal', --5ppl normal
	[2] = 'heroic', --5ppl heroic
	[3] = 'normal', --10ppl raid
	[4] = 'normal', --25ppl raid
	[5] = 'heroic', --10ppl heroic raid
	[6] = 'heroic', --25ppl heroic raid
	[7] = 'lfr', --25ppl LFR
	[8] = 'challenge', --5ppl challenge
	[9] = 'normal', --40ppl raid
	[11] = 'heroic', --Heroic scenario
	[12] = 'normal', --Normal scenario
	[14] = 'normal', --10-30ppl normal
	[15] = 'heroic', --13-30ppl heroic
	[16] = 'mythic', --20ppl mythic
	[17] = 'lfr', --10-30 LFR
	[23] = 'mythic', --5ppl mythic
	[24] = 'time', --Timewalking
}

function I:CreateText()
	I.frame = CreateFrame('Frame', 'SL_MinimapDifficultyFrame', _G.Minimap)
	I.frame:Size(50, 20)
	I.frame.text = I.frame:CreateFontString(nil, 'OVERLAY')
	I.frame.text:SetPoint('CENTER', I.frame, 'CENTER')
	I.frame.icon = I.frame:CreateFontString(nil, 'OVERLAY')
	I.frame.icon:SetPoint('LEFT', I.frame.text, 'RIGHT', 4, 0)

	self:SetFonts()
end

function I:SetFonts()
	I.frame.text:SetFont(E.LSM:Fetch('font', E.db.sle.minimap.instance.font), E.db.sle.minimap.instance.fontSize, E.db.sle.minimap.instance.fontOutline)
	I.frame.icon:SetFont(E.LSM:Fetch('font', E.db.sle.minimap.instance.font), E.db.sle.minimap.instance.fontSize, E.db.sle.minimap.instance.fontOutline)
end


function I:InstanceCheck()
	local isInstance, InstanseType = IsInInstance()
	local show = false
	if isInstance and InstanseType ~= 'pvp' and InstanseType ~= 'arena' then show = true end
	return show
end

function I:GuildEmblem()
	-- table
	local char = {}
	-- check if Blizzard_GuildUI is loaded
	-- if not IsAddOnLoaded("Blizzard_GuildUI") then LoadAddOn("Blizzard_GuildUI") end
	if Guild then
		char.guildTexCoord = {Guild.Emblem:GetTexCoord()}
	else
		char.guildTexCoord = false
	end
	if char.guildTexCoord and IsInGuild() then
		return '|TInterface\\GuildFrame\\GuildEmblemsLG_01:24:24:-4:1:32:32:'..(char.guildTexCoord[1]*32)..':'..(char.guildTexCoord[7]*32)..':'..(char.guildTexCoord[2]*32)..':'..(char.guildTexCoord[8]*32)..'|t'
	else
		return ''
	end
end

function I:UpdateFrame()
	local db = I.db
	I.frame:Point('TOPLEFT', _G.Minimap, 'TOPLEFT', db.xoffset, db.yoffset)
	I:SetFonts()
	if db.enable then
		I.frame.text:Show()
		I.frame.icon:Show()
	else
		I.frame.text:Hide()
		I.frame.icon:Hide()
	end
end

function I:GetColor(dif)
	if dif and Difficulties[dif] then
		local color = E.db.sle.minimap.instance.colors[Difficulties[dif]]
		return color.r*255, color.g*255, color.b*255
	else
		return 255, 255, 255
	end
end

function I:GenerateText(_, guild)
	I.frame.icon:SetText('')

	if not I:InstanceCheck() then
		I.frame.text:SetText('')
	else
		local text, isHeroic, isChallengeMode
		local groupType, difficulty, difficultyName, _, _, _, _, instanceGroupSize = select(2, GetInstanceInfo())
		isHeroic, isChallengeMode = select(3, GetDifficultyInfo(difficulty))
		local r, g, b = I:GetColor(difficulty)

		if (difficulty >= 3 and difficulty <= 7) or difficulty == 9 or E.db.sle.minimap.instance.onlyNumber then
			text = format('|cff%02x%02x%02x%s|r', r, g, b, instanceGroupSize)
		else
			difficultyName = sub(difficultyName, 1 , 1)
			text = format(instanceGroupSize..' |cff%02x%02x%02x%s|r', r, g, b, difficultyName)
		end

		I.frame.text:SetText(text)
		-- guild = true
		if (guild) and not isChallengeMode then
			local logo = I:GuildEmblem()
			I.frame.icon:SetText(logo)
		end
		Instance:Hide()
		ChallengeMode:Hide()
		Guild:Hide()

		if not I.db.enable then
			if not Instance:IsShown() and (groupType == 'raid' or isHeroic) and not guild then
				Instance:Show()
				ChallengeMode:Hide()
				Guild:Hide()
			elseif not ChallengeMode:IsShown() and isChallengeMode and not guild then
				Instance:Hide()
				ChallengeMode:Show()
				Guild:Hide()
			elseif guild then
				Instance:Hide()
				ChallengeMode:Hide()
				Guild:Show()
			end
		end
	end
	I:UpdateFrame()
end

function I:Initialize()
	if not SLE.initialized or not E.private.general.minimap.enable then return end

	I.db = E.db.sle.minimap.instance
	I:CreateText()

	Instance:HookScript('OnShow', function(frame) if I.db.enable then frame:Hide() end end)
	Guild:HookScript('OnShow', function(frame) if I.db.enable then frame:Hide() end end)
	ChallengeMode:HookScript('OnShow', function(frame) if I.db.enable then frame:Hide() end end)

	I:RegisterEvent('LOADING_SCREEN_DISABLED', 'GenerateText')
	I:RegisterEvent('GROUP_ROSTER_UPDATE', 'GenerateText')
	I:RegisterEvent('GUILD_PARTY_STATE_UPDATED', 'GenerateText')
	I:UpdateFrame()

	hooksecurefunc(MinimapCluster.InstanceDifficulty, 'Update', I.GenerateText)

	function I:ForUpdateAll()
		I.db = E.db.sle.minimap.instance
		I:UpdateFrame()
	end
end

SLE:RegisterModule(I:GetName())
