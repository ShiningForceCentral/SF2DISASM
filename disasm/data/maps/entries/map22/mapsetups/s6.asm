
; ASM FILE data\maps\entries\map22\mapsetups\s6.asm :
; 0x5962E..0x59AC0 : 

; =============== S U B R O U T I N E =======================================

ms_map22_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $308
		bne.s   loc_5963E
		lea     cs_59656(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $308               ; set after the scene where Goliath places you on the Desktop
loc_5963E:
		trap    #CHECK_FLAG
		dc.w $20A
		beq.s   return_59654
		trap    #CHECK_FLAG
		dc.w $30A
		bne.s   return_59654
		lea     cs_5996E(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $30A               ; set after the scene that plays after you win the chess battle
return_59654:
		rts

	; End of function ms_map22_InitFunction

cs_59656:       textCursor $6D4         ; Initial text line $6D4 : "What happened?{W2}"
		csc46 $0,$13            ; 0046 UNKNOWN
		setActscript $0,$FF,eas_Init; 0015 SET ACTSCRIPT 0 FF 460CE
		setActscript $7,$FF,eas_Init; 0015 SET ACTSCRIPT 7 FF 460CE
		setActscript $1F,$FF,eas_Init; 0015 SET ACTSCRIPT 1F FF 460CE
		stopEntity $0           ; 001C STOP ENTITY ANIM 0
		stopEntity $7           ; 001C STOP ENTITY ANIM 7
		stopEntity $1F          ; 001C STOP ENTITY ANIM 1F
		customActscript $0,$FF  ; 0014 SET MANUAL ACTSCRIPT 0
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $7,$FF  ; 0014 SET MANUAL ACTSCRIPT 7
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $1F,$FF ; 0014 SET MANUAL ACTSCRIPT 1F
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		entityPosDir $0,$4,$8,$3; 0019 SET ENTITY POS AND FACING 0 4 8 3
		entityPosDir $7,$3,$7,$3; 0019 SET ENTITY POS AND FACING 7 3 7 3
		entityPosDir $1F,$5,$7,$3; 0019 SET ENTITY POS AND FACING 1F 5 7 3
		entityPosDir $99,$C,$10,$3; 0019 SET ENTITY POS AND FACING 99 C 10 3
		entityPosDir $9A,$B,$F,$3; 0019 SET ENTITY POS AND FACING 9A B F 3
		entityPosDir $9B,$D,$F,$3; 0019 SET ENTITY POS AND FACING 9B D F 3
		removeEntityShadow $0   ; 0030 REMOVE ENTITY SHADOW 0 (null) (null)
		removeEntityShadow $7   ; 0030 REMOVE ENTITY SHADOW 7 (null) (null)
		removeEntityShadow $1F  ; 0030 REMOVE ENTITY SHADOW 1F (null) (null)
		fadeInB                 ; 0039 FADE IN FROM BLACK
		moveEntity $0,$0,$3,$10 ; 002D MOVE ENTITY 0 0 3 10
		endMove $8080
		moveEntity $7,$0,$3,$10 ; 002D MOVE ENTITY 7 0 3 10
		endMove $8080
		moveEntity $1F,$0,$3,$10; 002D MOVE ENTITY 1F 0 3 10
		endMove $8080
		moveEntity $99,$0,$6,$8 ; 002D MOVE ENTITY 99 0 6 8
		endMove $8080
		moveEntity $9A,$0,$6,$8 ; 002D MOVE ENTITY 9A 0 6 8
		endMove $8080
		moveEntity $9B,$FF,$6,$8; 002D MOVE ENTITY 9B FF 6 8
		endMove $8080
		hideEntity $99          ; 002E HIDE ENTITY 99
		hideEntity $9A          ; 002E HIDE ENTITY 9A
		hideEntity $9B          ; 002E HIDE ENTITY 9B
		customActscript $0,$FF  ; 0014 SET MANUAL ACTSCRIPT 0
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $7,$FF  ; 0014 SET MANUAL ACTSCRIPT 7
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $3
		dc.w 3
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $1F,$FF ; 0014 SET MANUAL ACTSCRIPT 1F
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $3
		dc.w 3
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		csWait $64              ; WAIT 64
		startEntity $0          ; 001B START ENTITY ANIM 0
		startEntity $7          ; 001B START ENTITY ANIM 7
		startEntity $1F         ; 001B START ENTITY ANIM 1F
		setActscript $0,$FF,eas_Init; 0015 SET ACTSCRIPT 0 FF 460CE
		setActscript $7,$FF,eas_Init; 0015 SET ACTSCRIPT 7 FF 460CE
		setActscript $1F,$FF,eas_Init; 0015 SET ACTSCRIPT 1F FF 460CE
		entityShakeHead $0      ; 0027 MAKE ENTITY SHAKE HEAD 0
		entityShakeHead $7      ; 0027 MAKE ENTITY SHAKE HEAD 7
		entityShakeHead $1F     ; 0027 MAKE ENTITY SHAKE HEAD 1F
		setEntityDir $0,$1      ; 0023 SET ENTITY FACING 0 1
		setEntityDir $7,$0      ; 0023 SET ENTITY FACING 7 0
		setEntityDir $1F,$2     ; 0023 SET ENTITY FACING 1F 2
		csWait $14              ; WAIT 14
		nextText $C0,$1F        ; "What happened?{W2}"
		nextText $C0,$1F        ; "A strange feeling swept over{N}me when I entered that door.{W2}"
		nextSingleText $C0,$1F  ; "Then, it felt like...I was{N}lifted upward!{W1}"
		nextText $0,$7          ; "It's very difficult to explain{N}what's happened to us....{W2}"
		nextSingleText $0,$7    ; "Anyway, we're very small now.{W1}"
		customActscript $1F,$FF ; 0014 SET MANUAL ACTSCRIPT 1F
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $1F,$FF,$2,$1; 002D MOVE ENTITY 1F FF 2 1
		endMove $8080
		nextSingleText $C0,$1F  ; "Small?  How small?{W1}"
		csWait $5               ; WAIT 5
		setActscript $7,$0,eas_461B6; 0015 SET ACTSCRIPT 7 0 461B6
		csWait $64              ; WAIT 64
		moveEntity $7,$FF,$3,$2 ; 002D MOVE ENTITY 7 FF 3 2
		moreMove $0,$1
		endMove $8080
		csWait $5               ; WAIT 5
		setActscript $7,$0,eas_461B6; 0015 SET ACTSCRIPT 7 0 461B6
		csWait $82              ; WAIT 82
		setEntityDir $7,$1      ; 0023 SET ENTITY FACING 7 1
		setEntityDir $0,$3      ; 0023 SET ENTITY FACING 0 3
		setEntityDir $1F,$3     ; 0023 SET ENTITY FACING 1F 3
		nextSingleText $0,$7    ; "Let's see...now we're on a{N}desk...and it's very large,{N}like a village.{W1}"
		nextSingleText $0,$80   ; "Exactly.{W1}"
		moveEntity $0,$0,$2,$1  ; 002D MOVE ENTITY 0 0 2 1
		endMove $8080
		moveEntity $7,$FF,$0,$1 ; 002D MOVE ENTITY 7 FF 0 1
		endMove $8080
		csWait $5               ; WAIT 5
		setActscript $0,$0,eas_461B6; 0015 SET ACTSCRIPT 0 0 461B6
		csWait $A               ; WAIT A
		csWait $5               ; WAIT 5
		setActscript $7,$0,eas_461B6; 0015 SET ACTSCRIPT 7 0 461B6
		csWait $5               ; WAIT 5
		setActscript $1F,$0,eas_461B6; 0015 SET ACTSCRIPT 1F 0 461B6
		csWait $82              ; WAIT 82
		setEntityDir $7,$3      ; 0023 SET ENTITY FACING 7 3
		setEntityDir $0,$3      ; 0023 SET ENTITY FACING 0 3
		setEntityDir $1F,$3     ; 0023 SET ENTITY FACING 1F 3
		setActscript $0,$FF,eas_Jump; 0015 SET ACTSCRIPT 0 FF 45E44
		setActscript $7,$0,eas_Jump; 0015 SET ACTSCRIPT 7 0 45E44
		entityShiver $0         ; 002A MAKE ENTITY SHIVER 0
		entityShiver $7         ; 002A MAKE ENTITY SHIVER 7
		setActscript $0,$FF,eas_46172; 0015 SET ACTSCRIPT 0 FF 46172
		setActscript $7,$FF,eas_46172; 0015 SET ACTSCRIPT 7 FF 46172
		moveEntity $0,$0,$1,$1  ; 002D MOVE ENTITY 0 0 1 1
		endMove $8080
		moveEntity $7,$FF,$1,$1 ; 002D MOVE ENTITY 7 FF 1 1
		endMove $8080
		setActscript $0,$FF,eas_Init; 0015 SET ACTSCRIPT 0 FF 460CE
		setActscript $7,$FF,eas_Init; 0015 SET ACTSCRIPT 7 FF 460CE
		nextText $0,$7          ; "Goliath!{W2}"
		setActscript $7,$FF,eas_Jump; 0015 SET ACTSCRIPT 7 FF 45E44
		setActscript $7,$FF,eas_Jump; 0015 SET ACTSCRIPT 7 FF 45E44
		csWait $A               ; WAIT A
		nextSingleText $0,$7    ; "Hey, what did you do to us?{W1}"
		nextText $0,$80         ; "I told you not to go in{N}there.  You didn't listen{N}to my warning.{W2}"
		nextSingleText $0,$80   ; "You guys look so cute!{N}Ha, ha!{N}Bye, little kiddies!{W1}"
		csWait $14              ; WAIT 14
		playSound SFX_DIALOG_BLEEP_6; 0005 PLAY SOUND SFX_DIALOG_BLEEP_6
		csWait $14              ; WAIT 14
		playSound SFX_DIALOG_BLEEP_6; 0005 PLAY SOUND SFX_DIALOG_BLEEP_6
		csWait $14              ; WAIT 14
		playSound SFX_DIALOG_BLEEP_6; 0005 PLAY SOUND SFX_DIALOG_BLEEP_6
		csWait $14              ; WAIT 14
		playSound SFX_DIALOG_BLEEP_6; 0005 PLAY SOUND SFX_DIALOG_BLEEP_6
		csWait $14              ; WAIT 14
		playSound SFX_DIALOG_BLEEP_6; 0005 PLAY SOUND SFX_DIALOG_BLEEP_6
		setEntityDir $0,$0      ; 0023 SET ENTITY FACING 0 0
		setEntityDir $7,$0      ; 0023 SET ENTITY FACING 7 0
		setEntityDir $1F,$0     ; 0023 SET ENTITY FACING 1F 0
		csWait $14              ; WAIT 14
		playSound SFX_DIALOG_BLEEP_8; 0005 PLAY SOUND SFX_DIALOG_BLEEP_8
		csWait $14              ; WAIT 14
		playSound SFX_DIALOG_BLEEP_8; 0005 PLAY SOUND SFX_DIALOG_BLEEP_8
		csWait $14              ; WAIT 14
		playSound SFX_DIALOG_BLEEP_8; 0005 PLAY SOUND SFX_DIALOG_BLEEP_8
		csWait $14              ; WAIT 14
		playSound SFX_DIALOG_BLEEP_8; 0005 PLAY SOUND SFX_DIALOG_BLEEP_8
		csWait $14              ; WAIT 14
		playSound SFX_DIALOG_BLEEP_8; 0005 PLAY SOUND SFX_DIALOG_BLEEP_8
		csWait $32              ; WAIT 32
		moveEntity $7,$FF,$2,$2 ; 002D MOVE ENTITY 7 FF 2 2
		endMove $8080
		setEntityDir $0,$3      ; 0023 SET ENTITY FACING 0 3
		setEntityDir $7,$1      ; 0023 SET ENTITY FACING 7 1
		setEntityDir $1F,$3     ; 0023 SET ENTITY FACING 1F 3
		nextText $0,$7          ; "{LEADER}, cheer up!{W2}"
		nextSingleText $0,$7    ; "Let's look around this{N}Desktop Kingdom.{W1}"
		setEntityDir $0,$0      ; 0023 SET ENTITY FACING 0 0
		setEntityDir $1F,$2     ; 0023 SET ENTITY FACING 1F 2
		nextSingleText $0,$1F   ; "I agree!  We can meet Creed{N}later.{W1}"
		setActscript $0,$FF,eas_Init; 0015 SET ACTSCRIPT 0 FF 460CE
		setActscript $7,$FF,eas_Init; 0015 SET ACTSCRIPT 7 FF 460CE
		setActscript $1F,$FF,eas_Init; 0015 SET ACTSCRIPT 1F FF 460CE
		followEntity $7,$0,$2   ; 002C FOLLOW ENTITY 7 0 2
		followEntity $1F,$7,$2  ; 002C FOLLOW ENTITY 1F 7 2
		csc_end                 ; END OF CUTSCENE SCRIPT
cs_5994E:       textCursor $700         ; Initial text line $700 : "Are you ready?{W2}"
		csWait $32              ; WAIT 32
		setCamDest $A,$0        ; 0032 SET CAMERA DEST A 0
		nextText $0,$86         ; "Are you ready?{W2}"
		nextSingleText $0,$86   ; "Now, start the battle!{N}Do your best!{W1}"
		setStoryFlag $16        ; Battle 22 unlocked
		mapSysEvent $16000000   ; 0007 EXECUTE MAP SYSTEM EVENT 16000000
		csc_end                 ; END OF CUTSCENE SCRIPT
cs_5996E:       textCursor $702         ; Initial text line $702 : "Checkmate!{N}This is for you.{W1}"
		setCameraEntity $FFFF   ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
		csc46 $A,$0             ; 0046 UNKNOWN
		entityPosDir $0,$19,$C,$1; 0019 SET ENTITY POS AND FACING 0 19 C 1
		entityPosDir $7,$18,$D,$1; 0019 SET ENTITY POS AND FACING 7 18 D 1
		entityPosDir $1F,$19,$D,$1; 0019 SET ENTITY POS AND FACING 1F 19 D 1
		fadeInB                 ; 0039 FADE IN FROM BLACK
		nextSingleText $0,$86   ; "Checkmate!{N}This is for you.{W1}"
		setCamDest $14,$7       ; 0032 SET CAMERA DEST 14 7
		nextText $0,$86         ; "A Cotton Balloon is inside.{W2}"
		nextSingleText $0,$86   ; "With it you can leave{N}Desktop Kingdom safely.{N}Good luck!{W1}"
		csc_end                 ; END OF CUTSCENE SCRIPT
cs_599A4:       moveEntity $88,$FF,$1,$1; 002D MOVE ENTITY 88 FF 1 1
		endMove $8080
		setEntityDir $88,$3     ; 0023 SET ENTITY FACING 88 3
		csc_end                 ; END OF CUTSCENE SCRIPT
cs_599B2:       setActscript $0,$FF,eas_Init; 0015 SET ACTSCRIPT 0 FF 460CE
		setActscript $7,$FF,eas_Init; 0015 SET ACTSCRIPT 7 FF 460CE
		setActscript $1F,$FF,eas_Init; 0015 SET ACTSCRIPT 1F FF 460CE
		setEntityDest $0,$23,$18; 0029 SET ENTITY DEST 0 23 18
		setEntityDest $7,$22,$18; 0029 SET ENTITY DEST 7 22 18
		setEntityDest $1F,$21,$18; 0029 SET ENTITY DEST 1F 21 18
		moveEntity $0,$0,$E,$1  ; 002D MOVE ENTITY 0 0 E 1
		moreMove $B,$1
		moreMove $3,$2
		endMove $8080
		moveEntity $7,$0,$0,$1  ; 002D MOVE ENTITY 7 0 0 1
		moreMove $E,$1
		moreMove $7,$1
		moreMove $B,$1
		endMove $8080
		moveEntity $1F,$FF,$0,$1; 002D MOVE ENTITY 1F FF 0 1
		moreMove $E,$1
		moreMove $B,$1
		moreMove $3,$1
		endMove $8080
		entityPosDir $89,$24,$19,$1; 0019 SET ENTITY POS AND FACING 89 24 19 1
		entityPosDir $8A,$25,$18,$1; 0019 SET ENTITY POS AND FACING 8A 25 18 1
		entityPosDir $8B,$23,$18,$1; 0019 SET ENTITY POS AND FACING 8B 23 18 1
		stopEntity $0           ; 001C STOP ENTITY ANIM 0
		stopEntity $7           ; 001C STOP ENTITY ANIM 7
		stopEntity $1F          ; 001C STOP ENTITY ANIM 1F
		customActscript $0,$FF  ; 0014 SET MANUAL ACTSCRIPT 0
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $7,$FF  ; 0014 SET MANUAL ACTSCRIPT 7
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $1F,$FF ; 0014 SET MANUAL ACTSCRIPT 1F
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $89,$FF ; 0014 SET MANUAL ACTSCRIPT 89
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $8A,$FF ; 0014 SET MANUAL ACTSCRIPT 8A
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $8B,$FF ; 0014 SET MANUAL ACTSCRIPT 8B
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $0,$0,$3,$6  ; 002D MOVE ENTITY 0 0 3 6
		endMove $8080
		moveEntity $7,$0,$3,$6  ; 002D MOVE ENTITY 7 0 3 6
		endMove $8080
		moveEntity $1F,$0,$3,$6 ; 002D MOVE ENTITY 1F 0 3 6
		endMove $8080
		moveEntity $89,$0,$3,$6 ; 002D MOVE ENTITY 89 0 3 6
		endMove $8080
		moveEntity $8A,$0,$3,$6 ; 002D MOVE ENTITY 8A 0 3 6
		endMove $8080
		moveEntity $8B,$FF,$3,$6; 002D MOVE ENTITY 8B FF 3 6
		endMove $8080
		mapSysEvent $1A1A0803   ; 0007 EXECUTE MAP SYSTEM EVENT 1A1A0803
		csc_end                 ; END OF CUTSCENE SCRIPT
