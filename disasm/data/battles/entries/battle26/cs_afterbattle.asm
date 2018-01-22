
; ASM FILE data\battles\entries\battle26\cs_afterbattle.asm :
; 0x4BCAA..0x4BE6A : Cutscene after battle 26
abcs_battle26:  textCursor $A4D
		loadMapFadeIn 72,13,11
		loadMapEntities ce_4BE4A
		setActscript $0,$FF,eas_Init
		customActscript $13,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $7,$FF,eas_Init
		setPos $7,17,14,0
		setActscript $1F,$FF,eas_Init
		setPos $1F,18,16,1
		setPos $1E,19,17,1
		setPriority $13,$0
		setPriority $80,$FFFF
		fadeInB
		moveEntity $7,$FF,$3,$2
		endMove $8080
		setFacing $7,0
		nextSingleText $0,$7    ; "Is he alright?{W1}"
		nextSingleText $0,$1F   ; "We have to save him before{N}he is possessed by an evil...{W1}"
		entityFlashWhite $1F,$3C
		flashScreenWhite $1E
		setCamDest 13,9
		animEntityFadeInOut $80,$4
		setPos $80,18,13,3
		animEntityFadeInOut $80,$5
		setFacing $7,1
		moveEntity $80,$FF,$1,$3
		endMove $8080
		customActscript $80,$FF
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $80,$0,eas_4509E
		csWait 200
		setActscript $80,$FF,eas_Die
		setCamDest 13,11
		customActscript $13,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $0
		dc.w 0
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setFacing $13,3
		entityShakeHead $13
		nextSingleText $C0,$13  ; "What happened?{W2}"
		moveEntity $13,$FF,$1,$1
		endMove $8080
		setActscript $13,$FF,eas_Jump
		nextSingleText $C0,$13  ; "Ah...I was almost possessed{N}by that devil.{W1}"
		moveEntity $13,$FF,$3,$2
		endMove $8080
		nextSingleText $C0,$13  ; "Thank you.{N}How can I repay you for{N}your kindness?{W1}"
		nextText $0,$1F         ; "Are you OK now?  Good.{W2}"
		nextSingleText $0,$1F   ; "May I ask you, where were{N}you going in such a wounded{N}state?{W1}"
		nextText $C0,$13        ; "Pacalon, my country.  We{N}are fighting against the{N}devils.{W2}"
		nextText $C0,$13        ; "But, no country in North{N}Parmecia has enough power{N}to resist them.{W2}"
		nextSingleText $C0,$13  ; "So, I was heading south to{N}find some allies.{W1}"
		moveEntity $7,$FF,$1,$1
		endMove $8080
		setFacing $7,0
		nextSingleText $0,$7    ; "You don't have to go any{N}further.{W1}"
		setFacing $13,2
		nextSingleText $C0,$13  ; "Then, you're from South{N}Parmecia?{W1}"
		nextSingleText $0,$1F   ; "Yes, Granseal.{W1}"
		setFacing $13,3
		nextSingleText $C0,$13  ; "Oh, how lucky!  Please{N}come with me to Pacalon!{W1}"
		entityNod $13
		nextSingleText $0,$7    ; "But, we have to go to{N}Tristan.{W1}"
		setFacing $13,2
		nextText $C0,$13        ; "Oh, please...I can't return{N}to Pacalon without allies.{W2}"
		nextText $C0,$13        ; "Maybe, when you're done...{W2}"
		nextSingleText $C0,$13  ; "OK, I'll go with you.{W1}"
		join $13
		nextSingleText $0,$1F   ; "But, you're injured{N}Mr. {NAME;19}.{W1}"
		setFacing $13,3
		nextSingleText $C0,$13  ; "No problem.  I don't know{N}why, but I'm much better.{W1}"
		setActscript $13,$0,eas_RotateRight
		csWait 40
		setActscript $13,$FF,eas_Jump
		setFacing $13,3
		setActscript $13,$FF,eas_Jump
		setActscript $13,$FF,eas_Init
		startEntity $13
		nextSingleText $C0,$13  ; "Let's go to Pacalon.{W1}"
		addNewFollower $13
		csc_end
ce_4BE4A:       dc.w $13
		dc.w $10
		dc.w 1
		dc.b $11
		dc.b $E
		dc.b 3
		dc.b 7
		dc.l eas_Init           
		dc.b $12
		dc.b $E
		dc.b 3
		dc.b $13
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 1
		dc.b $6A
		dc.l eas_Init           
		dc.w $FFFF
