--	*** LibItemInfo ***
-- Written by : Thaoky, EU-Marécages de Zangar
-- March 2021
-- This list was manually curated (source: mostly Wowhead + in-game).
-- Non-commercial use is permitted as long as credits are preserved, and that Blizzard's terms of services are respected.

local lib = LibStub("LibItemInfo-1.0")

local e = lib.Enum.ReagentTypes
local bag = lib.Enum.BagTypes
local SetReagent = lib.SetReagent

lib:RegisterItems({
	-- 1.0 Classic
	[814] = SetReagent(0, e.Engineering), -- Flask of Oil
	[4399] = SetReagent(0, e.Engineering), -- Wooden Stock
	[4400] = SetReagent(0, e.Engineering), -- Heavy Stock
	[4611] = SetReagent(0, e.Engineering), -- Blue Pearl
	[10647] = SetReagent(0, e.Engineering), -- Engineer's Ink

	
	[4357] = SetReagent(0, e.Engineering, 1), -- Rough Blasting Powder
	[4359] = SetReagent(0, e.Engineering, 30), -- Handful of Copper Bolts
	[4364] = SetReagent(0, e.Engineering, 65), -- Coarse Blasting Powder
	[4404] = SetReagent(0, e.Engineering, 90), -- Silver Contact
	[4371] = SetReagent(0, e.Engineering, 105), -- Bronze Tube
	[4375] = SetReagent(0, e.Engineering, 125), -- Whirring Bronze Gizmo
	[4377] = SetReagent(0, e.Engineering, 125), -- Heavy Blasting Powder
	[4382] = SetReagent(0, e.Engineering, 145), -- Bronze Framework
	[10558] = SetReagent(0, e.Engineering, 150), -- Gold Power Core
	[4387] = SetReagent(0, e.Engineering, 160), -- Iron Strut
	[4389] = SetReagent(0, e.Engineering, 170), -- Gyrochronatom
	[10498] = SetReagent(0, e.Engineering, 175), -- Gyromatic Micro-Adjustor
	[10505] = SetReagent(0, e.Engineering, 175), -- Solid Blasting Powder
	[10559] = SetReagent(0, e.Engineering, 195), -- Mithril Tube
	[10560] = SetReagent(0, e.Engineering, 200), -- Unstable Trigger
	[10561] = SetReagent(0, e.Engineering, 215), -- Mithril Casing
	[15992] = SetReagent(0, e.Engineering, 250), -- Dense Blasting Powder
	[15994] = SetReagent(0, e.Engineering, 260), -- Thorium Widget
	[18631] = SetReagent(0, e.Engineering, 260), -- Truesilver Transformer
	[7191] = SetReagent(0, e.Engineering, 275), -- Fused Wiring
	[16000] = SetReagent(0, e.Engineering, 275), -- Thorium Tube
	[16006] = SetReagent(0, e.Engineering, 285), -- Delicate Arcanite Converter
	
	-- 2.0 BC
	[23781] = SetReagent(1, e.Engineering, 1), -- Elemental Blasting Powder
	[23782] = SetReagent(1, e.Engineering, 1), -- Fel Iron Casing
	[23783] = SetReagent(1, e.Engineering, 1), -- Handful of Fel Iron Bolts
	[23784] = SetReagent(1, e.Engineering, 25), -- Adamantite Frame
	[32423] = SetReagent(1, e.Engineering, 35), -- Icy Blasting Primers
	[23785] = SetReagent(1, e.Engineering, 40), -- Hardened Adamantite Tube
	[23786] = SetReagent(1, e.Engineering, 40), -- Khorium Power Core
	[23787] = SetReagent(1, e.Engineering, 40), -- Felsteel Stabilizer
	
	-- 3.0 WotLK
	[40533] = SetReagent(2, e.Engineering), -- Walnut Stock
	[44500] = SetReagent(2, e.Engineering), -- Elementium-Plated Exhaust Pipe
	[44501] = SetReagent(2, e.Engineering), -- Goblin-Machined Piston
	[39684] = SetReagent(2, e.Engineering), -- Hair Trigger
	
	[39681] = SetReagent(2, e.Engineering, 1), -- Handful of Cobalt Bolts
	[39682] = SetReagent(2, e.Engineering, 1), -- Overcharged Capacitor
	[39690] = SetReagent(2, e.Engineering, 1), -- Volatile Blasting Trigger
	[39683] = SetReagent(2, e.Engineering, 15), -- Froststeel Tube
	
	-- 4.0 Cataclysm
	[60224] = SetReagent(3, e.Engineering, 1), -- Handful of Obsidium Bolts
	[67749] = SetReagent(3, e.Engineering, 1), -- Electrified Ether
	
	-- 5.0 Mists of Pandaria
	[94113] = SetReagent(4, e.Engineering), -- Jard's Peculiar Energy Source
	[77467] = SetReagent(4, e.Engineering, 1), -- Ghost Iron Bolts
	[77468] = SetReagent(4, e.Engineering, 1), -- High-Explosive Gunpowder
	[90146] = SetReagent(4, e.Engineering, 25), -- Tinker's Kit
	
	-- 6.0 Warlords of Draenor
	[111366] = SetReagent(5, e.Engineering), -- Gearspring Parts
	[119299] = SetReagent(5, e.Engineering), -- Secrets of Draenor Engineering
	
	-- 7.0 Legion
	[136633] = SetReagent(6, e.Engineering), -- Loose Trigger
	[136636] = SetReagent(6, e.Engineering), -- Sniping Scope
	[136637] = SetReagent(6, e.Engineering), -- Oversized Blasting Cap
	[136638] = SetReagent(6, e.Engineering), -- True Iron Barrel
	[144329] = SetReagent(6, e.Engineering), -- Hardened Felglass
	
	-- 8.0 Battle for Azeroth
	[160502] = SetReagent(7, e.Engineering), -- Chemical Blasting Cap
	[161129] = SetReagent(7, e.Engineering), -- Mecha-Mogul Mk I Remote Activation Device
	[161131] = SetReagent(7, e.Engineering), -- Barely Stable Azerite Reactor
	[161132] = SetReagent(7, e.Engineering), -- Crush Resistant Stabilizer
	[161136] = SetReagent(7, e.Engineering), -- Azerite Forged Protection Plating
	[161137] = SetReagent(7, e.Engineering), -- Blast-Fired Electric Servomotor
	[163203] = SetReagent(7, e.Engineering), -- Hypersensitive Azeritometer Sensor
	[163569] = SetReagent(7, e.Engineering), -- Insulated Wiring
	[166846] = SetReagent(7, e.Engineering), -- Spare Parts
	
	-- 9.0 Shadowlands
	[172934] = SetReagent(8, e.Engineering), -- Handful of Laestrite Bolts
	[172935] = SetReagent(8, e.Engineering), -- Porous Polishing Abrasive
	[183952] = SetReagent(8, e.Engineering), -- Machinist's Oil
	
	[172936] = SetReagent(8, e.Engineering, 15), -- Mortal Coiled Spring
	[172937] = SetReagent(8, e.Engineering, 25), -- Wormfed Gear Assembly
})