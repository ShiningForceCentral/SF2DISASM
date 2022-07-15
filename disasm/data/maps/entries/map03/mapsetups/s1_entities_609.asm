
; ASM FILE data\maps\entries\map03\mapsetups\s1_entities_609.asm :
; 0x50BCA..0x50CCA : 
ms_map3_flag609_Entities:
                msFixedEntity 6, 9, RIGHT, MAPSPRITE_WOMAN1, eas_Init
                msWalkingEntity 12, 9, RIGHT, MAPSPRITE_MAN3, 12, 9, 1
                msFixedEntity 14, 9, UP, MAPSPRITE_WOMAN3, eas_Init
                msFixedEntity 7, 18, DOWN, MAPSPRITE_SAILOR, eas_Init
                msFixedEntity 9, 23, DOWN, MAPSPRITE_SAILOR, eas_Init
                msFixedEntity 1, 23, DOWN, MAPSPRITE_SOLDIER1, eas_Init
                msWalkingEntity 16, 22, DOWN, MAPSPRITE_WOMAN2, 16, 22, 2
                msFixedEntity 13, 19, DOWN, MAPSPRITE_WOMAN3, eas_Init
                msFixedEntity 27, 13, LEFT, MAPSPRITE_WOMAN3, eas_Init
                msFixedEntity 25, 13, RIGHT, MAPSPRITE_WOMAN1, eas_Init
                msFixedEntity 27, 3, DOWN, MAPSPRITE_SOLDIER1, eas_Init
                msFixedEntity 31, 3, DOWN, MAPSPRITE_SOLDIER1, eas_Init
                msFixedEntity 23, 21, DOWN, MAPSPRITE_WORKER, eas_Init
                msFixedEntity 29, 24, UP, MAPSPRITE_BOY, eas_Init
                msWalkingEntity 32, 27, DOWN, MAPSPRITE_HEN, 32, 27, 1
                msWalkingEntity 39, 26, DOWN, MAPSPRITE_WORKER, 39, 26, 1
                msFixedEntity 37, 21, DOWN, MAPSPRITE_WOMAN1, eas_Init
                msWalkingEntity 47, 24, DOWN, MAPSPRITE_MAN2, 47, 24, 2
                msWalkingEntity 25, 22, DOWN, MAPSPRITE_BEASTMAN1, 25, 22, 1
                msWalkingEntity 26, 22, DOWN, MAPSPRITE_BEASTMAN2, 26, 22, 1
                msWalkingEntity 27, 22, DOWN, ALLY_KIWI, 27, 22, 1
                msFixedEntity 32, 11, DOWN, MAPSPRITE_PRIEST, eas_Init
                msWalkingEntity 29, 7, DOWN, MAPSPRITE_MAN2, 29, 7, 1
                msWalkingEntity 18, 14, DOWN, MAPSPRITE_BOY, 18, 14, 1
                msFixedEntity 18, 9, DOWN, MAPSPRITE_WOMAN1, eas_Init
                msSequencedEntity 20, 16, DOWN, MAPSPRITE_DWARF, ems_50CAC
                msFixedEntity 8, 18, DOWN, MAPSPRITE_SAILOR, eas_Init
                msFixedEntity 1, 29, UP, ALLY_JAHA, eas_Init
                msEntitiesEnd
ems_50CAC:      dc.b DOWN
                dc.b DOWN
                dc.b RIGHT
                dc.b RIGHT
                dc.b RIGHT
                dc.b RIGHT
                dc.b RIGHT
                dc.b RIGHT
                dc.b RIGHT
                dc.b RIGHT
                dc.b RIGHT
                dc.b RIGHT
                dc.b UP
                dc.b UP
                dc.b LEFT
                dc.b UP
                dc.b LEFT
                dc.b LEFT
                dc.b LEFT
                dc.b UP
                dc.b LEFT
                dc.b LEFT
                dc.b LEFT
                dc.b LEFT
                dc.b LEFT
                dc.b DOWN
                dc.b LEFT
                dc.b DOWN
                emsEnd
