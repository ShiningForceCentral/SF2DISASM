
; ASM FILE data\maps\entries\map19\mapsetups\s1_entities.asm :
; 0x52BC2..0x52C2C : 
ms_map19_Entities:
                msWalkingEntity 25, 26, DOWN, MAPSPRITE_SOLDIER1, 25, 26, 2
                msWalkingEntity 26, 26, DOWN, MAPSPRITE_SOLDIER1, 26, 26, 2
                msFixedEntity 17, 25, DOWN, MAPSPRITE_SOLDIER1, eas_Init
                msFixedEntity 14, 25, DOWN, MAPSPRITE_SOLDIER1, eas_Init
                msWalkingEntity 15, 20, DOWN, MAPSPRITE_SOLDIER1, 15, 20, 1
                msFixedEntity 28, 17, DOWN, MAPSPRITE_SOLDIER2, eas_Init
                msFixedEntity 30, 17, DOWN, MAPSPRITE_SOLDIER2, eas_Init
                msFixedEntity 29, 8, DOWN, MAPSPRITE_MAN3, eas_LeftRightMoveLoop
                msFixedEntity 24, 16, DOWN, MAPSPRITE_MAID, eas_Init
                msWalkingEntity 20, 17, DOWN, MAPSPRITE_WOMAN1, 20, 17, 1
                msFixedEntity 19, 5, DOWN, MAPSPRITE_SOLDIER1, eas_Init
                msFixedEntity 21, 4, DOWN, MAPSPRITE_MAID, eas_Init
                msFixedEntity 16, 5, DOWN, MAPSPRITE_ASTRAL, eas_Init
                msEntitiesEnd
