
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
										trap    #TRAP_SETFLAG
										dc.w $387               ; set after the first time you talk to Creed on path up Ancient Tower
loc_614F4:
										
										trap    #TRAP_SETFLAG
										dc.w $1B9               ; Battle 41 unlocked
										trap    #TRAP_SETFLAG
										dc.w $388               ; will be set with the 0387, but only if the event isn't triggered by speaking
return_614FC:
										
										rts

	; End of function sub_614DE

