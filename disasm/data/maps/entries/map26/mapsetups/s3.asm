
; ASM FILE data\maps\entries\map26\mapsetups\s3.asm :
; 0x59DB6..0x59DD2 : 
ms_map26_ZoneEvents:
		msZoneEvent 14, 255, Map26_ZoneEvent0-ms_map26_ZoneEvents
		msDefaultZoneEvent 0, nullsub_91-ms_map26_ZoneEvents

; =============== S U B R O U T I N E =======================================

Map26_ZoneEvent0:
		
		 
		chkFlg  $30C            ; set after the man tries to lift the giant ring in Floor World
		bne.s   return_59DCE
		script  cs_59F20
		setFlg  $30C            ; set after the man tries to lift the giant ring in Floor World
return_59DCE:
		rts

	; End of function Map26_ZoneEvent0


; =============== S U B R O U T I N E =======================================

nullsub_91:
		rts

	; End of function nullsub_91

