
; ASM FILE data\maps\entries\map63\mapsetups\s5.asm :
; 0x5CA26..0x5CA50 : 
ms_map63_Section5:
		msItemEvent 21, 26, UP, 117, Map63_ItemEvent0-ms_map63_Section5
		msDefaultItemEvent return_5CA4E-ms_map63_Section5

; =============== S U B R O U T I N E =======================================

Map63_ItemEvent0:
		
		 
		chkFlg  $1D             ; Claude joined
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

	; End of function Map63_ItemEvent0

