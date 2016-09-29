
; SCRIPT SECTION maps\entries\map16\mapsetups\s3 :
; 
ms_map16_Section3:  dc.b $11
										dc.b $FF
										dc.w sub_51EF0-ms_map16_Section3
										dc.b 3
										dc.b $FF
										dc.w sub_51F02-ms_map16_Section3
										dc.w $FD00
										dc.w return_51F28-ms_map16_Section3

; =============== S U B R O U T I N E =======================================

sub_51EF0:
										
										trap    #TRAP_CHECKFLAG
										dc.w $297               ; set after Galam and Lemon leave with their army
										bne.s   return_51F00
										lea     cs_51F88(pc), a0
										trap    #6
										trap    #TRAP_SETFLAG
										dc.w $297               ; set after Galam and Lemon leave with their army
return_51F00:
										
										rts

	; End of function sub_51EF0


; =============== S U B R O U T I N E =======================================

sub_51F02:
										
										trap    #TRAP_CHECKFLAG
										dc.w $1F9               ; Battle 5 completed
										bne.s   return_51F26
										move.b  #$10,((RAM_EgressMapIdx-$1000000)).w
										trap    #TRAP_CHECKFLAG
										dc.w $298               ; set after the Galam guards catch you sneaking around, but before battle
										bne.s   loc_51F20
										lea     cs_521BA(pc), a0
										trap    #6
										trap    #TRAP_SETFLAG
										dc.w $298               ; set after the Galam guards catch you sneaking around, but before battle
										bra.s   return_51F26
loc_51F20:
										
										lea     cs_5227C(pc), a0
										trap    #6
return_51F26:
										
										rts

	; End of function sub_51F02

return_51F28:       rts
