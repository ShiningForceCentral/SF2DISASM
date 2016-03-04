
; SCRIPT SECTION maps\entries\map19\mapsetups\s6_261 :
; 

; =============== S U B R O U T I N E =======================================

ms_map19_flag261_InitFunction:
										
										trap    #1
										dc.w $262
										bne.s   return_5311C
										lea     cs_53176(pc), a0
										trap    #6
										trap    #2
										dc.w $262
return_5311C:
										
										rts

	; End of function ms_map19_flag261_InitFunction

