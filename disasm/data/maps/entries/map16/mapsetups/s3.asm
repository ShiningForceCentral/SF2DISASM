
; ASM FILE data\maps\entries\map16\mapsetups\s3.asm :
; 0x51EE4..0x51F2A : 
ms_map16_ZoneEvents:
		dc.b $11
		dc.b $FF
		dc.w sub_51EF0-ms_map16_ZoneEvents
		dc.b 3
		dc.b $FF
		dc.w sub_51F02-ms_map16_ZoneEvents
		dc.w $FD00
		dc.w sub_51F28-ms_map16_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_51EF0:
		trap    #CHECK_FLAG
		dc.w $297               ; set after Galam and Lemon leave with their army
		bne.s   return_51F00
		lea     cs_51F88(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $297               ; set after Galam and Lemon leave with their army
return_51F00:
		rts

	; End of function sub_51EF0


; =============== S U B R O U T I N E =======================================

sub_51F02:
		trap    #CHECK_FLAG
		dc.w $1F9               ; Battle 5 completed
		bne.s   return_51F26
		move.b  #$10,((EGRESS_MAP_INDEX-$1000000)).w
		trap    #CHECK_FLAG
		dc.w $298               ; set after the Galam guards catch you sneaking around, but before battle
		bne.s   loc_51F20
		lea     cs_521BA(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $298               ; set after the Galam guards catch you sneaking around, but before battle
		bra.s   return_51F26
loc_51F20:
		lea     cs_5227C(pc), a0
		trap    #6
return_51F26:
		rts

	; End of function sub_51F02


; =============== S U B R O U T I N E =======================================

sub_51F28:
		rts

	; End of function sub_51F28

