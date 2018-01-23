
; ASM FILE data\scripting\map\cs_intro4.asm :
; 0x48A78..0x48FE2 : Intro cutscene 4
IntroCutscene4: textCursor $1089
		mapLoad 65,7,3
		loadMapEntities ce_48FAA
		setActscript $0,$FF,eas_Init
		fadeInFromBlackHalf
		csWait 40
		moveEntity $81,$0,$3,$2
		endMove $8080
		playSound SFX_INTRO_LIGHTNING
		executeSubroutine ApplyStormEffect
		executeSubroutine ApplyStormEffect
		csWait 60
		textCursor $1089
		nextSingleText $0,$81   ; "Somebody bring a light to{N}the King's chamber!{D2}"
		csWait 20
		playSound SFX_DEMON_BREATH
		executeSubroutine ApplyStormEffect
		executeSubroutine ApplyStormEffect
		csWait 30
		setFacing $81,UP
		nextText $80,$80        ; "Oh...the wind blew out{N}all the candles!{D2}"
		nextSingleText $80,$80  ; "It's so dark.{N}I can't see a thing.{D2}"
		csWait 30
		executeSubroutine ApplyStormEffect
		setQuake 3
		flashScreenWhite $A
		mapFadeOutToWhite
		csWait 20
		playSound SFX_INTRO_LIGHTNING
		csWait 20
		mapFadeInFromWhite
		tintMap
		setQuake 0
		customActscript $80,$FF
		ac_setSpeed 12336       ;   
		ac_jump eas_Idle        ;   
		ac_end
		moveEntity $80,$FF,$3,$1
		endMove $8080
		nextSingleText $80,$80  ; "What was that?{D2}"
		csWait 5
		setActscript $81,$0,eas_461B6
		csWait 80
		moveEntity $81,$FF,$1,$2
		endMove $8080
		csWait 40
		setActscript $81,$FF,eas_46172
		customActscript $81,$FF
		ac_setSpeed 2056        ;   
		ac_jump eas_Idle        ;   
		ac_end
		moveEntity $81,$FF,$3,$1
		endMove $8080
		nextSingleText $0,$81   ; "Sire, the Ancient Tower...{D2}"
		moveEntity $80,$FF,$3,$1
		moreMove $A,$1
		endMove $8080
		nextSingleText $80,$80  ; "What's wrong?{D2}"
		setActscript $81,$FF,eas_Init
		setActscript $81,$FF,eas_Jump
		setActscript $81,$FF,eas_Jump
		nextSingleText $0,$81   ; "It's collapsing!{N}Maybe it was struck by{N}lightning?{D2}"
		moveEntity $80,$FF,$1,$1
		endMove $8080
		nextSingleText $80,$80  ; "No, not lightning...{D2}"
		csWait 20
		customActscript $80,$FF
		ac_setSpeed 2570        ;   
		ac_jump eas_Idle        ;   
		ac_end
		moveEntity $80,$FF,$3,$1
		endMove $8080
		nextSingleText $80,$80  ; "To my knowledge, that tower{N}is impervious to any type{N}of disaster.{D2}"
		playSound SFX_DEMON_BREATH
		executeSubroutine ApplyStormEffect
		executeSubroutine ApplyStormEffect
		csWait 30
		nextSingleText $0,$82   ; "Minister!{D2}"
		setFacing $81,LEFT
		setFacing $80,LEFT
		setCamDest 0,5
		setPos $82,3,9,DOWN
		setCameraEntity $82
		customActscript $82,$FF
		ac_setSpeed 10280       ;   
		ac_jump eas_Idle        ;   
		ac_end
		moveEntity $82,$FF,$3,$1
		moreMove $0,$1
		moreMove $7,$3
		moreMove $0,$3
		moreMove $1,$2
		endMove $8080
		setFacing $80,DOWN
		setFacing $81,DOWN
		csWait 20
		entityNod $82
		entityNod $82
		csWait 20
		setActscript $81,$FF,eas_Init
		setCamDest 7,5
		moveEntity $81,$FF,$3,$1
		endMove $8080
		nextSingleText $0,$81   ; "What is it?{D2}"
		nextSingleText $0,$82   ; "The...sealed door...{N}Ancient Tower...{D2}"
		setActscript $80,$FF,eas_Init
		moveEntity $80,$FF,$3,$1
		endMove $8080
		nextSingleText $80,$80  ; "Go on.{D2}"
		setActscript $82,$FF,eas_Init
		moveEntity $82,$FF,$0,$2
		moreMove $9,$1
		endMove $8080
		nextSingleText $0,$82   ; "It's open!{D2}"
		setActscript $81,$FF,eas_46172
		customActscript $81,$FF
		ac_setSpeed 2570        ;   
		ac_jump eas_Idle        ;   
		ac_end
		moveEntity $81,$FF,$1,$1
		endMove $8080
		nextSingleText $0,$81   ; "That's impossible!{N}It can't be opened!{D2}"
		moveEntity $82,$FF,$2,$2
		moreMove $9,$1
		endMove $8080
		nextSingleText $0,$82   ; "I'm sure it was closed{N}before the lightning, but...{D2}"
		csWait 40
		setFacing $81,RIGHT
		setFacing $80,LEFT
		csWait 40
		setFacing $81,DOWN
		setFacing $80,DOWN
		csWait 40
		nextSingleText $0,$81   ; "Strange.{D2}"
		entityNod $81
		nextSingleText $0,$81   ; "Sire, I'm going to go and{N}see what happened!{D2}"
		setActscript $81,$FF,eas_Init
		moveEntity $81,$FF,$3,$1
		moreMove $0,$1
		endMove $8080
		setFacing $80,LEFT
		nextSingleText $0,$81   ; "We must know the truth.{D2}"
		csWait 20
		entityNod $80
		nextSingleText $80,$80  ; "Be careful.{D2}"
		moveEntity $81,$FF,$2,$1
		moreMove $3,$1
		endMove $8080
		nextSingleText $0,$81   ; "Take me to the sealed door.{D2}"
		entityNod $82
		setCameraEntity $82
		moveEntity $82,$0,$3,$2
		moreMove $2,$3
		moreMove $5,$3
		moreMove $2,$1
		moreMove $1,$1
		endMove $8080
		moveEntity $81,$FF,$3,$3
		moreMove $2,$3
		moreMove $5,$3
		moreMove $2,$1
		moreMove $1,$1
		endMove $8080
		hideEntity $82
		hideEntity $81
		setCameraEntity $FFFF
		csWait 30
		setCamDest 7,5
		setCameraEntity $80
		playSound SFX_DEMON_BREATH
		executeSubroutine ApplyStormEffect
		executeSubroutine ApplyStormEffect
		csWait 30
		setFacing $80,DOWN
		csWait 30
		nextSingleText $80,$80  ; "Strange, strange indeed!{D2}"
		customActscript $80,$FF
		ac_setSpeed 2570        ;   
		ac_jump eas_Idle        ;   
		ac_end
		moveEntity $80,$FF,$1,$2
		endMove $8080
		csWait 20
		nextSingleText $80,$80  ; "Lightning at the Ancient{N}Tower.{D2}"
		setFacing $80,DOWN
		csWait 30
		setFacing $80,LEFT
		csWait 30
		setFacing $80,RIGHT
		csWait 30
		setFacing $80,DOWN
		csWait 30
		nextSingleText $80,$80  ; "Huh?{N}Did I hear something?{D2}"
		moveEntity $80,$FF,$3,$1
		endMove $8080
		nextSingleText $80,$80  ; "A sealed door that is open.{N}An unusual storm.{N}Everything is so strange.{D2}"
		csWait 5
		setActscript $80,$0,eas_461B6
		csWait 60
		moveEntity $80,$FF,$3,$1
		endMove $8080
		nextSingleText $80,$80  ; "What?  I feel as if someone{N}is watching me.{N}It must be my nerves.{D2}"
		setFacing $80,UP
		playSound SFX_INTRO_LIGHTNING
		setPos $84,9,11,UP
		executeSubroutine ApplyStormEffect
		executeSubroutine ApplyStormEffect
		setPos $84,63,63,UP
		csWait 60
		nextSingleText $80,$80  ; "I guess it was nothing.{N}I have to get a hold of{N}myself.{D2}"
		entityShakeHead $80
		customActscript $80,$FF
		ac_setSpeed 2570        ;   
		ac_jump eas_Idle        ;   
		ac_end
		moveEntity $80,$FF,$1,$1
		endMove $8080
		playSound SFX_INTRO_LIGHTNING
		setPos $84,9,11,UP
		executeSubroutine ApplyStormEffect
		executeSubroutine ApplyStormEffect
		setPos $84,63,63,UP
		csWait 60
		setFacing $80,DOWN
		csWait 30
		nextSingleText $80,$80  ; "What was that?{N}Who's there?!{D2}"
		setActscript $80,$FF,eas_46172
		moveEntity $80,$FF,$1,$1
		endMove $8080
		playSound SFX_INTRO_LIGHTNING
		setPos $84,9,11,UP
		executeSubroutine ApplyStormEffect
		executeSubroutine ApplyStormEffect
		setPos $84,63,63,UP
		csWait 60
		nextSingleText $80,$80  ; "It's not my imagination!{N}Somebody's in this room!{D2}"
		csWait 5
		setActscript $80,$0,eas_461B6
		csWait 80
		playSound SFX_INTRO_LIGHTNING
		setPos $84,9,11,UP
		executeSubroutine ApplyStormEffect
		executeSubroutine ApplyStormEffect
		setPos $84,63,63,UP
		csWait 60
		setFacing $80,UP
		setPos $83,9,2,DOWN
		setCamDest 7,1
		csWait 30
		setActscript $80,$FF,eas_Init
		setActscript $80,$FF,eas_Jump
		setActscript $80,$FF,eas_Jump
		nextSingleText $80,$80  ; "Hey!{D2}"
		customActscript $80,$FF
		ac_setSpeed 2570        ;   
		ac_jump eas_Idle        ;   
		ac_end
		setActscript $80,$FF,eas_46172
		moveEntity $80,$FF,$3,$1
		endMove $8080
		nextSingleText $80,$80  ; "Stay away from me!{D2}"
		setActscript $83,$FF,eas_Init2
		setActscript $83,$FF,eas_46172
		stopEntity $83
		moveEntity $83,$FF,$0,$1
		moreMove $3,$1
		moreMove $0,$1
		moreMove $3,$1
		endMove $8080
		moveEntity $83,$FF,$0,$1
		moreMove $3,$1
		endMove $8080
		startEntity $83
		setCameraEntity $80
		entityShiver $83
		csWait 30
		entityShiver $83
		entityShiver $83
		csWait 20
		moveEntity $80,$FF,$3,$1
		endMove $8080
		csWait 5
		setActscript $80,$0,eas_461E4
		csWait 30
		nextSingleText $80,$80  ; "Somebody...HELP!{D2}"
		setFacing $80,UP
		entityShiver $83
		csWait 30
		entityShiver $83
		customActscript $85,$FF
		ac_setSpeed 5140        ;   
		ac_jump eas_Idle        ;   
		ac_end
		setPos $85,12,5,DOWN
		moveEntity $85,$0,$3,$4
		endMove $8080
		entityFlashWhite $85,$50
		waitIdle $85
		setActscript $80,$0,eas_RotateRightHighSpeed
		entityFlashWhite $85,$28
		nextSingleText $80,$80  ; "Aughhhh!!!{D2}"
		hideEntity $85
		csWait 30
		setActscript $80,$0,eas_RotateRight
		csWait 50
		moveEntity $80,$FF,$B,$1
		moreMove $3,$1
		endMove $8080
		setFacing $80,UP
		customActscript $80,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $2           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		nextSingleText $80,$80  ; "(Sigh)....{D2}"
		entityShiver $83
		csWait 30
		playSound SFX_INTRO_LIGHTNING
		executeSubroutine ApplyStormEffect
		executeSubroutine ApplyStormEffect
		executeSubroutine ApplyStormEffect
		csWait 40
		entityShiver $83
		csWait 40
		fadeOutToBlackHalf
		csc_end
ce_48FAA:       mainEntity 63,63,UP
		entity 12,6,DOWN,203,eas_Init
		entity 10,7,DOWN,205,eas_Init
		entity 63,63,RIGHT,206,eas_Init
		entity 63,63,DOWN,159,eas_Init
		entity 63,63,UP,187,eas_Init
		entity 63,63,DOWN,183,eas_Init
		dc.w $FFFF
