
; SCRIPT SECTION battles\entries\battle40\cs_beforebattle :
; Cutscene before battle 40
bbcs_40:            dc.w 4                  ; 0004 INIT TEXT CURSOR BDC : "{LEADER}, you're finally{N}here.{W1}"
										dc.w $BDC
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 36 B 22
										dc.w $36
										dc.w $B
										dc.w $22
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4E878
										dc.l word_4E878
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 F 28 1
										dc.b 7
										dc.b $F
										dc.b $28
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 10 28 1
										dc.b $1F
										dc.b $10
										dc.b $28
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 460CE
										dc.b $1C
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1C F 29 1
										dc.b $1C
										dc.b $F
										dc.b $29
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 460CE
										dc.b $80
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 10 29 1
										dc.b $80
										dc.b $10
										dc.b $29
										dc.b 1
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 4C 4E544 : Zynk is a follower
										dc.w $4C
										dc.l word_4E544         
										dc.w $15                ; 0015 SET ACTSCRIPT 1A FF 460CE
										dc.b $1A
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1A 3F 3E 3
										dc.b $1A
										dc.b $3F
										dc.b $3E
										dc.b 3
word_4E544:         dc.w $34                ; 0034 SET BLOCKS B06 B1D 2C00
										dc.w $B06
										dc.w $B1D
										dc.w $2C00
										dc.w $34                ; 0034 SET BLOCKS 2000 B1D B06
										dc.w $2000
										dc.w $B1D
										dc.w $B06
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_STOP
										dc.w $20
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w $2D                ; 002D MOVE ENTITY 0 0 1 3
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 1 3
										dc.b 7
										dc.b 0
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F 0 1 3
										dc.b $1F
										dc.b 0
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 0 1 3
										dc.b $80
										dc.b 0
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 1 3
										dc.b $1C
										dc.b $FF
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081 : "{LEADER}, you're finally{N}here.{W1}"
										dc.w $C081
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45E44
										dc.b 0
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w $2D                ; 002D MOVE ENTITY 0 0 1 1
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 1 2
										dc.b 7
										dc.b 0
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F 0 1 1
										dc.b $1F
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1C 0 1 1
										dc.b $1C
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 1
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $32                ; 0032 SET CAMERA DEST B 2
										dc.w $B
										dc.w 2
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_BATTLE_THEME_3
										dc.w $21
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Is that...?{W1}"
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081 : "Did you forget about me,{N}{LEADER} and {NAME;7}!{W1}"
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Oddler, are you Odd Eye?{N}Zalbard said...{W1}"
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081 : "Yes, I am he.{W1}"
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "You're the leader of the Devil{N}Army who attacked Bedoe...{W1}"
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081 : "Yes I am, Sir Astral.{W1}"
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "How do you know me?{W1}"
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081 : "{LEADER} told me about{N}you repeatedly.{W1}"
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "What do YOU want?{W1}"
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081 : "Don't talk to me like that.{N}I'm very sad.{W1}"
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Sad?{N}You've got to be joking!{W1}"
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 81 2
										dc.b $81
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081 : "Well, yes I am.{N}I'm really quite evil.{W1}"
										dc.w $C081
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081 : "Don't you think so, Red{N}Baron?{W1}"
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C : "Uhh...(shiver).{W1}"
										dc.w $1C
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 1
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C081 : "Anyway, I came here to{N}deliver an ultimatum.{W2}"
										dc.w $C081
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C081 : "Think long and well before{N}answering me.{W2}"
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081 : "Leave the jewel, your{N}weapons, and your items{N}here...or DIE!{W1}"
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "That means...we don't have{N}to fight him.{W1}"
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "True, but we can't take the{N}easy way out.  We mustn't{N}give him the jewel.{W1}"
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081 : "You know how strong I am.{N}I think you had better{N}accept the offer.{W1}"
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 0 : "Hmmm....{W1}"
										dc.w 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Oh, what should we do?!{W1}"
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "We have to fight!{W1}"
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081 : "Times up!  We need space{N}to battle.{W1}"
										dc.w $C081
										dc.w $18                ; 0018 FLASH ENTITY WHITE 81 1E
										dc.w $81
										dc.w $1E
										dc.w $3D                ; 003D TINT MAP
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $3E                ; 003E FLICKER ONCE
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $3D                ; 003D TINT MAP
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $3E                ; 003E FLICKER ONCE
										dc.w $15                ; 0015 SET ACTSCRIPT 82 0 45FB2
										dc.b $82
										dc.b 0
										dc.l eas_AnimSpeedx2    
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 46172
										dc.b $82
										dc.b $FF
										dc.l eas_46172          
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 10 8 1
										dc.b $82
										dc.b $10
										dc.b 8
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 1 2
										dc.b $82
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $34                ; 0034 SET BLOCKS 60F 101 1006
										dc.w $60F
										dc.w $101
										dc.w $1006
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 3F 3F 1
										dc.b $82
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 F 8 1
										dc.b $82
										dc.b $F
										dc.b 8
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 1 2
										dc.b $82
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $34                ; 0034 SET BLOCKS 60F 101 F06
										dc.w $60F
										dc.w $101
										dc.w $F06
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 3F 3F 1
										dc.b $82
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 11 9 1
										dc.b $82
										dc.b $11
										dc.b 9
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 1 2
										dc.b $82
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $34                ; 0034 SET BLOCKS 60F 101 1107
										dc.w $60F
										dc.w $101
										dc.w $1107
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 10 9 1
										dc.b $82
										dc.b $10
										dc.b 9
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 1 2
										dc.b $82
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $34                ; 0034 SET BLOCKS 60F 101 1007
										dc.w $60F
										dc.w $101
										dc.w $1007
										dc.w $2E                ; 002E HIDE ENTITY 82
										dc.w $82
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $34                ; 0034 SET BLOCKS 60F 101 F07
										dc.w $60F
										dc.w $101
										dc.w $F07
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $34                ; 0034 SET BLOCKS 60F 101 E07
										dc.w $60F
										dc.w $101
										dc.w $E07
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $34                ; 0034 SET BLOCKS 60F 101 1208
										dc.w $60F
										dc.w $101
										dc.w $1208
										dc.b $80                ; WAIT 4
										dc.b 4
										dc.w $34                ; 0034 SET BLOCKS 60F 101 1108
										dc.w $60F
										dc.w $101
										dc.w $1108
										dc.b $80                ; WAIT 4
										dc.b 4
										dc.w $34                ; 0034 SET BLOCKS 60F 101 1008
										dc.w $60F
										dc.w $101
										dc.w $1008
										dc.b $80                ; WAIT 4
										dc.b 4
										dc.w $34                ; 0034 SET BLOCKS 60F 101 F08
										dc.w $60F
										dc.w $101
										dc.w $F08
										dc.b $80                ; WAIT 4
										dc.b 4
										dc.w $34                ; 0034 SET BLOCKS 60F 101 E08
										dc.w $60F
										dc.w $101
										dc.w $E08
										dc.b $80                ; WAIT 4
										dc.b 4
										dc.w $34                ; 0034 SET BLOCKS 60F 101 D08
										dc.w $60F
										dc.w $101
										dc.w $D08
										dc.b $80                ; WAIT 4
										dc.b 4
										dc.w $34                ; 0034 SET BLOCKS 60F 101 1309
										dc.w $60F
										dc.w $101
										dc.w $1309
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $34                ; 0034 SET BLOCKS 60F 101 1209
										dc.w $60F
										dc.w $101
										dc.w $1209
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $34                ; 0034 SET BLOCKS 60F 101 1109
										dc.w $60F
										dc.w $101
										dc.w $1109
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $34                ; 0034 SET BLOCKS 60F 101 1009
										dc.w $60F
										dc.w $101
										dc.w $1009
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $34                ; 0034 SET BLOCKS 60F 101 F09
										dc.w $60F
										dc.w $101
										dc.w $F09
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $34                ; 0034 SET BLOCKS 60F 101 E09
										dc.w $60F
										dc.w $101
										dc.w $E09
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $34                ; 0034 SET BLOCKS 60F 101 D09
										dc.w $60F
										dc.w $101
										dc.w $D09
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $34                ; 0034 SET BLOCKS 60F 101 C09
										dc.w $60F
										dc.w $101
										dc.w $C09
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $34                ; 0034 SET BLOCKS 60F 101 130A
										dc.w $60F
										dc.w $101
										dc.w $130A
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $34                ; 0034 SET BLOCKS 60F 101 120A
										dc.w $60F
										dc.w $101
										dc.w $120A
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $34                ; 0034 SET BLOCKS 60F 101 110A
										dc.w $60F
										dc.w $101
										dc.w $110A
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $34                ; 0034 SET BLOCKS 60F 101 100A
										dc.w $60F
										dc.w $101
										dc.w $100A
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $34                ; 0034 SET BLOCKS 60F 101 F0A
										dc.w $60F
										dc.w $101
										dc.w $F0A
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $34                ; 0034 SET BLOCKS 60F 101 E0A
										dc.w $60F
										dc.w $101
										dc.w $E0A
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $34                ; 0034 SET BLOCKS 60F 101 D0A
										dc.w $60F
										dc.w $101
										dc.w $D0A
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $34                ; 0034 SET BLOCKS 60F 101 C0A
										dc.w $60F
										dc.w $101
										dc.w $C0A
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $34                ; 0034 SET BLOCKS 60F 101 150B
										dc.w $60F
										dc.w $101
										dc.w $150B
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w $34                ; 0034 SET BLOCKS 60F 101 130B
										dc.w $60F
										dc.w $101
										dc.w $130B
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w $34                ; 0034 SET BLOCKS 60F 101 120B
										dc.w $60F
										dc.w $101
										dc.w $120B
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w $34                ; 0034 SET BLOCKS 60F 101 110B
										dc.w $60F
										dc.w $101
										dc.w $110B
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w $34                ; 0034 SET BLOCKS 60F 101 100B
										dc.w $60F
										dc.w $101
										dc.w $100B
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w $34                ; 0034 SET BLOCKS 60F 101 F0B
										dc.w $60F
										dc.w $101
										dc.w $F0B
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w $34                ; 0034 SET BLOCKS 60F 101 E0B
										dc.w $60F
										dc.w $101
										dc.w $E0B
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w $34                ; 0034 SET BLOCKS 60F 101 D0B
										dc.w $60F
										dc.w $101
										dc.w $D0B
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w $34                ; 0034 SET BLOCKS 60F 101 C0B
										dc.w $60F
										dc.w $101
										dc.w $C0B
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w $34                ; 0034 SET BLOCKS 2C00 B1D B06
										dc.w $2C00
										dc.w $B1D
										dc.w $B06
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081 : "I'm very sorry, {LEADER},{N}but I must kill you!{W1}"
										dc.w $C081
										dc.w $32                ; 0032 SET CAMERA DEST B 1F
										dc.w $B
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "{LEADER}, are we really{N}going to fight Oddler?{W1}"
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 2 1
										dc.b $1F
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1C 0
										dc.b $1C
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "That's enough out of you!{W1}"
										dc.w $1F
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 0 1
										dc.b $1F
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "{LEADER}, let's do it!{W1}"
										dc.w $1F
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 45E44
										dc.b 7
										dc.b 0
										dc.l eas_Jump           
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4E878:         dc.w $10
										dc.w $27
										dc.w 1
										dc.b $F
										dc.b $28
										dc.b 1
										dc.b 7
										dc.l eas_Init           
										dc.b $F
										dc.b $29
										dc.b 1
										dc.b $1C
										dc.l eas_Init           
										dc.b $10
										dc.b $29
										dc.b 1
										dc.b $3E
										dc.l eas_Init           
										dc.b $10
										dc.b 4
										dc.b 3
										dc.b $A0
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $B2
										dc.l eas_Init           
										dc.w $FFFF
