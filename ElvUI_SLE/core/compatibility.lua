﻿local SLE, T, E, L, V, P, G = unpack(select(2, ...))

local GetAddOnEnableState = GetAddOnEnableState

--Check if some stuff happens to be enable
SLE._Compatibility = {}
local _CompList = {
	'DejaCharacterStats', --Cause armory
	'ElvUI_CustomTweaks',
	'ElvUI_Enhanced',
	'ElvUI_MerathilisUI',
	'ElvUI_PagedLootHistory',
	'LootConfirm', --Module incompatible
	'Mapster', --Module partially incompatible
	'Pawn', --Cause armory
	'SunnArt',
	'TradeSkillMaster',
	'WorldQuestTracker',
	'oRA3',
}

--Populate compatibility checks table
for i = 1, #_CompList do
	if GetAddOnEnableState(E.myname, _CompList[i]) == 0 then SLE._Compatibility[_CompList[i]] = nil else SLE._Compatibility[_CompList[i]] = true end
end

--This function sets up a popup dialog in case there is an incompatible addon running
function SLE:IncompatibleAddOn(addon, module, optiontable, value)
	E.PopupDialogs['SLE_INCOMPATIBLE_ADDON'].button1 = addon
	E.PopupDialogs['SLE_INCOMPATIBLE_ADDON'].button2 = 'S&L: '..module
	E.PopupDialogs['SLE_INCOMPATIBLE_ADDON'].addon = addon
	E.PopupDialogs['SLE_INCOMPATIBLE_ADDON'].module = module
	E.PopupDialogs['SLE_INCOMPATIBLE_ADDON'].optiontable = optiontable
	E.PopupDialogs['SLE_INCOMPATIBLE_ADDON'].value = value
	E.PopupDialogs['SLE_INCOMPATIBLE_ADDON'].showAlert = true
	E:StaticPopup_Show('SLE_INCOMPATIBLE_ADDON', addon, module)
end

--Check if incompatibility is in place
function SLE:CheckIncompatible()
	if SLE._Compatibility['ElvUI_Enhanced'] then
		E:StaticPopup_Show('ENHANCED_SLE_INCOMPATIBLE')
		return true
	end
	if SLE._Compatibility['LootConfirm'] then
		E:StaticPopup_Show('LOOTCONFIRM_SLE_INCOMPATIBLE')
		return true
	end
	if SLE._Compatibility['ElvUITransparentActionbars'] then
		E:StaticPopup_Show('TRANSAB_SLE_INCOMPATIBLE')
		return true
	end

	return false
end
