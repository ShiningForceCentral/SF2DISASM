
; ASM FILE data\maps\entries\map27\mapsetups\s3.asm :
; 0x59F92..0x59FAC : 
ms_map27_ZoneEvents:
		msZoneEvent 255, 19, sub_59F9A-ms_map27_ZoneEvents
		msDefaultZoneEvent 0, return_59FAA-ms_map27_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_59F9A:
		 
		chkFlg  $30D            ; set after the scene where you're surprised by Willard inside the wall
		bne.s   return_59FAA
		script  cs_59FB8
		setFlg  $30D            ; set after the scene where you're surprised by Willard inside the wall
return_59FAA:
		rts

	; End of function sub_59F9A

