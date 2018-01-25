
; ASM FILE data\battles\entries\battle30\cs_beforebattle.asm :
; 0x4C5E6..0x4C6A8 : Cutscene before battle 30
bbcs_30:        textCursor $AC8
		loadMapFadeIn 1,7,21
		loadMapEntities ce_4C690
		setActscriptWait $0,eas_Init
		setActscriptWait $7,eas_Init
		setPos $7,11,28,UP
		setActscriptWait $1F,eas_Init
		setPos $1F,11,27,UP
		playSound MUSIC_BATTLE_THEME_1
		fadeInB
		entityActions $0
		 moveUp 2
		endActions
		entityActions $1F
		 moveUp 2
		endActions
		entityActionsWait $7
		 moveUp 2
		endActions
		nextSingleText $0,$80   ; "What a pleasure!{N}Nice to meet you.{W1}"
		setActscriptWait $7,eas_Jump
		entityActionsWait $1F
		 moveRight 1
		 moveUp 1
		endActions
		entityNod $1F
		nextSingleText $C0,$1F  ; "Ohhh....{N}He's ugly, isn't he?{W1}"
		setCamDest 7,0
		entityActionsWait $80
		 moveLeft 2
		endActions
		setCameraEntity $80
		entityActionsWait $80
		 moveDown 2
		endActions
		nextText $0,$80         ; "What?!{N}You dare insult me?!{W2}"
		nextSingleText $0,$80   ; "I've never...{N}For that you will die!{W1}"
		entityActionsWait $80
		 moveDown 1
		endActions
		nextSingleText $0,$80   ; "Are you ready to die?{W1}"
		playSound SFX_INTRO_LIGHTNING
		flashScreenWhite $28
		csc_end
ce_4C690:       mainEntity 11,26,UP
		entity 11,28,UP,7,eas_Init
		entity 13,4,DOWN,155,eas_Init
		dc.w $FFFF
