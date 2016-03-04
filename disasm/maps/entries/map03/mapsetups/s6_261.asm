
; SCRIPT SECTION maps\entries\map03\mapsetups\s6_261 :
; 

; =============== S U B R O U T I N E =======================================

ms_map3_flag261_InitFunction:
										
										trap    #1
										dc.w 3
										beq.s   return_513CC
										lea     cs_513CE(pc), a0
										trap    #6
return_513CC:
										
										rts

	; End of function ms_map3_flag261_InitFunction

cs_513CE:           dc.w $2E                ; 002E HIDE ENTITY 3
										dc.w 3
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
										dc.b $4E
										dc.b $75 
cs_513D6:           dc.w $2D                ; 002D MOVE ENTITY 1 FF 2 1
										dc.b 1
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_513E2:           dc.w 4                  ; 0004 SET TEXT INDEX 216
										dc.w $216
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1
										dc.w 1
										dc.w $11                ; 0011 STORY YESNO PROMPT
										dc.w $C                 ; 000C JUMP IF SET FLAG 59 51406
										dc.w $59                ; Unkown command : 59
										dc.l word_51406         ; 0005 PLAY SOUND 
										dc.w 4                  ; 0004 SET TEXT INDEX 214
										dc.w $214
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1
										dc.w 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1
										dc.w 1
										dc.w $B                 ; 000B JUMP 51650
										dc.l word_51650         
word_51406:         dc.w 4                  ; 0004 SET TEXT INDEX 217
										dc.w $217
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1
										dc.w 1
										dc.w $23                ; 0023 SET ENTITY FACING 2 2
										dc.b 2
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 2
										dc.w 2
										dc.w $10                ; 0010 SET FLAG 258 FFFF
										dc.w $258
										dc.w $FFFF
										dc.w $10                ; 0010 SET FLAG 42 FFFF
										dc.w $42
										dc.w $FFFF
										dc.w 8                  ; 0008 JOIN FORCE 80
										dc.w $80
										dc.w $2C                ; 002C FOLLOW ENTITY 1 0 2
										dc.w 1
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 2 1 2
										dc.w 2
										dc.w 1
										dc.w 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8A 1B 3 3
										dc.b $8A
										dc.b $1B
										dc.b 3
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8B 1F 3 3
										dc.b $8B
										dc.b $1F
										dc.b 3
										dc.b 3
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_51444:           dc.w $28                ; 0028 MOVE ENTITY NEXT TO PLAYER 8C 2
										dc.w $8C
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5144C:           dc.w $28                ; 0028 MOVE ENTITY NEXT TO PLAYER 8A 1
										dc.w $8A
										dc.w 1
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_51454:           dc.w $28                ; 0028 MOVE ENTITY NEXT TO PLAYER 8B 1
										dc.w $8B
										dc.w 1
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5145C:           dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 460CE
										dc.b $80
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 2
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.b $A
										dc.b $14
										dc.w $8080
										dc.w 4                  ; 0004 SET TEXT INDEX 1FE
										dc.w $1FE
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 4                  ; 0004 SET TEXT INDEX 1E3
										dc.w $1E3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 460CE
										dc.b $80
										dc.b $FF
										dc.l eas_Init           
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5148C:           dc.w $19                ; 0019 SET ENTITY POS AND FACING 1 29 A 1
										dc.b 1
										dc.b $29
										dc.b $A
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 6 4 1
										dc.b $80
										dc.b 6
										dc.b 4
										dc.b 1
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5149A:           dc.w 4                  ; 0004 SET TEXT INDEX 205
										dc.w $205
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8E 2E 7 2
										dc.b $8E
										dc.b $2E
										dc.b 7
										dc.b 2
										dc.w $2D                ; 002D MOVE ENTITY 8E FF 2 1
										dc.b $8E
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 3
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 8E 3
										dc.b $8E
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8E
										dc.w $8E
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8E
										dc.w $8E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8E
										dc.w $8E
										dc.w $2D                ; 002D MOVE ENTITY 8E FF 1 1
										dc.b $8E
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8F
										dc.w $8F
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 1 3
										dc.b 1
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 2 3
										dc.b 2
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 8E 3
										dc.b $8E
										dc.b 3
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 8F
										dc.b $8F
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8F 29 11 1
										dc.b $8F
										dc.b $29
										dc.b $11
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 8F FF 1 6
										dc.b $8F
										dc.b $FF
										dc.b 1
										dc.b 6
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1 1
										dc.b 1
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 2 1
										dc.b 2
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 8F FF 1 1
										dc.b $8F
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $26                ; 0026 MAKE ENTITY NOD 8F
										dc.w $8F
										dc.w $26                ; 0026 MAKE ENTITY NOD 8F
										dc.w $8F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8F
										dc.w $8F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8E
										dc.w $8E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8F
										dc.w $8F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8E
										dc.w $8E
										dc.b $80                ; WAIT F
										dc.b $F
										dc.w $15                ; 0015 SET ACTSCRIPT 8F FF 460CE
										dc.b $8F
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 8F 0 3 3
										dc.b $8F
										dc.b 0
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8E FF 3 3
										dc.b $8E
										dc.b $FF
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 1 3
										dc.b 1
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 2 3
										dc.b 2
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 8F 0 3 1
										dc.b $8F
										dc.b 0
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 1
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8E FF 3 2
										dc.b $8E
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.b 2
										dc.b 1
										dc.b $C
										dc.b $14
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 8F 1
										dc.b $8F
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 8E 1
										dc.b $8E
										dc.b 1
										dc.w $32                ; 0032 SET CAMERA DEST 26 7
										dc.w $26
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8E
										dc.w $8E
										dc.w $2D                ; 002D MOVE ENTITY 8E FF 2 1
										dc.b $8E
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8F 0 3 3
										dc.b $8F
										dc.b 0
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8E FF 3 5
										dc.b $8E
										dc.b $FF
										dc.b 3
										dc.b 5
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 8E
										dc.w $8E
										dc.w $2E                ; 002E HIDE ENTITY 8F
										dc.w $8F
										dc.w $32                ; 0032 SET CAMERA DEST 26 6
										dc.w $26
										dc.w 6
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 2 2
										dc.b 2
										dc.b 2
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 2
										dc.w 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 2
										dc.w 2
										dc.w $2D                ; 002D MOVE ENTITY 1 FF 3 1
										dc.b 1
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 3
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1 1
										dc.b 1
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 2 3
										dc.b 2
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C001
										dc.w $C001
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 2
										dc.w 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C001
										dc.w $C001
										dc.w $2D                ; 002D MOVE ENTITY 1 FF 2 1
										dc.b 1
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1 1
										dc.b 1
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C001
										dc.w $C001
										dc.w $11                ; 0011 STORY YESNO PROMPT
										dc.w $C                 ; 000C JUMP IF SET FLAG 59 51614
										dc.w $59                ; Unkown command : 59
										dc.l word_51614         ; 0005 PLAY SOUND 
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1
										dc.w 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1
										dc.w 1
										dc.w $2D                ; 002D MOVE ENTITY 1 FF 2 2
										dc.b 1
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 2 1
										dc.b 2
										dc.b 1
										dc.w $B                 ; 000B JUMP 51650
										dc.l word_51650         
word_51614:         dc.w 4                  ; 0004 SET TEXT INDEX 217
										dc.w $217
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1
										dc.w 1
										dc.w $23                ; 0023 SET ENTITY FACING 2 2
										dc.b 2
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 2
										dc.w 2
										dc.w $10                ; 0010 SET FLAG 258 FFFF
										dc.w $258
										dc.w $FFFF
										dc.w $10                ; 0010 SET FLAG 42 FFFF
										dc.w $42
										dc.w $FFFF
										dc.w 8                  ; 0008 JOIN FORCE 80
										dc.w $80
										dc.w $2C                ; 002C FOLLOW ENTITY 1 0 2
										dc.w 1
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 2 1 2
										dc.w 2
										dc.w 1
										dc.w 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8A 1B 3 3
										dc.b $8A
										dc.b $1B
										dc.b 3
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8B 1F 3 3
										dc.b $8B
										dc.b $1F
										dc.b 3
										dc.b 3
word_51650:         dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_51652:           dc.w 4                  ; 0004 SET TEXT INDEX 219
										dc.w $219
										dc.w $2D                ; 002D MOVE ENTITY 8A 0 0 1
										dc.b $8A
										dc.b 0
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8B FF 2 1
										dc.b $8B
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 8A 3
										dc.b $8A
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 8B 3
										dc.b $8B
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8A
										dc.w $8A
										dc.w $23                ; 0023 SET ENTITY FACING 1 1
										dc.b 1
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 2 1
										dc.b 2
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C001
										dc.w $C001
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8A
										dc.w $8A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C001
										dc.w $C001
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8A
										dc.w $8A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8B
										dc.w $8B
										dc.w $2D                ; 002D MOVE ENTITY 8A 0 2 1
										dc.b $8A
										dc.b 0
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8B FF 0 1
										dc.b $8B
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 8A 3
										dc.b $8A
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 8B 3
										dc.b $8B
										dc.b 3
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_516A8:           dc.w 4                  ; 0004 SET TEXT INDEX 296
										dc.w $296
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 3
										dc.w 3
										dc.w $28                ; 0028 MOVE ENTITY NEXT TO PLAYER 3 2
										dc.w 3
										dc.w 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 3
										dc.w 3
										dc.w 8                  ; 0008 JOIN FORCE 3
										dc.w 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 3
										dc.w 3
										dc.w $2C                ; 002C FOLLOW ENTITY 3 2 2
										dc.w 3
										dc.w 2
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
