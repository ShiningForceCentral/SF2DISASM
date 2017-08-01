
; ASM FILE data\maps\entries\map19\mapsetups\s6_261.asm :
; 0x5310C..0x5311E : 

; =============== S U B R O U T I N E =======================================

ms_map19_flag261_InitFunction:
		
		trap    #1
		dc.w $262               
						; set after you agree to go to see Hawel
		bne.s   return_5311C
		lea     cs_53176(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $262               
						; set after you agree to go to see Hawel
return_5311C:
		
		rts

	; End of function ms_map19_flag261_InitFunction

