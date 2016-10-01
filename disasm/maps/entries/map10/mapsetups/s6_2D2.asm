
; SCRIPT SECTION maps\entries\map10\mapsetups\s6_2D2 :
; 

; =============== S U B R O U T I N E =======================================

ms_map10_flag2D2_InitFunction:
										
										trap    #TRAP_CHECKFLAG
										dc.w $31F
										beq.s   loc_5709E
										move.w  #$A,d0
										jsr     MoveEntityOutOfMap
loc_5709E:
										
										trap    #TRAP_CHECKFLAG
										dc.w $2D4
										beq.s   return_570AE
										move.w  #$98,d0 
										jsr     MoveEntityOutOfMap
return_570AE:
										
										rts

	; End of function ms_map10_flag2D2_InitFunction

cs_570B0:           dc.w 4                  ; 0004 SET TEXT INDEX 650 : "Who are you?{W1}"
										dc.w $650
										dc.w $46                ; 0046  6 13
										dc.w 6
										dc.w $13
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 B 19 1
										dc.b 0
										dc.b $B
										dc.b $19
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 B 1A 1
										dc.b 7
										dc.b $B
										dc.b $1A
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 96 A 15 0
										dc.b $96
										dc.b $A
										dc.b $15
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 97 D 15 2
										dc.b $97
										dc.b $D
										dc.b $15
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 96
										dc.b $96
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 97
										dc.b $97
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 96 FF 0 1
										dc.b $96
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 96 : "Who are you?{W1}"
										dc.w $96
										dc.w $2D                ; 002D MOVE ENTITY 97 FF 2 1
										dc.b $97
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 97 : "Bedoe is only for birdmen!{W1}"
										dc.w $97
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 1
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Don't be so uppity!{W1}"
										dc.w 7
										dc.w $15                ; 0015 SET ACTSCRIPT 96 0 45E44
										dc.b $96
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 97 FF 45E44
										dc.b $97
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 96 0 45E44
										dc.b $96
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 97 FF 45E44
										dc.b $97
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 96 FF 3 1
										dc.b $96
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 96 : "Oh, you're...{W1}"
										dc.w $96
										dc.w $2D                ; 002D MOVE ENTITY 97 FF 3 1
										dc.b $97
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 97 : "Sir {NAME;7}!{N}Sorry, Sir {NAME;7}!{W2}"
										dc.w $97
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 97 : "Welcome back!{N}Volcanon is waiting!{W1}"
										dc.w $97
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 461B6
										dc.b 7
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 2
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "That's strange...{W2}"
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 2 4
										dc.b 7
										dc.b $FF
										dc.b 2
										dc.b 4
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "I just realized...{N}Why are you flying guard?{W2}"
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 2
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.b 9
										dc.b $A
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Did something happen?{W1}"
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 97 : "Well, the devils invaded{N}recently.{W1}"
										dc.w $97
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 7
										dc.b 7
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Devils?{W1}"
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY 96 FF 3 1
										dc.b $96
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 8
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 96 : "Yes, the Devil Army.{W2}"
										dc.w $96
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 96 : "Strong greater devils broke{N}Volcanon's sacred barrier.{W2}"
										dc.w $96
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 96 : "But don't worry, Volcanon{N}defeated all the devils.{W1}"
										dc.w $96
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 3 2
										dc.b 7
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.b $A
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "The devils we fought must{N}have been part of that army!{W1}"
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 96 3
										dc.b $96
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 97 FF 3 1
										dc.b $97
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 96 : "You met some other devils?{W1}"
										dc.w $96
										dc.w $23                ; 0023 SET ENTITY FACING 96 0
										dc.b $96
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 97 2
										dc.b $97
										dc.b 2
										dc.w $26                ; 0026 MAKE ENTITY NOD 96
										dc.w $96
										dc.w $26                ; 0026 MAKE ENTITY NOD 97
										dc.w $97
										dc.w $23                ; 0023 SET ENTITY FACING 96 3
										dc.b $96
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 97 3
										dc.b $97
										dc.b 3
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 96
										dc.b $96
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
										dc.b 8
										dc.b 8
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 97
										dc.b $97
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
										dc.b 8
										dc.b 8
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 96 FF 46172
										dc.b $96
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 97 FF 46172
										dc.b $97
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 96 0 1 1
										dc.b $96
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 97 FF 1 1
										dc.b $97
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 96
										dc.b $96
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 97
										dc.b $97
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 96 0 2 1
										dc.b $96
										dc.b 0
										dc.b 2
										dc.b 1
										dc.b 3
										dc.b 5
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 97 0 0 1
										dc.b $97
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b 5
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7 : "Stop, stop!{W2}"
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 96 0
										dc.b $96
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 97 2
										dc.b $97
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "We already defeated them.{W1}"
										dc.w 7
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $32                ; 0032 SET CAMERA DEST 6 16
										dc.w 6
										dc.w $16
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 96
										dc.b $96
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
										dc.b 8
										dc.b 8
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 97
										dc.b $97
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
										dc.b 8
										dc.b 8
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 96 0 3 1
										dc.b $96
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 97 FF 3 1
										dc.b $97
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 96 FF 460CE
										dc.b $96
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 97 FF 460CE
										dc.b $97
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 96 FF 0 1
										dc.b $96
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 9
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 96 : "That's great!  But...{W2}"
										dc.w $96
										dc.w $2D                ; 002D MOVE ENTITY 97 FF 2 1
										dc.b $97
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 9
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 97 : "We'll go and make sure...{W1}"
										dc.w $97
										dc.w $23                ; 0023 SET ENTITY FACING 96 0
										dc.b $96
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 97 2
										dc.b $97
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 96 : "Just in case.{W1}"
										dc.w $96
										dc.w $26                ; 0026 MAKE ENTITY NOD 97
										dc.w $97
										dc.w $23                ; 0023 SET ENTITY FACING 96 1
										dc.b $96
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 97 1
										dc.b $97
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 97 : "We're going to Polca Village{N}to patrol.{W2}"
										dc.w $97
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 97 : "{NAME;7}, please see{N}King Bedoe.{W1}"
										dc.w $97
										dc.w $23                ; 0023 SET ENTITY FACING 96 3
										dc.b $96
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 97 3
										dc.b $97
										dc.b 3
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 96
										dc.b $96
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
										dc.b 8
										dc.b 8
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 97
										dc.b $97
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
										dc.b 8
										dc.b 8
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 96 FF 46172
										dc.b $96
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 97 FF 46172
										dc.b $97
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 96 0 1 1
										dc.b $96
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 97 FF 1 1
										dc.b $97
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 96
										dc.b $96
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 97
										dc.b $97
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 96 0 3 5
										dc.b $96
										dc.b 0
										dc.b 3
										dc.b 5
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 97 FF 3 5
										dc.b $97
										dc.b $FF
										dc.b 3
										dc.b 5
										dc.w $8080
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7 : "{LEADER}, let's go.{W2}"
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "I'll introduce you to{N}King Bedoe.{W1}"
										dc.w 7
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 96 22 33 1
										dc.b $96
										dc.b $22
										dc.b $33
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 97 23 33 1
										dc.b $97
										dc.b $23
										dc.b $33
										dc.b 1
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_573EC:           dc.w 4                  ; 0004 SET TEXT INDEX 669 : "Yes, the greater devil was{N}very strong.{W1}"
										dc.w $669
										dc.w $32                ; 0032 SET CAMERA DEST 1F 2F
										dc.w $1F
										dc.w $2F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 94 : "Yes, the greater devil was{N}very strong.{W1}"
										dc.w $94
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 94 : "But, God Volcanon swept{N}away all the devils.{W1}"
										dc.w $94
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 93 : "What about the greater{N}devil?{W1}"
										dc.w $93
										dc.w $2D                ; 002D MOVE ENTITY 94 FF 2 1
										dc.b $94
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 9
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 94 : "He fled.{W1}"
										dc.w $94
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 93 : "Can't you track him?{W2}"
										dc.w $93
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 93 : "We must capture him before{N}he regains his strength.{W1}"
										dc.w $93
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 94 : "Did they come from Grans{N}Island?{W1}"
										dc.w $94
										dc.w $26                ; 0026 MAKE ENTITY NOD 93
										dc.w $93
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 93 : "I think so.{W2}"
										dc.w $93
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 93 : "Maybe he died.{N}But beware of another attack.{W2}"
										dc.w $93
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 94 3
										dc.b $94
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 93 : "Watch carefully!{W1}"
										dc.w $93
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2D                ; 002D MOVE ENTITY 96 0 3 1
										dc.b $96
										dc.b 0
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 3
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 98 0 3 1
										dc.b $98
										dc.b 0
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 5
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 99 0 0 2
										dc.b $99
										dc.b 0
										dc.b 0
										dc.b 2
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 9A 0 0 1
										dc.b $9A
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 9B 0 0 2
										dc.b $9B
										dc.b 0
										dc.b 0
										dc.b 2
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 9C 0 0 2
										dc.b $9C
										dc.b 0
										dc.b 0
										dc.b 2
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 97 FF 3 1
										dc.b $97
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 4
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 96
										dc.w $96
										dc.w $2E                ; 002E HIDE ENTITY 97
										dc.w $97
										dc.w $2E                ; 002E HIDE ENTITY 98
										dc.w $98
										dc.w $2E                ; 002E HIDE ENTITY 99
										dc.w $99
										dc.w $2E                ; 002E HIDE ENTITY 9A
										dc.w $9A
										dc.w $2E                ; 002E HIDE ENTITY 9B
										dc.w $9B
										dc.w $2E                ; 002E HIDE ENTITY 9C
										dc.w $9C
										dc.w $2D                ; 002D MOVE ENTITY 94 FF 0 1
										dc.b $94
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_574A6:           dc.w 4                  ; 0004 SET TEXT INDEX 673 : "{NAME;7}, {NAME;7}!{W1}"
										dc.w $673
										dc.w $32                ; 0032 SET CAMERA DEST 22 2F
										dc.w $22
										dc.w $2F
										dc.w $2D                ; 002D MOVE ENTITY A FF 3 1
										dc.b $A
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b $A
										dc.b 1
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT A FF 45E44
										dc.b $A
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT A FF 45E44
										dc.b $A
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 800A : "{NAME;7}, {NAME;7}!{W1}"
										dc.w $800A
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 21 34 0
										dc.b 7
										dc.b $21
										dc.b $34
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 21 35 0
										dc.b 0
										dc.b $21
										dc.b $35
										dc.b 0
										dc.w $32                ; 0032 SET CAMERA DEST 1F 2F
										dc.w $1F
										dc.w $2F
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 3
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 3
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7 : "{NAME;10}, how have you been?{W2}"
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "King Bedoe, you look well.{W1}"
										dc.w 7
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 93
										dc.b $93
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 93 FF 3 1
										dc.b $93
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8093 : "{NAME;7}, my friend, how{N}was your journey?{W1}"
										dc.w $8093
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $26                ; 0026 MAKE ENTITY NOD 7
										dc.w 7
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Let me introduce my friend.{W1}"
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 3 2
										dc.b 7
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $2D                ; 002D MOVE ENTITY 7 0 0 3
										dc.b 7
										dc.b 0
										dc.b 0
										dc.b 3
										dc.b 9
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 0 3
										dc.b 0
										dc.b $FF
										dc.b 0
										dc.b 3
										dc.b 9
										dc.b 1
										dc.w $8080
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "This is {LEADER}.{N}He's from Grans and...{W1}"
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY A FF 3 1
										dc.b $A
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b $A
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 800A : "I know.  He is a pupil of{N}Astral of Granseal.{W1}"
										dc.w $800A
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "How do you know that?{W1}"
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 800A : "Sir Astral told me.{W1}"
										dc.w $800A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "What?!  Did you go to{N}Granseal?{W1}"
										dc.w 7
										dc.w $26                ; 0026 MAKE ENTITY NOD A
										dc.w $A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 800A : "As Volcanon's messenger.{W1}"
										dc.w $800A
										dc.w $2D                ; 002D MOVE ENTITY 93 FF 3 1
										dc.b $93
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING A 1
										dc.b $A
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8093 : "And I heard that somebody{N}unsealed Zeon.{W2}"
										dc.w $8093
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8093 : "Grans people caused a big,{N}big problem.{W2}"
										dc.w $8093
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 93
										dc.b $93
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
										dc.b $10
										dc.b $10
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 93 FF 1 2
										dc.b $93
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8093 : "Zeon might destroy the{N}world...{W1}"
										dc.w $8093
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b 2
										dc.b 1
										dc.b 9
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Sorry to interrupt, but is{N}he that strong?{W1}"
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8093 : "Zeon is King of the Devils.{W1}"
										dc.w $8093
										dc.w $2D                ; 002D MOVE ENTITY 94 FF 3 1
										dc.b $94
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 94 : "{NAME;7}, you had better{N}go see Volcanon.{W2}"
										dc.w $94
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 94 : "It may calm him down to see{N}{NAME;7}.{W1}"
										dc.w $94
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Oh, is he angry?{N}Maybe later...{W1}"
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY A FF 1 1
										dc.b $A
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 800A : "Never mind later.{N}He has been waiting for you.{W1}"
										dc.w $800A
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7 : "Oh, yeah?  OK, I'm going.{W2}"
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "{LEADER}, follow me.{W1}"
										dc.w 7
										dc.w $15                ; 0015 SET ACTSCRIPT 93 FF 460CE
										dc.b $93
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 93 FF 3 1
										dc.b $93
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8093 : "{NAME;7}, are you taking{N}{LEADER} with you?{W1}"
										dc.w $8093
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING A 1
										dc.b $A
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Of course.  Why not?{W1}"
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8093 : "He thinks the people of{N}Granseal are...{W1}"
										dc.w $8093
										dc.w $2D                ; 002D MOVE ENTITY 94 FF 2 1
										dc.b $94
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 9
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 94 : "King Bedoe, I think{N}{LEADER} has to see{N}Volcanon.{W2}"
										dc.w $94
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 94 : "He should talk to him.{W1}"
										dc.w $94
										dc.w $26                ; 0026 MAKE ENTITY NOD 93
										dc.w $93
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8093 : "Hmmm...you're right.{N}{NAME;7}, go ahead.{W1}"
										dc.w $8093
										dc.w $23                ; 0023 SET ENTITY FACING 94 3
										dc.b $94
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING A 3
										dc.b $A
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "OK.{N}Anyway, let's go.{W1}"
										dc.w 7
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5766C:           dc.w 4                  ; 0004 SET TEXT INDEX 690 : "I had a dream last night.{N}I flew!{W2}"
										dc.w $690
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 99
										dc.w $99
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 99 : "I had a dream last night.{N}I flew!{W2}"
										dc.w $99
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 99 : "Watch!  I can fly!{W1}"
										dc.w $99
										dc.w $23                ; 0023 SET ENTITY FACING 99 0
										dc.b $99
										dc.b 0
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $26                ; 0026 MAKE ENTITY NOD 99
										dc.w $99
										dc.w $2D                ; 002D MOVE ENTITY 99 FF E 1
										dc.b $99
										dc.b $FF
										dc.b $E
										dc.b 1
										dc.w $8080
										dc.w $1A                ; 001A SET ENTITY SPRITE 99 B6
										dc.w $99
										dc.w $B6
										dc.w $15                ; 0015 SET ACTSCRIPT 99 FF 46172
										dc.b $99
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 99
										dc.b $99
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$4 Y=$4
										dc.b 4
										dc.b 4
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 99 FF 1 1
										dc.b $99
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 99
										dc.b $99
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w 5                  ; 0005 PLAY SOUND SFX_FALLING
										dc.w $58
										dc.w $2D                ; 002D MOVE ENTITY 99 FF 3 6
										dc.b $99
										dc.b $FF
										dc.b 3
										dc.b 6
										dc.w $8080
										dc.w $1A                ; 001A SET ENTITY SPRITE 99 E6
										dc.w $99
										dc.w $E6
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 99 : "Hmmm...strange...{W1}"
										dc.w $99
										dc.w $15                ; 0015 SET ACTSCRIPT 99 FF 460CE
										dc.b $99
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 99 FF 2 2
										dc.b $99
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.b 9
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 99 : "That didn't work.  Hee, hee.{W2}"
										dc.w $99
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 99 : "Stay there.{N}I know I can fly!{W1}"
										dc.w $99
										dc.w $23                ; 0023 SET ENTITY FACING 99 0
										dc.b $99
										dc.b 0
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $26                ; 0026 MAKE ENTITY NOD 99
										dc.w $99
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 40
										dc.w $40
										dc.w $2D                ; 002D MOVE ENTITY 99 FF 0 1
										dc.b $99
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b $E
										dc.b 1
										dc.w $8080
										dc.w $1A                ; 001A SET ENTITY SPRITE 99 B6
										dc.w $99
										dc.w $B6
										dc.w $15                ; 0015 SET ACTSCRIPT 99 FF 46172
										dc.b $99
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 99 FF 3 1
										dc.b $99
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 99
										dc.b $99
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$4 Y=$4
										dc.b 4
										dc.b 4
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 99 FF 1 1
										dc.b $99
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 99
										dc.b $99
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w 5                  ; 0005 PLAY SOUND SFX_FALLING
										dc.w $58
										dc.w $2D                ; 002D MOVE ENTITY 99 FF 3 8
										dc.b $99
										dc.b $FF
										dc.b 3
										dc.b 8
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 99 0 464E2
										dc.b $99
										dc.b 0
										dc.l eas_464E2          
										dc.w $1B                ; 001B START ENTITY ANIM 99
										dc.w $99
										dc.b $80                ; WAIT C
										dc.b $C
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 20
										dc.w $20
										dc.w $15                ; 0015 SET ACTSCRIPT 99 FF 46102
										dc.b $99
										dc.b $FF
										dc.l eas_Init2          
										dc.w $2D                ; 002D MOVE ENTITY 99 FF 1 2
										dc.b $99
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b $B
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 99 2
										dc.b $99
										dc.b 2
										dc.w $1A                ; 001A SET ENTITY SPRITE 99 E6
										dc.w $99
										dc.w $E6
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 99 : "See.  I told you!{N}I can fly...sort of.{W1}"
										dc.w $99
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5779C:           dc.w 4                  ; 0004 SET TEXT INDEX 696 : "Ha, ha, ha!{W1}"
										dc.w $696
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 99 6 A 3
										dc.b $99
										dc.b 6
										dc.b $A
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 98 1
										dc.b $98
										dc.b 1
										dc.w $32                ; 0032 SET CAMERA DEST 1 5
										dc.w 1
										dc.w 5
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 5 16 3
										dc.b 0
										dc.b 5
										dc.b $16
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 B 16 1
										dc.b 7
										dc.b $B
										dc.b $16
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 7 0 C 3C
										dc.b 7
										dc.b 0
										dc.b $C
										dc.b $3C
										dc.b 2
										dc.b 4
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 99 FF 46198
										dc.b $99
										dc.b $FF
										dc.l eas_46198          
										dc.w $15                ; 0015 SET ACTSCRIPT 99 FF 46172
										dc.b $99
										dc.b $FF
										dc.l eas_46172          
										dc.w 5                  ; 0005 PLAY SOUND SFX_JUMP
										dc.w $57
										dc.w $2D                ; 002D MOVE ENTITY 99 FF 1 2
										dc.b $99
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.b 9
										dc.b 5
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 99 : "Ha, ha, ha!{W1}"
										dc.w $99
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 5                  ; 0005 PLAY SOUND SFX_JUMP
										dc.w $57
										dc.w $2D                ; 002D MOVE ENTITY 99 FF 1 2
										dc.b $99
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.b 9
										dc.b 5
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 99 : "Ha, ha, ha!{W1}"
										dc.w $99
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 5                  ; 0005 PLAY SOUND SFX_JUMP
										dc.w $57
										dc.w $2D                ; 002D MOVE ENTITY 99 FF 1 2
										dc.b $99
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.b 9
										dc.b 5
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 99 FF 460CE
										dc.b $99
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 99 FF F 1
										dc.b $99
										dc.b $FF
										dc.b $F
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 99 1
										dc.b $99
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 98 2
										dc.b $98
										dc.b 2
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 99
										dc.w $99
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 98 : "Oh my, {NAME;20}!{W1}"
										dc.w $98
										dc.w $53                ; 0053  0 0
										dc.w 0
										dc.w 0
										dc.w $53                ; 0053  99 FFFF
										dc.w $99
										dc.w $FFFF
										dc.w $15                ; 0015 SET ACTSCRIPT 99 FF 46172
										dc.b $99
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 99
										dc.b $99
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w 5                  ; 0005 PLAY SOUND SFX_FALLING
										dc.w $58
										dc.w $2D                ; 002D MOVE ENTITY 99 0 3 D
										dc.b $99
										dc.b 0
										dc.b 3
										dc.b $D
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w $53                ; 0053  0 0
										dc.w 0
										dc.w 0
										dc.w $53                ; 0053  99 FFFF
										dc.w $99
										dc.w $FFFF
										dc.b $80                ; WAIT 23
										dc.b $23
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 98
										dc.b $98
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 98 0 2 1
										dc.b $98
										dc.b 0
										dc.b 2
										dc.b 1
										dc.b 3
										dc.b $B
										dc.w $8080
										dc.w $16                ; 0016 WAIT UNTIL IDLE ENTITY 99
										dc.w $99
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $2
										dc.w 2
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $15                ; 0015 SET ACTSCRIPT 99 FF 460CE
										dc.b $99
										dc.b $FF
										dc.l eas_Init           
										dc.w $23                ; 0023 SET ENTITY FACING 99 3
										dc.b $99
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 99 FF 45E44
										dc.b $99
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $15                ; 0015 SET ACTSCRIPT 99 FF 45E44
										dc.b $99
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $15                ; 0015 SET ACTSCRIPT 99 FF 45E44
										dc.b $99
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $15                ; 0015 SET ACTSCRIPT 99 FF 45E44
										dc.b $99
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 99 1
										dc.b $99
										dc.b 1
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w $15                ; 0015 SET ACTSCRIPT 98 FF 45E44
										dc.b $98
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 98 FF 45E44
										dc.b $98
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 98 : "Thank you!  Thank you!{N}{NAME;20} is OK.{W1}"
										dc.w $98
										dc.w $26                ; 0026 MAKE ENTITY NOD 98
										dc.w $98
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $15                ; 0015 SET ACTSCRIPT 98 FF 460CE
										dc.b $98
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 99 FF 460CE
										dc.b $99
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 98 0 0 8
										dc.b $98
										dc.b 0
										dc.b 0
										dc.b 8
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 99 FF 1 1
										dc.b $99
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b 0
										dc.b 8
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 98
										dc.w $98
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 99 10 6 2
										dc.b $99
										dc.b $10
										dc.b 6
										dc.b 2
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 2 1
										dc.b 7
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45EE4
										dc.b 7
										dc.b $FF
										dc.l eas_BumpLeft       
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 0
										dc.w 0
										dc.w $53                ; 0053  0 FFFF
										dc.w 0
										dc.w $FFFF
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5797A:           dc.w 4                  ; 0004 SET TEXT INDEX 647 : "You're a man of honor!{N}Why don't you go see Creed?{W2}"
										dc.w $647
										dc.w $52                ; 0052 RELATED TO TWO ENTITIES 7 93
										dc.w 7
										dc.w $93
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 93 : "You're a man of honor!{N}Why don't you go see Creed?{W2}"
										dc.w $93
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 93 : "He's an ex-greater devil.{N}He may give you some{N}information.{W2}"
										dc.w $93
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 93 : "You must travel along the{N}river to get to Creed's{N}mansion.{W2}"
										dc.w $93
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 93 : "Maybe Polca has a raft for{N}you.{W1}"
										dc.w $93
										dc.w $23                ; 0023 SET ENTITY FACING 93 0
										dc.b $93
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 93 : "Tell the mayor to prepare a{N}raft.{W1}"
										dc.w $93
										dc.w $2D                ; 002D MOVE ENTITY A FF 1 2
										dc.b $A
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.b $A
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX A : "Yes, sir!{W1}"
										dc.w $A
										dc.w $2D                ; 002D MOVE ENTITY A FF 3 3
										dc.b $A
										dc.b $FF
										dc.b 3
										dc.b 3
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b 4
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY A
										dc.w $A
										dc.w $52                ; 0052 RELATED TO TWO ENTITIES 93 7
										dc.w $93
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 93 : "{NAME;7}, please{N}help {LEADER}.{W2}"
										dc.w $93
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 93 : "{LEADER}, good luck!{W1}"
										dc.w $93
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
