
; SCRIPT SECTION mapsetups\map16\s3 :
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
										
										trap    #1
										dc.w $297
										bne.s   return_51F00
										lea     cs_51F88(pc), a0
										trap    #6
										trap    #2
										dc.w $297
return_51F00:
										
										rts

	; End of function sub_51EF0


; =============== S U B R O U T I N E =======================================

sub_51F02:
										
										trap    #1
										dc.w $1F9
										bne.s   return_51F26
										move.b  #$10,((RAM_EgressMapIdx-$1000000)).w
										trap    #1
										dc.w $298
										bne.s   loc_51F20
										lea     cs_521BA(pc), a0
										trap    #6
										trap    #2
										dc.w $298
										bra.s   return_51F26
loc_51F20:
										
										lea     cs_5227C(pc), a0
										trap    #6
return_51F26:
										
										rts

	; End of function sub_51F02

return_51F28:       rts
