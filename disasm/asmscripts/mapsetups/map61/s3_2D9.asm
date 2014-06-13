
; SCRIPT SECTION mapsetups\map61\s3_2D9 :
; 
ms_map61_flag2D9_Section3:
										dc.b 4
										dc.b 9
										dc.w sub_5C6A6-ms_map61_flag2D9_Section3
										dc.b 5
										dc.b 9
										dc.w sub_5C6A6-ms_map61_flag2D9_Section3
										dc.b 6
										dc.b 9
										dc.w sub_5C6A6-ms_map61_flag2D9_Section3
										dc.w $FD00
										dc.w return_5C6BC-ms_map61_flag2D9_Section3

; =============== S U B R O U T I N E =======================================

sub_5C6A6:
										
										trap    #1
										dc.w $2DA
										bne.s   (Map58Section0+$132-ms_map52_flag200_EntityEvents)
										trap    #1
										dc.w word_5C4F4+1-ms_map52_flag200_EntityEvents
										beq.s   return_5C6BC
										lea     (Map58Section0+$140-ms_map52_flag200_EntityEvents)(pc), a0
										trap    #6
										trap    #2
										dc.w ms_map62_flag4D-ms_map52_flag200_EntityEvents
return_5C6BC:
										
										rts

	; End of function sub_5C6A6

