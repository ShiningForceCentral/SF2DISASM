
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
		moveEntity $87,$FF,$1,$1
		endMove $8080
		csWait 5
		setActscript $87,$0,eas_461B6
		csWait 60
		nextSingleText $0,$87   ; "Hmm, what a mysterious{N}tower.  I wonder who built{N}it?{W1}"
		moveEntity $87,$FF,$1,$1
		moreMove $C,$3C
		moreMove $1,$1
		endMove $8080
		csWait 50
		nextSingleText $0,$87   ; "I have a strange feeling{N}about this place.{W1}"
		moveEntity $87,$FF,$1,$3
		endMove $8080
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
		moveEntity $1,$FF,$1,$1
		endMove $8080
		nextSingleText $0,$1    ; "Look!  Something is{N}appearing.  What's that?{W1}"
		setFacing $87,UP
		setCamDest 2,1
		setPos $80,7,4,DOWN
		animEntityFadeInOut $80,$7
		setActscript $80,$FF,eas_46172
		setActscript $87,$FF,eas_46172
		moveEntity $87,$FF,$3,$1
		endMove $8080
		nextText $0,$87         ; "An evil Gizmo!  A devil{N}that possesses people!{W2}"
		nextSingleText $0,$87   ; "Why are you here?{W1}"
		csWait 30
		moveEntity $80,$FF,$0,$1
		endMove $8080
		moveEntity $87,$FF,$0,$1
		endMove $8080
		nextSingleText $0,$87   ; "Where are you going?{N}What...wait!  You're here to{N}possess the King, aren't you?{W1}"
		moveEntity $80,$FF,$2,$1
		endMove $8080
		moveEntity $87,$FF,$2,$1
		endMove $8080
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
		moveEntity $81,$0,$1,$1
		endMove $8080
		moveEntity $82,$0,$2,$1
		endMove $8080
		moveEntity $83,$0,$3,$1
		moreMove $2,$1
		endMove $8080
		moveEntity $84,$0,$0,$2
		moreMove $1,$1
		endMove $8080
		moveEntity $85,$0,$0,$3
		endMove $8080
		moveEntity $86,$0,$0,$3
		moreMove $3,$1
		endMove $8080
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
ce_49694:       dc.w 7
		dc.w $10
		dc.w 1
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $72
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $67
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $67
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $67
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $67
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $67
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $67
		dc.l eas_Init           
		dc.b 7
		dc.b $B
		dc.b 1
		dc.b $D1
		dc.l eas_Init           
		dc.w $FFFF
