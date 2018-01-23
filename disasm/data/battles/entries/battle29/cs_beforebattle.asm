
; ASM FILE data\battles\entries\battle29\cs_beforebattle.asm :
; 0x4C3DC..0x4C5E6 : Cutscene before battle 29
bbcs_29:        textCursor $A9E
		loadMapFadeIn 0,10,28
		loadMapEntities ce_4C5AE
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setPos $7,16,34,UP
		setActscript $1F,$FF,eas_Init
		setPos $1F,14,34,UP
		playSound MUSIC_MITULA_SHRINE
		fadeInB
		cameraSpeed $30
		moveEntity $0,$0,$1,$1
		endMove $8080
		moveEntity $7,$0,$1,$1
		endMove $8080
		moveEntity $1F,$FF,$1,$1
		endMove $8080
		nextSingleText $0,$80   ; "You can't enter Mitula{N}Shrine now.{W1}"
		setFacing $7,LEFT
		nextSingleText $0,$7    ; "Sir Astral, what do we do{N}now?{W1}"
		nextSingleText $0,$1F   ; "Hmmm....{W1}"
		moveEntity $1F,$FF,$1,$1
		endMove $8080
		setFacing $1F,RIGHT
		nextSingleText $0,$1F   ; "{LEADER}, what do you{N}think?{W1}"
		setFacing $0,LEFT
		nextSingleText $0,$0    ; "I'm not sure.{W1}"
		moveEntity $7,$FF,$1,$1
		endMove $8080
		setFacing $7,LEFT
		nextSingleText $0,$7    ; "{LEADER}, it's obvious!{W1}"
		setFacing $0,RIGHT
		entityNod $1F
		nextText $0,$1F         ; "I agree.  We have to see the{N}storytellers and listen to{N}the legends.{W2}"
		nextSingleText $0,$1F   ; "Make a break for it!{W1}"
		setCamDest 10,26
		customActscript $0,$FF
		ac_setSpeed 12336       ;   
		ac_jump eas_Idle        ;   
		ac_end
		customActscript $1F,$FF
		ac_setSpeed 12336       ;   
		ac_jump eas_Idle        ;   
		ac_end
		customActscript $7,$FF
		ac_setSpeed 12336       ;   
		ac_jump eas_Idle        ;   
		ac_end
		moveEntity $1F,$0,$1,$3
		endMove $8080
		moveEntity $0,$0,$2,$1
		moreMove $1,$2
		endMove $8080
		moveEntity $7,$0,$2,$2
		moreMove $1,$1
		endMove $8080
		csWait 10
		customActscript $80,$FF
		ac_setSpeed 16448       ;   
		ac_jump eas_Idle        ;   
		ac_end
		moveEntity $80,$0,$1,$2
		moreMove $2,$1
		endMove $8080
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
