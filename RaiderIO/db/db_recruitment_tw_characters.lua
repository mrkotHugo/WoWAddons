--
-- Copyright (c) 2023 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="tw",date="2023-05-06T08:49:25Z",numCharacters=32691,db={}}
local F

F = function() provider.db["世界之樹"]={0,"Paoda","往小萌","柯基又飽了","菜菜子","阿提米斯"} end F()
F = function() provider.db["亞雷戈斯"]={10,"穢邪路路"} end F()
F = function() provider.db["暗影之月"]={12,"丶阿劍","佳佳不是熊貓","全村的希望丶","狗富貴","王钢蛋","黑風"} end F()
F = function() provider.db["克羅之刃"]={24,"哈尼斯比魚","库露米","浅刃","真白花音"} end F()
F = function() provider.db["語風"]={32,"At","Dydy","劍舞哀傷","增弱萨","米花"} end F()
F = function() provider.db["水晶之刺"]={42,"潘鳳"} end F()
F = function() provider.db["日落沼澤"]={44,"Silvio"} end F()

F = nil
RaiderIO.AddProvider(provider)
