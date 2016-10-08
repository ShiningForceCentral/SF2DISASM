
; SCRIPT SECTION maps\entries\map26\mapsetups\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map26_InitFunction:
										
										trap    #CHECK_FLAG
										dc.w $30B
										bne.s   loc_59DF2
										lea     cs_59E04(pc), a0
										trap    #6
										trap    #SET_FLAG
										dc.w $30B               ; set after the Cotton Balloon pops and you land in Floor World
										move.b  #$1A,((EGRESS_MAP_INDEX-$1000000)).w
loc_59DF2:
										
										trap    #CHECK_FLAG
										dc.w $30C
										beq.s   return_59E02
										move.w  #$81,d0 
										jsr     MoveEntityOutOfMap
return_59E02:
										
										rts

	; End of function ms_map26_InitFunction

cs_59E04:           dc.w 4                  ; 0004 INIT TEXT CURSOR 6CB : "The Cotton Balloon popped.{W1}"
										dc.w $6CB
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w $46                ; 0046  15 8
										dc.w $15
										dc.w 8
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
										dc.w $1C                ; 001C STOP ENTITY ANIM 0
										dc.w 0
										dc.w $1C                ; 001C STOP ENTITY ANIM 7
										dc.w 7
										dc.w $1C                ; 001C STOP ENTITY ANIM 1F
										dc.w $1F
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
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 82
										dc.b $82
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 83
										dc.b $83
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 84
										dc.b $84
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 1A 7 3
										dc.b 0
										dc.b $1A
										dc.b 7
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 1B 6 3
										dc.b 7
										dc.b $1B
										dc.b 6
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 19 6 3
										dc.b $1F
										dc.b $19
										dc.b 6
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 1A 6 1
										dc.b $82
										dc.b $1A
										dc.b 6
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 83 19 5 1
										dc.b $83
										dc.b $19
										dc.b 5
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 84 1B 5 1
										dc.b $84
										dc.b $1B
										dc.b 5
										dc.b 1
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $2D                ; 002D MOVE ENTITY 0 0 3 7
										dc.b 0
										dc.b 0
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 3 7
										dc.b 7
										dc.b 0
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F 0 3 7
										dc.b $1F
										dc.b 0
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 82 0 3 7
										dc.b $82
										dc.b 0
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 83 0 3 7
										dc.b $83
										dc.b 0
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 84 FF 3 7
										dc.b $84
										dc.b $FF
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $1B                ; 001B START ENTITY ANIM 0
										dc.w 0
										dc.w $1B                ; 001B START ENTITY ANIM 7
										dc.w 7
										dc.w $1B                ; 001B START ENTITY ANIM 1F
										dc.w $1F
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2E                ; 002E HIDE ENTITY 82
										dc.w $82
										dc.w $2E                ; 002E HIDE ENTITY 83
										dc.w $83
										dc.w $2E                ; 002E HIDE ENTITY 84
										dc.w $84
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "The Cotton Balloon popped.{W1}"
										dc.w $FFFF
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 7 2
										dc.w $1F
										dc.w 7
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_59F20:           dc.w 4                  ; 0004 INIT TEXT CURSOR 6CC : "Ungh!{W2}"
										dc.w $6CC
										dc.w $32                ; 0032 SET CAMERA DEST 0 14
										dc.w 0
										dc.w $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Ungh!{W2}"
										dc.w $81
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "It's too heavy. I can't{N}lift it.  I give up!{W1}"
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 8
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b 8
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 81
										dc.w $81
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
