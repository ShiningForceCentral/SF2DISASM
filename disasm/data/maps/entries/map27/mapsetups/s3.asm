
; ASM FILE data\maps\entries\map27\mapsetups\s3.asm :
; 0x59F92..0x59FAC : 
ms_map27_ZoneEvents:
		dc.b $FF
		dc.b $13
		dc.w sub_59F9A-ms_map27_ZoneEvents
		dc.w $FD00
		dc.w return_59FAA-ms_map27_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_59F9A:
		trap    #CHECK_FLAG
		dc.w $30D
		bne.s   return_59FAA
		lea     cs_59FB8(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $30D               ; set after the scene where you're surprised by Willard inside the wall
return_59FAA:
		rts

	; End of function sub_59F9A

