
; SCRIPT SECTION mapsetups\map19\s6_1FB :
; 

; =============== S U B R O U T I N E =======================================

ms_map19_flag1FB_InitFunction:
										
										trap    #1
										dc.w $1FB
										beq.s   return_53174
										lea     cs_53FD8(pc), a0
										trap    #6
return_53174:
										
										rts

	; End of function ms_map19_flag1FB_InitFunction

cs_53176:           dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w 4                  ; 0004 SET TEXT INDEX 2D1
										dc.w $2D1
										dc.w $2B                ; 002B  90 1D 9 1 CF
										dc.w $90
										dc.b $1D
										dc.b 9
										dc.b 1
										dc.b $CF
										dc.w $2B                ; 002B  91 1C 9 1 CE
										dc.w $91
										dc.b $1C
										dc.b 9
										dc.b 1
										dc.b $CE
										dc.w $2B                ; 002B  92 1C A 1 CA
										dc.w $92
										dc.b $1C
										dc.b $A
										dc.b 1
										dc.b $CA
										dc.w $2B                ; 002B  93 1C B 1 CA
										dc.w $93
										dc.b $1C
										dc.b $B
										dc.b 1
										dc.b $CA
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w $2B                ; 002B  94 1E 9 1 CE
										dc.w $94
										dc.b $1E
										dc.b 9
										dc.b 1
										dc.b $CE
										dc.w $2B                ; 002B  95 1E A 1 CA
										dc.w $95
										dc.b $1E
										dc.b $A
										dc.b 1
										dc.b $CA
										dc.w $2B                ; 002B  96 1E B 1 CA
										dc.w $96
										dc.b $1E
										dc.b $B
										dc.b 1
										dc.b $CA
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 1A 9 0
										dc.b 0
										dc.b $1A
										dc.b 9
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1 1A A 0
										dc.b 1
										dc.b $1A
										dc.b $A
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 2 1A B 0
										dc.b 2
										dc.b $1A
										dc.b $B
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8C 3F 3F 3
										dc.b $8C
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1 FF 460CE
										dc.b 1
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 2 FF 460CE
										dc.b 2
										dc.b $FF
										dc.l eas_Init           
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $32                ; 0032 SET CAMERA DEST 18 5
										dc.w $18
										dc.w 5
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 808A
										dc.w $808A
										dc.w $2D                ; 002D MOVE ENTITY 90 FF 1 1
										dc.b $90
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 808A
										dc.w $808A
										dc.w $26                ; 0026 MAKE ENTITY NOD 8A
										dc.w $8A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 808A
										dc.w $808A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 808A
										dc.w $808A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 90
										dc.w $90
										dc.w $23                ; 0023 SET ENTITY FACING 90 3
										dc.b $90
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 90
										dc.w $90
										dc.w $15                ; 0015 SET ACTSCRIPT 91 0 45E44
										dc.b $91
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 92 0 45E44
										dc.b $92
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 93 0 45E44
										dc.b $93
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 94 0 45E44
										dc.b $94
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 95 0 45E44
										dc.b $95
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 96 FF 45E44
										dc.b $96
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 91 0 45E44
										dc.b $91
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 92 0 45E44
										dc.b $92
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 93 0 45E44
										dc.b $93
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 94 0 45E44
										dc.b $94
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 95 0 45E44
										dc.b $95
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 96 FF 45E44
										dc.b $96
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 19
										dc.b $19
										dc.w $2D                ; 002D MOVE ENTITY 90 FF 3 4
										dc.b $90
										dc.b $FF
										dc.b 3
										dc.b 4
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 91 3
										dc.b $91
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 92 3
										dc.b $92
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 93 3
										dc.b $93
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 94 3
										dc.b $94
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 95 3
										dc.b $95
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 96 3
										dc.b $96
										dc.b 3
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 90 1
										dc.b $90
										dc.b 1
										dc.w $32                ; 0032 SET CAMERA DEST 17 6
										dc.w $17
										dc.w 6
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 90
										dc.w $90
										dc.w $2D                ; 002D MOVE ENTITY 90 0 3 6
										dc.b $90
										dc.b 0
										dc.b 3
										dc.b 6
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 91 0 3 6
										dc.b $91
										dc.b 0
										dc.b 3
										dc.b 6
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 92 0 3 6
										dc.b $92
										dc.b 0
										dc.b 3
										dc.b 6
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 93 0 3 6
										dc.b $93
										dc.b 0
										dc.b 3
										dc.b 6
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 94 0 3 6
										dc.b $94
										dc.b 0
										dc.b 3
										dc.b 6
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 95 0 3 6
										dc.b $95
										dc.b 0
										dc.b 3
										dc.b 6
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 96 FF 3 6
										dc.b $96
										dc.b $FF
										dc.b 3
										dc.b 6
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 90
										dc.w $90
										dc.w $2E                ; 002E HIDE ENTITY 91
										dc.w $91
										dc.w $2E                ; 002E HIDE ENTITY 92
										dc.w $92
										dc.w $2E                ; 002E HIDE ENTITY 93
										dc.w $93
										dc.w $2E                ; 002E HIDE ENTITY 94
										dc.w $94
										dc.w $2E                ; 002E HIDE ENTITY 95
										dc.w $95
										dc.w $2E                ; 002E HIDE ENTITY 96
										dc.w $96
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $32                ; 0032 SET CAMERA DEST 18 6
										dc.w $18
										dc.w 6
										dc.w $2D                ; 002D MOVE ENTITY 8A FF 3 3
										dc.b $8A
										dc.b $FF
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.b $80                ; WAIT 46
										dc.b $46
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 808A
										dc.w $808A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 808A
										dc.w $808A
										dc.w $23                ; 0023 SET ENTITY FACING 8A 2
										dc.b $8A
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 1 FF 0 1
										dc.b 1
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1
										dc.w 1
										dc.w $2D                ; 002D MOVE ENTITY 2 FF 0 1
										dc.b 2
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 2
										dc.w 2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 8A
										dc.b $8A
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
										dc.b $10
										dc.b $10
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 8A FF 2 1
										dc.b $8A
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 808A
										dc.w $808A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 808A
										dc.w $808A
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8C
										dc.w $8C
										dc.w $23                ; 0023 SET ENTITY FACING 8A 3
										dc.b $8A
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8C 17 D 1
										dc.b $8C
										dc.b $17
										dc.b $D
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 8C FF 0 3
										dc.b $8C
										dc.b $FF
										dc.b 0
										dc.b 3
										dc.b 1
										dc.b 1
										dc.b 0
										dc.b 3
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 8A 0
										dc.b $8A
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 808A
										dc.w $808A
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 8C 0 461E4
										dc.b $8C
										dc.b 0
										dc.l eas_461E4          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $23                ; 0023 SET ENTITY FACING 8C 2
										dc.b $8C
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8C
										dc.w $8C
										dc.w $26                ; 0026 MAKE ENTITY NOD 8A
										dc.w $8A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 808A
										dc.w $808A
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $32                ; 0032 SET CAMERA DEST 17 5
										dc.w $17
										dc.w 5
										dc.w $2D                ; 002D MOVE ENTITY 8C FF 1 1
										dc.b $8C
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b $C
										dc.b $28
										dc.b 1
										dc.b 1
										dc.b $C
										dc.b $28
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8C FF C 28
										dc.b $8C
										dc.b $FF
										dc.b $C
										dc.b $28
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 8C 3
										dc.b $8C
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 8A FF 0 1
										dc.b $8A
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 8A 1
										dc.b $8A
										dc.b 1
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8C
										dc.w $8C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8C
										dc.w $8C
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 8A
										dc.b $8A
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 8A FF 1 1
										dc.b $8A
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 808A
										dc.w $808A
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8C
										dc.w $8C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8C
										dc.w $8C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 808A
										dc.w $808A
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8C
										dc.w $8C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8C
										dc.w $8C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 808A
										dc.w $808A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8C
										dc.w $8C
										dc.w $23                ; 0023 SET ENTITY FACING 8A 3
										dc.b $8A
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 808A
										dc.w $808A
										dc.w $1C                ; 001C STOP ENTITY ANIM 8C
										dc.w $8C
										dc.w $1C                ; 001C STOP ENTITY ANIM 8A
										dc.w $8A
										dc.b $80                ; WAIT 50
										dc.b $50
										dc.w $15                ; 0015 SET ACTSCRIPT 8C FF 45E44
										dc.b $8C
										dc.b $FF
										dc.l eas_Jump           
										dc.w $1B                ; 001B START ENTITY ANIM 8C
										dc.w $8C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8C
										dc.w $8C
										dc.w $15                ; 0015 SET ACTSCRIPT 8A FF 45E44
										dc.b $8A
										dc.b $FF
										dc.l eas_Jump           
										dc.w $1B                ; 001B START ENTITY ANIM 8A
										dc.w $8A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 808A
										dc.w $808A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8C
										dc.w $8C
										dc.w $23                ; 0023 SET ENTITY FACING 8A 1
										dc.b $8A
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 808A
										dc.w $808A
										dc.w $2D                ; 002D MOVE ENTITY 8A FF 3 1
										dc.b $8A
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 8A 2
										dc.b $8A
										dc.b 2
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 808A
										dc.w $808A
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 0 1
										dc.b 0
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 808A
										dc.w $808A
										dc.w $2D                ; 002D MOVE ENTITY 8C FF 3 1
										dc.b $8C
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8C
										dc.w $8C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8C
										dc.w $8C
word_53482:         dc.w $11                ; 0011 STORY YESNO PROMPT
										dc.w $C                 ; 000C JUMP IF SET FLAG 59 534AC
										dc.w $59
										dc.l word_534AC         
										dc.w 9                  ; 0009 HIDE TEXTBOX AND PORTRAIT
										dc.w 4                  ; 0004 SET TEXT INDEX 2F5
										dc.w $2F5
										dc.w $15                ; 0015 SET ACTSCRIPT 8A FF 45E44
										dc.b $8A
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 8A FF 45E44
										dc.b $8A
										dc.b $FF
										dc.l eas_Jump           
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 808A
										dc.w $808A
										dc.w $B                 ; 000B JUMP 53482
										dc.l word_53482         
word_534AC:         dc.w $2D                ; 002D MOVE ENTITY 8C FF 3 1
										dc.b $8C
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 8C 2
										dc.b $8C
										dc.b 2
										dc.w 4                  ; 0004 SET TEXT INDEX 2F6
										dc.w $2F6
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8C
										dc.w $8C
										dc.w $2C                ; 002C FOLLOW ENTITY 1 0 2
										dc.w 1
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 2 1 2
										dc.w 2
										dc.w 1
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_534D2:           dc.w 4                  ; 0004 SET TEXT INDEX 2B6
										dc.w $2B6
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C
										dc.w $1C
										dc.w $32                ; 0032 SET CAMERA DEST 11 6
										dc.w $11
										dc.w 6
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8080
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 1
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $29                ; 0029 SET ENTITY DEST 80 17 C
										dc.w $80
										dc.w $17
										dc.w $C
										dc.w $29                ; 0029 SET ENTITY DEST 1C 14 A
										dc.w $1C
										dc.w $14
										dc.w $A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C
										dc.w $1C
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 5 1
										dc.b $80
										dc.b $FF
										dc.b 5
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8080
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8080
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1C 0
										dc.b $1C
										dc.b 0
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 1C 1
										dc.b $1C
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 1C
										dc.w $1C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C
										dc.w $1C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8080
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1C 0
										dc.b $1C
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C
										dc.w $1C
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.w $23                ; 0023 SET ENTITY FACING 1C 1
										dc.b $1C
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 98
										dc.w $98
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8082
										dc.w $8082
										dc.w $23                ; 0023 SET ENTITY FACING 1C 0
										dc.b $1C
										dc.b 0
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8080
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080
										dc.w $8080
										dc.w $29                ; 0029 SET ENTITY DEST 80 15 A
										dc.w $80
										dc.w $15
										dc.w $A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C
										dc.w $1C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 1C 3
										dc.b $1C
										dc.b 3
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $23                ; 0023 SET ENTITY FACING 1C 0
										dc.b $1C
										dc.b 0
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $26                ; 0026 MAKE ENTITY NOD 1C
										dc.w $1C
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 2 1
										dc.b $1C
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 1
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 1 3
										dc.b $1C
										dc.b $FF
										dc.b 1
										dc.b 3
										dc.b 2
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 1
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080
										dc.w $8080
										dc.w $26                ; 0026 MAKE ENTITY NOD 84
										dc.w $84
										dc.w $26                ; 0026 MAKE ENTITY NOD 85
										dc.w $85
										dc.w $2D                ; 002D MOVE ENTITY 80 0 1 3
										dc.b $80
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b 2
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 85 0 0 1
										dc.b $85
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 3
										dc.b 2
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 84 FF 1 1
										dc.b $84
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 3
										dc.b 2
										dc.b 3
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 80
										dc.w $80
										dc.w $2E                ; 002E HIDE ENTITY 1C
										dc.w $1C
										dc.w $2E                ; 002E HIDE ENTITY 84
										dc.w $84
										dc.w $2E                ; 002E HIDE ENTITY 85
										dc.w $85
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_535FA:           dc.w 4                  ; 0004 SET TEXT INDEX 2B2
										dc.w $2B2
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82
										dc.w $82
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.w $2C                ; 002C FOLLOW ENTITY 82 0 2
										dc.w $82
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 81 82 2
										dc.w $81
										dc.w $82
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_53620:           dc.w 4                  ; 0004 SET TEXT INDEX 2C9
										dc.w $2C9
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5362A:           dc.w 4                  ; 0004 SET TEXT INDEX 2CA
										dc.w $2CA
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
