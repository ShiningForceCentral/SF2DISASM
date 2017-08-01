
; ASM FILE data\maps\entries\map16\mapsetups\s6.asm :
; 0x51F76..0x52284 : 

; =============== S U B R O U T I N E =======================================

ms_map16_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $298               ; set after the Galam guards catch you sneaking around, but before battle
		beq.s   return_51F86
		move.w  #$91,d0 
		jsr     MoveEntityOutOfMap
return_51F86:
		rts

	; End of function ms_map16_InitFunction

cs_51F88:       textCursor $3C2         ; Initial text line $3C2 : "Listen, everybody!{N}We're going to Granseal!{W1}"
		nextSingleText $C0,$80  ; "Listen, everybody!{N}We're going to Granseal!{W1}"
		setEntityDir $5,$3      ; 0023 SET ENTITY FACING 5 3
		setEntityDir $0,$3      ; 0023 SET ENTITY FACING 0 3
		setCamDest $C,$B        ; 0032 SET CAMERA DEST C B
		nextSingleText $C0,$5   ; "We're too late!{W1}"
		nextText $C0,$80        ; "As you may know, my{N}messenger was killed!{W2}"
		nextText $C0,$80        ; "Granseal must have done{N}this.{W2}"
		nextSingleText $C0,$80  ; "So we're invading them to{N}retaliate!{W1}"
		nextSingleText $FF,$FF  ; "Murmur...murmur....{W1}"
		csWait $14              ; WAIT 14
		setEntityDir $1C,$0     ; 0023 SET ENTITY FACING 1C 0
		csWait $14              ; WAIT 14
		setEntityDir $1C,$2     ; 0023 SET ENTITY FACING 1C 2
		csWait $14              ; WAIT 14
		setEntityDest $1C,$10,$11; 0029 SET ENTITY DEST 1C 10 11
		nextText $0,$1C         ; "Quiet!  Everybody listen{N}to me!{W1}"
		nextText $0,$1C         ; "I also don't understand{N}this march!{W2}"
		nextText $0,$1C         ; "But, King Galam must{N}have a good reason!{W2}"
		nextText $0,$1C         ; "I believe the King!{N}How about you?{N}Anyone disagree?{W1}"
		csWait $5               ; WAIT 5
		setActscript $1C,$0,eas_461B6; 0015 SET ACTSCRIPT 1C 0 461B6
		csWait $3C              ; WAIT 3C
		nextSingleText $0,$1C   ; "No?  Good!{W1}"
		setEntityDir $1C,$3     ; 0023 SET ENTITY FACING 1C 3
		csWait $14              ; WAIT 14
		setEntityDir $1C,$1     ; 0023 SET ENTITY FACING 1C 1
		csWait $14              ; WAIT 14
		setEntityDest $1C,$10,$10; 0029 SET ENTITY DEST 1C 10 10
		setEntityDir $1C,$0     ; 0023 SET ENTITY FACING 1C 0
		setEntityDir $80,$2     ; 0023 SET ENTITY FACING 80 2
		csWait $14              ; WAIT 14
		setEntityDir $1C,$3     ; 0023 SET ENTITY FACING 1C 3
		nextSingleText $C0,$80  ; "Well done, {NAME;28}.{W1}"
		setEntityDir $80,$3     ; 0023 SET ENTITY FACING 80 3
		nextSingleText $0,$1C   ; "King Galam, victory is{N}ours!{W1}"
		nextSingleText $C0,$80  ; "Guards!{N}Open the gate!{N}Lower the bridge!{W1}"
		csWait $1E              ; WAIT 1E
		playSound SFX_BIG_DOOR_RUMBLE; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
		csWait $96              ; WAIT 96
		setEntityDir $80,$2     ; 0023 SET ENTITY FACING 80 2
		nextSingleText $C0,$80  ; "{NAME;28}, prove your{N}allegiance.{W1}"
		setEntityDir $1C,$0     ; 0023 SET ENTITY FACING 1C 0
		nextSingleText $0,$1C   ; "What do you mean?{W1}"
		nextSingleText $C0,$80  ; "Show no mercy!{W1}"
		nextSingleText $0,$1C   ; "My Lord...{W1}"
		nextSingleText $C0,$80  ; "Now, go!{W1}"
		setEntityDir $80,$3     ; 0023 SET ENTITY FACING 80 3
		setEntityDir $1C,$3     ; 0023 SET ENTITY FACING 1C 3
		csWait $14              ; WAIT 14
		setCamDest $C,$12       ; 0032 SET CAMERA DEST C 12
		setEntityDest $80,$11,$17; 0029 SET ENTITY DEST 80 11 17
		setEntityDest $1C,$11,$11; 0029 SET ENTITY DEST 1C 11 11
		setEntityDest $1C,$11,$16; 0029 SET ENTITY DEST 1C 11 16
		setEntityDest $1C,$12,$18; 0029 SET ENTITY DEST 1C 12 18
		setEntityDir $80,$1     ; 0023 SET ENTITY FACING 80 1
		setEntityDir $1C,$1     ; 0023 SET ENTITY FACING 1C 1
		setEntityDir $81,$3     ; 0023 SET ENTITY FACING 81 3
		setEntityDir $82,$3     ; 0023 SET ENTITY FACING 82 3
		setEntityDir $83,$3     ; 0023 SET ENTITY FACING 83 3
		setEntityDir $84,$3     ; 0023 SET ENTITY FACING 84 3
		setEntityDir $85,$3     ; 0023 SET ENTITY FACING 85 3
		setEntityDir $86,$3     ; 0023 SET ENTITY FACING 86 3
		setEntityDir $87,$3     ; 0023 SET ENTITY FACING 87 3
		setEntityDir $88,$3     ; 0023 SET ENTITY FACING 88 3
		setEntityDir $89,$3     ; 0023 SET ENTITY FACING 89 3
		setEntityDir $8A,$3     ; 0023 SET ENTITY FACING 8A 3
		setEntityDir $8B,$3     ; 0023 SET ENTITY FACING 8B 3
		setEntityDir $8C,$3     ; 0023 SET ENTITY FACING 8C 3
		setEntityDir $8D,$3     ; 0023 SET ENTITY FACING 8D 3
		setEntityDir $8E,$3     ; 0023 SET ENTITY FACING 8E 3
		setEntityDir $8F,$3     ; 0023 SET ENTITY FACING 8F 3
		setEntityDir $90,$3     ; 0023 SET ENTITY FACING 90 3
		nextSingleText $0,$80   ; "Crush Granseal!{W1}"
		moveEntity $1C,$0,$3,$7 ; 002D MOVE ENTITY 1C 0 3 7
		endMove $8080
		moveEntity $80,$0,$3,$7 ; 002D MOVE ENTITY 80 0 3 7
		endMove $8080
		moveEntity $81,$0,$3,$7 ; 002D MOVE ENTITY 81 0 3 7
		endMove $8080
		moveEntity $82,$0,$3,$7 ; 002D MOVE ENTITY 82 0 3 7
		endMove $8080
		moveEntity $83,$0,$3,$7 ; 002D MOVE ENTITY 83 0 3 7
		endMove $8080
		moveEntity $84,$0,$3,$7 ; 002D MOVE ENTITY 84 0 3 7
		endMove $8080
		moveEntity $85,$0,$3,$7 ; 002D MOVE ENTITY 85 0 3 7
		endMove $8080
		moveEntity $86,$0,$3,$7 ; 002D MOVE ENTITY 86 0 3 7
		endMove $8080
		moveEntity $87,$0,$3,$7 ; 002D MOVE ENTITY 87 0 3 7
		endMove $8080
		moveEntity $88,$0,$3,$7 ; 002D MOVE ENTITY 88 0 3 7
		endMove $8080
		moveEntity $89,$0,$3,$7 ; 002D MOVE ENTITY 89 0 3 7
		endMove $8080
		moveEntity $8A,$0,$3,$7 ; 002D MOVE ENTITY 8A 0 3 7
		endMove $8080
		moveEntity $8B,$0,$3,$7 ; 002D MOVE ENTITY 8B 0 3 7
		endMove $8080
		moveEntity $8C,$0,$3,$7 ; 002D MOVE ENTITY 8C 0 3 7
		endMove $8080
		moveEntity $8D,$0,$3,$7 ; 002D MOVE ENTITY 8D 0 3 7
		endMove $8080
		moveEntity $8E,$0,$3,$7 ; 002D MOVE ENTITY 8E 0 3 7
		endMove $8080
		moveEntity $8F,$0,$3,$7 ; 002D MOVE ENTITY 8F 0 3 7
		endMove $8080
		moveEntity $90,$0,$3,$7 ; 002D MOVE ENTITY 90 0 3 7
		endMove $8080
		setEntityDir $5,$3      ; 0023 SET ENTITY FACING 5 3
		setEntityDir $0,$3      ; 0023 SET ENTITY FACING 0 3
		setCamDest $C,$5        ; 0032 SET CAMERA DEST C 5
		hideEntity $1C          ; 002E HIDE ENTITY 1C
		hideEntity $80          ; 002E HIDE ENTITY 80
		hideEntity $81          ; 002E HIDE ENTITY 81
		hideEntity $82          ; 002E HIDE ENTITY 82
		hideEntity $83          ; 002E HIDE ENTITY 83
		hideEntity $84          ; 002E HIDE ENTITY 84
		hideEntity $85          ; 002E HIDE ENTITY 85
		hideEntity $86          ; 002E HIDE ENTITY 86
		hideEntity $87          ; 002E HIDE ENTITY 87
		hideEntity $88          ; 002E HIDE ENTITY 88
		hideEntity $89          ; 002E HIDE ENTITY 89
		hideEntity $8A          ; 002E HIDE ENTITY 8A
		hideEntity $8B          ; 002E HIDE ENTITY 8B
		hideEntity $8C          ; 002E HIDE ENTITY 8C
		hideEntity $8D          ; 002E HIDE ENTITY 8D
		hideEntity $8E          ; 002E HIDE ENTITY 8E
		hideEntity $8F          ; 002E HIDE ENTITY 8F
		hideEntity $90          ; 002E HIDE ENTITY 90
		nextText $C0,$5         ; "They've gone.{N}The war begins.{W1}"
		setEntityDir $5,$2      ; 0023 SET ENTITY FACING 5 2
		setEntityDir $0,$0      ; 0023 SET ENTITY FACING 0 0
		nextText $C0,$5         ; "So, what should we do?{N}Are you still going to{N}Granseal?{W1}"
		nextText $C0,$5         ; "You're serious?{N}Do you think you can stop{N}the war?{W2}"
		nextSingleText $0,$5    ; "I will leave you once I'm{N}outside the gate!{W1}"
		csc_end                 ; END OF CUTSCENE SCRIPT
cs_521BA:       textCursor $3DA         ; Initial text line $3DA : "You!{W1}"
		entityPosDir $92,$11,$10,$1; 0019 SET ENTITY POS AND FACING 92 11 10 1
		entityPosDir $93,$11,$F,$3; 0019 SET ENTITY POS AND FACING 93 11 F 3
		nextSingleText $0,$91   ; "You!{W1}"
		setCamDest $0,$11       ; 0032 SET CAMERA DEST 0 11
		nextSingleText $0,$91   ; "How did you get out?{W1}"
		setActscript $5,$FF,eas_Init; 0015 SET ACTSCRIPT 5 FF 460CE
		setActscript $0,$FF,eas_Init; 0015 SET ACTSCRIPT 0 FF 460CE
		setEntityDest $0,$3,$13 ; 0029 SET ENTITY DEST 0 3 13
		setEntityDest $5,$4,$13 ; 0029 SET ENTITY DEST 5 4 13
		nextSingleText $0,$5    ; "I...{W1}"
		nextSingleText $0,$92   ; "Wow, great jewel!{W1}"
		setCamDest $C,$A        ; 0032 SET CAMERA DEST C A
		nextSingleText $0,$93   ; "Oh, this?{N}The King gave it to me!{W1}"
		nextSingleText $0,$92   ; "Because you captured that{N}rat?{W1}"
		setCamDest $0,$D        ; 0032 SET CAMERA DEST 0 D
		setEntityDir $0,$0      ; 0023 SET ENTITY FACING 0 0
		setEntityDir $5,$2      ; 0023 SET ENTITY FACING 5 2
		nextText $0,$93         ; "Yes.  I presented them to{N}King Galam.{W2}"
		nextSingleText $0,$93   ; "He was so kind to give me{N}one of the pair, the Jewel{N}of Light!{W1}"
		moveEntity $0,$0,$0,$1  ; 002D MOVE ENTITY 0 0 0 1
		endMove $8080
		moveEntity $5,$FF,$0,$1 ; 002D MOVE ENTITY 5 FF 0 1
		endMove $8080
		nextSingleText $0,$91   ; "Wait!{W1}"
		setEntityDir $0,$3      ; 0023 SET ENTITY FACING 0 3
		setEntityDir $5,$3      ; 0023 SET ENTITY FACING 5 3
		setCamDest $0,$12       ; 0032 SET CAMERA DEST 0 12
		nextSingleText $0,$91   ; "How did you escape?{W1}"
		setEntityDir $0,$0      ; 0023 SET ENTITY FACING 0 0
		setEntityDir $5,$2      ; 0023 SET ENTITY FACING 5 2
		csWait $14              ; WAIT 14
		setEntityDir $0,$3      ; 0023 SET ENTITY FACING 0 3
		setEntityDir $5,$3      ; 0023 SET ENTITY FACING 5 3
		setEntityDest $91,$9,$17; 0029 SET ENTITY DEST 91 9 17
		setActscript $91,$FF,eas_Jump; 0015 SET ACTSCRIPT 91 FF 45E44
		setActscript $91,$FF,eas_Jump; 0015 SET ACTSCRIPT 91 FF 45E44
		nextSingleText $0,$91   ; "Intruders!  Intruders!{N}Arrest them!{W1}"
		setStoryFlag $5         ; Battle 5 unlocked
cs_5227C:       mapSysEvent $10000000   ; 0007 EXECUTE MAP SYSTEM EVENT 10000000
		csc_end                 ; END OF CUTSCENE SCRIPT
