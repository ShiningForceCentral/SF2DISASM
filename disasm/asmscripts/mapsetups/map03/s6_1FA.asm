
; SCRIPT SECTION mapsetups\map03\s6_1FA :
; 

; =============== S U B R O U T I N E =======================================

ms_map3_flag1FA_InitFunction:
										
										trap    #1
										dc.w 6
										beq.s   loc_5136C
										lea     cs_51374(pc), a0
										trap    #6
loc_5136C:
										
										lea     cs_5137A(pc), a0
										trap    #6
										rts

	; End of function ms_map3_flag1FA_InitFunction

cs_51374:           dc.w $2E                ; 002E HIDE ENTITY 6
										dc.w 6
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5137A:           dc.w 5                  ; 0005 PLAY SOUND MUSIC_SAD_THEME_2
										dc.w $C
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
