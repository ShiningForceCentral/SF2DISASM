
; SCRIPT SECTION maps\entries\map61\mapsetups\s3 :
; 
ms_map61_Section3:  dc.b 4
										dc.b 9
										dc.w sub_5C6A6-ms_map61_Section3
										dc.b 5
										dc.b 9
										dc.w sub_5C6A6-ms_map61_Section3
										dc.b 6
										dc.b 9
										dc.w sub_5C6A6-ms_map61_Section3
										dc.w $FD00
										dc.w return_5C6BC-ms_map61_Section3

; =============== S U B R O U T I N E =======================================

sub_5C6A6:
										
										trap    #1
										dc.w $2DA
										bne.s   return_5C6BC
										trap    #1
										dc.w $4D
										beq.s   return_5C6BC
										lea     cs_5C6CA(pc), a0
										trap    #6
										trap    #TRAP_SETFLAG
										dc.w $2DA               ; set after the old man opens the door to the Woodel Panel shrine interior
return_5C6BC:
										
										rts

	; End of function sub_5C6A6

