
; ASM FILE data\battles\entries\battle30\cs_beforebattle.asm :
; 0x4C5E6..0x4C6A8 : Cutscene before battle 30
bbcs_30:        textCursor $AC8         ; Initial text line $AC8 : "What a pleasure!{N}Nice to meet you.{W1}"
		loadMapFadeIn $1,$7,$15
		loadMapEntities ce_4C690; Entity data to figure out and format
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		entityPosDir $7,$B,$1C,$1
		setActscript $1F,$FF,eas_Init
		entityPosDir $1F,$B,$1B,$1
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
		setCamDest $7,$0
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
		csc_end                 ; END OF CUTSCENE SCRIPT
ce_4C690:       dc.b   0
		dc.b  $B
		dc.w $1A
		dc.w 1
		dc.b $B
		dc.b $1C
		dc.b 1
		dc.b 7
		dc.l eas_Init           
		dc.b $D
		dc.b 4
		dc.b 3
		dc.b $9B
		dc.l eas_Init           
		dc.w $FFFF
