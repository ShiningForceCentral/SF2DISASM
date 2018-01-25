
; ASM FILE data\battles\entries\battle28\cs_afterbattle.asm :
; 0x4C07C..0x4C3DC : Cutscene after battle 28
abcs_battle28:  textCursor $A6E
		loadMapFadeIn 47,7,25
		loadMapEntities ce_4C3B4
		setActscriptWait $0,eas_Init
		setActscriptWait $7,eas_Init
		setPos $7,13,28,DOWN
		setActscriptWait $1F,eas_Init
		setPos $1F,11,28,DOWN
		stopEntity $80
		stopEntity $82
		setPriority $1F,$0
		setPriority $7,$0
		setPriority $80,$FFFF
		fadeInB
		csWait 57
		setFacing $7,LEFT
		nextSingleText $0,$7    ; "Phew!  That was close!{W1}"
		nextText $0,$80         ; "Thank you very much.{W2}"
		nextSingleText $0,$80   ; "Excuse me, will you help{N}me up?{W1}"
		entityActionsWait $0
		 moveDown 1
		endActions
		entityActions $1F
		 moveDown 1
		 moveRight 1
		endActions
		csWait 15
		setActscriptWait $0,eas_JumpRight
		waitIdle $1F
		setFacing $1F,DOWN
		nextSingleText $0,$1F   ; "NO!  I'll do it!{W1}"
		entityActionsWait $1F
		 moveDown 1
		endActions
		setFacing $1F,UP
		nextText $0,$1F         ; "We'll take you with us.{W2}"
		nextSingleText $0,$1F   ; "Tristan is the nearest town.{N}I think you had better rest{N}there.{W1}"
		nextSingleText $0,$80   ; "Thank you, sir.{W1}"
		entitySprite $80,$C5
		entityActions $80
		 moveUp 2
		endActions
		csWait 14
		setActscriptWait $80,eas_461AA
		entityActionsWait $7
		 moveLeft 1
		 moveDown 1
		endActions
		nextText $0,$7          ; "You sure are being nice.{N}Hmmm....{W2}"
		nextSingleText $0,$7    ; "Anyway, Tristan is just over{N}there.  Let's go.{W1}"
		entityActions $0
		 moveRight 1
		endActions
		entityActionsWait $81
		 moveRight 1
		 moveDown 2
		endActions
		setCamDest 10,25
		entityActions $0
		 moveRight 2
		 moveDown 1
		 moveRight 2
		endActions
		entityActions $81
		 moveRight 3
		 moveDown 1
		 moveRight 1
		endActions
		entityActionsWait $7
		 moveRight 4
		 moveDown 1
		endActions
		nextSingleText $0,$1F   ; "{LEADER}...{NAME;7}...{W1}"
		setFacing $0,LEFT
		setFacing $7,LEFT
		nextSingleText $0,$7    ; "What?  Don't you want to{N}go to Tristan?{W1}"
		csWait 60
		nextSingleText $0,$1F   ; "Oh, I do, but...{W1}"
		nextSingleText $0,$80   ; "We shouldn't go to Tristan{N}right now.{W1}"
		setActscriptWait $7,eas_Jump
		nextSingleText $0,$7    ; "Why not?{W1}"
		nextSingleText $0,$80   ; "Because of me!{W1}"
		setCamDest 8,25
		entityFlashWhite $80,$28
		flashScreenWhite $14
		setPos $80,11,30,RIGHT
		entitySprite $80,$AF
		setFacing $80,UP
		csWait 8
		setFacing $80,LEFT
		csWait 8
		setFacing $80,DOWN
		csWait 8
		entitySprite $80,$9C
		setFacing $80,RIGHT
		startEntity $80
		setActscript $0,eas_Jump
		setActscriptWait $7,eas_Jump
		entityActions $7
		 moveLeft 1
		endActions
		entityActionsWait $0
		 moveDown 1
		 moveLeft 3
		endActions
		nextText $0,$7          ; "Wh...who are you?!{W2}"
		nextSingleText $0,$7    ; "Are you a devil?{W1}"
		nextSingleText $C0,$80  ; "I'm one of the leaders of{N}the Devil Army.{N}My name is Cameela!{W1}"
		nextSingleText $0,$1F   ; "What do you want?{W1}"
		nextSingleText $C0,$80  ; "{LEADER}, I came here{N}to get your Jewel of Evil!{W1}"
		setFacing $1F,LEFT
		nextText $0,$1F         ; "Zeon told US to bring it to{N}the Ancient Tower.{N}He didn't mention you.{W2}"
		nextSingleText $0,$1F   ; "And since we've never heard{N}of you, you're not getting{N}the jewel!{W1}"
		nextSingleText $C0,$80  ; "No!  His orders were...{W1}"
		nextSingleText $0,$1F   ; "If Zeon finds out, you will{N}be...{W1}"
		nextText $C0,$80        ; "He'll forgive me when I{N}bring him the jewel.{W2}"
		nextText $C0,$80        ; "Enough talking!  Hand over{N}that jewel.  In return, I'll{N}spare Sir Astral!{W2}"
		nextSingleText $C0,$80  ; "Do you want me to kill this{N}old man?{W1}"
		nextText $0,$1F         ; "The jewel can't be removed{N}from {LEADER}'s neck.{W2}"
		nextSingleText $0,$1F   ; "Do you really think that you{N}can kill me?{W1}"
		setActscriptWait $80,eas_Jump
		nextSingleText $C0,$80  ; "Of course.{W1}"
		nextSingleText $0,$1F   ; "HA!{W1}"
		entityFlashWhite $1F,$28
		setActscriptWait $80,eas_Jump
		nextSingleText $C0,$80  ; "Ooops!{W1}"
		setActscriptWait $80,eas_46172
		entityActionsWait $80
		 moveLeft 1
		endActions
		setPos $82,12,30,LEFT
		customActscriptWait $82
		 ac_setSpeed 56,56      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		setActscriptWait $82,eas_46172
		customActscriptWait $80
		 ac_setSpeed 48,48      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		entityActions $82
		 moveLeft 8
		endActions
		playSound SFX_JUMP
		csWait 10
		entityActionsWait $80
		 moveUp 1
		endActions
		entityActionsWait $80
		 moveDown 1
		endActions
		csWait 30
		hideEntity $82
		nextSingleText $0,$1F   ; "Well done.  You dodged my{N}fireball.{W1}"
		nextText $C0,$80        ; "What a surprising old wizard!{W2}"
		nextText $C0,$80        ; "I didn't think I could obtain{N}the jewel that easily.{N}Ha, ha!{W2}"
		nextSingleText $C0,$80  ; "This is gonna be fun!{N}{LEADER}!{N}Keep it for a while.{W1}"
		setActscriptWait $80,eas_Init
		cameraSpeed $30
		customActscriptWait $80
		 ac_setSpeed 48,48      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		setCameraEntity $80
		csWait 40
		entityActionsWait $80
		 moveUp 10
		endActions
		csWait 40
		setCameraEntity $FFFF
		setCamDest 8,26
		setFacing $0,UP
		setFacing $7,UP
		entityActionsWait $1F
		 moveUp 2
		endActions
		nextSingleText $0,$1F   ; "Wait!{W1}"
		setFacing $80,LEFT
		setCamDest 7,16
		entityActionsWait $80
		 moveLeft 1
		endActions
		setFacing $80,DOWN
		nextSingleText $0,$80   ; "Be careful of Geshp and{N}Zalbard!{W1}"
		setActscriptWait $80,eas_JumpLeft
		setActscriptWait $80,eas_463AE
		setCamDest 8,26
		setFacing $1F,DOWN
		nextSingleText $0,$1F   ; "Ah, she's gone....{N}OK, {LEADER}.{N}Let's go to Tristan.{W1}"
		entityActionsWait $1F
		 moveRight 1
		 moveDown 2
		endActions
		setFacing $1F,RIGHT
		setFacing $7,LEFT
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
ce_4C3B4:       mainEntity 12,28,DOWN
		entity 12,31,UP,176,eas_Init
		entity 13,28,DOWN,7,eas_Init
		entity 12,27,DOWN,62,eas_Init
		entity 63,63,LEFT,178,eas_Init
		dc.w $FFFF
