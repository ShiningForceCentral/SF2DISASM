
; ASM FILE data\battles\entries\battle15\cs_beforebattle.asm :
; 0x4ADA6..0x4AE72 : Cutscene before battle 15
bbcs_15:        textCursor $9C7
		loadMapFadeIn 50,9,15
		loadMapEntities ce_4AE42
		setActscriptWait $0,eas_Init
		setActscriptWait $1E,eas_Init
		setPos $1E,14,19,UP
		setActscriptWait $1F,eas_Init
		setPos $1F,15,20,UP
		setActscriptWait $7,eas_Init
		setPos $7,13,20,UP
		fadeInB
		cameraSpeed $30
		nextSingleText $0,$1E   ; "This is the Ancient Hall{N}that leads to the Ancient{N}Tunnel...{W1}"
		entityActionsWait $1E
		 moveUp 1
		endActions
		setCamDest 9,4
		csWait 30
		setActscript $80,eas_Jump
		setActscript $81,eas_Jump
		setActscript $82,eas_Jump
		setActscript $83,eas_Jump
		setActscriptWait $84,eas_Jump
		csWait 30
		setCamDest 9,15
		nextSingleText $0,$1E   ; "There are more monsters here!{W2}"
		setFacing $1E,DOWN
		nextSingleText $0,$1E   ; "{LEADER}, take 'em out!{W1}"
		csc_end
ce_4AE42:       mainEntity 14,20,UP
		entity 14,7,DOWN,73,eas_Init
		entity 15,6,DOWN,107,eas_Init
		entity 13,6,DOWN,133,eas_Init
		entity 16,7,DOWN,142,eas_Init
		entity 12,7,DOWN,124,eas_Init
		dc.w $FFFF
