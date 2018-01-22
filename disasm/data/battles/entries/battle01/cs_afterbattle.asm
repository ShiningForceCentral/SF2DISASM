
; ASM FILE data\battles\entries\battle01\cs_afterbattle.asm :
; 0x496DC..0x4980E : Cutscene after battle 1
abcs_battle01:  textCursor $901
		resetForceBattleStats
		loadMapFadeIn $39,$2,$0
		loadMapEntities ce_497F6
		setActscript $0,$FF,eas_Init
		entityPosDir $1,$8,$7,$1
		entityPosDir $2,$8,$8,$1
		fadeInB
		csWait $28
		nextSingleText $0,$81   ; "Well done, {LEADER}!{N}What should I do with this{N}devil?{W1}"
		setFacing $81,$1
		csWait $28
		entityShiver $80
		csWait $1E
		entityShiver $80
		csWait $1E
		mapFadeOutToWhite
		csWait $1E
		mapFadeInFromWhite
		csWait $5
		setActscript $81,$0,eas_461B6
		csWait $5
		setActscript $0,$0,eas_461B6
		csWait $1E
		mapFadeOutToWhite
		csWait $1E
		mapFadeInFromWhite
		csWait $1E
		mapFadeOutToWhite
		animEntityFadeInOut $80,$6
		entitySprite $80,$3C
		entityPosDir $80,$7,$A,$3
		entitySprite $80,$72
		mapFadeInFromWhite
		csWait $1E
		moveEntity $81,$FF,$1,$1
		endMove $8080
		nextSingleText $0,$81   ; "Oh, it disappeared?!{W1}"
		csWait $5
		setActscript $81,$0,eas_461B6
		csWait $78
		moveEntity $81,$FF,$3,$1
		endMove $8080
		nextSingleText $0,$81   ; "Oh, there it is!{W1}"
		setFacing $0,$3
		setFacing $1,$3
		setFacing $2,$3
		setCamDest $2,$3
		csWait $46
		mapFadeOutToWhite
		animEntityFadeInOut $80,$6
		entitySprite $80,$3C
		entityPosDir $80,$7,$10,$3
		entitySprite $80,$72
		mapFadeInFromWhite
		csWait $1E
		nextSingleText $0,$81   ; "It disappeared again.{W1}"
		setCamDest $2,$A
		nextSingleText $0,$81   ; "There it is!{W1}"
		moveEntity $80,$0,$3,$4
		endMove $8080
		animEntityFadeInOut $80,$6
		csWait $14
		hideEntity $80
		setCamDest $2,$2
		setFacing $81,$0
		nextSingleText $0,$81   ; "We must hurry to the King!{W1}"
		moveEntity $81,$FF,$3,$6
		endMove $8080
		hideEntity $81
		csWait $28
		csc_end
ce_497F6:       dc.w 8
		dc.w 6
		dc.w 1
		dc.b 7
		dc.b 4
		dc.b 3
		dc.b $72
		dc.l eas_Init           
		dc.b 7
		dc.b 6
		dc.b 0
		dc.b $D1
		dc.l eas_Init           
		dc.w $FFFF
