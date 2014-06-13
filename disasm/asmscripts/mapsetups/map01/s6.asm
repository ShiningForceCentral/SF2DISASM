
; SCRIPT SECTION mapsetups\map01\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map1_InitFunction:
										
										trap    #1
										dc.w $15
										beq.s   return_5E770
										move.w  #$88,d0 
										jsr     MoveEntityOutOfMap
return_5E770:
										
										rts

	; End of function ms_map1_InitFunction

cs_5E772:           dc.w 4                  ; 0004 SET TEXT INDEX E41
										dc.w $E41
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $29                ; 0029 SET ENTITY DEST 0 2C 1B
										dc.w 0
										dc.w $2C
										dc.w $1B
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $41                ; 0041 FLASH SCREEN WHITE 1E
										dc.w $1E
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $41                ; 0041 FLASH SCREEN WHITE 1E
										dc.w $1E
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 88 3F 3E 3
										dc.b $88
										dc.b $3F
										dc.b $3E
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 15 2C 1A 3
										dc.b $15
										dc.b $2C
										dc.b $1A
										dc.b 3
										dc.w $1C                ; 001C STOP ENTITY ANIM 15
										dc.w $15
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $41                ; 0041 FLASH SCREEN WHITE 1E
										dc.w $1E
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $29                ; 0029 SET ENTITY DEST 7 2B 1B
										dc.w 7
										dc.w $2B
										dc.w $1B
										dc.w $29                ; 0029 SET ENTITY DEST 1F 2D 1B
										dc.w $1F
										dc.w $2D
										dc.w $1B
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8015
										dc.w $8015
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8015
										dc.w $8015
										dc.w $1B                ; 001B START ENTITY ANIM 15
										dc.w $15
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 15 2
										dc.b $15
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8015
										dc.w $8015
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 15
										dc.w $15
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8015
										dc.w $8015
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 3 1
										dc.b 0
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 2 1
										dc.b $1F
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 0 1
										dc.b 0
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 1 1
										dc.b 0
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 15 3
										dc.b $15
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8015
										dc.w $8015
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8015
										dc.w $8015
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8015
										dc.w $8015
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8015
										dc.w $8015
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8015
										dc.w $8015
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8015
										dc.w $8015
										dc.w 8                  ; 0008 JOIN FORCE 15
										dc.w $15
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8015
										dc.w $8015
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8015
										dc.w $8015
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 7 2
										dc.w $1F
										dc.w 7
										dc.w 2
										dc.w $56                ; 0056 SOMETHING WITH AN ENTITY 15
										dc.w $15
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
