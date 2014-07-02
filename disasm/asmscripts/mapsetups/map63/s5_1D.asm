
; SCRIPT SECTION mapsetups\map63\s5_1D :
; 
ms_map63_Section5:  dc.b $15
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
										
										trap    #1
										dc.w $1D
										bne.s   loc_5CA4C
										moveq   #$75,d0 
										jsr     sub_4F542
										lea     cs_5CBB4(pc), a0
										trap    #6
										move.w  #$FFFF,d6
										bra.s   return_5CA4E
loc_5CA4C:
										
										clr.w   d6
return_5CA4E:
										
										rts

	; End of function sub_5CA32

