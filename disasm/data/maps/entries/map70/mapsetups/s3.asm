
; ASM FILE data\maps\entries\map70\mapsetups\s3.asm :
; 0x4FDFE..0x4FE32 : 
ms_map70_ZoneEvents:
		dc.b $10
		dc.b $FF
		dc.w sub_4FE12-ms_map70_ZoneEvents
		dc.b $11
		dc.b $FF
		dc.w sub_4FE12-ms_map70_ZoneEvents
		dc.b $12
		dc.b $FF
		dc.w sub_4FE12-ms_map70_ZoneEvents
		dc.b $13
		dc.b $FF
off_4FE0C:      dc.w sub_4FE12-ms_map70_ZoneEvents
		dc.w $FD00
		dc.w sub_4FE1E-ms_map70_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_4FE12:
		move.w  #(off_4FE0C-ms_map70_ZoneEvents),d0
		jsr     sub_47856
		rts

	; End of function sub_4FE12


; =============== S U B R O U T I N E =======================================

sub_4FE1E:
		trap    #CHECK_FLAG
		dc.w $1FE               ; Battle 10 completed
		bne.s   return_4FE30
		trap    #SET_FLAG
		dc.w $19A               ; Battle 10 unlocked
		move.l  #$100FF,((MAP_EVENT_TYPE-$1000000)).w
return_4FE30:
		rts

	; End of function sub_4FE1E

