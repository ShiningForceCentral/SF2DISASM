
; SCRIPT SECTION mapsetups\map39\s6_33E :
; 

; =============== S U B R O U T I N E =======================================

ms_map39_flag33E_InitFunction:
										
										trap    #1
										dc.w $344
										bne.s   return_5E0EC
										lea     cs_5E0EE(pc), a0
										trap    #6
return_5E0EC:
										
										rts

	; End of function ms_map39_flag33E_InitFunction

cs_5E0EE:           dc.w $2B                ; 002B  1A 4 C 1 FF
										dc.w $1A
										dc.b 4
										dc.b $C
										dc.b 1
										dc.b $FF
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5E0F8:           dc.w 4                  ; 0004 SET TEXT INDEX 805
										dc.w $805
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 18
										dc.w $18
										dc.w $29                ; 0029 SET ENTITY DEST 0 13 7
										dc.w 0
										dc.w $13
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 3 1
										dc.b 7
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 13 8 0
										dc.b $1F
										dc.b $13
										dc.b 8
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 12 8 0
										dc.b 7
										dc.b $12
										dc.b 8
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 18 2
										dc.b $18
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 18
										dc.w $18
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 18
										dc.w $18
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 18
										dc.w $18
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 18
										dc.w $18
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 18
										dc.w $18
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 3 1
										dc.b $1F
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 3 1
										dc.b 0
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 18 FF 2 4
										dc.b $18
										dc.b $FF
										dc.b 2
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 1 1
										dc.b 0
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 1
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 18 0
										dc.b $18
										dc.b 0
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 18
										dc.w $18
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 18 3
										dc.b $18
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 18
										dc.w $18
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 0 1
										dc.b 0
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 1
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 18 0
										dc.b $18
										dc.b 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 18 2
										dc.b $18
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 18 0
										dc.b $18
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 18
										dc.w $18
										dc.w $23                ; 0023 SET ENTITY FACING 18 1
										dc.b $18
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 18
										dc.w $18
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 18 0
										dc.b $18
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 18
										dc.w $18
										dc.w $23                ; 0023 SET ENTITY FACING 18 2
										dc.b $18
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 18
										dc.w $18
										dc.w $23                ; 0023 SET ENTITY FACING 18 0
										dc.b $18
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 18
										dc.w $18
										dc.w 8                  ; 0008 JOIN FORCE 18
										dc.w $18
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 7 2
										dc.w $1F
										dc.w 7
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 18 1F 2
										dc.w $18
										dc.w $1F
										dc.w 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1A 4 C 1
										dc.b $1A
										dc.b 4
										dc.b $C
										dc.b 1
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5E20A:           dc.w 4                  ; 0004 SET TEXT INDEX 819
										dc.w $819
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1A
										dc.w $1A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1A
										dc.w $1A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 1A 3
										dc.b $1A
										dc.b 3
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1A
										dc.w $1A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1A
										dc.w $1A
										dc.w $56                ; 0056 SOMETHING WITH AN ENTITY 1A
										dc.w $1A
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
