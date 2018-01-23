
; ASM FILE data\battles\entries\battle04\cs_beforebattle.asm :
; 0x4981E..0x498EE : Cutscene before battle 4
bbcs_04:        textCursor $907
		loadMapFadeIn 66,1,5
		loadMapEntities ce_4989E
		setActscript $0,$FF,eas_Init
		setPos $4,6,9,DOWN
		fadeInB
		setActscript $4,$FF,eas_Jump
		nextSingleText $0,$4    ; "Who are they?{W1}"
		setCamDest 7,13
		nextSingleText $0,$4    ; "Galam soldiers!{W1}"
		nextSingleText $C0,$1C  ; "Greetings, Granseal scum!{W1}"
		nextSingleText $0,$4    ; "Why did you kill Sir{N}Hawel?  How could you be{N}so mean?{W1}"
		nextSingleText $C0,$1C  ; "Ummm....{W1}"
		nextText $0,$4          ; "Answer me!{W1}"
		nextSingleText $0,$4    ; "{LEADER}, we must{N}defeat them so we can learn{N}the truth!{W1}"
		setFacing $1C,DOWN
		csWait 30
		setFacing $1C,RIGHT
		setFacing $80,LEFT
		csWait 20
		nextSingleText $C0,$1C  ; "Capture them alive!{W1}"
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
ce_4989E:       mainEntity 5,9,DOWN
		entity 6,9,DOWN,4,eas_Init
		entity 5,8,DOWN,1,eas_Init
		entity 5,7,DOWN,2,eas_Init
		entity 6,8,DOWN,3,eas_Init
		entity 13,17,UP,28,eas_Init
		entity 14,17,UP,120,eas_Init
		entity 11,18,UP,66,eas_Init
		entity 12,18,UP,66,eas_Init
		entity 14,16,UP,66,eas_Init
		dc.w $FFFF
