
; ASM FILE data\battles\entries\battle04\cs_beforebattle.asm :
; 0x4981E..0x498EE : Cutscene before battle 4
bbcs_04:        textCursor $907
		loadMapFadeIn 66,1,5
		loadMapEntities ce_4989E
		setActscriptWait $0,eas_Init
		setPos $4,6,9,DOWN
		fadeInB
		setActscriptWait $4,eas_Jump
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
		entityActionsWait $1C
		 moveDown 1
		 moveRight 2
		 moveDown 2
		 moveRight 1
		 moveDown 1
		endActions
		entityActionsWait $1C
		 moveRight 2
		 moveDown 1
		endActions
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
