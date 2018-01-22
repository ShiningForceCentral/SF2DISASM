
; ASM FILE data\battles\entries\battle08\cs_afterbattle.asm :
; 0x4AA74..0x4ABFE : Cutscene after battle 8
abcs_battle08:  textCursor $9A4
		loadMapFadeIn 72,8,32
		loadMapEntities ce_4ABBE
		setActscript $0,$FF,eas_Init
		stopEntity $81
		customActscript $81,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		jumpIfFlagSet $6,cs_4AAB6; Kiwi joined
		setPos $6,63,63,3
cs_4AAB6:       fadeInB
		nextSingleText $0,$80   ; "The game will be suspended.{N}OK?"
		setFacing $80,2
		moveEntity $80,$FF,$2,$1
		endMove $8080
		setFacing $80,1
		moveEntity $80,$FF,$1,$1
		endMove $8080
		setFacing $80,0
		nextSingleText $0,$80   ; "....{W1}"
		setActscript $81,$FF,eas_Init
		entitySprite $81,$3B
		setFacing $81,2
		nextSingleText $C0,$81  ; "{LEADER}, are you ready{N}for battle?{D3}"
		entitySprite $81,$CA
		setFacing $81,3
		nextSingleText $C0,$81  ; "Do you need more preparations?"
		setActscript $81,$FF,eas_Init
		csWait 5
		setActscript $81,$0,eas_461B6
		csWait 120
		setFacing $81,2
		startEntity $81
		nextSingleText $C0,$81  ; "Did you change your mind?{W2}"
		setFacing $81,3
		nextSingleText $C0,$81  ; "Be careful.{D1}{N}Haste makes waste.{D1}"
		setActscript $80,$0,eas_BumpRight
		customActscript $81,$FF
		dc.w $10                ;   0010 SET SPEED X=$20 Y=$20
		dc.b $20
		dc.b $20
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $81,$FF,eas_4618A
		csWait 8
		moveEntity $81,$FF,$0,$1
		endMove $8080
		setFacing $81,3
		entityShakeHead $81
		nextText $0,$80         ; "{LEADER}, you had better{N}take a rest now.{D3}"
		nextSingleText $0,$80   ; "{LEADER}, to retreat is{N}sometimes a good strategy.{D3}"
		setFacing $81,2
		nextText $C0,$81        ; "{LEADER}, are you ready?{D3}"
		nextText $C0,$81        ; "{LEADER}, you are going to{N}battle again."
		nextText $C0,$81        ; "{LEADER}, take it easy!{W1}"
		nextSingleText $C0,$81  ; "{LEADER}, take it easy!{W1}"
		setFacing $81,0
		csWait 20
		setFacing $6,0
		setCamDest 22,32
		csWait 30
		setCamDest 8,32
		moveEntity $80,$FF,$0,$1
		endMove $8080
		setActscript $80,$FF,eas_Jump
		nextText $0,$80         ; "{LEADER}, are you ready?{D3}"
		nextSingleText $0,$80   ; "Do you need more preparations?"
		setFacing $80,3
		moveEntity $80,$FF,$3,$1
		endMove $8080
		nextSingleText $0,$80   ; "You changed your mind?{W2}"
		mapSysEvent $49,$3E,$31,$2
		csc_end
ce_4ABBE:       dc.w $E
		dc.w $25
		dc.w 1
		dc.b $E
		dc.b $23
		dc.b 1
		dc.b $CA
		dc.l eas_Init           
		dc.b $D
		dc.b $24
		dc.b 1
		dc.b 1
		dc.l eas_Init           
		dc.b $C
		dc.b $23
		dc.b 1
		dc.b 3
		dc.l eas_Init           
		dc.b $F
		dc.b $24
		dc.b 1
		dc.b 4
		dc.l eas_Init           
		dc.b $10
		dc.b $23
		dc.b 1
		dc.b 2
		dc.l eas_Init           
		dc.b $10
		dc.b $22
		dc.b 2
		dc.b 6
		dc.l eas_Init           
		dc.b $E
		dc.b $22
		dc.b 3
		dc.b $CA
		dc.l eas_Init           
		dc.w $FFFF
