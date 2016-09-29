
; SCRIPT SECTION maps\entries\map16\mapsetups\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map16_InitFunction:
										
										trap    #TRAP_CHECKFLAG
										dc.w $298               ; set after the Galam guards catch you sneaking around, but before battle
										beq.s   return_51F86
										move.w  #$91,d0 
										jsr     MoveEntityOutOfMap
return_51F86:
										
										rts

	; End of function ms_map16_InitFunction

cs_51F88:           dc.w 4                  ; 0004 SET TEXT INDEX 3C2 : "Listen, everybody!{N}We're going to Granseal!{W1}"
										dc.w $3C2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "Listen, everybody!{N}We're going to Granseal!{W1}"
										dc.w $C080
										dc.w $23                ; 0023 SET ENTITY FACING 5 3
										dc.b 5
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $32                ; 0032 SET CAMERA DEST C B
										dc.w $C
										dc.w $B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C005 : "We're too late!{W1}"
										dc.w $C005
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080 : "As you may know, my{N}messenger was killed!{W2}"
										dc.w $C080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080 : "Granseal must have done{N}this.{W2}"
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "So we're invading them to{N}retaliate!{W1}"
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "Murmur...murmur....{W1}"
										dc.w $FFFF
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 1C 0
										dc.b $1C
										dc.b 0
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 1C 2
										dc.b $1C
										dc.b 2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $29                ; 0029 SET ENTITY DEST 1C 10 11
										dc.w $1C
										dc.w $10
										dc.w $11
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1C : "Quiet!  Everybody listen{N}to me!{W1}"
										dc.w $1C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1C : "I also don't understand{N}this march!{W2}"
										dc.w $1C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1C : "But, King Galam must{N}have a good reason!{W2}"
										dc.w $1C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1C : "I believe the King!{N}How about you?{N}Anyone disagree?{W1}"
										dc.w $1C
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 1C 0 461B6
										dc.b $1C
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C : "No?  Good!{W1}"
										dc.w $1C
										dc.w $23                ; 0023 SET ENTITY FACING 1C 3
										dc.b $1C
										dc.b 3
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 1C 1
										dc.b $1C
										dc.b 1
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $29                ; 0029 SET ENTITY DEST 1C 10 10
										dc.w $1C
										dc.w $10
										dc.w $10
										dc.w $23                ; 0023 SET ENTITY FACING 1C 0
										dc.b $1C
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 1C 3
										dc.b $1C
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "Well done, {NAME;28}.{W1}"
										dc.w $C080
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C : "King Galam, victory is{N}ours!{W1}"
										dc.w $1C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "Guards!{N}Open the gate!{N}Lower the bridge!{W1}"
										dc.w $C080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.b $80                ; WAIT 96
										dc.b $96
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "{NAME;28}, prove your{N}allegiance.{W1}"
										dc.w $C080
										dc.w $23                ; 0023 SET ENTITY FACING 1C 0
										dc.b $1C
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C : "What do you mean?{W1}"
										dc.w $1C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "Show no mercy!{W1}"
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C : "My Lord...{W1}"
										dc.w $1C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "Now, go!{W1}"
										dc.w $C080
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 1C 3
										dc.b $1C
										dc.b 3
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $32                ; 0032 SET CAMERA DEST C 12
										dc.w $C
										dc.w $12
										dc.w $29                ; 0029 SET ENTITY DEST 80 11 17
										dc.w $80
										dc.w $11
										dc.w $17
										dc.w $29                ; 0029 SET ENTITY DEST 1C 11 11
										dc.w $1C
										dc.w $11
										dc.w $11
										dc.w $29                ; 0029 SET ENTITY DEST 1C 11 16
										dc.w $1C
										dc.w $11
										dc.w $16
										dc.w $29                ; 0029 SET ENTITY DEST 1C 12 18
										dc.w $1C
										dc.w $12
										dc.w $18
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1C 1
										dc.b $1C
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 82 3
										dc.b $82
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 83 3
										dc.b $83
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 84 3
										dc.b $84
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 85 3
										dc.b $85
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 86 3
										dc.b $86
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 87 3
										dc.b $87
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 88 3
										dc.b $88
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 89 3
										dc.b $89
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 8A 3
										dc.b $8A
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 8B 3
										dc.b $8B
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 8C 3
										dc.b $8C
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 8D 3
										dc.b $8D
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 8E 3
										dc.b $8E
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 8F 3
										dc.b $8F
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 90 3
										dc.b $90
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Crush Granseal!{W1}"
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 1C 0 3 7
										dc.b $1C
										dc.b 0
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 0 3 7
										dc.b $80
										dc.b 0
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 0 3 7
										dc.b $81
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
										dc.w $2D                ; 002D MOVE ENTITY 84 0 3 7
										dc.b $84
										dc.b 0
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 85 0 3 7
										dc.b $85
										dc.b 0
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 86 0 3 7
										dc.b $86
										dc.b 0
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 87 0 3 7
										dc.b $87
										dc.b 0
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 88 0 3 7
										dc.b $88
										dc.b 0
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 89 0 3 7
										dc.b $89
										dc.b 0
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8A 0 3 7
										dc.b $8A
										dc.b 0
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8B 0 3 7
										dc.b $8B
										dc.b 0
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8C 0 3 7
										dc.b $8C
										dc.b 0
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8D 0 3 7
										dc.b $8D
										dc.b 0
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8E 0 3 7
										dc.b $8E
										dc.b 0
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8F 0 3 7
										dc.b $8F
										dc.b 0
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 90 0 3 7
										dc.b $90
										dc.b 0
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 5 3
										dc.b 5
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $32                ; 0032 SET CAMERA DEST C 5
										dc.w $C
										dc.w 5
										dc.w $2E                ; 002E HIDE ENTITY 1C
										dc.w $1C
										dc.w $2E                ; 002E HIDE ENTITY 80
										dc.w $80
										dc.w $2E                ; 002E HIDE ENTITY 81
										dc.w $81
										dc.w $2E                ; 002E HIDE ENTITY 82
										dc.w $82
										dc.w $2E                ; 002E HIDE ENTITY 83
										dc.w $83
										dc.w $2E                ; 002E HIDE ENTITY 84
										dc.w $84
										dc.w $2E                ; 002E HIDE ENTITY 85
										dc.w $85
										dc.w $2E                ; 002E HIDE ENTITY 86
										dc.w $86
										dc.w $2E                ; 002E HIDE ENTITY 87
										dc.w $87
										dc.w $2E                ; 002E HIDE ENTITY 88
										dc.w $88
										dc.w $2E                ; 002E HIDE ENTITY 89
										dc.w $89
										dc.w $2E                ; 002E HIDE ENTITY 8A
										dc.w $8A
										dc.w $2E                ; 002E HIDE ENTITY 8B
										dc.w $8B
										dc.w $2E                ; 002E HIDE ENTITY 8C
										dc.w $8C
										dc.w $2E                ; 002E HIDE ENTITY 8D
										dc.w $8D
										dc.w $2E                ; 002E HIDE ENTITY 8E
										dc.w $8E
										dc.w $2E                ; 002E HIDE ENTITY 8F
										dc.w $8F
										dc.w $2E                ; 002E HIDE ENTITY 90
										dc.w $90
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C005 : "They've gone.{N}The war begins.{W1}"
										dc.w $C005
										dc.w $23                ; 0023 SET ENTITY FACING 5 2
										dc.b 5
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C005 : "So, what should we do?{N}Are you still going to{N}Granseal?{W1}"
										dc.w $C005
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C005 : "You're serious?{N}Do you think you can stop{N}the war?{W2}"
										dc.w $C005
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5 : "I will leave you once I'm{N}outside the gate!{W1}"
										dc.w 5
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_521BA:           dc.w 4                  ; 0004 SET TEXT INDEX 3DA : "You!{W1}"
										dc.w $3DA
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 92 11 10 1
										dc.b $92
										dc.b $11
										dc.b $10
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 93 11 F 3
										dc.b $93
										dc.b $11
										dc.b $F
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 91 : "You!{W1}"
										dc.w $91
										dc.w $32                ; 0032 SET CAMERA DEST 0 11
										dc.w 0
										dc.w $11
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 91 : "How did you get out?{W1}"
										dc.w $91
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 460CE
										dc.b 5
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $29                ; 0029 SET ENTITY DEST 0 3 13
										dc.w 0
										dc.w 3
										dc.w $13
										dc.w $29                ; 0029 SET ENTITY DEST 5 4 13
										dc.w 5
										dc.w 4
										dc.w $13
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5 : "I...{W1}"
										dc.w 5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 92 : "Wow, great jewel!{W1}"
										dc.w $92
										dc.w $32                ; 0032 SET CAMERA DEST C A
										dc.w $C
										dc.w $A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 93 : "Oh, this?{N}The King gave it to me!{W1}"
										dc.w $93
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 92 : "Because you captured that{N}rat?{W1}"
										dc.w $92
										dc.w $32                ; 0032 SET CAMERA DEST 0 D
										dc.w 0
										dc.w $D
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 5 2
										dc.b 5
										dc.b 2
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 93 : "Yes.  I presented them to{N}King Galam.{W2}"
										dc.w $93
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 93 : "He was so kind to give me{N}one of the pair, the Jewel{N}of Light!{W1}"
										dc.w $93
										dc.w $2D                ; 002D MOVE ENTITY 0 0 0 1
										dc.b 0
										dc.b 0
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 5 FF 0 1
										dc.b 5
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 91 : "Wait!{W1}"
										dc.w $91
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 5 3
										dc.b 5
										dc.b 3
										dc.w $32                ; 0032 SET CAMERA DEST 0 12
										dc.w 0
										dc.w $12
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 91 : "How did you escape?{W1}"
										dc.w $91
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 5 2
										dc.b 5
										dc.b 2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 5 3
										dc.b 5
										dc.b 3
										dc.w $29                ; 0029 SET ENTITY DEST 91 9 17
										dc.w $91
										dc.w 9
										dc.w $17
										dc.w $15                ; 0015 SET ACTSCRIPT 91 FF 45E44
										dc.b $91
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 91 FF 45E44
										dc.b $91
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 91 : "Intruders!  Intruders!{N}Arrest them!{W1}"
										dc.w $91
										dc.w $13                ; 0013 SET STORY FLAG 5 : Battle 5 unlocked
										dc.w 5
cs_5227C:           dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 10000000
										dc.l $10000000
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
