
; SCRIPT SECTION maps\entries\map18\mapsetups\s6_212 :
; 

; =============== S U B R O U T I N E =======================================

ms_map18_flag212_InitFunction:
										
										trap    #CHECK_FLAG
										dc.w $398
										bne.s   loc_612A8
										lea     cs_612BE(pc), a0
										trap    #6
										trap    #SET_FLAG
										dc.w $398               ; set after the scene with Zeon plays as you leave the Galam Drawbridge area
loc_612A8:
										
										move.w  #$80,d0 
										jsr     MoveEntityOutOfMap
										move.w  #$82,d0 
										jsr     MoveEntityOutOfMap
										rts

	; End of function ms_map18_flag212_InitFunction

cs_612BE:           dc.w 4                  ; 0004 INIT TEXT CURSOR E61 : "{LEADER} defeated Red{N}Baron too?  Is that what{N}you said, Geshp?{W1}"
										dc.w $E61
										dc.w $48                ; 0048 LOAD MAP 3B 8 4
										dc.w $3B
										dc.w 8
										dc.w 4
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
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1A 3F 3F 3
										dc.b $1A
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.w $4A                ; 004A FADE IN FROM BLACK HALF
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8082 : "{LEADER} defeated Red{N}Baron too?  Is that what{N}you said, Geshp?{W1}"
										dc.w $8082
										dc.w $26                ; 0026 MAKE ENTITY NOD 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Yes, sir...I'm sorry.{W1}"
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8082 : "Once again, my minions have{N}failed me.{W2}"
										dc.w $8082
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8082 : "Are my soldiers that weak?{W1}"
										dc.w $8082
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w $50                ; 0050 SET ENTITY SIZE 80 15 
										dc.w $80
										dc.w $15
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "Yes...oh, no!  I mean, they{N}were strong enough.{W2}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "But {LEADER} and his force{N}were smarter.{W1}"
										dc.w $80
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 460CE
										dc.b $80
										dc.b $FF
										dc.l eas_Init           
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8082 : "No more excuses!{W2}"
										dc.w $8082
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8082 : "This is your last chance.{N}Kill {LEADER} this time,{N}or I'll kill you!{W1}"
										dc.w $8082
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46172
										dc.b $80
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
										dc.b 8
										dc.b 8
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Ah...yes, sir.  I'll kill{N}{LEADER} this time.{N}I stake my life on it.{W1}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8082 : "Bring the Jewel of Evil back{N}to me!{W1}"
										dc.w $8082
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Yes, sir!{W1}"
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45FF0
										dc.b $80
										dc.b 0
										dc.l eas_RotateRightHighSpeed
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 6
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 3F 3F 3
										dc.b $80
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $80                ; WAIT 96
										dc.b $96
										dc.w $53                ; 0053  83 FFFF
										dc.w $83
										dc.w $FFFF
										dc.w $53                ; 0053  81 0
										dc.w $81
										dc.w 0
										dc.w $15                ; 0015 SET ACTSCRIPT 83 0 45FA8
										dc.b $83
										dc.b 0
										dc.l eas_Transparent    
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 83 D C 3
										dc.b $83
										dc.b $D
										dc.b $C
										dc.b 3
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 D C 1
										dc.b $81
										dc.b $D
										dc.b $C
										dc.b 1
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 81
										dc.w $81
										dc.w 7
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $2E                ; 002E HIDE ENTITY 83
										dc.w $83
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
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 2
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $26                ; 0026 MAKE ENTITY NOD 81
										dc.w $81
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8082 : "You were right, Odd Eye.{W1}"
										dc.w $8082
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 1
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Of course.{W1}"
										dc.w $81
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8082 : "I can't trust Geshp anymore.{W2}"
										dc.w $8082
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8082 : "If he fails, you must battle{N}{LEADER}.{W1}"
										dc.w $8082
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 81
										dc.w $81
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81 : "You want me to kill{N}{LEADER}?{W2}"
										dc.w $81
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
										dc.b 8
										dc.b 8
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 1
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81 : "He's probably much stronger{N}now.{N}Hmmm, sounds interesting.{W2}"
										dc.w $81
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 460CE
										dc.b $81
										dc.b $FF
										dc.l eas_Init           
										dc.w $23                ; 0023 SET ENTITY FACING 81 1
										dc.b $81
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "I'll do it.  If this comes{N}to pass, it will be his final{N}battle.{W1}"
										dc.w $81
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 61426
										dc.l sub_61426
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 12090A03
										dc.l $12090A03
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT

; =============== S U B R O U T I N E =======================================

sub_61426:
										
										lea     (PALETTE_1).l,a0
										lea     (PALETTE_1_BIS).l,a1
										moveq   #$F,d0
loc_61434:
										
										move.l  (a0)+,(a1)+
										dbf     d0,loc_61434
										rts

	; End of function sub_61426

cs_6143C:           dc.w 4                  ; 0004 INIT TEXT CURSOR 36F : "Sorry, {LEADER}.{N}I'm going back to Roft.{N}I'm worried about Petro.{W1}"
										dc.w $36F
										dc.w $15                ; 0015 SET ACTSCRIPT 1A FF 460CE
										dc.b $1A
										dc.b $FF
										dc.l eas_Init           
										dc.w $28                ; 0028 MOVE ENTITY NEXT TO PLAYER 1A 0
										dc.w $1A
										dc.w 0
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1A : "Sorry, {LEADER}.{N}I'm going back to Roft.{N}I'm worried about Petro.{W1}"
										dc.w $1A
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 1A FF 1 4
										dc.b $1A
										dc.b $FF
										dc.b 1
										dc.b 4
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
										dc.w $23                ; 0023 SET ENTITY FACING 1A 3
										dc.b $1A
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $26                ; 0026 MAKE ENTITY NOD 1A
										dc.w $1A
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 1A FF 1 4
										dc.b $1A
										dc.b $FF
										dc.b 1
										dc.b 4
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 1A
										dc.w $1A
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
