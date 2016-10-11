
; SCRIPT SECTION scripting\cutscenes\cs_intro4 :
; Intro cutscene 4
IntroCutscene4:     dc.w 4                  ; 0004 INIT TEXT CURSOR 1089 : "Somebody bring a light to{N}the King's chamber!{D2}"
										dc.w $1089
										dc.w $48                ; 0048 LOAD MAP 41 7 3
										dc.w $41
										dc.w 7
										dc.w 3
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 48FAA
										dc.l word_48FAA
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $4A                ; 004A FADE IN FROM BLACK HALF
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2D                ; 002D MOVE ENTITY 81 0 3 2
										dc.b $81
										dc.b 0
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w 5                  ; 0005 PLAY SOUND SFX_INTRO_LIGHTNING
										dc.w $76
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 48FE2
										dc.l ApplyStormEffect
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 48FE2
										dc.l ApplyStormEffect
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 4                  ; 0004 INIT TEXT CURSOR 1089 : "Somebody bring a light to{N}the King's chamber!{D2}"
										dc.w $1089
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Somebody bring a light to{N}the King's chamber!{D2}"
										dc.w $81
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_DEMON_BREATH
										dc.w $75
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 48FE2
										dc.l ApplyStormEffect
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 48FE2
										dc.l ApplyStormEffect
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 81 1
										dc.b $81
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8080 : "Oh...the wind blew out{N}all the candles!{D2}"
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080 : "It's so dark.{N}I can't see a thing.{D2}"
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 48FE2
										dc.l ApplyStormEffect
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.w $41                ; 0041 FLASH SCREEN WHITE A
										dc.w $A
										dc.w $3F                ; 003F FADE MAP OUT TO WHITE
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_INTRO_LIGHTNING
										dc.w $76
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $40                ; 0040 FADE MAP IN FROM WHITE
										dc.w $3D                ; 003D TINT MAP
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.b $80                ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080 : "What was that?{D2}"
										dc.w $8080
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 461B6
										dc.b $81
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 50
										dc.b $50
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 2
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 46172
										dc.b $81
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
										dc.b 8
										dc.b 8
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.b $80                ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 1
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Sire, the Ancient Tower...{D2}"
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b $A
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080 : "What's wrong?{D2}"
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 460CE
										dc.b $81
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 45E44
										dc.b $81
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 45E44
										dc.b $81
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "It's collapsing!{N}Maybe it was struck by{N}lightning?{D2}"
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 1
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080 : "No, not lightning...{D2}"
										dc.w $8080
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.b $80                ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080 : "To my knowledge, that tower{N}is impervious to any type{N}of disaster.{D2}"
										dc.w $8080
										dc.w 5                  ; 0005 PLAY SOUND SFX_DEMON_BREATH
										dc.w $75
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 48FE2
										dc.l ApplyStormEffect
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 48FE2
										dc.l ApplyStormEffect
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82 : "Minister!{D2}"
										dc.w $82
										dc.w $23                ; 0023 SET ENTITY FACING 81 2
										dc.b $81
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.w $32                ; 0032 SET CAMERA DEST 0 5
										dc.w 0
										dc.w 5
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 3 9 3
										dc.b $82
										dc.b 3
										dc.b 9
										dc.b 3
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 82
										dc.w $82
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 82
										dc.b $82
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$28 Y=$28
										dc.b $28
										dc.b $28
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.b $80                ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 3 1
										dc.b $82
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 1
										dc.b 7
										dc.b 3
										dc.b 0
										dc.b 3
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $26                ; 0026 MAKE ENTITY NOD 82
										dc.w $82
										dc.w $26                ; 0026 MAKE ENTITY NOD 82
										dc.w $82
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 460CE
										dc.b $81
										dc.b $FF
										dc.l eas_Init           
										dc.w $32                ; 0032 SET CAMERA DEST 7 5
										dc.w 7
										dc.w 5
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 1
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "What is it?{D2}"
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82 : "The...sealed door...{N}Ancient Tower...{D2}"
										dc.w $82
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 460CE
										dc.b $80
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080 : "Go on.{D2}"
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 460CE
										dc.b $82
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 0 2
										dc.b $82
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.b 9
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82 : "It's open!{D2}"
										dc.w $82
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 46172
										dc.b $81
										dc.b $FF
										dc.l eas_46172          
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
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 1
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "That's impossible!{N}It can't be opened!{D2}"
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 2 2
										dc.b $82
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.b 9
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82 : "I'm sure it was closed{N}before the lightning, but...{D2}"
										dc.w $82
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 81 0
										dc.b $81
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Strange.{D2}"
										dc.w $81
										dc.w $26                ; 0026 MAKE ENTITY NOD 81
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Sire, I'm going to go and{N}see what happened!{D2}"
										dc.w $81
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 460CE
										dc.b $81
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 1
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "We must know the truth.{D2}"
										dc.w $81
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $26                ; 0026 MAKE ENTITY NOD 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080 : "Be careful.{D2}"
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 2 1
										dc.b $81
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Take me to the sealed door.{D2}"
										dc.w $81
										dc.w $26                ; 0026 MAKE ENTITY NOD 82
										dc.w $82
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 82
										dc.w $82
										dc.w $2D                ; 002D MOVE ENTITY 82 0 3 2
										dc.b $82
										dc.b 0
										dc.b 3
										dc.b 2
										dc.b 2
										dc.b 3
										dc.b 5
										dc.b 3
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 3
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 3
										dc.b 2
										dc.b 3
										dc.b 5
										dc.b 3
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 82
										dc.w $82
										dc.w $2E                ; 002E HIDE ENTITY 81
										dc.w $81
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $32                ; 0032 SET CAMERA DEST 7 5
										dc.w 7
										dc.w 5
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 80
										dc.w $80
										dc.w 5                  ; 0005 PLAY SOUND SFX_DEMON_BREATH
										dc.w $75
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 48FE2
										dc.l ApplyStormEffect
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 48FE2
										dc.l ApplyStormEffect
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080 : "Strange, strange indeed!{D2}"
										dc.w $8080
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 2
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080 : "Lightning at the Ancient{N}Tower.{D2}"
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
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
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080 : "Huh?{N}Did I hear something?{D2}"
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080 : "A sealed door that is open.{N}An unusual storm.{N}Everything is so strange.{D2}"
										dc.w $8080
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 461B6
										dc.b $80
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080 : "What?  I feel as if someone{N}is watching me.{N}It must be my nerves.{D2}"
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w 5                  ; 0005 PLAY SOUND SFX_INTRO_LIGHTNING
										dc.w $76
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 84 9 B 1
										dc.b $84
										dc.b 9
										dc.b $B
										dc.b 1
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 48FE2
										dc.l ApplyStormEffect
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 48FE2
										dc.l ApplyStormEffect
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 84 3F 3F 1
										dc.b $84
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080 : "I guess it was nothing.{N}I have to get a hold of{N}myself.{D2}"
										dc.w $8080
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 80
										dc.w $80
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.b $80                ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 1
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 5                  ; 0005 PLAY SOUND SFX_INTRO_LIGHTNING
										dc.w $76
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 84 9 B 1
										dc.b $84
										dc.b 9
										dc.b $B
										dc.b 1
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 48FE2
										dc.l ApplyStormEffect
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 48FE2
										dc.l ApplyStormEffect
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 84 3F 3F 1
										dc.b $84
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080 : "What was that?{N}Who's there?!{D2}"
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46172
										dc.b $80
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 1
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 5                  ; 0005 PLAY SOUND SFX_INTRO_LIGHTNING
										dc.w $76
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 84 9 B 1
										dc.b $84
										dc.b 9
										dc.b $B
										dc.b 1
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 48FE2
										dc.l ApplyStormEffect
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 48FE2
										dc.l ApplyStormEffect
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 84 3F 3F 1
										dc.b $84
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080 : "It's not my imagination!{N}Somebody's in this room!{D2}"
										dc.w $8080
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 461B6
										dc.b $80
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 50
										dc.b $50
										dc.w 5                  ; 0005 PLAY SOUND SFX_INTRO_LIGHTNING
										dc.w $76
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 84 9 B 1
										dc.b $84
										dc.b 9
										dc.b $B
										dc.b 1
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 48FE2
										dc.l ApplyStormEffect
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 48FE2
										dc.l ApplyStormEffect
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 84 3F 3F 1
										dc.b $84
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 83 9 2 3
										dc.b $83
										dc.b 9
										dc.b 2
										dc.b 3
										dc.w $32                ; 0032 SET CAMERA DEST 7 1
										dc.w 7
										dc.w 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 460CE
										dc.b $80
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080 : "Hey!{D2}"
										dc.w $8080
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46172
										dc.b $80
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080 : "Stay away from me!{D2}"
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 83 FF 46102
										dc.b $83
										dc.b $FF
										dc.l eas_Init2          
										dc.w $15                ; 0015 SET ACTSCRIPT 83 FF 46172
										dc.b $83
										dc.b $FF
										dc.l eas_46172          
										dc.w $1C                ; 001C STOP ENTITY ANIM 83
										dc.w $83
										dc.w $2D                ; 002D MOVE ENTITY 83 FF 0 1
										dc.b $83
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 83 FF 0 1
										dc.b $83
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $1B                ; 001B START ENTITY ANIM 83
										dc.w $83
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 80
										dc.w $80
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 83
										dc.w $83
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 83
										dc.w $83
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 83
										dc.w $83
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 461E4
										dc.b $80
										dc.b 0
										dc.l eas_461E4          
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080 : "Somebody...HELP!{D2}"
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 83
										dc.w $83
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 83
										dc.w $83
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 85
										dc.b $85
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$14 Y=$14
										dc.b $14
										dc.b $14
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.b $80                ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 85 C 5 3
										dc.b $85
										dc.b $C
										dc.b 5
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 85 0 3 4
										dc.b $85
										dc.b 0
										dc.b 3
										dc.b 4
										dc.w $8080
										dc.w $18                ; 0018 FLASH ENTITY WHITE 85 50
										dc.w $85
										dc.w $50
										dc.w $16                ; 0016 WAIT UNTIL IDLE ENTITY 85
										dc.w $85
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45FF0
										dc.b $80
										dc.b 0
										dc.l eas_RotateRightHighSpeed
										dc.w $18                ; 0018 FLASH ENTITY WHITE 85 28
										dc.w $85
										dc.w $28
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080 : "Aughhhh!!!{D2}"
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 85
										dc.w $85
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45FBC
										dc.b $80
										dc.b 0
										dc.l eas_RotateRight    
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $2D                ; 002D MOVE ENTITY 80 FF B 1
										dc.b $80
										dc.b $FF
										dc.b $B
										dc.b 1
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $2
										dc.w 2
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080 : "(Sigh)....{D2}"
										dc.w $8080
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 83
										dc.w $83
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 5                  ; 0005 PLAY SOUND SFX_INTRO_LIGHTNING
										dc.w $76
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 48FE2
										dc.l ApplyStormEffect
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 48FE2
										dc.l ApplyStormEffect
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 48FE2
										dc.l ApplyStormEffect
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 83
										dc.w $83
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $4B                ; 004B FADE OUT TO BLACK HALF
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
word_48FAA:         dc.w $3F
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
										dc.b $3F
										dc.b $3F
										dc.b 0
										dc.b $CE
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $9F
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $BB
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $B7
										dc.l eas_Init           
										dc.w $FFFF
