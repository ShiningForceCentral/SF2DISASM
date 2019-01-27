
; ASM FILE data\maps\entries\map39\mapsetups\s3.asm :
; 0x5E0B2..0x5E0CE : 
ms_map39_ZoneEvents:
		dc.b $12
		dc.b 7
		dc.w sub_5E0BC-ms_map39_ZoneEvents
		dc.w $FD00
		dc.w nullsub_98-ms_map39_ZoneEvents

; =============== S U B R O U T I N E =======================================

nullsub_98:
		rts

	; End of function nullsub_98


; =============== S U B R O U T I N E =======================================

sub_5E0BC:
		 
		chkFlg $33E             ; set after the Gyan join scene in the Moun underground
		bne.s   return_5E0CC
		lea     cs_5E0F8(pc), a0
		trap    #6
		setFlg $33E             ; set after the Gyan join scene in the Moun underground
return_5E0CC:
		rts

	; End of function sub_5E0BC

