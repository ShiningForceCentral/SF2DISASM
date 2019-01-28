
; ASM FILE data\maps\entries\map09\mapsetups\s3.asm :
; 0x56856..0x5687A : 
ms_map9_ZoneEvents:
		msZoneEvent 4, 57, sub_56866-ms_map9_ZoneEvents
		msZoneEvent 4, 58, sub_56866-ms_map9_ZoneEvents
		msZoneEvent 4, 59, sub_56866-ms_map9_ZoneEvents
		msDefaultZoneEvent 0, nullsub_183-ms_map9_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_56866:
		 
		chkFlg  $2D6            ; set after talking to the priest in upstairs Hassan
		bne.s   return_56876
		script  cs_568F6
		setFlg  $2D6            ; set after talking to the priest in upstairs Hassan
return_56876:
		rts

	; End of function sub_56866


; =============== S U B R O U T I N E =======================================

nullsub_183:
		rts

	; End of function nullsub_183

