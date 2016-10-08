
; SCRIPT SECTION battles\entries\battle04\cs_afterbattle :
; Cutscene after battle 4
abcs_battle04:      dc.w 4                  ; 0004 INIT TEXT CURSOR 90F : "Your battle strategy was{N}wonderful!  I praise you.{W1}"
										dc.w $90F
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 42 9 10
										dc.w $42
										dc.w 9
										dc.w $10
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 49A6A
										dc.l word_49A6A
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1 E 15 3
										dc.b 1
										dc.b $E
										dc.b $15
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 2 C 15 3
										dc.b 2
										dc.b $C
										dc.b $15
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 3 D 16 3
										dc.b 3
										dc.b $D
										dc.b $16
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 4 B 16 3
										dc.b 4
										dc.b $B
										dc.b $16
										dc.b 3
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C : "Your battle strategy was{N}wonderful!  I praise you.{W1}"
										dc.w $1C
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 3 0 461B6
										dc.b 3
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 4 0 461B6
										dc.b 4
										dc.b 0
										dc.l eas_461B6          
										dc.w $15                ; 0015 SET ACTSCRIPT 1 0 45E44
										dc.b 1
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 2 FF 45E44
										dc.b 2
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1 0 45E44
										dc.b 1
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 2 FF 45E44
										dc.b 2
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 50
										dc.b $50
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1C 12 16 1
										dc.b $1C
										dc.b $12
										dc.b $16
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 1 2
										dc.b $1C
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1C 2
										dc.b $1C
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 1 0
										dc.b 1
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 2 0
										dc.b 2
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 3 0
										dc.b 3
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 4 0
										dc.b 4
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C : "But, I can't let you escape.{W1}"
										dc.w $1C
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1C
										dc.b $1C
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 2 4
										dc.b $1C
										dc.b $FF
										dc.b 2
										dc.b 4
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 46172
										dc.b 0
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $33                ; 0033 SET QUAKE AMOUNT 2
										dc.w 2
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 2 1
										dc.b 0
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 1 1
										dc.b 0
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45FBC
										dc.b 0
										dc.b 0
										dc.l eas_RotateRight    
										dc.w $23                ; 0023 SET ENTITY FACING 1 1
										dc.b 1
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 2 1
										dc.b 2
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 3 1
										dc.b 3
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 4 1
										dc.b 4
										dc.b 1
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1C
										dc.b $1C
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$20 Y=$20
										dc.b $20
										dc.b $20
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 0 1
										dc.b $1C
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C : "That lad is their leader.{N}Take him!{W1}"
										dc.w $1C
										dc.w $2D                ; 002D MOVE ENTITY 82 0 1 1
										dc.b $82
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 0 2 3
										dc.b $81
										dc.b 0
										dc.b 2
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 5
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 5
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 82 2
										dc.b $82
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 1C 3
										dc.b $1C
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C : "Don't worry.  He has only{N}fainted.  Take them to Galam!{W1}"
										dc.w $1C
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 0 1
										dc.b $1C
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 11000000
										dc.l $11000000
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_49A6A:         dc.w $D
										dc.w $14
										dc.w 3
										dc.b $E
										dc.b $15
										dc.b 3
										dc.b 1
										dc.l eas_Init           
										dc.b $C
										dc.b $15
										dc.b 3
										dc.b 2
										dc.l eas_Init           
										dc.b $D
										dc.b $16
										dc.b 3
										dc.b 3
										dc.l eas_Init           
										dc.b $B
										dc.b $16
										dc.b 3
										dc.b 4
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $1C
										dc.l eas_Init           
										dc.b $11
										dc.b $12
										dc.b 2
										dc.b $78
										dc.l eas_Init           
										dc.b $11
										dc.b $13
										dc.b 2
										dc.b $42
										dc.l eas_Init           
										dc.b $11
										dc.b $15
										dc.b 2
										dc.b $42
										dc.l eas_Init           
										dc.w $FFFF
