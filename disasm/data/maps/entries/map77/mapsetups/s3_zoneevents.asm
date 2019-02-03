
; ASM FILE data\maps\entries\map77\mapsetups\s3_zoneevents.asm :
; 0x50A6A..0x50A84 : 
ms_map77_ZoneEvents:
		msDefaultZoneEvent 0, sub_50A6E-ms_map77_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_50A6E:
		 
		chkFlg  $219            ; Battle 37 completed
		bne.s   return_50A80
		setFlg  $1B5            ; Battle 37 unlocked
		move.l  #$100FF,((MAP_EVENT_TYPE-$1000000)).w
return_50A80:
		rts

	; End of function sub_50A6E


; =============== S U B R O U T I N E =======================================

nullsub_167:
		rts

	; End of function nullsub_167

