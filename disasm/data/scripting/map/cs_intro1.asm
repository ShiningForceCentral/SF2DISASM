
; ASM FILE data\scripting\map\cs_intro1.asm :
; 0x47F7E..0x48380 : Intro cutscene 1
IntroCutscene1: textCursor $105A        ; Initial text line $105A : "Stay here, OK?{D2}"
		mapLoad $2A,$2,$5
		csWait $1
		loadMapEntities ce_48340; Entity data to figure out and format
		setActscript $0,$FF,eas_Init
		setActscript $83,$FF,eas_Init3
		setActscript $84,$FF,eas_Init3
		setActscript $85,$FF,eas_Init3
		setActscript $82,$0,eas_Transparent
		fadeInFromBlackHalf
		csWait $1E
		entityPosDir $5,$7,$F,$1
		entityPosDir $80,$7,$10,$1
		entityPosDir $81,$7,$11,$1
		moveEntity $5,$0,$1,$6
		endMove $8080
		moveEntity $80,$0,$1,$6
		endMove $8080
		moveEntity $81,$FF,$1,$6
		endMove $8080
		playSound SFX_INTRO_LIGHTNING
		setQuakeAmount $1
		entityPosDir $83,$7,$C,$2
		entityPosDir $84,$7,$D,$1
		entityPosDir $85,$7,$E,$1
		csWait $5
		setQuakeAmount $0
		entityPosDir $83,$3F,$3F,$2
		entityPosDir $84,$3F,$3F,$1
		entityPosDir $85,$3F,$3F,$1
		csWait $A
		setEntityDir $5,$3
		setEntityDir $80,$3
		setEntityDir $81,$3
		entityPosDir $83,$7,$C,$2
		entityPosDir $84,$7,$D,$1
		entityPosDir $85,$7,$E,$1
		csWait $5
		entityPosDir $83,$3F,$3F,$2
		entityPosDir $84,$3F,$3F,$1
		entityPosDir $85,$3F,$3F,$1
		csWait $A
		entityPosDir $83,$7,$C,$2
		entityPosDir $84,$7,$D,$1
		entityPosDir $85,$7,$E,$1
		csWait $5
		entityPosDir $83,$3F,$3F,$2
		entityPosDir $84,$3F,$3F,$1
		entityPosDir $85,$3F,$3F,$1
		csWait $A
		setActscript $5,$0,eas_Jump
		setActscript $80,$0,eas_Jump
		setActscript $81,$FF,eas_Jump
		setActscript $5,$0,eas_Jump
		setActscript $80,$0,eas_Jump
		setActscript $81,$FF,eas_Jump
		csWait $1E
		setCameraEntity $5
		moveEntity $5,$0,$1,$4
		endMove $8080
		moveEntity $80,$0,$1,$4
		endMove $8080
		moveEntity $81,$FF,$1,$4
		endMove $8080
		setActscript $80,$FF,eas_BumpUp
		setActscript $81,$FF,eas_BumpUp
		csWait $1E
		setEntityDir $5,$3
		nextSingleText $80,$5   ; "Stay here, OK?{D2}"
		entityNod $80
		moveEntity $5,$FF,$0,$5
		endMove $8080
		setEntityDir $80,$0
		setEntityDir $81,$0
		moveEntity $5,$FF,$3,$3
		endMove $8080
		csWait $1E
		entityShiver $5
		csWait $1E
		nextSingleText $80,$5   ; "Oops, a dead end!{D2}"
		moveEntity $5,$FF,$1,$3
		moreMove $2,$5
		endMove $8080
		setEntityDir $80,$1
		setEntityDir $81,$1
		setEntityDir $5,$3
		csWait $14
		entityShakeHead $5
		csWait $14
		moveEntity $5,$FF,$2,$5
		endMove $8080
		setEntityDir $80,$2
		setEntityDir $81,$2
		moveEntity $5,$FF,$3,$3
		endMove $8080
		csWait $28
		entityShiver $5
		csWait $28
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
		setEntityDir $5,$1
		csWait $14
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
		entityPosDir $5,$13,$3,$3
		entityPosDir $80,$13,$3,$3
		entityPosDir $81,$13,$3,$3
		csc46 $F,$0             ; 0046 UNKNOWN
		csWait $A
		fadeInFromBlackHalf
		setCameraEntity $5
		moveEntity $5,$FF,$3,$1
		endMove $8080
		csWait $A
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
		csWait $1E
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
		setCamDest $F,$5
		entityShiver $5
		nextSingleText $80,$5   ; "I wonder if they're here?{D2}"
		nextSingleText $FF,$FF  ; "{NAME;5} the thief opened{N}the chest.{D2}"
		setBlocks $703,$101,$130A
		nextSingleText $FF,$FF  ; "He found Power Water.{D2}"
		entityShakeHead $5
		nextSingleText $80,$5   ; "No, I don't want this!{D2}"
		nextSingleText $FF,$FF  ; "{NAME;5} discarded the{N}Power Water.{D2}"
		setBlocks $403,$101,$130A
		csWait $1E
		setActscript $5,$FF,eas_Init
		setActscript $80,$FF,eas_Init
		setActscript $81,$FF,eas_Init
		moveEntity $81,$FF,$2,$1
		moreMove $3,$2
		moreMove $8,$1
		endMove $8080
		nextSingleText $0,$81   ; "Where on Earth are those{N}jewels?{D2}"
		csWait $A
		setEntityDir $5,$2
		nextSingleText $80,$5   ; "I'm not sure.{D2}"
		csWait $14
		setCameraEntity $5
		moveEntity $5,$0,$0,$5
		endMove $8080
		moveEntity $80,$0,$3,$1
		moreMove $0,$4
		endMove $8080
		moveEntity $81,$FF,$C,$14
		moreMove $0,$4
		endMove $8080
		csWait $5
		setActscript $5,$0,eas_461E4
		csWait $5
		setActscript $80,$0,eas_461B6
		csWait $5
		setActscript $81,$0,eas_461B6
		csWait $3C
		moveEntity $5,$FF,$0,$2
		moreMove $1,$1
		endMove $8080
		nextSingleText $80,$5   ; "Something is shining over{N}there...!{D2}"
		setEntityDir $80,$1
		setEntityDir $81,$1
		setCamDest $15,$1
		nextSingleText $80,$5   ; "Oh, they must be the jewels{N}of light and evil!{D2}"
		csWait $14
		fadeOutToBlackHalf
		csc_end                 ; END OF CUTSCENE SCRIPT
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
