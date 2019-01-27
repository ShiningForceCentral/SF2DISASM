
; ASM FILE data\maps\entries\map10\mapsetups\s3_2D2.asm :
; 0x56FC0..0x56FE0 : 
ms_map10_flag2D2_ZoneEvents:
		dc.b 6
		dc.b $17
		dc.w sub_56FC8-ms_map10_flag2D2_ZoneEvents
		dc.w $FD00
		dc.w (nullsub_74-ms_map10_flag2D2_ZoneEvents) & $FFFF

; =============== S U B R O U T I N E =======================================

sub_56FC8:
		 
		chkFlg $D               ; Elric joined
		bne.s   return_56FDE
		chkFlg $2D4             ; set after the scene where Skreech falls in Bedoe
		bne.s   return_56FDE
		script  cs_5779C
		setFlg $2D4             ; set after the scene where Skreech falls in Bedoe
return_56FDE:
		rts

	; End of function sub_56FC8

