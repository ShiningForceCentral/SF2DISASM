
; ASM FILE data\maps\entries\map07\mapsetups\s1_entities.asm :
; 0x553C6..0x55428 : 
ms_map7_Entities:
                msFixedEntity 12, 5, DOWN, MAPSPRITE_MINISTER, eas_InitSlow
                msFixedEntity 11, 4, DOWN, MAPSPRITE_GRANSEAL_KING, eas_InitSlow
                msWalkingEntity 3, 7, DOWN, MAPSPRITE_SOLDIER1, 3, 7, 2
                msWalkingEntity 4, 14, DOWN, MAPSPRITE_SOLDIER1, 4, 14, 1
                msFixedEntity 8, 10, DOWN, MAPSPRITE_SOLDIER1, eas_InitSlow
                msFixedEntity 9, 20, DOWN, MAPSPRITE_SOLDIER2, eas_RightLeftMoveLoop
                msWalkingEntity 19, 9, DOWN, MAPSPRITE_SOLDIER2, 19, 9, 1
                msFixedEntity 14, 10, DOWN, MAPSPRITE_SOLDIER2, eas_InitSlow
                msFixedEntity 13, 20, DOWN, MAPSPRITE_SOLDIER2, eas_LeftRightMoveLoop
                msFixedEntity 8, 7, RIGHT, MAPSPRITE_MAID, eas_InitSlow
                msFixedEntity 14, 7, LEFT, MAPSPRITE_MAID, eas_InitSlow
                msFixedEntity 10, 5, DOWN, MAPSPRITE_ASTRAL, eas_InitSlow
                msEntitiesEnd
