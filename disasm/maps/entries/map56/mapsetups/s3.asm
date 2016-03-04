
; SCRIPT SECTION maps\entries\map56\mapsetups\s3 :
; 
ms_map56_Section3:  dc.b $2B
										dc.b $28
										dc.w sub_614DE-ms_map56_Section3
										dc.w $FD00
										dc.w return_614FC-ms_map56_Section3

; =============== S U B R O U T I N E =======================================

sub_614DE:
										
										trap    #1
										dc.w $388
										bne.s   return_614FC
										trap    #1
										dc.w $387
										bne.s   loc_614F4
										lea     cs_6150A(pc), a0
										trap    #6
										trap    #2
										dc.w $387
loc_614F4:
										
										trap    #2
										dc.w $1B9
										trap    #2
										dc.w $388
return_614FC:
										
										rts

	; End of function sub_614DE

