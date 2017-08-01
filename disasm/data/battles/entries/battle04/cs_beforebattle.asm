
; ASM FILE data\battles\entries\battle04\cs_beforebattle.asm :
; 0x4981E..0x498EE : Cutscene before battle 4
bbcs_04:
		textCursor $907         
						; Initial text line $907 : "Who are they?{W1}"
		loadMapFadeIn $42,$1,$5
		loadMapEntities ce_4989E
						; Entity data to figure out and format
		setActscript $0,$FF,eas_Init
		entityPosDir $4,$6,$9,$3
		fadeInB
		setActscript $4,$FF,eas_Jump
		nextSingleText $0,$4    
						; "Who are they?{W1}"
		setCamDest $7,$D
		nextSingleText $0,$4    
						; "Galam soldiers!{W1}"
		nextSingleText $C0,$1C  
						; "Greetings, Granseal scum!{W1}"
		nextSingleText $0,$4    
						; "Why did you kill Sir{N}Hawel?  How could you be{N}so mean?{W1}"
		nextSingleText $C0,$1C  
						; "Ummm....{W1}"
		nextText $0,$4          
						; "Answer me!{W1}"
		nextSingleText $0,$4    
						; "{LEADER}, we must{N}defeat them so we can learn{N}the truth!{W1}"
		setEntityDir $1C,$3
		csWait $1E
		setEntityDir $1C,$0
		setEntityDir $80,$2
		csWait $14
		nextSingleText $C0,$1C  
						; "Capture them alive!{W1}"
		entityNod $80
		moveEntity $1C,$FF,$3,$1
		moreMove $0,$2
		moreMove $3,$2
		moreMove $0,$1
		moreMove $3,$1
		endMove $8080
		moveEntity $1C,$FF,$0,$2
		moreMove $3,$1
		endMove $8080
		csc_end                 
						; END OF CUTSCENE SCRIPT
ce_4989E:
		dc.b   0
		dc.b   5
		dc.b   0
		dc.b   9
		dc.b   0
		dc.b   3
		dc.b   6
		dc.b   9
		dc.b 3
		dc.b 4
		dc.l eas_Init           
		dc.b 5
		dc.b 8
		dc.b 3
		dc.b 1
		dc.l eas_Init           
		dc.b 5
		dc.b 7
		dc.b 3
		dc.b 2
		dc.l eas_Init           
		dc.b 6
		dc.b 8
		dc.b 3
		dc.b 3
		dc.l eas_Init           
		dc.b $D
		dc.b $11
		dc.b 1
		dc.b $1C
		dc.l eas_Init           
		dc.b $E
		dc.b $11
		dc.b 1
		dc.b $78
		dc.l eas_Init           
		dc.b $B
		dc.b $12
		dc.b 1
		dc.b $42
		dc.l eas_Init           
		dc.b $C
		dc.b $12
		dc.b 1
		dc.b $42
		dc.l eas_Init           
		dc.b $E
		dc.b $10
		dc.b 1
		dc.b $42
		dc.l eas_Init           
		dc.w $FFFF
