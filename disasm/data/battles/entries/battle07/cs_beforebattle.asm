
; ASM FILE data\battles\entries\battle07\cs_beforebattle.asm :
; 0x49CE2..0x49F7E : Cutscene before battle 7
bbcs_07:        textCursor $935
		clearF $53              ; King + Minister are followers
		loadMapFadeIn $3A,$8,$1D
		loadMapEntities ce_49F36
		setActscript $0,$FF,eas_Init
		animEntityFadeInOut $85,$4
		fadeInB
		cameraSpeed $28
		nextSingleText $C0,$80  ; "Astral, you're so persistent!{W1}"
		setCamDest $8,$F
		nextSingleText $0,$81   ; "King Galam, what do you{N}intend to do?{W1}"
		nextSingleText $C0,$80  ; "You wouldn't understand.{W1}"
		nextSingleText $0,$83   ; "Astral, save her!{W1}"
		setCamDest $8,$D
		nextSingleText $0,$82   ; "Father!{W1}"
		moveEntity $82,$FF,$3,$1
		endMove $8080
		csWait $28
		setFacing $80,$1
		csWait $14
		setActscript $82,$FF,eas_Jump
		csWait $1E
		setActscript $82,$FF,eas_46172
		moveEntity $82,$FF,$1,$1
		endMove $8080
		setFacing $80,$3
		setFacing $81,$3
		nextSingleText $0,$81   ; "King Granseal and{N}{LEADER}!{W1}"
		nextText $C0,$80        ; "Blast!{W2}"
		nextSingleText $C0,$80  ; "Give up now, King Granseal!{N}Do you want her to die?!{W1}"
		setCamDest $8,$F
		setFacing $81,$1
		nextText $0,$81         ; "No!  You give up!{N}We've got reinforcements!{W2}"
		nextSingleText $0,$81   ; "Your great magic cannot{N}defeat all of our soldiers!{W1}"
		nextSingleText $C0,$80  ; "I'll kill you before they{N}have a chance to attack!{W1}"
		moveEntity $80,$FF,$3,$1
		endMove $8080
		nextSingleText $0,$81   ; "Just try it!{W1}"
		moveEntity $81,$FF,$1,$1
		endMove $8080
		setActscript $80,$FF,eas_BumpDown
		setQuake $2
		playSound SFX_LIGHTNING_1
		setActscript $81,$FF,eas_BumpUp
		setQuake $0
		csWait $32
		setActscript $80,$0,eas_BumpDown
		setQuake $3
		playSound SFX_LIGHTNING_2
		setActscript $81,$FF,eas_BumpUp
		setQuake $0
		setActscript $81,$0,eas_Jump
		entityNod $80
		setActscript $81,$FF,eas_BumpDown
		setQuake $2
		playSound SFX_DOOR_OPEN
		setActscript $80,$FF,eas_BumpUp
		setQuake $0
		csWait $28
		setActscript $80,$0,eas_BumpDown
		setQuake $3
		playSound SFX_HIT_2
		setActscript $81,$FF,eas_BumpUp
		setQuake $0
		setActscript $80,$0,eas_Jump
		entityNod $81
		setActscript $80,$FF,eas_46172
		setActscript $81,$FF,eas_46172
		csWait $1E
		moveEntity $80,$0,$1,$1
		endMove $8080
		moveEntity $81,$FF,$3,$1
		endMove $8080
		nextSingleText $C0,$80  ; "Astral...{W1}"
		nextSingleText $0,$81   ; "Gguuu....{W1}"
		stopEntity $80
		stopEntity $81
		customActscript $80,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $81,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setFacing $80,$1
		nextSingleText $C0,$80  ; "I've beaten you!{N}You've lost!{W1}"
		nextText $0,$81         ; "But, so have you!{N}Or had you not noticed?{W2}"
		nextSingleText $0,$81   ; "You cannot move.{N}Princess Elis, run away!{W1}"
		setCamDest $8,$D
		nextSingleText $0,$82   ; "I'll try.{W1}"
		customActscript $82,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $82,$0,$3,$3
		endMove $8080
		csWait $A
		entityPosDir $85,$C,$12,$1
		animEntityFadeInOut $85,$5
		waitIdle $82
		nextSingleText $0,$85   ; "Stop, my dear!{W1}"
		setActscript $82,$FF,eas_Jump
		nextSingleText $0,$82   ; "Oh!{W1}"
		moveEntity $82,$FF,$1,$2
		endMove $8080
		setCamDest $8,$F
		nextSingleText $C0,$80  ; "Hee, hee, hee...{N}I won't lose her now.{W1}"
		nextText $0,$81         ; "What should I do?{N}{LEADER}, can you hear{N}me?{W1}"
		nextSingleText $0,$81   ; "Save her.{W1}"
		entityShiver $80
		stopEntity $80
		nextSingleText $C0,$80  ; "I've no time to play with{N}these kids.{N}Devils!  I summon thee!{W1}"
		entityPosDir $86,$E,$12,$3
		csWait $28
		entityPosDir $87,$F,$12,$3
		setFacing $85,$3
		nextSingleText $0,$86   ; "Yeeeeee!{W1}"
		nextText $C0,$80        ; "Forget about Astral.{N}"
		nextText $C0,$80        ; "I'll kill him!{W2}"
		nextSingleText $C0,$80  ; "Eat them all up before{N}they reach her!{W1}"
		setActscript $85,$0,eas_Jump
		setActscript $86,$0,eas_Jump
		setActscript $87,$FF,eas_Jump
		csc_end
ce_49F36:       dc.w $D
		dc.w $23
		dc.w 1
		dc.b $D
		dc.b $11
		dc.b 3
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
		dc.b $23
		dc.b 1
		dc.b $CB
		dc.l eas_Init           
		dc.b $E
		dc.b $23
		dc.b 1
		dc.b $CD
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 1
		dc.b $83
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $78
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $43
		dc.l eas_Init           
		dc.w $FFFF
