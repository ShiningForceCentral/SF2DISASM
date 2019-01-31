
; ASM FILE data\maps\entries\map69\mapsetups\s3.asm :
; 0x4FDA2..0x4FDD2 : 
ms_map69_ZoneEvents:
		msZoneEvent 23, NO_DIRECTION, Map69_ZoneEvent0-ms_map69_ZoneEvents
		msZoneEvent 24, NO_DIRECTION, Map69_ZoneEvent0-ms_map69_ZoneEvents
		msZoneEvent 25, NO_DIRECTION, Map69_ZoneEvent0-ms_map69_ZoneEvents
		msDefaultZoneEvent 0, sub_4FDBE-ms_map69_ZoneEvents

; =============== S U B R O U T I N E =======================================

Map69_ZoneEvent0:
		
		move.w  #$11,d0
		jsr     CheckRandomBattle
		rts

	; End of function Map69_ZoneEvent0


; =============== S U B R O U T I N E =======================================

sub_4FDBE:
		 
		chkFlg  $1FD            ; Battle 9 completed
		bne.s   return_4FDD0
		setFlg  $199            ; Battle 9 unlocked
		move.l  #$100FF,((MAP_EVENT_TYPE-$1000000)).w
return_4FDD0:
		rts

	; End of function sub_4FDBE

