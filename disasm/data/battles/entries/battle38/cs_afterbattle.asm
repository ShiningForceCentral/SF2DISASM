
; ASM FILE data\battles\entries\battle38\cs_afterbattle.asm :
; 0x4DE8C..0x4E3D2 : Cutscene after battle 38
abcs_battle38:  textCursor $BC4
		loadMapFadeIn 66,3,22
		loadMapEntities ce_4E372
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setPos $7,5,25,RIGHT
		setActscript $1F,$FF,eas_Init
		setPos $1F,8,28,UP
		setActscript $1E,$FF,eas_Init
		setPos $1E,9,24,DOWN
		stopEntity $88
		customActscript $88,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $1           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		jumpIfFlagClear $4C,cs_4DF00; Zynk is a follower
		setActscript $1A,$FF,eas_Init
		setPos $1A,63,62,DOWN
cs_4DF00:       setActscript $80,$FF,eas_46172
		setActscript $81,$FF,eas_46172
		setActscript $82,$FF,eas_46172
		setActscript $83,$FF,eas_46172
		setActscript $84,$FF,eas_46172
		setActscript $85,$FF,eas_46172
		setActscript $86,$FF,eas_46172
		setActscript $87,$FF,eas_46172
		setPriority $0,$0
		setPriority $88,$FFFF
		fadeInB
		csWait 60
		entityShiver $88
		nextSingleText $0,$88   ; "My traps...{W1}"
		csWait 60
		customActscript $88,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $0           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		startEntity $88
		setFacing $88,UP
		nextSingleText $0,$88   ; "I'm...at the end of my rope.{N}I...must...escape.{W1}"
		customActscript $88,$FF
		ac_setSpeed 2056        ;   
		ac_jump eas_Idle        ;   
		ac_end
		entityActions $88,$FF
		 moveRight 1
		 moveUp 1
		 moveLeft 1
		 moveUp 2
		 moveRight 1
		 moveDown 1
		 moveRight 1
		 moveUp 1
		endActions
		entityActions $88,$0
		 moveUp 1
		endActions
		csWait 12
		setActscript $88,$FF,eas_461AA
		setQuake 1
		stopEntity $88
		setPos $88,8,24,LEFT
		customActscript $88,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $1           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		setActscript $88,$FF,eas_46172
		customActscript $88,$FF
		ac_setSpeed 10280       ;   
		ac_jump eas_Idle        ;   
		ac_end
		setQuake 0
		entityActions $88,$FF
		 moveDown 1
		endActions
		setFacing $88,DOWN
		entityActions $88,$FF
		 moveDown 1
		endActions
		setFacing $88,RIGHT
		entityActions $88,$FF
		 moveDown 1
		endActions
		setFacing $88,UP
		csWait 40
		entityShiver $88
		csWait 60
		customActscript $88,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $0           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		setFacing $88,DOWN
		csWait 40
		entityShakeHead $88
		startEntity $88
		csWait 10
		setActscript $88,$FF,eas_Jump
		setActscript $88,$FF,eas_46172
		nextSingleText $0,$88   ; "Nooooooo!{W1}"
		entityActions $88,$FF
		 moveUp 2
		endActions
		nextSingleText $0,$88   ; "Please...please let me go.{W1}"
		entityActions $1F,$FF
		 moveUp 1
		endActions
		nextSingleText $C0,$1F  ; "We don't want to kill{N}you.{N}You've lost your powers.{W1}"
		nextSingleText $0,$88   ; "I know...(sob, sob)....{W1}"
		entityActions $7,$FF
		 moveRight 1
		endActions
		nextSingleText $C0,$7   ; "You may go.{W1}"
		setFacing $88,LEFT
		nextSingleText $0,$88   ; "Thank you.{W1}"
		setActscript $88,$FF,eas_Init
		setFacing $88,UP
		setCameraEntity $88
		csWait 60
		entityActions $0,$FF
		 moveRight 1
		endActions
		setFacing $0,DOWN
		csWait 60
		cameraSpeed $8
		customActscript $88,$FF
		ac_setSpeed 2056        ;   
		ac_jump eas_Idle        ;   
		ac_end
		entityActions $88,$FF
		 moveUp 1
		endActions
		setFacing $7,UP
		setFacing $0,LEFT
		entityActions $88,$FF
		 moveUp 2
		endActions
		setFacing $0,UP
		entityActions $88,$FF
		 moveUp 2
		endActions
		csWait 40
		setFacing $88,DOWN
		nextSingleText $0,$88   ; "I won't forget this.{W1}"
		entityActions $88,$FF
		 moveUp 3
		endActions
		flashScreenWhite $1E
		playSound SFX_BATTLEFIELD_DEATH
		setQuake 3
		csWait 50
		csWait 5
		setActscript $88,$0,eas_461B6
		csWait 80
		setQuake 0
		csWait 40
		setFacing $88,DOWN
		tintMap
		nextSingleText $C0,$89  ; "Where are you going, Geshp?{W1}"
		customActscript $88,$FF
		ac_setSpeed 12336       ;   
		ac_jump eas_Idle        ;   
		ac_end
		setActscript $88,$FF,eas_Jump
		setActscript $88,$FF,eas_Jump
		csWait 30
		setActscript $88,$FF,eas_46172
		entityActions $88,$FF
		 moveUp 1
		endActions
		nextSingleText $C0,$89  ; "Do you remember your vow?{W1}"
		entityShakeHead $88
		nextText $C0,$89        ; "You failed to get the jewel{N}from {LEADER}.{W2}"
		nextSingleText $C0,$89  ; "Now, you will pay with your{N}life.{W1}"
		nextSingleText $0,$88   ; "No, please...NO!{W1}"
		setPriority $88,$0
		setPos $80,8,13,RIGHT
		csWait 10
		setPos $81,10,14,LEFT
		csWait 5
		setActscript $88,$0,eas_461B6
		csWait 10
		setPos $82,11,16,RIGHT
		csWait 10
		setPos $83,10,18,LEFT
		csWait 10
		setPos $84,8,19,RIGHT
		csWait 10
		setPos $85,6,18,LEFT
		csWait 10
		setPos $86,5,16,RIGHT
		csWait 10
		setPos $87,6,14,LEFT
		csWait 40
		flashScreenWhite $14
		tintMap
		setFacing $88,DOWN
		setQuake 3
		customActscript $80,$FF
		ac_setSpeed 20560       ;   
		ac_jump eas_Idle        ;   
		ac_end
		customActscript $81,$FF
		ac_setSpeed 20560       ;   
		ac_jump eas_Idle        ;   
		ac_end
		customActscript $82,$FF
		ac_setSpeed 20560       ;   
		ac_jump eas_Idle        ;   
		ac_end
		customActscript $83,$FF
		ac_setSpeed 20560       ;   
		ac_jump eas_Idle        ;   
		ac_end
		customActscript $84,$FF
		ac_setSpeed 20560       ;   
		ac_jump eas_Idle        ;   
		ac_end
		customActscript $85,$FF
		ac_setSpeed 20560       ;   
		ac_jump eas_Idle        ;   
		ac_end
		customActscript $86,$FF
		ac_setSpeed 20560       ;   
		ac_jump eas_Idle        ;   
		ac_end
		customActscript $87,$FF
		ac_setSpeed 20560       ;   
		ac_jump eas_Idle        ;   
		ac_end
		playSound SFX_BOLT_SPELL
		entityActions $80,$FF
		 moveDown 3
		endActions
		setFacing $88,LEFT
		entitySprite $88,$B4
		setActscript $88,$0,eas_AnimSpeedx2
		setActscript $80,$0,eas_JumpLeft
		playSound SFX_BOLT_SPELL
		entityActions $81,$FF
		 moveDownLeft 2
		endActions
		setActscript $81,$0,eas_JumpRight
		hideEntity $80
		playSound SFX_BOLT_SPELL
		entityActions $82,$FF
		 moveLeft 3
		endActions
		setActscript $82,$0,eas_JumpLeft
		hideEntity $81
		playSound SFX_BOLT_SPELL
		entityActions $83,$FF
		 moveUpLeft 2
		endActions
		setActscript $83,$0,eas_JumpRight
		hideEntity $82
		playSound SFX_BOLT_SPELL
		entityActions $84,$FF
		 moveUp 3
		endActions
		setActscript $84,$0,eas_JumpLeft
		hideEntity $83
		playSound SFX_BOLT_SPELL
		entityActions $85,$FF
		 moveUpRight 2
		endActions
		setActscript $85,$0,eas_JumpRight
		hideEntity $84
		playSound SFX_BOLT_SPELL
		entityActions $86,$FF
		 moveRight 3
		endActions
		setActscript $86,$0,eas_JumpLeft
		hideEntity $85
		playSound SFX_BOLT_SPELL
		entityActions $87,$FF
		 moveDownRight 2
		endActions
		setActscript $87,$0,eas_JumpRight
		hideEntity $86
		csWait 8
		hideEntity $87
		setQuake 0
		setCameraEntity $FFFF
		csWait 40
		entitySprite $88,$9F
		setActscript $88,$FF,eas_Die
		flickerOnce
		cameraSpeed $30
		setCamDest 3,20
		entityActions $1F,$FF
		 moveUp 3
		endActions
		nextSingleText $0,$1F   ; "Zeon is such an unfeeling{N}devil...(shiver).{W1}"
		entityActions $7,$FF
		 moveRight 1
		 moveUp 2
		endActions
		nextSingleText $0,$7    ; "He will do the same to us{N}if we lose to him.{W1}"
		nextSingleText $0,$1F   ; "We must not be defeated.{W1}"
		followEntity $1E,$0,$2
		followEntity $7,$1E,$1
		followEntity $1F,$1E,$3
		csc_end
ce_4E372:       mainEntity 8,23,DOWN
		entity 5,25,RIGHT,7,eas_Init
		entity 63,63,RIGHT,178,eas_Init
		entity 63,63,LEFT,178,eas_Init
		entity 63,63,RIGHT,178,eas_Init
		entity 63,63,LEFT,178,eas_Init
		entity 63,63,RIGHT,178,eas_Init
		entity 63,63,LEFT,178,eas_Init
		entity 63,63,RIGHT,178,eas_Init
		entity 63,63,LEFT,178,eas_Init
		entity 6,27,DOWN,159,eas_Init
		entity 63,63,DOWN,162,eas_Init
		dc.w $FFFF
