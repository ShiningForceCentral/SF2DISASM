
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
		trap    #CHECK_FLAG
		dc.w $4C
		beq.s   return_61276
		lea     cs_6143C(pc), a0
		trap    #6
		trap    #CLEAR_FLAG
		dc.w $4C                ; Zynk is a follower
		trap    #SET_FLAG
		dc.w $399               ; set after Zynk leaves you at the Galam Drawbridge (for Roft/Petro death scene)
return_61276:
		rts

	; End of function sub_61262

