
; SCRIPT SECTION battles\entries\battle38\cs_beforebattle :
; Cutscene before battle 38
bbcs_38:            dc.w 4                  ; 0004 SET TEXT INDEX BBB : "Stop!{W1}"
										dc.w $BBB
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 42 9 6
										dc.w $42
										dc.w 9
										dc.w 6
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4DE74
										dc.l word_4DE74
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 D 8 3
										dc.b 7
										dc.b $D
										dc.b 8
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F F 8 3
										dc.b $1F
										dc.b $F
										dc.b 8
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 1E FF 460CE
										dc.b $1E
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1E E 8 3
										dc.b $1E
										dc.b $E
										dc.b 8
										dc.b 3
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 4C 4DDFE : Zynk is a follower
										dc.w $4C
										dc.l word_4DDFE         
										dc.w $15                ; 0015 SET ACTSCRIPT 1A FF 460CE
										dc.b $1A
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1A 3F 3F 3
										dc.b $1A
										dc.b $3F
										dc.b $3F
										dc.b 3
word_4DDFE:         dc.w 5                  ; 0005 PLAY SOUND MUSIC_BATTLE_THEME_1
										dc.w $22
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w $2D                ; 002D MOVE ENTITY 0 0 3 2
										dc.b 0
										dc.b 0
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 3 2
										dc.b 7
										dc.b 0
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1E 0 3 2
										dc.b $1E
										dc.b 0
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 3 2
										dc.b $1F
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Stop!{W1}"
										dc.w $80
										dc.w $32                ; 0032 SET CAMERA DEST 9 13
										dc.w 9
										dc.w $13
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "Finally, you've arrived.{W2}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "It was a mistake to{N}underestimate you.{W2}"
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 2
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "But, the game is not over.{N}At the risk of my life,{N}you'll proceed no further!{W1}"
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C01F : "Geshp is serious.{N}He finally considers us{N}worthy opponents.{W2}"
										dc.w $C01F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01F : "{LEADER}, be careful.{N}We mustn't underrate his{N}power.{W1}"
										dc.w $C01F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "You're right, Astral!{W2}"
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "Zeon doesn't trust me,{N}thanks to you!{W2}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "This is my last chance.{N}I can't see him again 'til I{N}bring him your head.{W1}"
										dc.w $80
										dc.w $33                ; 0033 SET QUAKE AMOUNT 4
										dc.w 4
										dc.w 5                  ; 0005 PLAY SOUND SFX_BOLT_SPELL
										dc.w $77
										dc.w $41                ; 0041 FLASH SCREEN WHITE 1E
										dc.w $1E
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.w $41                ; 0041 FLASH SCREEN WHITE 32
										dc.w $32
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4DE74:         dc.w $E
										dc.w 9
										dc.w 3
										dc.b $D
										dc.b 8
										dc.b 3
										dc.b 7
										dc.l eas_Init           
										dc.b $D
										dc.b $17
										dc.b 1
										dc.b $9F
										dc.l eas_Init           
										dc.w $FFFF
