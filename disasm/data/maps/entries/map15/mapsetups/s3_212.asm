
; ASM FILE data\maps\entries\map15\mapsetups\s3_212.asm :
; 0x5CFFE..0x5D020 : 
ms_map15_flag212_ZoneEvents:
		dc.b $18
		dc.b $12
		dc.w sub_5D008-ms_map15_flag212_ZoneEvents
		dc.w $FD00
		dc.w nullsub_77-ms_map15_flag212_ZoneEvents

; =============== S U B R O U T I N E =======================================

nullsub_77:
		rts

	; End of function nullsub_77


; =============== S U B R O U T I N E =======================================

sub_5D008:
		 
		chkFlg $2D4             ; set after the scene where Skreech falls in Bedoe
		beq.s   return_5D01E
		chkFlg $334             ; set after Skreech's join scene has played in Tristan
		bne.s   return_5D01E
		lea     cs_5D04E(pc), a0
		trap    #6
		setFlg $334             ; set after Skreech's join scene has played in Tristan
return_5D01E:
		rts

	; End of function sub_5D008

