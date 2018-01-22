
; ASM FILE data\battles\entries\battle28\cs_beforebattle.asm :
; 0x4BE8C..0x4C07C : Cutscene before battle 28
bbcs_28:        textCursor $A65
		loadMapFadeIn 47,0,4
		loadMapEntities ce_4C03C
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setPos $7,0,9,0
		setActscript $1F,$FF,eas_Init
		setPos $1F,0,7,0
		stopEntity $81
		playSound MUSIC_BATTLE_THEME_3
		fadeInB
		cameraSpeed $30
		moveEntity $0,$0,$0,$3
		endMove $8080
		moveEntity $1F,$0,$0,$3
		endMove $8080
		moveEntity $7,$0,$0,$3
		endMove $8080
		moveEntity $80,$FF,$0,$3
		endMove $8080
		csWait 40
		setActscript $1F,$FF,eas_Jump
		moveEntity $1F,$FF,$0,$2
		moreMove $3,$1
		endMove $8080
		setFacing $1F,0
		nextSingleText $0,$1F   ; "Wow, look at that?{W1}"
		setCamDest 7,11
		entityShiver $82
		playSound SFX_MONSTER_SCREAM
		csWait 30
		entityShiver $83
		playSound SFX_MONSTER_SCREAM
		csWait 40
		setCamDest 0,6
		moveEntity $7,$FF,$3,$1
		moreMove $0,$1
		endMove $8080
		nextSingleText $0,$7    ; "Those monsters are eating{N}the bridge.{W1}"
		nextSingleText $0,$81   ; "Help!  Help me!{W1}"
		setActscript $0,$0,eas_Jump
		setActscript $1F,$0,eas_Jump
		setActscript $7,$FF,eas_Jump
		moveEntity $0,$FF,$3,$1
		moreMove $0,$1
		moreMove $3,$1
		endMove $8080
		csWait 5
		setActscript $0,$0,eas_461B6
		csWait 5
		setActscript $7,$0,eas_461E4
		csWait 100
		setActscript $1F,$FF,eas_Jump
		customActscript $1F,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $1F,$0,$3,$2
		endMove $8080
		csWait 10
		stopEntity $0
		customActscript $0,$FF
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setQuake 2
		playSound SFX_HIT_2
		moveEntity $0,$FF,$3,$1
		endMove $8080
		setFacing $0,1
		customActscript $0,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $2
		dc.w 2
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		waitIdle $1F
		setFacing $1F,0
		setQuake 0
		nextText $0,$1F         ; "Look!{W2}"
		nextSingleText $0,$1F   ; "She's stranded on the{N}bridge.{W1}"
		setFacing $7,0
		entityShiver $0
		setCamDest 7,21
		nextSingleText $0,$7    ; "Get away from the bridge{N}before it falls into the{N}river!{W1}"
		nextText $0,$81         ; "I sprained my ankle!{N}Please help me!{W2}"
		nextSingleText $0,$81   ; "I can't stand up!{W1}"
		setCamDest 0,6
		setFacing $1F,3
		setActscript $1F,$FF,eas_Jump
		csWait 30
		setActscript $0,$FF,eas_Init
		startEntity $0
		entityShakeHead $0
		nextSingleText $0,$1F   ; "{LEADER}, defeat all the{N}monsters!  Hurry!{W1}"
		setActscript $7,$0,eas_Jump
		entityNod $0
		csc_end
ce_4C03C:       dc.w 1
		dc.w 8
		dc.w 0
		dc.b 0
		dc.b 9
		dc.b 0
		dc.b 7
		dc.l eas_Init           
		dc.b 0
		dc.b 8
		dc.b 0
		dc.b $3E
		dc.l eas_Init           
		dc.b $C
		dc.b $18
		dc.b 1
		dc.b $B0
		dc.l eas_Init           
		dc.b $D
		dc.b $D
		dc.b 2
		dc.b $54
		dc.l eas_Init           
		dc.b $C
		dc.b $11
		dc.b 1
		dc.b $54
		dc.l eas_Init           
		dc.b $B
		dc.b $16
		dc.b 3
		dc.b $54
		dc.l eas_Init           
		dc.b $B
		dc.b $19
		dc.b 0
		dc.b $54
		dc.l eas_Init           
		dc.w $FFFF
