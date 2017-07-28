
; ASM FILE data\maps\entries\map20\mapsetups\s2_1FA.asm :
; 0x53928..0x5392C : 
ms_map20_flag1FA_EntityEvents:
		dc.w $FD00
		dc.w (return_53814-ms_map20_flag1FA_EntityEvents) & $FFFF
