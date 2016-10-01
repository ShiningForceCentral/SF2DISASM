
; SCRIPT SECTION maps\entries\map14\mapsetups\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map14_InitFunction:
										
										trap    #TRAP_CHECKFLAG
										dc.w $2BF
										bne.s   return_58F28
										lea     cs_58FA4(pc), a0
										trap    #6
										trap    #TRAP_SETFLAG
										dc.w $2BF               ; set after the scene where Bowie brings the plank above deck, also set after the initial Ribble scene, where the guy runs away
										move.b  #$E,((RAM_EgressMapIdx-$1000000)).w
return_58F28:
										
										rts

	; End of function ms_map14_InitFunction

