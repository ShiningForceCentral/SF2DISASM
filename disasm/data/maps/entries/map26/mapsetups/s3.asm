
; ASM FILE data\maps\entries\map26\mapsetups\s3.asm :
; 0x59DB6..0x59DD2 : 
ms_map26_ZoneEvents:
		dc.b $E
		dc.b $FF
		dc.w sub_59DBE-ms_map26_ZoneEvents
		dc.w $FD00
		dc.w nullsub_91-ms_map26_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_59DBE:
		 
		chkFlg $30C             ; set after the man tries to lift the giant ring in Floor World
		bne.s   return_59DCE
		lea     cs_59F20(pc), a0
		trap    #6
		setFlg $30C             ; set after the man tries to lift the giant ring in Floor World
return_59DCE:
		rts

	; End of function sub_59DBE


; =============== S U B R O U T I N E =======================================

nullsub_91:
		rts

	; End of function nullsub_91

