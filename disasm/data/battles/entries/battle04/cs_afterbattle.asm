
; ASM FILE data\battles\entries\battle04\cs_afterbattle.asm :
; 0x498EE..0x49AB2 : Cutscene after battle 4
abcs_battle04:  textCursor $90F
		loadMapFadeIn 66,9,16
		loadMapEntities ce_49A6A
		setActscript $0,$FF,eas_Init
		setPos $1,14,21,DOWN
		setPos $2,12,21,DOWN
		setPos $3,13,22,DOWN
		setPos $4,11,22,DOWN
		fadeInB
		entityNod $0
		nextSingleText $0,$1C   ; "Your battle strategy was{N}wonderful!  I praise you.{W1}"
		csWait 5
		setActscript $3,$0,eas_461B6
		csWait 5
		setActscript $4,$0,eas_461B6
		setActscript $1,$0,eas_Jump
		setActscript $2,$FF,eas_Jump
		setActscript $1,$0,eas_Jump
		setActscript $2,$FF,eas_Jump
		csWait 80
		setPos $1C,18,22,UP
		moveEntity $1C,$FF,$1,$2
		endMove $8080
		setFacing $1C,LEFT
		setFacing $0,RIGHT
		setFacing $1,RIGHT
		setFacing $2,RIGHT
		setFacing $3,RIGHT
		setFacing $4,RIGHT
		nextSingleText $0,$1C   ; "But, I can't let you escape.{W1}"
		customActscript $1C,$FF
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $1C,$FF,$2,$4
		endMove $8080
		setActscript $0,$FF,eas_46172
		customActscript $0,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setQuake 2
		playSound SFX_BATTLEFIELD_DEATH
		moveEntity $0,$FF,$2,$1
		endMove $8080
		setQuake 0
		moveEntity $0,$FF,$1,$1
		moreMove $0,$1
		endMove $8080
		setActscript $0,$0,eas_RotateRight
		setFacing $1,UP
		setFacing $2,UP
		setFacing $3,UP
		setFacing $4,UP
		csWait 60
		setActscript $0,$FF,eas_Init
		setFacing $0,DOWN
		customActscript $0,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $1C,$FF
		dc.w $10                ;   0010 SET SPEED X=$20 Y=$20
		dc.b $20
		dc.b $20
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $1C,$FF,$0,$1
		endMove $8080
		nextSingleText $0,$1C   ; "That lad is their leader.{N}Take him!{W1}"
		moveEntity $82,$0,$1,$1
		endMove $8080
		moveEntity $81,$0,$2,$3
		endMove $8080
		moveEntity $80,$FF,$2,$5
		moreMove $3,$1
		endMove $8080
		setFacing $82,LEFT
		setFacing $1C,DOWN
		nextSingleText $0,$1C   ; "Don't worry.  He has only{N}fainted.  Take them to Galam!{W1}"
		moveEntity $1C,$FF,$0,$1
		moreMove $3,$1
		moreMove $0,$2
		endMove $8080
		mapSysEvent $11,$0,$0,$0
		csc_end
ce_49A6A:       dc.w $D
		dc.w $14
		dc.w 3
		dc.b $E
		dc.b $15
		dc.b 3
		dc.b 1
		dc.l eas_Init           
		dc.b $C
		dc.b $15
		dc.b 3
		dc.b 2
		dc.l eas_Init           
		dc.b $D
		dc.b $16
		dc.b 3
		dc.b 3
		dc.l eas_Init           
		dc.b $B
		dc.b $16
		dc.b 3
		dc.b 4
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 1
		dc.b $1C
		dc.l eas_Init           
		dc.b $11
		dc.b $12
		dc.b 2
		dc.b $78
		dc.l eas_Init           
		dc.b $11
		dc.b $13
		dc.b 2
		dc.b $42
		dc.l eas_Init           
		dc.b $11
		dc.b $15
		dc.b 2
		dc.b $42
		dc.l eas_Init           
		dc.w $FFFF
