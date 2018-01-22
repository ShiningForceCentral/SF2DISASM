
; ASM FILE data\maps\entries\map10\mapsetups\s6_2D2.asm :
; 0x5708E..0x579CA : 

; =============== S U B R O U T I N E =======================================

ms_map10_flag2D2_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $31F               ; set after you agree to kill Zeon in Bedoe (King's yes/no dialog)
		beq.s   loc_5709E
		move.w  #$A,d0
		jsr     MoveEntityOutOfMap
loc_5709E:
		trap    #CHECK_FLAG
		dc.w $2D4               ; set after the scene where Skreech falls in Bedoe
		beq.s   return_570AE
		move.w  #$98,d0 
		jsr     MoveEntityOutOfMap
return_570AE:
		rts

	; End of function ms_map10_flag2D2_InitFunction

cs_570B0:       textCursor $650
		reloadMap 6,19
		setPos $0,11,25,UP
		setPos $7,11,26,UP
		setPos $96,10,21,RIGHT
		setPos $97,13,21,LEFT
		setActscript $7,$FF,eas_Init
		setActscript $0,$FF,eas_Init
		customActscript $96,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $97,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		fadeInB
		csWait 30
		moveEntity $96,$FF,$0,$1
		moreMove $B,$1
		endMove $8080
		nextSingleText $0,$96   ; "Who are you?{W1}"
		moveEntity $97,$FF,$2,$1
		moreMove $B,$1
		endMove $8080
		nextSingleText $0,$97   ; "Bedoe is only for birdmen!{W1}"
		moveEntity $7,$FF,$0,$1
		moreMove $1,$1
		endMove $8080
		nextSingleText $0,$7    ; "Don't be so uppity!{W1}"
		setActscript $96,$0,eas_Jump
		setActscript $97,$FF,eas_Jump
		setActscript $96,$0,eas_Jump
		setActscript $97,$FF,eas_Jump
		csWait 30
		moveEntity $96,$FF,$3,$1
		endMove $8080
		nextSingleText $0,$96   ; "Oh, you're...{W1}"
		moveEntity $97,$FF,$3,$1
		endMove $8080
		nextText $0,$97         ; "Sir {NAME;7}!{N}Sorry, Sir {NAME;7}!{W2}"
		nextSingleText $0,$97   ; "Welcome back!{N}Volcanon is waiting!{W1}"
		moveEntity $7,$FF,$1,$1
		endMove $8080
		csWait 30
		csWait 5
		setActscript $7,$0,eas_461B6
		csWait 120
		moveEntity $7,$FF,$0,$2
		endMove $8080
		nextSingleText $0,$7    ; "That's strange...{W2}"
		moveEntity $7,$FF,$2,$4
		endMove $8080
		nextSingleText $0,$7    ; "I just realized...{N}Why are you flying guard?{W2}"
		moveEntity $7,$FF,$0,$2
		moreMove $9,$A
		endMove $8080
		nextSingleText $0,$7    ; "Did something happen?{W1}"
		nextSingleText $0,$97   ; "Well, the devils invaded{N}recently.{W1}"
		customActscript $7,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $7,$FF,$1,$1
		endMove $8080
		nextSingleText $0,$7    ; "Devils?{W1}"
		moveEntity $96,$FF,$3,$1
		moreMove $8,$1
		endMove $8080
		setFacing $7,LEFT
		nextText $0,$96         ; "Yes, the Devil Army.{W2}"
		nextText $0,$96         ; "Strong greater devils broke{N}Volcanon's sacred barrier.{W2}"
		nextSingleText $0,$96   ; "But don't worry, Volcanon{N}defeated all the devils.{W1}"
		setActscript $7,$FF,eas_Init
		moveEntity $7,$FF,$3,$2
		moreMove $A,$1
		endMove $8080
		setFacing $0,RIGHT
		nextSingleText $0,$7    ; "The devils we fought must{N}have been part of that army!{W1}"
		setFacing $96,DOWN
		moveEntity $97,$FF,$3,$1
		endMove $8080
		nextSingleText $0,$96   ; "You met some other devils?{W1}"
		setFacing $96,RIGHT
		setFacing $97,LEFT
		entityNod $96
		entityNod $97
		setFacing $96,DOWN
		setFacing $97,DOWN
		customActscript $96,$FF
		dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
		dc.b 8
		dc.b 8
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $97,$FF
		dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
		dc.b 8
		dc.b 8
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $96,$FF,eas_46172
		setActscript $97,$FF,eas_46172
		moveEntity $96,$0,$1,$1
		endMove $8080
		moveEntity $97,$FF,$1,$1
		endMove $8080
		customActscript $96,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $97,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $96,$0,$2,$1
		moreMove $3,$5
		endMove $8080
		moveEntity $97,$0,$0,$1
		moreMove $3,$5
		endMove $8080
		csWait 30
		setFacing $0,DOWN
		setFacing $7,DOWN
		setActscript $7,$FF,eas_Jump
		setActscript $7,$FF,eas_Jump
		nextText $0,$7          ; "Stop, stop!{W2}"
		setFacing $96,RIGHT
		setFacing $97,LEFT
		nextSingleText $0,$7    ; "We already defeated them.{W1}"
		entityNod $0
		setCamDest 6,22
		customActscript $96,$FF
		dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
		dc.b 8
		dc.b 8
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $97,$FF
		dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
		dc.b 8
		dc.b 8
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $96,$0,$3,$1
		endMove $8080
		moveEntity $97,$FF,$3,$1
		endMove $8080
		setActscript $96,$FF,eas_Init
		setActscript $97,$FF,eas_Init
		moveEntity $96,$FF,$0,$1
		moreMove $9,$1
		endMove $8080
		nextSingleText $0,$96   ; "That's great!  But...{W2}"
		moveEntity $97,$FF,$2,$1
		moreMove $9,$1
		endMove $8080
		nextSingleText $0,$97   ; "We'll go and make sure...{W1}"
		setFacing $96,RIGHT
		setFacing $97,LEFT
		nextSingleText $0,$96   ; "Just in case.{W1}"
		entityNod $97
		setFacing $96,UP
		setFacing $97,UP
		nextText $0,$97         ; "We're going to Polca Village{N}to patrol.{W2}"
		nextSingleText $0,$97   ; "{NAME;7}, please see{N}King Bedoe.{W1}"
		setFacing $96,DOWN
		setFacing $97,DOWN
		customActscript $96,$FF
		dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
		dc.b 8
		dc.b 8
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $97,$FF
		dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
		dc.b 8
		dc.b 8
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $96,$FF,eas_46172
		setActscript $97,$FF,eas_46172
		moveEntity $96,$0,$1,$1
		endMove $8080
		moveEntity $97,$FF,$1,$1
		endMove $8080
		csWait 50
		customActscript $96,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $97,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $96,$0,$3,$5
		endMove $8080
		moveEntity $97,$FF,$3,$5
		endMove $8080
		csWait 40
		setFacing $7,LEFT
		setFacing $0,RIGHT
		nextText $0,$7          ; "{LEADER}, let's go.{W2}"
		nextSingleText $0,$7    ; "I'll introduce you to{N}King Bedoe.{W1}"
		followEntity $7,$0,$2
		setPos $96,34,51,UP
		setPos $97,35,51,UP
		csc_end
cs_573EC:       textCursor $669
		setCamDest 31,47
		nextText $0,$94         ; "Yes, the greater devil was{N}very strong.{W1}"
		nextSingleText $0,$94   ; "But, God Volcanon swept{N}away all the devils.{W1}"
		nextSingleText $0,$93   ; "What about the greater{N}devil?{W1}"
		moveEntity $94,$FF,$2,$1
		moreMove $9,$1
		endMove $8080
		nextSingleText $0,$94   ; "He fled.{W1}"
		nextText $0,$93         ; "Can't you track him?{W2}"
		nextSingleText $0,$93   ; "We must capture him before{N}he regains his strength.{W1}"
		nextSingleText $0,$94   ; "Did they come from Grans{N}Island?{W1}"
		entityNod $93
		nextText $0,$93         ; "I think so.{W2}"
		nextText $0,$93         ; "Maybe he died.{N}But beware of another attack.{W2}"
		csWait 10
		setFacing $94,DOWN
		nextSingleText $0,$93   ; "Watch carefully!{W1}"
		csWait 40
		moveEntity $96,$0,$3,$1
		moreMove $2,$3
		moreMove $3,$3
		endMove $8080
		moveEntity $98,$0,$3,$1
		moreMove $0,$5
		endMove $8080
		moveEntity $99,$0,$0,$2
		moreMove $3,$3
		endMove $8080
		moveEntity $9A,$0,$0,$1
		moreMove $3,$3
		endMove $8080
		moveEntity $9B,$0,$0,$2
		moreMove $3,$3
		endMove $8080
		moveEntity $9C,$0,$0,$2
		moreMove $3,$3
		endMove $8080
		moveEntity $97,$FF,$3,$1
		moreMove $2,$4
		moreMove $3,$3
		endMove $8080
		hideEntity $96
		hideEntity $97
		hideEntity $98
		hideEntity $99
		hideEntity $9A
		hideEntity $9B
		hideEntity $9C
		moveEntity $94,$FF,$0,$1
		moreMove $B,$1
		endMove $8080
		csc_end
cs_574A6:       textCursor $673
		setCamDest 34,47
		moveEntity $A,$FF,$3,$1
		moreMove $A,$1
		endMove $8080
		setActscript $A,$FF,eas_Jump
		setActscript $A,$FF,eas_Jump
		nextSingleText $80,$A   ; "{NAME;7}, {NAME;7}!{W1}"
		setPos $7,33,52,RIGHT
		setPos $0,33,53,RIGHT
		setCamDest 31,47
		moveEntity $7,$FF,$0,$3
		endMove $8080
		nextText $0,$7          ; "{NAME;10}, how have you been?{W2}"
		setFacing $7,UP
		nextSingleText $0,$7    ; "King Bedoe, you look well.{W1}"
		customActscript $93,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $93,$FF,$3,$1
		endMove $8080
		nextSingleText $80,$93  ; "{NAME;7}, my friend, how{N}was your journey?{W1}"
		moveEntity $7,$FF,$1,$1
		endMove $8080
		csWait 30
		entityNod $7
		csWait 20
		setFacing $7,LEFT
		csWait 30
		setFacing $7,UP
		nextSingleText $0,$7    ; "Let me introduce my friend.{W1}"
		moveEntity $7,$FF,$3,$2
		moreMove $2,$2
		endMove $8080
		csWait 40
		entityNod $0
		moveEntity $7,$0,$0,$3
		moreMove $9,$1
		endMove $8080
		moveEntity $0,$FF,$0,$3
		moreMove $9,$1
		endMove $8080
		entityNod $0
		nextSingleText $0,$7    ; "This is {LEADER}.{N}He's from Grans and...{W1}"
		moveEntity $A,$FF,$3,$1
		moreMove $A,$1
		endMove $8080
		setFacing $7,RIGHT
		setFacing $0,RIGHT
		nextSingleText $80,$A   ; "I know.  He is a pupil of{N}Astral of Granseal.{W1}"
		setActscript $7,$FF,eas_Jump
		setActscript $7,$FF,eas_Jump
		nextSingleText $0,$7    ; "How do you know that?{W1}"
		nextSingleText $80,$A   ; "Sir Astral told me.{W1}"
		nextSingleText $0,$7    ; "What?!  Did you go to{N}Granseal?{W1}"
		entityNod $A
		nextSingleText $80,$A   ; "As Volcanon's messenger.{W1}"
		moveEntity $93,$FF,$3,$1
		endMove $8080
		setFacing $A,UP
		setFacing $7,UP
		setFacing $0,UP
		nextText $80,$93        ; "And I heard that somebody{N}unsealed Zeon.{W2}"
		nextText $80,$93        ; "Grans people caused a big,{N}big problem.{W2}"
		customActscript $93,$FF
		dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
		dc.b $10
		dc.b $10
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $93,$FF,$1,$2
		moreMove $B,$1
		endMove $8080
		nextSingleText $80,$93  ; "Zeon might destroy the{N}world...{W1}"
		moveEntity $7,$FF,$1,$1
		moreMove $2,$1
		moreMove $9,$1
		endMove $8080
		nextSingleText $0,$7    ; "Sorry to interrupt, but is{N}he that strong?{W1}"
		nextSingleText $80,$93  ; "Zeon is King of the Devils.{W1}"
		moveEntity $94,$FF,$3,$1
		endMove $8080
		nextText $0,$94         ; "{NAME;7}, you had better{N}go see Volcanon.{W2}"
		nextSingleText $0,$94   ; "It may calm him down to see{N}{NAME;7}.{W1}"
		nextSingleText $0,$7    ; "Oh, is he angry?{N}Maybe later...{W1}"
		moveEntity $A,$FF,$1,$1
		moreMove $2,$1
		endMove $8080
		setFacing $7,RIGHT
		nextSingleText $80,$A   ; "Never mind later.{N}He has been waiting for you.{W1}"
		nextText $0,$7          ; "Oh, yeah?  OK, I'm going.{W2}"
		setFacing $7,DOWN
		nextSingleText $0,$7    ; "{LEADER}, follow me.{W1}"
		setActscript $93,$FF,eas_Init
		moveEntity $93,$FF,$3,$1
		endMove $8080
		nextSingleText $80,$93  ; "{NAME;7}, are you taking{N}{LEADER} with you?{W1}"
		setFacing $7,UP
		setFacing $A,UP
		nextSingleText $0,$7    ; "Of course.  Why not?{W1}"
		nextSingleText $80,$93  ; "He thinks the people of{N}Granseal are...{W1}"
		moveEntity $94,$FF,$2,$1
		moreMove $9,$1
		endMove $8080
		nextText $0,$94         ; "King Bedoe, I think{N}{LEADER} has to see{N}Volcanon.{W2}"
		nextSingleText $0,$94   ; "He should talk to him.{W1}"
		entityNod $93
		nextSingleText $80,$93  ; "Hmmm...you're right.{N}{NAME;7}, go ahead.{W1}"
		setFacing $94,DOWN
		setFacing $A,DOWN
		setFacing $7,DOWN
		nextSingleText $0,$7    ; "OK.{N}Anyway, let's go.{W1}"
		followEntity $7,$0,$2
		csc_end
cs_5766C:       textCursor $690
		setCameraEntity $99
		nextText $0,$99         ; "I had a dream last night.{N}I flew!{W2}"
		nextSingleText $0,$99   ; "Watch!  I can fly!{W1}"
		setFacing $99,RIGHT
		csWait 40
		entityNod $99
		moveEntity $99,$FF,$E,$1
		endMove $8080
		entitySprite $99,$B6
		setActscript $99,$FF,eas_46172
		customActscript $99,$FF
		dc.w $10                ;   0010 SET SPEED X=$4 Y=$4
		dc.b 4
		dc.b 4
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $99,$FF,$1,$1
		endMove $8080
		customActscript $99,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		playSound SFX_FALLING
		moveEntity $99,$FF,$3,$6
		endMove $8080
		entitySprite $99,$E6
		nextSingleText $0,$99   ; "Hmmm...strange...{W1}"
		setActscript $99,$FF,eas_Init
		moveEntity $99,$FF,$2,$2
		moreMove $9,$1
		endMove $8080
		setFacing $0,DOWN
		setFacing $7,DOWN
		nextText $0,$99         ; "That didn't work.  Hee, hee.{W2}"
		nextSingleText $0,$99   ; "Stay there.{N}I know I can fly!{W1}"
		setFacing $99,RIGHT
		csWait 40
		entityNod $99
		cameraSpeed $40
		moveEntity $99,$FF,$0,$1
		moreMove $E,$1
		endMove $8080
		entitySprite $99,$B6
		setActscript $99,$FF,eas_46172
		moveEntity $99,$FF,$3,$1
		endMove $8080
		customActscript $99,$FF
		dc.w $10                ;   0010 SET SPEED X=$4 Y=$4
		dc.b 4
		dc.b 4
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $99,$FF,$1,$1
		endMove $8080
		customActscript $99,$FF
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		playSound SFX_FALLING
		moveEntity $99,$FF,$3,$8
		endMove $8080
		setActscript $99,$0,eas_464E2
		startEntity $99
		csWait 12
		cameraSpeed $20
		setActscript $99,$FF,eas_Init2
		moveEntity $99,$FF,$1,$2
		moreMove $0,$1
		moreMove $1,$B
		endMove $8080
		setFacing $99,LEFT
		entitySprite $99,$E6
		setFacing $0,RIGHT
		setFacing $7,RIGHT
		nextSingleText $0,$99   ; "See.  I told you!{N}I can fly...sort of.{W1}"
		csc_end
cs_5779C:       textCursor $696
		setPos $99,6,10,DOWN
		setFacing $98,UP
		setCamDest 1,5
		setActscript $7,$FF,eas_Init
		setPos $0,5,22,DOWN
		setPos $7,11,22,UP
		moveEntity $7,$0,$C,$3C
		moreMove $2,$4
		endMove $8080
		setFacing $0,UP
		setActscript $99,$FF,eas_46198
		setActscript $99,$FF,eas_46172
		playSound SFX_JUMP
		moveEntity $99,$FF,$1,$2
		moreMove $9,$5
		moreMove $3,$2
		endMove $8080
		nextSingleText $0,$99   ; "Ha, ha, ha!{W1}"
		csWait 40
		playSound SFX_JUMP
		moveEntity $99,$FF,$1,$2
		moreMove $9,$5
		moreMove $3,$2
		endMove $8080
		nextSingleText $0,$99   ; "Ha, ha, ha!{W1}"
		csWait 40
		playSound SFX_JUMP
		moveEntity $99,$FF,$1,$2
		moreMove $9,$5
		moreMove $3,$1
		endMove $8080
		setActscript $99,$FF,eas_Init
		moveEntity $99,$FF,$F,$1
		endMove $8080
		setFacing $99,UP
		setFacing $98,LEFT
		setCameraEntity $99
		cameraSpeed $30
		nextSingleText $0,$98   ; "Oh my, {NAME;20}!{W1}"
		setPriority $0,$0
		setPriority $99,$FFFF
		setActscript $99,$FF,eas_46172
		customActscript $99,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		playSound SFX_FALLING
		moveEntity $99,$0,$3,$D
		endMove $8080
		setFacing $7,LEFT
		setPriority $0,$0
		setPriority $99,$FFFF
		csWait 35
		customActscript $98,$FF
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $98,$0,$2,$1
		moreMove $3,$B
		endMove $8080
		waitIdle $99
		setQuake 3
		setFacing $0,UP
		customActscript $0,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $2
		dc.w 2
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		csWait 40
		setQuake 0
		setActscript $99,$FF,eas_Init
		setFacing $99,DOWN
		setActscript $99,$FF,eas_Jump
		csWait 20
		setActscript $99,$FF,eas_Jump
		csWait 20
		setActscript $99,$FF,eas_Jump
		csWait 20
		setActscript $99,$FF,eas_Jump
		csWait 20
		setFacing $99,UP
		setCameraEntity $FFFF
		setActscript $98,$FF,eas_Jump
		setActscript $98,$FF,eas_Jump
		nextSingleText $0,$98   ; "Thank you!  Thank you!{N}{NAME;20} is OK.{W1}"
		entityNod $98
		csWait 30
		setActscript $98,$FF,eas_Init
		setActscript $99,$FF,eas_Init
		moveEntity $98,$0,$0,$8
		endMove $8080
		moveEntity $99,$FF,$1,$1
		moreMove $0,$8
		endMove $8080
		hideEntity $98
		setPos $99,16,6,LEFT
		moveEntity $7,$FF,$2,$1
		endMove $8080
		csWait 30
		setActscript $7,$FF,eas_BumpLeft
		setActscript $0,$FF,eas_Init
		setFacing $0,DOWN
		entityShakeHead $0
		setPriority $0,$FFFF
		followEntity $7,$0,$2
		csc_end
cs_5797A:       textCursor $647
		faceEntity $7,$93
		nextText $0,$93         ; "You're a man of honor!{N}Why don't you go see Creed?{W2}"
		nextText $0,$93         ; "He's an ex-greater devil.{N}He may give you some{N}information.{W2}"
		nextText $0,$93         ; "You must travel along the{N}river to get to Creed's{N}mansion.{W2}"
		nextSingleText $0,$93   ; "Maybe Polca has a raft for{N}you.{W1}"
		setFacing $93,RIGHT
		nextSingleText $0,$93   ; "Tell the mayor to prepare a{N}raft.{W1}"
		moveEntity $A,$FF,$1,$2
		moreMove $A,$1
		endMove $8080
		nextSingleText $0,$A    ; "Yes, sir!{W1}"
		moveEntity $A,$FF,$3,$3
		moreMove $0,$1
		moreMove $3,$4
		endMove $8080
		hideEntity $A
		faceEntity $93,$7
		nextText $0,$93         ; "{NAME;7}, please{N}help {LEADER}.{W2}"
		nextSingleText $0,$93   ; "{LEADER}, good luck!{W1}"
		csc_end
