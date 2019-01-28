
; ASM FILE data\maps\entries\map11\mapsetups\s3.asm :
; 0x57A68..0x57A88 : 
ms_map11_ZoneEvents:
		msZoneEvent 39, 11, sub_57A72-ms_map11_ZoneEvents
		msDefaultZoneEvent 0, nullsub_75-ms_map11_ZoneEvents

; =============== S U B R O U T I N E =======================================

nullsub_75:
		rts

	; End of function nullsub_75


; =============== S U B R O U T I N E =======================================

sub_57A72:
		 
		chkFlg  $2D2            ; set after speaking with Volcanon
		bne.s   return_57A86
		script  cs_57AAA
		setFlg  $2D2            ; set after speaking with Volcanon
		setFlg  $2C7            ; set after you dislodge the turtle/fairy in Polca
return_57A86:
		rts

	; End of function sub_57A72

