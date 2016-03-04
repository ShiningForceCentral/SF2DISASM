
; SCRIPT SECTION maps\entries\map33\mapsetups\s6_312 :
; 

; =============== S U B R O U T I N E =======================================

ms_map33_flag312_InitFunction:
										
										rts

	; End of function ms_map33_flag312_InitFunction

cs_5AC58:           dc.w 4                  ; 0004 SET TEXT INDEX 70C
										dc.w $70C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $32                ; 0032 SET CAMERA DEST C B
										dc.w $C
										dc.w $B
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $47                ; 0047  11 B
										dc.w $11
										dc.w $B
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 11 B 3
										dc.b $80
										dc.b $11
										dc.b $B
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 3
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 461B6
										dc.b $80
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 50
										dc.b $50
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 5
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 5
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 F 15 1
										dc.b 7
										dc.b $F
										dc.b $15
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 F 16 1
										dc.b 0
										dc.b $F
										dc.b $16
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F F 17 1
										dc.b $1F
										dc.b $F
										dc.b $17
										dc.b 1
										dc.w $47                ; 0047  F 14
										dc.w $F
										dc.w $14
										dc.w $32                ; 0032 SET CAMERA DEST 8 C
										dc.w 8
										dc.w $C
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.w $2D                ; 002D MOVE ENTITY 7 0 1 4
										dc.b 7
										dc.b 0
										dc.b 1
										dc.b 4
										dc.b 2
										dc.b 3
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 0 0 1 5
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 5
										dc.b 2
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 6
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 6
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $1B                ; 001B START ENTITY ANIM 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 3 1
										dc.b 7
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 0
										dc.w 0
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 3 1
										dc.b 7
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 1
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 2 1
										dc.b 7
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 0
										dc.w 0
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45E44
										dc.b 0
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 45E44
										dc.b 7
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$28 Y=$28
										dc.b $28
										dc.b $28
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 7
										dc.b 7
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$28 Y=$28
										dc.b $28
										dc.b $28
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1F
										dc.b $1F
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$28 Y=$28
										dc.b $28
										dc.b $28
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 7 0 0 5
										dc.b 7
										dc.b 0
										dc.b 0
										dc.b 5
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F 0 0 5
										dc.b $1F
										dc.b 0
										dc.b 0
										dc.b 5
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 0 0 0 5
										dc.b 0
										dc.b 0
										dc.b 0
										dc.b 5
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 11 C 3
										dc.b $80
										dc.b $11
										dc.b $C
										dc.b 3
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 3
										dc.w $16                ; 0016 WAIT UNTIL IDLE ENTITY 0
										dc.w 0
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 45F0C
										dc.b 7
										dc.b 0
										dc.l eas_BumpUp         
										dc.w $15                ; 0015 SET ACTSCRIPT 1F 0 45F0C
										dc.b $1F
										dc.b 0
										dc.l eas_BumpUp         
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 45F0C
										dc.b 0
										dc.b $FF
										dc.l eas_BumpUp         
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 46172
										dc.b 0
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 46172
										dc.b 7
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 46172
										dc.b $1F
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 7
										dc.b 7
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1F
										dc.b $1F
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 0 0 3 1
										dc.b 0
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 3 1
										dc.b 7
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 3 1
										dc.b $1F
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.b $80                ; WAIT 19
										dc.b $19
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 461B6
										dc.b 7
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 7 2
										dc.w $1F
										dc.w 7
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5AF36:           dc.w 4                  ; 0004 SET TEXT INDEX 72A
										dc.w $72A
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 460CE
										dc.b $80
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 2
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 461B6
										dc.b 0
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 461E4
										dc.b 7
										dc.b 0
										dc.l eas_461E4          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 1F 0 461B6
										dc.b $1F
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $41                ; 0041 FLASH SCREEN WHITE 1E
										dc.w $1E
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 463AE
										dc.b 0
										dc.b 0
										dc.l eas_463AE          
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 463AE
										dc.b 7
										dc.b 0
										dc.l eas_463AE          
										dc.w $15                ; 0015 SET ACTSCRIPT 1F 0 463AE
										dc.b $1F
										dc.b 0
										dc.l eas_463AE          
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 460CE
										dc.b $80
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 3
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 3
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.w $1B                ; 001B START ENTITY ANIM 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $47                ; 0047  C D
										dc.w $C
										dc.w $D
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 2
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.b 2
										dc.b 5
										dc.b 9
										dc.b $14
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 16000003
										dc.l $16000003
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5B016:           dc.w 4                  ; 0004 SET TEXT INDEX 730
										dc.w $730
										dc.w $46                ; 0046  C 2
										dc.w $C
										dc.w 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 3F 3F 3
										dc.b 0
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 3F 3F 3
										dc.b 7
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 3F 3F 3
										dc.b $1F
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081
										dc.w $8081
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 1
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081
										dc.w $8081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 11 E 1
										dc.b $80
										dc.b $11
										dc.b $E
										dc.b 1
										dc.w $32                ; 0032 SET CAMERA DEST C 4
										dc.w $C
										dc.w 4
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 2
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $47                ; 0047  11 B
										dc.w $11
										dc.w $B
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 3
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081
										dc.w $8081
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081
										dc.w $8081
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 1
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081
										dc.w $8081
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8081
										dc.w $8081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081
										dc.w $8081
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 81 1
										dc.b $81
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
										dc.b $10
										dc.b $10
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 1
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081
										dc.w $8081
										dc.w $26                ; 0026 MAKE ENTITY NOD 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 5
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 5
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 81 1
										dc.b $81
										dc.b 1
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081
										dc.w $8081
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 461B6
										dc.b $81
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 1
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 461B6
										dc.b $81
										dc.b 0
										dc.l eas_461B6          
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081
										dc.w $8081
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 2 1
										dc.b $81
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 460CE
										dc.b $81
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 45E44
										dc.b $81
										dc.b $FF
										dc.l eas_Jump           
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8081
										dc.w $8081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081
										dc.w $8081
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8081
										dc.w $8081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081
										dc.w $8081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081
										dc.w $8081
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
										dc.b $10
										dc.b $10
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 46172
										dc.b $81
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 1
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 81
										dc.w $81
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 81
										dc.w $81
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081
										dc.w $8081
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $41                ; 0041 FLASH SCREEN WHITE 1E
										dc.w $1E
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 10 9 3
										dc.b 0
										dc.b $10
										dc.b 9
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 46310
										dc.b 0
										dc.b 0
										dc.l eas_46310          
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 F 9 3
										dc.b 7
										dc.b $F
										dc.b 9
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 46310
										dc.b 7
										dc.b 0
										dc.l eas_46310          
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 11 9 3
										dc.b $1F
										dc.b $11
										dc.b 9
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 1F 0 46310
										dc.b $1F
										dc.b 0
										dc.l eas_46310          
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 461B6
										dc.b 0
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 461E4
										dc.b 7
										dc.b 0
										dc.l eas_461E4          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 1F 0 461B6
										dc.b $1F
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $26                ; 0026 MAKE ENTITY NOD 1F
										dc.w $1F
										dc.w $26                ; 0026 MAKE ENTITY NOD 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081
										dc.w $8081
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82
										dc.w $82
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 10 0 3
										dc.b $82
										dc.b $10
										dc.b 0
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 3 7
										dc.b $82
										dc.b $FF
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82
										dc.w $82
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081
										dc.w $8081
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 3 1
										dc.b $82
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82
										dc.w $82
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 82 0 461B6
										dc.b $82
										dc.b 0
										dc.l eas_461B6          
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82
										dc.w $82
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 460CE
										dc.b $81
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 1
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 82 3
										dc.b $82
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 81 0
										dc.b $81
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081
										dc.w $8081
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 46172
										dc.b $82
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 82 0 0 1
										dc.b $82
										dc.b 0
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 0 1
										dc.b $81
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081
										dc.w $8081
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
										dc.b $10
										dc.b $10
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 1
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081
										dc.w $8081
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 4
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 4
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 82 1
										dc.b $82
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 81 0
										dc.b $81
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 1
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 81 0
										dc.b $81
										dc.b 0
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 81
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $33                ; 0033 SET QUAKE AMOUNT 4
										dc.w 4
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 0 1
										dc.b $80
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 46102
										dc.b $82
										dc.b $FF
										dc.l eas_Init2          
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 1 1
										dc.b $82
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 82 2
										dc.b $82
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82
										dc.w $82
										dc.w $23                ; 0023 SET ENTITY FACING 81 0
										dc.b $81
										dc.b 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81
										dc.w $81
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 82
										dc.w $82
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82
										dc.w $82
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46172
										dc.b $80
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
										dc.b $10
										dc.b $10
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 80 0 3 1
										dc.b $80
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $33                ; 0033 SET QUAKE AMOUNT 4
										dc.w 4
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 460CE
										dc.b $80
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 1
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8081
										dc.w $8081
										dc.w $23                ; 0023 SET ENTITY FACING 81 2
										dc.b $81
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081
										dc.w $8081
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 460CE
										dc.b $81
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 2 3
										dc.b $81
										dc.b $FF
										dc.b 2
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 2
										dc.b 4
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 81
										dc.w $81
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 46102
										dc.b $82
										dc.b $FF
										dc.l eas_Init2          
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 2 1
										dc.b $82
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82
										dc.w $82
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 1 1
										dc.b $82
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b 2
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 2
										dc.b 4
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 82
										dc.w $82
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 7 2
										dc.w $1F
										dc.w 7
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5B466:           dc.w 4                  ; 0004 SET TEXT INDEX 78C
										dc.w $78C
										dc.w $32                ; 0032 SET CAMERA DEST C F
										dc.w $C
										dc.w $F
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1F
										dc.w $1F
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 82 1
										dc.b $82
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 11 F 3
										dc.b $81
										dc.b $11
										dc.b $F
										dc.b 3
										dc.w $32                ; 0032 SET CAMERA DEST C 7
										dc.w $C
										dc.w 7
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 460CE
										dc.b $82
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 F 17 1
										dc.b 0
										dc.b $F
										dc.b $17
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 F 16 1
										dc.b 7
										dc.b $F
										dc.b $16
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 10 16 1
										dc.b $1F
										dc.b $10
										dc.b $16
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 10 17 1
										dc.b $82
										dc.b $10
										dc.b $17
										dc.b 1
										dc.w $2E                ; 002E HIDE ENTITY E
										dc.w $E
										dc.w $2E                ; 002E HIDE ENTITY 10
										dc.w $10
										dc.w $2E                ; 002E HIDE ENTITY 11
										dc.w $11
										dc.w $2E                ; 002E HIDE ENTITY F
										dc.w $F
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 81
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 2
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.b 2
										dc.b 2
										dc.b 3
										dc.b 4
										dc.w $8080
										dc.w $32                ; 0032 SET CAMERA DEST A 12
										dc.w $A
										dc.w $12
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 0 1
										dc.b $81
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 801F
										dc.w $801F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 2 1
										dc.b $81
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 1
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 81 0
										dc.b $81
										dc.b 0
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $26                ; 0026 MAKE ENTITY NOD 81
										dc.w $81
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 2 1
										dc.b $81
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 2 1
										dc.b $1F
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 801F
										dc.w $801F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.w $26                ; 0026 MAKE ENTITY NOD 1F
										dc.w $1F
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 1
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 46
										dc.b $46
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 3
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 1F
										dc.w $1F
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 0 1
										dc.b $81
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 82 7 2
										dc.w $82
										dc.w 7
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
