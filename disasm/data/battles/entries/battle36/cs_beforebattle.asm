
; ASM FILE data\battles\entries\battle36\cs_beforebattle.asm :
; 0x4D88A..0x4D9A4 : Cutscene before battle 36
bbcs_36:        textCursor $B82
		loadMapFadeIn 53,15,0
		loadMapEntities ce_4D964
		setActscriptWait $0,eas_Init
		setActscriptWait $7,eas_Init
		setPos $7,18,0,DOWN
		setActscriptWait $1F,eas_Init
		setPos $1F,20,0,DOWN
		jumpIfFlagClear $4C,cs_4D8D6; Zynk is a follower
		setActscriptWait $1A,eas_Init
		setPos $1A,63,62,DOWN
cs_4D8D6:       playSound MUSIC_BATTLE_THEME_1
		fadeInB
		cameraSpeed $30
		entityActions $0
		 moveDown 4
		endActions
		entityActions $7
		 moveDown 4
		endActions
		entityActions $1F
		 moveDown 4
		endActions
		entityActionsWait $81
		 moveDown 4
		endActions
		nextSingleText $0,$80   ; "You're early!{N}{W2}"
		setCamDest 10,14
		nextText $0,$80         ; "Darn you, Granseal swine!{W2}"
		nextText $0,$80         ; "But, don't worry.  I just{N}finished my preparations.{N}Yes...everything's ready.{W2}"
		nextSingleText $0,$80   ; "It's show time!{W1}"
		setActscript $82,eas_AnimSpeedx2
		setActscript $83,eas_AnimSpeedx2
		setActscript $84,eas_AnimSpeedx2
		setActscript $85,eas_AnimSpeedx2
		csWait 40
		setCamDest 14,2
		setFacing $7,RIGHT
		nextSingleText $0,$7    ; "Sir Astral, why is he smiling?{W1}"
		setFacing $1F,LEFT
		nextSingleText $0,$1F   ; "He believes this is the place{N}where we will die....{W1}"
		setFacing $1F,DOWN
		setFacing $0,UP
		nextSingleText $0,$1F   ; "{LEADER}, be careful!{W1}"
		nod $0
		setFacing $0,DOWN
		csc_end
ce_4D964:       mainEntity 19,1,DOWN
		entity 18,0,DOWN,7,eas_Init
		entity 16,16,UP,159,eas_Init
		entity 19,0,DOWN,62,eas_Init
		entity 12,16,RIGHT,157,eas_Init
		entity 13,17,UP,157,eas_Init
		entity 14,19,LEFT,157,eas_Init
		entity 15,20,UP,157,eas_Init
		dc.w $FFFF
