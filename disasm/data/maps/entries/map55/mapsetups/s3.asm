
; ASM FILE data\maps\entries\map55\mapsetups\s3.asm :
; 0x5E248..0x5E25E : 
ms_map55_ZoneEvents:
		msZoneEvent 7, 7, Map55_ZoneEvent0-ms_map55_ZoneEvents
		msDefaultZoneEvent 0, return_5E25C-ms_map55_ZoneEvents

; =============== S U B R O U T I N E =======================================

Map55_ZoneEvent0:
		
		 
		chkFlg  $216            ; Battle 34 completed
		beq.s   return_5E25C
		script  cs_5E27C
return_5E25C:
		rts

	; End of function Map55_ZoneEvent0

