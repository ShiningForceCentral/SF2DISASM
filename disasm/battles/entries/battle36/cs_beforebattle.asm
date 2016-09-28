
; SCRIPT SECTION battles\entries\battle36\cs_beforebattle :
; Cutscene before battle 36
bbcs_36:            dc.w 4                  ; 0004 SET TEXT INDEX B82 : "You're early!{N}{W2}"
										dc.w $B82
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 35 F 0
										dc.w $35
										dc.w $F
										dc.w 0
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4D964
										dc.l word_4D964
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 12 0 3
										dc.b 7
										dc.b $12
										dc.b 0
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 14 0 3
										dc.b $1F
										dc.b $14
										dc.b 0
										dc.b 3
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 4C 4D8D6
										dc.w $4C
										dc.l word_4D8D6         
										dc.w $15                ; 0015 SET ACTSCRIPT 1A FF 460CE
										dc.b $1A
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1A 3F 3E 3
										dc.b $1A
										dc.b $3F
										dc.b $3E
										dc.b 3
word_4D8D6:         dc.w 5                  ; 0005 PLAY SOUND MUSIC_BATTLE_THEME_1
										dc.w $22
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w $2D                ; 002D MOVE ENTITY 0 0 3 4
										dc.b 0
										dc.b 0
										dc.b 3
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 3 4
										dc.b 7
										dc.b 0
										dc.b 3
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F 0 3 4
										dc.b $1F
										dc.b 0
										dc.b 3
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 4
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 4
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "You're early!{N}{W2}"
										dc.w $80
										dc.w $32                ; 0032 SET CAMERA DEST A E
										dc.w $A
										dc.w $E
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "Darn you, Granseal swine!{W2}"
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "But, don't worry.  I just{N}finished my preparations.{N}Yes...everything's ready.{W2}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "It's show time!{W1}"
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 82 0 45FB2
										dc.b $82
										dc.b 0
										dc.l eas_AnimSpeedx2    
										dc.w $15                ; 0015 SET ACTSCRIPT 83 0 45FB2
										dc.b $83
										dc.b 0
										dc.l eas_AnimSpeedx2    
										dc.w $15                ; 0015 SET ACTSCRIPT 84 0 45FB2
										dc.b $84
										dc.b 0
										dc.l eas_AnimSpeedx2    
										dc.w $15                ; 0015 SET ACTSCRIPT 85 0 45FB2
										dc.b $85
										dc.b 0
										dc.l eas_AnimSpeedx2    
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $32                ; 0032 SET CAMERA DEST E 2
										dc.w $E
										dc.w 2
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Sir Astral, why is he smiling?{W1}"
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "He believes this is the place{N}where we will die....{W1}"
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "{LEADER}, be careful!{W1}"
										dc.w $1F
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4D964:         dc.w $13
										dc.w 1
										dc.w 3
										dc.b $12
										dc.b 0
										dc.b 3
										dc.b 7
										dc.l eas_Init           
										dc.b $10
										dc.b $10
										dc.b 1
										dc.b $9F
										dc.l eas_Init           
										dc.b $13
										dc.b 0
										dc.b 3
										dc.b $3E
										dc.l eas_Init           
										dc.b $C
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
										dc.w $FFFF
