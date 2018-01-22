
; ASM FILE data\battles\entries\battle28\cs_afterbattle.asm :
; 0x4C07C..0x4C3DC : Cutscene after battle 28
abcs_battle28:  textCursor $A6E
		loadMapFadeIn $2F,$7,$19
		loadMapEntities ce_4C3B4
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		entityPosDir $7,$D,$1C,$3
		setActscript $1F,$FF,eas_Init
		entityPosDir $1F,$B,$1C,$3
		stopEntity $80
		stopEntity $82
		setPriority $1F,$0
		setPriority $7,$0
		setPriority $80,$FFFF
		fadeInB
		csWait $39
		setFacing $7,$2
		nextSingleText $0,$7    ; "Phew!  That was close!{W1}"
		nextText $0,$80         ; "Thank you very much.{W2}"
		nextSingleText $0,$80   ; "Excuse me, will you help{N}me up?{W1}"
		moveEntity $0,$FF,$3,$1
		endMove $8080
		moveEntity $1F,$0,$3,$1
		moreMove $0,$1
		endMove $8080
		csWait $F
		setActscript $0,$FF,eas_JumpRight
		waitIdle $1F
		setFacing $1F,$3
		nextSingleText $0,$1F   ; "NO!  I'll do it!{W1}"
		moveEntity $1F,$FF,$3,$1
		endMove $8080
		setFacing $1F,$1
		nextText $0,$1F         ; "We'll take you with us.{W2}"
		nextSingleText $0,$1F   ; "Tristan is the nearest town.{N}I think you had better rest{N}there.{W1}"
		nextSingleText $0,$80   ; "Thank you, sir.{W1}"
		entitySprite $80,$C5
		moveEntity $80,$0,$1,$2
		endMove $8080
		csWait $E
		setActscript $80,$FF,eas_461AA
		moveEntity $7,$FF,$2,$1
		moreMove $3,$1
		endMove $8080
		nextText $0,$7          ; "You sure are being nice.{N}Hmmm....{W2}"
		nextSingleText $0,$7    ; "Anyway, Tristan is just over{N}there.  Let's go.{W1}"
		moveEntity $0,$0,$0,$1
		endMove $8080
		moveEntity $81,$FF,$0,$1
		moreMove $3,$2
		endMove $8080
		setCamDest $A,$19
		moveEntity $0,$0,$0,$2
		moreMove $3,$1
		moreMove $0,$2
		endMove $8080
		moveEntity $81,$0,$0,$3
		moreMove $3,$1
		moreMove $0,$1
		endMove $8080
		moveEntity $7,$FF,$0,$4
		moreMove $3,$1
		endMove $8080
		nextSingleText $0,$1F   ; "{LEADER}...{NAME;7}...{W1}"
		setFacing $0,$2
		setFacing $7,$2
		nextSingleText $0,$7    ; "What?  Don't you want to{N}go to Tristan?{W1}"
		csWait $3C
		nextSingleText $0,$1F   ; "Oh, I do, but...{W1}"
		nextSingleText $0,$80   ; "We shouldn't go to Tristan{N}right now.{W1}"
		setActscript $7,$FF,eas_Jump
		nextSingleText $0,$7    ; "Why not?{W1}"
		nextSingleText $0,$80   ; "Because of me!{W1}"
		setCamDest $8,$19
		entityFlashWhite $80,$28
		flashScreenWhite $14
		entityPosDir $80,$B,$1E,$0
		entitySprite $80,$AF
		setFacing $80,$1
		csWait $8
		setFacing $80,$2
		csWait $8
		setFacing $80,$3
		csWait $8
		entitySprite $80,$9C
		setFacing $80,$0
		startEntity $80
		setActscript $0,$0,eas_Jump
		setActscript $7,$FF,eas_Jump
		moveEntity $7,$0,$2,$1
		endMove $8080
		moveEntity $0,$FF,$3,$1
		moreMove $2,$3
		endMove $8080
		nextText $0,$7          ; "Wh...who are you?!{W2}"
		nextSingleText $0,$7    ; "Are you a devil?{W1}"
		nextSingleText $C0,$80  ; "I'm one of the leaders of{N}the Devil Army.{N}My name is Cameela!{W1}"
		nextSingleText $0,$1F   ; "What do you want?{W1}"
		nextSingleText $C0,$80  ; "{LEADER}, I came here{N}to get your Jewel of Evil!{W1}"
		setFacing $1F,$2
		nextText $0,$1F         ; "Zeon told US to bring it to{N}the Ancient Tower.{N}He didn't mention you.{W2}"
		nextSingleText $0,$1F   ; "And since we've never heard{N}of you, you're not getting{N}the jewel!{W1}"
		nextSingleText $C0,$80  ; "No!  His orders were...{W1}"
		nextSingleText $0,$1F   ; "If Zeon finds out, you will{N}be...{W1}"
		nextText $C0,$80        ; "He'll forgive me when I{N}bring him the jewel.{W2}"
		nextText $C0,$80        ; "Enough talking!  Hand over{N}that jewel.  In return, I'll{N}spare Sir Astral!{W2}"
		nextSingleText $C0,$80  ; "Do you want me to kill this{N}old man?{W1}"
		nextText $0,$1F         ; "The jewel can't be removed{N}from {LEADER}'s neck.{W2}"
		nextSingleText $0,$1F   ; "Do you really think that you{N}can kill me?{W1}"
		setActscript $80,$FF,eas_Jump
		nextSingleText $C0,$80  ; "Of course.{W1}"
		nextSingleText $0,$1F   ; "HA!{W1}"
		entityFlashWhite $1F,$28
		setActscript $80,$FF,eas_Jump
		nextSingleText $C0,$80  ; "Ooops!{W1}"
		setActscript $80,$FF,eas_46172
		moveEntity $80,$FF,$2,$1
		endMove $8080
		entityPosDir $82,$C,$1E,$2
		customActscript $82,$FF
		dc.w $10                ;   0010 SET SPEED X=$38 Y=$38
		dc.b $38
		dc.b $38
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $82,$FF,eas_46172
		customActscript $80,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $82,$0,$2,$8
		endMove $8080
		playSound SFX_JUMP
		csWait $A
		moveEntity $80,$FF,$1,$1
		endMove $8080
		moveEntity $80,$FF,$3,$1
		endMove $8080
		csWait $1E
		hideEntity $82
		nextSingleText $0,$1F   ; "Well done.  You dodged my{N}fireball.{W1}"
		nextText $C0,$80        ; "What a surprising old wizard!{W2}"
		nextText $C0,$80        ; "I didn't think I could obtain{N}the jewel that easily.{N}Ha, ha!{W2}"
		nextSingleText $C0,$80  ; "This is gonna be fun!{N}{LEADER}!{N}Keep it for a while.{W1}"
		setActscript $80,$FF,eas_Init
		cameraSpeed $30
		customActscript $80,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setCameraEntity $80
		csWait $28
		moveEntity $80,$FF,$1,$A
		endMove $8080
		csWait $28
		setCameraEntity $FFFF
		setCamDest $8,$1A
		setFacing $0,$1
		setFacing $7,$1
		moveEntity $1F,$FF,$1,$2
		endMove $8080
		nextSingleText $0,$1F   ; "Wait!{W1}"
		setFacing $80,$2
		setCamDest $7,$10
		moveEntity $80,$FF,$2,$1
		endMove $8080
		setFacing $80,$3
		nextSingleText $0,$80   ; "Be careful of Geshp and{N}Zalbard!{W1}"
		setActscript $80,$FF,eas_JumpLeft
		setActscript $80,$FF,eas_463AE
		setCamDest $8,$1A
		setFacing $1F,$3
		nextSingleText $0,$1F   ; "Ah, she's gone....{N}OK, {LEADER}.{N}Let's go to Tristan.{W1}"
		moveEntity $1F,$FF,$0,$1
		moreMove $3,$2
		endMove $8080
		setFacing $1F,$0
		setFacing $7,$2
		nextSingleText $0,$7    ; "Would you please explain{N}what just happened?{W1}"
		nextText $0,$1F         ; "You don't know?{W2}"
		nextText $0,$1F         ; "Everything here was set up{N}by Cameela.{W2}"
		nextSingleText $0,$1F   ; "It was a trap to get the{N}Jewel of Evil.{W1}"
		nextSingleText $0,$7    ; "Your fireball...as if you{N}knew what she was from the{N}beginning.{W1}"
		nextText $0,$1F         ; "Yes, I did.{W2}"
		nextText $0,$1F         ; "Her evil aura was apparent.{N}By the way, did you hear{N}what she said?{W2}"
		nextText $0,$1F         ; "They're all acting on their{N}own, ignoring Zeon's orders.{W2}"
		nextSingleText $0,$1F   ; "It will be dangerous.{N}We must be careful.{W1}"
		followEntity $81,$0,$2
		followEntity $1F,$81,$1
		followEntity $7,$81,$3
		mapSysEvent $FF,$10,$1E,$0
		csc_end
ce_4C3B4:       dc.w $C
		dc.w $1C
		dc.w 3
		dc.b $C
		dc.b $1F
		dc.b 1
		dc.b $B0
		dc.l eas_Init           
		dc.b $D
		dc.b $1C
		dc.b 3
		dc.b 7
		dc.l eas_Init           
		dc.b $C
		dc.b $1B
		dc.b 3
		dc.b $3E
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 2
		dc.b $B2
		dc.l eas_Init           
		dc.w $FFFF
