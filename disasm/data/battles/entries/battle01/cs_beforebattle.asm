
; ASM FILE data\battles\entries\battle01\cs_beforebattle.asm :
; 0x494BC..0x496DC : Cutscene before battle 1
bbcs_01:        textCursor $8F4
		loadMapFadeIn 57,2,10
		loadMapEntities ce_49694
		setActscript $0,$FF,eas_Init
		setPos $1,8,17,UP
		setPos $2,7,17,UP
		setActscript $1,$FF,eas_Init
		fadeInB
		setCamDest 2,8
		csWait 60
		setFacing $87,DOWN
		nextText $0,$87         ; "There you are, {LEADER}.{N}Stay here.{W2}"
		nextSingleText $0,$87   ; "I'll take a look inside the{N}tower.{W1}"
		setCameraEntity $87
		entityActions $87,$FF
		 moveUp 1
		endActions
		csWait 5
		setActscript $87,$0,eas_461B6
		csWait 60
		nextSingleText $0,$87   ; "Hmm, what a mysterious{N}tower.  I wonder who built{N}it?{W1}"
		entityActions $87,$FF
		 moveUp 1
		 actionC 60
		 moveUp 1
		endActions
		csWait 50
		nextSingleText $0,$87   ; "I have a strange feeling{N}about this place.{W1}"
		entityActions $87,$FF
		 moveUp 3
		endActions
		nextSingleText $0,$87   ; "Oh, what's this?{N}I think I have seen this{N}symbol before....{W1}"
		csWait 40
		mapFadeOutToWhite
		csWait 30
		mapFadeInFromWhite
		csWait 30
		mapFadeOutToWhite
		csWait 30
		mapFadeInFromWhite
		csWait 5
		setActscript $87,$0,eas_461B6
		csWait 30
		mapFadeOutToWhite
		csWait 30
		mapFadeInFromWhite
		csWait 30
		setCamDest 2,10
		csWait 5
		setActscript $2,$0,eas_461B6
		csWait 60
		nextSingleText $0,$2    ; "What's happening?{W1}"
		entityActions $1,$FF
		 moveUp 1
		endActions
		nextSingleText $0,$1    ; "Look!  Something is{N}appearing.  What's that?{W1}"
		setFacing $87,UP
		setCamDest 2,1
		setPos $80,7,4,DOWN
		animEntityFadeInOut $80,$7
		setActscript $80,$FF,eas_46172
		setActscript $87,$FF,eas_46172
		entityActions $87,$FF
		 moveDown 1
		endActions
		nextText $0,$87         ; "An evil Gizmo!  A devil{N}that possesses people!{W2}"
		nextSingleText $0,$87   ; "Why are you here?{W1}"
		csWait 30
		entityActions $80,$FF
		 moveRight 1
		endActions
		entityActions $87,$FF
		 moveRight 1
		endActions
		nextSingleText $0,$87   ; "Where are you going?{N}What...wait!  You're here to{N}possess the King, aren't you?{W1}"
		entityActions $80,$FF
		 moveLeft 1
		endActions
		entityActions $87,$FF
		 moveLeft 1
		endActions
		nextSingleText $0,$87   ; "I won't let you pass.{N}You shall not harm the King!{W1}"
		entityShiver $80
		csWait 30
		entityShiver $80
		setPos $81,7,4,DOWN
		setPos $82,7,4,DOWN
		setPos $83,7,4,DOWN
		setPos $84,7,4,DOWN
		setPos $85,7,4,DOWN
		setPos $86,7,4,DOWN
		setActscript $81,$FF,eas_46172
		setActscript $82,$FF,eas_46172
		setActscript $83,$FF,eas_46172
		setActscript $84,$FF,eas_46172
		setActscript $85,$FF,eas_46172
		setActscript $86,$FF,eas_46172
		entityActions $81,$0
		 moveUp 1
		endActions
		entityActions $82,$0
		 moveLeft 1
		endActions
		entityActions $83,$0
		 moveDown 1
		 moveLeft 1
		endActions
		entityActions $84,$0
		 moveRight 2
		 moveUp 1
		endActions
		entityActions $85,$0
		 moveRight 3
		endActions
		entityActions $86,$0
		 moveRight 3
		 moveDown 1
		endActions
		entityShiver $80
		csWait 30
		entityShiver $80
		csWait 30
		entityShiver $80
		csWait 60
		nextText $0,$87         ; "This doesn't look good.{W2}"
		setFacing $87,DOWN
		nextSingleText $0,$87   ; "We'll stop the evil Gizmo{N}here.  {LEADER}, defeat{N}these fiends!{W1}"
		csc_end
ce_49694:       mainEntity 7,16,UP
		entity 63,63,DOWN,114,eas_Init
		entity 63,63,DOWN,103,eas_Init
		entity 63,63,DOWN,103,eas_Init
		entity 63,63,DOWN,103,eas_Init
		entity 63,63,DOWN,103,eas_Init
		entity 63,63,DOWN,103,eas_Init
		entity 63,63,DOWN,103,eas_Init
		entity 7,11,UP,209,eas_Init
		dc.w $FFFF
