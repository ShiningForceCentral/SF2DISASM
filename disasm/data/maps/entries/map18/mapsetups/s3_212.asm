
; ASM FILE data\maps\entries\map18\mapsetups\s3_212.asm :
; 0x6125A..0x61278 : 
ms_map18_flag212_ZoneEvents:
		dc.b $FF
		dc.b $16
		dc.w sub_61262-ms_map18_flag212_ZoneEvents
		dc.w $FD00
		dc.w return_61276-ms_map18_flag212_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_61262:
		 
		chkFlg $4C              ; Zynk is a follower
		beq.s   return_61276
		lea     cs_6143C(pc), a0
		trap    #6
		clrFlg $4C              ; Zynk is a follower
		setFlg $399             ; set after Zynk leaves you at the Galam Drawbridge (for Roft/Petro death scene)
return_61276:
		rts

	; End of function sub_61262

