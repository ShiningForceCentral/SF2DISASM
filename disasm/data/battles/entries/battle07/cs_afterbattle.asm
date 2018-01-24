
; ASM FILE data\battles\entries\battle07\cs_afterbattle.asm :
; 0x49F7E..0x4A952 : Cutscene after battle 7
abcs_battle07:  textCursor $951
		loadMapFadeIn 58,8,16
		loadMapEntities ce_4A912
		setActscript $0,$FF,eas_Init
		setBlocks 7,23,1,2,13,22
		setBlocks 7,23,1,2,13,24
		setBlocks 7,23,1,2,13,29
		stopEntity $82
		stopEntity $83
		customActscript $82,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $1           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		customActscript $83,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $1           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		setActscript $80,$FF,eas_46172
		setActscript $81,$FF,eas_46172
		setActscript $80,$0,eas_AnimSpeedx2
		setActscript $81,$0,eas_AnimSpeedx2
		fadeInB
		cameraSpeed $28
		csWait 50
		entityActions $85,$0
		 moveUp 6
		endActions
		entityActions $86,$FF
		 moveUp 6
		endActions
		nextSingleText $0,$86   ; "King Galam!  You've lost{N}your followers!{W1}"
		nextSingleText $0,$85   ; "Princess Elis, come here.{N}Come here.{W1}"
		setCamDest 8,13
		nextSingleText $0,$84   ; "Father...{W1}"
		entityActions $84,$FF
		 moveDown 1
		endActions
		customActscript $82,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $0           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		startEntity $82
		entityActions $84,$0
		 moveDown 1
		endActions
		customActscript $82,$FF
		ac_setSpeed 14392       ;   
		ac_jump eas_Idle        ;   
		ac_end
		entityActions $82,$FF
		 moveLeft 1
		endActions
		setFacing $82,UP
		waitIdle $84
		setActscript $84,$FF,eas_Jump
		nextSingleText $0,$84   ; "(Shriek!){W1}"
		nextSingleText $C0,$82  ; "No, Princess.{W1}"
		setActscript $84,$FF,eas_46172
		entityActions $84,$FF
		 moveUp 1
		endActions
		nextSingleText $0,$85   ; "Elis!{W1}"
		setCamDest 8,15
		entityActions $85,$0
		 moveUp 1
		endActions
		entityActions $86,$FF
		 moveUp 1
		endActions
		nextSingleText $C0,$82  ; "Freeze!  Ha, ha!{W1}"
		setActscript $85,$0,eas_Jump
		setActscript $86,$FF,eas_Jump
		setCamDest 8,14
		entityActions $82,$FF
		 moveRight 1
		 moveUp 2
		endActions
		setFacing $82,DOWN
		nextText $C0,$82        ; "What a good hostage she is!{W2}"
		nextSingleText $C0,$82  ; "Stay there!  Or she'll die!{W1}"
		entityActions $85,$FF
		 moveUp 1
		endActions
		nextSingleText $0,$85   ; "Stop this, King Galam!{N}Leave her alone!  Please!{W1}"
		entityActions $86,$FF
		 moveUp 1
		endActions
		nextSingleText $0,$86   ; "Princess Elis...I'll save{N}you!{W1}"
		nextSingleText $FF,$FF  ; "King Galam murmurs a{N}magic spell.{W1}"
		setFacing $84,RIGHT
		csWait 40
		setActscript $84,$FF,eas_Jump
		setFacing $84,DOWN
		nextSingleText $0,$84   ; "Watch out!{W1}"
		nextSingleText $0,$85   ; "What?!{W1}"
		customActscript $80,$FF
		ac_setSpeed 20560       ;   
		ac_jump eas_Idle        ;   
		ac_end
		customActscript $81,$FF
		ac_setSpeed 20560       ;   
		ac_jump eas_Idle        ;   
		ac_end
		setPos $80,13,16,RIGHT
		setPos $81,13,16,RIGHT
		playSound SFX_DEMON_BREATH
		entityActions $80,$0
		 moveDownLeft 1
		endActions
		entityActions $81,$FF
		 moveDownRight 1
		endActions
		entityActions $80,$0
		 moveDown 8
		endActions
		entityActions $81,$0
		 moveDown 8
		endActions
		csWait 10
		setActscript $85,$FF,eas_46172
		setActscript $86,$FF,eas_46172
		customActscript $85,$FF
		ac_setSpeed 14392       ;   
		ac_jump eas_Idle        ;   
		ac_end
		customActscript $86,$FF
		ac_setSpeed 14392       ;   
		ac_jump eas_Idle        ;   
		ac_end
		entityActions $85,$0
		 moveDown 3
		endActions
		entityActions $86,$FF
		 moveDown 3
		endActions
		stopEntity $85
		stopEntity $86
		customActscript $85,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $1           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		customActscript $86,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $1           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		nextSingleText $0,$84   ; "Father!{W1}"
		setActscript $85,$FF,eas_Init
		setActscript $86,$FF,eas_Init
		startEntity $85
		startEntity $86
		entityShakeHead $85
		nextSingleText $0,$85   ; "Don't worry...I'm fine.{W1}"
		nextSingleText $C0,$82  ; "That was just a warning!{N}Do you want me to attack{N}again?{W1}"
		setPos $80,63,63,DOWN
		setPos $81,63,63,DOWN
		setCamDest 8,17
		customActscript $83,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $0           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		startEntity $83
		entityShakeHead $83
		nextText $0,$83         ; "King Granseal...{W2}"
		nextSingleText $0,$83   ; "Galam, please tell me...{N}What's in this tower?{N}In Ground Seal?{W1}"
		nextSingleText $C0,$82  ; "You really want to know?{N}Ha, ha!  OK, I'll tell you.{W1}"
		setCamDest 8,13
		setFacing $82,UP
		nextSingleText $FF,$FF  ; "King Galam displays the{N}Jewel of Evil.{W1}"
		nextSingleText $C0,$82  ; "I'll open the door to the{N}Evil World!{N}Observe!{W1}"
		entityFlashWhite $82,$32
		csWait 60
		mapFadeOutToWhite
		csWait 20
		mapFadeInFromWhite
		csWait 40
		mapFadeOutToWhite
		csWait 30
		mapFadeInFromWhite
		playSound SFX_BIG_DOOR_RUMBLE
		setQuake 2
		csWait 60
		setQuake 0
		csWait 60
		setQuake 3
		nextSingleText $0,$85   ; "An earthquake!{W1}"
		setCamDest 8,3
		csWait 60
		setBlocks 0,39,3,3,12,4
		csWait 50
		setBlocks 0,43,3,3,12,4
		csWait 50
		setBlocks 0,47,3,3,12,4
		csWait 60
		setQuake 0
		setCamDest 8,13
		setFacing $82,DOWN
		nextSingleText $C0,$82  ; "Now do you understand?  I{N}plan on opening the sealed{N}door!{W1}"
		nextSingleText $0,$83   ; "Why?  What's inside?{W1}"
		nextSingleText $C0,$82  ; "You'll find out soon enough.{W1}"
		setFacing $82,UP
		entityFlashWhite $82,$28
		nextSingleText $0,$85   ; "What's he doing now??{W1}"
		nextSingleText $C0,$82  ; "Here they come!{N}Ha, ha, ha!{W1}"
		nextSingleText $0,$83   ; "What?{W1}"
		setCamDest 8,3
		entitySprite $80,$B4
		setPos $80,12,5,UP
		animEntityFadeInOut $80,$7
		entitySprite $81,$B4
		setPos $81,13,5,UP
		animEntityFadeInOut $81,$7
		customActscript $80,$FF
		ac_setSpeed 8224        ;   
		ac_jump eas_Idle        ;   
		ac_end
		customActscript $81,$FF
		ac_setSpeed 8224        ;   
		ac_jump eas_Idle        ;   
		ac_end
		nextSingleText $0,$0    ; "I have a bad feeling about{N}this!{W1}"
		entityActions $80,$0
		 moveDown 5
		endActions
		entityActions $81,$FF
		 moveDown 5
		endActions
		setCamDest 8,8
		nextSingleText $0,$86   ; "Princess Elis is swallowed{N}by a light tube.{W1}"
		entityActions $80,$0
		 moveDown 5
		endActions
		setFacing $84,UP
		setActscript $84,$0,eas_Jump
		entityActions $81,$FF
		 moveDown 5
		endActions
		setCamDest 8,13
		nextSingleText $C0,$82  ; "Farewell for now!{N}Going up!{W1}"
		customActscript $82,$FF
		ac_setSpeed 514         ;   
		ac_jump eas_Idle        ;   
		ac_end
		customActscript $84,$FF
		ac_setSpeed 514         ;   
		ac_jump eas_Idle        ;   
		ac_end
		customActscript $80,$FF
		ac_setSpeed 514         ;   
		ac_jump eas_Idle        ;   
		ac_end
		customActscript $81,$FF
		ac_setSpeed 514         ;   
		ac_jump eas_Idle        ;   
		ac_end
		entityActions $80,$0
		 moveUp 2
		endActions
		entityActions $81,$0
		 moveUp 2
		endActions
		entityActions $82,$0
		 moveUp 2
		endActions
		entityActions $84,$0
		 moveUp 2
		endActions
		nextSingleText $0,$83   ; "He's using the light tube{N}to go through the doorway!{W1}"
		setCamDest 8,17
		nextSingleText $0,$83   ; "Save her.  Save her now!{W1}"
		csWait 5
		setActscript $83,$0,eas_461B6
		csWait 120
		setFacing $83,DOWN
		nextSingleText $0,$83   ; "{LEADER}, you're good{N}at performing acrobatics!{W1}"
		entityActions $83,$FF
		 moveDown 1
		endActions
		setFacing $83,RIGHT
		nextSingleText $0,$83   ; "Minister, help me!{W1}"
		setFacing $86,LEFT
		nextSingleText $0,$86   ; "Y...yes...but how?{W1}"
		nextSingleText $0,$83   ; "Throw {LEADER} towards{N}the light tubes!{W1}"
		setActscript $0,$FF,eas_Jump
		setCameraEntity $0
		entityActions $85,$FF
		 moveLeft 1
		endActions
		entityActions $83,$FF
		 moveLeft 1
		 moveDown 1
		endActions
		entityActions $86,$FF
		 moveDown 1
		endActions
		waitIdle $83
		setFacing $85,RIGHT
		setFacing $83,RIGHT
		setFacing $86,LEFT
		csWait 30
		stopEntity $0
		setFacing $0,DOWN
		customActscript $0,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $1           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		nextSingleText $0,$83   ; "{LEADER}, save her!{W1}"
		customActscript $0,$FF
		ac_setSpeed 10280       ;   
		ac_jump eas_Idle        ;   
		ac_end
		customActscript $83,$FF
		ac_setSpeed 10280       ;   
		ac_jump eas_Idle        ;   
		ac_end
		customActscript $86,$FF
		ac_setSpeed 10280       ;   
		ac_jump eas_Idle        ;   
		ac_end
		setActscript $0,$FF,eas_46172
		setActscript $83,$FF,eas_46172
		setActscript $86,$FF,eas_46172
		entityActions $83,$0
		 moveDown 3
		endActions
		entityActions $86,$0
		 moveDown 3
		endActions
		entityActions $0,$FF
		 moveDown 3
		endActions
		nextSingleText $C0,$82  ; "Too late.  You're too late.{W1}"
		cameraSpeed $38
		customActscript $0,$FF
		ac_setSpeed 14392       ;   
		ac_jump eas_Idle        ;   
		ac_end
		customActscript $83,$FF
		ac_setSpeed 14392       ;   
		ac_jump eas_Idle        ;   
		ac_end
		customActscript $86,$FF
		ac_setSpeed 14392       ;   
		ac_jump eas_Idle        ;   
		ac_end
		entityActions $83,$0
		 moveUp 5
		endActions
		entityActions $86,$0
		 moveUp 5
		endActions
		entityActions $0,$FF
		 moveUp 5
		endActions
		setFacing $85,UP
		entityActions $0,$FF
		 moveUp 3
		endActions
		nextSingleText $0,$83   ; "Oops, we lost our grip!{N}But...{W1}"
		entityActions $80,$0
		 moveUp 8
		endActions
		entityActions $81,$0
		 moveUp 8
		endActions
		entityActions $82,$0
		 moveUp 8
		endActions
		entityActions $84,$0
		 moveUp 8
		endActions
		entityActions $0,$FF
		 moveUp 5
		endActions
		customActscript $0,$FF
		ac_setSpeed 514         ;   
		ac_jump eas_Idle        ;   
		ac_end
		setQuake 4
		customActscript $0,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $0           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		setFacing $0,UP
		entitySprite $0,$B1
		entityActions $0,$0
		 moveUp 8
		endActions
		csWait 20
		setQuake 0
		nextSingleText $FF,$FF  ; "{LEADER} grasped the{N}Jewel of Evil.{W1}"
		setCameraEntity $FFFF
		nextText $C0,$82        ; "What are you doing?{W2}"
		setCameraEntity $0
		setCameraEntity $FFFF
		nextSingleText $C0,$82  ; "Don't touch my jewel!{N}Don't touch it!{W1}"
		setCameraEntity $0
		entityShiver $0
		stopEntity $0
		setCameraEntity $FFFF
		nextText $C0,$82        ; "I said, don't touch it!{W2}"
		setCameraEntity $0
		setCameraEntity $FFFF
		nextSingleText $C0,$82  ; "I'll shake you off!{W1}"
		setCameraEntity $0
		entityShiver $0
		stopEntity $0
		setCameraEntity $FFFF
		nextSingleText $C0,$82  ; "You're still there?{W1}"
		setCameraEntity $0
		setCameraEntity $FFFF
		nextSingleText $0,$0    ; "Wow!  He's so brave.  Hmmm....{W1}"
		setCameraEntity $0
		setCameraEntity $FFFF
		nextSingleText $C0,$82  ; "I've almost got you now!{W1}"
		setCameraEntity $0
		entityShiver $0
		stopEntity $0
		setCameraEntity $FFFF
		nextSingleText $0,$84   ; "No, you'll fall if you{N}open your hands now!{W1}"
		setCameraEntity $0
		setCameraEntity $FFFF
		nextSingleText $FF,$FF  ; "{LEADER}'s jewel suddenly{N}flared!{W1}"
		setCameraEntity $0
		entityFlashWhite $0,$14
		playSound SFX_VALIDATION
		mapFadeOutToWhite
		csWait 10
		mapFadeInFromWhite
		setCameraEntity $FFFF
		nextSingleText $C0,$82  ; "Whoa!  The light...the{N}light!{W1}"
		setCameraEntity $0
		setCameraEntity $FFFF
		nextSingleText $FF,$FF  ; "The Jewel of Evil fused{N}to {LEADER}'s neck.{W1}"
		setCameraEntity $0
		cameraSpeed $38
		customActscript $0,$FF
		ac_setSpeed 14392       ;   
		ac_jump eas_Idle        ;   
		ac_end
		setActscript $0,$FF,eas_46172
		entitySprite $0,$0
		customActscript $0,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $1           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		setEntityDest $0,13,10
		nextSingleText $C0,$82  ; "He stole my jewel!{W1}"
		setFacing $83,UP
		setFacing $86,UP
		entityActions $0,$FF
		 moveDown 5
		endActions
		cameraSpeed $40
		customActscript $0,$FF
		ac_setSpeed 16448       ;   
		ac_jump eas_Idle        ;   
		ac_end
		playSound SFX_DOOR_OPEN
		setQuake 3
		setFacing $0,DOWN
		entityActions $0,$FF
		 moveDown 1
		endActions
		setFacing $0,LEFT
		entityActions $0,$FF
		 moveDown 1
		endActions
		setFacing $0,UP
		entityActions $0,$FF
		 moveDown 1
		endActions
		setFacing $0,RIGHT
		entityActions $0,$FF
		 moveDown 1
		endActions
		setFacing $0,DOWN
		entityActions $0,$FF
		 moveDown 1
		endActions
		entitySprite $0,$B1
		customActscript $0,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $0           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		csWait 20
		setQuake 0
		csWait 40
		entityShiver $0
		stopEntity $0
		csWait 30
		setCameraEntity $FFFF
		cameraSpeed $28
		nextSingleText $FF,$FF  ; "The two jewels merge{N}together.{W1}"
		setF $181               ; set after Bowie obtains King Galam's jewel
		setCamDest 8,3
		waitIdle $82
		setFacing $82,DOWN
		setFacing $84,DOWN
		animEntityFadeInOut $81,$6
		nextSingleText $C0,$82  ; "I have to go back and get{N}my jewel....{N}Noooooooo!{W1}"
		setActscript $82,$0,eas_463AE
		animEntityFadeInOut $80,$6
		nextSingleText $0,$84   ; "Father...{N}{LEADER}...help meeeeee!{W1}"
		setActscript $84,$FF,eas_463AE
		setActscript $83,$FF,eas_Init
		customActscript $83,$FF
		ac_setSpeed 8224        ;   
		ac_jump eas_Idle        ;   
		ac_end
		setActscript $86,$FF,eas_Init
		customActscript $86,$FF
		ac_setSpeed 8224        ;   
		ac_jump eas_Idle        ;   
		ac_end
		customActscript $85,$FF
		ac_setSpeed 8224        ;   
		ac_jump eas_Idle        ;   
		ac_end
		playSound $FD
		csWait 60
		setCamDest 8,17
		playSound MUSIC_SAD_THEME_1
		csWait 60
		nextSingleText $0,$85   ; "She's gone....{N}Elis!{W1}"
		nextSingleText $0,$83   ; "We couldn't help the{N}Princess.{W1}"
		entitySprite $0,$0
		setActscript $0,$FF,eas_Init
		startEntity $0
		entityShakeHead $0
		nextSingleText $C0,$0   ; "(Sigh)....{W1}"
		nextSingleText $0,$83   ; "{LEADER}, why do you{N}have two jewels?{W1}"
		nextSingleText $FF,$FF  ; "{LEADER} explains{N}what happened.{W1}"
		entityNod $83
		entityNod $0
		nextSingleText $0,$83   ; "Indeed, perhaps...these{N}jewels are the key to{N}solving this....{W1}"
		setQuake 2
		csWait 5
		setActscript $86,$0,eas_461B6
		playSound $FD
		csWait 120
		setQuake 0
		csWait 60
		setQuake 1
		playSound MUSIC_BOSS_ATTACK
		nextSingleText $0,$83   ; "What?! Another earthquake?{W1}"
		nextSingleText $0,$86   ; "Wow!  It's getting worse!{W1}"
		entityActions $86,$FF
		 moveDown 1
		endActions
		setFacing $86,LEFT
		nextSingleText $C0,$85  ; "Whoa!{W1}"
		nextSingleText $0,$86   ; "Sssiirrr Astral!{N}What should we do?!{W1}"
		nextSingleText $0,$83   ; "I'm not sure.{W1}"
		entityActions $86,$FF
		 moveLeft 2
		endActions
		setFacing $86,UP
		nextSingleText $0,$86   ; "Sir Astral!{W1}"
		setFacing $83,DOWN
		nextText $0,$83         ; "Let's get out of here!{W2}"
		nextSingleText $0,$83   ; "We'll come back later with{N}soldiers to rescue her.{W1}"
		setFacing $83,LEFT
		nextSingleText $C0,$85  ; "But, Sir Astral...{W1}"
		setFacing $83,DOWN
		nextSingleText $0,$83   ; "He won't budge.{N}We'll have to carry him.{W1}"
		nextSingleText $FF,$FF  ; "The Minister nods.{W1}"
		entityNod $83
		entityActions $83,$0
		 moveLeft 1
		endActions
		entityActions $86,$FF
		 moveDown 1
		 moveLeft 1
		endActions
		setActscript $85,$FF,eas_46172
		setFacing $83,DOWN
		stopEntity $85
		csWait 50
		entityActions $83,$0
		 moveRight 2
		endActions
		entityActions $86,$0
		 moveRight 2
		endActions
		entityActions $85,$FF
		 moveRight 2
		endActions
		entityActions $83,$0
		 moveRight 1
		 moveDown 1
		endActions
		entityActions $86,$FF
		 moveLeft 1
		 moveUp 1
		endActions
		setFacing $86,DOWN
		csWait 50
		setCameraEntity $85
		cameraSpeed $20
		entityActions $83,$0
		 moveDown 13
		endActions
		entityActions $86,$0
		 moveDown 13
		endActions
		entityActions $85,$FF
		 moveDown 13
		endActions
		csWait 40
		setActscript $83,$FF,eas_Jump
		setFacing $83,UP
		nextText $0,$83         ; "{LEADER}, you'll be{N}buried in the tower!{W2}"
		nextSingleText $0,$83   ; "Come on!{W1}"
		csWait 50
		mapSysEvent $3A,$D,$23,$3
		followEntity $83,$0,$2
		followEntity $85,$83,$2
		followEntity $86,$85,$2
		setF $4A                ; Astral + King are followers
		setF $280               ; set after the end of battle 7's long sequence, cleared at docks?
		csc_end
ce_4A912:       mainEntity 13,23,UP
		entity 63,63,RIGHT,178,eas_Init
		entity 63,63,RIGHT,178,eas_Init
		entity 13,17,UP,164,eas_Init
		entity 13,21,UP,209,eas_Init
		entity 12,14,DOWN,204,eas_Init
		entity 12,27,UP,203,eas_Init
		entity 14,27,UP,205,eas_Init
		dc.w $FFFF
