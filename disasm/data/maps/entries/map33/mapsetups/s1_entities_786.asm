
; ASM FILE data\maps\entries\map33\mapsetups\s1_entities_786.asm :
; 0x5A74C..0x5A766 : 
ms_map33_flag786_Entities:
                msWalkingEntity 22, 4, UP, MAPSPRITE_WORKER, 22, 4, 1
                msFixedEntity 17, 5, DOWN, MAPSPRITE_CREED, eas_Init
                msFixedEntity 17, 7, UP, MAPSPRITE_ODDLER, eas_Init
            if (STANDARD_BUILD&RECRUIT_ALL_CREED_CHARACTERS=1)
                msFixedEntity 63, 63, DOWN, ALLY_ERIC, eas_Init
                msFixedEntity 63, 63, UP, ALLY_RANDOLF, eas_Init
                msFixedEntity 63, 63, DOWN, ALLY_TYRIN, eas_Init
                msFixedEntity 63, 63, UP, ALLY_KARNA, eas_Init
            endif
                msEntitiesEnd
