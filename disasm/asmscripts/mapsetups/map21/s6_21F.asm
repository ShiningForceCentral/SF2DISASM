
; SCRIPT SECTION mapsetups\map21\s6_21F :
; 

; =============== S U B R O U T I N E =======================================

ms_map21_flag21F_InitFunction:
										
										trap    #0
										dc.w MUSIC_TOWN
										jsr     (fadeInFromBlack).w
										rts

	; End of function ms_map21_flag21F_InitFunction

