
; ASM FILE data\battles\entries\battle26\cs_beforebattle.asm :
; 0x4B958..0x4BCAA : Cutscene before battle 26
bbcs_26:        textCursor $A24
		loadMapFadeIn 72,2,20
		loadMapEntities ce_4BC5A
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setPos $7,6,26,0
		setActscript $1F,$FF,eas_Init
		setPos $1F,6,24,0
		setPos $1E,6,25,0
		fadeInB
		cameraSpeed $30
		nextSingleText $0,$80   ; "Answer me!{N}Where are you going?{W1}"
		setCamDest 13,9
		nextSingleText $C0,$13  ; "Ah...I...{W1}"
		nextSingleText $0,$80   ; "You were going to South{N}Parmecia to get help, right?{W1}"
		nextSingleText $C0,$13  ; "I...uh...{W1}"
		nextText $0,$80         ; "Paladins of Pacalon are{N}cowards!  {NAME;19}, don't{N}you have any pride?{W2}"
		nextSingleText $0,$80   ; "Wimp!{W1}"
		moveEntity $85,$FF,$1,$2
		moreMove $0,$1
		endMove $8080
		setFacing $85,1
		nextSingleText $C0,$85  ; "Shut up!  Mr. {NAME;19} is{N}the bravest soldier in the{N}world!{W1}"
		nextSingleText $C0,$13  ; "I can defend myself.{W1}"
		nextSingleText $0,$80   ; "Come on, you half-breed!{W1}"
		setFacing $80,1
		nextSingleText $0,$80   ; "Are you afraid of me?{N}I'll turn my back to you.{N}Now, run away you cowards!{W1}"
		setActscript $85,$FF,eas_Jump
		nextSingleText $C0,$85  ; "You've gone too far!{W1}"
		customActscript $85,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $85,$0,$1,$3
		endMove $8080
		csWait 5
		animEntityFadeInOut $80,$6
		waitIdle $85
		csWait 5
		setActscript $85,$0,eas_461B6
		csWait 120
		setFacing $83,2
		setFacing $85,3
		csWait 20
		customActscript $83,$FF
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $83,$0,$2,$1
		endMove $8080
		csWait 3
		customActscript $85,$FF
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setQuake 2
		setActscript $85,$FF,eas_JumpLeft
		setQuake 0
		setActscript $85,$FF,eas_JumpLeft
		nextSingleText $C0,$85  ; "Aaaauuuuu!{W1}"
		setActscript $85,$FF,eas_Die
		setCamDest 13,13
		setPos $80,18,19,1
		animEntityFadeInOut $80,$7
		nextSingleText $0,$80   ; "Pacalon soldiers have no{N}honor.  They attack while{N}my back is turned!{W1}"
		setActscript $86,$FF,eas_Jump
		setFacing $13,3
		setFacing $86,3
		csWait 30
		moveEntity $86,$FF,$2,$1
		moreMove $3,$1
		endMove $8080
		nextText $C0,$86        ; "What?!{W2}"
		nextSingleText $C0,$86  ; "If Mr. {NAME;19} was not{N}ill, you'd be history!{W1}"
		nextText $0,$80         ; "Oh, is {NAME;19} ill?{W1}"
		nextSingleText $0,$80   ; "In that case, you can try{N}and take me.{W1}"
		nextSingleText $C0,$86  ; "I can no longer put up with{N}these insults!{W1}"
		nextSingleText $C0,$13  ; "No, no!{W1}"
		setPos $81,13,18,0
		customActscript $81,$FF
		dc.w $10                ;   0010 SET SPEED X=$50 Y=$50
		dc.b $50
		dc.b $50
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
		moveEntity $86,$0,$3,$2
		endMove $8080
		moveEntity $81,$0,$0,$4
		endMove $8080
		csWait 20
		customActscript $86,$FF
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setQuake 3
		setActscript $86,$FF,eas_JumpRight
		setQuake 0
		setActscript $86,$FF,eas_JumpRight
		nextSingleText $C0,$86  ; "Grruuu....{W1}"
		setActscript $86,$FF,eas_Die
		setFacing $81,3
		moveEntity $80,$FF,$1,$2
		endMove $8080
		nextSingleText $0,$80   ; "You look so sad,{N}{NAME;19}....{W1}"
		nextSingleText $C0,$13  ; "You're not just a normal{N}devil soldier.{W1}"
		nextText $0,$80         ; "You're right, {NAME;19}.{N}I see why you're the leader{N}of the Pacalon Army.{W2}"
		nextSingleText $0,$80   ; "I'm Geshp!  An adviser for{N}Zeon!{W1}"
		nextSingleText $C0,$13  ; "How did you know my name?{W1}"
		nextSingleText $0,$80   ; "I know everything.{W1}"
		nextText $C0,$13        ; "Now, tell me the reason why{N}"
		nextSingleText $C0,$13  ; "you're keeping me alive.{W1}"
		nextSingleText $0,$80   ; "Ha, ha!  You're smart!{W1}"
		animEntityFadeInOut $84,$4
		entityFlashWhite $80,$1E
		setCamDest 13,11
		setPos $84,18,12,3
		animEntityFadeInOut $84,$5
		nextSingleText $C0,$13  ; "What did you do?{W1}"
		moveEntity $84,$FF,$3,$1
		endMove $8080
		animEntityFadeInOut $84,$4
		nextSingleText $C0,$13  ; "I...can't...!{N}My body won't...{W1}"
		entityShiver $13
		stopEntity $13
		nextText $0,$80         ; "I came here to borrow your{N}body.{W2}"
		nextSingleText $0,$80   ; "Ha, ha!  Welcome our new{N}leader!{W1}"
		stopEntity $13
		customActscript $13,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		nextSingleText $C0,$1F  ; "Stop!!!{W1}"
		customActscript $81,$FF
		dc.w $10                ;   0010 SET SPEED X=$20 Y=$20
		dc.b $20
		dc.b $20
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $81,$0,eas_Jump
		setActscript $80,$FF,eas_Jump
		setCamDest 13,15
		moveEntity $80,$FF,$3,$3
		endMove $8080
		csWait 5
		setActscript $80,$0,eas_461B6
		csWait 120
		moveEntity $80,$FF,$2,$1
		endMove $8080
		nextSingleText $0,$80   ; "Who said that?{W1}"
		setCamDest 2,20
		csWait 60
		setCamDest 13,15
		nextText $0,$80         ; "A force from the south?{N}How?{W2}"
		nextSingleText $0,$80   ; "Where did you come from?{W1}"
		nextSingleText $C0,$1F  ; "We're from Granseal!{W1}"
		nextSingleText $0,$80   ; "But, that's on the other....{W1}"
		setActscript $80,$FF,eas_46172
		customActscript $80,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $80,$FF,$0,$2
		endMove $8080
		nextSingleText $0,$80   ; "I'd better leave...{W2}"
		setFacing $80,1
		nextSingleText $0,$80   ; "Devil soldiers!  Stop that{N}force from Granseal!{W1}"
		setFacing $80,3
		setActscript $81,$0,eas_Jump
		animEntityFadeInOut $80,$6
		csc_end
ce_4BC5A:       dc.w 7
		dc.w $19
		dc.w 0
		dc.b 6
		dc.b $1A
		dc.b 0
		dc.b 7
		dc.l eas_Init           
		dc.b $12
		dc.b $E
		dc.b 1
		dc.b $13
		dc.l eas_Init           
		dc.b $12
		dc.b $B
		dc.b 3
		dc.b $9F
		dc.l eas_Init           
		dc.b $11
		dc.b $B
		dc.b 3
		dc.b $6D
		dc.l eas_Init           
		dc.b $13
		dc.b $B
		dc.b 3
		dc.b $91
		dc.l eas_Init           
		dc.b $14
		dc.b $A
		dc.b 3
		dc.b $53
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $6A
		dc.l eas_Init           
		dc.b $11
		dc.b $F
		dc.b 1
		dc.b $E9
		dc.l eas_Init           
		dc.b $13
		dc.b $F
		dc.b 1
		dc.b $E9
		dc.l eas_Init           
		dc.w $FFFF
