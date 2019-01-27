
; ASM FILE data\maps\entries\map63\mapsetups\s5.asm :
; 0x5CA26..0x5CA50 : 
ms_map63_Section5:
		dc.b $15
		dc.b $1A
		dc.b 1
		dc.b $75
		dc.w sub_5CA32-ms_map63_Section5
		dc.b $FD
		dc.b 0
		dc.b 0
		dc.b 0
		dc.w return_5CA4E-ms_map63_Section5

; =============== S U B R O U T I N E =======================================

sub_5CA32:
		 
		chkFlg $1D              ; Claude joined
		bne.s   loc_5CA4C
		moveq   #$75,d0 
		jsr     sub_4F542
		script  cs_5CBB4
		move.w  #$FFFF,d6
		bra.s   return_5CA4E
loc_5CA4C:
		clr.w   d6
return_5CA4E:
		rts

	; End of function sub_5CA32

