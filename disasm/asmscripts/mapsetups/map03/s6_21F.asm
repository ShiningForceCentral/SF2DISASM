
; SCRIPT SECTION mapsetups\map03\s6_21F :
; 

; =============== S U B R O U T I N E =======================================

ms_map3_flag21F_InitFunction:
										
										rts

	; End of function ms_map3_flag21F_InitFunction

cs_628C8:           dc.w 4                  ; 0004 SET TEXT INDEX F4B
										dc.w $F4B
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 87
										dc.w $87
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 87
										dc.w $87
										dc.w $29                ; 0029 SET ENTITY DEST 0 19 1C
										dc.w 0
										dc.w $19
										dc.w $1C
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $29                ; 0029 SET ENTITY DEST 88 19 1B
										dc.w $88
										dc.w $19
										dc.w $1B
										dc.w $23                ; 0023 SET ENTITY FACING 88 0
										dc.b $88
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 87 2
										dc.b $87
										dc.b 2
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 88
										dc.w $88
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 88
										dc.w $88
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $15                ; 0015 SET ACTSCRIPT 87 FF 45E44
										dc.b $87
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 87 FF 45E44
										dc.b $87
										dc.b $FF
										dc.l eas_Jump           
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
cs_6290C:           dc.w 9                  ; 0009 HIDE TEXTBOX AND PORTRAIT
										dc.w $2D                ; 002D MOVE ENTITY 8A FF 3 1
										dc.b $8A
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $29                ; 0029 SET ENTITY DEST 0 2A A
										dc.w 0
										dc.w $2A
										dc.w $A
										dc.w $29                ; 0029 SET ENTITY DEST 4 2A A
										dc.w 4
										dc.w $2A
										dc.w $A
										dc.w $29                ; 0029 SET ENTITY DEST 1 2A A
										dc.w 1
										dc.w $2A
										dc.w $A
										dc.w $29                ; 0029 SET ENTITY DEST 3 2A A
										dc.w 3
										dc.w $2A
										dc.w $A
										dc.w $29                ; 0029 SET ENTITY DEST 2 2A A
										dc.w 2
										dc.w $2A
										dc.w $A
										dc.w $2C                ; 002C FOLLOW ENTITY 0 8A 2
										dc.w 0
										dc.w $8A
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 4 8A 5
										dc.w 4
										dc.w $8A
										dc.w 5
										dc.w $2C                ; 002C FOLLOW ENTITY 1 8A 6
										dc.w 1
										dc.w $8A
										dc.w 6
										dc.w $2C                ; 002C FOLLOW ENTITY 3 4 2
										dc.w 3
										dc.w 4
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 2 1 2
										dc.w 2
										dc.w 1
										dc.w 2
										dc.w $2D                ; 002D MOVE ENTITY 8A FF 3 1
										dc.b $8A
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 1
										dc.b 3
										dc.b 1
										dc.b 3
										dc.b 1
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8A FF 3 3
										dc.b $8A
										dc.b $FF
										dc.b 3
										dc.b 3
										dc.b 2
										dc.b 6
										dc.b $C
										dc.b $A
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8A FF 1 8
										dc.b $8A
										dc.b $FF
										dc.b 1
										dc.b 8
										dc.b 2
										dc.b 6
										dc.b 1
										dc.b 2
										dc.b $C
										dc.b $A
										dc.b 1
										dc.b 6
										dc.w $8080
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 131A1E01
										dc.l $131A1E01
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
