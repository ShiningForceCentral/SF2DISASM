
; SCRIPT SECTION mapsetups\map06\s6_2BE :
; 

; =============== S U B R O U T I N E =======================================

ms_map6_InitFunction:
										
										trap    #1
										dc.w $322
										beq.s   loc_54E62
										lea     cs_54E70(pc), a0
										trap    #6
										rts
loc_54E62:
										
										trap    #1
										dc.w $2C2
										beq.s   return_54E6E
										lea     cs_54E78(pc), a0
										trap    #6
return_54E6E:
										
										rts

	; End of function ms_map6_InitFunction

cs_54E70:           dc.w $19                ; 0019 SET ENTITY POS AND FACING 84 B 12 3
										dc.b $84
										dc.b $B
										dc.b $12
										dc.b 3
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_54E78:           dc.w $19                ; 0019 SET ENTITY POS AND FACING 8A 3F 3F 3
										dc.b $8A
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8B F 17 3
										dc.b $8B
										dc.b $F
										dc.b $17
										dc.b 3
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_54E86:           dc.w 4                  ; 0004 SET TEXT INDEX 42A
										dc.w $42A
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 8B
										dc.w $8B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8B
										dc.w $8B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8A
										dc.w $8A
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 8B 3
										dc.b $8B
										dc.b 3
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $23                ; 0023 SET ENTITY FACING 8B 2
										dc.b $8B
										dc.b 2
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8B
										dc.w $8B
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8B
										dc.w $8B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8B
										dc.w $8B
										dc.w $2D                ; 002D MOVE ENTITY 8B FF 3 3
										dc.b $8B
										dc.b $FF
										dc.b 3
										dc.b 3
										dc.b 0
										dc.b 4
										dc.b 3
										dc.b 8
										dc.w $8080
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $15                ; 0015 SET ACTSCRIPT 8B FF 45E44
										dc.b $8B
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 8B 0
										dc.b $8B
										dc.b 0
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $15                ; 0015 SET ACTSCRIPT 8B FF 45E44
										dc.b $8B
										dc.b $FF
										dc.l eas_Jump           
										dc.w $23                ; 0023 SET ENTITY FACING 8B 3
										dc.b $8B
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 8B 0 461B6
										dc.b $8B
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $2D                ; 002D MOVE ENTITY 8B FF 2 1
										dc.b $8B
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 8B 0
										dc.b $8B
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 A 9 3
										dc.b 0
										dc.b $A
										dc.b 9
										dc.b 3
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 8A
										dc.w $8A
										dc.w $2D                ; 002D MOVE ENTITY 8A FF 1 1
										dc.b $8A
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8A
										dc.w $8A
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8A
										dc.w $8A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8A
										dc.w $8A
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 0
										dc.w 0
										dc.w $2D                ; 002D MOVE ENTITY 8A FF 0 1
										dc.b $8A
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 7
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 8A
										dc.w $8A
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_54F26:           dc.w 4                  ; 0004 SET TEXT INDEX 432
										dc.w $432
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 7
										dc.b 7
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 88
										dc.b $88
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 89
										dc.b $89
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 8C
										dc.b $8C
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 46172
										dc.b 7
										dc.b $FF
										dc.l eas_46172          
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 88
										dc.w $88
										dc.w $23                ; 0023 SET ENTITY FACING 88 2
										dc.b $88
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 88
										dc.w $88
										dc.w $23                ; 0023 SET ENTITY FACING 88 0
										dc.b $88
										dc.b 0
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 88 0 0 1
										dc.b $88
										dc.b 0
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 1
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 88 3
										dc.b $88
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 88
										dc.w $88
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 89
										dc.w $89
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 89
										dc.w $89
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 7
										dc.b 7
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 89 0 2 1
										dc.b $89
										dc.b 0
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 3 1
										dc.b 7
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 89 3
										dc.b $89
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 89
										dc.w $89
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 89
										dc.w $89
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 8C
										dc.w $8C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8C
										dc.w $8C
										dc.w $2D                ; 002D MOVE ENTITY 8C 0 1 1
										dc.b $8C
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 2 1
										dc.b 7
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 6
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 88 0
										dc.b $88
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 89 2
										dc.b $89
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8C
										dc.w $8C
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $15                ; 0015 SET ACTSCRIPT 88 0 45E44
										dc.b $88
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 89 0 45E44
										dc.b $89
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 8C FF 45E44
										dc.b $8C
										dc.b $FF
										dc.l eas_Jump           
										dc.w $23                ; 0023 SET ENTITY FACING 88 3
										dc.b $88
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 89 2
										dc.b $89
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 8C 2
										dc.b $8C
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8C
										dc.w $8C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY 89 FF 3 1
										dc.b $89
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 88
										dc.w $88
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 461B6
										dc.b 7
										dc.b 0
										dc.l eas_461B6          
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 88 0
										dc.b $88
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 89 3
										dc.b $89
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 8C 1
										dc.b $8C
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 89
										dc.w $89
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 88 3
										dc.b $88
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 89 2
										dc.b $89
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 8C 2
										dc.b $8C
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.w $2D                ; 002D MOVE ENTITY 88 0 3 1
										dc.b $88
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 89 0 2 1
										dc.b $89
										dc.b 0
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8C 0 2 1
										dc.b $8C
										dc.b 0
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E6C
										dc.b 7
										dc.b $FF
										dc.l eas_JumpLeft       
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 90
										dc.w $90
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 88 1
										dc.b $88
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 89 1
										dc.b $89
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 8C 1
										dc.b $8C
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 82 1
										dc.b $82
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 83 1
										dc.b $83
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 84 1
										dc.b $84
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 85 1
										dc.b $85
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 86 1
										dc.b $86
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 87 1
										dc.b $87
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 8B 1
										dc.b $8B
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 8D 1
										dc.b $8D
										dc.b 1
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 90 10 11 3
										dc.b $90
										dc.b $10
										dc.b $11
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 91 F 10 3
										dc.b $91
										dc.b $F
										dc.b $10
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 92 10 10 3
										dc.b $92
										dc.b $10
										dc.b $10
										dc.b 3
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 90
										dc.w $90
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $2D                ; 002D MOVE ENTITY 90 0 3 3
										dc.b $90
										dc.b 0
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 91 0 3 3
										dc.b $91
										dc.b 0
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 92 FF 3 3
										dc.b $92
										dc.b $FF
										dc.b 3
										dc.b 3
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 92 3
										dc.b $92
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 90
										dc.w $90
										dc.w $2D                ; 002D MOVE ENTITY 88 0 1 2
										dc.b $88
										dc.b 0
										dc.b 1
										dc.b 2
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 89 0 1 2
										dc.b $89
										dc.b 0
										dc.b 1
										dc.b 2
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8C FF 1 2
										dc.b $8C
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 88 1
										dc.b $88
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 89 1
										dc.b $89
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 8C 1
										dc.b $8C
										dc.b 1
										dc.w $32                ; 0032 SET CAMERA DEST C 15
										dc.w $C
										dc.w $15
										dc.w $2D                ; 002D MOVE ENTITY 90 FF 3 2
										dc.b $90
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 3 1
										dc.b $82
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 88 2
										dc.b $88
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 89 2
										dc.b $89
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 8C 2
										dc.b $8C
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 82 3
										dc.b $82
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 83 3
										dc.b $83
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 84 3
										dc.b $84
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 85 3
										dc.b $85
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 86 3
										dc.b $86
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 87 0
										dc.b $87
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 8B 0
										dc.b $8B
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 8D 0
										dc.b $8D
										dc.b 0
										dc.w $2D                ; 002D MOVE ENTITY 90 FF 3 4
										dc.b $90
										dc.b $FF
										dc.b 3
										dc.b 4
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 90
										dc.w $90
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 90
										dc.w $90
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 90
										dc.w $90
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 90
										dc.w $90
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 90
										dc.w $90
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 7
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY 90 0 1 8
										dc.b $90
										dc.b 0
										dc.b 1
										dc.b 8
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 8
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 8
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 91 0
										dc.b $91
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 92 2
										dc.b $92
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w $2D                ; 002D MOVE ENTITY 90 0 2 1
										dc.b $90
										dc.b 0
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 5
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 2 1
										dc.b 7
										dc.b 0
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 5
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 91 0 2 1
										dc.b $91
										dc.b 0
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 5
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 92 FF 2 1
										dc.b $92
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 2
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 90
										dc.w $90
										dc.w $2E                ; 002E HIDE ENTITY 91
										dc.w $91
										dc.w $2E                ; 002E HIDE ENTITY 92
										dc.w $92
										dc.w $2E                ; 002E HIDE ENTITY 7
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 2 1
										dc.b $82
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 82 3
										dc.b $82
										dc.b 3
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_55242:           dc.w 4                  ; 0004 SET TEXT INDEX 463
										dc.w $463
										dc.w $2B                ; 002B  8E B 0 3 CE
										dc.w $8E
										dc.b $B
										dc.b 0
										dc.b 3
										dc.b $CE
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 8E
										dc.b $8E
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$28 Y=$28
										dc.b $28
										dc.b $28
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 8E FF 3 7
										dc.b $8E
										dc.b $FF
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8E
										dc.w $8E
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8E
										dc.w $8E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8E
										dc.w $8E
										dc.w $2D                ; 002D MOVE ENTITY 8E FF 1 7
										dc.b $8E
										dc.b $FF
										dc.b 1
										dc.b 7
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 8E
										dc.w $8E
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_55288:           dc.w 4                  ; 0004 SET TEXT INDEX 466
										dc.w $466
										dc.w $2B                ; 002B  12 10 16 3 12
										dc.w $12
										dc.b $10
										dc.b $16
										dc.b 3
										dc.b $12
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 12
										dc.w $12
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45E44
										dc.b 0
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F 0 45E44
										dc.b $1F
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w $23                ; 0023 SET ENTITY FACING 8B 1
										dc.b $8B
										dc.b 1
										dc.w $32                ; 0032 SET CAMERA DEST E 11
										dc.w $E
										dc.w $11
										dc.w $29                ; 0029 SET ENTITY DEST 0 13 1C
										dc.w 0
										dc.w $13
										dc.w $1C
										dc.w $29                ; 0029 SET ENTITY DEST 1F 14 1C
										dc.w $1F
										dc.w $14
										dc.w $1C
										dc.w $29                ; 0029 SET ENTITY DEST 7 14 1B
										dc.w 7
										dc.w $14
										dc.w $1B
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 12 FF 3 2
										dc.b $12
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.b 0
										dc.b 3
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $32                ; 0032 SET CAMERA DEST E 16
										dc.w $E
										dc.w $16
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01F
										dc.w $C01F
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 12
										dc.w $12
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 12
										dc.w $12
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 12
										dc.w $12
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 12
										dc.w $12
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 1
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01F
										dc.w $C01F
										dc.w $2D                ; 002D MOVE ENTITY 12 FF 3 1
										dc.b $12
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 12
										dc.w $12
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01F
										dc.w $C01F
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 12
										dc.w $12
										dc.w 8                  ; 0008 JOIN FORCE 12
										dc.w $12
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 7 2
										dc.w $1F
										dc.w 7
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 12 1F 2
										dc.w $12
										dc.w $1F
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
