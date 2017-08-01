
; ASM FILE data\battles\entries\battle35\cs_beforebattle.asm :
; 0x4D6CE..0x4D88A : Cutscene before battle 35
bbcs_35:        textCursor $B76         ; Initial text line $B76 : "You're still alive?{W1}"
		loadMapFadeIn $4C,$25,$5
		loadMapEntities ce_4D832; Entity data to figure out and format
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		entityPosDir $7,$2C,$A,$2
		setActscript $1F,$FF,eas_Init
		entityPosDir $1F,$2C,$8,$2
		setActscript $1E,$FF,eas_Init
		entityPosDir $1E,$2C,$9,$2
		jumpIfFlagClear $4C,cs_4D728; Zynk is a follower
		setActscript $1A,$FF,eas_Init
		entityPosDir $1A,$3F,$3E,$3
cs_4D728:       fadeInB
		csc45 $30               ; (null)
		nextSingleText $0,$80   ; "You're still alive?{W1}"
		setActscript $0,$0,eas_Jump
		setActscript $7,$0,eas_Jump
		setActscript $1F,$FF,eas_Jump
		nextSingleText $C0,$1F  ; "Geshp!{W1}"
		setCamDest $16,$B
		setEntityDir $80,$0
		nextSingleText $0,$80   ; "Unbelievable!{N}You really are persistent.{W1}"
		nextText $C0,$7         ; "We'll never stop!{W2}"
		nextSingleText $C0,$7   ; "We will not die until we{N}destroy all of you.{W1}"
		nextText $C0,$1F        ; "{LEADER}, kill him!{W2}"
		nextSingleText $C0,$1F  ; "We have to kill him now!{W1}"
		csWait $28
		nextSingleText $0,$80   ; "I'm very sorry, but I have{N}to go.{W1}"
		animEntityFadeInOut $80,$6
		setCamDest $16,$14
		entityPosDir $80,$1C,$18,$3
		animEntityFadeInOut $80,$7
		csWait $28
		setEntityDir $81,$3
		setEntityDir $82,$3
		setEntityDir $83,$2
		setEntityDir $85,$0
		setEntityDir $86,$0
		setEntityDir $87,$0
		setEntityDir $88,$0
		csWait $14
		setEntityDir $80,$2
		csWait $1E
		setEntityDir $80,$1
		csWait $1E
		setEntityDir $80,$0
		csWait $1E
		setEntityDir $80,$3
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
		csWait $32
		setCamDest $25,$5
		moveEntity $7,$FF,$3,$1
		moreMove $2,$1
		endMove $8080
		nextSingleText $0,$7    ; "He escaped again!{W1}"
		moveEntity $1F,$FF,$2,$1
		endMove $8080
		nextText $0,$1F         ; "Geshp sure is a tricky{N}devil.{W2}"
		nextSingleText $0,$1F   ; "After him, now!{W1}"
		csc_end                 ; END OF CUTSCENE SCRIPT
ce_4D832:       dc.b   0
		dc.b $2B 
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
