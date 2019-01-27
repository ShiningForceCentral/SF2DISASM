
; ASM FILE data\maps\entries\map70\mapsetups\s3.asm :
; 0x4FDFE..0x4FE32 : 
ms_map70_ZoneEvents:
		dc.b $10
		dc.b $FF
		dc.w CheckRandomBattle15-ms_map70_ZoneEvents
		dc.b $11
		dc.b $FF
		dc.w CheckRandomBattle15-ms_map70_ZoneEvents
		dc.b $12
		dc.b $FF
		dc.w CheckRandomBattle15-ms_map70_ZoneEvents
		dc.b $13
		dc.b $FF
		dc.w CheckRandomBattle15-ms_map70_ZoneEvents
		dc.w $FD00
		dc.w sub_4FE1E-ms_map70_ZoneEvents

; =============== S U B R O U T I N E =======================================

CheckRandomBattle15:
		
		move.w  #$E,d0
		jsr     CheckRandomBattle
		rts

	; End of function CheckRandomBattle15


; =============== S U B R O U T I N E =======================================

sub_4FE1E:
		 
		chkFlg $1FE             ; Battle 10 completed
		bne.s   return_4FE30
		setFlg $19A             ; Battle 10 unlocked
		move.l  #$100FF,((MAP_EVENT_TYPE-$1000000)).w
return_4FE30:
		rts

	; End of function sub_4FE1E

