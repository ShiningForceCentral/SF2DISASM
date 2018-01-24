
; ASM FILE data\battles\entries\battle21\cs_afterbattle.asm :
; 0x4B88C..0x4B958 : Cutscene after battle 21
abcs_battle21:  textCursor $A17
		loadMapFadeIn 67,4,18
		loadMapEntities ce_4B948
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setPos $7,11,23,LEFT
		setActscript $1F,$FF,eas_Init
		setPos $1F,11,21,LEFT
		setPos $1E,11,22,LEFT
		fadeInB
		customActscript $1F,$FF
		ac_setSpeed 7196        ;   
		ac_jump eas_Idle        ;   
		ac_end
		csWait 5
		setActscript $1F,$0,eas_461B6
		csWait 120
		entityActions $1F,$FF
		 moveLeft 3
		 moveDown 1
		 moveLeft 1
		endActions
		csWait 40
		setFacing $1F,RIGHT
		nextSingleText $0,$1F   ; "Hurry!  Let's go into{N}Creed's mansion.{W1}"
		nextSingleText $C0,$7   ; "Oddler, can you see?{W1}"
		nextSingleText $0,$1F   ; "No, why?{W1}"
		nextSingleText $C0,$7   ; "You're moving around as{N}if you can see.{W1}"
		nextSingleText $0,$1F   ; "Am I?  Maybe my other{N}senses have sharpened{N}since I lost my sight.{W1}"
		nextSingleText $C0,$7   ; "Oh, I see.{W1}"
		entityActions $7,$FF
		 moveLeft 1
		endActions
		setFacing $7,UP
		nextSingleText $C0,$7   ; "{LEADER}, let's go see{N}Mr. Creed!{W1}"
		setFacing $0,DOWN
		entityNod $0
		followEntity $1E,$0,$2
		followEntity $7,$1E,$1
		followEntity $1F,$1E,$3
		mapSysEvent $43,$1A,$17,$3
		csc_end
ce_4B948:       mainEntity 10,22,LEFT
		entity 11,23,LEFT,7,eas_Init
		dc.w $FFFF
