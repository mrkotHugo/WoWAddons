TLX.AddonName = ...;
TLX.Frame = TLX.Frame or {};
TLX.ConfigButton = TLX.ConfigButton or {};
TLX.Popup = TLX.Popup or {};

TalentLoadoutsExGUI = TalentLoadoutsExGUI or {};

local STRIPE_COLOR = {r=0.9, g=0.9, b=1};
local DEFAUALT_ICON = 134400;

local InitTable = function()
	local localizedClass, englishClass, classIndex = UnitClass("player");
	local currentSpec = GetSpecialization();

	TalentLoadoutsEx[englishClass] = TalentLoadoutsEx[englishClass] or {};
	TalentLoadoutsEx[englishClass][currentSpec] = TalentLoadoutsEx[englishClass][currentSpec] or {};

	TalentLoadoutsExGUI[englishClass] = TalentLoadoutsExGUI[englishClass] or {};
	TalentLoadoutsExGUI[englishClass][currentSpec] = TalentLoadoutsExGUI[englishClass][currentSpec] or {};

	return englishClass, currentSpec;
end

local isMatchConfig = function(name)
	local currentConfig = TLX.GetConfig();
	local buttonConfig = TLX.GetConfig(name);
	if not (buttonConfig or ""):match("@") then
		currentConfig = (currentConfig or ""):gsub("@.*", "");
	end

	return buttonConfig and currentConfig and buttonConfig == currentConfig;
end

local InitButton = function(button, elementData)
	if elementData.addSetButton then
		button.name = nil;
		button.text:SetText("Add Config");
		button.text:SetTextColor(GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b);
		button.icon:SetTexture("Interface\\PaperDollInfoFrame\\Character-Plus");
		button.icon:SetSize(30, 30);
		button.icon:SetPoint("LEFT", 7, 0);
		button.Check:Hide();
		button.SelectedBar:Hide();
	else
		local index = elementData.index;
		local icon = elementData.value.icon;
		button.index = index;
		button.name = elementData.value.name;
		button.text:SetText(button.name);
		button.text:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
		button.icon:SetTexture(icon);
		button.icon:SetSize(36, 36);
		button.icon:SetPoint("LEFT", 4, 0);

		if (index % 2 == 0) then
			button.Stripe:SetColorTexture(STRIPE_COLOR.r, STRIPE_COLOR.g, STRIPE_COLOR.b);
			button.Stripe:SetAlpha(0.1);
			button.Stripe:Show();
		else
			button.Stripe:Hide();
		end

		if isMatchConfig(button.name) then
			button.Check:Show();
		else
			button.Check:Hide();
		end
	end
end

TLX.GetConfigIcon = function(name)
	local englishClass, currentSpec = InitTable();
	for index, value in ipairs(TalentLoadoutsExGUI[englishClass][currentSpec]) do
		if name == value.name then
			return value.icon;
		end
	end

	return nil;
end

TLX.GetCurrent = function()
	local config = TLX.GetRanks(true);
	local englishClass, currentSpec = InitTable();
	for index, value in ipairs(TalentLoadoutsExGUI[englishClass][currentSpec]) do
		local name = value.name;
		local icon = value.icon;
		if config == TalentLoadoutsEx[englishClass][currentSpec][name] then
			return {["name"] = name, ["icon"] = icon};
		end
	end
	
	return nil;
end

TLX.Frame.OnLoad = function(self)
	self:RegisterEvent("TRAIT_NODE_CHANGED");
	self:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED");
	local view = CreateScrollBoxListLinearView();
	view:SetElementInitializer("TlxListButtonTemplate", InitButton)
	view:SetPadding(0,0,3,0,2);
	ScrollUtil.InitScrollBoxListWithScrollBar(self.ScrollBox, self.ScrollBar, view);
end

local UpdateList = function(englishClass, currentSpec, defaultIcon)
	if englishClass == nil or currentSpec == nil then
		return;
	end

	local currentList = {};
	local currentNameList = {};
	for key, value in pairs(TalentLoadoutsExGUI[englishClass][currentSpec]) do
		table.insert(currentList, value);
		currentNameList[value.name] = true;
	end

	TalentLoadoutsExGUI[englishClass][currentSpec] = {};
	for key, value in ipairs(currentList) do
		if TalentLoadoutsEx[englishClass][currentSpec][value.name] then
			table.insert(TalentLoadoutsExGUI[englishClass][currentSpec], value);
		end
	end

	for name in pairs(TalentLoadoutsEx[englishClass][currentSpec]) do
		if not currentNameList[name] then
			table.insert(TalentLoadoutsExGUI[englishClass][currentSpec], {name=name, icon=defaultIcon});
		end
	end
end

local IsExistsConfig = function(name)
	local englishClass, currentSpec = InitTable();
	for key, value in pairs(TalentLoadoutsExGUI[englishClass][currentSpec]) do
		if value.name == name then
			return true;
		end
	end

	return false;
end

local UpdateConfig = function(origName, name, icon)
	local englishClass, currentSpec = InitTable();
	if origName ~= name then
		local config = TalentLoadoutsEx[englishClass][currentSpec][origName];
		TalentLoadoutsEx[englishClass][currentSpec][name] = config;
		TalentLoadoutsEx[englishClass][currentSpec][origName] = nil;
	end

	for key, value in pairs(TalentLoadoutsExGUI[englishClass][currentSpec]) do
		if value.name == origName then
			value.name = name;
			value.icon = icon;
		end
	end

	TLX.SendUpdateMessage();
end

local UpdateSelected = function()
	TlxFrame.ScrollBox:ForEachFrame(
		function(button)
			if TLX.Frame.SelectedIndex and TLX.Frame.SelectedIndex == button.index then
				button.HighlightBar:Show();
			else
				button.HighlightBar:Hide();
			end
		end
	);
end

TLX.Frame.Update = function(icon)
	local englishClass, currentSpec = InitTable();
	UpdateList(englishClass, currentSpec, icon or DEFAUALT_ICON);

	local dataProvider = CreateDataProvider();
	for index, value in ipairs(TalentLoadoutsExGUI[englishClass][currentSpec]) do
		dataProvider:Insert({index=index, value=value});
	end

	dataProvider:Insert({addSetButton=true}); -- Add New Config Button

	TlxFrame.ScrollBox:SetDataProvider(dataProvider, ScrollBoxConstants.RetainScrollPosition);
end

TLX.Frame.UpdateDelay = 0.1
TLX.Frame.LastRequestUpdateTime = nil;
TLX.Frame.RequestUpdate = function()
	local now = GetTime();
	local last = TLX.Frame.LastRequestUpdateTime;
	if last and now - last < TLX.Frame.UpdateDelay then
		return;
	end
	TLX.Frame.LastRequestUpdateTime = now;

	C_Timer.After(TLX.Frame.UpdateDelay, TLX.Frame.Update);
end

TLX.Frame.OnLoadButtonClick = function()
	if TLX.Frame.SelectedName then
		TLX.LoadConfig(TLX.Frame.SelectedName);
		TLX.Frame.Update();
	end
end

TLX.Frame.OnSaveButtonClick = function()
	local name = TLX.Frame.SelectedName;
	if name then
		local dialog = StaticPopup_Show("TLX_CONFIRM_SAVE_CONFIG", name);
		if dialog then
			dialog.name = name;
		end
	end
end

TLX.Frame.OnEditButtonClick = function()
	local name = TLX.Frame.SelectedName;
	if name then
		local icon = TLX.Frame.SelectedIcon;
		TlxFrame.PopupFrame.name = name;
		TlxFrame.PopupFrame.origName = name;
		TlxFrame.PopupFrame.icon = icon;
		TlxFrame.PopupFrame.origIcon = icon;
		TlxFrame.PopupFrame.mode = IconSelectorPopupFrameModes.Edit;
		TlxFrame.PopupFrame:Show();
	end
end

TLX.Frame.OnDeleteButtonClick = function()
	local name = TLX.Frame.SelectedName;
	if name then
		local dialog = StaticPopup_Show("TLX_CONFIRM_DELETE_CONFIG", name);
		if dialog then
			dialog.name = name;
		end
	end
end

StaticPopupDialogs["TLX_CONFIRM_SAVE_CONFIG"] = {
	text = 'TLX: Would you like to save the talent set "%s"?',
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1,
	button1 = "Yes",
	button2 = "No",
	OnAccept = function(self)
		TLX.SaveConfig(self.name);
		TLX.Frame.Update();
	end,
};

StaticPopupDialogs["TLX_CONFIRM_DELETE_CONFIG"] = {
	text = 'Are you sure you want to delete the talent set %s?';
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1,
	button1 = "Yes",
	button2 = "No",
	OnAccept = function(self)
		TLX.DeleteConfig(TLX.Frame.SelectedName);
		TLX.Frame.SelectedIndex = nil;
		TLX.Frame.SelectedName = nil;
		TLX.Frame.SelectedIcon = nil;
		TLX.Frame.Update();
		UpdateSelected();
	end,
};

local MoveConfig = function(index, offset)
	local englishClass, currentSpec = InitTable();
	if englishClass == nil or currentSpec == nil then
		return;
	end

	local max = #TalentLoadoutsExGUI[englishClass][currentSpec];
	if index < 1 or max < index then
		return;
	end

	local data = TalentLoadoutsExGUI[englishClass][currentSpec][index];
	if data then
		local dest = math.fmod(index - 1 + offset + max, max) + 1;
		table.remove(TalentLoadoutsExGUI[englishClass][currentSpec], index);
		table.insert(TalentLoadoutsExGUI[englishClass][currentSpec], dest, data);
		TLX.Frame.Update();
		TLX.Frame.SelectedIndex = dest;
		UpdateSelected();
	end
end

TLX.Frame.OnUpButtonClick = function()
	local index = TLX.Frame.SelectedIndex;
	if index then
		MoveConfig(index, -1);
	end
end

TLX.Frame.OnDownButtonClick = function()
	local index = TLX.Frame.SelectedIndex;
	if index then
		MoveConfig(index, 1);
	end
end

TLX.ConfigButton.OnClick = function(self, button, down)
	if self.name then
		-- Skip for OnDoubleClick()
		if TLX.Frame.SelectedIndex == self.index then
			return;
		end

		-- Select ConfigButton
		TLX.Frame.SelectedIndex = self.index;
		TLX.Frame.SelectedName = self.name;
		TLX.Frame.SelectedIcon = self.icon:GetTexture();
		PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
		TlxFrame.PopupFrame:Hide();
	else
		-- New ConfigButton
		TLX.Frame.SelectedIndex = nil;
		TLX.Frame.SelectedName = nil;
		TLX.Frame.SelectedIcon = nil;
		TlxFrame.PopupFrame.mode = IconSelectorPopupFrameModes.New;
		TlxFrame.PopupFrame:Show();
	end

	UpdateSelected();
end

TLX.ConfigButton.OnDoubleClick = function(self, button)
	if self.name then
		if isMatchConfig(self.name) and ClassTalentFrame.TalentsTab.ApplyButton:IsEnabled() then
			ClassTalentFrame.TalentsTab:CommitConfig();
		else
			PlaySound(SOUNDKIT.IG_CHARACTER_INFO_TAB);
			TLX.LoadConfig(self.name);
		end
	end
end

TlxPopupMixin = {}
function TlxPopupMixin:OnShow()
	-- Move Popup
	self:ClearAllPoints();
	self:SetPoint("TOPRIGHT", "$parent", "TOPLEFT", 0, -20);

	IconSelectorPopupFrameTemplateMixin.OnShow(self);
	self.BorderBox.IconSelectorEditBox:SetFocus();

	PlaySound(SOUNDKIT.IG_CHARACTER_INFO_OPEN);
	self.iconDataProvider = CreateAndInitFromMixin(IconDataProviderMixin, IconDataProviderExtraType.Spell);
	self:Update();
	self.BorderBox.IconSelectorEditBox:OnTextChanged();

	local function OnIconSelected(selectionIndex, icon)
		self.BorderBox.SelectedIconArea.SelectedIconButton:SetIconTexture(icon);
		self.BorderBox.SelectedIconArea.SelectedIconButton.SelectedTexture:SetShown(false);
		self.BorderBox.SelectedIconArea.SelectedIconText.SelectedIconHeader:SetText(ICON_SELECTION_TITLE_CURRENT);
		self.BorderBox.SelectedIconArea.SelectedIconText.SelectedIconDescription:SetText(ICON_SELECTION_CLICK);
	end

	self.IconSelector:SetSelectedCallback(OnIconSelected);
end

function TlxPopupMixin:OnHide()
	IconSelectorPopupFrameTemplateMixin.OnHide(self);
	self.iconDataProvider:Release();
	self.iconDataProvider = nil;
end

function TlxPopupMixin:Update()
	if self.mode == IconSelectorPopupFrameModes.New then
		self.origName = "";
		self.BorderBox.IconSelectorEditBox:SetText("");
		local initialIndex = 1;
		self.IconSelector:SetSelectedIndex(initialIndex);
		self.BorderBox.SelectedIconArea.SelectedIconButton:SetIconTexture(self:GetIconByIndex(initialIndex));
	elseif self.mode == IconSelectorPopupFrameModes.Edit then
		self.BorderBox.IconSelectorEditBox:SetText(self.origName);
		self.BorderBox.IconSelectorEditBox:HighlightText();
		self.IconSelector:SetSelectedIndex(self:GetIndexOfIcon(self.origIcon));
		self.BorderBox.SelectedIconArea.SelectedIconButton:SetIconTexture(self.origIcon);
	end

	local getSelection = GenerateClosure(self.GetIconByIndex, self);
	local getNumSelections = GenerateClosure(self.GetNumIcons, self);
	self.IconSelector:SetSelectionsDataProvider(getSelection, getNumSelections);
	self.IconSelector:ScrollToSelectedIndex();

	self.BorderBox.SelectedIconArea.SelectedIconButton:SetSelectedTexture();
	self:SetSelectedIconText();
end

function TlxPopupMixin:OkayButton_OnClick()
	local icon = self.BorderBox.SelectedIconArea.SelectedIconButton:GetIconTexture();
	local name = self.BorderBox.IconSelectorEditBox:GetText();

	local isExistsConfig = IsExistsConfig(name);
	if self.mode == IconSelectorPopupFrameModes.New then
		if isExistsConfig then
			return;
		end

		TLX.SaveConfig(name);
	elseif self.mode == IconSelectorPopupFrameModes.Edit then
		if self.origName ~= name and isExistsConfig then
			return;
		end

		TLX.Frame.SelectedName = name;
		TLX.Frame.SelectedIcon = icon;
		UpdateConfig(self.origName, name, icon);
	end

	TLX.Frame.Update(icon);

	IconSelectorPopupFrameTemplateMixin.OkayButton_OnClick(self);
end

local IsAddOnLoadFinished = function(name)
	local loaded, finished = IsAddOnLoaded(name);
	return loaded and finished;
end

local isSetAddOn_BCTU = false;
local addOnName_BCTU = "Blizzard_ClassTalentUI";
local SetAddOn_BCTU = function()
	if IsAddOnLoadFinished(TLX.AddonName) and IsAddOnLoadFinished(addOnName_BCTU) and isSetAddOn_BCTU == false then
		CreateFrame("Frame", "TlxFrame", ClassTalentFrame, "TlxFrame");
		ClassTalentFrame.TalentsTab.ApplyButton:SetScript("OnShow", function() TlxFrame:Show() end);
		ClassTalentFrame.TalentsTab.ApplyButton:SetScript("OnHide", function() TlxFrame:Hide() end);
		isSetAddOn_BCTU = true;
	end
end

local isSetAddOn_LMIS = false;
local addonName_LMIS = "LargerMacroIconSelection";
local SetAddOn_LMIS = function()
	if IsAddOnLoadFinished(TLX.AddonName) and IsAddOnLoadFinished(addOnName_BCTU) and IsAddOnLoadFinished(addonName_LMIS) and isSetAddOn_LMIS == false then
		LargerMacroIconSelection:Initialize(TlxFrame.PopupFrame);
		TlxFrame.PopupFrame.SearchNotice:Hide();
		isSetAddOn_LMIS = true;
	end
end

local loadFrame = CreateFrame("Frame");
loadFrame:RegisterEvent("PLAYER_ENTERING_WORLD");
loadFrame:RegisterEvent("ADDON_LOADED");
loadFrame:SetScript(
	"OnEvent",
	function(self, event, ...)
		if event == "PLAYER_ENTERING_WORLD" then
			LoadAddOn(addOnName_BCTU);
		elseif event == "ADDON_LOADED" then
			local addOnName = ...;
			if addOnName == TLX.AddonName then
				SetAddOn_BCTU();
				SetAddOn_LMIS();
			elseif addOnName == addOnName_BCTU then
				SetAddOn_BCTU();
				SetAddOn_LMIS();
			elseif addOnName == addonName_LMIS then
				SetAddOn_LMIS();
			end
		end
	end
);
