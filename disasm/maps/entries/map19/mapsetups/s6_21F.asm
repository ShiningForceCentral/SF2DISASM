
; SCRIPT SECTION maps\entries\map19\mapsetups\s6_21F :
; 

; =============== S U B R O U T I N E =======================================

ms_map19_flag21F_InitFunction:
										
										trap    #1
										dc.w $19
										bne.s   loc_62CAE
										move.w  #$19,d0
										jsr     MoveEntityOutOfMap
loc_62CAE:
										
										trap    #1
										dc.w 8
										bne.s   loc_62CBE
										move.w  #8,d0
										jsr     MoveEntityOutOfMap
loc_62CBE:
										
										trap    #1
										dc.w $1B
										bne.s   loc_62CCE
										move.w  #$1B,d0
										jsr     MoveEntityOutOfMap
loc_62CCE:
										
										lea     cs_62D06(pc), a0
										trap    #6
										trap    #1
										dc.w $3D5
										beq.s   loc_62CFC
										trap    #1
										dc.w $3D6
										bne.s   loc_62CF2
										lea     cs_62D0E(pc), a0
										trap    #6
										trap    #2
										dc.w $3D6
										move.b  #$FF,((FOLLOWERS_LIST-$1000000)).w
										bra.s   loc_62CFA
loc_62CF2:
										
										trap    #TRAP_SOUNDCOM
										dc.w MUSIC_TOWN
										jsr     (FadeInFromBlack).w
loc_62CFA:
										
										bra.s   return_62D04
loc_62CFC:
										
										trap    #TRAP_SOUNDCOM
										dc.w MUSIC_TOWN
										jsr     (FadeInFromBlack).w
return_62D04:
										
										rts

	; End of function ms_map19_flag21F_InitFunction

cs_62D06:           dc.w $1A                ; 001A SET ENTITY SPRITE B AA
										dc.w $B
										dc.w $AA
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_62D0E:           dc.w 4                  ; 0004 SET TEXT INDEX F7F : "King Granseal, {LEADER}{N}is here!{W1}"
										dc.w $F7F
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 81
										dc.w $81
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 1A 1D 1
										dc.b $81
										dc.b $1A
										dc.b $1D
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 4 1A 1E 1
										dc.b 4
										dc.b $1A
										dc.b $1E
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1 1A 1E 1
										dc.b 1
										dc.b $1A
										dc.b $1E
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 3 1A 1E 1
										dc.b 3
										dc.b $1A
										dc.b $1E
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 2 1A 1E 1
										dc.b 2
										dc.b $1A
										dc.b $1E
										dc.b 1
										dc.w $2C                ; 002C FOLLOW ENTITY 0 81 2
										dc.w 0
										dc.w $81
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 4 81 5
										dc.w 4
										dc.w $81
										dc.w 5
										dc.w $2C                ; 002C FOLLOW ENTITY 1 81 6
										dc.w 1
										dc.w $81
										dc.w 6
										dc.w $2C                ; 002C FOLLOW ENTITY 3 4 2
										dc.w 3
										dc.w 4
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 2 1 2
										dc.w 2
										dc.w 1
										dc.w 2
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 4
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b 4
										dc.b 0
										dc.b 3
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $43                ; 0043 RELATED TO BLOCK COPY 1D 17
										dc.w $1D
										dc.w $17
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 E
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b $E
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1 FF 460CE
										dc.b 1
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 3 FF 460CE
										dc.b 3
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 2 FF 460CE
										dc.b 2
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 4 FF 460CE
										dc.b 4
										dc.b $FF
										dc.l eas_Init           
										dc.w $32                ; 0032 SET CAMERA DEST 18 5
										dc.w $18
										dc.w 5
										dc.b $80                ; WAIT 28
										dc.b $28
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
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "King Granseal, {LEADER}{N}is here!{W1}"
										dc.w $81
										dc.w $26                ; 0026 MAKE ENTITY NOD 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080 : "Please explain what is{N}happening.{W1}"
										dc.w $8080
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $26                ; 0026 MAKE ENTITY NOD 81
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Yes, sir.{W1}"
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 0 1
										dc.b $81
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $26                ; 0026 MAKE ENTITY NOD 81
										dc.w $81
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1 1
										dc.b 1
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 3 1
										dc.b 3
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 2 1
										dc.b 2
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 4 1
										dc.b 4
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 5 1
										dc.b 5
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING A 1
										dc.b $A
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 19 1
										dc.b $19
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 8 1
										dc.b 8
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 13 1
										dc.b $13
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING B 1
										dc.b $B
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1A 1
										dc.b $1A
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1B 1
										dc.b $1B
										dc.b 1
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81 : "Listen up!{W2}"
										dc.w $81
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81 : "It took two years, but the{N}Princess finally recovered{N}from the poison.{W2}"
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "But she's still sleeping.{N}We've decided to take{N}Mitula's advice.{W1}"
										dc.w $81
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "Mitula...you mean, somebody{N}gets to kiss her?{W1}"
										dc.w $8007
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1
										dc.w 1
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 81 1
										dc.b $81
										dc.b 1
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $26                ; 0026 MAKE ENTITY NOD 80
										dc.w $80
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Yes.{N}We feel this is the right{N}time.{W1}"
										dc.w $80
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "And we need to decide which{N}one of you will kiss{N}Elis.{W1}"
										dc.w $81
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "We don't have to decide.{N}It's {LEADER}.{N}{NAME;10}, don't you agree?{W1}"
										dc.w $8007
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2A                ; 002A MAKE ENTITY SHIVER A
										dc.w $A
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 800A : "Ha, ha!  Yes, {NAME;7}!{W2}"
										dc.w $800A
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING A 2
										dc.b $A
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 800A : "I always thought {LEADER}{N}was the best choice!{W1}"
										dc.w $800A
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 0 2
										dc.b $81
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING A 1
										dc.b $A
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Are you sure?{N}Anybody disagree?{W1}"
										dc.w $81
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 2 2
										dc.b $81
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Nobody?{W1}"
										dc.w $81
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 2 2
										dc.b $81
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 4 0
										dc.b 4
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING A 1
										dc.b $A
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 19 3
										dc.b $19
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 8 3
										dc.b 8
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 13 3
										dc.b $13
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING B 1
										dc.b $B
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $32                ; 0032 SET CAMERA DEST 18 7
										dc.w $18
										dc.w 7
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 3 0 461B6
										dc.b 3
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 64
										dc.b $64
										dc.w $2D                ; 002D MOVE ENTITY 3 FF 3 1
										dc.b 3
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 3 0
										dc.b 3
										dc.b 0
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 3
										dc.w 3
										dc.w $23                ; 0023 SET ENTITY FACING 1 3
										dc.b 1
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 2 3
										dc.b 2
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 4 3
										dc.b 4
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 5 0
										dc.b 5
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING A 2
										dc.b $A
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 19 0
										dc.b $19
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 8 0
										dc.b 8
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 13 2
										dc.b $13
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING B 0
										dc.b $B
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 1A 0
										dc.b $1A
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 1B 2
										dc.b $1B
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 3 : "I understand what my friends{N}are saying, but...I love{N}her.{W2}"
										dc.w 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 3 : "May I kiss her?{N}Somebody, say yes!{W1}"
										dc.w 3
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 3 0 461B6
										dc.b 3
										dc.b 0
										dc.l eas_461B6          
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1
										dc.w 1
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING A 1
										dc.b $A
										dc.b 1
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD A
										dc.w $A
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 2 1
										dc.b 7
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 3
										dc.b 2
										dc.b $A
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING A 2
										dc.b $A
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 3 0
										dc.b 3
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "Sorry, but...I don't think{N}{NAME;3} is the right{N}choice.{W1}"
										dc.w $8007
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 3
										dc.w 3
										dc.w $2D                ; 002D MOVE ENTITY 5 FF 0 1
										dc.b 5
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b 1
										dc.b 8
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 3 2
										dc.b 3
										dc.b 2
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 5 : "I understand {NAME;3}, but{N}she is a human.{W2}"
										dc.w 5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5 : "A human is the best choice.{W1}"
										dc.w 5
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 3
										dc.w 3
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 8 62FB0
										dc.w 8
										dc.l word_62FB0         
										dc.w $2D                ; 002D MOVE ENTITY 8 FF 3 1
										dc.b 8
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 8
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8 : "{LEADER} is a human!{N}They will make a cute couple!{W1}"
										dc.w 8
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 3
										dc.w 3
word_62FB0:         dc.w 4                  ; 0004 SET TEXT INDEX F93 : "{LEADER} is a good lad{N}with the manner of a{N}knight!{W2}"
										dc.w $F93
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 13 FF 2 1
										dc.b $13
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 3 0
										dc.b 3
										dc.b 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8013 : "{LEADER} is a good lad{N}with the manner of a{N}knight!{W2}"
										dc.w $8013
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8013 : "I think he's the best{N}choice.{W1}"
										dc.w $8013
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 3
										dc.w 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 0 2
										dc.b $81
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "{NAME;1}, what do you{N}think?{W1}"
										dc.w $81
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1
										dc.w 1
										dc.w $23                ; 0023 SET ENTITY FACING 1 1
										dc.b 1
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 3 1
										dc.b 3
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 2 1
										dc.b 2
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 4 1
										dc.b 4
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 13 1
										dc.b $13
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8001 : "M...me?  Well...{W2}"
										dc.w $8001
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1
										dc.w 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8001 : "I'm worried about her...{N}but...I...{W2}"
										dc.w $8001
										dc.w $23                ; 0023 SET ENTITY FACING 1 2
										dc.b 1
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 1 1
										dc.b 1
										dc.b 1
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8001 : "Yes, a good choice....{N}{LEADER} will make her...{N}...happy....{W1}"
										dc.w $8001
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1
										dc.b 1
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 2
										dc.b 2
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 1 0 3 1
										dc.b 1
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 2 FF 2 1
										dc.b 2
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 2 0 45FBC
										dc.b 2
										dc.b 0
										dc.l eas_RotateRight    
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 4 3
										dc.b 4
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 3 3
										dc.b 3
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 13 3
										dc.b $13
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 1 FF 3 8
										dc.b 1
										dc.b $FF
										dc.b 3
										dc.b 8
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 1
										dc.w 1
										dc.w $15                ; 0015 SET ACTSCRIPT 2 FF 460CE
										dc.b 2
										dc.b $FF
										dc.l eas_Init           
										dc.w $1B                ; 001B START ENTITY ANIM 2
										dc.w 2
										dc.w $23                ; 0023 SET ENTITY FACING 2 3
										dc.b 2
										dc.b 3
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 2
										dc.w 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $32                ; 0032 SET CAMERA DEST 18 9
										dc.w $18
										dc.w 9
										dc.w $2D                ; 002D MOVE ENTITY 2 FF 3 2
										dc.b 2
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 2 : "Does she love {LEADER}?{N}I didn't know that.{W1}"
										dc.w 2
										dc.w $15                ; 0015 SET ACTSCRIPT 4 FF 45E44
										dc.b 4
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 4 FF 45E44
										dc.b 4
										dc.b $FF
										dc.l eas_Jump           
										dc.w $2D                ; 002D MOVE ENTITY 4 FF 3 1
										dc.b 4
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 2
										dc.b 3
										dc.b 2
										dc.b $A
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 2 0
										dc.b 2
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8004 : "Stop!{N}I will go and comfort her.{W1}"
										dc.w $8004
										dc.w $23                ; 0023 SET ENTITY FACING 2 3
										dc.b 2
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 4 0 3 2
										dc.b 4
										dc.b 0
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $15                ; 0015 SET ACTSCRIPT 2 FF 45E44
										dc.b 2
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 2 FF 45E44
										dc.b 2
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 2 : "{NAME;4}!{N}I'll go with you!{W1}"
										dc.w 2
										dc.w $23                ; 0023 SET ENTITY FACING 4 1
										dc.b 4
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8004 : "Oh, c'mon.{N}She needs someone like me.{W1}"
										dc.w $8004
										dc.w $2D                ; 002D MOVE ENTITY 4 FF 3 5
										dc.b 4
										dc.b $FF
										dc.b 3
										dc.b 5
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 4
										dc.w 4
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 2 : "What does he mean?{N}I don't understand!{W1}"
										dc.w 2
										dc.w $2D                ; 002D MOVE ENTITY B FF 0 2
										dc.b $B
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 2
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 800B : "They remind me of when I{N}was young.{W1}"
										dc.w $800B
										dc.w $2D                ; 002D MOVE ENTITY 1A FF 0 3
										dc.b $1A
										dc.b $FF
										dc.b 0
										dc.b 3
										dc.b 3
										dc.b 1
										dc.b 8
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1A : "{NAME;11}, you were young{N}once?{W1}"
										dc.w $1A
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1A
										dc.w $1A
										dc.w $23                ; 0023 SET ENTITY FACING B 2
										dc.b $B
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT B FF 45E44
										dc.b $B
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT B FF 45E44
										dc.b $B
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 800B : "Be quiet, you bucket of bolts!{W1}"
										dc.w $800B
										dc.w $32                ; 0032 SET CAMERA DEST 18 5
										dc.w $18
										dc.w 5
										dc.w $2D                ; 002D MOVE ENTITY A FF 1 1
										dc.b $A
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b 2
										dc.b 2
										dc.b 9
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 3 1
										dc.b 3
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 2 1
										dc.b 2
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING A 1
										dc.b $A
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING B 1
										dc.b $B
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1A 1
										dc.b $1A
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 13 1
										dc.b $13
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 800A : "You heard everyone.{N}We think {LEADER} is the{N}right choice.{W2}"
										dc.w $800A
										dc.w $23                ; 0023 SET ENTITY FACING A 3
										dc.b $A
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 800A : "{NAME;4} will take care{N}of {NAME;1}.{W2}"
										dc.w $800A
										dc.w $26                ; 0026 MAKE ENTITY NOD 81
										dc.w $81
										dc.w $23                ; 0023 SET ENTITY FACING A 1
										dc.b $A
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 800A : "Everything went as you{N}expected, huh?{W1}"
										dc.w $800A
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 81
										dc.w $81
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81 : "You knew that?{N}{NAME;10}, you're smart.{W2}"
										dc.w $81
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81 : "But I didn't know what{N}{NAME;1} or {NAME;3} would do.{W2}I didn't want to hurt their{N}feelings.{W1}"
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "{LEADER}, I choose you.{W1}"
										dc.w $81
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
										dc.b $10
										dc.b $10
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 1
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 81 1
										dc.b $81
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080 : "Now, {LEADER}.{N}Please go awaken her.{W1}"
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 1
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080 : "The Minister is waiting{N}for you.{W1}"
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 2
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 2 1
										dc.b $81
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Oh, {LEADER}!{N}I really respect you.{W2}"
										dc.w $81
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
