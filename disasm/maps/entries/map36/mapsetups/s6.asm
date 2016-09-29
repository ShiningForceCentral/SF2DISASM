
; SCRIPT SECTION maps\entries\map36\mapsetups\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map36_InitFunction:
										
										trap    #1
										dc.w $16
										beq.s   return_5DA26
										move.w  #$16,d0
										jsr     MoveEntityOutOfMap
return_5DA26:
										
										rts

	; End of function ms_map36_InitFunction

cs_5DA28:           dc.w 4                  ; 0004 SET TEXT INDEX CFB : "You defeated Zalbard and{N}saved Mitula.{W2}"
										dc.w $CFB
										dc.w $52                ; 0052 RELATED TO TWO ENTITIES 7 83
										dc.w 7
										dc.w $83
										dc.w $52                ; 0052 RELATED TO TWO ENTITIES 1F 83
										dc.w $1F
										dc.w $83
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 16 : "You defeated Zalbard and{N}saved Mitula.{W2}"
										dc.w $16
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 16 : "You are trustworthy{N}soldiers, so...would you{N}do me a favor?{W2}"
										dc.w $16
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 16 : "Please go to Moun with me.{W1}"
										dc.w $16
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "What are you going to do{N}there?{W1}"
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 16 : "I believe there are{N}survivors in Moun.{W2}"
										dc.w $16
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 16 : "I would like to save them.{W1}"
										dc.w $16
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7 : "We have to go through Moun{N}to get to Nazka, right?{W2}"
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "{LEADER}, let's go{N}together.{W1}"
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 16 : "Alright.{W1}"
										dc.w $16
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "{LEADER} decides to take{N}{NAME;22} with him.{W1}"
										dc.w $FFFF
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 16 : "Thank you very much.{W1}"
										dc.w $16
										dc.w $2C                ; 002C FOLLOW ENTITY 16 1F 2
										dc.w $16
										dc.w $1F
										dc.w 2
										dc.w $13                ; 0013 SET STORY FLAG 1F : Battle 31 unlocked
										dc.w $1F
										dc.w $13                ; 0013 SET STORY FLAG 21 : Battle 33 unlocked
										dc.w $21
										dc.w $13                ; 0013 SET STORY FLAG 22 : Battle 34 unlocked
										dc.w $22
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5DA7A:           dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 83
										dc.w $83
										dc.w $29                ; 0029 SET ENTITY DEST 0 4 17
										dc.w 0
										dc.w 4
										dc.w $17
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 83 FF 0 2
										dc.b $83
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 83 FF 3 1
										dc.b $83
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 83
										dc.b $83
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
										dc.b $10
										dc.b $10
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 83 FF 0 2
										dc.b $83
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 83
										dc.w $83
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 83
										dc.w $83
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 83
										dc.w $83
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 83
										dc.b $83
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
										dc.b 8
										dc.b 8
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 83 FF 0 1
										dc.b $83
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 83
										dc.w $83
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
