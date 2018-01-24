
; ASM FILE data\scripting\map\cs_intro3.asm :
; 0x48540..0x48A78 : Intro cutscene 3
IntroCutscene3: textCursor $1077
		mapLoad 42,21,1
		loadMapEntities ce_48A50
		setActscript $0,$FF,eas_Init
		resetMap
		fadeInB
		reloadMap 21,1
		nextSingleText $80,$5   ; "Well?{D2}"
		loadMapFadeIn 42,21,1
		setActscript $82,$0,eas_Transparent
		fadeInFromBlackHalf
		setCameraEntity $5
		entityShiver $80
		entityShiver $80
		nextSingleText $0,$80   ; "Ugh!  Ugghhh!{N}Phew...I can't...{D2}"
		entityActions $81,$FF
		 moveUp 1
		 faceLeft 1
		endActions
		setFacing $80,RIGHT
		nextSingleText $0,$81   ; "You wimp!{N}Let me do it!{D2}"
		entityShiver $80
		csWait 20
		entityActions $81,$0
		 moveLeft 1
		 faceDown 1
		endActions
		entityActions $80,$FF
		 moveLeft 1
		 moveDown 1
		 faceUp 1
		endActions
		csWait 30
		setFacing $81,DOWN
		nextSingleText $0,$81   ; "Yeah, right.{D2}"
		csWait 20
		setFacing $81,UP
		csWait 30
		entityShiver $81
		entityShiver $81
		csWait 30
		entityShiver $81
		csWait 30
		setFacing $81,DOWN
		entityShakeHead $81
		nextSingleText $0,$81   ; "Blast!  It won't budge!{D2}"
		entityActions $5,$FF
		 moveUp 1
		endActions
		csWait 10
		setActscript $5,$FF,eas_Jump
		setActscript $5,$FF,eas_Jump
		setFacing $81,DOWN
		nextSingleText $80,$5   ; "You idiots!{N}Let me do it.{D2}"
		entityShiver $81
		entityActions $81,$FF
		 moveRight 1
		 moveDown 1
		 faceUp 1
		endActions
		csWait 20
		customActscript $5,$FF
		ac_setSpeed 4112        ;   
		ac_jump eas_Idle        ;   
		ac_end
		entityActions $5,$FF
		 moveUp 1
		endActions
		csWait 20
		entityNod $5
		csWait 10
		entityActions $5,$0
		 moveUp 1
		endActions
		csWait 6
		setActscript $5,$FF,eas_461AA
		setFacing $5,DOWN
		entitySprite $5,$BB
		csWait 20
		entityShiver $5
		setActscript $80,$0,eas_Jump
		setActscript $81,$FF,eas_Jump
		setActscript $80,$0,eas_Jump
		setActscript $81,$FF,eas_Jump
		entityShiver $5
		setActscript $80,$0,eas_Jump
		setActscript $81,$FF,eas_Jump
		setActscript $80,$0,eas_Jump
		setActscript $81,$FF,eas_Jump
		entityShiver $5
		setActscript $80,$0,eas_Jump
		setActscript $81,$FF,eas_Jump
		setActscript $80,$0,eas_Jump
		setActscript $81,$FF,eas_Jump
		entityShiver $5
		csWait 30
		entityActions $5,$0
		 moveDown 1
		endActions
		csWait 6
		setActscript $5,$FF,eas_461AA
		customActscript $5,$FF
		ac_setSpeed 2056        ;   
		ac_jump eas_Idle        ;   
		ac_end
		setActscript $5,$FF,eas_46172
		entitySprite $5,$5
		setFacing $5,UP
		entityActions $5,$FF
		 moveDown 1
		endActions
		setFacing $80,RIGHT
		setFacing $81,LEFT
		csWait 20
		nextSingleText $80,$5   ; "Well, that didn't work.{D2}"
		setFacing $5,LEFT
		csWait 30
		setFacing $5,RIGHT
		csWait 30
		setFacing $5,UP
		csWait 20
		entityNod $5
		csWait 20
		nextSingleText $80,$5   ; "This time, I'll pull both of{N}the jewels at the same time!{D2}"
		setActscript $5,$FF,eas_Init
		entityActions $5,$FF
		 moveUp 1
		endActions
		setFacing $80,UP
		setFacing $81,UP
		entityActions $5,$0
		 moveUp 1
		endActions
		csWait 6
		setActscript $5,$FF,eas_461AA
		setFacing $5,DOWN
		entitySprite $5,$BB
		nextSingleText $FF,$FF  ; "{NAME;5} the thief{N}grabbed the two jewels.{D2}"
		csWait 20
		nextSingleText $80,$5   ; "One...two...{D2}"
		entityShiver $5
		nextSingleText $80,$5   ; "THREE!{D2}"
		entityShiver $5
		customActscript $5,$FF
		ac_setSpeed 16448       ;   
		ac_jump eas_Idle        ;   
		ac_end
		setActscript $5,$FF,eas_46172
		hideEntity $82
		setBlocks 26,18,1,1,26,4
		entitySprite $5,$5
		setFacing $5,UP
		entityActions $5,$0
		 moveDown 1
		endActions
		csWait 3
		setActscript $5,$FF,eas_461AA
		entityActions $5,$FF
		 moveDown 5
		endActions
		setQuake 3
		setActscript $5,$FF,eas_Init
		setFacing $80,DOWN
		setFacing $81,DOWN
		entityActions $5,$FF
		 moveUp 2
		endActions
		setFacing $5,LEFT
		customActscript $5,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $3           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		setQuake 0
		setActscript $80,$0,eas_Jump
		setActscript $81,$FF,eas_Jump
		setActscript $80,$0,eas_Jump
		setActscript $81,$FF,eas_Jump
		csWait 20
		entityActions $80,$0
		 moveDown 2
		 faceRight 1
		endActions
		entityActions $81,$FF
		 moveDown 2
		 faceLeft 1
		endActions
		nextSingleText $0,$80   ; "Are you OK?{D2}"
		csWait 40
		nextSingleText $80,$5   ; "Yeah.  I feel just great.{D2}"
		entityActions $80,$FF
		 moveUp 1
		 moveRight 1
		 faceUp 40
		endActions
		setActscript $80,$FF,eas_Jump
		setActscript $80,$FF,eas_Jump
		csWait 20
		setFacing $80,DOWN
		nextSingleText $0,$81   ; "You did it!{N}You have the legendary{N}jewels!{D2}"
		csWait 20
		setFacing $5,UP
		entitySprite $5,$3B
		setActscript $5,$FF,eas_Init
		nextSingleText $80,$5   ; "I did?{D2}"
		csWait 30
		entitySprite $5,$5
		entityShakeHead $5
		nextSingleText $80,$5   ; "Oh, I got them!{N}I have the legendary{N}jewels!  Bravo!{D2}"
		setActscript $5,$FF,eas_Jump
		setActscript $5,$FF,eas_Jump
		csWait 40
		setActscript $5,$FF,eas_Jump
		setActscript $5,$0,eas_Jump
		setQuake 1
		csWait 40
		setQuake 0
		csWait 60
		setQuake 2
		csWait 40
		setQuake 0
		csWait 5
		setActscript $5,$0,eas_461B6
		csWait 5
		setActscript $80,$0,eas_461E4
		csWait 5
		setActscript $81,$0,eas_461E4
		csWait 60
		setQuake 3
		csWait 40
		setQuake 0
		setFacing $5,UP
		nextSingleText $0,$80   ; "What's happening?!{D2}"
		entityShakeHead $80
		entityShakeHead $81
		csWait 40
		setQuake 4
		csWait 60
		setQuake 0
		nextSingleText $80,$5   ; "We must escape from the{N}shrine!  Follow me!{D2}"
		setQuake 5
		customActscript $5,$FF
		ac_setSpeed 12336       ;   
		ac_jump eas_Idle        ;   
		ac_end
		customActscript $80,$FF
		ac_setSpeed 12336       ;   
		ac_jump eas_Idle        ;   
		ac_end
		customActscript $81,$FF
		ac_setSpeed 12336       ;   
		ac_jump eas_Idle        ;   
		ac_end
		entityActions $5,$0
		 moveDown 1
		 moveLeft 7
		 moveUp 6
		endActions
		entityActions $80,$0
		 moveDown 2
		 moveLeft 7
		 moveUp 5
		endActions
		entityActions $81,$FF
		 faceDown 10
		 moveDown 1
		 moveLeft 8
		 moveUp 4
		endActions
		playSound SFX_WARP
		fadeOutToBlackHalf
		setPos $5,2,8,DOWN
		setPos $80,2,8,DOWN
		setPos $81,2,8,DOWN
		reloadMap 0,3
		csWait 10
		fadeInFromBlackHalf
		setCameraEntity $5
		entityActions $5,$FF
		 moveUp 1
		endActions
		entityActions $5,$0
		 moveUp 1
		endActions
		entityActions $80,$FF
		 moveUp 1
		endActions
		entityActions $5,$0
		 moveUp 1
		 moveRight 3
		endActions
		entityActions $80,$0
		 moveUp 2
		 moveRight 2
		endActions
		entityActions $81,$FF
		 moveUp 3
		endActions
		entityActions $81,$FF
		 moveRight 1
		endActions
		customActscript $81,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $1           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		entityActions $5,$0
		 moveRight 2
		endActions
		entityActions $80,$FF
		 moveRight 2
		endActions
		setFacing $5,LEFT
		setFacing $80,LEFT
		csWait 30
		entityActions $5,$0
		 moveLeft 2
		endActions
		entityActions $80,$FF
		 moveLeft 2
		endActions
		csWait 30
		setActscript $81,$FF,eas_Init
		setFacing $81,DOWN
		entityShakeHead $81
		customActscript $81,$FF
		ac_setSpeed 12336       ;   
		ac_jump eas_Idle        ;   
		ac_end
		entityActions $5,$0
		 moveRight 2
		 moveDown 10
		endActions
		entityActions $80,$0
		 moveRight 3
		 moveDown 9
		endActions
		entityActions $81,$FF
		 moveRight 4
		 moveDown 8
		endActions
		setQuake 0
		fadeOutToBlackHalf
		csc_end
ce_48A50:       mainEntity 63,63,UP
		entity 26,7,UP,5,eas_Init
		entity 26,5,UP,202,eas_Init
		entity 27,6,UP,202,eas_Init
		entity 26,4,DOWN,173,eas_Init
		dc.w $FFFF
