
; ASM FILE data\maps\entries\map56\mapsetups\s3.asm :
; 0x614D6..0x614FE : 
ms_map56_ZoneEvents:
		dc.b $2B
		dc.b $28
		dc.w sub_614DE-ms_map56_ZoneEvents
		dc.w $FD00
		dc.w return_614FC-ms_map56_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_614DE:
		
		trap    #CHECK_FLAG
		dc.w $388
		bne.s   return_614FC
		trap    #CHECK_FLAG
		dc.w $387
		bne.s   loc_614F4
		lea     cs_6150A(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $387               
						; set after the first time you talk to Creed on path up Ancient Tower
loc_614F4:
		
		trap    #SET_FLAG
		dc.w $1B9               
						; Battle 41 unlocked
		trap    #SET_FLAG
		dc.w $388               
						; will be set with the 0387, but only if the event isn't triggered by speaking
return_614FC:
		
		rts

	; End of function sub_614DE

