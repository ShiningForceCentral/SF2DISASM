
; ASM FILE data\maps\entries\map56\mapsetups\s1_entities.asm :
; 0x614A0..0x614AA : 
ms_map56_Entities:
                msFixedEntity 42, 39, UP, MAPSPRITE_CREED, eas_Init
            if (STANDARD_BUILD&CARAVAN_IN_TOWER=1)
                msFixedEntity 45, 39, LEFT, MAPSPRITE_CARAVAN, eas_Init
            endif
                msEntitiesEnd
