
; ASM FILE data\maps\entries\map31\mapsetups\s3_33E.asm :
; 0x5D556..0x5D574 : 
ms_map31_flag33E_ZoneEvents:
		msZoneEvent 5, LEFT, sub_5D560-ms_map31_flag33E_ZoneEvents
		msDefaultZoneEvent 0, nullsub_93-ms_map31_flag33E_ZoneEvents

; =============== S U B R O U T I N E =======================================

nullsub_93:
		rts

	; End of function nullsub_93


; =============== S U B R O U T I N E =======================================

sub_5D560:
		 
		chkFlg  $342            ; set after making the Arm of Golem appear in Moun
		bne.s   return_5D570
		script  cs_5D644
		setFlg  $342            ; set after making the Arm of Golem appear in Moun
return_5D570:
		rts

	; End of function sub_5D560


; =============== S U B R O U T I N E =======================================

sub_5D572:
		rts

	; End of function sub_5D572

