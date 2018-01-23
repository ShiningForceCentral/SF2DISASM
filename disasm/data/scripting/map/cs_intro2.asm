
; ASM FILE data\scripting\map\cs_intro2.asm :
; 0x48380..0x48540 : Intro cutscene 2
IntroCutscene2: textCursor $106A
		mapLoad 65,7,2
		loadMapEntities ce_48510
		setActscript $0,$FF,eas_Init
		cloneEntity $84,$83
		resetMap
		fadeInB
		reloadMap 7,2
		nextSingleText $80,$80  ; "Quite a storm.{D2}"
		loadMapFadeIn 65,7,2
		fadeInB
		csWait 40
		playSound SFX_DEMON_BREATH
		executeSubroutine ApplyStormEffect
		executeSubroutine ApplyStormEffect
		csWait 60
		setFacing $81,RIGHT
		nextSingleText $0,$81   ; "Excuse me?{D2}"
		nextSingleText $80,$80  ; "It's a stormy night.{D2}"
		setFacing $81,UP
		csWait 30
		playSound SFX_DEMON_BREATH
		executeSubroutine ApplyStormEffect
		executeSubroutine ApplyStormEffect
		csWait 40
		setFacing $81,RIGHT
		entityNod $81
		csWait 20
		nextSingleText $0,$81   ; "It's unusual for this time{N}of year.{D2}"
		csWait 30
		nextSingleText $0,$82   ; "Excuse me, your majesty.{D2}"
		setFacing $81,DOWN
		moveEntity $82,$FF,$1,$3
		endMove $8080
		setCamDest 7,4
		nextSingleText $0,$81   ; "Is it time to go to the{N}Ancient Tower?{D2}"
		entityNod $82
		nextSingleText $0,$82   ; "Yes, sire.{D2}"
		moveEntity $81,$FF,$3,$1
		moreMove $0,$2
		moreMove $B,$A
		endMove $8080
		nextSingleText $0,$81   ; "It's stormy outside.{N}Be careful.{D2}"
		entityNod $82
		csWait 30
		setCameraEntity $82
		moveEntity $82,$FF,$3,$3
		moreMove $2,$5
		moreMove $5,$3
		moreMove $2,$1
		moreMove $1,$1
		endMove $8080
		hideEntity $82
		setCameraEntity $FFFF
		csWait 30
		setCamDest 7,2
		csWait 40
		entityShiver $80
		nextSingleText $80,$80  ; "Hmmm....{D2}"
		setFacing $81,UP
		nextSingleText $0,$81   ; "Excuse me, sire?{D2}"
		nextSingleText $80,$80  ; "I have a bad feeling...{N}Oh, well.{D2}"
		csWait 40
		setFacing $81,LEFT
		csWait 40
		customActscript $81,$FF
		ac_setSpeed 2570        ;   
		ac_jump eas_Idle        ;   
		ac_end
		moveEntity $81,$FF,$2,$2
		moreMove $B,$1
		endMove $8080
		playSound SFX_SPELL_CAST
		nextSingleText $0,$81   ; "Oh, a gust of wind!{D2}"
		csWait 20
		entityShiver $80
		setFacing $80,DOWN
		nextSingleText $80,$80  ; "Make sure all the doors and{N}windows are shut!{D2}"
		playSound SFX_SPELL_CAST
		csWait 30
		animEntityFadeInOut $83,$6
		tintMap
		csWait 5
		setActscript $81,$0,eas_461B6
		csWait 30
		csWait 5
		setActscript $80,$0,eas_461B6
		playSound SFX_DEMON_BREATH
		csWait 30
		executeSubroutine ApplyStormEffect
		executeSubroutine ApplyStormEffect
		csWait 40
		playSound SFX_DEMON_BREATH
		executeSubroutine ApplyStormEffect
		executeSubroutine ApplyStormEffect
		csWait 5
		setActscript $81,$0,eas_461B6
		csWait 30
		csWait 5
		setActscript $80,$0,eas_461B6
		csWait 70
		fadeOutToBlackHalf
		csWait 30
		csc_end
ce_48510:       mainEntity 63,63,UP
		entity 12,6,DOWN,203,eas_Init
		entity 10,7,DOWN,205,eas_Init
		entity 12,13,UP,206,eas_Init
		entity 9,6,LEFT,187,eas_Init
		entity 15,6,LEFT,187,eas_Init
		dc.w $FFFF
