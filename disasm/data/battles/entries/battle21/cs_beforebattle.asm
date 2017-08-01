
; ASM FILE data\battles\entries\battle21\cs_beforebattle.asm :
; 0x4B790..0x4B88C : Cutscene before battle 21
bbcs_21:
		textCursor $A10         
						; Initial text line $A10 : "(Sniff, sniff)...I smell{N}more invaders from the east.{W2}"
		loadMapFadeIn $43,$5,$12
		loadMapEntities ce_4B84C
						; Entity data to figure out and format
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		entityPosDir $7,$1C,$18,$2
		setActscript $1F,$FF,eas_Init
		entityPosDir $1F,$1C,$16,$2
		entityPosDir $1E,$1C,$17,$2
		fadeInB
		csc45 $30               
						; (null)
		nextText $0,$80         
						; "(Sniff, sniff)...I smell{N}more invaders from the east.{W2}"
		nextSingleText $0,$80   
						; "This is the territory of{N}Mr. Creed.{W1}"
		setEntityDir $80,$0
		setEntityDir $81,$0
		setEntityDir $82,$0
		csWait $1E
		setCamDest $17,$12
		nextSingleText $0,$80   
						; "Go away!{W1}"
		moveEntity $7,$FF,$2,$2
		endMove $8080
		nextText $0,$7          
						; "But we have to see him.{W2}"
		nextSingleText $0,$7    
						; "Please let us pass!{W1}"
		setCamDest $5,$12
		moveEntity $80,$FF,$0,$1
		endMove $8080
		nextSingleText $0,$80   
						; "No!  Leave now!{W1}"
		csWait $32
		entityPosDir $83,$A,$18,$0
		csWait $28
		entityPosDir $84,$A,$14,$0
		csWait $1E
		entityPosDir $85,$A,$16,$0
		csWait $14
		nextSingleText $0,$80   
						; "Never mind.  Get 'em boys!{W1}"
		setActscript $83,$0,eas_Jump
		setActscript $84,$0,eas_Jump
		setActscript $85,$FF,eas_Jump
		csc_end                 
						; END OF CUTSCENE SCRIPT
ce_4B84C:
		dc.b   0
		dc.b $1B
		dc.b   0
		dc.b $17
		dc.b   0
		dc.b   2
		dc.b $1C
		dc.b $18
		dc.b 2
		dc.b 7
		dc.l eas_Init           
		dc.b 8
		dc.b $16
		dc.b 2
		dc.b $51
		dc.l eas_Init           
		dc.b 9
		dc.b $15
		dc.b 2
		dc.b $8C
		dc.l eas_Init           
		dc.b 9
		dc.b $17
		dc.b 2
		dc.b $86
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 0
		dc.b $7C
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 0
		dc.b $6C
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 0
		dc.b $4C
		dc.l eas_Init           
		dc.w $FFFF
