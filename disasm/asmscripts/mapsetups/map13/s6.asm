
; SCRIPT SECTION mapsetups\map13\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map13_InitFunction:
										
										trap    #1
										dc.w $2C7
										bne.s   loc_582EC
										lea     cs_58310(pc), a0
										trap    #6
loc_582EC:
										
										trap    #1
										dc.w $2CC
										beq.s   loc_582FE
										move.w  #$89,d0 
										moveq   #3,d1
										jsr     sub_4781A
loc_582FE:
										
										trap    #1
										dc.w $2CE
										beq.s   return_5830E
										move.w  #$8C,d0 
										jsr     MoveEntityOutOfMap
return_5830E:
										
										rts

	; End of function ms_map13_InitFunction

cs_58310:           dc.w $23                ; 0023 SET ENTITY FACING 82 3
										dc.b $82
										dc.b 3
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 82
										dc.b $82
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $3
										dc.w 3
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $1B                ; 001B START ENTITY ANIM 82
										dc.w $82
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_58330:           dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w $33                ; 0033 SET QUAKE AMOUNT 6
										dc.w 6
										dc.w $41                ; 0041 FLASH SCREEN WHITE 5A
										dc.w $5A
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 461B6
										dc.b 0
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 85 0 461E4
										dc.b $85
										dc.b 0
										dc.l eas_461E4          
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 461B6
										dc.b 7
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 64
										dc.b $64
										dc.w 4                  ; 0004 SET TEXT INDEX 5AC
										dc.w $5AC
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8C 1D 7 2
										dc.b $8C
										dc.b $1D
										dc.b 7
										dc.b 2
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 8C
										dc.b $8C
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
										dc.b 8
										dc.b 8
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 8C FF 2 2
										dc.b $8C
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 8C
										dc.b $8C
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$4 Y=$4
										dc.b 4
										dc.b 4
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w $2D                ; 002D MOVE ENTITY 8C FF 2 1
										dc.b $8C
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 8C FF 46172
										dc.b $8C
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 8C
										dc.b $8C
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$20 Y=$20
										dc.b $20
										dc.b $20
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 8C 0 3 1
										dc.b $8C
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 8C FF 461AA
										dc.b $8C
										dc.b $FF
										dc.l eas_461AA          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 8C
										dc.b $8C
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $23                ; 0023 SET ENTITY FACING 85 0
										dc.b $85
										dc.b 0
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 85
										dc.w $85
										dc.w $2D                ; 002D MOVE ENTITY 85 FF 0 3
										dc.b $85
										dc.b $FF
										dc.b 0
										dc.b 3
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 85 3
										dc.b $85
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 85
										dc.w $85
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 85 0
										dc.b $85
										dc.b 0
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $2D                ; 002D MOVE ENTITY 85 FF 2 2
										dc.b $85
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 85 FF 45E44
										dc.b $85
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 85 0 45E44
										dc.b $85
										dc.b 0
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 85
										dc.w $85
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 89 11 7 0
										dc.b $89
										dc.b $11
										dc.b 7
										dc.b 0
										dc.w $32                ; 0032 SET CAMERA DEST D 3
										dc.w $D
										dc.w 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 19 9 1
										dc.b 0
										dc.b $19
										dc.b 9
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 19 9 1
										dc.b 7
										dc.b $19
										dc.b 9
										dc.b 1
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 89
										dc.w $89
										dc.w $2D                ; 002D MOVE ENTITY 89 FF 0 5
										dc.b $89
										dc.b $FF
										dc.b 0
										dc.b 5
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 89 0
										dc.b $89
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 89
										dc.w $89
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 85
										dc.w $85
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 89
										dc.w $89
										dc.w $2D                ; 002D MOVE ENTITY 89 FF 3 1
										dc.b $89
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 3
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 85 0
										dc.b $85
										dc.b 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 89
										dc.w $89
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 89
										dc.w $89
										dc.w $2D                ; 002D MOVE ENTITY 85 FF 0 3
										dc.b $85
										dc.b $FF
										dc.b 0
										dc.b 3
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 85 2
										dc.b $85
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 85
										dc.w $85
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 89
										dc.w $89
										dc.w $26                ; 0026 MAKE ENTITY NOD 85
										dc.w $85
										dc.w $2D                ; 002D MOVE ENTITY 89 0 0 1
										dc.b $89
										dc.b 0
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 85 0 2 1
										dc.b $85
										dc.b 0
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 85 FF 461AA
										dc.b $85
										dc.b $FF
										dc.l eas_461AA          
										dc.w $15                ; 0015 SET ACTSCRIPT 89 FF 461AA
										dc.b $89
										dc.b $FF
										dc.l eas_461AA          
										dc.w $23                ; 0023 SET ENTITY FACING 89 2
										dc.b $89
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 8C 0 1 1
										dc.b $8C
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 8C FF 461AA
										dc.b $8C
										dc.b $FF
										dc.l eas_461AA          
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w $2D                ; 002D MOVE ENTITY 89 0 2 9
										dc.b $89
										dc.b 0
										dc.b 2
										dc.b 9
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8C 0 2 9
										dc.b $8C
										dc.b 0
										dc.b 2
										dc.b 9
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 85 FF 2 9
										dc.b $85
										dc.b $FF
										dc.b 2
										dc.b 9
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 8C FF 460CE
										dc.b $8C
										dc.b $FF
										dc.l eas_Init           
										dc.w $23                ; 0023 SET ENTITY FACING 89 2
										dc.b $89
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 85 1
										dc.b $85
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 8C 3
										dc.b $8C
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $44                ; 0044  57F08
										dc.l ms_map13_flag2C6_Entities
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_58512:           dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 82
										dc.b $82
										dc.b $FF
										dc.w $18                ;   0018 SET 1C BIT 7 $0
										dc.w 0
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w 4                  ; 0004 SET TEXT INDEX 59B
										dc.w $59B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82
										dc.w $82
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $29                ; 0029 SET ENTITY DEST 7 2 C
										dc.w 7
										dc.w 2
										dc.w $C
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 45F0C
										dc.b 0
										dc.b $FF
										dc.l eas_BumpUp         
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82
										dc.w $82
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 45F0C
										dc.b 0
										dc.b $FF
										dc.l eas_BumpUp         
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 45F0C
										dc.b 0
										dc.b $FF
										dc.l eas_BumpUp         
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82
										dc.w $82
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 46172
										dc.b 0
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 3 1
										dc.b 0
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 1 1
										dc.b 0
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $33                ; 0033 SET QUAKE AMOUNT 2
										dc.w 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 82
										dc.w $82
										dc.w 6
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 82
										dc.b $82
										dc.b 0
										dc.w $1B                ;   001B SET FLIPPING $0
										dc.w 0
										dc.w $17                ;   0017 SET ENTITY SPRITE $DB
										dc.w $DB
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 82
										dc.w $82
										dc.w 7
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 82 3
										dc.b $82
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82
										dc.w $82
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 46102
										dc.b $82
										dc.b $FF
										dc.l eas_Init2          
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 46172
										dc.b $82
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 1 A
										dc.b $82
										dc.b $FF
										dc.b 1
										dc.b $A
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_585FE:           dc.w 5                  ; 0005 PLAY SOUND 
										dc.w $FD
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 82
										dc.b $82
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 83
										dc.b $83
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 84
										dc.b $84
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 83 FF 46172
										dc.b $83
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 84 FF 46172
										dc.b $84
										dc.b $FF
										dc.l eas_46172          
										dc.w 4                  ; 0004 SET TEXT INDEX 5BC
										dc.w $5BC
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $32                ; 0032 SET CAMERA DEST E A
										dc.w $E
										dc.w $A
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_ENEMY_ATTACK
										dc.w 5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX A
										dc.w $A
										dc.w $2D                ; 002D MOVE ENTITY A FF 0 1
										dc.b $A
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 0 2 3
										dc.b $81
										dc.b 0
										dc.b 2
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 2 3
										dc.b $82
										dc.b $FF
										dc.b 2
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 0 0 3
										dc.b $81
										dc.b 0
										dc.b 0
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 82 0 0 3
										dc.b $82
										dc.b 0
										dc.b 0
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 83 0 2 2
										dc.b $83
										dc.b 0
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 84 FF 2 2
										dc.b $84
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 83 0 46024
										dc.b $83
										dc.b 0
										dc.l eas_Die            
										dc.w $15                ; 0015 SET ACTSCRIPT 84 FF 46024
										dc.b $84
										dc.b $FF
										dc.l eas_Die            
										dc.w $23                ; 0023 SET ENTITY FACING 81 2
										dc.b $81
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 82 2
										dc.b $82
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING A 2
										dc.b $A
										dc.b 2
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX A
										dc.w $A
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 1
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING A 0
										dc.b $A
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 461E4
										dc.b $80
										dc.b 0
										dc.l eas_461E4          
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 81 0 2 1
										dc.b $81
										dc.b 0
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 2 1
										dc.b $82
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 9
										dc.w 9
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 461E4
										dc.b $80
										dc.b 0
										dc.l eas_461E4          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 461B6
										dc.b $81
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 82 0 461B6
										dc.b $82
										dc.b 0
										dc.l eas_461B6          
										dc.w $23                ; 0023 SET ENTITY FACING A 1
										dc.b $A
										dc.b 1
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $32                ; 0032 SET CAMERA DEST 6 6
										dc.w 6
										dc.w 6
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 9
										dc.w 9
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 9
										dc.w 9
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 14 9 3
										dc.b 0
										dc.b $14
										dc.b 9
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 13 8 3
										dc.b 7
										dc.b $13
										dc.b 8
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 9 FF 3 3
										dc.b 9
										dc.b $FF
										dc.b 3
										dc.b 3
										dc.b 0
										dc.b 6
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 9 FF 45EBC
										dc.b 9
										dc.b $FF
										dc.l eas_BumpRight      
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 9 FF 0 1
										dc.b 9
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 9 1
										dc.b 9
										dc.b 1
										dc.w $32                ; 0032 SET CAMERA DEST E 8
										dc.w $E
										dc.w 8
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 9
										dc.w 9
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 81 1
										dc.b $81
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 82 1
										dc.b $82
										dc.b 1
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 9 0
										dc.b 9
										dc.b 0
										dc.w $2D                ; 002D MOVE ENTITY A FF 1 1
										dc.b $A
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX A
										dc.w $A
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 3 1
										dc.b 7
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w 2                  ; 0002 DISPLAY TEXT BOX A
										dc.w $A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX A
										dc.w $A
										dc.w $2D                ; 002D MOVE ENTITY 9 FF 0 1
										dc.b 9
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 9 3
										dc.b 9
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 9
										dc.w 9
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 9
										dc.w 9
										dc.w $2D                ; 002D MOVE ENTITY 9 FF 1 1
										dc.b 9
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 9
										dc.w 9
										dc.w 8                  ; 0008 JOIN FORCE 9
										dc.w 9
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA A
										dc.w $A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX A
										dc.w $A
										dc.w $23                ; 0023 SET ENTITY FACING 9 3
										dc.b 9
										dc.b 3
										dc.w $26                ; 0026 MAKE ENTITY NOD 9
										dc.w 9
										dc.w $2D                ; 002D MOVE ENTITY A FF 1 1
										dc.b $A
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX A
										dc.w $A
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 1
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT A FF 46172
										dc.b $A
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT A
										dc.b $A
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY A 0 2 3
										dc.b $A
										dc.b 0
										dc.b 2
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 0 1
										dc.b $81
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT A
										dc.b $A
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $23                ; 0023 SET ENTITY FACING 81 2
										dc.b $81
										dc.b 2
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 1
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $13                ; 0013 SET STORY FLAG D
										dc.w $D
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT D000000
										dc.l $D000000
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_58856:           dc.w 4                  ; 0004 SET TEXT INDEX 5CF
										dc.w $5CF
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT A FF 460CE
										dc.b $A
										dc.b $FF
										dc.l eas_Init           
										dc.w $23                ; 0023 SET ENTITY FACING 89 3
										dc.b $89
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 89 1
										dc.b $89
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 89 3
										dc.b $89
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 89 FF 45E44
										dc.b $89
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 89 0 45E44
										dc.b $89
										dc.b 0
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 89
										dc.w $89
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 89
										dc.w $89
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 89
										dc.w $89
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 89
										dc.w $89
										dc.w $29                ; 0029 SET ENTITY DEST A 11 4
										dc.w $A
										dc.w $11
										dc.w 4
										dc.w $29                ; 0029 SET ENTITY DEST 7 11 5
										dc.w 7
										dc.w $11
										dc.w 5
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w $23                ; 0023 SET ENTITY FACING A 3
										dc.b $A
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX A
										dc.w $A
										dc.w $2D                ; 002D MOVE ENTITY A FF 2 1
										dc.b $A
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING A 1
										dc.b $A
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX A
										dc.w $A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 89
										dc.w $89
										dc.w $2D                ; 002D MOVE ENTITY 0 0 3 1
										dc.b 0
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 89 FF 3 1
										dc.b $89
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 89 0
										dc.b $89
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING A 2
										dc.b $A
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 89
										dc.w $89
										dc.w $15                ; 0015 SET ACTSCRIPT 89 FF 45E44
										dc.b $89
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 89 FF 45E44
										dc.b $89
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 89 3
										dc.b $89
										dc.b 3
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 89
										dc.b $89
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 89 FF 46172
										dc.b $89
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 89 FF 1 1
										dc.b $89
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $26                ; 0026 MAKE ENTITY NOD 89
										dc.w $89
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 89
										dc.w $89
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 89
										dc.w $89
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 89
										dc.w $89
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 89
										dc.w $89
										dc.w $2D                ; 002D MOVE ENTITY A FF 2 1
										dc.b $A
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING A 1
										dc.b $A
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX A
										dc.w $A
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 89
										dc.w $89
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 89
										dc.w $89
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING A 3
										dc.b $A
										dc.b 3
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w 2                  ; 0002 DISPLAY TEXT BOX A
										dc.w $A
										dc.w $23                ; 0023 SET ENTITY FACING A 1
										dc.b $A
										dc.b 1
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX A
										dc.w $A
										dc.w $15                ; 0015 SET ACTSCRIPT 89 FF 460CE
										dc.b $89
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 89 FF 45E44
										dc.b $89
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 89 0 45E44
										dc.b $89
										dc.b 0
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 89
										dc.w $89
										dc.w $15                ; 0015 SET ACTSCRIPT A FF 46172
										dc.b $A
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 46172
										dc.b 7
										dc.b $FF
										dc.l eas_46172          
										dc.w $23                ; 0023 SET ENTITY FACING A 2
										dc.b $A
										dc.b 2
										dc.w $2D                ; 002D MOVE ENTITY A 0 0 2
										dc.b $A
										dc.b 0
										dc.b 0
										dc.b 2
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 89 FF 3 1
										dc.b $89
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING A 3
										dc.b $A
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 89 3
										dc.b $89
										dc.b 3
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 7 0 2 1
										dc.b 7
										dc.b 0
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 89 FF 3 3
										dc.b $89
										dc.b $FF
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 89 0
										dc.b $89
										dc.b 0
										dc.w $32                ; 0032 SET CAMERA DEST B 2
										dc.w $B
										dc.w 2
										dc.w $15                ; 0015 SET ACTSCRIPT 89 FF 45E44
										dc.b $89
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 89 0 45E44
										dc.b $89
										dc.b 0
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 89
										dc.w $89
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 85 17 7 2
										dc.b $85
										dc.b $17
										dc.b 7
										dc.b 2
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 85
										dc.b $85
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 85 FF 2 5
										dc.b $85
										dc.b $FF
										dc.b 2
										dc.b 5
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 85
										dc.w $85
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 89
										dc.w $89
										dc.w $15                ; 0015 SET ACTSCRIPT 85 FF 460CE
										dc.b $85
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 85 FF 45E94
										dc.b $85
										dc.b $FF
										dc.l eas_JumpRight      
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 85 FF 2 1
										dc.b $85
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 85
										dc.w $85
										dc.w $15                ; 0015 SET ACTSCRIPT 89 FF 45E44
										dc.b $89
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 89 0 45E44
										dc.b $89
										dc.b 0
										dc.l eas_Jump           
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 89
										dc.w $89
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 89
										dc.w $89
										dc.w $26                ; 0026 MAKE ENTITY NOD 85
										dc.w $85
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 85
										dc.w $85
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 85
										dc.b $85
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 85 FF 0 5
										dc.b $85
										dc.b $FF
										dc.b 0
										dc.b 5
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 85
										dc.w $85
										dc.w $32                ; 0032 SET CAMERA DEST B 0
										dc.w $B
										dc.w 0
										dc.w $2D                ; 002D MOVE ENTITY 89 FF 1 3
										dc.b $89
										dc.b $FF
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 89
										dc.w $89
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 89
										dc.w $89
										dc.w $2D                ; 002D MOVE ENTITY 89 FF 2 2
										dc.b $89
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 89 3
										dc.b $89
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT A FF 460CE
										dc.b $A
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY A FF 3 1
										dc.b $A
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING A 3
										dc.b $A
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX A
										dc.w $A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX A
										dc.w $A
										dc.w $2D                ; 002D MOVE ENTITY A FF 2 1
										dc.b $A
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING A 3
										dc.b $A
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX A
										dc.w $A
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY A 7 2
										dc.w $A
										dc.w 7
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_58AE2:           dc.w 4                  ; 0004 SET TEXT INDEX 5ED
										dc.w $5ED
										dc.w $32                ; 0032 SET CAMERA DEST 10 8
										dc.w $10
										dc.w 8
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 89 11 7 0
										dc.b $89
										dc.b $11
										dc.b 7
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8C 10 7 0
										dc.b $8C
										dc.b $10
										dc.b 7
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 89
										dc.w $89
										dc.w $32                ; 0032 SET CAMERA DEST A 4
										dc.w $A
										dc.w 4
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 89
										dc.w $89
										dc.w $23                ; 0023 SET ENTITY FACING 89 2
										dc.b $89
										dc.b 2
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $23                ; 0023 SET ENTITY FACING 89 0
										dc.b $89
										dc.b 0
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 89
										dc.w $89
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C00A
										dc.w $C00A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C00A
										dc.w $C00A
										dc.w $23                ; 0023 SET ENTITY FACING 89 2
										dc.b $89
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 89
										dc.w $89
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 16 C 0
										dc.b 0
										dc.b $16
										dc.b $C
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 17 C 2
										dc.b 7
										dc.b $17
										dc.b $C
										dc.b 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING A 17 B 3
										dc.b $A
										dc.b $17
										dc.b $B
										dc.b 3
										dc.w $32                ; 0032 SET CAMERA DEST 10 6
										dc.w $10
										dc.w 6
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8007
										dc.w $8007
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8007
										dc.w $8007
										dc.w $11                ; 0011 STORY YESNO PROMPT
										dc.w $C                 ; 000C JUMP IF SET FLAG 59 58B7A
										dc.w $59
										dc.l cs_58B7A           
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7
										dc.w 7
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING A 1
										dc.b $A
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007
										dc.w $8007
										dc.w $32                ; 0032 SET CAMERA DEST F 2
										dc.w $F
										dc.w 2
										dc.w $23                ; 0023 SET ENTITY FACING 89 0
										dc.b $89
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 89
										dc.w $89
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_58B7A:           dc.w 4                  ; 0004 SET TEXT INDEX 5F8
										dc.w $5F8
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007
										dc.w $8007
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 8C
										dc.b $8C
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 89 0 0 3
										dc.b $89
										dc.b 0
										dc.b 0
										dc.b 3
										dc.b $A
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8C FF 0 3
										dc.b $8C
										dc.b $FF
										dc.b 0
										dc.b 3
										dc.w $8080
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 89 0 0 3
										dc.b $89
										dc.b 0
										dc.b 0
										dc.b 3
										dc.b $A
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8C FF 0 3
										dc.b $8C
										dc.b $FF
										dc.b 0
										dc.b 3
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 89 3
										dc.b $89
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 8C 3
										dc.b $8C
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING A 1
										dc.b $A
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 89
										dc.w $89
										dc.w $23                ; 0023 SET ENTITY FACING 89 2
										dc.b $89
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 1F 0
										dc.b $1F
										dc.b 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 89
										dc.w $89
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 89
										dc.w $89
										dc.w $23                ; 0023 SET ENTITY FACING 8C 0
										dc.b $8C
										dc.b 0
										dc.w $B                 ; 000B JUMP 58D4C
										dc.l cs_58D4C           
cs_58BEA:           dc.w 4                  ; 0004 SET TEXT INDEX 605
										dc.w $605
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8C
										dc.w $8C
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8C E 15 3
										dc.b $8C
										dc.b $E
										dc.b $15
										dc.b 3
										dc.w $32                ; 0032 SET CAMERA DEST A 12
										dc.w $A
										dc.w $12
										dc.w $2D                ; 002D MOVE ENTITY 8C FF 3 3
										dc.b $8C
										dc.b $FF
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8C
										dc.w $8C
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT A FF 460CE
										dc.b $A
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 E 1E 1
										dc.b 0
										dc.b $E
										dc.b $1E
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 F 1E 1
										dc.b 7
										dc.b $F
										dc.b $1E
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING A D 1E 1
										dc.b $A
										dc.b $D
										dc.b $1E
										dc.b 1
										dc.w $32                ; 0032 SET CAMERA DEST A 16
										dc.w $A
										dc.w $16
										dc.w 4                  ; 0004 SET TEXT INDEX 5F3
										dc.w $5F3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8007
										dc.w $8007
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8007
										dc.w $8007
										dc.w $11                ; 0011 STORY YESNO PROMPT
										dc.w $C                 ; 000C JUMP IF SET FLAG 59 58D4C
										dc.w $59
										dc.l cs_58D4C           
										dc.w 4                  ; 0004 SET TEXT INDEX 607
										dc.w $607
										dc.w 9                  ; 0009 HIDE TEXTBOX AND PORTRAIT
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8C
										dc.w $8C
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 8C
										dc.b $8C
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $23                ; 0023 SET ENTITY FACING 89 3
										dc.b $89
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 8C FF 3 3
										dc.b $8C
										dc.b $FF
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 8C 1
										dc.b $8C
										dc.b 1
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 8C
										dc.b $8C
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $2
										dc.w 2
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $30                ; 0030 REMOVE ENTITY SHADOW 8C (null) (null)
										dc.w $8C
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 0 0 1 2
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 1 2
										dc.b 7
										dc.b 0
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY A FF 1 2
										dc.b $A
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8007
										dc.w $8007
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007
										dc.w $8007
										dc.w $15                ; 0015 SET ACTSCRIPT 8C FF 460CE
										dc.b $8C
										dc.b $FF
										dc.l eas_Init           
										dc.w $23                ; 0023 SET ENTITY FACING 8C 3
										dc.b $8C
										dc.b 3
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 8C
										dc.w $8C
										dc.w $26                ; 0026 MAKE ENTITY NOD 8C
										dc.w $8C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8C
										dc.w $8C
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $23                ; 0023 SET ENTITY FACING 8C 1
										dc.b $8C
										dc.b 1
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $23                ; 0023 SET ENTITY FACING 8C 3
										dc.b $8C
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8C
										dc.w $8C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8C
										dc.w $8C
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 8C 0
										dc.b $8C
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007
										dc.w $8007
										dc.w $23                ; 0023 SET ENTITY FACING 8C 3
										dc.b $8C
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING A 0
										dc.b $A
										dc.b 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX A
										dc.w $A
										dc.w 2                  ; 0002 DISPLAY TEXT BOX A
										dc.w $A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX A
										dc.w $A
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 3 1
										dc.b 7
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8007
										dc.w $8007
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007
										dc.w $8007
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 8C 0
										dc.b $8C
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007
										dc.w $8007
										dc.w 4                  ; 0004 SET TEXT INDEX 5FC
										dc.w $5FC
										dc.w $26                ; 0026 MAKE ENTITY NOD 8C
										dc.w $8C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8C
										dc.w $8C
										dc.w $23                ; 0023 SET ENTITY FACING 8C 3
										dc.b $8C
										dc.b 3
										dc.w $B                 ; 000B JUMP 58DD2
										dc.l word_58DD2         
cs_58D4C:           dc.w 4                  ; 0004 SET TEXT INDEX 5FC
										dc.w $5FC
										dc.w 9                  ; 0009 HIDE TEXTBOX AND PORTRAIT
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $26                ; 0026 MAKE ENTITY NOD 8C
										dc.w $8C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8C
										dc.w $8C
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 8C
										dc.b $8C
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $23                ; 0023 SET ENTITY FACING 89 3
										dc.b $89
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 8C FF 3 2
										dc.b $8C
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 8C 1
										dc.b $8C
										dc.b 1
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 8C
										dc.b $8C
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $2
										dc.w 2
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $30                ; 0030 REMOVE ENTITY SHADOW 8C (null) (null)
										dc.w $8C
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 0 0 1 2
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 1 2
										dc.b 7
										dc.b 0
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY A FF 1 2
										dc.b $A
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8007
										dc.w $8007
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007
										dc.w $8007
										dc.w $15                ; 0015 SET ACTSCRIPT 8C FF 460CE
										dc.b $8C
										dc.b $FF
										dc.l eas_Init           
										dc.w $23                ; 0023 SET ENTITY FACING 8C 3
										dc.b $8C
										dc.b 3
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 8C
										dc.w $8C
										dc.w $26                ; 0026 MAKE ENTITY NOD 8C
										dc.w $8C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8C
										dc.w $8C
word_58DD2:         dc.w 4                  ; 0004 SET TEXT INDEX 600
										dc.w $600
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8C
										dc.w $8C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8C
										dc.w $8C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8C
										dc.w $8C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8C
										dc.w $8C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 8C 7 2
										dc.w $8C
										dc.w 7
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY A 8C 2
										dc.w $A
										dc.w $8C
										dc.w 2
										dc.w $10                ; 0010 SET FLAG 44 FFFF
										dc.w $44
										dc.w $FFFF
										dc.w $10                ; 0010 SET FLAG 4B 0
										dc.w $4B
										dc.w 0
										dc.w $10                ; 0010 SET FLAG 2CE FFFF
										dc.w $2CE
										dc.w $FFFF
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
