
; ASM FILE data\maps\entries\map17\mapsetups\s6.asm :
; 0x52450..0x52A80 : 

; =============== S U B R O U T I N E =======================================

ms_map17_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $294               ; set after initial wake-up in prison sequence
		bne.s   loc_52460
		lea     cs_5249E(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $294               ; set after initial wake-up in prison sequence
loc_52460:
		trap    #CHECK_FLAG
		dc.w $297               ; set after Galam and Lemon leave with their army
		beq.s   loc_52476
		move.w  #$83,d0 
		jsr     MoveEntityOutOfMap
		lea     cs_5247C(pc), a0
		trap    #6
loc_52476:
		trap    #SET_FLAG
		dc.w $263               ; set after prison wake-up sequence IF 0297 is *not* also set
		rts

	; End of function ms_map17_InitFunction

cs_5247C:       setBlocks 48,7,1,1,48,8
		setBlocks 62,20,1,2,48,20
		setBlocks 57,7,1,1,57,8
		setBlocks 62,20,1,2,57,20
		csc_end
cs_5249E:       playSound $FD
		resetForceBattleStats
		resetMap
		loadEntitiesFromMapSetup 0,0,RIGHT
		csWait 60
		fadeInB
		textCursor $370
		reloadMap 52,1
		setPos $0,59,4,UP
		nextSingleText $0,$1    ; "Impossible!{N}Galam and Granseal are{N}allies!{W1}"
		nextSingleText $C0,$84  ; "But it's true.  I'm a scholar.{N}I'm here because I tried{N}to stop him.{W1}"
		nextText $C0,$85        ; "I'm a leader of the Galam{N}Army.  I disagreed with{N}the war and now I'm here.{W2}"
		nextText $C0,$85        ; "What did your kingdom{N}do to Galam?{W2}"
		nextSingleText $C0,$85  ; "What is the reason for this{N}war?{W1}"
		nextText $0,$4          ; "What about Sir Hawel?{N}He was killed by Galam!{W2}"
		nextSingleText $0,$4    ; "What did Galam want?{N}What is Ground Seal?{W1}"
		nextSingleText $C0,$84  ; "Ground Seal...do you know{N}what Ground Seal is?{W1}"
		nextSingleText $0,$2    ; "What is Ground Seal?{N}Please tell me!{W1}"
		nextText $C0,$84        ; "I heard King Galam say{N}those words.{W2}"
		nextSingleText $C0,$84  ; "I just know that something{N}is being concealed.{W1}"
		loadMapFadeIn 17,52,1
		csWait 1
		playSound MUSIC_CASTLE
		fadeInB
		csWait 30
		setEntityDest $0,59,5
		entityShakeHead $0
		entityNod $0
		nextSingleText $0,$0    ; "(Yawn){W1}"
		setFacing $0,LEFT
		csWait 40
		setFacing $2,RIGHT
		textCursor $37C
		nextText $0,$2          ; "{LEADER}!{N}You finally woke up!{W2}"
		nextSingleText $0,$2    ; "We're talking about{N}Ground Seal.{N}Please, join in.{W1}"
		setFacing $2,LEFT
		csc_end
cs_52530:       textCursor $385
		setCamDest 48,0
		setFacing $0,DOWN
		nextSingleText $C0,$84  ; "What's wrong with the seal?{W1}"
		moveEntity $2,$FF,$2,$1
		endMove $8080
		nextSingleText $C0,$2   ; "Somebody broke the sacred{N}seal?{W1}"
		nextSingleText $0,$1    ; "We're not sure.{N}It seems that somebody{N}stole the two jewels.{W1}"
		setCamDest 43,0
		startEntity $5
		nextSingleText $0,$5    ; "...ancient...shrine...{N}two...jewels...!{W1}"
		moveEntity $85,$FF,$2,$1
		endMove $8080
		nextSingleText $0,$85   ; "Oh, you woke up!{N}Are you OK?{W1}"
		setFacing $0,LEFT
		setFacing $2,LEFT
		setFacing $3,LEFT
		setFacing $1,LEFT
		setFacing $4,LEFT
		setFacing $84,LEFT
		setFacing $85,LEFT
		moveEntity $5,$FF,$0,$1
		endMove $8080
		csWait 5
		setActscript $5,$0,eas_461B6
		csWait 30
		nextSingleText $0,$5    ; "Where...?{N}...I...why am I...?{W1}"
		setFacing $5,DOWN
		nextText $C0,$84        ; "This is a jail in the{N}basement of Galam Castle.{W2}"
		nextSingleText $C0,$84  ; "Say, you mustn't move yet!{W1}"
		entityShakeHead $5
		csWait 30
		nextSingleText $0,$5    ; "Yes, I remember!{N}I was caught by Galam{N}soldiers.{W1}"
		setFacing $85,UP
		nextSingleText $0,$85   ; "They took my jewels and{N}brought me here!{W1}"
		entityShiver $5
		nextSingleText $0,$5    ; "They...they killed my{N}friends!{W1}"
		customActscript $5,$FF
		dc.w $10                ;   0010 SET SPEED X=$E Y=$E
		dc.b $E
		dc.b $E
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $5,$FF,$3,$1
		moreMove $C,$28
		moreMove $2,$1
		moreMove $C,$28
		moreMove $3,$1
		endMove $8080
		setFacing $5,UP
		customActscript $5,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $2
		dc.w 2
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		stopEntity $5
		setFacing $85,LEFT
		csWait 50
		nextSingleText $0,$5    ; "Ouch!{N}I can hardly move.{W1}"
		moveEntity $85,$FF,$2,$1
		endMove $8080
		nextSingleText $0,$85   ; "Stay here for a while.{N}You need to rest.{W1}"
		csWait 20
		moveEntity $85,$FF,$0,$2
		endMove $8080
		setCamDest 47,0
		setFacing $1,RIGHT
		setFacing $85,RIGHT
		setFacing $0,DOWN
		setFacing $3,DOWN
		setFacing $4,DOWN
		setFacing $84,DOWN
		nextText $C0,$84        ; "What were we talking{N}about?{W2}"
		nextSingleText $C0,$84  ; "Oh, yes.  Why is King Galam{N}interested in Ground Seal?{W1}"
		nextSingleText $0,$1    ; "Is it related to the opened{N}door?{W1}"
		nextSingleText $0,$5    ; "Hey!{W1}"
		customActscript $5,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $0
		dc.w 0
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		entitySprite $5,$3B
		csWait 20
		nextSingleText $0,$4    ; "Does he want the jewels?{W1}"
		nextSingleText $0,$5    ; "What?{W1}"
		entityShiver $5
		csWait 20
		nextSingleText $0,$3    ; "The man that broke the seal{N}is to blame for everything!{W1}"
		nextSingleText $0,$5    ; "Oh, no!{W1}"
		entityShiver $5
		moveEntity $85,$FF,$2,$1
		endMove $8080
		nextSingleText $0,$85   ; "Are you OK?{N}You know something?{W1}"
		nextSingleText $0,$5    ; "Uhh...nope!{W1}"
		entityShiver $5
		nextText $0,$4          ; "We can't stay here!{W2}"
		setFacing $1,RIGHT
		nextSingleText $0,$4    ; "We must escape!{W1}"
		moveEntity $85,$FF,$0,$1
		endMove $8080
		nextText $0,$1          ; "I know, but how can we{N}open that locked door?{W2}"
		nextSingleText $0,$1    ; "Oh, Galam is invading{N}Granseal while we're{N}sitting here!{W1}"
		setCamDest 43,0
		setActscript $5,$FF,eas_Init
		startEntity $5
		entitySprite $5,$5
		setActscript $5,$FF,eas_Jump
		moveEntity $5,$FF,$0,$1
		endMove $8080
		nextSingleText $0,$5    ; "I'll open the door for you!{W1}"
		setCameraEntity $5
		moveEntity $85,$FF,$2,$1
		endMove $8080
		setFacing $1,DOWN
		nextSingleText $0,$85   ; "Oh, yes!  You're a thief and{N}you can open locked doors.{W1}"
		nextSingleText $0,$5    ; "Yes, of course!{N}I'm the great thief, {NAME;5}!{W1}"
		moveEntity $5,$FF,$2,$1
		moreMove $3,$1
		endMove $8080
		setFacing $5,DOWN
		nextSingleText $FF,$FF  ; "{NAME;5} sticks a short wire{N}into the keyhole.{W1}"
		playSound SFX_SECRET_PATH_ROCK
		setBlocks 48,7,1,1,48,8
		setBlocks 62,20,1,2,48,20
		textCursor $3A3
		moveEntity $5,$FF,$3,$2
		moreMove $0,$9
		endMove $8080
		setFacing $5,UP
		nextSingleText $FF,$FF  ; "{NAME;5} sticks a short wire{N}into the keyhole.{W1}"
		playSound SFX_SECRET_PATH_ROCK
		setBlocks 57,7,1,1,57,8
		setBlocks 62,20,1,2,57,20
		moveEntity $5,$FF,$1,$2
		endMove $8080
		nextSingleText $C0,$5   ; "OK, it's done.{N}Hurry to your country and{N}save them!{W1}"
		moveEntity $2,$FF,$0,$1
		endMove $8080
		setFacing $2,DOWN
		nextText $0,$2          ; "Thank you!{W2}"
		setFacing $2,LEFT
		nextSingleText $0,$2    ; "{LEADER}, let's get back{N}to Granseal!{W1}"
		csWait 30
		setActscript $0,$0,eas_Jump
		setActscript $3,$0,eas_Jump
		setActscript $4,$FF,eas_Jump
		setActscript $0,$0,eas_Jump
		setActscript $3,$0,eas_Jump
		setActscript $4,$FF,eas_Jump
		csWait 30
		nextSingleText $0,$1    ; "Why are you being so nice{N}to us?  You don't know us.{W1}"
		entityShiver $5
		csWait 5
		setActscript $5,$0,eas_461B6
		nextSingleText $C0,$5   ; "Ah, that's because...{N}well...{W1}"
		csWait 20
		setFacing $5,UP
		setActscript $5,$FF,eas_46172
		customActscript $5,$FF
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $5,$0,$3,$2
		moreMove $2,$1
		endMove $8080
		moveEntity $1,$FF,$2,$3
		moreMove $3,$4
		moreMove $0,$4
		endMove $8080
		setFacing $5,LEFT
		nextSingleText $0,$1    ; "Is it...?{N}Are you the thief who broke{N}the seal?{W1}"
		entityShiver $5
		nextSingleText $C0,$5   ; "I...ah...{W1}"
		moveEntity $1,$FF,$0,$3
		endMove $8080
		nextText $0,$1          ; "You are!{W2}"
		nextSingleText $0,$1    ; "Hey, you!{N}Do you know what you've done?{W1}"
		setActscript $1,$0,eas_BumpRight
		moveEntity $5,$FF,$0,$1
		endMove $8080
		nextSingleText $0,$1    ; "A big problem was created{N}because you stole the{N}jewels!{W1}"
		customActscript $1,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $1,$FF,$0,$1
		endMove $8080
		setActscript $1,$0,eas_BumpRight
		customActscript $5,$FF
		dc.w $10                ;   0010 SET SPEED X=$E Y=$E
		dc.b $E
		dc.b $E
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $5,$FF,$0,$1
		endMove $8080
		customActscript $5,$FF
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $5,$FF,$0,$1
		endMove $8080
		stopEntity $5
		setFacing $5,UP
		entitySprite $5,$3B
		csWait 40
		nextText $0,$1          ; "I know the thief {NAME;5}{N}always steals for poor{N}people, but you made a{W2}"
		nextText $0,$1          ; "serious mistake this time!!{W2}"
		nextSingleText $0,$1    ; "All these disasters...{N}everything is YOUR fault!{W1}"
		nextSingleText $C0,$5   ; "I didn't mean to...{W1}"
		moveEntity $1,$FF,$0,$1
		moreMove $1,$2
		moreMove $2,$4
		endMove $8080
		setFacing $1,UP
		nextSingleText $0,$1    ; "That's enough!{N}{LEADER}, let's go!{W1}"
		followEntity $3,$0,$2
		followEntity $4,$3,$2
		followEntity $2,$4,$2
		followEntity $1,$2,$2
		csc_end
cs_528CA:       moveEntity $0,$FF,$0,$1
		endMove $8080
		csc_end
cs_528D4:       textCursor $3B3
		nextSingleText $0,$5    ; "Wait!{W1}"
		setCamDest 50,3
		csWait 30
		setActscript $5,$FF,eas_Init
		startEntity $5
		entitySprite $5,$5
		moveEntity $5,$FF,$2,$2
		endMove $8080
		nextText $0,$5          ; "You'll be captured if you go{N}that way.{W2}"
		nextSingleText $0,$5    ; "I know this castle very{N}well.  I know a short cut.{W1}"
		moveEntity $5,$FF,$1,$4
		endMove $8080
		csWait 30
		nextSingleText $FF,$FF  ; "{NAME;5} pulls up some tiles{N}with a short wire.{W1}"
		csWait 30
		playSound SFX_DOOR_OPEN
		setBlocks 63,2,1,1,57,4
		csWait 20
		moveEntity $5,$FF,$0,$1
		moreMove $1,$1
		endMove $8080
		setFacing $5,DOWN
		nextSingleText $0,$5    ; "Now, go out through this{N}short cut!{W1}"
		csc_end
cs_52938:       textCursor $3B8
		moveEntity $5,$FF,$3,$1
		endMove $8080
		setFacing $5,LEFT
		setFacing $0,RIGHT
		nextText $0,$5          ; "You're right.  I did it.{W2}"
		nextText $0,$5          ; "But, I didn't know all this{N}would happen.{W2}"
		nextSingleText $0,$5    ; "Please take me with you.{W1}"
		nextSingleText $FF,$FF  ; "{CLEAR}{LEADER} decides to take{N}{NAME;5} with him.{W1}{CLEAR}"
		setActscript $5,$FF,eas_Jump
		setActscript $5,$0,eas_Jump
		nextText $0,$5          ; "Thanks.  I promise to help{N}you.{W2}"
		nextSingleText $0,$5    ; "This tunnel leads to the{N}kitchen.{N}We can escape safely.{W1}"
		moveEntity $0,$FF,$1,$1
		endMove $8080
		fadeOutB
		reloadMap 24,14
		setActscript $1,$FF,eas_Init
		setActscript $2,$FF,eas_Init
		setActscript $3,$FF,eas_Init
		setActscript $4,$FF,eas_Init
		setActscript $5,$FF,eas_Init
		hideEntity $1
		hideEntity $2
		hideEntity $3
		hideEntity $4
		setPos $0,29,12,DOWN
		setPos $5,29,11,DOWN
		stopEntity $0
		stopEntity $5
		fadeInB
		customActscript $0,$FF
		dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
		dc.b $10
		dc.b $10
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $5,$FF
		dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
		dc.b $10
		dc.b $10
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $0,$0,eas_RotateRight
		setActscript $5,$0,eas_RotateRight
		setEntityDest $8000,29,18
		setEntityDest $5,29,17
		setFacing $0,DOWN
		setFacing $5,DOWN
		startEntity $0
		startEntity $5
		setActscript $0,$FF,eas_Init
		setActscript $5,$FF,eas_Init
		followEntity $5,$0,$2
		csc_end
cs_52A3C:       setActscript $0,$FF,eas_Init
		setFacing $83,LEFT
		textCursor $3BE
		nextText $0,$83         ; "Hey, it's noisy next door.{W2}"
		nextSingleText $0,$83   ; "It sounds like...{N}Mr. {NAME;28} and the King{N}are arguing.{W1}"
		csWait 20
		setFacing $83,RIGHT
		nextText $0,$83         ; "Who are you?{W2}"
		nextSingleText $0,$83   ; "Now, I have to get back{N}to work.{W1}"
		csWait 20
		moveEntity $0,$FF,$0,$1
		endMove $8080
		setFacing $0,LEFT
		csWait 20
		moveEntity $83,$FF,$0,$1
		moreMove $1,$1
		moreMove $0,$1
		endMove $8080
		csc_end
