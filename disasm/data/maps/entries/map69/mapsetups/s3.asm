
; ASM FILE data\maps\entries\map69\mapsetups\s3.asm :
; 0x4FDA2..0x4FDD2 : 
ms_map69_ZoneEvents:
		dc.b $17
		dc.b $FF
		dc.w sub_4FDB2-ms_map69_ZoneEvents
		dc.b $18
		dc.b $FF
		dc.w sub_4FDB2-ms_map69_ZoneEvents
		dc.b $19
		dc.b $FF
		dc.w sub_4FDB2-ms_map69_ZoneEvents
		dc.w $FD00
		dc.w sub_4FDBE-ms_map69_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_4FDB2:
		
		move.w  #(sub_4FDB2+1-ms_map69_ZoneEvents),d0
		jsr     sub_47856
		rts

	; End of function sub_4FDB2


; =============== S U B R O U T I N E =======================================

sub_4FDBE:
		
		trap    #CHECK_FLAG
		dc.w $1FD               
						; Battle 9 completed
		bne.s   return_4FDD0
		trap    #SET_FLAG
		dc.w $199               
						; Battle 9 unlocked
		move.l  #$100FF,((MAP_EVENT_TYPE-$1000000)).w
return_4FDD0:
		
		rts

	; End of function sub_4FDBE

