
; SCRIPT SECTION scripting\cutscenes\cs_intro2 :
; Intro cutscene 2
IntroCutscene2:     dc.w 4                  ; 0004 INIT TEXT CURSOR 106A : "Quite a storm.{D2}"
										dc.w $106A
										dc.w $48                ; 0048 LOAD MAP 41 7 2
										dc.w $41
										dc.w 7
										dc.w 2
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 48510
										dc.l word_48510
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $25                ; 0025 CLONE ENTITY 84 83
										dc.w $84
										dc.w $83
										dc.w $36                ; 0036 RELATED TO LOADING A MAP
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $46                ; 0046  7 2
										dc.w 7
										dc.w 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080 : "Quite a storm.{D2}"
										dc.w $8080
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 41 7 2
										dc.w $41
										dc.w 7
										dc.w 2
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 5                  ; 0005 PLAY SOUND SFX_DEMON_BREATH
										dc.w $75
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 48FE2
										dc.l ApplyStormEffect
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 48FE2
										dc.l ApplyStormEffect
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $23                ; 0023 SET ENTITY FACING 81 0
										dc.b $81
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Excuse me?{D2}"
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080 : "It's a stormy night.{D2}"
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 81 1
										dc.b $81
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 5                  ; 0005 PLAY SOUND SFX_DEMON_BREATH
										dc.w $75
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 48FE2
										dc.l ApplyStormEffect
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 48FE2
										dc.l ApplyStormEffect
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 81 0
										dc.b $81
										dc.b 0
										dc.w $26                ; 0026 MAKE ENTITY NOD 81
										dc.w $81
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "It's unusual for this time{N}of year.{D2}"
										dc.w $81
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82 : "Excuse me, your majesty.{D2}"
										dc.w $82
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 1 3
										dc.b $82
										dc.b $FF
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $32                ; 0032 SET CAMERA DEST 7 4
										dc.w 7
										dc.w 4
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Is it time to go to the{N}Ancient Tower?{D2}"
										dc.w $81
										dc.w $26                ; 0026 MAKE ENTITY NOD 82
										dc.w $82
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82 : "Yes, sire.{D2}"
										dc.w $82
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 1
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 2
										dc.b $B
										dc.b $A
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "It's stormy outside.{N}Be careful.{D2}"
										dc.w $81
										dc.w $26                ; 0026 MAKE ENTITY NOD 82
										dc.w $82
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 82
										dc.w $82
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 3 3
										dc.b $82
										dc.b $FF
										dc.b 3
										dc.b 3
										dc.b 2
										dc.b 5
										dc.b 5
										dc.b 3
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 82
										dc.w $82
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $32                ; 0032 SET CAMERA DEST 7 2
										dc.w 7
										dc.w 2
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080 : "Hmmm....{D2}"
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 81 1
										dc.b $81
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Excuse me, sire?{D2}"
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080 : "I have a bad feeling...{N}Oh, well.{D2}"
										dc.w $8080
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 81 2
										dc.b $81
										dc.b 2
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.b $80                ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 2 2
										dc.b $81
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.b $B
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w 5                  ; 0005 PLAY SOUND SFX_SPELL_CAST
										dc.w $4D
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Oh, a gust of wind!{D2}"
										dc.w $81
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080 : "Make sure all the doors and{N}windows are shut!{D2}"
										dc.w $8080
										dc.w 5                  ; 0005 PLAY SOUND SFX_SPELL_CAST
										dc.w $4D
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 83
										dc.w $83
										dc.w 6
										dc.w $3D                ; 003D TINT MAP
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 461B6
										dc.b $81
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 461B6
										dc.b $80
										dc.b 0
										dc.l eas_461B6          
										dc.w 5                  ; 0005 PLAY SOUND SFX_DEMON_BREATH
										dc.w $75
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 48FE2
										dc.l ApplyStormEffect
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 48FE2
										dc.l ApplyStormEffect
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 5                  ; 0005 PLAY SOUND SFX_DEMON_BREATH
										dc.w $75
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 48FE2
										dc.l ApplyStormEffect
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 48FE2
										dc.l ApplyStormEffect
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 461B6
										dc.b $81
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 461B6
										dc.b $80
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 46
										dc.b $46
										dc.w $4B                ; 004B FADE OUT TO BLACK HALF
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
word_48510:         dc.w $3F
										dc.w $3F
										dc.w 1
										dc.b $C
										dc.b 6
										dc.b 3
										dc.b $CB
										dc.l eas_Init           
										dc.b $A
										dc.b 7
										dc.b 3
										dc.b $CD
										dc.l eas_Init           
										dc.b $C
										dc.b $D
										dc.b 1
										dc.b $CE
										dc.l eas_Init           
										dc.b 9
										dc.b 6
										dc.b 2
										dc.b $BB
										dc.l eas_Init           
										dc.b $F
										dc.b 6
										dc.b 2
										dc.b $BB
										dc.l eas_Init           
										dc.w $FFFF
