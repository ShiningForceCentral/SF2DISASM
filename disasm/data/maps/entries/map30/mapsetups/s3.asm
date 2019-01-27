
; ASM FILE data\maps\entries\map30\mapsetups\s3.asm :
; 0x5A2C2..0x5A2E8 : 
ms_map30_ZoneEvents:
		dc.b 7
		dc.b $D
		dc.w sub_5A2CA-ms_map30_ZoneEvents
		dc.w $FD00
		dc.w return_5A2E6-ms_map30_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_5A2CA:
		 
		chkFlg  $45             ; Fairy is a follower
		beq.s   return_5A2E6
		chkFlg  $2F8            ; set after the fairy cures the sick dwarf in the mine
		bne.s   return_5A2E6
		script  cs_5A33A
		bsr.s   sub_5A278
		setFlg  $2F8            ; set after the fairy cures the sick dwarf in the mine
		clrFlg  $45             ; Fairy is a follower
return_5A2E6:
		rts

	; End of function sub_5A2CA

