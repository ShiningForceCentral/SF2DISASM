
; SCRIPT SECTION battles\entries\battle38\cs_afterbattle :
; Cutscene after battle 38
abcs_battle38:      dc.w 4                  ; 0004 SET TEXT INDEX BC4 : "My traps...{W1}"
										dc.w $BC4
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 42 3 16
										dc.w $42
										dc.w 3
										dc.w $16
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4E372
										dc.l word_4E372
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 5 19 0
										dc.b 7
										dc.b 5
										dc.b $19
										dc.b 0
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 8 1C 1
										dc.b $1F
										dc.b 8
										dc.b $1C
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 1E FF 460CE
										dc.b $1E
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1E 9 18 3
										dc.b $1E
										dc.b 9
										dc.b $18
										dc.b 3
										dc.w $1C                ; 001C STOP ENTITY ANIM 88
										dc.w $88
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 88
										dc.b $88
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 4C 4DF00
										dc.w $4C
										dc.l word_4DF00         
										dc.w $15                ; 0015 SET ACTSCRIPT 1A FF 460CE
										dc.b $1A
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1A 3F 3E 3
										dc.b $1A
										dc.b $3F
										dc.b $3E
										dc.b 3
word_4DF00:         dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46172
										dc.b $80
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 46172
										dc.b $81
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 46172
										dc.b $82
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 83 FF 46172
										dc.b $83
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 84 FF 46172
										dc.b $84
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 85 FF 46172
										dc.b $85
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 86 FF 46172
										dc.b $86
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 87 FF 46172
										dc.b $87
										dc.b $FF
										dc.l eas_46172          
										dc.w $53                ; 0053  0 0
										dc.w 0
										dc.w 0
										dc.w $53                ; 0053  88 FFFF
										dc.w $88
										dc.w $FFFF
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 88
										dc.w $88
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 88 : "My traps...{W1}"
										dc.w $88
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 88
										dc.b $88
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $0
										dc.w 0
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $1B                ; 001B START ENTITY ANIM 88
										dc.w $88
										dc.w $23                ; 0023 SET ENTITY FACING 88 1
										dc.b $88
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 88 : "I'm...at the end of my rope.{N}I...must...escape.{W1}"
										dc.w $88
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 88
										dc.b $88
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
										dc.b 8
										dc.b 8
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 88 FF 0 1
										dc.b $88
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 1
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 2
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 88 0 1 1
										dc.b $88
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT C
										dc.b $C
										dc.w $15                ; 0015 SET ACTSCRIPT 88 FF 461AA
										dc.b $88
										dc.b $FF
										dc.l eas_461AA          
										dc.w $33                ; 0033 SET QUAKE AMOUNT 1
										dc.w 1
										dc.w $1C                ; 001C STOP ENTITY ANIM 88
										dc.w $88
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 88 8 18 2
										dc.b $88
										dc.b 8
										dc.b $18
										dc.b 2
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 88
										dc.b $88
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 88 FF 46172
										dc.b $88
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 88
										dc.b $88
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$28 Y=$28
										dc.b $28
										dc.b $28
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $2D                ; 002D MOVE ENTITY 88 FF 3 1
										dc.b $88
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 88 3
										dc.b $88
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 88 FF 3 1
										dc.b $88
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 88 0
										dc.b $88
										dc.b 0
										dc.w $2D                ; 002D MOVE ENTITY 88 FF 3 1
										dc.b $88
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 88 1
										dc.b $88
										dc.b 1
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 88
										dc.w $88
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 88
										dc.b $88
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $0
										dc.w 0
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $23                ; 0023 SET ENTITY FACING 88 3
										dc.b $88
										dc.b 3
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 88
										dc.w $88
										dc.w $1B                ; 001B START ENTITY ANIM 88
										dc.w $88
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $15                ; 0015 SET ACTSCRIPT 88 FF 45E44
										dc.b $88
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 88 FF 46172
										dc.b $88
										dc.b $FF
										dc.l eas_46172          
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 88 : "Nooooooo!{W1}"
										dc.w $88
										dc.w $2D                ; 002D MOVE ENTITY 88 FF 1 2
										dc.b $88
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 88 : "Please...please let me go.{W1}"
										dc.w $88
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 1
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01F : "We don't want to kill{N}you.{N}You've lost your powers.{W1}"
										dc.w $C01F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 88 : "I know...(sob, sob)....{W1}"
										dc.w $88
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 1
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007 : "You may go.{W1}"
										dc.w $C007
										dc.w $23                ; 0023 SET ENTITY FACING 88 2
										dc.b $88
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 88 : "Thank you.{W1}"
										dc.w $88
										dc.w $15                ; 0015 SET ACTSCRIPT 88 FF 460CE
										dc.b $88
										dc.b $FF
										dc.l eas_Init           
										dc.w $23                ; 0023 SET ENTITY FACING 88 1
										dc.b $88
										dc.b 1
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 88
										dc.w $88
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 0 1
										dc.b 0
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 8
										dc.w 8
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 88
										dc.b $88
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
										dc.b 8
										dc.b 8
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 88 FF 1 1
										dc.b $88
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $2D                ; 002D MOVE ENTITY 88 FF 1 2
										dc.b $88
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 88 FF 1 2
										dc.b $88
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 88 3
										dc.b $88
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 88 : "I won't forget this.{W1}"
										dc.w $88
										dc.w $2D                ; 002D MOVE ENTITY 88 FF 1 3
										dc.b $88
										dc.b $FF
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $41                ; 0041 FLASH SCREEN WHITE 1E
										dc.w $1E
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 88 0 461B6
										dc.b $88
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 50
										dc.b $50
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 88 3
										dc.b $88
										dc.b 3
										dc.w $3D                ; 003D TINT MAP
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C089 : "Where are you going, Geshp?{W1}"
										dc.w $C089
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 88
										dc.b $88
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 88 FF 45E44
										dc.b $88
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 88 FF 45E44
										dc.b $88
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $15                ; 0015 SET ACTSCRIPT 88 FF 46172
										dc.b $88
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 88 FF 1 1
										dc.b $88
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C089 : "Do you remember your vow?{W1}"
										dc.w $C089
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 88
										dc.w $88
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C089 : "You failed to get the jewel{N}from {LEADER}.{W2}"
										dc.w $C089
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C089 : "Now, you will pay with your{N}life.{W1}"
										dc.w $C089
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 88 : "No, please...NO!{W1}"
										dc.w $88
										dc.w $53                ; 0053  88 0
										dc.w $88
										dc.w 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 8 D 0
										dc.b $80
										dc.b 8
										dc.b $D
										dc.b 0
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 A E 2
										dc.b $81
										dc.b $A
										dc.b $E
										dc.b 2
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 88 0 461B6
										dc.b $88
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 B 10 0
										dc.b $82
										dc.b $B
										dc.b $10
										dc.b 0
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 83 A 12 2
										dc.b $83
										dc.b $A
										dc.b $12
										dc.b 2
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 84 8 13 0
										dc.b $84
										dc.b 8
										dc.b $13
										dc.b 0
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 85 6 12 2
										dc.b $85
										dc.b 6
										dc.b $12
										dc.b 2
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 86 5 10 0
										dc.b $86
										dc.b 5
										dc.b $10
										dc.b 0
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 87 6 E 2
										dc.b $87
										dc.b 6
										dc.b $E
										dc.b 2
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w $3D                ; 003D TINT MAP
										dc.w $23                ; 0023 SET ENTITY FACING 88 3
										dc.b $88
										dc.b 3
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$50 Y=$50
										dc.b $50
										dc.b $50
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$50 Y=$50
										dc.b $50
										dc.b $50
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 82
										dc.b $82
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$50 Y=$50
										dc.b $50
										dc.b $50
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 83
										dc.b $83
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$50 Y=$50
										dc.b $50
										dc.b $50
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 84
										dc.b $84
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$50 Y=$50
										dc.b $50
										dc.b $50
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 85
										dc.b $85
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$50 Y=$50
										dc.b $50
										dc.b $50
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 86
										dc.b $86
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$50 Y=$50
										dc.b $50
										dc.b $50
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 87
										dc.b $87
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$50 Y=$50
										dc.b $50
										dc.b $50
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w 5                  ; 0005 PLAY SOUND SFX_BOLT_SPELL
										dc.w $77
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 3
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 88 2
										dc.b $88
										dc.b 2
										dc.w $1A                ; 001A SET ENTITY SPRITE 88 B4
										dc.w $88
										dc.w $B4
										dc.w $15                ; 0015 SET ACTSCRIPT 88 0 45FB2
										dc.b $88
										dc.b 0
										dc.l eas_AnimSpeedx2    
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45E6C
										dc.b $80
										dc.b 0
										dc.l eas_JumpLeft       
										dc.w 5                  ; 0005 PLAY SOUND SFX_BOLT_SPELL
										dc.w $77
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 6 2
										dc.b $81
										dc.b $FF
										dc.b 6
										dc.b 2
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 45E94
										dc.b $81
										dc.b 0
										dc.l eas_JumpRight      
										dc.w $2E                ; 002E HIDE ENTITY 80
										dc.w $80
										dc.w 5                  ; 0005 PLAY SOUND SFX_BOLT_SPELL
										dc.w $77
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 2 3
										dc.b $82
										dc.b $FF
										dc.b 2
										dc.b 3
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 82 0 45E6C
										dc.b $82
										dc.b 0
										dc.l eas_JumpLeft       
										dc.w $2E                ; 002E HIDE ENTITY 81
										dc.w $81
										dc.w 5                  ; 0005 PLAY SOUND SFX_BOLT_SPELL
										dc.w $77
										dc.w $2D                ; 002D MOVE ENTITY 83 FF 5 2
										dc.b $83
										dc.b $FF
										dc.b 5
										dc.b 2
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 83 0 45E94
										dc.b $83
										dc.b 0
										dc.l eas_JumpRight      
										dc.w $2E                ; 002E HIDE ENTITY 82
										dc.w $82
										dc.w 5                  ; 0005 PLAY SOUND SFX_BOLT_SPELL
										dc.w $77
										dc.w $2D                ; 002D MOVE ENTITY 84 FF 1 3
										dc.b $84
										dc.b $FF
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 84 0 45E6C
										dc.b $84
										dc.b 0
										dc.l eas_JumpLeft       
										dc.w $2E                ; 002E HIDE ENTITY 83
										dc.w $83
										dc.w 5                  ; 0005 PLAY SOUND SFX_BOLT_SPELL
										dc.w $77
										dc.w $2D                ; 002D MOVE ENTITY 85 FF 4 2
										dc.b $85
										dc.b $FF
										dc.b 4
										dc.b 2
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 85 0 45E94
										dc.b $85
										dc.b 0
										dc.l eas_JumpRight      
										dc.w $2E                ; 002E HIDE ENTITY 84
										dc.w $84
										dc.w 5                  ; 0005 PLAY SOUND SFX_BOLT_SPELL
										dc.w $77
										dc.w $2D                ; 002D MOVE ENTITY 86 FF 0 3
										dc.b $86
										dc.b $FF
										dc.b 0
										dc.b 3
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 86 0 45E6C
										dc.b $86
										dc.b 0
										dc.l eas_JumpLeft       
										dc.w $2E                ; 002E HIDE ENTITY 85
										dc.w $85
										dc.w 5                  ; 0005 PLAY SOUND SFX_BOLT_SPELL
										dc.w $77
										dc.w $2D                ; 002D MOVE ENTITY 87 FF 7 2
										dc.b $87
										dc.b $FF
										dc.b 7
										dc.b 2
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 87 0 45E94
										dc.b $87
										dc.b 0
										dc.l eas_JumpRight      
										dc.w $2E                ; 002E HIDE ENTITY 86
										dc.w $86
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $2E                ; 002E HIDE ENTITY 87
										dc.w $87
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $1A                ; 001A SET ENTITY SPRITE 88 9F
										dc.w $88
										dc.w $9F
										dc.w $15                ; 0015 SET ACTSCRIPT 88 FF 46024
										dc.b $88
										dc.b $FF
										dc.l eas_Die            
										dc.w $3E                ; 003E SIMILAR TO TINT MAP
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w $32                ; 0032 SET CAMERA DEST 3 14
										dc.w 3
										dc.w $14
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 3
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "Zeon is such an unfeeling{N}devil...(shiver).{W1}"
										dc.w $1F
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 1
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "He will do the same to us{N}if we lose to him.{W1}"
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "We must not be defeated.{W1}"
										dc.w $1F
										dc.w $2C                ; 002C FOLLOW ENTITY 1E 0 2
										dc.w $1E
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 7 1E 1
										dc.w 7
										dc.w $1E
										dc.w 1
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 1E 3
										dc.w $1F
										dc.w $1E
										dc.w 3
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4E372:         dc.w 8
										dc.w $17
										dc.w 3
										dc.b 5
										dc.b $19
										dc.b 0
										dc.b 7
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 0
										dc.b $B2
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 2
										dc.b $B2
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 0
										dc.b $B2
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 2
										dc.b $B2
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 0
										dc.b $B2
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 2
										dc.b $B2
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 0
										dc.b $B2
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 2
										dc.b $B2
										dc.l eas_Init           
										dc.b 6
										dc.b $1B
										dc.b 3
										dc.b $9F
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $A2
										dc.l eas_Init           
										dc.w $FFFF
