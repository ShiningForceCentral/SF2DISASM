
; ASM FILE data\maps\entries\map22\mapsetups\s3.asm :
; 0x595DE..0x59602 : 
ms_map22_ZoneEvents:
		msZoneEvent 255, 16, Map22_ZoneEvent0-ms_map22_ZoneEvents
		msDefaultZoneEvent 0, nullsub_87-ms_map22_ZoneEvents

; =============== S U B R O U T I N E =======================================

nullsub_87:
		rts

	; End of function nullsub_87


; =============== S U B R O U T I N E =======================================

Map22_ZoneEvent0:
		
		 
		chkFlg  $309            ; set after the Desktop King tells you to fight on the chessboard
		beq.s   return_59600
		chkFlg  $20A            ; Battle 22 completed
		bne.s   return_59600
		move.b  #$16,((EGRESS_MAP_INDEX-$1000000)).w
		script  cs_5994E
return_59600:
		rts

	; End of function Map22_ZoneEvent0

