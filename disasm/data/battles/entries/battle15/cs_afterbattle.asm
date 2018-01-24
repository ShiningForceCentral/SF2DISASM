
; ASM FILE data\battles\entries\battle15\cs_afterbattle.asm :
; 0x4AE72..0x4AFBE : Cutscene after battle 15
abcs_battle15:  textCursor $9CA
		loadMapFadeIn 50,9,10
		loadMapEntities ce_4AFB6
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setActscript $1E,$FF,eas_Init
		setActscript $1F,$FF,eas_Init
		setPos $1E,14,19,UP
		fadeInB
		cameraSpeed $30
		entityActions $1E,$FF
		 moveUp 5
		endActions
		nextSingleText $0,$1E   ; "It was lucky for me that I{N}met you.  Thank you.{W1}"
		setFacing $1E,RIGHT
		nextSingleText $0,$1E   ; "Follow me to the Ancient{N}Tunnel.{W1}"
		entityActions $1E,$FF
		 moveRight 2
		 moveUp 2
		 moveRight 6
		endActions
		fadeOutB
		setPos $0,27,10,UP
		setPos $7,28,10,UP
		setPos $1F,26,10,UP
		setPos $1E,27,7,UP
		setCamDest 21,5
		fadeInB
		nextText $0,$1E         ; "Why is this door closed?{N}That's strange...{W2}"
		nextSingleText $0,$1E   ; "Oh well, let's go in.{W1}"
		entityFlashWhite $1E,$28
		csWait 60
		setActscript $1E,$FF,eas_Jump
		nextSingleText $0,$1E   ; "What?  Let me try again.{W1}"
		entityFlashWhite $1E,$32
		setQuake 1
		csWait 20
		setQuake 0
		csWait 90
		nextSingleText $0,$1E   ; "Petro, my grandson, locked{N}the door.{W1}"
		customActscript $1E,$FF
		ac_setSpeed 4112        ;   
		ac_jump eas_Idle        ;   
		ac_end
		entityActions $1E,$FF
		 moveDown 1
		endActions
		nextSingleText $0,$1E   ; "Sorry, guys!  We can't go to{N}Grans Island this way.{W1}"
		entityActions $1E,$0
		 moveDown 2
		endActions
		csWait 15
		entityActions $0,$0
		 moveDown 1
		endActions
		entityActions $7,$0
		 moveDown 1
		endActions
		entityActions $1F,$FF
		 moveDown 1
		endActions
		setFacing $0,UP
		setFacing $7,UP
		setFacing $1F,UP
		waitIdle $1E
		entityActions $1E,$FF
		 moveLeft 3
		endActions
		setFacing $0,LEFT
		setFacing $7,LEFT
		setFacing $1F,LEFT
		entityActions $1E,$FF
		 moveLeft 5
		endActions
		hideEntity $1E
		clearF $4D              ; Old man is a follower
		setF $2DC               ; set after the old man fails to open the way to Grans in the Wooden Panel shrine
		followEntity $7,$0,$2
		followEntity $1F,$7,$2
		mapSysEvent $32,$1B,$B,$1
		csc_end
ce_4AFB6:       mainEntity 14,5,DOWN
		dc.w $FFFF
