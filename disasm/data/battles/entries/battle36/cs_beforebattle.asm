
; ASM FILE data\battles\entries\battle36\cs_beforebattle.asm :
; 0x4D88A..0x4D9A4 : Cutscene before battle 36
bbcs_36:        textCursor $B82
		loadMapFadeIn $35,$F,$0
		loadMapEntities ce_4D964
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		entityPosDir $7,$12,$0,$3
		setActscript $1F,$FF,eas_Init
		entityPosDir $1F,$14,$0,$3
		jumpIfFlagClear $4C,cs_4D8D6; Zynk is a follower
		setActscript $1A,$FF,eas_Init
		entityPosDir $1A,$3F,$3E,$3
cs_4D8D6:       playSound MUSIC_BATTLE_THEME_1
		fadeInB
		cameraSpeed $30
		moveEntity $0,$0,$3,$4
		endMove $8080
		moveEntity $7,$0,$3,$4
		endMove $8080
		moveEntity $1F,$0,$3,$4
		endMove $8080
		moveEntity $81,$FF,$3,$4
		endMove $8080
		nextSingleText $0,$80   ; "You're early!{N}{W2}"
		setCamDest $A,$E
		nextText $0,$80         ; "Darn you, Granseal swine!{W2}"
		nextText $0,$80         ; "But, don't worry.  I just{N}finished my preparations.{N}Yes...everything's ready.{W2}"
		nextSingleText $0,$80   ; "It's show time!{W1}"
		setActscript $82,$0,eas_AnimSpeedx2
		setActscript $83,$0,eas_AnimSpeedx2
		setActscript $84,$0,eas_AnimSpeedx2
		setActscript $85,$0,eas_AnimSpeedx2
		csWait $28
		setCamDest $E,$2
		setFacing $7,$0
		nextSingleText $0,$7    ; "Sir Astral, why is he smiling?{W1}"
		setFacing $1F,$2
		nextSingleText $0,$1F   ; "He believes this is the place{N}where we will die....{W1}"
		setFacing $1F,$3
		setFacing $0,$1
		nextSingleText $0,$1F   ; "{LEADER}, be careful!{W1}"
		entityNod $0
		setFacing $0,$3
		csc_end
ce_4D964:       dc.w $13
		dc.w 1
		dc.w 3
		dc.b $12
		dc.b 0
		dc.b 3
		dc.b 7
		dc.l eas_Init           
		dc.b $10
		dc.b $10
		dc.b 1
		dc.b $9F
		dc.l eas_Init           
		dc.b $13
		dc.b 0
		dc.b 3
		dc.b $3E
		dc.l eas_Init           
		dc.b $C
		dc.b $10
		dc.b 0
		dc.b $9D
		dc.l eas_Init           
		dc.b $D
		dc.b $11
		dc.b 1
		dc.b $9D
		dc.l eas_Init           
		dc.b $E
		dc.b $13
		dc.b 2
		dc.b $9D
		dc.l eas_Init           
		dc.b $F
		dc.b $14
		dc.b 1
		dc.b $9D
		dc.l eas_Init           
		dc.w $FFFF
