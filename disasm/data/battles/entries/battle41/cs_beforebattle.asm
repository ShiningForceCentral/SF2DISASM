
; ASM FILE data\battles\entries\battle41\cs_beforebattle.asm :
; 0x4ED0E..0x4ED8E : Cutscene before battle 41
bbcs_41:        textCursor $C0B
		loadMapFadeIn $38,$C,$15
		loadMapEntities ce_4ED76
		setActscript $0,$FF,eas_Init
		entityPosDir $7,$10,$18,$0
		entityPosDir $1F,$F,$18,$0
		entityPosDir $1C,$E,$18,$0
		jumpIfFlagClear $4C,cs_4ED48; Zynk is a follower
		entityPosDir $1A,$D,$18,$0
cs_4ED48:       playSound MUSIC_BATTLE_THEME_3
		fadeInB
		nextSingleText $0,$80   ; "Who are you?!{N}Oh, are you from Granseal?{W1}"
		setFacing $0,$1
		setCamDest $C,$4
		nextSingleText $0,$80   ; "But, Odd Eye went to...{W2}"
		moveEntity $80,$FF,$3,$2
		endMove $8080
		nextText $0,$80         ; "Impossible!{N}He was defeated?{W2}"
		nextText $0,$80         ; "Inconceivable!  But...{N}OK, I'll stop you here.{W2}"
		nextSingleText $0,$80   ; "You shall die now!{W1}"
		csc_end
ce_4ED76:       dc.w $11
		dc.w $18
		dc.w 0
		dc.b $10
		dc.b $18
		dc.b 0
		dc.b 7
		dc.l eas_Init           
		dc.b $10
		dc.b 6
		dc.b 3
		dc.b $63
		dc.l eas_Init           
		dc.w $FFFF
