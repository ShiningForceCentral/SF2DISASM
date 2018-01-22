
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
		moveEntity $7,$FF,$3,$1
		moreMove $2,$1
		endMove $8080
		nextSingleText $0,$7    ; "He escaped again!{W1}"
		moveEntity $1F,$FF,$2,$1
		endMove $8080
		nextText $0,$1F         ; "Geshp sure is a tricky{N}devil.{W2}"
		nextSingleText $0,$1F   ; "After him, now!{W1}"
		csc_end
ce_4D832:       dc.w $2B
		dc.w 9
		dc.w 2
		dc.b $2C
		dc.b $A
		dc.b 2
		dc.b 7
		dc.l eas_Init           
		dc.b $1B
		dc.b $10
		dc.b 1
		dc.b $9F
		dc.l eas_Init           
		dc.b $1A
		dc.b $15
		dc.b 1
		dc.b $59
		dc.l eas_Init           
		dc.b $1D
		dc.b $15
		dc.b 1
		dc.b $59
		dc.l eas_Init           
		dc.b $1F
		dc.b $18
		dc.b 1
		dc.b $59
		dc.l eas_Init           
		dc.b $1C
		dc.b $1C
		dc.b 1
		dc.b $59
		dc.l eas_Init           
		dc.b $18
		dc.b $18
		dc.b 1
		dc.b $5A
		dc.l eas_Init           
		dc.b $18
		dc.b $19
		dc.b 1
		dc.b $5B
		dc.l eas_Init           
		dc.b $18
		dc.b $1A
		dc.b 1
		dc.b $71
		dc.l eas_Init           
		dc.b $18
		dc.b $1B
		dc.b 1
		dc.b $72
		dc.l eas_Init           
		dc.w $FFFF
