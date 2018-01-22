
; ASM FILE data\scripting\map\cs_intro3.asm :
; 0x48540..0x48A78 : Intro cutscene 3
IntroCutscene3: textCursor $1077
		mapLoad 42,21,1
		loadMapEntities ce_48A50
		setActscript $0,$FF,eas_Init
		resetMap
		fadeInB
		reloadMap 21,1
		nextSingleText $80,$5   ; "Well?{D2}"
		loadMapFadeIn 42,21,1
		setActscript $82,$0,eas_Transparent
		fadeInFromBlackHalf
		setCameraEntity $5
		entityShiver $80
		entityShiver $80
		nextSingleText $0,$80   ; "Ugh!  Ugghhh!{N}Phew...I can't...{D2}"
		moveEntity $81,$FF,$1,$1
		moreMove $A,$1
		endMove $8080
		setFacing $80,0
		nextSingleText $0,$81   ; "You wimp!{N}Let me do it!{D2}"
		entityShiver $80
		csWait 20
		moveEntity $81,$0,$2,$1
		moreMove $B,$1
		endMove $8080
		moveEntity $80,$FF,$2,$1
		moreMove $3,$1
		moreMove $9,$1
		endMove $8080
		csWait 30
		setFacing $81,3
		nextSingleText $0,$81   ; "Yeah, right.{D2}"
		csWait 20
		setFacing $81,1
		csWait 30
		entityShiver $81
		entityShiver $81
		csWait 30
		entityShiver $81
		csWait 30
		setFacing $81,3
		entityShakeHead $81
		nextSingleText $0,$81   ; "Blast!  It won't budge!{D2}"
		moveEntity $5,$FF,$1,$1
		endMove $8080
		csWait 10
		setActscript $5,$FF,eas_Jump
		setActscript $5,$FF,eas_Jump
		setFacing $81,3
		nextSingleText $80,$5   ; "You idiots!{N}Let me do it.{D2}"
		entityShiver $81
		moveEntity $81,$FF,$0,$1
		moreMove $3,$1
		moreMove $9,$1
		endMove $8080
		csWait 20
		customActscript $5,$FF
		dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
		dc.b $10
		dc.b $10
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.b $80                ; 0014 END OF CUSTOM ACTSCRIPT
		dc.b $80
		moveEntity $5,$FF,$1,$1
		endMove $8080
		csWait 20
		entityNod $5
		csWait 10
		moveEntity $5,$0,$1,$1
		endMove $8080
		csWait 6
		setActscript $5,$FF,eas_461AA
		setFacing $5,3
		entitySprite $5,$BB
		csWait 20
		entityShiver $5
		setActscript $80,$0,eas_Jump
		setActscript $81,$FF,eas_Jump
		setActscript $80,$0,eas_Jump
		setActscript $81,$FF,eas_Jump
		entityShiver $5
		setActscript $80,$0,eas_Jump
		setActscript $81,$FF,eas_Jump
		setActscript $80,$0,eas_Jump
		setActscript $81,$FF,eas_Jump
		entityShiver $5
		setActscript $80,$0,eas_Jump
		setActscript $81,$FF,eas_Jump
		setActscript $80,$0,eas_Jump
		setActscript $81,$FF,eas_Jump
		entityShiver $5
		csWait 30
		moveEntity $5,$0,$3,$1
		endMove $8080
		csWait 6
		setActscript $5,$FF,eas_461AA
		customActscript $5,$FF
		dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
		dc.b 8
		dc.b 8
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.b $80                ; 0014 END OF CUSTOM ACTSCRIPT
		dc.b $80
		setActscript $5,$FF,eas_46172
		entitySprite $5,$5
		setFacing $5,1
		moveEntity $5,$FF,$3,$1
		endMove $8080
		setFacing $80,0
		setFacing $81,2
		csWait 20
		nextSingleText $80,$5   ; "Well, that didn't work.{D2}"
		setFacing $5,2
		csWait 30
		setFacing $5,0
		csWait 30
		setFacing $5,1
		csWait 20
		entityNod $5
		csWait 20
		nextSingleText $80,$5   ; "This time, I'll pull both of{N}the jewels at the same time!{D2}"
		setActscript $5,$FF,eas_Init
		moveEntity $5,$FF,$1,$1
		endMove $8080
		setFacing $80,1
		setFacing $81,1
		moveEntity $5,$0,$1,$1
		endMove $8080
		csWait 6
		setActscript $5,$FF,eas_461AA
		setFacing $5,3
		entitySprite $5,$BB
		nextSingleText $FF,$FF  ; "{NAME;5} the thief{N}grabbed the two jewels.{D2}"
		csWait 20
		nextSingleText $80,$5   ; "One...two...{D2}"
		entityShiver $5
		nextSingleText $80,$5   ; "THREE!{D2}"
		entityShiver $5
		customActscript $5,$FF
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.b $80                ; 0014 END OF CUSTOM ACTSCRIPT
		dc.b $80
		setActscript $5,$FF,eas_46172
		hideEntity $82
		setBlocks 26,18,1,1,26,4
		entitySprite $5,$5
		setFacing $5,1
		moveEntity $5,$0,$3,$1
		endMove $8080
		csWait 3
		setActscript $5,$FF,eas_461AA
		moveEntity $5,$FF,$3,$5
		endMove $8080
		setQuake 3
		setActscript $5,$FF,eas_Init
		setFacing $80,3
		setFacing $81,3
		moveEntity $5,$FF,$1,$2
		endMove $8080
		setFacing $5,2
		customActscript $5,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $3
		dc.w 3
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.b $80                ; 0014 END OF CUSTOM ACTSCRIPT
		dc.b $80
		setQuake 0
		setActscript $80,$0,eas_Jump
		setActscript $81,$FF,eas_Jump
		setActscript $80,$0,eas_Jump
		setActscript $81,$FF,eas_Jump
		csWait 20
		moveEntity $80,$0,$3,$2
		moreMove $8,$1
		endMove $8080
		moveEntity $81,$FF,$3,$2
		moreMove $A,$1
		endMove $8080
		nextSingleText $0,$80   ; "Are you OK?{D2}"
		csWait 40
		nextSingleText $80,$5   ; "Yeah.  I feel just great.{D2}"
		moveEntity $80,$FF,$1,$1
		moreMove $0,$1
		moreMove $9,$28
		endMove $8080
		setActscript $80,$FF,eas_Jump
		setActscript $80,$FF,eas_Jump
		csWait 20
		setFacing $80,3
		nextSingleText $0,$81   ; "You did it!{N}You have the legendary{N}jewels!{D2}"
		csWait 20
		setFacing $5,1
		entitySprite $5,$3B
		setActscript $5,$FF,eas_Init
		nextSingleText $80,$5   ; "I did?{D2}"
		csWait 30
		entitySprite $5,$5
		entityShakeHead $5
		nextSingleText $80,$5   ; "Oh, I got them!{N}I have the legendary{N}jewels!  Bravo!{D2}"
		setActscript $5,$FF,eas_Jump
		setActscript $5,$FF,eas_Jump
		csWait 40
		setActscript $5,$FF,eas_Jump
		setActscript $5,$0,eas_Jump
		setQuake 1
		csWait 40
		setQuake 0
		csWait 60
		setQuake 2
		csWait 40
		setQuake 0
		csWait 5
		setActscript $5,$0,eas_461B6
		csWait 5
		setActscript $80,$0,eas_461E4
		csWait 5
		setActscript $81,$0,eas_461E4
		csWait 60
		setQuake 3
		csWait 40
		setQuake 0
		setFacing $5,1
		nextSingleText $0,$80   ; "What's happening?!{D2}"
		entityShakeHead $80
		entityShakeHead $81
		csWait 40
		setQuake 4
		csWait 60
		setQuake 0
		nextSingleText $80,$5   ; "We must escape from the{N}shrine!  Follow me!{D2}"
		setQuake 5
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
		dc.b $80                ; 0014 END OF CUSTOM ACTSCRIPT
		dc.b $80
		customActscript $81,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.b $80                ; 0014 END OF CUSTOM ACTSCRIPT
		dc.b $80
		moveEntity $5,$0,$3,$1
		moreMove $2,$7
		moreMove $1,$6
		endMove $8080
		moveEntity $80,$0,$3,$2
		moreMove $2,$7
		moreMove $1,$5
		endMove $8080
		moveEntity $81,$FF,$B,$A
		moreMove $3,$1
		moreMove $2,$8
		moreMove $1,$4
		endMove $8080
		playSound SFX_WARP
		fadeOutToBlackHalf
		setPos $5,2,8,3
		setPos $80,2,8,3
		setPos $81,2,8,3
		reloadMap 0,3
		csWait 10
		fadeInFromBlackHalf
		setCameraEntity $5
		moveEntity $5,$FF,$1,$1
		endMove $8080
		moveEntity $5,$0,$1,$1
		endMove $8080
		moveEntity $80,$FF,$1,$1
		endMove $8080
		moveEntity $5,$0,$1,$1
		moreMove $0,$3
		endMove $8080
		moveEntity $80,$0,$1,$2
		moreMove $0,$2
		endMove $8080
		moveEntity $81,$FF,$1,$3
		endMove $8080
		moveEntity $81,$FF,$0,$1
		endMove $8080
		customActscript $81,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.b $80                ; 0014 END OF CUSTOM ACTSCRIPT
		dc.b $80
		moveEntity $5,$0,$0,$2
		endMove $8080
		moveEntity $80,$FF,$0,$2
		endMove $8080
		setFacing $5,2
		setFacing $80,2
		csWait 30
		moveEntity $5,$0,$2,$2
		endMove $8080
		moveEntity $80,$FF,$2,$2
		endMove $8080
		csWait 30
		setActscript $81,$FF,eas_Init
		setFacing $81,3
		entityShakeHead $81
		customActscript $81,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.b $80                ; 0014 END OF CUSTOM ACTSCRIPT
		dc.b $80
		moveEntity $5,$0,$0,$2
		moreMove $3,$A
		endMove $8080
		moveEntity $80,$0,$0,$3
		moreMove $3,$9
		endMove $8080
		moveEntity $81,$FF,$0,$4
		moreMove $3,$8
		endMove $8080
		setQuake 0
		fadeOutToBlackHalf
		csc_end
ce_48A50:       dc.w $3F
		dc.w $3F
		dc.w 1
		dc.b $1A
		dc.b 7
		dc.b 1
		dc.b 5
		dc.l eas_Init           
		dc.b $1A
		dc.b 5
		dc.b 1
		dc.b $CA
		dc.l eas_Init           
		dc.b $1B
		dc.b 6
		dc.b 1
		dc.b $CA
		dc.l eas_Init           
		dc.b $1A
		dc.b 4
		dc.b 3
		dc.b $AD
		dc.l eas_Init           
		dc.b $FF
		dc.b $FF
