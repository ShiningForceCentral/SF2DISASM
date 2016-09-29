
; SCRIPT SECTION battles\entries\battle15\cs_afterbattle :
; Cutscene after battle 15
abcs_battle15:      dc.w 4                  ; 0004 SET TEXT INDEX 9CA : "It was lucky for me that I{N}met you.  Thank you.{W1}"
										dc.w $9CA
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 32 9 A
										dc.w $32
										dc.w 9
										dc.w $A
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4AFB6
										dc.l word_4AFB6
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1E FF 460CE
										dc.b $1E
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1E E 13 1
										dc.b $1E
										dc.b $E
										dc.b $13
										dc.b 1
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w $2D                ; 002D MOVE ENTITY 1E FF 1 5
										dc.b $1E
										dc.b $FF
										dc.b 1
										dc.b 5
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1E : "It was lucky for me that I{N}met you.  Thank you.{W1}"
										dc.w $1E
										dc.w $23                ; 0023 SET ENTITY FACING 1E 0
										dc.b $1E
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1E : "Follow me to the Ancient{N}Tunnel.{W1}"
										dc.w $1E
										dc.w $2D                ; 002D MOVE ENTITY 1E FF 0 2
										dc.b $1E
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.b 1
										dc.b 2
										dc.b 0
										dc.b 6
										dc.w $8080
										dc.w $3A                ; 003A FADE OUT TO BLACK
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 1B A 1
										dc.b 0
										dc.b $1B
										dc.b $A
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 1C A 1
										dc.b 7
										dc.b $1C
										dc.b $A
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 1A A 1
										dc.b $1F
										dc.b $1A
										dc.b $A
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1E 1B 7 1
										dc.b $1E
										dc.b $1B
										dc.b 7
										dc.b 1
										dc.w $32                ; 0032 SET CAMERA DEST 15 5
										dc.w $15
										dc.w 5
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1E : "Why is this door closed?{N}That's strange...{W2}"
										dc.w $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1E : "Oh well, let's go in.{W1}"
										dc.w $1E
										dc.w $18                ; 0018 FLASH ENTITY WHITE 1E 28
										dc.w $1E
										dc.w $28
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $15                ; 0015 SET ACTSCRIPT 1E FF 45E44
										dc.b $1E
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1E : "What?  Let me try again.{W1}"
										dc.w $1E
										dc.w $18                ; 0018 FLASH ENTITY WHITE 1E 32
										dc.w $1E
										dc.w $32
										dc.w $33                ; 0033 SET QUAKE AMOUNT 1
										dc.w 1
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT 5A
										dc.b $5A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1E : "Petro, my grandson, locked{N}the door.{W1}"
										dc.w $1E
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1E
										dc.b $1E
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
										dc.b $10
										dc.b $10
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 1E FF 3 1
										dc.b $1E
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1E : "Sorry, guys!  We can't go to{N}Grans Island this way.{W1}"
										dc.w $1E
										dc.w $2D                ; 002D MOVE ENTITY 1E 0 3 2
										dc.b $1E
										dc.b 0
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT F
										dc.b $F
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
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w $16                ; 0016 WAIT UNTIL IDLE ENTITY 1E
										dc.w $1E
										dc.w $2D                ; 002D MOVE ENTITY 1E FF 2 3
										dc.b $1E
										dc.b $FF
										dc.b 2
										dc.b 3
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w $2D                ; 002D MOVE ENTITY 1E FF 2 5
										dc.b $1E
										dc.b $FF
										dc.b 2
										dc.b 5
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 1E
										dc.w $1E
										dc.w $10                ; 0010 SET FLAG 4D 0 : Old man is a follower
										dc.w $4D
										dc.w 0
										dc.w $10                ; 0010 SET FLAG 2DC FFFF : set after the old man fails to open the way to Grans in the Wooden Panel shrine
										dc.w $2DC
										dc.w $FFFF
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 7 2
										dc.w $1F
										dc.w 7
										dc.w 2
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 321B0B01
										dc.l $321B0B01
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4AFB6:         dc.w $E
										dc.w 5
										dc.w 3
										dc.w $FFFF
