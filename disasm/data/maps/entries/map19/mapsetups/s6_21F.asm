
; ASM FILE data\maps\entries\map19\mapsetups\s6_21F.asm :
; 0x62C9E..0x631EA : 

; =============== S U B R O U T I N E =======================================

ms_map19_flag21F_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $19
		bne.s   loc_62CAE
		move.w  #$19,d0
		jsr     MoveEntityOutOfMap
loc_62CAE:
		trap    #CHECK_FLAG
		dc.w 8
		bne.s   loc_62CBE
		move.w  #8,d0
		jsr     MoveEntityOutOfMap
loc_62CBE:
		trap    #CHECK_FLAG
		dc.w $1B
		bne.s   loc_62CCE
		move.w  #$1B,d0
		jsr     MoveEntityOutOfMap
loc_62CCE:
		lea     cs_62D06(pc), a0
		trap    #6
		trap    #CHECK_FLAG
		dc.w $3D5
		beq.s   loc_62CFC
		trap    #CHECK_FLAG
		dc.w $3D6
		bne.s   loc_62CF2
		lea     cs_62D0E(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $3D6
		move.b  #$FF,((FOLLOWERS_LIST-$1000000)).w
		bra.s   loc_62CFA
loc_62CF2:
		trap    #SOUND_COMMAND
		dc.w MUSIC_TOWN
		jsr     (FadeInFromBlack).w
loc_62CFA:
		bra.s   return_62D04
loc_62CFC:
		trap    #SOUND_COMMAND
		dc.w MUSIC_TOWN
		jsr     (FadeInFromBlack).w
return_62D04:
		rts

	; End of function ms_map19_flag21F_InitFunction

cs_62D06:       entitySprite $B,$AA
		csc_end
cs_62D0E:       textCursor $F7F
		setCameraEntity $81
		setPos $81,26,29,UP
		setPos $4,26,30,UP
		setPos $1,26,30,UP
		setPos $3,26,30,UP
		setPos $2,26,30,UP
		followEntity $0,$81,$2
		followEntity $4,$81,$5
		followEntity $1,$81,$6
		followEntity $3,$4,$2
		followEntity $2,$1,$2
		csWait 10
		fadeInB
		moveEntity $81,$FF,$1,$4
		moreMove $0,$3
		moreMove $1,$2
		endMove $8080
		roofEvent 29,23
		moveEntity $81,$FF,$1,$E
		endMove $8080
		setActscript $0,$FF,eas_Init
		setActscript $1,$FF,eas_Init
		setActscript $3,$FF,eas_Init
		setActscript $2,$FF,eas_Init
		setActscript $4,$FF,eas_Init
		setCamDest 24,5
		csWait 40
		customActscript $81,$FF
		dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
		dc.b $10
		dc.b $10
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $81,$FF,$1,$1
		endMove $8080
		csWait 30
		nextSingleText $0,$81   ; "King Granseal, {LEADER}{N}is here!{W1}"
		entityNod $80
		nextSingleText $80,$80  ; "Please explain what is{N}happening.{W1}"
		csWait 10
		entityNod $81
		nextSingleText $0,$81   ; "Yes, sir.{W1}"
		moveEntity $81,$FF,$0,$1
		moreMove $B,$1
		endMove $8080
		csWait 30
		entityNod $81
		setFacing $0,UP
		setFacing $1,UP
		setFacing $3,UP
		setFacing $2,UP
		setFacing $4,UP
		setFacing $5,UP
		setFacing $7,UP
		setFacing $A,UP
		setFacing $19,UP
		setFacing $8,UP
		setFacing $13,UP
		setFacing $B,UP
		setFacing $1A,UP
		setFacing $1B,UP
		csWait 10
		nextText $0,$81         ; "Listen up!{W2}"
		nextText $0,$81         ; "It took two years, but the{N}Princess finally recovered{N}from the poison.{W2}"
		nextSingleText $0,$81   ; "But she's still sleeping.{N}We've decided to take{N}Mitula's advice.{W1}"
		setActscript $7,$FF,eas_Jump
		setActscript $7,$FF,eas_Jump
		nextSingleText $80,$7   ; "Mitula...you mean, somebody{N}gets to kiss her?{W1}"
		csWait 10
		entityShiver $1
		csWait 10
		setFacing $81,UP
		csWait 40
		entityNod $80
		csWait 30
		nextSingleText $0,$80   ; "Yes.{N}We feel this is the right{N}time.{W1}"
		csWait 30
		setFacing $81,DOWN
		nextSingleText $0,$81   ; "And we need to decide which{N}one of you will kiss{N}Elis.{W1}"
		setFacing $7,LEFT
		nextSingleText $80,$7   ; "We don't have to decide.{N}It's {LEADER}.{N}{NAME;10}, don't you agree?{W1}"
		setFacing $7,DOWN
		csWait 20
		entityShiver $A
		csWait 20
		nextText $80,$A         ; "Ha, ha!  Yes, {NAME;7}!{W2}"
		csWait 10
		setFacing $A,LEFT
		nextSingleText $80,$A   ; "I always thought {LEADER}{N}was the best choice!{W1}"
		moveEntity $81,$FF,$0,$2
		moreMove $B,$1
		endMove $8080
		setFacing $7,UP
		setFacing $A,UP
		nextSingleText $0,$81   ; "Are you sure?{N}Anybody disagree?{W1}"
		setFacing $7,DOWN
		csWait 60
		moveEntity $81,$FF,$2,$2
		moreMove $B,$1
		endMove $8080
		setFacing $7,UP
		nextSingleText $0,$81   ; "Nobody?{W1}"
		csWait 30
		moveEntity $81,$FF,$2,$2
		moreMove $B,$1
		endMove $8080
		setFacing $7,DOWN
		setFacing $4,RIGHT
		setFacing $A,UP
		setFacing $19,DOWN
		setFacing $8,DOWN
		setFacing $13,DOWN
		setFacing $B,UP
		setFacing $0,DOWN
		csWait 40
		setCamDest 24,7
		csWait 5
		setActscript $3,$0,eas_461B6
		csWait 100
		moveEntity $3,$FF,$3,$1
		endMove $8080
		setFacing $3,RIGHT
		entityShiver $3
		setFacing $1,DOWN
		setFacing $2,DOWN
		setFacing $4,DOWN
		setFacing $5,RIGHT
		setFacing $A,LEFT
		setFacing $19,RIGHT
		setFacing $8,RIGHT
		setFacing $13,LEFT
		setFacing $B,RIGHT
		setFacing $1A,RIGHT
		setFacing $1B,LEFT
		setFacing $0,DOWN
		nextText $0,$3          ; "I understand what my friends{N}are saying, but...I love{N}her.{W2}"
		nextSingleText $0,$3    ; "May I kiss her?{N}Somebody, say yes!{W1}"
		csWait 5
		setActscript $3,$0,eas_461B6
		entityShiver $1
		csWait 20
		setFacing $7,DOWN
		setFacing $A,UP
		csWait 20
		entityShakeHead $A
		csWait 20
		moveEntity $7,$FF,$2,$1
		moreMove $3,$2
		moreMove $A,$1
		endMove $8080
		setFacing $A,LEFT
		setFacing $3,RIGHT
		nextSingleText $80,$7   ; "Sorry, but...I don't think{N}{NAME;3} is the right{N}choice.{W1}"
		entityShiver $3
		moveEntity $5,$FF,$0,$1
		moreMove $3,$1
		moreMove $8,$1
		endMove $8080
		setFacing $3,LEFT
		nextText $0,$5          ; "I understand {NAME;3}, but{N}she is a human.{W2}"
		nextSingleText $0,$5    ; "A human is the best choice.{W1}"
		entityShiver $3
		jumpIfFlagClear $8,cs_62FB0; May joined
		moveEntity $8,$FF,$3,$1
		moreMove $8,$1
		endMove $8080
		nextSingleText $0,$8    ; "{LEADER} is a human!{N}They will make a cute couple!{W1}"
		entityShiver $3
cs_62FB0:       textCursor $F93
		moveEntity $7,$FF,$1,$1
		moreMove $B,$1
		endMove $8080
		moveEntity $13,$FF,$2,$1
		endMove $8080
		setFacing $3,RIGHT
		nextText $80,$13        ; "{LEADER} is a good lad{N}with the manner of a{N}knight!{W2}"
		nextSingleText $80,$13  ; "I think he's the best{N}choice.{W1}"
		entityShiver $3
		csWait 30
		moveEntity $81,$FF,$0,$2
		moreMove $3,$1
		endMove $8080
		nextSingleText $0,$81   ; "{NAME;1}, what do you{N}think?{W1}"
		entityShiver $1
		setFacing $1,UP
		setFacing $3,UP
		setFacing $2,UP
		setFacing $4,UP
		setFacing $7,UP
		setFacing $13,UP
		setFacing $0,UP
		nextText $80,$1         ; "M...me?  Well...{W2}"
		entityShiver $1
		nextText $80,$1         ; "I'm worried about her...{N}but...I...{W2}"
		setFacing $1,LEFT
		csWait 30
		setFacing $1,UP
		csWait 10
		nextSingleText $80,$1   ; "Yes, a good choice....{N}{LEADER} will make her...{N}...happy....{W1}"
		customActscript $1,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $2,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $1,$0,$3,$1
		endMove $8080
		moveEntity $2,$FF,$2,$1
		endMove $8080
		setActscript $2,$0,eas_RotateRight
		setFacing $0,DOWN
		setFacing $4,DOWN
		setFacing $3,DOWN
		setFacing $7,DOWN
		setFacing $13,DOWN
		moveEntity $1,$FF,$3,$8
		endMove $8080
		hideEntity $1
		setActscript $2,$FF,eas_Init
		startEntity $2
		setFacing $2,DOWN
		entityShakeHead $2
		csWait 30
		setCamDest 24,9
		moveEntity $2,$FF,$3,$2
		endMove $8080
		csWait 50
		nextSingleText $0,$2    ; "Does she love {LEADER}?{N}I didn't know that.{W1}"
		setActscript $4,$FF,eas_Jump
		setActscript $4,$FF,eas_Jump
		moveEntity $4,$FF,$3,$1
		moreMove $0,$2
		moreMove $3,$2
		moreMove $A,$1
		endMove $8080
		setFacing $2,RIGHT
		nextSingleText $80,$4   ; "Stop!{N}I will go and comfort her.{W1}"
		setFacing $2,DOWN
		moveEntity $4,$0,$3,$2
		endMove $8080
		csWait 8
		setActscript $2,$FF,eas_Jump
		setActscript $2,$FF,eas_Jump
		nextSingleText $0,$2    ; "{NAME;4}!{N}I'll go with you!{W1}"
		setFacing $4,UP
		nextSingleText $80,$4   ; "Oh, c'mon.{N}She needs someone like me.{W1}"
		moveEntity $4,$FF,$3,$5
		endMove $8080
		hideEntity $4
		csWait 30
		nextSingleText $0,$2    ; "What does he mean?{N}I don't understand!{W1}"
		moveEntity $B,$FF,$0,$2
		moreMove $3,$1
		moreMove $0,$2
		moreMove $B,$1
		endMove $8080
		nextSingleText $80,$B   ; "They remind me of when I{N}was young.{W1}"
		moveEntity $1A,$FF,$0,$3
		moreMove $3,$1
		moreMove $8,$1
		endMove $8080
		nextSingleText $0,$1A   ; "{NAME;11}, you were young{N}once?{W1}"
		entityShiver $1A
		setFacing $B,LEFT
		setActscript $B,$FF,eas_Jump
		setActscript $B,$FF,eas_Jump
		nextSingleText $80,$B   ; "Be quiet, you bucket of bolts!{W1}"
		setCamDest 24,5
		moveEntity $A,$FF,$1,$1
		moreMove $2,$2
		moreMove $9,$1
		endMove $8080
		setFacing $3,UP
		setFacing $7,UP
		setFacing $2,UP
		setFacing $A,UP
		setFacing $B,UP
		setFacing $1A,UP
		setFacing $13,UP
		setFacing $0,UP
		nextText $80,$A         ; "You heard everyone.{N}We think {LEADER} is the{N}right choice.{W2}"
		setFacing $A,DOWN
		nextText $80,$A         ; "{NAME;4} will take care{N}of {NAME;1}.{W2}"
		entityNod $81
		setFacing $A,UP
		nextSingleText $80,$A   ; "Everything went as you{N}expected, huh?{W1}"
		entityShiver $81
		nextText $0,$81         ; "You knew that?{N}{NAME;10}, you're smart.{W2}"
		nextText $0,$81         ; "But I didn't know what{N}{NAME;1} or {NAME;3} would do.{W2}I didn't want to hurt their{N}feelings.{W1}"
		nextSingleText $0,$81   ; "{LEADER}, I choose you.{W1}"
		customActscript $80,$FF
		dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
		dc.b $10
		dc.b $10
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $80,$FF,$3,$1
		moreMove $0,$1
		moreMove $B,$1
		endMove $8080
		setFacing $81,UP
		nextSingleText $80,$80  ; "Now, {LEADER}.{N}Please go awaken her.{W1}"
		moveEntity $80,$FF,$2,$1
		moreMove $3,$1
		endMove $8080
		nextSingleText $80,$80  ; "The Minister is waiting{N}for you.{W1}"
		moveEntity $80,$FF,$1,$2
		moreMove $B,$1
		endMove $8080
		moveEntity $81,$FF,$2,$1
		moreMove $B,$1
		endMove $8080
		nextSingleText $0,$81   ; "Oh, {LEADER}!{N}I really respect you.{W2}"
		csc_end
