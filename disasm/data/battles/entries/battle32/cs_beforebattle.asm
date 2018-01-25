
; ASM FILE data\battles\entries\battle32\cs_beforebattle.asm :
; 0x4CBE2..0x4CD10 : Cutscene before battle 32
bbcs_32:        textCursor $B1D
		loadMapFadeIn 74,10,38
		loadMapEntities ce_4CCC0
		setActscriptWait $0,eas_Init
		setActscriptWait $7,eas_Init
		setPos $7,16,45,UP
		setActscriptWait $1F,eas_Init
		setPos $1F,14,45,UP
		setActscriptWait $16,eas_Init
		setPos $16,15,46,UP
		setActscriptWait $1E,eas_Init
		setPos $1E,15,45,UP
		fadeInB
		cameraSpeed $30
		entityActions $0
		 moveUp 3
		endActions
		entityActions $7
		 moveUp 3
		endActions
		entityActions $1F
		 moveUp 3
		endActions
		entityActions $1E
		 moveUp 3
		endActions
		entityActionsWait $16
		 moveUp 3
		endActions
		nextSingleText $0,$80   ; "I heard about you from{N}Geshp.{W1}"
		setCamDest 10,18
		nextText $0,$80         ; "He ordered me to take out{N}some of your people.{W2}"
		nextSingleText $0,$80   ; "But, it's not enough.{N}This is the end of your{N}resistance.{W1}"
		setFacing $80,LEFT
		csWait 30
		setFacing $80,RIGHT
		csWait 30
		setFacing $80,UP
		csWait 30
		setFacing $80,DOWN
		nextSingleText $0,$80   ; "Kill them, kill them all!{W1}"
		setActscript $81,eas_Jump
		setActscript $82,eas_Jump
		setActscript $83,eas_Jump
		setActscript $84,eas_Jump
		setActscript $85,eas_Jump
		setActscriptWait $86,eas_Jump
		csc_end
ce_4CCC0:       mainEntity 15,44,UP
		entity 16,45,UP,7,eas_Init
		entity 15,46,UP,22,eas_Init
		entity 14,21,DOWN,122,eas_Init
		entity 12,21,DOWN,137,eas_Init
		entity 13,20,DOWN,141,eas_Init
		entity 16,22,DOWN,112,eas_Init
		entity 14,24,DOWN,87,eas_Init
		entity 16,24,DOWN,88,eas_Init
		entity 18,23,DOWN,137,eas_Init
		dc.w $FFFF
