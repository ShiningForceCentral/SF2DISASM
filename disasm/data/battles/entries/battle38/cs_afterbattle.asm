
; ASM FILE data\battles\entries\battle38\cs_afterbattle.asm :
; 0x4DE8C..0x4E3D2 : Cutscene after battle 38
abcs_battle38:  textCursor $BC4
		loadMapFadeIn $42,$3,$16
		loadMapEntities ce_4E372
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		entityPosDir $7,$5,$19,$0
		setActscript $1F,$FF,eas_Init
		entityPosDir $1F,$8,$1C,$1
		setActscript $1E,$FF,eas_Init
		entityPosDir $1E,$9,$18,$3
		stopEntity $88
		customActscript $88,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		jumpIfFlagClear $4C,cs_4DF00; Zynk is a follower
		setActscript $1A,$FF,eas_Init
		entityPosDir $1A,$3F,$3E,$3
cs_4DF00:       setActscript $80,$FF,eas_46172
		setActscript $81,$FF,eas_46172
		setActscript $82,$FF,eas_46172
		setActscript $83,$FF,eas_46172
		setActscript $84,$FF,eas_46172
		setActscript $85,$FF,eas_46172
		setActscript $86,$FF,eas_46172
		setActscript $87,$FF,eas_46172
		setPriority $0,$0
		setPriority $88,$FFFF
		fadeInB
		csWait $3C
		entityShiver $88
		nextSingleText $0,$88   ; "My traps...{W1}"
		csWait $3C
		customActscript $88,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $0
		dc.w 0
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		startEntity $88
		setFacing $88,$1
		nextSingleText $0,$88   ; "I'm...at the end of my rope.{N}I...must...escape.{W1}"
		customActscript $88,$FF
		dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
		dc.b 8
		dc.b 8
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $88,$FF,$0,$1
		moreMove $1,$1
		moreMove $2,$1
		moreMove $1,$2
		moreMove $0,$1
		moreMove $3,$1
		moreMove $0,$1
		moreMove $1,$1
		endMove $8080
		moveEntity $88,$0,$1,$1
		endMove $8080
		csWait $C
		setActscript $88,$FF,eas_461AA
		setQuake $1
		stopEntity $88
		entityPosDir $88,$8,$18,$2
		customActscript $88,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $88,$FF,eas_46172
		customActscript $88,$FF
		dc.w $10                ;   0010 SET SPEED X=$28 Y=$28
		dc.b $28
		dc.b $28
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setQuake $0
		moveEntity $88,$FF,$3,$1
		endMove $8080
		setFacing $88,$3
		moveEntity $88,$FF,$3,$1
		endMove $8080
		setFacing $88,$0
		moveEntity $88,$FF,$3,$1
		endMove $8080
		setFacing $88,$1
		csWait $28
		entityShiver $88
		csWait $3C
		customActscript $88,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $0
		dc.w 0
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setFacing $88,$3
		csWait $28
		entityShakeHead $88
		startEntity $88
		csWait $A
		setActscript $88,$FF,eas_Jump
		setActscript $88,$FF,eas_46172
		nextSingleText $0,$88   ; "Nooooooo!{W1}"
		moveEntity $88,$FF,$1,$2
		endMove $8080
		nextSingleText $0,$88   ; "Please...please let me go.{W1}"
		moveEntity $1F,$FF,$1,$1
		endMove $8080
		nextSingleText $C0,$1F  ; "We don't want to kill{N}you.{N}You've lost your powers.{W1}"
		nextSingleText $0,$88   ; "I know...(sob, sob)....{W1}"
		moveEntity $7,$FF,$0,$1
		endMove $8080
		nextSingleText $C0,$7   ; "You may go.{W1}"
		setFacing $88,$2
		nextSingleText $0,$88   ; "Thank you.{W1}"
		setActscript $88,$FF,eas_Init
		setFacing $88,$1
		setCameraEntity $88
		csWait $3C
		moveEntity $0,$FF,$0,$1
		endMove $8080
		setFacing $0,$3
		csWait $3C
		cameraSpeed $8
		customActscript $88,$FF
		dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
		dc.b 8
		dc.b 8
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $88,$FF,$1,$1
		endMove $8080
		setFacing $7,$1
		setFacing $0,$2
		moveEntity $88,$FF,$1,$2
		endMove $8080
		setFacing $0,$1
		moveEntity $88,$FF,$1,$2
		endMove $8080
		csWait $28
		setFacing $88,$3
		nextSingleText $0,$88   ; "I won't forget this.{W1}"
		moveEntity $88,$FF,$1,$3
		endMove $8080
		flashScreenWhite $1E
		playSound SFX_BATTLEFIELD_DEATH
		setQuake $3
		csWait $32
		csWait $5
		setActscript $88,$0,eas_461B6
		csWait $50
		setQuake $0
		csWait $28
		setFacing $88,$3
		tintMap
		nextSingleText $C0,$89  ; "Where are you going, Geshp?{W1}"
		customActscript $88,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $88,$FF,eas_Jump
		setActscript $88,$FF,eas_Jump
		csWait $1E
		setActscript $88,$FF,eas_46172
		moveEntity $88,$FF,$1,$1
		endMove $8080
		nextSingleText $C0,$89  ; "Do you remember your vow?{W1}"
		entityShakeHead $88
		nextText $C0,$89        ; "You failed to get the jewel{N}from {LEADER}.{W2}"
		nextSingleText $C0,$89  ; "Now, you will pay with your{N}life.{W1}"
		nextSingleText $0,$88   ; "No, please...NO!{W1}"
		setPriority $88,$0
		entityPosDir $80,$8,$D,$0
		csWait $A
		entityPosDir $81,$A,$E,$2
		csWait $5
		setActscript $88,$0,eas_461B6
		csWait $A
		entityPosDir $82,$B,$10,$0
		csWait $A
		entityPosDir $83,$A,$12,$2
		csWait $A
		entityPosDir $84,$8,$13,$0
		csWait $A
		entityPosDir $85,$6,$12,$2
		csWait $A
		entityPosDir $86,$5,$10,$0
		csWait $A
		entityPosDir $87,$6,$E,$2
		csWait $28
		flashScreenWhite $14
		tintMap
		setFacing $88,$3
		setQuake $3
		customActscript $80,$FF
		dc.w $10                ;   0010 SET SPEED X=$50 Y=$50
		dc.b $50
		dc.b $50
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $81,$FF
		dc.w $10                ;   0010 SET SPEED X=$50 Y=$50
		dc.b $50
		dc.b $50
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $82,$FF
		dc.w $10                ;   0010 SET SPEED X=$50 Y=$50
		dc.b $50
		dc.b $50
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $83,$FF
		dc.w $10                ;   0010 SET SPEED X=$50 Y=$50
		dc.b $50
		dc.b $50
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $84,$FF
		dc.w $10                ;   0010 SET SPEED X=$50 Y=$50
		dc.b $50
		dc.b $50
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $85,$FF
		dc.w $10                ;   0010 SET SPEED X=$50 Y=$50
		dc.b $50
		dc.b $50
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $86,$FF
		dc.w $10                ;   0010 SET SPEED X=$50 Y=$50
		dc.b $50
		dc.b $50
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $87,$FF
		dc.w $10                ;   0010 SET SPEED X=$50 Y=$50
		dc.b $50
		dc.b $50
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		playSound SFX_BOLT_SPELL
		moveEntity $80,$FF,$3,$3
		endMove $8080
		setFacing $88,$2
		entitySprite $88,$B4
		setActscript $88,$0,eas_AnimSpeedx2
		setActscript $80,$0,eas_JumpLeft
		playSound SFX_BOLT_SPELL
		moveEntity $81,$FF,$6,$2
		endMove $8080
		setActscript $81,$0,eas_JumpRight
		hideEntity $80
		playSound SFX_BOLT_SPELL
		moveEntity $82,$FF,$2,$3
		endMove $8080
		setActscript $82,$0,eas_JumpLeft
		hideEntity $81
		playSound SFX_BOLT_SPELL
		moveEntity $83,$FF,$5,$2
		endMove $8080
		setActscript $83,$0,eas_JumpRight
		hideEntity $82
		playSound SFX_BOLT_SPELL
		moveEntity $84,$FF,$1,$3
		endMove $8080
		setActscript $84,$0,eas_JumpLeft
		hideEntity $83
		playSound SFX_BOLT_SPELL
		moveEntity $85,$FF,$4,$2
		endMove $8080
		setActscript $85,$0,eas_JumpRight
		hideEntity $84
		playSound SFX_BOLT_SPELL
		moveEntity $86,$FF,$0,$3
		endMove $8080
		setActscript $86,$0,eas_JumpLeft
		hideEntity $85
		playSound SFX_BOLT_SPELL
		moveEntity $87,$FF,$7,$2
		endMove $8080
		setActscript $87,$0,eas_JumpRight
		hideEntity $86
		csWait $8
		hideEntity $87
		setQuake $0
		setCameraEntity $FFFF
		csWait $28
		entitySprite $88,$9F
		setActscript $88,$FF,eas_Die
		flickerOnce
		cameraSpeed $30
		setCamDest $3,$14
		moveEntity $1F,$FF,$1,$3
		endMove $8080
		nextSingleText $0,$1F   ; "Zeon is such an unfeeling{N}devil...(shiver).{W1}"
		moveEntity $7,$FF,$0,$1
		moreMove $1,$2
		endMove $8080
		nextSingleText $0,$7    ; "He will do the same to us{N}if we lose to him.{W1}"
		nextSingleText $0,$1F   ; "We must not be defeated.{W1}"
		followEntity $1E,$0,$2
		followEntity $7,$1E,$1
		followEntity $1F,$1E,$3
		csc_end
ce_4E372:       dc.w 8
		dc.w $17
		dc.w 3
		dc.b 5
		dc.b $19
		dc.b 0
		dc.b 7
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 0
		dc.b $B2
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 2
		dc.b $B2
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 0
		dc.b $B2
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 2
		dc.b $B2
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 0
		dc.b $B2
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 2
		dc.b $B2
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 0
		dc.b $B2
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 2
		dc.b $B2
		dc.l eas_Init           
		dc.b 6
		dc.b $1B
		dc.b 3
		dc.b $9F
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $A2
		dc.l eas_Init           
		dc.w $FFFF
