
; ASM FILE data\battles\entries\battle35\cs_beforebattle.asm :
; 0x4D6CE..0x4D88A : Cutscene before battle 35
bbcs_35:        textCursor $B76
		loadMapFadeIn 76,37,5
		loadMapEntities ce_4D832
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setPos $7,44,10,LEFT
		setActscript $1F,$FF,eas_Init
		setPos $1F,44,8,LEFT
		setActscript $1E,$FF,eas_Init
		setPos $1E,44,9,LEFT
		jumpIfFlagClear $4C,cs_4D728; Zynk is a follower
		setActscript $1A,$FF,eas_Init
		setPos $1A,63,62,DOWN
cs_4D728:       fadeInB
		cameraSpeed $30
		nextSingleText $0,$80   ; "You're still alive?{W1}"
		setActscript $0,$0,eas_Jump
		setActscript $7,$0,eas_Jump
		setActscript $1F,$FF,eas_Jump
		nextSingleText $C0,$1F  ; "Geshp!{W1}"
		setCamDest 22,11
		setFacing $80,RIGHT
		nextSingleText $0,$80   ; "Unbelievable!{N}You really are persistent.{W1}"
		nextText $C0,$7         ; "We'll never stop!{W2}"
		nextSingleText $C0,$7   ; "We will not die until we{N}destroy all of you.{W1}"
		nextText $C0,$1F        ; "{LEADER}, kill him!{W2}"
		nextSingleText $C0,$1F  ; "We have to kill him now!{W1}"
		csWait 40
		nextSingleText $0,$80   ; "I'm very sorry, but I have{N}to go.{W1}"
		animEntityFadeInOut $80,$6
		setCamDest 22,20
		setPos $80,28,24,DOWN
		animEntityFadeInOut $80,$7
		csWait 40
		setFacing $81,DOWN
		setFacing $82,DOWN
		setFacing $83,LEFT
		setFacing $85,RIGHT
		setFacing $86,RIGHT
		setFacing $87,RIGHT
		setFacing $88,RIGHT
		csWait 20
		setFacing $80,LEFT
		csWait 30
		setFacing $80,UP
		csWait 30
		setFacing $80,RIGHT
		csWait 30
		setFacing $80,DOWN
		nextSingleText $0,$80   ; "Don't let them advance!{W1}"
		setActscript $81,$0,eas_Jump
		setActscript $82,$0,eas_Jump
		setActscript $83,$0,eas_Jump
		setActscript $84,$0,eas_Jump
		setActscript $85,$0,eas_Jump
		setActscript $86,$0,eas_Jump
		setActscript $87,$0,eas_Jump
		setActscript $88,$0,eas_Jump
		animEntityFadeInOut $80,$6
		csWait 50
		setCamDest 37,5
		entityActions $7,$FF
		 moveDown 1
		 moveLeft 1
		endActions
		nextSingleText $0,$7    ; "He escaped again!{W1}"
		entityActions $1F,$FF
		 moveLeft 1
		endActions
		nextText $0,$1F         ; "Geshp sure is a tricky{N}devil.{W2}"
		nextSingleText $0,$1F   ; "After him, now!{W1}"
		csc_end
ce_4D832:       mainEntity 43,9,LEFT
		entity 44,10,LEFT,7,eas_Init
		entity 27,16,UP,159,eas_Init
		entity 26,21,UP,89,eas_Init
		entity 29,21,UP,89,eas_Init
		entity 31,24,UP,89,eas_Init
		entity 28,28,UP,89,eas_Init
		entity 24,24,UP,90,eas_Init
		entity 24,25,UP,91,eas_Init
		entity 24,26,UP,113,eas_Init
		entity 24,27,UP,114,eas_Init
		dc.w $FFFF
