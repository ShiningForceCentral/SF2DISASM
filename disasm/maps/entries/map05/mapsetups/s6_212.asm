
; SCRIPT SECTION maps\entries\map05\mapsetups\s6_212 :
; 

; =============== S U B R O U T I N E =======================================

ms_map5_flag212_InitFunction:
										
										trap    #1
										dc.w $3B0
										bne.s   loc_60630
										lea     cs_607DE(pc), a0
										trap    #6
										trap    #2
										dc.w $3B0
										bra.s   loc_60636
loc_60630:
										
										lea     cs_6060E(pc), a0
										trap    #6
loc_60636:
										
										trap    #1
										dc.w $3AE
										bne.s   loc_6067C
										cmpi.l  #$6005580,((RAM_Entity_StructOffset_XAndStart-$1000000)).w
										bne.s   loc_6067C
										trap    #1
										dc.w $1C                ; if character 1C joined the Force : Lemon ?
										beq.s   loc_6065E
										lea     cs_60656(pc), a0
										trap    #6
										bra.w   loc_6065E
cs_60656:
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1C 1B 37 1
										dc.b $1C
										dc.b $1B
										dc.b $37
										dc.b 1
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
loc_6065E:
										
										lea     cs_60C42(pc), a0
										trap    #6
										trap    #1
										dc.w $3A2
										beq.s   loc_60672
										lea     cs_60EB2(pc), a0
										trap    #6
										bra.s   loc_60678
loc_60672:
										
										lea     cs_60CA4(pc), a0
										trap    #6
loc_60678:
										
										trap    #2
										dc.w $3AE
loc_6067C:
										
										trap    #1
										dc.w $1B
										beq.s   loc_6068C
										move.w  #$1B,d0
										jsr     MoveEntityOutOfMap
loc_6068C:
										
										trap    #1
										dc.w $3B0
										bne.s   loc_6069C
										move.w  #$82,d0 
										jsr     MoveEntityOutOfMap
loc_6069C:
										
										trap    #1
										dc.w $3AD
										beq.s   loc_606B4
										lea     cs_606AC(pc), a0
										trap    #6
										bra.w   loc_606B4
cs_606AC:
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 1A 32 3
										dc.b $80
										dc.b $1A
										dc.b $32
										dc.b 3
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
loc_606B4:
										
										trap    #1
										dc.w $1C
										beq.s   loc_606BE
										trap    #2
										dc.w $3B1
loc_606BE:
										
										trap    #1
										dc.w $3AC
										beq.s   return_606E8
										trap    #1
										dc.w $3AD
										bne.s   return_606E8
										lea     cs_606EA(pc), a0
										trap    #6
										trap    #1
										dc.w $1C
										beq.s   return_606E8
										lea     cs_606E0(pc), a0
										trap    #6
										bra.w   return_606E8
cs_606E0:
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1C B A 1
										dc.b $1C
										dc.b $B
										dc.b $A
										dc.b 1
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
return_606E8:
										
										rts

	; End of function ms_map5_flag212_InitFunction

cs_606EA:           dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 B A 1
										dc.b 0
										dc.b $B
										dc.b $A
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 B A 1
										dc.b 7
										dc.b $B
										dc.b $A
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F B A 1
										dc.b $1F
										dc.b $B
										dc.b $A
										dc.b 1
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w $46                ; 0046  5 4
										dc.w 5
										dc.w 4
										dc.b $80                ; WAIT A
										dc.b $A
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
cs_60708:           dc.w 4                  ; 0004 SET TEXT INDEX DB9 : "Sir Astral!  {LEADER}!{W1}"
										dc.w $DB9
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1C 15 21 3
										dc.b $1C
										dc.b $15
										dc.b $21
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 460CE
										dc.b $1C
										dc.b $FF
										dc.l eas_Init           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801C : "Sir Astral!  {LEADER}!{W1}"
										dc.w $801C
										dc.w $32                ; 0032 SET CAMERA DEST 10 1C
										dc.w $10
										dc.w $1C
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 15 27 1
										dc.b 0
										dc.b $15
										dc.b $27
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 16 27 1
										dc.b 7
										dc.b $16
										dc.b $27
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 14 27 1
										dc.b $1F
										dc.b $14
										dc.b $27
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801C : "{LEADER}, wait!{W1}"
										dc.w $801C
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 3 2
										dc.b $1C
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.b $80
										dc.b $80
										dc.w $32                ; 0032 SET CAMERA DEST 10 21
										dc.w $10
										dc.w $21
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801C : "May I join your force?{W1}"
										dc.w $801C
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "Well...{W1}"
										dc.w $1F
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 801C : "You can trust me.{N}I'm a born fighter.{W2}"
										dc.w $801C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 801C : "As you know, I want to die.{W2}"
										dc.w $801C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801C : "I will die fighting for your{N}cause, if you let me.{W1}"
										dc.w $801C
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 1F 0
										dc.b $1F
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "He's a hero in Galam.{N}I think he should join us.{W1}"
										dc.w $1F
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $26                ; 0026 MAKE ENTITY NOD 7
										dc.w 7
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 0 0 1 3
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b $80
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 7 0 1 4
										dc.b 7
										dc.b 0
										dc.b 1
										dc.b 4
										dc.b $A
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 4
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 4
										dc.b 8
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "{NAME;28}, please come{N}with us.  You'll be a great{N}help.{W1}"
										dc.w $1F
										dc.w 8                  ; 0008 JOIN FORCE 1C
										dc.w $1C
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 45E44
										dc.b $1C
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 45E44
										dc.b $1C
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801C : "Oh, thank you!  I know I can{N}take the King of the Devils!{W1}"
										dc.w $801C
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 7 2
										dc.w $1F
										dc.w 7
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1C 1F 2
										dc.w $1C
										dc.w $1F
										dc.w 2
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
cs_607DE:           dc.w 4                  ; 0004 SET TEXT INDEX D3C : "I'm guilty!{W1}"
										dc.w $D3C
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 3F 3F 3
										dc.b $82
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 15 27 1
										dc.b 0
										dc.b $15
										dc.b $27
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 16 28 1
										dc.b 7
										dc.b $16
										dc.b $28
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 14 28 1
										dc.b $1F
										dc.b $14
										dc.b $28
										dc.b 1
										dc.w $46                ; 0046  10 22
										dc.w $10
										dc.w $22
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C : "I'm guilty!{W1}"
										dc.w $1C
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
										dc.b $80                ; WAIT 50
										dc.b $50
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 2
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.b $80
										dc.b $80
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Hey, there's {NAME;28}.{W1}"
										dc.w 7
										dc.w $32                ; 0032 SET CAMERA DEST D 1C
										dc.w $D
										dc.w $1C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1C : "I've killed a lot of people{N}for the devils!{W2}"
										dc.w $1C
										dc.w $23                ; 0023 SET ENTITY FACING 1C 3
										dc.b $1C
										dc.b 3
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1C
										dc.w $1C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C : "The guilt is too much to{N}handle.  I must die!{W1}"
										dc.w $1C
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 46172
										dc.b $1C
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1C
										dc.b $1C
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.b $80                ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80
										dc.w $26                ; 0026 MAKE ENTITY NOD 1C
										dc.w $1C
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 1 5
										dc.b $1C
										dc.b $FF
										dc.b 1
										dc.b 5
										dc.b 0
										dc.b 3
										dc.b $80
										dc.b $80
										dc.w $23                ; 0023 SET ENTITY FACING 1C 3
										dc.b $1C
										dc.b 3
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1C
										dc.b $1C
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $2
										dc.w 2
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.b $80                ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 46172
										dc.b $1C
										dc.b $FF
										dc.l eas_46172          
										dc.w 5                  ; 0005 PLAY SOUND SFX_FALLING
										dc.w $58
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 3 6
										dc.b $1C
										dc.b $FF
										dc.b 3
										dc.b 6
										dc.b $80
										dc.b $80
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1C 3F 3F 3
										dc.b $1C
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 13 21 3
										dc.b $82
										dc.b $13
										dc.b $21
										dc.b 3
										dc.w $33                ; 0033 SET QUAKE AMOUNT 5
										dc.w 5
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $32                ; 0032 SET CAMERA DEST 10 22
										dc.w $10
										dc.w $22
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 2 1
										dc.b 7
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Gee!{N}{NAME;28} killed himself!{W1}"
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 2
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.b $80
										dc.b $80
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F : "No, {NAME;28} cannot die{N}by jumping off a cliff.{W2}"
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 1F 0
										dc.b $1F
										dc.b 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F : "{NAME;28} is an immortal{N}vampire.{W2}"
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "But, I'm sure the impact{N}didn't feel too good.{W1}"
										dc.w $1F
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $26                ; 0026 MAKE ENTITY NOD 7
										dc.w 7
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 7 2
										dc.w $1F
										dc.w 7
										dc.w 2
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 460CE
										dc.b $1C
										dc.b $FF
										dc.l eas_Init           
										dc.w $1B                ; 001B START ENTITY ANIM 1C
										dc.w $1C
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
cs_6093A:           dc.w 4                  ; 0004 SET TEXT INDEX D44 : "Ah, devils finally found the{N}hidden door.{W1}"
										dc.w $D44
										dc.w $53                ; 0053  1B 0
										dc.w $1B
										dc.w 0
										dc.w $53                ; 0053  80 FFFF
										dc.w $80
										dc.w $FFFF
										dc.w $32                ; 0032 SET CAMERA DEST 6 2
										dc.w 6
										dc.w 2
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 460CE
										dc.b $1C
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
										dc.w $23                ; 0023 SET ENTITY FACING 1C 1
										dc.b $1C
										dc.b 1
										dc.w $29                ; 0029 SET ENTITY DEST 0 B 7
										dc.w 0
										dc.w $B
										dc.w 7
										dc.w $29                ; 0029 SET ENTITY DEST 7 B 7
										dc.w 7
										dc.w $B
										dc.w 7
										dc.w $29                ; 0029 SET ENTITY DEST 1F B 7
										dc.w $1F
										dc.w $B
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 1
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 9
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 2 1
										dc.b $1F
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 9
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8080 : "Ah, devils finally found the{N}hidden door.{W1}"
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080 : "I must give the people time{N}to escape!{W1}"
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "The priest pulls out a holy{N}symbol.{W1}"
										dc.w $FFFF
										dc.w $53                ; 0053  83 FFFF
										dc.w $83
										dc.w $FFFF
										dc.w $53                ; 0053  80 0
										dc.w $80
										dc.w 0
										dc.w 5                  ; 0005 PLAY SOUND SFX_LANDSTALKER_ITEM
										dc.w $65
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 83 B 4 3
										dc.b $83
										dc.b $B
										dc.b 4
										dc.b 3
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $2D                ; 002D MOVE ENTITY 83 0 3 1
										dc.b $83
										dc.b 0
										dc.b 3
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "What's he doing?{W1}"
										dc.w $8007
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "He's mistaking us for devils.{W1}"
										dc.w $1F
										dc.w $2E                ; 002E HIDE ENTITY 83
										dc.w $83
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8080 : "What tough devils!{W2}"
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080 : "My symbol doesn't drive{N}them away!{W1}"
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 1
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "Excuse me, we're not devils.{W1}"
										dc.w $1F
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080 : "I don't believe you!{W1}"
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "But we really...{W1}"
										dc.w $8007
										dc.w $53                ; 0053  1B 0
										dc.w $1B
										dc.w 0
										dc.w $53                ; 0053  80 FFFF
										dc.w $80
										dc.w $FFFF
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1B B 4 3
										dc.b $1B
										dc.b $B
										dc.b 4
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B : "Brother?{W1}"
										dc.w $1B
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8080 : "{NAME;27}, they found the{N}hidden door!{W2}"
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080 : "I tried to drive them away{N}with this holy symbol, but{N}I failed.{W1}"
										dc.w $8080
										dc.w $53                ; 0053  80 0
										dc.w $80
										dc.w 0
										dc.w $26                ; 0026 MAKE ENTITY NOD 1B
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B : "Then, they're not devils.{W1}"
										dc.w $1B
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080 : "Nobody but devils ever come{N}to such a dangerous place!{N}They must be devils!{W1}"
										dc.w $8080
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B : "Have you asked them?{W1}"
										dc.w $1B
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 0 1
										dc.b $1F
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 9
										dc.b 1
										dc.b $D
										dc.b 1
										dc.b $D
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 801F : "How can we explain this?{W2}"
										dc.w $801F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F : "We are from Granseal.{N}We came here to defeat the{N}devils.{W1}"
										dc.w $801F
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1B
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B : "Granseal?{W1}"
										dc.w $1B
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 1
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 8
										dc.b 1
										dc.b $80
										dc.b $80
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B : "Really?{W1}"
										dc.w $1B
										dc.w $2D                ; 002D MOVE ENTITY 1B FF 3 1
										dc.b $1B
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B : "Alright!{W1}"
										dc.w $1B
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B : "This is great news!{W1}"
										dc.w $1B
										dc.w $15                ; 0015 SET ACTSCRIPT 1B FF 45E44
										dc.b $1B
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1B FF 45E44
										dc.b $1B
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B : "Are you Sir Astral?{W1}"
										dc.w $1B
										dc.w $26                ; 0026 MAKE ENTITY NOD 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F : "Yes, but...I'm sorry, have{N}we met?{W1}"
										dc.w $801F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1B : "I'm {NAME;27}, a son of{N}Hawel.{W2}"
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B : "Do you remember me?{W1}"
										dc.w $1B
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F : "Hawel's son?{W1}"
										dc.w $801F
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 0 1
										dc.b $1F
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 1
										dc.b $A
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $23                ; 0023 SET ENTITY FACING 1B 0
										dc.b $1B
										dc.b 0
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1F
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 801F : "Oh, {NAME;27}!{W2}"
										dc.w $801F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 801F : "Yes, of course.{N}Nice to see you again.{W2}"
										dc.w $801F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F : "What are you doing here?{W1}"
										dc.w $801F
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
cs_60B10:           dc.w 4                  ; 0004 SET TEXT INDEX D62 : "I came back to Yeel to{N}continue my father's work.{W1}"
										dc.w $D62
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B : "I came back to Yeel to{N}continue my father's work.{W1}"
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F : "{NAME;27}, maybe you can{N}answer some questions?{W1}"
										dc.w $801F
										dc.w $26                ; 0026 MAKE ENTITY NOD 1B
										dc.w $1B
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1B : "I'll try.{W2}"
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B : "What would you like to know?{W1}"
										dc.w $1B
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F : "Oh, this will be a great{N}help!{W1}"
										dc.w $801F
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 1
										dc.b 9
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $23                ; 0023 SET ENTITY FACING 1B 3
										dc.b $1B
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "You can use the room below.{W1}"
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 3 1
										dc.b $1F
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b $A
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F : "Thank you very much.{W1}"
										dc.w $801F
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F : "I really appreciate this.{W1}"
										dc.w $801F
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 1B 0 1 1
										dc.b $1B
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 1
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1B 3F 3F 3
										dc.b $1B
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 1
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 3F 3F 3
										dc.b $80
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 7 2
										dc.w $1F
										dc.w 7
										dc.w 2
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
cs_60BA6:           dc.w 4                  ; 0004 SET TEXT INDEX D6A : "I heard you're going to{N}defeat the devils....{W1}"
										dc.w $D6A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B : "I heard you're going to{N}defeat the devils....{W1}"
										dc.w $1B
										dc.w $26                ; 0026 MAKE ENTITY NOD 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "Yep.  {LEADER} just{N}solved the secret.  We{N}can now enter the tower.{W1}"
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1B : "The tower?{W2}"
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B : "Then, all these disasters{N}were caused by Zeon?{W1}"
										dc.w $1B
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 1
										dc.b 9
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 1B 3
										dc.b $1B
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Let me help you.{W1}"
										dc.w $80
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 461E4
										dc.b $80
										dc.b 0
										dc.l eas_461E4          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "I would like to give you{N}a hand.{W1}"
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 3 1
										dc.b $1F
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b $A
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "Oh, thank you.{W1}"
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F : "I appreciate your kindness.{W1}"
										dc.w $801F
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 1B 0 1 1
										dc.b $1B
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 1
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1B 3F 3F 3
										dc.b $1B
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 1
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 3F 3F 3
										dc.b $80
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 7 2
										dc.w $1F
										dc.w 7
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1C 1F 2
										dc.w $1C
										dc.w $1F
										dc.w 2
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
cs_60C42:           dc.w 4                  ; 0004 SET TEXT INDEX D72 : "...and now we're here.{W1}"
										dc.w $D72
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 460CE
										dc.b $1C
										dc.b $FF
										dc.l eas_Init           
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
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 1C 36 2
										dc.b 0
										dc.b $1C
										dc.b $36
										dc.b 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 1C 37 2
										dc.b 7
										dc.b $1C
										dc.b $37
										dc.b 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 1B 35 2
										dc.b $1F
										dc.b $1B
										dc.b $35
										dc.b 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 1A 32 3
										dc.b $80
										dc.b $1A
										dc.b $32
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1B 19 35 0
										dc.b $1B
										dc.b $19
										dc.b $35
										dc.b 0
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w $46                ; 0046  13 30
										dc.w $13
										dc.w $30
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F : "...and now we're here.{W1}"
										dc.w $801F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1B : "Wow!  Your story is so{N}complicated.{W2}"
										dc.w $1B
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1B : "But, from what I understand,{N}Zeon is reviving.{W2}"
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B : "And all these disasters were{N}caused by him?{W1}"
										dc.w $1B
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
cs_60CA4:           dc.w 4                  ; 0004 SET TEXT INDEX D76 : "That's right.  We have to{N}find out where the Holy{N}Sword is.{W1}"
										dc.w $D76
										dc.w $26                ; 0026 MAKE ENTITY NOD 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F : "That's right.  We have to{N}find out where the Holy{N}Sword is.{W1}"
										dc.w $801F
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1B : "I think I've seen it in a{N}book....{W2}"
										dc.w $1B
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1B
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B : "Yes, I did...but...{N}I don't remember....{W1}"
										dc.w $1B
										dc.w $23                ; 0023 SET ENTITY FACING 1B 2
										dc.b $1B
										dc.b 2
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F : "It's important...{W1}"
										dc.w $801F
										dc.w $23                ; 0023 SET ENTITY FACING 1B 0
										dc.b $1B
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B : "Please, give me a moment.{W1}"
										dc.w $1B
										dc.w $23                ; 0023 SET ENTITY FACING 1B 2
										dc.b $1B
										dc.b 2
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1B
										dc.b $1B
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$14 Y=$14
										dc.b $14
										dc.b $14
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.b $80                ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 1B FF 2 2
										dc.b $1B
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.b $A
										dc.b $14
										dc.b 8
										dc.b $14
										dc.b 0
										dc.b 2
										dc.b $C
										dc.b $14
										dc.b $80
										dc.b $80
										dc.w $23                ; 0023 SET ENTITY FACING 1B 2
										dc.b $1B
										dc.b 2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 1B FF 2 2
										dc.b $1B
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.b $A
										dc.b $14
										dc.b 8
										dc.b $14
										dc.b 0
										dc.b 2
										dc.b $C
										dc.b $14
										dc.b $80
										dc.b $80
										dc.w $23                ; 0023 SET ENTITY FACING 1B 3
										dc.b $1B
										dc.b 3
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $26                ; 0026 MAKE ENTITY NOD 1B
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B : "Was it this one?{W1}"
										dc.w $1B
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1B
										dc.b $1B
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$20 Y=$20
										dc.b $20
										dc.b $20
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.b $80                ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 1B FF 2 2
										dc.b $1B
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.b 1
										dc.b 2
										dc.b $80
										dc.b $80
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1B
										dc.w $1B
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1B
										dc.w $1B
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1B
										dc.w $1B
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B : "No, that's not it.{W1}"
										dc.w $1B
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1B
										dc.b $1B
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.b $80                ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 1B FF 3 2
										dc.b $1B
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.b $C
										dc.b $50
										dc.b $80
										dc.b $80
										dc.w $15                ; 0015 SET ACTSCRIPT 1B FF 460CE
										dc.b $1B
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1B FF 45E44
										dc.b $1B
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1B FF 45E44
										dc.b $1B
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B : "How about this one?{W1}"
										dc.w $1B
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1B
										dc.b $1B
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.b $80                ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 1B FF 1 2
										dc.b $1B
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.b $80
										dc.b $80
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1B
										dc.w $1B
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1B
										dc.w $1B
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1B
										dc.w $1B
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $15                ; 0015 SET ACTSCRIPT 1B FF 45E44
										dc.b $1B
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1B FF 45E44
										dc.b $1B
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B : "Yeah, I got it!{W1}"
										dc.w $1B
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1F
										dc.b $1F
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.b $80                ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 1
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b 2
										dc.b 2
										dc.b $80
										dc.b $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F : "Is that the right one?{W1}"
										dc.w $801F
										dc.w $23                ; 0023 SET ENTITY FACING 1B 0
										dc.b $1B
										dc.b 0
										dc.w $26                ; 0026 MAKE ENTITY NOD 1B
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B : "Yes!  But...{W1}"
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F : "But what?{W1}"
										dc.w $801F
										dc.w $15                ; 0015 SET ACTSCRIPT 1B FF 460CE
										dc.b $1B
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 1B FF 3 1
										dc.b $1B
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 8
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B : "The most important part is{N}missing.  It's been stolen.{W1}"
										dc.w $1B
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E94
										dc.b $1F
										dc.b $FF
										dc.l eas_JumpRight      
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1F
										dc.b $1F
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.b $80                ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 2 2
										dc.b $1F
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.b $80
										dc.b $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 801F : "Who could've taken it?{W2}"
										dc.w $801F
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F : "Oh, we've lost the key.{W1}"
										dc.w $801F
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 2 4
										dc.b 7
										dc.b $FF
										dc.b 2
										dc.b 4
										dc.b 1
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $23                ; 0023 SET ENTITY FACING 1B 3
										dc.b $1B
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8007 : "Not necessarily, Sir Astral.{W2}"
										dc.w $8007
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "Believe in {LEADER}.{N}He was chosen by the gods.{W1}"
										dc.w $8007
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 801F : "Hmmm....{W2}"
										dc.w $801F
										dc.w $26                ; 0026 MAKE ENTITY NOD 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F : "Yes, {NAME;7} is right.{N}{LEADER} is our leader!{W1}"
										dc.w $801F
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 0 4
										dc.b $1F
										dc.b $FF
										dc.b 0
										dc.b 4
										dc.b $B
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 801F : "{LEADER}, we have to{N}find the Holy Sword and{N}the door to the tower.{W2}"
										dc.w $801F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F : "The legends only hint of{N}you, but we believe in you.{W1}"
										dc.w $801F
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1B 0
										dc.b $1B
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Believe in the power of{N}your jewel!{W1}"
										dc.w $80
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 7 2
										dc.w $1F
										dc.w 7
										dc.w 2
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 1
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b $B
										dc.b 1
										dc.b $80
										dc.b $80
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
cs_60EB2:           dc.w 4                  ; 0004 SET TEXT INDEX D8C : "Yes, that's the truth.{W1}"
										dc.w $D8C
										dc.w $26                ; 0026 MAKE ENTITY NOD 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F : "Yes, that's the truth.{W1}"
										dc.w $801F
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 0 1
										dc.b $1F
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1C 1
										dc.b $1C
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F : "Now, {LEADER}.{W1}"
										dc.w $801F
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1B 0
										dc.b $1B
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "We need to return and{N}restore world peace.{W1}"
										dc.w $80
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 7 2
										dc.w $1F
										dc.w 7
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1C 1F 2
										dc.w $1C
										dc.w $1F
										dc.w 2
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 1
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b $B
										dc.b 1
										dc.b $80
										dc.b $80
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
cs_60F18:           dc.w 4                  ; 0004 SET TEXT INDEX D8F : "{LEADER}, would you mind{N}if I went with you?{W1}"
										dc.w $D8F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B : "{LEADER}, would you mind{N}if I went with you?{W1}"
										dc.w $1B
										dc.w $52                ; 0052 RELATED TO TWO ENTITIES 1F 1B
										dc.w $1F
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F : "No, {NAME;27}.  You have{N}to continue your work.{W1}"
										dc.w $801F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1B : "I knew you'd say that, but I{N}can't continue my work if{N}Zeon revives.{W2}"
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B : "Also, as a historian, I{N}want to see the King of{N}the Devils.{W1}"
										dc.w $1B
										dc.w $52                ; 0052 RELATED TO TWO ENTITIES 7 1B
										dc.w 7
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "{NAME;27} will just follow{N}us if you don't let him{N}join us.{W1}"
										dc.w $8007
										dc.w $26                ; 0026 MAKE ENTITY NOD 1B
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B : "{NAME;7} is right.{W1}"
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F : "(Sigh)...OK.{W1}"
										dc.w $801F
										dc.w 8                  ; 0008 JOIN FORCE 1B
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B : "I'm so excited!{W1}"
										dc.w $1B
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1B
										dc.w $1B
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "This is not a sight-seeing{N}tour, OK?!{N}Let's go {LEADER}!{W1}"
										dc.w $8007
										dc.w $2C                ; 002C FOLLOW ENTITY 1B 0 5
										dc.w $1B
										dc.w 0
										dc.w 5
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
cs_60F64:           dc.w 4                  ; 0004 SET TEXT INDEX D98 : "It's a fine-looking piano.{N}Will you play it?{W1}"
										dc.w $D98
										dc.w 2                  ; 0002 DISPLAY TEXT BOX FFFF : "It's a fine-looking piano.{N}Will you play it?{W1}"
										dc.w $FFFF
										dc.w $11                ; 0011 STORY YESNO PROMPT
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 59 60FA4
										dc.w $59
										dc.l word_60FA4         
										dc.w 4                  ; 0004 SET TEXT INDEX D99 : "Something opened somewhere.{W1}"
										dc.w $D99
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_PIANO_THEME
										dc.w $11
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $33                ; 0033 SET QUAKE AMOUNT 1
										dc.w 1
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.b $80                ; WAIT 5A
										dc.b $5A
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "Something opened somewhere.{W1}"
										dc.w $FFFF
										dc.w $34                ; 0034 SET BLOCKS 202D 101 B04
										dc.w $202D
										dc.w $101
										dc.w $B04
										dc.w $10                ; 0010 SET FLAG 3AC FFFF
										dc.w $3AC
										dc.w $FFFF
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
word_60FA4:         dc.w 4                  ; 0004 SET TEXT INDEX D9A : "{LEADER}, can't you play?{W1}"
										dc.w $D9A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "{LEADER}, can't you play?{W1}"
										dc.w $FFFF
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
