
; SCRIPT SECTION maps\entries\map40\mapsetups\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map40_InitFunction:
										
										trap    #CHECK_FLAG
										dc.w $1FB               ; Battle 7 completed
										beq.s   return_53FD6
										lea     cs_53FD8(pc), a0
										trap    #6
return_53FD6:
										
										rts

	; End of function ms_map40_InitFunction

cs_53FD8:           dc.w 5                  ; 0005 PLAY SOUND MUSIC_BOSS_ATTACK
										dc.w 6
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_53FE0:           dc.w 4                  ; 0004 INIT TEXT CURSOR 3E5 : "Oh....{N}Go and save her....{W2}"
										dc.w $3E5
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1C
										dc.w $1C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1C : "Oh....{N}Go and save her....{W2}"
										dc.w $1C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1C : "Sir Astral was right....{N}That's not my King.{N}That's a devil!{W2}"
										dc.w $1C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C : "Me?  I'm almost a goner.{N}A strange black cloud{N}enveloped me...(cough)....{W1}"
										dc.w $1C
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1C
										dc.w $1C
										dc.w $1C                ; 001C STOP ENTITY ANIM 1C
										dc.w $1C
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
