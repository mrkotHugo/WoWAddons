--
-- Copyright (c) 2023 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="kr",date="2023-05-06T08:49:25Z",numCharacters=32691,db={}}
local F

F = function() provider.db["아즈샤라"]={0,"Maxava","Maxxava"} end F()

F = nil
RaiderIO.AddProvider(provider)
