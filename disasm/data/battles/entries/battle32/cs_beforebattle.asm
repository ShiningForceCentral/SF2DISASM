
; ASM FILE data\battles\entries\battle32\cs_beforebattle.asm :
; 0x4CBE2..0x4CD10 : Cutscene before battle 32
bbcs_32:        textCursor $B1D
		loadMapFadeIn 74,10,38
		loadMapEntities ce_4CCC0
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setPos $7,16,45,UP
		setActscript $1F,$FF,eas_Init
		setPos $1F,14,45,UP
		setActscript $16,$FF,eas_Init
		setPos $16,15,46,UP
		setActscript $1E,$FF,eas_Init
		setPos $1E,15,45,UP
		fadeInB
		cameraSpeed $30
		moveEntity $0,$0,$1,$3
		endMove $8080
		moveEntity $7,$0,$1,$3
		endMove $8080
		moveEntity $1F,$0,$1,$3
		endMove $8080
		moveEntity $1E,$0,$1,$3
		endMove $8080
		moveEntity $16,$FF,$1,$3
		endMove $8080
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
		setActscript $81,$0,eas_Jump
		setActscript $82,$0,eas_Jump
		setActscript $83,$0,eas_Jump
		setActscript $84,$0,eas_Jump
		setActscript $85,$0,eas_Jump
		setActscript $86,$FF,eas_Jump
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
