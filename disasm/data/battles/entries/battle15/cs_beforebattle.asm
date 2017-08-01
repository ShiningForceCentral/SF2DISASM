
; ASM FILE data\battles\entries\battle15\cs_beforebattle.asm :
; 0x4ADA6..0x4AE72 : Cutscene before battle 15
bbcs_15:
		textCursor $9C7         
						; Initial text line $9C7 : "This is the Ancient Hall{N}that leads to the Ancient{N}Tunnel...{W1}"
		loadMapFadeIn $32,$9,$F
		loadMapEntities ce_4AE42
						; Entity data to figure out and format
		setActscript $0,$FF,eas_Init
		setActscript $1E,$FF,eas_Init
		entityPosDir $1E,$E,$13,$1
		setActscript $1F,$FF,eas_Init
		entityPosDir $1F,$F,$14,$1
		setActscript $7,$FF,eas_Init
		entityPosDir $7,$D,$14,$1
		fadeInB
		csc45 $30               
						; (null)
		nextSingleText $0,$1E   
						; "This is the Ancient Hall{N}that leads to the Ancient{N}Tunnel...{W1}"
		moveEntity $1E,$FF,$1,$1
		endMove $8080
		setCamDest $9,$4
		csWait $1E
		setActscript $80,$0,eas_Jump
		setActscript $81,$0,eas_Jump
		setActscript $82,$0,eas_Jump
		setActscript $83,$0,eas_Jump
		setActscript $84,$FF,eas_Jump
		csWait $1E
		setCamDest $9,$F
		nextSingleText $0,$1E   
						; "There are more monsters here!{W2}"
		setEntityDir $1E,$3
		nextSingleText $0,$1E   
						; "{LEADER}, take 'em out!{W1}"
		csc_end                 
						; END OF CUTSCENE SCRIPT
ce_4AE42:
		dc.b   0
		dc.b  $E
		dc.w $14
		dc.w 1
		dc.b $E
		dc.b 7
		dc.b 3
		dc.b $49
		dc.l eas_Init           
		dc.b $F
		dc.b 6
		dc.b 3
		dc.b $6B
		dc.l eas_Init           
		dc.b $D
		dc.b 6
		dc.b 3
		dc.b $85
		dc.l eas_Init           
		dc.b $10
		dc.b 7
		dc.b 3
		dc.b $8E
		dc.l eas_Init           
		dc.b $C
		dc.b 7
		dc.b 3
		dc.b $7C
		dc.l eas_Init           
		dc.w $FFFF
