
; ASM FILE data\maps\entries\map61\mapsetups\s3.asm :
; 0x5C696..0x5C6BE : 
ms_map61_ZoneEvents:
		dc.b 4
		dc.b 9
		dc.w sub_5C6A6-ms_map61_ZoneEvents
		dc.b 5
		dc.b 9
		dc.w sub_5C6A6-ms_map61_ZoneEvents
		dc.b 6
		dc.b 9
		dc.w sub_5C6A6-ms_map61_ZoneEvents
		dc.w $FD00
		dc.w return_5C6BC-ms_map61_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_5C6A6:
		 
		chkFlg  $2DA            ; set after the old man opens the door to the Woodel Panel shrine interior
		bne.s   return_5C6BC
		chkFlg  $4D             ; Old man is a follower
		beq.s   return_5C6BC
		script  cs_5C6CA
		setFlg  $2DA            ; set after the old man opens the door to the Woodel Panel shrine interior
return_5C6BC:
		rts

	; End of function sub_5C6A6

