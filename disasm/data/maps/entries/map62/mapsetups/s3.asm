
; ASM FILE data\maps\entries\map62\mapsetups\s3.asm :
; 0x5C820..0x5C86A : 
ms_map62_ZoneEvents:
		msZoneEvent 5, 15, sub_5C834-ms_map62_ZoneEvents
		msZoneEvent 6, 15, sub_5C834-ms_map62_ZoneEvents
		msZoneEvent 5, 16, sub_5C84C-ms_map62_ZoneEvents
		msZoneEvent 6, 16, sub_5C84C-ms_map62_ZoneEvents
		msDefaultZoneEvent 0, return_5C868-ms_map62_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_5C834:
		 
		chkFlg  $2D9            ; ???
		bne.s   return_5C84A
		chkFlg  $100            ; Temporary map setup flag 00
		bne.s   return_5C84A
		script  cs_5C876
		setFlg  $100            ; Temporary map setup flag 00
return_5C84A:
		rts

	; End of function sub_5C834


; =============== S U B R O U T I N E =======================================

sub_5C84C:
		 
		chkFlg  $2D9            ; ???
		bne.s   return_5C868
		chkFlg  $100            ; Temporary map setup flag 00
		beq.s   return_5C868
		chkFlg  $101            ; Temporary map setup flag 01
		bne.s   return_5C868
		script  cs_5C8FE
		setFlg  $101            ; Temporary map setup flag 01
return_5C868:
		rts

	; End of function sub_5C84C

