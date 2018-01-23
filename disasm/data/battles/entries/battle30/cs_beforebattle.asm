
; ASM FILE data\battles\entries\battle30\cs_beforebattle.asm :
; 0x4C5E6..0x4C6A8 : Cutscene before battle 30
bbcs_30:        textCursor $AC8
		loadMapFadeIn 1,7,21
		loadMapEntities ce_4C690
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setPos $7,11,28,UP
		setActscript $1F,$FF,eas_Init
		setPos $1F,11,27,UP
		playSound MUSIC_BATTLE_THEME_1
		fadeInB
		moveEntity $0,$0,$1,$2
		endMove $8080
		moveEntity $1F,$0,$1,$2
		endMove $8080
		moveEntity $7,$FF,$1,$2
		endMove $8080
		nextSingleText $0,$80   ; "What a pleasure!{N}Nice to meet you.{W1}"
		setActscript $7,$FF,eas_Jump
		moveEntity $1F,$FF,$0,$1
		moreMove $1,$1
		endMove $8080
		entityNod $1F
		nextSingleText $C0,$1F  ; "Ohhh....{N}He's ugly, isn't he?{W1}"
		setCamDest 7,0
		moveEntity $80,$FF,$2,$2
		endMove $8080
		setCameraEntity $80
		moveEntity $80,$FF,$3,$2
		endMove $8080
		nextText $0,$80         ; "What?!{N}You dare insult me?!{W2}"
		nextSingleText $0,$80   ; "I've never...{N}For that you will die!{W1}"
		moveEntity $80,$FF,$3,$1
		endMove $8080
		nextSingleText $0,$80   ; "Are you ready to die?{W1}"
		playSound SFX_INTRO_LIGHTNING
		flashScreenWhite $28
		csc_end
ce_4C690:       mainEntity 11,26,UP
		entity 11,28,UP,7,eas_Init
		entity 13,4,DOWN,155,eas_Init
		dc.w $FFFF
