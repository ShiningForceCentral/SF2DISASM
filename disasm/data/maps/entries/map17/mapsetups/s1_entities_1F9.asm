
; ASM FILE data\maps\entries\map17\mapsetups\s1_entities_1F9.asm :
; 0x522DC..0x5231C : 
ms_map17_flag1F9_Entities:
		msFixedEntity 5, 8, DOWN, 206, eas_Init
		msWalkingEntity 11, 6, DOWN, 206, 11, 6, 1
		msFixedEntity 13, 3, DOWN, 198, eas_Init
		msFixedEntity 17, 5, LEFT, 208, eas_Init
		msFixedEntity 56, 5, DOWN, 198, eas_Init
		msFixedEntity 51, 6, RIGHT, 207, eas_Init
		msSequencedEntity 22, 4, DOWN, 208, ems_52316
		msEntitiesEnd
ems_52316:      dc.b DOWN
		dc.b DOWN
		dc.b UP
		dc.b UP
		emsEnd
