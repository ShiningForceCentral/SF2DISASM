
; SCRIPT SECTION mapsetups\map52\s3_200 :
; 
ms_map52_flag200_Section3:
										dc.b 3
										dc.b $17
										dc.w sub_5C4B6-ms_map52_flag200_Section3
										dc.b 4
										dc.b $17
										dc.w sub_5C4B6-ms_map52_flag200_Section3
										dc.w $FD00
										dc.w return_5C4CA-ms_map52_flag200_Section3

; =============== S U B R O U T I N E =======================================

sub_5C4B6:
										
										trap    #1
										dc.w $2C9
loc_5C4BA:
										
										bne.s   return_5C4CA
										lea     word_5C4EE(pc), a0
loc_5C4C0:
										
										jsr     ExecuteMapScript
										trap    #2
										dc.w $2C9
return_5C4CA:
										
										rts

	; End of function sub_5C4B6

