
; ASM FILE data\battles\entries\battle18\cs_beforebattle.asm :
; 0x4B1D8..0x4B2F2 : Cutscene before battle 18
bbcs_18:        textCursor $9D8
		loadMapFadeIn 12,7,22
		loadMapEntities ce_4B2DA
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setActscript $1F,$FF,eas_Init
		setActscript $B,$FF,eas_Init
		setPos $7,13,33,UP
		setPos $1F,12,33,UP
		setPos $B,11,33,UP
		stopEntity $81
		playSound MUSIC_SHRINE
		fadeInB
		cameraSpeed $40
		moveEntity $0,$0,$1,$6
		endMove $8080
		moveEntity $7,$0,$1,$6
		endMove $8080
		moveEntity $B,$0,$1,$6
		endMove $8080
		moveEntity $1F,$FF,$1,$6
		endMove $8080
		nextSingleText $0,$80   ; "Stop!{W1}"
		csWait 5
		setActscript $0,$0,eas_461B6
		csWait 5
		setActscript $7,$0,eas_461B6
		csWait 5
		setActscript $B,$0,eas_461E4
		csWait 5
		setActscript $1F,$0,eas_461B6
		csWait 30
		moveEntity $7,$FF,$1,$1
		endMove $8080
		nextSingleText $C0,$7   ; "Who IS that big guy?{W1}"
		moveEntity $B,$FF,$1,$1
		endMove $8080
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
