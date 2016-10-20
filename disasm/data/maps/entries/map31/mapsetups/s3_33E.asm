
; ASM FILE data\maps\entries\map31\mapsetups\s3_33E.asm :
; 0x5D556..0x5D574 : 
ms_map31_flag33E_ZoneEvents:
		dc.b 5
		dc.b 2
		dc.w sub_5D560-ms_map31_flag33E_ZoneEvents
		dc.w $FD00
		dc.w nullsub_93-ms_map31_flag33E_ZoneEvents

; =============== S U B R O U T I N E =======================================

nullsub_93:
		
		rts

	; End of function nullsub_93


; =============== S U B R O U T I N E =======================================

sub_5D560:
		
		trap    #CHECK_FLAG
		dc.w $342
		bne.s   return_5D570
		lea     cs_5D644(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $342               
						; set after making the Arm of Golem appear in Moun
return_5D570:
		
		rts

	; End of function sub_5D560

		dc.b $4E 
		dc.b $75 
