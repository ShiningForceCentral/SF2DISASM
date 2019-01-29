
; ASM FILE data\maps\entries\map42\mapsetups\s3.asm :
; 0x5FE04..0x5FE24 : 
ms_map42_ZoneEvents:
		msZoneEvent 19, 21, Map42_ZoneEvent0-ms_map42_ZoneEvents
		msDefaultZoneEvent 0, return_5FE22-ms_map42_ZoneEvents

; =============== S U B R O U T I N E =======================================

Map42_ZoneEvent0:
		
		 
		chkFlg  $3E7            ; set after the Nazca ship shootdown scene
		beq.s   return_5FE22
		chkFlg  $385            ; set after the you're pulled toward the Force Sword in the Jewel Cave
		bne.s   return_5FE22
		script  cs_5FE9A
		setFlg  $385            ; set after the you're pulled toward the Force Sword in the Jewel Cave
return_5FE22:
		rts

	; End of function Map42_ZoneEvent0

