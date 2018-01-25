
; ASM FILE data\battles\entries\battle18\cs_beforebattle.asm :
; 0x4B1D8..0x4B2F2 : Cutscene before battle 18
bbcs_18:        textCursor $9D8
		loadMapFadeIn 12,7,22
		loadMapEntities ce_4B2DA
		setActscriptWait $0,eas_Init
		setActscriptWait $7,eas_Init
		setActscriptWait $1F,eas_Init
		setActscriptWait $B,eas_Init
		setPos $7,13,33,UP
		setPos $1F,12,33,UP
		setPos $B,11,33,UP
		stopEntity $81
		playSound MUSIC_SHRINE
		fadeInB
		cameraSpeed $40
		entityActions $0
		 moveUp 6
		endActions
		entityActions $7
		 moveUp 6
		endActions
		entityActions $B
		 moveUp 6
		endActions
		entityActionsWait $1F
		 moveUp 6
		endActions
		nextSingleText $0,$80   ; "Stop!{W1}"
		csWait 5
		setActscript $0,eas_461B6
		csWait 5
		setActscript $7,eas_461B6
		csWait 5
		setActscript $B,eas_461E4
		csWait 5
		setActscript $1F,eas_461B6
		csWait 30
		entityActionsWait $7
		 moveUp 1
		endActions
		nextSingleText $C0,$7   ; "Who IS that big guy?{W1}"
		entityActionsWait $B
		 moveUp 1
		endActions
		nextSingleText $0,$B    ; "Don't you know?{W1}"
		setFacing $0,UP
		setFacing $7,UP
		setFacing $1F,UP
		csWait 30
		setCameraEntity $80
		nextSingleText $0,$B    ; "That's Taros.  The guardian of{N}this ancient shrine.{W1}"
		nextSingleText $0,$80   ; "Again, stop right there, or{N}I'll attack you.{W1}"
		setCamDest 7,22
		setFacing $0,RIGHT
		setFacing $7,LEFT
		setFacing $B,RIGHT
		nextSingleText $C0,$7   ; "What should we do?{W1}"
		setFacing $0,LEFT
		nextSingleText $0,$B    ; "The Caravan is there, behind{N}him.  We must have it!{W1}"
		setFacing $0,UP
		setFacing $7,UP
		setFacing $B,UP
		nextSingleText $0,$80   ; "Time's up!  Now we battle.{W1}"
		csc_end
ce_4B2DA:       mainEntity 12,32,UP
		entity 12,8,DOWN,255,eas_Init
		entity 12,5,DOWN,62,eas_Init
		dc.w $FFFF
