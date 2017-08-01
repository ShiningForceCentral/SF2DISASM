
; ASM FILE data\battles\entries\battle11\cs_beforebattle.asm :
; 0x4ABFE..0x4ACC8 : Cutscene before battle 11
bbcs_11:
		textCursor $9B3         
						; Initial text line $9B3 : "You'll come to the foot of{N}Mt. Volcano through this{N}dark cave.{W2}"
		setCameraEntity $0
		loadMapFadeIn $30,$8,$13
		loadMapEntities ce_4ACA0
						; Entity data to figure out and format
		setActscript $0,$FF,eas_Init
		setCameraEntity $0
		executeSubroutine sub_458E
		fadeInB
		playSound $FD
		moveEntity $7,$FF,$2,$1
		moreMove $1,$1
		endMove $8080
		nextSingleText $0,$7    
						; "You'll come to the foot of{N}Mt. Volcano through this{N}dark cave.{W2}"
		setEntityDir $7,$0
		setEntityDir $0,$2
		nextSingleText $0,$7    
						; "But, I heard this cave is{N}home to a hobgoblin.{W1}"
		csWait $14
		nextSingleText $0,$80   
						; "Yes, it is!{W1}"
		playSound MUSIC_ENEMY_ATTACK
		moveEntity $7,$FF,$1,$1
		endMove $8080
		csWait $5
		setActscript $0,$0,eas_461B6
		csWait $5
		setActscript $7,$0,eas_461E4
		csWait $78
		setEntityDir $0,$1
		moveEntity $7,$FF,$1,$1
		endMove $8080
		nextSingleText $0,$7    
						; "Wh...Who said that?{W1}"
		nextSingleText $0,$80   
						; "Me!  The hobgoblin!{W1}"
		csc45 $20               
						; (null)
		setCameraEntity $80
		nextSingleText $0,$80   
						; "Welcome to my home.{W2}"
		moveEntity $80,$FF,$3,$1
		endMove $8080
		nextSingleText $0,$80   
						; "Enjoy your visit because{N}you're not leaving!{W1}"
		playSound $FD
		csc_end                 
						; END OF CUTSCENE SCRIPT
ce_4ACA0:
		dc.b   0
		dc.b  $F
		dc.w $18
		dc.w 1
		dc.b $F
		dc.b $19
		dc.b 1
		dc.b 7
		dc.l eas_Init           
		dc.b $F
		dc.b 3
		dc.b 3
		dc.b $47
		dc.l eas_Init           
		dc.b $10
		dc.b 4
		dc.b 3
		dc.b $69
		dc.l eas_Init           
		dc.b $E
		dc.b 4
		dc.b 3
		dc.b $84
		dc.l eas_Init           
		dc.w $FFFF
