
; ASM FILE data\maps\entries\map63\mapsetups\s3.asm :
; 0x5C9E2..0x5CA24 : 
ms_map63_ZoneEvents:
		msZoneEvent 15, 55, sub_5C9F6-ms_map63_ZoneEvents
		msZoneEvent 13, 42, sub_5C9F6-ms_map63_ZoneEvents
		msZoneEvent 10, 21, sub_5CA14-ms_map63_ZoneEvents
		msZoneEvent 8, 7, sub_5CA1C-ms_map63_ZoneEvents
		msDefaultZoneEvent 0, dftentevt_5CA22-ms_map63_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_5C9F6:
		 
		chkFlg  $100            ; Temporary map setup flag 00
		bne.s   byte_5CA08
		script  cs_5CA6E
		setFlg  $100            ; Temporary map setup flag 00
		bra.s   return_5CA12
byte_5CA08:
		script  cs_5CB34
		clrFlg  $100            ; Temporary map setup flag 00
return_5CA12:
		rts

	; End of function sub_5C9F6


; =============== S U B R O U T I N E =======================================

sub_5CA14:
		 
		script  cs_5CC26
		rts

	; End of function sub_5CA14


; =============== S U B R O U T I N E =======================================

sub_5CA1C:
		 
		script  cs_5CCF6
dftentevt_5CA22:
		
		rts

	; End of function sub_5CA1C

