
; ASM FILE data\scripting\map\cs_intro1.asm :
; 0x47F7E..0x48380 : Intro cutscene 1
IntroCutscene1: textCursor $105A
		mapLoad 42,2,5
		csWait 1
		loadMapEntities ce_48340
		setActscript $0,$FF,eas_Init
		setActscript $83,$FF,eas_Init3
		setActscript $84,$FF,eas_Init3
		setActscript $85,$FF,eas_Init3
		setActscript $82,$0,eas_Transparent
		fadeInFromBlackHalf
		csWait 30
		setPos $5,7,15,UP
		setPos $80,7,16,UP
		setPos $81,7,17,UP
		moveEntity $5,$0,$1,$6
		endMove $8080
		moveEntity $80,$0,$1,$6
		endMove $8080
		moveEntity $81,$FF,$1,$6
		endMove $8080
		playSound SFX_INTRO_LIGHTNING
		setQuake 1
		setPos $83,7,12,LEFT
		setPos $84,7,13,UP
		setPos $85,7,14,UP
		csWait 5
		setQuake 0
		setPos $83,63,63,LEFT
		setPos $84,63,63,UP
		setPos $85,63,63,UP
		csWait 10
		setFacing $5,DOWN
		setFacing $80,DOWN
		setFacing $81,DOWN
		setPos $83,7,12,LEFT
		setPos $84,7,13,UP
		setPos $85,7,14,UP
		csWait 5
		setPos $83,63,63,LEFT
		setPos $84,63,63,UP
		setPos $85,63,63,UP
		csWait 10
		setPos $83,7,12,LEFT
		setPos $84,7,13,UP
		setPos $85,7,14,UP
		csWait 5
		setPos $83,63,63,LEFT
		setPos $84,63,63,UP
		setPos $85,63,63,UP
		csWait 10
		setActscript $5,$0,eas_Jump
		setActscript $80,$0,eas_Jump
		setActscript $81,$FF,eas_Jump
		setActscript $5,$0,eas_Jump
		setActscript $80,$0,eas_Jump
		setActscript $81,$FF,eas_Jump
		csWait 30
		setCameraEntity $5
		moveEntity $5,$0,$1,$4
		endMove $8080
		moveEntity $80,$0,$1,$4
		endMove $8080
		moveEntity $81,$FF,$1,$4
		endMove $8080
		setActscript $80,$FF,eas_BumpUp
		setActscript $81,$FF,eas_BumpUp
		csWait 30
		setFacing $5,DOWN
		nextSingleText $80,$5   ; "Stay here, OK?{D2}"
		entityNod $80
		moveEntity $5,$FF,$0,$5
		endMove $8080
		setFacing $80,RIGHT
		setFacing $81,RIGHT
		moveEntity $5,$FF,$3,$3
		endMove $8080
		csWait 30
		entityShiver $5
		csWait 30
		nextSingleText $80,$5   ; "Oops, a dead end!{D2}"
		moveEntity $5,$FF,$1,$3
		moreMove $2,$5
		endMove $8080
		setFacing $80,UP
		setFacing $81,UP
		setFacing $5,DOWN
		csWait 20
		entityShakeHead $5
		csWait 20
		moveEntity $5,$FF,$2,$5
		endMove $8080
		setFacing $80,LEFT
		setFacing $81,LEFT
		moveEntity $5,$FF,$3,$3
		endMove $8080
		csWait 40
		entityShiver $5
		csWait 40
		nextSingleText $80,$5   ; "Hey!  I found some hidden{N}stairs!{D2}"
		moveEntity $5,$FF,$1,$2
		moreMove $8,$1
		endMove $8080
		nextSingleText $80,$5   ; "Hey, guys!{N}Follow me!{D2}"
		nextSingleText $0,$80   ; "Alright!{D2}"
		setActscript $80,$0,eas_Jump
		setActscript $81,$FF,eas_Jump
		setActscript $80,$0,eas_Jump
		setActscript $81,$FF,eas_Jump
		moveEntity $80,$0,$1,$1
		moreMove $2,$5
		moreMove $B,$1
		endMove $8080
		moveEntity $81,$FF,$1,$2
		moreMove $2,$4
		moreMove $B,$1
		endMove $8080
		setFacing $5,UP
		csWait 20
		moveEntity $5,$0,$3,$3
		endMove $8080
		moveEntity $80,$0,$3,$3
		endMove $8080
		moveEntity $81,$FF,$2,$1
		moreMove $3,$2
		endMove $8080
		playSound SFX_WARP
		fadeOutToBlackHalf
		setCameraEntity $FFFF
		setPos $5,19,3,DOWN
		setPos $80,19,3,DOWN
		setPos $81,19,3,DOWN
		reloadMap 15,0
		csWait 10
		fadeInFromBlackHalf
		setCameraEntity $5
		moveEntity $5,$FF,$3,$1
		endMove $8080
		csWait 10
		nextSingleText $80,$5   ; "Finally, I found the hidden{N}room of the Ancient Shrine!{D2}"
		moveEntity $5,$0,$3,$1
		endMove $8080
		moveEntity $80,$FF,$3,$1
		endMove $8080
		moveEntity $5,$0,$3,$2
		endMove $8080
		moveEntity $80,$0,$3,$2
		endMove $8080
		moveEntity $81,$FF,$3,$2
		endMove $8080
		csWait 30
		setActscript $5,$FF,eas_Jump
		setActscript $5,$FF,eas_Jump
		nextSingleText $80,$5   ; "A treasure chest!{D2}"
		customActscript $5,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $80,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $81,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $5,$0,$3,$2
		endMove $8080
		moveEntity $80,$0,$3,$2
		endMove $8080
		moveEntity $81,$FF,$3,$2
		endMove $8080
		setCamDest 15,5
		entityShiver $5
		nextSingleText $80,$5   ; "I wonder if they're here?{D2}"
		nextSingleText $FF,$FF  ; "{NAME;5} the thief opened{N}the chest.{D2}"
		setBlocks 7,3,1,1,19,10
		nextSingleText $FF,$FF  ; "He found Power Water.{D2}"
		entityShakeHead $5
		nextSingleText $80,$5   ; "No, I don't want this!{D2}"
		nextSingleText $FF,$FF  ; "{NAME;5} discarded the{N}Power Water.{D2}"
		setBlocks 4,3,1,1,19,10
		csWait 30
		setActscript $5,$FF,eas_Init
		setActscript $80,$FF,eas_Init
		setActscript $81,$FF,eas_Init
		moveEntity $81,$FF,$2,$1
		moreMove $3,$2
		moreMove $8,$1
		endMove $8080
		nextSingleText $0,$81   ; "Where on Earth are those{N}jewels?{D2}"
		csWait 10
		setFacing $5,LEFT
		nextSingleText $80,$5   ; "I'm not sure.{D2}"
		csWait 20
		setCameraEntity $5
		moveEntity $5,$0,$0,$5
		endMove $8080
		moveEntity $80,$0,$3,$1
		moreMove $0,$4
		endMove $8080
		moveEntity $81,$FF,$C,$14
		moreMove $0,$4
		endMove $8080
		csWait 5
		setActscript $5,$0,eas_461E4
		csWait 5
		setActscript $80,$0,eas_461B6
		csWait 5
		setActscript $81,$0,eas_461B6
		csWait 60
		moveEntity $5,$FF,$0,$2
		moreMove $1,$1
		endMove $8080
		nextSingleText $80,$5   ; "Something is shining over{N}there...!{D2}"
		setFacing $80,UP
		setFacing $81,UP
		setCamDest 21,1
		nextSingleText $80,$5   ; "Oh, they must be the jewels{N}of light and evil!{D2}"
		csWait 20
		fadeOutToBlackHalf
		csc_end
ce_48340:       dc.w $3F
		dc.w $3F
		dc.w 1
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b 5
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 1
		dc.b $CA
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 1
		dc.b $CA
		dc.l eas_Init           
		dc.b $1A
		dc.b 4
		dc.b 3
		dc.b $AD
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 2
		dc.b $B7
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 1
		dc.b $B7
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 1
		dc.b $B7
		dc.l eas_Init           
		dc.b $FF
		dc.b $FF
