
; ASM FILE data\maps\entries\map17\mapsetups\s1_entities_505.asm :
; 0x522DC..0x5231C : 
ms_map17_flag505_Entities:
                msFixedEntity 5, 8, DOWN, MAPSPRITE_SOLDIER1, eas_Init
                msWalkingEntity 11, 6, DOWN, MAPSPRITE_SOLDIER1, 11, 6, 1
                msFixedEntity 13, 3, DOWN, MAPSPRITE_MAN3, eas_Init
                msFixedEntity 17, 5, LEFT, MAPSPRITE_MAID, eas_Init
                msFixedEntity 56, 5, DOWN, MAPSPRITE_MAN3, eas_Init
                msFixedEntity 51, 6, RIGHT, MAPSPRITE_SOLDIER2, eas_Init
                msSequencedEntity 22, 4, DOWN, MAPSPRITE_MAID, ems_52316
                msEntitiesEnd
ems_52316:      dc.b DOWN
                dc.b DOWN
                dc.b UP
                dc.b UP
                emsEnd
