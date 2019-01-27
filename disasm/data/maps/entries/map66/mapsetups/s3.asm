
; ASM FILE data\maps\entries\map66\mapsetups\s3.asm :
; 0x4FA90..0x4FAE0 : 
ms_map66_ZoneEvents:
		dc.b $FF
		dc.b 9
		dc.w sub_4FAA0-ms_map66_ZoneEvents
		dc.b $FF
		dc.b $A
		dc.w sub_4FAA0-ms_map66_ZoneEvents
		dc.b $FF
		dc.b $1C
		dc.w sub_4FABA-ms_map66_ZoneEvents
		dc.w $FD00
		dc.w CheckRandomBattle3-ms_map66_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_4FAA0:
		 
		chkFlg  $219            ; Battle 37 completed
		beq.s   return_4FAB8
		chkFlg  $21A            ; Battle 38 completed
		bne.s   return_4FAB8
		setFlg  $1B6            ; Battle 38 unlocked
		move.l  #$100FF,((MAP_EVENT_TYPE-$1000000)).w
return_4FAB8:
		rts

	; End of function sub_4FAA0


; =============== S U B R O U T I N E =======================================

sub_4FABA:
		 
		chkFlg  $21A            ; Battle 38 completed
		beq.s   return_4FAD2
		chkFlg  $21B            ; Battle 39 completed
		bne.s   return_4FAD2
		setFlg  $1B7            ; Battle 39 unlocked
		move.l  #$100FF,((MAP_EVENT_TYPE-$1000000)).w
return_4FAD2:
		rts

	; End of function sub_4FABA


; =============== S U B R O U T I N E =======================================

CheckRandomBattle3:
		
		move.w  #3,d0           ; flag $1F7 : Battle 3 completed
		jsr     CheckRandomBattle
		rts

	; End of function CheckRandomBattle3

