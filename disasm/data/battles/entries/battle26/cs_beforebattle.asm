
; ASM FILE data\battles\entries\battle26\cs_beforebattle.asm :
; 0x4B958..0x4BCAA : Cutscene before battle 26
bbcs_26:        textCursor $A24
		loadMapFadeIn 72,2,20
		loadMapEntities ce_4BC5A
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setPos $7,6,26,RIGHT
		setActscript $1F,$FF,eas_Init
		setPos $1F,6,24,RIGHT
		setPos $1E,6,25,RIGHT
		fadeInB
		cameraSpeed $30
		nextSingleText $0,$80   ; "Answer me!{N}Where are you going?{W1}"
		setCamDest 13,9
		nextSingleText $C0,$13  ; "Ah...I...{W1}"
		nextSingleText $0,$80   ; "You were going to South{N}Parmecia to get help, right?{W1}"
		nextSingleText $C0,$13  ; "I...uh...{W1}"
		nextText $0,$80         ; "Paladins of Pacalon are{N}cowards!  {NAME;19}, don't{N}you have any pride?{W2}"
		nextSingleText $0,$80   ; "Wimp!{W1}"
		entityActions $85,$FF
		 moveUp 2
		 moveRight 1
		endActions
		setFacing $85,UP
		nextSingleText $C0,$85  ; "Shut up!  Mr. {NAME;19} is{N}the bravest soldier in the{N}world!{W1}"
		nextSingleText $C0,$13  ; "I can defend myself.{W1}"
		nextSingleText $0,$80   ; "Come on, you half-breed!{W1}"
		setFacing $80,UP
		nextSingleText $0,$80   ; "Are you afraid of me?{N}I'll turn my back to you.{N}Now, run away you cowards!{W1}"
		setActscript $85,$FF,eas_Jump
		nextSingleText $C0,$85  ; "You've gone too far!{W1}"
		customActscript $85,$FF
		ac_setSpeed 12336       ;   
		ac_jump eas_Idle        ;   
		ac_end
		entityActions $85,$0
		 moveUp 3
		endActions
		csWait 5
		animEntityFadeInOut $80,$6
		waitIdle $85
		csWait 5
		setActscript $85,$0,eas_461B6
		csWait 120
		setFacing $83,LEFT
		setFacing $85,DOWN
		csWait 20
		customActscript $83,$FF
		ac_setSpeed 16448       ;   
		ac_jump eas_Idle        ;   
		ac_end
		entityActions $83,$0
		 moveLeft 1
		endActions
		csWait 3
		customActscript $85,$FF
		ac_setSpeed 16448       ;   
		ac_jump eas_Idle        ;   
		ac_end
		setQuake 2
		setActscript $85,$FF,eas_JumpLeft
		setQuake 0
		setActscript $85,$FF,eas_JumpLeft
		nextSingleText $C0,$85  ; "Aaaauuuuu!{W1}"
		setActscript $85,$FF,eas_Die
		setCamDest 13,13
		setPos $80,18,19,UP
		animEntityFadeInOut $80,$7
		nextSingleText $0,$80   ; "Pacalon soldiers have no{N}honor.  They attack while{N}my back is turned!{W1}"
		setActscript $86,$FF,eas_Jump
		setFacing $13,DOWN
		setFacing $86,DOWN
		csWait 30
		entityActions $86,$FF
		 moveLeft 1
		 moveDown 1
		endActions
		nextText $C0,$86        ; "What?!{W2}"
		nextSingleText $C0,$86  ; "If Mr. {NAME;19} was not{N}ill, you'd be history!{W1}"
		nextText $0,$80         ; "Oh, is {NAME;19} ill?{W1}"
		nextSingleText $0,$80   ; "In that case, you can try{N}and take me.{W1}"
		nextSingleText $C0,$86  ; "I can no longer put up with{N}these insults!{W1}"
		nextSingleText $C0,$13  ; "No, no!{W1}"
		setPos $81,13,18,RIGHT
		customActscript $81,$FF
		ac_setSpeed 20560       ;   
		ac_jump eas_Idle        ;   
		ac_end
		customActscript $86,$FF
		ac_setSpeed 10280       ;   
		ac_jump eas_Idle        ;   
		ac_end
		entityActions $86,$0
		 moveDown 2
		endActions
		entityActions $81,$0
		 moveRight 4
		endActions
		csWait 20
		customActscript $86,$FF
		ac_setSpeed 16448       ;   
		ac_jump eas_Idle        ;   
		ac_end
		setQuake 3
		setActscript $86,$FF,eas_JumpRight
		setQuake 0
		setActscript $86,$FF,eas_JumpRight
		nextSingleText $C0,$86  ; "Grruuu....{W1}"
		setActscript $86,$FF,eas_Die
		setFacing $81,DOWN
		entityActions $80,$FF
		 moveUp 2
		endActions
		nextSingleText $0,$80   ; "You look so sad,{N}{NAME;19}....{W1}"
		nextSingleText $C0,$13  ; "You're not just a normal{N}devil soldier.{W1}"
		nextText $0,$80         ; "You're right, {NAME;19}.{N}I see why you're the leader{N}of the Pacalon Army.{W2}"
		nextSingleText $0,$80   ; "I'm Geshp!  An adviser for{N}Zeon!{W1}"
		nextSingleText $C0,$13  ; "How did you know my name?{W1}"
		nextSingleText $0,$80   ; "I know everything.{W1}"
		nextText $C0,$13        ; "Now, tell me the reason why{N}"
		nextSingleText $C0,$13  ; "you're keeping me alive.{W1}"
		nextSingleText $0,$80   ; "Ha, ha!  You're smart!{W1}"
		animEntityFadeInOut $84,$4
		entityFlashWhite $80,$1E
		setCamDest 13,11
		setPos $84,18,12,DOWN
		animEntityFadeInOut $84,$5
		nextSingleText $C0,$13  ; "What did you do?{W1}"
		entityActions $84,$FF
		 moveDown 1
		endActions
		animEntityFadeInOut $84,$4
		nextSingleText $C0,$13  ; "I...can't...!{N}My body won't...{W1}"
		entityShiver $13
		stopEntity $13
		nextText $0,$80         ; "I came here to borrow your{N}body.{W2}"
		nextSingleText $0,$80   ; "Ha, ha!  Welcome our new{N}leader!{W1}"
		stopEntity $13
		customActscript $13,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $1           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		nextSingleText $C0,$1F  ; "Stop!!!{W1}"
		customActscript $81,$FF
		ac_setSpeed 8224        ;   
		ac_jump eas_Idle        ;   
		ac_end
		setActscript $81,$0,eas_Jump
		setActscript $80,$FF,eas_Jump
		setCamDest 13,15
		entityActions $80,$FF
		 moveDown 3
		endActions
		csWait 5
		setActscript $80,$0,eas_461B6
		csWait 120
		entityActions $80,$FF
		 moveLeft 1
		endActions
		nextSingleText $0,$80   ; "Who said that?{W1}"
		setCamDest 2,20
		csWait 60
		setCamDest 13,15
		nextText $0,$80         ; "A force from the south?{N}How?{W2}"
		nextSingleText $0,$80   ; "Where did you come from?{W1}"
		nextSingleText $C0,$1F  ; "We're from Granseal!{W1}"
		nextSingleText $0,$80   ; "But, that's on the other....{W1}"
		setActscript $80,$FF,eas_46172
		customActscript $80,$FF
		ac_setSpeed 12336       ;   
		ac_jump eas_Idle        ;   
		ac_end
		entityActions $80,$FF
		 moveRight 2
		endActions
		nextSingleText $0,$80   ; "I'd better leave...{W2}"
		setFacing $80,UP
		nextSingleText $0,$80   ; "Devil soldiers!  Stop that{N}force from Granseal!{W1}"
		setFacing $80,DOWN
		setActscript $81,$0,eas_Jump
		animEntityFadeInOut $80,$6
		csc_end
ce_4BC5A:       mainEntity 7,25,RIGHT
		entity 6,26,RIGHT,7,eas_Init
		entity 18,14,UP,19,eas_Init
		entity 18,11,DOWN,159,eas_Init
		entity 17,11,DOWN,109,eas_Init
		entity 19,11,DOWN,145,eas_Init
		entity 20,10,DOWN,83,eas_Init
		entity 63,63,DOWN,106,eas_Init
		entity 17,15,UP,233,eas_Init
		entity 19,15,UP,233,eas_Init
		dc.w $FFFF
