
; SCRIPT SECTION maps\entries\map59\mapsetups\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map59_InitFunction:
										
										trap    #TRAP_CHECKFLAG
										dc.w $3E7
										bne.s   loc_5EB18
										lea     cs_5EB44(pc), a0
										trap    #6
										lea     cs_5EBFC(pc), a0
										trap    #6
										lea     cs_5ED06(pc), a0
										trap    #6
										lea     cs_5EDB8(pc), a0
										trap    #6
										lea     cs_5EF60(pc), a0
										trap    #6
										trap    #TRAP_SETFLAG
										dc.w $3E7               ; set after the Nazca ship shootdown scene
										move.b  #$2D,((RAM_EgressMapIdx-$1000000)).w 
										trap    #TRAP_SETFLAG
										dc.w $1B4               ; Battle 36 unlocked
										trap    #TRAP_SETFLAG
										dc.w $1B8               ; Battle 40 unlocked
										trap    #TRAP_SETFLAG
										dc.w $1BA               ; Battle 42 unlocked
										trap    #TRAP_SETFLAG
										dc.w $1BB               ; Battle 43 unlocked
										rts
loc_5EB18:
										
										trap    #TRAP_CHECKFLAG
										dc.w $1BB
										beq.s   return_5EB24
										lea     cs_5EB26(pc), a0
										trap    #6
return_5EB24:
										
										rts

	; End of function ms_map59_InitFunction

cs_5EB26:           dc.w $A                 ; 000A EXECUTE SUBROUTINE 5EB34
										dc.l sub_5EB34
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 3B0D2201
										dc.l $3B0D2201
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT

; =============== S U B R O U T I N E =======================================

sub_5EB34:
										
										lea     (FFD080_Palette1bis).l,a0
										moveq   #$1F,d7
loc_5EB3C:
										
										clr.l   (a0)+
										dbf     d7,loc_5EB3C
										rts

	; End of function sub_5EB34

cs_5EB44:           dc.w 4                  ; 0004 SET TEXT INDEX E73 : "{LEADER} is almost here{N}already?{W1}"
										dc.w $E73
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w $46                ; 0046  8 2
										dc.w 8
										dc.w 2
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 5F19E
										dc.l word_5F19E
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_WITCH
										dc.w $A
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45FA8
										dc.b $80
										dc.b 0
										dc.l eas_Transparent    
										dc.w $4A                ; 004A FADE IN FROM BLACK HALF
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "{LEADER} is almost here{N}already?{W1}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081 : "Yes, sir.  With an ancient{N}aircraft.  He'll be passing{N}over the cape soon.{W1}"
										dc.w $8081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Good.  I'll do anything to{N}get my powers back.{W1}"
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8081 : "They're stronger than we{N}thought.{W2}"
										dc.w $8081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081 : "But, I have an idea.  Please{N}let me try it.{W1}"
										dc.w $8081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Well?{W1}"
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8081 : "I think it's better for us{N}to shoot them down over the{N}"
										dc.w $8081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081 : "cape.{W1}"
										dc.w $8081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "I agree.{W1}"
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8081 : "Thank you.  Then... may I{W2}"
										dc.w $8081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081 : "borrow Odd Eye?{W1}"
										dc.w $8081
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "He's still damaged from his{N}battle against Volcanon.{W2}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Take Red Baron instead.{W1}"
										dc.w $80
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 81
										dc.w $81
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 81
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081 : "Thank you, sir.{W1}"
										dc.w $8081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "They'll be passing over the{N}cape soon.  Go!{W1}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081 : "Yes, sir!{W1}"
										dc.w $8081
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 81
										dc.w $81
										dc.w 6
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82 : "That Geshp!  He wants{N}everything.{W1}"
										dc.w $82
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 9 9 3
										dc.b $82
										dc.b 9
										dc.b 9
										dc.b 3
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 82
										dc.w $82
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 0 4
										dc.b $82
										dc.b $FF
										dc.b 0
										dc.b 4
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "You noticed that too?{W1}"
										dc.w $80
										dc.w $26                ; 0026 MAKE ENTITY NOD 82
										dc.w $82
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 82 : "Yes, King Zeon.{W2}"
										dc.w $82
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82 : "I'm afraid Geshp can't stop{N}{LEADER}'s advance.{W1}"
										dc.w $82
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "You really think so?{W1}"
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 82 : "I was just thinking of{N}{LEADER}'s hidden powers.{W2}"
										dc.w $82
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82 : "We must never underestimate{N}him.{W1}"
										dc.w $82
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Anyway, it will be a{N}fantastic show!  Ha, ha!{W1}"
										dc.w $80
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5EBFC:           dc.w $37                ; 0037 LOAD MAP AND FADE IN 35 8 E
										dc.w $35
										dc.w 8
										dc.w $E
										dc.w 4                  ; 0004 SET TEXT INDEX E8B : "Finish the preparations{N}before the Nazca Ship flies{N}over the cape!{W1}"
										dc.w $E8B
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 5F1DE
										dc.l word_5F1DE
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $1C                ; 001C STOP ENTITY ANIM 82
										dc.w $82
										dc.w $1C                ; 001C STOP ENTITY ANIM 83
										dc.w $83
										dc.w $1C                ; 001C STOP ENTITY ANIM 84
										dc.w $84
										dc.w $1C                ; 001C STOP ENTITY ANIM 85
										dc.w $85
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_BATTLE_THEME_1
										dc.w $22
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 460CE
										dc.b $82
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 86 FF 460CE
										dc.b $86
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 87 FF 460CE
										dc.b $87
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 88 FF 460CE
										dc.b $88
										dc.b $FF
										dc.l eas_Init           
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 82
										dc.b $82
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$4 Y=$4
										dc.b 4
										dc.b 4
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 86
										dc.b $86
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$4 Y=$4
										dc.b 4
										dc.b 4
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 87
										dc.b $87
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$4 Y=$4
										dc.b 4
										dc.b 4
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 88
										dc.b $88
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$4 Y=$4
										dc.b 4
										dc.b 4
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 82 0 0 3
										dc.b $82
										dc.b 0
										dc.b 0
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 86 0 0 3
										dc.b $86
										dc.b 0
										dc.b 0
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 87 0 0 3
										dc.b $87
										dc.b 0
										dc.b 0
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 88 0 0 3
										dc.b $88
										dc.b 0
										dc.b 0
										dc.b 3
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Finish the preparations{N}before the Nazca Ship flies{N}over the cape!{W1}"
										dc.w $80
										dc.w $32                ; 0032 SET CAMERA DEST A E
										dc.w $A
										dc.w $E
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 F 10 3
										dc.b $81
										dc.b $F
										dc.b $10
										dc.b 3
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 81
										dc.w $81
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081 : "How are the Prism Flowers?{W1}"
										dc.w $8081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "They're ready!{W1}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081 : "Excellent!{W1}"
										dc.w $8081
										dc.w $26                ; 0026 MAKE ENTITY NOD 81
										dc.w $81
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 81
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 0 2
										dc.b $81
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 81 0
										dc.b $81
										dc.b 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8081 : "Now, c'mon Granseal losers!{W2}"
										dc.w $8081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081 : "The Prism Flowers are waiting{N}for you!  Hee, heee!{W1}"
										dc.w $8081
										dc.w $26                ; 0026 MAKE ENTITY NOD 81
										dc.w $81
										dc.w $26                ; 0026 MAKE ENTITY NOD 81
										dc.w $81
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5ED06:           dc.w 4                  ; 0004 SET TEXT INDEX E91 : "There's Grans Island!{W1}"
										dc.w $E91
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 49 0 0
										dc.w $49
										dc.w 0
										dc.w 0
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 5F1BE
										dc.l word_5F1BE
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5F31E
										dc.l sub_5F31E
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_MITULA_SHRINE
										dc.w $28
										dc.w $34                ; 0034 SET BLOCKS A 160A 2A0A
										dc.w $A
										dc.w $160A
										dc.w $2A0A
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5FD92
										dc.l sub_5FD92
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801A : "There's Grans Island!{W1}"
										dc.w $801A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "Alright!{W1}"
										dc.w $8007
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "We've finally come home.{W1}"
										dc.w $1F
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 35 A D
										dc.w $35
										dc.w $A
										dc.w $D
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 5F23E
										dc.l word_5F23E
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_BATTLE_THEME_1
										dc.w $22
										dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.w $1C                ; 001C STOP ENTITY ANIM 82
										dc.w $82
										dc.w $1C                ; 001C STOP ENTITY ANIM 83
										dc.w $83
										dc.w $1C                ; 001C STOP ENTITY ANIM 84
										dc.w $84
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081 : "I see the Nazca Ship!{N}Everybody, get ready!{W1}"
										dc.w $8081
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 49 0 0
										dc.w $49
										dc.w 0
										dc.w 0
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 5F1BE
										dc.l word_5F1BE
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5F31E
										dc.l sub_5F31E
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_MITULA_SHRINE
										dc.w $28
										dc.w $34                ; 0034 SET BLOCKS A 160A 2A0A
										dc.w $A
										dc.w $160A
										dc.w $2A0A
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5FD92
										dc.l sub_5FD92
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "What's that?  I saw a flash{N}of light over there.{W1}"
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "I didn't see it.  You must be{N}seeing things because you're{N}so old!  Ha, ha!{W1}"
										dc.w $8007
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F : "(Grumble)....{W2}"
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "Someday, {NAME;7}....{W1}"
										dc.w $1F
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5EDB8:           dc.w 4                  ; 0004 SET TEXT INDEX E99 : "NOW!{W1}"
										dc.w $E99
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 35 A D
										dc.w $35
										dc.w $A
										dc.w $D
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 5F28E
										dc.l word_5F28E
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_ENEMY_ATTACK
										dc.w 5
										dc.w $15                ; 0015 SET ACTSCRIPT 85 0 5EF46
										dc.b $85
										dc.b 0
										dc.l eas_5EF46          
										dc.w $15                ; 0015 SET ACTSCRIPT 86 0 5EF46
										dc.b $86
										dc.b 0
										dc.l eas_5EF46          
										dc.w $15                ; 0015 SET ACTSCRIPT 87 0 5EF46
										dc.b $87
										dc.b 0
										dc.l eas_5EF46          
										dc.w $15                ; 0015 SET ACTSCRIPT 88 0 5EF46
										dc.b $88
										dc.b 0
										dc.l eas_5EF46          
										dc.w $15                ; 0015 SET ACTSCRIPT 89 0 5EF46
										dc.b $89
										dc.b 0
										dc.l eas_5EF46          
										dc.w $15                ; 0015 SET ACTSCRIPT 8A 0 5EF46
										dc.b $8A
										dc.b 0
										dc.l eas_5EF46          
										dc.w $15                ; 0015 SET ACTSCRIPT 8B 0 5EF46
										dc.b $8B
										dc.b 0
										dc.l eas_5EF46          
										dc.w $15                ; 0015 SET ACTSCRIPT 8C 0 5EF46
										dc.b $8C
										dc.b 0
										dc.l eas_5EF46          
										dc.w $1C                ; 001C STOP ENTITY ANIM 8D
										dc.w $8D
										dc.w $1C                ; 001C STOP ENTITY ANIM 8E
										dc.w $8E
										dc.w $1C                ; 001C STOP ENTITY ANIM 8F
										dc.w $8F
										dc.w $1C                ; 001C STOP ENTITY ANIM 90
										dc.w $90
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $23                ; 0023 SET ENTITY FACING 81 2
										dc.b $81
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081 : "NOW!{W1}"
										dc.w $8081
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 0 1
										dc.b $81
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081 : "Shoot them!  Shoot them!{W1}"
										dc.w $8081
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 85 C 10 2
										dc.b $85
										dc.b $C
										dc.b $10
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 85 1
										dc.b $85
										dc.b 1
										dc.w 5                  ; 0005 PLAY SOUND SFX_PRISM_LASER_CUTSCENE_FIRING
										dc.w $6F
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 85 D F 1
										dc.b $85
										dc.b $D
										dc.b $F
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 85 0 4 A
										dc.b $85
										dc.b 0
										dc.b 4
										dc.b $A
										dc.w $8080
										dc.w $41                ; 0041 FLASH SCREEN WHITE 2
										dc.w 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 86 D F 1
										dc.b $86
										dc.b $D
										dc.b $F
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 86 0 4 A
										dc.b $86
										dc.b 0
										dc.b 4
										dc.b $A
										dc.w $8080
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 87 D 11 2
										dc.b $87
										dc.b $D
										dc.b $11
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 87 1
										dc.b $87
										dc.b 1
										dc.w 5                  ; 0005 PLAY SOUND SFX_PRISM_LASER_CUTSCENE_FIRING
										dc.w $6F
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 87 E 10 1
										dc.b $87
										dc.b $E
										dc.b $10
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 87 0 4 A
										dc.b $87
										dc.b 0
										dc.b 4
										dc.b $A
										dc.w $8080
										dc.w $41                ; 0041 FLASH SCREEN WHITE 2
										dc.w 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 88 E 10 1
										dc.b $88
										dc.b $E
										dc.b $10
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 88 0 4 A
										dc.b $88
										dc.b 0
										dc.b 4
										dc.b $A
										dc.w $8080
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 89 E 13 2
										dc.b $89
										dc.b $E
										dc.b $13
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 89 1
										dc.b $89
										dc.b 1
										dc.w 5                  ; 0005 PLAY SOUND SFX_PRISM_LASER_CUTSCENE_FIRING
										dc.w $6F
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 89 F 12 1
										dc.b $89
										dc.b $F
										dc.b $12
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 89 0 4 A
										dc.b $89
										dc.b 0
										dc.b 4
										dc.b $A
										dc.w $8080
										dc.w $41                ; 0041 FLASH SCREEN WHITE 2
										dc.w 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8A F 12 1
										dc.b $8A
										dc.b $F
										dc.b $12
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 8A 0 4 A
										dc.b $8A
										dc.b 0
										dc.b 4
										dc.b $A
										dc.w $8080
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8B F 14 2
										dc.b $8B
										dc.b $F
										dc.b $14
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 8B 1
										dc.b $8B
										dc.b 1
										dc.w 5                  ; 0005 PLAY SOUND SFX_PRISM_LASER_CUTSCENE_FIRING
										dc.w $6F
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8B 10 13 1
										dc.b $8B
										dc.b $10
										dc.b $13
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 8B 0 4 A
										dc.b $8B
										dc.b 0
										dc.b 4
										dc.b $A
										dc.w $8080
										dc.w $41                ; 0041 FLASH SCREEN WHITE 2
										dc.w 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8C 10 13 1
										dc.b $8C
										dc.b $10
										dc.b $13
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 8C 0 4 A
										dc.b $8C
										dc.b 0
										dc.b 4
										dc.b $A
										dc.w $8080
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8B C 10 2
										dc.b $8B
										dc.b $C
										dc.b $10
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 8B 1
										dc.b $8B
										dc.b 1
										dc.w 5                  ; 0005 PLAY SOUND SFX_PRISM_LASER_CUTSCENE_FIRING
										dc.w $6F
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8B D F 1
										dc.b $8B
										dc.b $D
										dc.b $F
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 8B 0 4 A
										dc.b $8B
										dc.b 0
										dc.b 4
										dc.b $A
										dc.w $8080
										dc.w $41                ; 0041 FLASH SCREEN WHITE 2
										dc.w 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8C D F 1
										dc.b $8C
										dc.b $D
										dc.b $F
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 8C FF 4 A
										dc.b $8C
										dc.b $FF
										dc.b 4
										dc.b $A
										dc.w $8080
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
eas_5EF46:          dc.w $1E                ; 001E SET ANIM SPEED X2 $FFFF
										dc.w $FFFF
										dc.w $1C                ; 001C SET TRANSPARENCY $FFFF
										dc.w $FFFF
										dc.w $1A                ; 001A SET 1C BIT 5 $0
										dc.w 0
										dc.w $15                ; 0015 SET ABILITY TO CHANGE FACING $0
										dc.w 0
										dc.w $10                ; 0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ; 0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
cs_5EF60:           dc.w 4                  ; 0004 SET TEXT INDEX E9B : "I did see something!{W1}"
										dc.w $E9B
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 25 4 6
										dc.w $25
										dc.w 4
										dc.w 6
										dc.w $49                ; 0049  9 B 3
										dc.w 9
										dc.w $B
										dc.w 3
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 47948
										dc.l sub_47948
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1A 8 A 0
										dc.b $1A
										dc.b 8
										dc.b $A
										dc.b 0
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5F32E
										dc.l sub_5F32E
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1A FF 460CE
										dc.b $1A
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 9 C 1
										dc.b $80
										dc.b 9
										dc.b $C
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 A C 1
										dc.b 7
										dc.b $A
										dc.b $C
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1A A B 2
										dc.b $1A
										dc.b $A
										dc.b $B
										dc.b 2
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "I did see something!{W1}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "Well, I didn't.{W1}"
										dc.w $8007
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "This could be bad.{W1}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801A : "Sir Astral!  {LEADER}!{N}Something is coming straight{N}towards us!{W1}"
										dc.w $801A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "What is it?{W1}"
										dc.w $80
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w $33                ; 0033 SET QUAKE AMOUNT 1
										dc.w 1
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 1
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b $E
										dc.b 1
										dc.b $F
										dc.b 1
										dc.b $E
										dc.b 1
										dc.b $F
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "Oooouu!!  What was that?!{N}Lightning?{W1}"
										dc.w $8007
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 1A 3
										dc.b $1A
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 801A : "An attack from the ground.{W2}"
										dc.w $801A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801A : "I can't control the ship!{W1}"
										dc.w $801A
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w $33                ; 0033 SET QUAKE AMOUNT 1
										dc.w 1
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w $33                ; 0033 SET QUAKE AMOUNT 1
										dc.w 1
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 801A : "We've sustained damage to{N}the engine!{W2}"
										dc.w $801A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801A : "We might crash!{W1}"
										dc.w $801A
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 0 1
										dc.b $80
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "Crash?!{W2}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801A : "Geshp's trap!  Darn!{W1}"
										dc.w $801A
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w $33                ; 0033 SET QUAKE AMOUNT 1
										dc.w 1
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w $33                ; 0033 SET QUAKE AMOUNT 1
										dc.w 1
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8007 : "I don't want to crash!{W2}"
										dc.w $8007
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "Sir Astral, please help us!{W1}"
										dc.w $8007
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "{NAME;26}, can you land on{N}that cape before the ship{N}crashes?{W1}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801A : "I'm not sure,{W2}"
										dc.w $801A
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w $33                ; 0033 SET QUAKE AMOUNT 1
										dc.w 1
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801A : "but I'll try.{W1}"
										dc.w $801A
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w $33                ; 0033 SET QUAKE AMOUNT 1
										dc.w 1
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5F338
										dc.l sub_5F338
										dc.w $3A                ; 003A FADE OUT TO BLACK
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $48                ; 0048 LOAD MAP 4B 14 E
										dc.w $4B
										dc.w $14
										dc.w $E
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 5F1CE
										dc.l word_5F1CE
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 80
										dc.w $80
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
										dc.b $10
										dc.b $10
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 10
										dc.w $10
										dc.w $2D                ; 002D MOVE ENTITY 80 0 2 C
										dc.b $80
										dc.b 0
										dc.b 2
										dc.b $C
										dc.w $8080
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5F326
										dc.l loc_5F326
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5FD92
										dc.l sub_5FD92
										dc.b $80                ; WAIT 96
										dc.b $96
										dc.w 5                  ; 0005 PLAY SOUND 
										dc.w $FD
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5F16C
										dc.l sub_5F16C
										dc.w $33                ; 0033 SET QUAKE AMOUNT 1
										dc.w 1
										dc.w 5                  ; 0005 PLAY SOUND SFX_INTRO_LIGHTNING
										dc.w $76
										dc.w $41                ; 0041 FLASH SCREEN WHITE 3C
										dc.w $3C
										dc.w $16                ; 0016 WAIT UNTIL IDLE ENTITY 80
										dc.w $80
										dc.w $34                ; 0034 SET BLOCKS 383B 405 C11
										dc.w $383B
										dc.w $405
										dc.w $C11
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5F14C
										dc.l sub_5F14C
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 25080C03
										dc.l $25080C03
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT

; =============== S U B R O U T I N E =======================================

sub_5F14C:
										
										lea     plt_5F17E(pc), a0
										lea     (PALETTE_4).l,a1
										moveq   #$20,d7 
										jsr     (CopyBytes).w   
										lea     (FFD080_Palette1bis).l,a0
										clr.b   ((byte_FFDFAB-$1000000)).w
										jsr     (sub_19C8).w    
										rts

	; End of function sub_5F14C


; =============== S U B R O U T I N E =======================================

sub_5F16C:
										
										moveq   #$17,d7
loc_5F16E:
										
										subq.b  #1,((byte_FFAEEE+5-$1000000)).w
										moveq   #2,d0
										jsr     (Sleep).w       
										dbf     d7,loc_5F16E
										rts

	; End of function sub_5F16C

plt_5F17E:          dc.w 0
										dc.w $C40
										dc.w $E84
										dc.w $26
										dc.w $6A
										dc.w $2AE
										dc.w $42
										dc.w $C4
										dc.w 0
										dc.w $222
										dc.w $666
										dc.w $AAA
										dc.w $20E
										dc.w $6CE
										dc.w $4E8
										dc.w $EEE
word_5F19E:         dc.w 0
										dc.w 0
										dc.w 1
										dc.b $D
										dc.b 4
										dc.b 1
										dc.b $FB
										dc.l eas_Init           
										dc.b $D
										dc.b 8
										dc.b 1
										dc.b $9F
										dc.l eas_Init           
										dc.b $D
										dc.b $19
										dc.b 1
										dc.b $A0
										dc.l eas_Init           
										dc.w $FFFF
word_5F1BE:         dc.w $3F
										dc.w $3F
										dc.w 1
										dc.b 5
										dc.b 5
										dc.b 1
										dc.b $FD
										dc.l eas_Init           
										dc.w $FFFF
word_5F1CE:         dc.w $3F
										dc.w $3F
										dc.w 1
										dc.b $19
										dc.b $13
										dc.b 1
										dc.b $FD
										dc.l eas_Init           
										dc.w $FFFF
word_5F1DE:         dc.w 0
										dc.w 0
										dc.w 1
										dc.b $B
										dc.b $13
										dc.b 1
										dc.b $5C
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 0
										dc.b $9F
										dc.l eas_Init           
										dc.b 9
										dc.b $10
										dc.b 0
										dc.b $9D
										dc.l eas_Init           
										dc.b $D
										dc.b $11
										dc.b 1
										dc.b $9D
										dc.l eas_Init           
										dc.b $E
										dc.b $13
										dc.b 2
										dc.b $9D
										dc.l eas_Init           
										dc.b $F
										dc.b $14
										dc.b 1
										dc.b $9D
										dc.l eas_Init           
										dc.b 8
										dc.b $10
										dc.b 0
										dc.b $5A
										dc.l eas_Init           
										dc.b $A
										dc.b $10
										dc.b 2
										dc.b $5A
										dc.l eas_Init           
										dc.b $B
										dc.b $10
										dc.b 2
										dc.b $5A
										dc.l eas_Init           
										dc.b $F
										dc.b $13
										dc.b 3
										dc.b $8A
										dc.l eas_Init           
										dc.b $D
										dc.b $13
										dc.b 0
										dc.b $8A
										dc.l eas_Init           
										dc.w $FFFF
word_5F23E:         dc.w 0
										dc.w 0
										dc.w 1
										dc.b $C
										dc.b $10
										dc.b 0
										dc.b $9D
										dc.l eas_Init           
										dc.b $10
										dc.b $12
										dc.b 0
										dc.b $9F
										dc.l eas_Init           
										dc.b $D
										dc.b $11
										dc.b 0
										dc.b $9D
										dc.l eas_Init           
										dc.b $E
										dc.b $13
										dc.b 0
										dc.b $9D
										dc.l eas_Init           
										dc.b $F
										dc.b $14
										dc.b 0
										dc.b $9D
										dc.l eas_Init           
										dc.b $B
										dc.b $10
										dc.b 0
										dc.b $5A
										dc.l eas_Init           
										dc.b $C
										dc.b $11
										dc.b 0
										dc.b $8A
										dc.l eas_Init           
										dc.b $D
										dc.b $13
										dc.b 0
										dc.b $5A
										dc.l eas_Init           
										dc.b $E
										dc.b $14
										dc.b 0
										dc.b $8A
										dc.l eas_Init           
										dc.w $FFFF
word_5F28E:         dc.w 0
										dc.w 0
										dc.w 1
										dc.b $B
										dc.b $10
										dc.b 0
										dc.b $5A
										dc.l eas_Init           
										dc.b $10
										dc.b $12
										dc.b 0
										dc.b $9F
										dc.l eas_Init           
										dc.b $C
										dc.b $11
										dc.b 0
										dc.b $8A
										dc.l eas_Init           
										dc.b $D
										dc.b $13
										dc.b 0
										dc.b $5A
										dc.l eas_Init           
										dc.b $E
										dc.b $14
										dc.b 0
										dc.b $8A
										dc.l eas_Init           
										dc.b 0
										dc.b 0
										dc.b 2
										dc.b $BA
										dc.l eas_Init           
										dc.b 0
										dc.b 0
										dc.b 2
										dc.b $BA
										dc.l eas_Init           
										dc.b 0
										dc.b 0
										dc.b 2
										dc.b $BA
										dc.l eas_Init           
										dc.b 0
										dc.b 0
										dc.b 2
										dc.b $BA
										dc.l eas_Init           
										dc.b 0
										dc.b 0
										dc.b 2
										dc.b $BA
										dc.l eas_Init           
										dc.b 0
										dc.b 0
										dc.b 2
										dc.b $BA
										dc.l eas_Init           
										dc.b 0
										dc.b 0
										dc.b 2
										dc.b $BA
										dc.l eas_Init           
										dc.b 0
										dc.b 0
										dc.b 2
										dc.b $BA
										dc.l eas_Init           
										dc.b $C
										dc.b $10
										dc.b 0
										dc.b $9D
										dc.l eas_Init           
										dc.b $D
										dc.b $11
										dc.b 0
										dc.b $9D
										dc.l eas_Init           
										dc.b $E
										dc.b $13
										dc.b 0
										dc.b $9D
										dc.l eas_Init           
										dc.b $F
										dc.b $14
										dc.b 0
										dc.b $9D
										dc.l eas_Init           
										dc.w $FFFF

; =============== S U B R O U T I N E =======================================

sub_5F31E:
										
										move.b  #$F0,((RAM_Map_AreaLayer2AutoscrollX-$1000000)).w
										nop
loc_5F326:
										
										move.b  #$18,((byte_FFAEEE+5-$1000000)).w
										rts

	; End of function sub_5F31E


; =============== S U B R O U T I N E =======================================

sub_5F32E:
										
										move.b  #$F8,((RAM_Map_AreaLayer2AutoscrollX-$1000000)).w
										nop
										rts

	; End of function sub_5F32E


; =============== S U B R O U T I N E =======================================

sub_5F338:
										
										moveq   #$F,d7
loc_5F33A:
										
										subq.b  #1,((RAM_Map_AreaLayer2AutoscrollX-$1000000)).w
										nop
										moveq   #4,d0
										jsr     (Sleep).w       
										dbf     d7,loc_5F33A
										rts

	; End of function sub_5F338

