
; ASM FILE data\battles\entries\battle32\cs_beforebattle.asm :
; 0x4CBE2..0x4CD10 : Cutscene before battle 32
bbcs_32:        textCursor $B1D         ; Initial text line $B1D : "I heard about you from{N}Geshp.{W1}"
		loadMapFadeIn $4A,$A,$26
		loadMapEntities ce_4CCC0; Entity data to figure out and format
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		entityPosDir $7,$10,$2D,$1
		setActscript $1F,$FF,eas_Init
		entityPosDir $1F,$E,$2D,$1
		setActscript $16,$FF,eas_Init
		entityPosDir $16,$F,$2E,$1
		setActscript $1E,$FF,eas_Init
		entityPosDir $1E,$F,$2D,$1
		fadeInB
		csc45 $30               ; (null)
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
		setCamDest $A,$12
		nextText $0,$80         ; "He ordered me to take out{N}some of your people.{W2}"
		nextSingleText $0,$80   ; "But, it's not enough.{N}This is the end of your{N}resistance.{W1}"
		setEntityDir $80,$2
		csWait $1E
		setEntityDir $80,$0
		csWait $1E
		setEntityDir $80,$1
		csWait $1E
		setEntityDir $80,$3
		nextSingleText $0,$80   ; "Kill them, kill them all!{W1}"
		setActscript $81,$0,eas_Jump
		setActscript $82,$0,eas_Jump
		setActscript $83,$0,eas_Jump
		setActscript $84,$0,eas_Jump
		setActscript $85,$0,eas_Jump
		setActscript $86,$FF,eas_Jump
		csc_end                 ; END OF CUTSCENE SCRIPT
ce_4CCC0:       dc.b   0
		dc.b  $F
		dc.b   0
		dc.b $2C 
		dc.b   0
		dc.b   1
		dc.b $10
		dc.b $2D
		dc.b 1
		dc.b 7
		dc.l eas_Init           
		dc.b $F
		dc.b $2E
		dc.b 1
		dc.b $16
		dc.l eas_Init           
		dc.b $E
		dc.b $15
		dc.b 3
		dc.b $7A
		dc.l eas_Init           
		dc.b $C
		dc.b $15
		dc.b 3
		dc.b $89
		dc.l eas_Init           
		dc.b $D
		dc.b $14
		dc.b 3
		dc.b $8D
		dc.l eas_Init           
		dc.b $10
		dc.b $16
		dc.b 3
		dc.b $70
		dc.l eas_Init           
		dc.b $E
		dc.b $18
		dc.b 3
		dc.b $57
		dc.l eas_Init           
		dc.b $10
		dc.b $18
		dc.b 3
		dc.b $58
		dc.l eas_Init           
		dc.b $12
		dc.b $17
		dc.b 3
		dc.b $89
		dc.l eas_Init           
		dc.w $FFFF
