
; SCRIPT SECTION maps\entries\map14\mapsetups\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map14_InitFunction:
										
										trap    #1
										dc.w $2BF
										bne.s   return_58F28
										lea     cs_58FA4(pc), a0
										trap    #6
										trap    #2
										dc.w $2BF
										move.b  #$E,((RAM_EgressMapIdx-$1000000)).w
return_58F28:
										
										rts

	; End of function ms_map14_InitFunction

