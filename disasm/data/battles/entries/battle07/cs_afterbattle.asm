
; ASM FILE data\battles\entries\battle07\cs_afterbattle.asm :
; 0x49F7E..0x4A952 : Cutscene after battle 7
abcs_battle07:  textCursor $951         ; Initial text line $951 : "King Galam!  You've lost{N}your followers!{W1}"
		loadMapFadeIn $3A,$8,$10
		loadMapEntities ce_4A912; Entity data to figure out and format
		setActscript $0,$FF,eas_Init
		setBlocks $717,$102,$D16
		setBlocks $717,$102,$D18
		setBlocks $717,$102,$D1D
		stopEntity $82
		stopEntity $83
		customActscript $82,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $83,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $80,$FF,eas_46172
		setActscript $81,$FF,eas_46172
		setActscript $80,$0,eas_AnimSpeedx2
		setActscript $81,$0,eas_AnimSpeedx2
		fadeInB
		csc45 $28               ; (null)
		csWait $32
		moveEntity $85,$0,$1,$6
		endMove $8080
		moveEntity $86,$FF,$1,$6
		endMove $8080
		nextSingleText $0,$86   ; "King Galam!  You've lost{N}your followers!{W1}"
		nextSingleText $0,$85   ; "Princess Elis, come here.{N}Come here.{W1}"
		setCamDest $8,$D
		nextSingleText $0,$84   ; "Father...{W1}"
		moveEntity $84,$FF,$3,$1
		endMove $8080
		customActscript $82,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $0
		dc.w 0
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		startEntity $82
		moveEntity $84,$0,$3,$1
		endMove $8080
		customActscript $82,$FF
		dc.w $10                ;   0010 SET SPEED X=$38 Y=$38
		dc.b $38
		dc.b $38
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $82,$FF,$2,$1
		endMove $8080
		setEntityDir $82,$1
		waitIdle $84
		setActscript $84,$FF,eas_Jump
		nextSingleText $0,$84   ; "(Shriek!){W1}"
		nextSingleText $C0,$82  ; "No, Princess.{W1}"
		setActscript $84,$FF,eas_46172
		moveEntity $84,$FF,$1,$1
		endMove $8080
		nextSingleText $0,$85   ; "Elis!{W1}"
		setCamDest $8,$F
		moveEntity $85,$0,$1,$1
		endMove $8080
		moveEntity $86,$FF,$1,$1
		endMove $8080
		nextSingleText $C0,$82  ; "Freeze!  Ha, ha!{W1}"
		setActscript $85,$0,eas_Jump
		setActscript $86,$FF,eas_Jump
		setCamDest $8,$E
		moveEntity $82,$FF,$0,$1
		moreMove $1,$2
		endMove $8080
		setEntityDir $82,$3
		nextText $C0,$82        ; "What a good hostage she is!{W2}"
		nextSingleText $C0,$82  ; "Stay there!  Or she'll die!{W1}"
		moveEntity $85,$FF,$1,$1
		endMove $8080
		nextSingleText $0,$85   ; "Stop this, King Galam!{N}Leave her alone!  Please!{W1}"
		moveEntity $86,$FF,$1,$1
		endMove $8080
		nextSingleText $0,$86   ; "Princess Elis...I'll save{N}you!{W1}"
		nextSingleText $FF,$FF  ; "King Galam murmurs a{N}magic spell.{W1}"
		setEntityDir $84,$0
		csWait $28
		setActscript $84,$FF,eas_Jump
		setEntityDir $84,$3
		nextSingleText $0,$84   ; "Watch out!{W1}"
		nextSingleText $0,$85   ; "What?!{W1}"
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
		entityPosDir $80,$D,$10,$0
		entityPosDir $81,$D,$10,$0
		playSound SFX_DEMON_BREATH
		moveEntity $80,$0,$6,$1
		endMove $8080
		moveEntity $81,$FF,$7,$1
		endMove $8080
		moveEntity $80,$0,$3,$8
		endMove $8080
		moveEntity $81,$0,$3,$8
		endMove $8080
		csWait $A
		setActscript $85,$FF,eas_46172
		setActscript $86,$FF,eas_46172
		customActscript $85,$FF
		dc.w $10                ;   0010 SET SPEED X=$38 Y=$38
		dc.b $38
		dc.b $38
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $86,$FF
		dc.w $10                ;   0010 SET SPEED X=$38 Y=$38
		dc.b $38
		dc.b $38
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $85,$0,$3,$3
		endMove $8080
		moveEntity $86,$FF,$3,$3
		endMove $8080
		stopEntity $85
		stopEntity $86
		customActscript $85,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $86,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		nextSingleText $0,$84   ; "Father!{W1}"
		setActscript $85,$FF,eas_Init
		setActscript $86,$FF,eas_Init
		startEntity $85
		startEntity $86
		entityShakeHead $85
		nextSingleText $0,$85   ; "Don't worry...I'm fine.{W1}"
		nextSingleText $C0,$82  ; "That was just a warning!{N}Do you want me to attack{N}again?{W1}"
		entityPosDir $80,$3F,$3F,$3
		entityPosDir $81,$3F,$3F,$3
		setCamDest $8,$11
		customActscript $83,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $0
		dc.w 0
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		startEntity $83
		entityShakeHead $83
		nextText $0,$83         ; "King Granseal...{W2}"
		nextSingleText $0,$83   ; "Galam, please tell me...{N}What's in this tower?{N}In Ground Seal?{W1}"
		nextSingleText $C0,$82  ; "You really want to know?{N}Ha, ha!  OK, I'll tell you.{W1}"
		setCamDest $8,$D
		setEntityDir $82,$1
		nextSingleText $FF,$FF  ; "King Galam displays the{N}Jewel of Evil.{W1}"
		nextSingleText $C0,$82  ; "I'll open the door to the{N}Evil World!{N}Observe!{W1}"
		entityFlashWhite $82,$32
		csWait $3C
		mapFadeOutToWhite
		csWait $14
		mapFadeInFromWhite
		csWait $28
		mapFadeOutToWhite
		csWait $1E
		mapFadeInFromWhite
		playSound SFX_BIG_DOOR_RUMBLE
		setQuakeAmount $2
		csWait $3C
		setQuakeAmount $0
		csWait $3C
		setQuakeAmount $3
		nextSingleText $0,$85   ; "An earthquake!{W1}"
		setCamDest $8,$3
		csWait $3C
		setBlocks $27,$303,$C04
		csWait $32
		setBlocks $2B,$303,$C04
		csWait $32
		setBlocks $2F,$303,$C04
		csWait $3C
		setQuakeAmount $0
		setCamDest $8,$D
		setEntityDir $82,$3
		nextSingleText $C0,$82  ; "Now do you understand?  I{N}plan on opening the sealed{N}door!{W1}"
		nextSingleText $0,$83   ; "Why?  What's inside?{W1}"
		nextSingleText $C0,$82  ; "You'll find out soon enough.{W1}"
		setEntityDir $82,$1
		entityFlashWhite $82,$28
		nextSingleText $0,$85   ; "What's he doing now??{W1}"
		nextSingleText $C0,$82  ; "Here they come!{N}Ha, ha, ha!{W1}"
		nextSingleText $0,$83   ; "What?{W1}"
		setCamDest $8,$3
		entitySprite $80,$B4
		entityPosDir $80,$C,$5,$1
		animEntityFadeInOut $80,$7
		entitySprite $81,$B4
		entityPosDir $81,$D,$5,$1
		animEntityFadeInOut $81,$7
		customActscript $80,$FF
		dc.w $10                ;   0010 SET SPEED X=$20 Y=$20
		dc.b $20
		dc.b $20
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $81,$FF
		dc.w $10                ;   0010 SET SPEED X=$20 Y=$20
		dc.b $20
		dc.b $20
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		nextSingleText $0,$0    ; "I have a bad feeling about{N}this!{W1}"
		moveEntity $80,$0,$3,$5
		endMove $8080
		moveEntity $81,$FF,$3,$5
		endMove $8080
		setCamDest $8,$8
		nextSingleText $0,$86   ; "Princess Elis is swallowed{N}by a light tube.{W1}"
		moveEntity $80,$0,$3,$5
		endMove $8080
		setEntityDir $84,$1
		setActscript $84,$0,eas_Jump
		moveEntity $81,$FF,$3,$5
		endMove $8080
		setCamDest $8,$D
		nextSingleText $C0,$82  ; "Farewell for now!{N}Going up!{W1}"
		customActscript $82,$FF
		dc.w $10                ;   0010 SET SPEED X=$2 Y=$2
		dc.b 2
		dc.b 2
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $84,$FF
		dc.w $10                ;   0010 SET SPEED X=$2 Y=$2
		dc.b 2
		dc.b 2
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $80,$FF
		dc.w $10                ;   0010 SET SPEED X=$2 Y=$2
		dc.b 2
		dc.b 2
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $81,$FF
		dc.w $10                ;   0010 SET SPEED X=$2 Y=$2
		dc.b 2
		dc.b 2
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $80,$0,$1,$2
		endMove $8080
		moveEntity $81,$0,$1,$2
		endMove $8080
		moveEntity $82,$0,$1,$2
		endMove $8080
		moveEntity $84,$0,$1,$2
		endMove $8080
		nextSingleText $0,$83   ; "He's using the light tube{N}to go through the doorway!{W1}"
		setCamDest $8,$11
		nextSingleText $0,$83   ; "Save her.  Save her now!{W1}"
		csWait $5
		setActscript $83,$0,eas_461B6
		csWait $78
		setEntityDir $83,$3
		nextSingleText $0,$83   ; "{LEADER}, you're good{N}at performing acrobatics!{W1}"
		moveEntity $83,$FF,$3,$1
		endMove $8080
		setEntityDir $83,$0
		nextSingleText $0,$83   ; "Minister, help me!{W1}"
		setEntityDir $86,$2
		nextSingleText $0,$86   ; "Y...yes...but how?{W1}"
		nextSingleText $0,$83   ; "Throw {LEADER} towards{N}the light tubes!{W1}"
		setActscript $0,$FF,eas_Jump
		setCameraEntity $0
		moveEntity $85,$FF,$2,$1
		endMove $8080
		moveEntity $83,$FF,$2,$1
		moreMove $3,$1
		endMove $8080
		moveEntity $86,$FF,$3,$1
		endMove $8080
		waitIdle $83
		setEntityDir $85,$0
		setEntityDir $83,$0
		setEntityDir $86,$2
		csWait $1E
		stopEntity $0
		setEntityDir $0,$3
		customActscript $0,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		nextSingleText $0,$83   ; "{LEADER}, save her!{W1}"
		customActscript $0,$FF
		dc.w $10                ;   0010 SET SPEED X=$28 Y=$28
		dc.b $28
		dc.b $28
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $83,$FF
		dc.w $10                ;   0010 SET SPEED X=$28 Y=$28
		dc.b $28
		dc.b $28
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $86,$FF
		dc.w $10                ;   0010 SET SPEED X=$28 Y=$28
		dc.b $28
		dc.b $28
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $0,$FF,eas_46172
		setActscript $83,$FF,eas_46172
		setActscript $86,$FF,eas_46172
		moveEntity $83,$0,$3,$3
		endMove $8080
		moveEntity $86,$0,$3,$3
		endMove $8080
		moveEntity $0,$FF,$3,$3
		endMove $8080
		nextSingleText $C0,$82  ; "Too late.  You're too late.{W1}"
		csc45 $38               ; (null)
		customActscript $0,$FF
		dc.w $10                ;   0010 SET SPEED X=$38 Y=$38
		dc.b $38
		dc.b $38
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $83,$FF
		dc.w $10                ;   0010 SET SPEED X=$38 Y=$38
		dc.b $38
		dc.b $38
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $86,$FF
		dc.w $10                ;   0010 SET SPEED X=$38 Y=$38
		dc.b $38
		dc.b $38
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $83,$0,$1,$5
		endMove $8080
		moveEntity $86,$0,$1,$5
		endMove $8080
		moveEntity $0,$FF,$1,$5
		endMove $8080
		setEntityDir $85,$1
		moveEntity $0,$FF,$1,$3
		endMove $8080
		nextSingleText $0,$83   ; "Oops, we lost our grip!{N}But...{W1}"
		moveEntity $80,$0,$1,$8
		endMove $8080
		moveEntity $81,$0,$1,$8
		endMove $8080
		moveEntity $82,$0,$1,$8
		endMove $8080
		moveEntity $84,$0,$1,$8
		endMove $8080
		moveEntity $0,$FF,$1,$5
		endMove $8080
		customActscript $0,$FF
		dc.w $10                ;   0010 SET SPEED X=$2 Y=$2
		dc.b 2
		dc.b 2
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setQuakeAmount $4
		customActscript $0,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $0
		dc.w 0
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setEntityDir $0,$1
		entitySprite $0,$B1
		moveEntity $0,$0,$1,$8
		endMove $8080
		csWait $14
		setQuakeAmount $0
		nextSingleText $FF,$FF  ; "{LEADER} grasped the{N}Jewel of Evil.{W1}"
		setCameraEntity $FFFF
		nextText $C0,$82        ; "What are you doing?{W2}"
		setCameraEntity $0
		setCameraEntity $FFFF
		nextSingleText $C0,$82  ; "Don't touch my jewel!{N}Don't touch it!{W1}"
		setCameraEntity $0
		entityShiver $0
		stopEntity $0
		setCameraEntity $FFFF
		nextText $C0,$82        ; "I said, don't touch it!{W2}"
		setCameraEntity $0
		setCameraEntity $FFFF
		nextSingleText $C0,$82  ; "I'll shake you off!{W1}"
		setCameraEntity $0
		entityShiver $0
		stopEntity $0
		setCameraEntity $FFFF
		nextSingleText $C0,$82  ; "You're still there?{W1}"
		setCameraEntity $0
		setCameraEntity $FFFF
		nextSingleText $0,$0    ; "Wow!  He's so brave.  Hmmm....{W1}"
		setCameraEntity $0
		setCameraEntity $FFFF
		nextSingleText $C0,$82  ; "I've almost got you now!{W1}"
		setCameraEntity $0
		entityShiver $0
		stopEntity $0
		setCameraEntity $FFFF
		nextSingleText $0,$84   ; "No, you'll fall if you{N}open your hands now!{W1}"
		setCameraEntity $0
		setCameraEntity $FFFF
		nextSingleText $FF,$FF  ; "{LEADER}'s jewel suddenly{N}flared!{W1}"
		setCameraEntity $0
		entityFlashWhite $0,$14
		playSound SFX_VALIDATION
		mapFadeOutToWhite
		csWait $A
		mapFadeInFromWhite
		setCameraEntity $FFFF
		nextSingleText $C0,$82  ; "Whoa!  The light...the{N}light!{W1}"
		setCameraEntity $0
		setCameraEntity $FFFF
		nextSingleText $FF,$FF  ; "The Jewel of Evil fused{N}to {LEADER}'s neck.{W1}"
		setCameraEntity $0
		csc45 $38               ; (null)
		customActscript $0,$FF
		dc.w $10                ;   0010 SET SPEED X=$38 Y=$38
		dc.b $38
		dc.b $38
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $0,$FF,eas_46172
		entitySprite $0,$0
		customActscript $0,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setEntityDest $0,$D,$A
		nextSingleText $C0,$82  ; "He stole my jewel!{W1}"
		setEntityDir $83,$1
		setEntityDir $86,$1
		moveEntity $0,$FF,$3,$5
		endMove $8080
		csc45 $40               ; (null)
		customActscript $0,$FF
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		playSound SFX_DOOR_OPEN
		setQuakeAmount $3
		setEntityDir $0,$3
		moveEntity $0,$FF,$3,$1
		endMove $8080
		setEntityDir $0,$2
		moveEntity $0,$FF,$3,$1
		endMove $8080
		setEntityDir $0,$1
		moveEntity $0,$FF,$3,$1
		endMove $8080
		setEntityDir $0,$0
		moveEntity $0,$FF,$3,$1
		endMove $8080
		setEntityDir $0,$3
		moveEntity $0,$FF,$3,$1
		endMove $8080
		entitySprite $0,$B1
		customActscript $0,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $0
		dc.w 0
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		csWait $14
		setQuakeAmount $0
		csWait $28
		entityShiver $0
		stopEntity $0
		csWait $1E
		setCameraEntity $FFFF
		csc45 $28               ; (null)
		nextSingleText $FF,$FF  ; "The two jewels merge{N}together.{W1}"
		setF $181               ; set after Bowie obtains King Galam's jewel
		setCamDest $8,$3
		waitIdle $82
		setEntityDir $82,$3
		setEntityDir $84,$3
		animEntityFadeInOut $81,$6
		nextSingleText $C0,$82  ; "I have to go back and get{N}my jewel....{N}Noooooooo!{W1}"
		setActscript $82,$0,eas_463AE
		animEntityFadeInOut $80,$6
		nextSingleText $0,$84   ; "Father...{N}{LEADER}...help meeeeee!{W1}"
		setActscript $84,$FF,eas_463AE
		setActscript $83,$FF,eas_Init
		customActscript $83,$FF
		dc.w $10                ;   0010 SET SPEED X=$20 Y=$20
		dc.b $20
		dc.b $20
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $86,$FF,eas_Init
		customActscript $86,$FF
		dc.w $10                ;   0010 SET SPEED X=$20 Y=$20
		dc.b $20
		dc.b $20
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $85,$FF
		dc.w $10                ;   0010 SET SPEED X=$20 Y=$20
		dc.b $20
		dc.b $20
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		playSound $FD
		csWait $3C
		setCamDest $8,$11
		playSound MUSIC_SAD_THEME_1
		csWait $3C
		nextSingleText $0,$85   ; "She's gone....{N}Elis!{W1}"
		nextSingleText $0,$83   ; "We couldn't help the{N}Princess.{W1}"
		entitySprite $0,$0
		setActscript $0,$FF,eas_Init
		startEntity $0
		entityShakeHead $0
		nextSingleText $C0,$0   ; "(Sigh)....{W1}"
		nextSingleText $0,$83   ; "{LEADER}, why do you{N}have two jewels?{W1}"
		nextSingleText $FF,$FF  ; "{LEADER} explains{N}what happened.{W1}"
		entityNod $83
		entityNod $0
		nextSingleText $0,$83   ; "Indeed, perhaps...these{N}jewels are the key to{N}solving this....{W1}"
		setQuakeAmount $2
		csWait $5
		setActscript $86,$0,eas_461B6
		playSound $FD
		csWait $78
		setQuakeAmount $0
		csWait $3C
		setQuakeAmount $1
		playSound MUSIC_BOSS_ATTACK
		nextSingleText $0,$83   ; "What?! Another earthquake?{W1}"
		nextSingleText $0,$86   ; "Wow!  It's getting worse!{W1}"
		moveEntity $86,$FF,$3,$1
		endMove $8080
		setEntityDir $86,$2
		nextSingleText $C0,$85  ; "Whoa!{W1}"
		nextSingleText $0,$86   ; "Sssiirrr Astral!{N}What should we do?!{W1}"
		nextSingleText $0,$83   ; "I'm not sure.{W1}"
		moveEntity $86,$FF,$2,$2
		endMove $8080
		setEntityDir $86,$1
		nextSingleText $0,$86   ; "Sir Astral!{W1}"
		setEntityDir $83,$3
		nextText $0,$83         ; "Let's get out of here!{W2}"
		nextSingleText $0,$83   ; "We'll come back later with{N}soldiers to rescue her.{W1}"
		setEntityDir $83,$2
		nextSingleText $C0,$85  ; "But, Sir Astral...{W1}"
		setEntityDir $83,$3
		nextSingleText $0,$83   ; "He won't budge.{N}We'll have to carry him.{W1}"
		nextSingleText $FF,$FF  ; "The Minister nods.{W1}"
		entityNod $83
		moveEntity $83,$0,$2,$1
		endMove $8080
		moveEntity $86,$FF,$3,$1
		moreMove $2,$1
		endMove $8080
		setActscript $85,$FF,eas_46172
		setEntityDir $83,$3
		stopEntity $85
		csWait $32
		moveEntity $83,$0,$0,$2
		endMove $8080
		moveEntity $86,$0,$0,$2
		endMove $8080
		moveEntity $85,$FF,$0,$2
		endMove $8080
		moveEntity $83,$0,$0,$1
		moreMove $3,$1
		endMove $8080
		moveEntity $86,$FF,$2,$1
		moreMove $1,$1
		endMove $8080
		setEntityDir $86,$3
		csWait $32
		setCameraEntity $85
		csc45 $20               ; (null)
		moveEntity $83,$0,$3,$D
		endMove $8080
		moveEntity $86,$0,$3,$D
		endMove $8080
		moveEntity $85,$FF,$3,$D
		endMove $8080
		csWait $28
		setActscript $83,$FF,eas_Jump
		setEntityDir $83,$1
		nextText $0,$83         ; "{LEADER}, you'll be{N}buried in the tower!{W2}"
		nextSingleText $0,$83   ; "Come on!{W1}"
		csWait $32
		mapSysEvent $3A0D2303
		followEntity $83,$0,$2
		followEntity $85,$83,$2
		followEntity $86,$85,$2
		setF $4A                ; Astral + King are followers
		setF $280               ; set after the end of battle 7's long sequence, cleared at docks?
		csc_end                 ; END OF CUTSCENE SCRIPT
ce_4A912:       dc.b   0
		dc.b  $D
		dc.b   0
		dc.b $17
		dc.w 1
		dc.b $3F
		dc.b $3F
		dc.b 0
		dc.b $B2
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 0
		dc.b $B2
		dc.l eas_Init           
		dc.b $D
		dc.b $11
		dc.b 1
		dc.b $A4
		dc.l eas_Init           
		dc.b $D
		dc.b $15
		dc.b 1
		dc.b $D1
		dc.l eas_Init           
		dc.b $C
		dc.b $E
		dc.b 3
		dc.b $CC
		dc.l eas_Init           
		dc.b $C
		dc.b $1B
		dc.b 1
		dc.b $CB
		dc.l eas_Init           
		dc.b $E
		dc.b $1B
		dc.b 1
		dc.b $CD
		dc.l eas_Init           
		dc.w $FFFF
