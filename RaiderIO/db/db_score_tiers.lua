--
-- Generated on 2023-01-08T07:51:12Z. DO NOT EDIT.
--
-- Ranges: {"epic":[2026,3050],"superior":[1501,2025],"uncommon":[626,1500],"common":[200,625]}
--
local _, ns = ...

ns.scoreTiers = {
	[1] = { ["score"] = 3050, ["color"] = { 1.00, 0.50, 0.00 } },		-- |cffff80003050+|r
	[2] = { ["score"] = 2985, ["color"] = { 1.00, 0.49, 0.08 } },		-- |cfffe7e142985+|r
	[3] = { ["score"] = 2960, ["color"] = { 0.99, 0.49, 0.13 } },		-- |cfffd7c202960+|r
	[4] = { ["score"] = 2935, ["color"] = { 0.99, 0.48, 0.16 } },		-- |cfffc7a292935+|r
	[5] = { ["score"] = 2910, ["color"] = { 0.98, 0.47, 0.19 } },		-- |cfffb78312910+|r
	[6] = { ["score"] = 2890, ["color"] = { 0.98, 0.47, 0.22 } },		-- |cfffa77382890+|r
	[7] = { ["score"] = 2865, ["color"] = { 0.98, 0.46, 0.24 } },		-- |cfff9753e2865+|r
	[8] = { ["score"] = 2840, ["color"] = { 0.97, 0.45, 0.27 } },		-- |cfff773452840+|r
	[9] = { ["score"] = 2815, ["color"] = { 0.96, 0.44, 0.29 } },		-- |cfff6714a2815+|r
	[10] = { ["score"] = 2790, ["color"] = { 0.96, 0.44, 0.31 } },		-- |cfff56f502790+|r
	[11] = { ["score"] = 2770, ["color"] = { 0.96, 0.43, 0.34 } },		-- |cfff46d562770+|r
	[12] = { ["score"] = 2745, ["color"] = { 0.95, 0.42, 0.36 } },		-- |cfff26b5b2745+|r
	[13] = { ["score"] = 2720, ["color"] = { 0.95, 0.41, 0.38 } },		-- |cfff169602720+|r
	[14] = { ["score"] = 2695, ["color"] = { 0.94, 0.40, 0.40 } },		-- |cffef67652695+|r
	[15] = { ["score"] = 2670, ["color"] = { 0.93, 0.40, 0.42 } },		-- |cffee656a2670+|r
	[16] = { ["score"] = 2650, ["color"] = { 0.93, 0.39, 0.44 } },		-- |cffec63702650+|r
	[17] = { ["score"] = 2625, ["color"] = { 0.92, 0.38, 0.46 } },		-- |cffeb62752625+|r
	[18] = { ["score"] = 2600, ["color"] = { 0.91, 0.38, 0.47 } },		-- |cffe960792600+|r
	[19] = { ["score"] = 2575, ["color"] = { 0.91, 0.37, 0.49 } },		-- |cffe75e7e2575+|r
	[20] = { ["score"] = 2550, ["color"] = { 0.90, 0.36, 0.51 } },		-- |cffe55c832550+|r
	[21] = { ["score"] = 2530, ["color"] = { 0.89, 0.35, 0.53 } },		-- |cffe45a882530+|r
	[22] = { ["score"] = 2505, ["color"] = { 0.89, 0.35, 0.55 } },		-- |cffe2588d2505+|r
	[23] = { ["score"] = 2480, ["color"] = { 0.88, 0.34, 0.57 } },		-- |cffe056922480+|r
	[24] = { ["score"] = 2455, ["color"] = { 0.87, 0.33, 0.59 } },		-- |cffde54972455+|r
	[25] = { ["score"] = 2430, ["color"] = { 0.86, 0.32, 0.61 } },		-- |cffdb529b2430+|r
	[26] = { ["score"] = 2410, ["color"] = { 0.85, 0.32, 0.63 } },		-- |cffd951a02410+|r
	[27] = { ["score"] = 2385, ["color"] = { 0.84, 0.31, 0.65 } },		-- |cffd74fa52385+|r
	[28] = { ["score"] = 2360, ["color"] = { 0.83, 0.30, 0.67 } },		-- |cffd44daa2360+|r
	[29] = { ["score"] = 2335, ["color"] = { 0.82, 0.29, 0.69 } },		-- |cffd24baf2335+|r
	[30] = { ["score"] = 2310, ["color"] = { 0.81, 0.29, 0.71 } },		-- |cffcf49b42310+|r
	[31] = { ["score"] = 2290, ["color"] = { 0.80, 0.28, 0.72 } },		-- |cffcc47b82290+|r
	[32] = { ["score"] = 2265, ["color"] = { 0.79, 0.27, 0.74 } },		-- |cffc946bd2265+|r
	[33] = { ["score"] = 2240, ["color"] = { 0.78, 0.27, 0.76 } },		-- |cffc644c22240+|r
	[34] = { ["score"] = 2215, ["color"] = { 0.76, 0.26, 0.78 } },		-- |cffc342c72215+|r
	[35] = { ["score"] = 2190, ["color"] = { 0.75, 0.25, 0.80 } },		-- |cffc040cc2190+|r
	[36] = { ["score"] = 2170, ["color"] = { 0.74, 0.25, 0.82 } },		-- |cffbc3fd12170+|r
	[37] = { ["score"] = 2145, ["color"] = { 0.73, 0.24, 0.84 } },		-- |cffb93dd62145+|r
	[38] = { ["score"] = 2120, ["color"] = { 0.71, 0.23, 0.85 } },		-- |cffb53bda2120+|r
	[39] = { ["score"] = 2095, ["color"] = { 0.69, 0.23, 0.87 } },		-- |cffb13adf2095+|r
	[40] = { ["score"] = 2070, ["color"] = { 0.67, 0.22, 0.89 } },		-- |cffac38e42070+|r
	[41] = { ["score"] = 2050, ["color"] = { 0.66, 0.21, 0.91 } },		-- |cffa836e92050+|r
	[42] = { ["score"] = 2025, ["color"] = { 0.64, 0.21, 0.93 } },		-- |cffa335ee2025+|r
	[43] = { ["score"] = 1980, ["color"] = { 0.62, 0.23, 0.93 } },		-- |cff9f3aed1980+|r
	[44] = { ["score"] = 1955, ["color"] = { 0.60, 0.25, 0.93 } },		-- |cff9a3fec1955+|r
	[45] = { ["score"] = 1930, ["color"] = { 0.59, 0.26, 0.93 } },		-- |cff9643ec1930+|r
	[46] = { ["score"] = 1905, ["color"] = { 0.57, 0.28, 0.92 } },		-- |cff9247eb1905+|r
	[47] = { ["score"] = 1885, ["color"] = { 0.55, 0.29, 0.92 } },		-- |cff8d4bea1885+|r
	[48] = { ["score"] = 1860, ["color"] = { 0.53, 0.31, 0.91 } },		-- |cff884ee91860+|r
	[49] = { ["score"] = 1835, ["color"] = { 0.51, 0.32, 0.91 } },		-- |cff8351e81835+|r
	[50] = { ["score"] = 1810, ["color"] = { 0.49, 0.33, 0.91 } },		-- |cff7e54e71810+|r
	[51] = { ["score"] = 1785, ["color"] = { 0.47, 0.34, 0.91 } },		-- |cff7957e71785+|r
	[52] = { ["score"] = 1765, ["color"] = { 0.45, 0.35, 0.90 } },		-- |cff745ae61765+|r
	[53] = { ["score"] = 1740, ["color"] = { 0.43, 0.36, 0.90 } },		-- |cff6e5ce51740+|r
	[54] = { ["score"] = 1715, ["color"] = { 0.41, 0.37, 0.89 } },		-- |cff695ee41715+|r
	[55] = { ["score"] = 1690, ["color"] = { 0.38, 0.38, 0.89 } },		-- |cff6261e31690+|r
	[56] = { ["score"] = 1665, ["color"] = { 0.36, 0.39, 0.89 } },		-- |cff5c63e31665+|r
	[57] = { ["score"] = 1645, ["color"] = { 0.33, 0.40, 0.89 } },		-- |cff5565e21645+|r
	[58] = { ["score"] = 1620, ["color"] = { 0.30, 0.40, 0.88 } },		-- |cff4d67e11620+|r
	[59] = { ["score"] = 1595, ["color"] = { 0.27, 0.41, 0.88 } },		-- |cff4569e01595+|r
	[60] = { ["score"] = 1570, ["color"] = { 0.23, 0.42, 0.87 } },		-- |cff3b6bdf1570+|r
	[61] = { ["score"] = 1545, ["color"] = { 0.19, 0.43, 0.87 } },		-- |cff306ddf1545+|r
	[62] = { ["score"] = 1525, ["color"] = { 0.13, 0.43, 0.87 } },		-- |cff206ede1525+|r
	[63] = { ["score"] = 1500, ["color"] = { 0.00, 0.44, 0.87 } },		-- |cff0070dd1500+|r
	[64] = { ["score"] = 1440, ["color"] = { 0.11, 0.45, 0.85 } },		-- |cff1d74d91440+|r
	[65] = { ["score"] = 1415, ["color"] = { 0.17, 0.47, 0.84 } },		-- |cff2b78d51415+|r
	[66] = { ["score"] = 1390, ["color"] = { 0.20, 0.49, 0.82 } },		-- |cff347cd11390+|r
	[67] = { ["score"] = 1370, ["color"] = { 0.24, 0.50, 0.80 } },		-- |cff3c80cd1370+|r
	[68] = { ["score"] = 1345, ["color"] = { 0.26, 0.51, 0.78 } },		-- |cff4283c81345+|r
	[69] = { ["score"] = 1320, ["color"] = { 0.28, 0.53, 0.77 } },		-- |cff4787c41320+|r
	[70] = { ["score"] = 1295, ["color"] = { 0.29, 0.55, 0.75 } },		-- |cff4b8bc01295+|r
	[71] = { ["score"] = 1270, ["color"] = { 0.31, 0.56, 0.74 } },		-- |cff4f8fbc1270+|r
	[72] = { ["score"] = 1250, ["color"] = { 0.33, 0.58, 0.72 } },		-- |cff5393b81250+|r
	[73] = { ["score"] = 1225, ["color"] = { 0.33, 0.59, 0.70 } },		-- |cff5597b31225+|r
	[74] = { ["score"] = 1200, ["color"] = { 0.35, 0.61, 0.69 } },		-- |cff589baf1200+|r
	[75] = { ["score"] = 1175, ["color"] = { 0.35, 0.62, 0.67 } },		-- |cff5a9fab1175+|r
	[76] = { ["score"] = 1150, ["color"] = { 0.36, 0.64, 0.65 } },		-- |cff5ba3a61150+|r
	[77] = { ["score"] = 1130, ["color"] = { 0.36, 0.66, 0.64 } },		-- |cff5da8a21130+|r
	[78] = { ["score"] = 1105, ["color"] = { 0.37, 0.67, 0.62 } },		-- |cff5eac9d1105+|r
	[79] = { ["score"] = 1080, ["color"] = { 0.37, 0.69, 0.60 } },		-- |cff5fb0991080+|r
	[80] = { ["score"] = 1055, ["color"] = { 0.37, 0.71, 0.58 } },		-- |cff5fb4941055+|r
	[81] = { ["score"] = 1030, ["color"] = { 0.37, 0.72, 0.56 } },		-- |cff5fb8901030+|r
	[82] = { ["score"] = 1010, ["color"] = { 0.37, 0.74, 0.55 } },		-- |cff5fbc8b1010+|r
	[83] = { ["score"] = 985, ["color"] = { 0.37, 0.75, 0.53 } },		-- |cff5fc086985+|r
	[84] = { ["score"] = 960, ["color"] = { 0.37, 0.77, 0.51 } },		-- |cff5ec481960+|r
	[85] = { ["score"] = 935, ["color"] = { 0.36, 0.78, 0.49 } },		-- |cff5dc87c935+|r
	[86] = { ["score"] = 910, ["color"] = { 0.36, 0.80, 0.47 } },		-- |cff5ccc77910+|r
	[87] = { ["score"] = 890, ["color"] = { 0.36, 0.82, 0.44 } },		-- |cff5bd171890+|r
	[88] = { ["score"] = 865, ["color"] = { 0.35, 0.84, 0.42 } },		-- |cff59d56c865+|r
	[89] = { ["score"] = 840, ["color"] = { 0.34, 0.85, 0.40 } },		-- |cff56d966840+|r
	[90] = { ["score"] = 815, ["color"] = { 0.33, 0.87, 0.38 } },		-- |cff54dd60815+|r
	[91] = { ["score"] = 790, ["color"] = { 0.31, 0.88, 0.35 } },		-- |cff50e159790+|r
	[92] = { ["score"] = 770, ["color"] = { 0.30, 0.90, 0.32 } },		-- |cff4de652770+|r
	[93] = { ["score"] = 745, ["color"] = { 0.28, 0.92, 0.29 } },		-- |cff48ea4b745+|r
	[94] = { ["score"] = 720, ["color"] = { 0.26, 0.93, 0.26 } },		-- |cff43ee43720+|r
	[95] = { ["score"] = 695, ["color"] = { 0.24, 0.95, 0.22 } },		-- |cff3df239695+|r
	[96] = { ["score"] = 670, ["color"] = { 0.21, 0.96, 0.18 } },		-- |cff35f62e670+|r
	[97] = { ["score"] = 650, ["color"] = { 0.17, 0.98, 0.12 } },		-- |cff2cfb1f650+|r
	[98] = { ["score"] = 625, ["color"] = { 0.12, 1.00, 0.00 } },		-- |cff1eff00625+|r
	[99] = { ["score"] = 600, ["color"] = { 0.27, 1.00, 0.17 } },		-- |cff44ff2b600+|r
	[100] = { ["score"] = 575, ["color"] = { 0.36, 1.00, 0.25 } },		-- |cff5bff40575+|r
	[101] = { ["score"] = 550, ["color"] = { 0.43, 1.00, 0.32 } },		-- |cff6dff51550+|r
	[102] = { ["score"] = 525, ["color"] = { 0.49, 1.00, 0.38 } },		-- |cff7dff60525+|r
	[103] = { ["score"] = 500, ["color"] = { 0.54, 1.00, 0.43 } },		-- |cff8aff6e500+|r
	[104] = { ["score"] = 475, ["color"] = { 0.59, 1.00, 0.48 } },		-- |cff97ff7b475+|r
	[105] = { ["score"] = 450, ["color"] = { 0.64, 1.00, 0.53 } },		-- |cffa3ff88450+|r
	[106] = { ["score"] = 425, ["color"] = { 0.68, 1.00, 0.58 } },		-- |cffaeff94425+|r
	[107] = { ["score"] = 400, ["color"] = { 0.72, 1.00, 0.63 } },		-- |cffb8ffa1400+|r
	[108] = { ["score"] = 375, ["color"] = { 0.76, 1.00, 0.68 } },		-- |cffc2ffad375+|r
	[109] = { ["score"] = 350, ["color"] = { 0.80, 1.00, 0.72 } },		-- |cffccffb8350+|r
	[110] = { ["score"] = 325, ["color"] = { 0.84, 1.00, 0.77 } },		-- |cffd5ffc4325+|r
	[111] = { ["score"] = 300, ["color"] = { 0.87, 1.00, 0.82 } },		-- |cffdeffd0300+|r
	[112] = { ["score"] = 275, ["color"] = { 0.90, 1.00, 0.86 } },		-- |cffe6ffdc275+|r
	[113] = { ["score"] = 250, ["color"] = { 0.94, 1.00, 0.91 } },		-- |cffefffe8250+|r
	[114] = { ["score"] = 225, ["color"] = { 0.97, 1.00, 0.95 } },		-- |cfff7fff3225+|r
	[115] = { ["score"] = 200, ["color"] = { 1.00, 1.00, 1.00 } },		-- |cffffffff200+|r
}

ns.scoreTiersSimple = {
	[1] = { ["score"] = 2200, ["quality"] = 6 },
	[2] = { ["score"] = 1800, ["quality"] = 5 },
	[3] = { ["score"] = 1500, ["quality"] = 4 },
	[4] = { ["score"] = 1000, ["quality"] = 3 },
	[5] = { ["score"] = 0, ["quality"] = 2 }
}