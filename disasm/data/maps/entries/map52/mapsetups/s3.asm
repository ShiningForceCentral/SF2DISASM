
; ASM FILE data\maps\entries\map52\mapsetups\s3.asm :
; 0x5C4AA..0x5C4CC : 
ms_map52_ZoneEvents:
		msZoneEvent 3, 23, sub_5C4B6-ms_map52_ZoneEvents
		msZoneEvent 4, 23, sub_5C4B6-ms_map52_ZoneEvents
		msDefaultZoneEvent 0, return_5C4CA-ms_map52_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_5C4B6:
		 
		chkFlg  $2C9            ; set after the scene at the cliffs before Bedoe, where the devils are searching
		bne.s   return_5C4CA
		lea     cs_5C4EE(pc), a0
		jsr     ExecuteMapScript
		setFlg  $2C9            ; set after the scene at the cliffs before Bedoe, where the devils are searching
return_5C4CA:
		rts

	; End of function sub_5C4B6

