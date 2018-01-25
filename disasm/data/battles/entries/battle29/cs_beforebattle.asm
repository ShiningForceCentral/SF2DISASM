
; ASM FILE data\battles\entries\battle29\cs_beforebattle.asm :
; 0x4C3DC..0x4C5E6 : Cutscene before battle 29
bbcs_29:        textCursor $A9E
		loadMapFadeIn 0,10,28
		loadMapEntities ce_4C5AE
		setActscriptWait $0,eas_Init
		setActscriptWait $7,eas_Init
		setPos $7,16,34,UP
		setActscriptWait $1F,eas_Init
		setPos $1F,14,34,UP
		playSound MUSIC_MITULA_SHRINE
		fadeInB
		cameraSpeed $30
		entityActions $0
		 moveUp 1
		endActions
		entityActions $7
		 moveUp 1
		endActions
		entityActionsWait $1F
		 moveUp 1
		endActions
		nextSingleText $0,$80   ; "You can't enter Mitula{N}Shrine now.{W1}"
		setFacing $7,LEFT
		nextSingleText $0,$7    ; "Sir Astral, what do we do{N}now?{W1}"
		nextSingleText $0,$1F   ; "Hmmm....{W1}"
		entityActionsWait $1F
		 moveUp 1
		endActions
		setFacing $1F,RIGHT
		nextSingleText $0,$1F   ; "{LEADER}, what do you{N}think?{W1}"
		setFacing $0,LEFT
		nextSingleText $0,$0    ; "I'm not sure.{W1}"
		entityActionsWait $7
		 moveUp 1
		endActions
		setFacing $7,LEFT
		nextSingleText $0,$7    ; "{LEADER}, it's obvious!{W1}"
		setFacing $0,RIGHT
		entityNod $1F
		nextText $0,$1F         ; "I agree.  We have to see the{N}storytellers and listen to{N}the legends.{W2}"
		nextSingleText $0,$1F   ; "Make a break for it!{W1}"
		setCamDest 10,26
		customActscriptWait $0
		 ac_setSpeed 48,48      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		customActscriptWait $1F
		 ac_setSpeed 48,48      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		customActscriptWait $7
		 ac_setSpeed 48,48      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		entityActions $1F
		 moveUp 3
		endActions
		entityActions $0
		 moveLeft 1
		 moveUp 2
		endActions
		entityActions $7
		 moveLeft 2
		 moveUp 1
		endActions
		csWait 10
		customActscriptWait $80
		 ac_setSpeed 64,64      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		entityActions $80
		 moveUp 2
		 moveLeft 1
		endActions
		waitIdle $80
		setFacing $80,DOWN
		waitIdle $7
		nextText $0,$80         ; "Wait, wait.  You must not{N}enter the holy shrine.{W2}"
		nextSingleText $0,$80   ; "So be it!  Let the truth be{N}known!{W1}"
		playSound $FD
		animEntityFadeInOut $80,$6
		setCamDest 12,19
		setPos $80,16,23,DOWN
		animEntityFadeInOut $80,$7
		csWait 40
		animEntityFadeInOut $80,$6
		setCamDest 8,15
		setPos $80,12,18,DOWN
		animEntityFadeInOut $80,$7
		csWait 40
		animEntityFadeInOut $80,$6
		setCamDest 9,9
		setPos $80,14,13,DOWN
		animEntityFadeInOut $80,$7
		csWait 40
		entityFlashWhite $80,$1E
		playSound MUSIC_BATTLE_THEME_1
		stopEntity $80
		entitySprite $80,$AF
		setFacing $80,UP
		csWait 8
		setFacing $80,LEFT
		csWait 8
		setFacing $80,DOWN
		csWait 8
		entitySprite $80,$55
		startEntity $80
		setPos $81,14,12,DOWN
		csWait 30
		setPos $82,15,13,DOWN
		csWait 30
		setPos $83,15,14,DOWN
		csWait 30
		setPos $84,11,14,DOWN
		csWait 30
		nextSingleText $0,$80   ; "Go away!  The devils already{N}occupy this shrine!{W1}"
		nextText $0,$1F         ; "Devils again!{W2}"
		nextSingleText $0,$1F   ; "{LEADER}, attack!{W1}"
		csc_end
ce_4C5AE:       mainEntity 15,33,UP
		entity 16,34,UP,7,eas_Init
		entity 15,30,DOWN,192,eas_Init
		entity 63,63,DOWN,141,eas_Init
		entity 63,63,DOWN,86,eas_Init
		entity 63,63,DOWN,136,eas_Init
		entity 63,63,DOWN,84,eas_Init
		dc.w $FFFF
