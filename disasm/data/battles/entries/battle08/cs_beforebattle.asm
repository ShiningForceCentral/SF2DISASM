
; ASM FILE data\battles\entries\battle08\cs_beforebattle.asm :
; 0x4A952..0x4AA74 : Cutscene before battle 8
bbcs_08:        textCursor $99D
		loadMapFadeIn 72,1,46
		loadMapEntities ce_4AA14
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
		jumpIfFlagSet $6,cs_4A994; Kiwi joined
		setPos $6,63,63,DOWN
cs_4A994:       playSound MUSIC_MAIN_THEME
		fadeInB
		nextSingleText $0,$80   ; "The game will be suspended.{N}OK?"
		moveEntity $80,$FF,$0,$2
		endMove $8080
		setFacing $80,UP
		moveEntity $80,$FF,$1,$1
		endMove $8080
		setCameraEntity $81
		nextSingleText $0,$80   ; "....{W1}"
		playSound MUSIC_ENEMY_ATTACK
		setCamDest 7,32
		setPos $83,12,35,DOWN
		csWait 20
		setPos $84,11,35,DOWN
		csWait 20
		setPos $85,13,35,DOWN
		csWait 30
		setPos $82,12,37,DOWN
		nextSingleText $C0,$82  ; "{LEADER}, are you ready{N}for battle?{D3}"
		nextSingleText $C0,$82  ; "Do you need more preparations?"
		nextText $C0,$82        ; "Did you change your mind?{W2}"
		nextSingleText $C0,$82  ; "Be careful.{D1}{N}Haste makes waste.{D1}"
		setFacing $82,UP
		nextSingleText $C0,$82  ; "{LEADER}, you had better{N}take a rest now.{D3}"
		setActscript $83,$0,eas_Jump
		setActscript $84,$0,eas_Jump
		setActscript $85,$FF,eas_Jump
		csc_end
ce_4AA14:       dc.w 4
		dc.w $32
		dc.w 0
		dc.b 5
		dc.b $32
		dc.b 0
		dc.b $CA
		dc.l eas_Init           
		dc.b 4
		dc.b $31
		dc.b 0
		dc.b 1
		dc.l eas_Init           
		dc.b 4
		dc.b $33
		dc.b 0
		dc.b 3
		dc.l eas_Init           
		dc.b 3
		dc.b $32
		dc.b 0
		dc.b 4
		dc.l eas_Init           
		dc.b 2
		dc.b $32
		dc.b 0
		dc.b 2
		dc.l eas_Init           
		dc.b 1
		dc.b $32
		dc.b 0
		dc.b 6
		dc.l eas_Init           
		dc.b $E
		dc.b $22
		dc.b 3
		dc.b $CA
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $84
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $44
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $45
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $79
		dc.l eas_Init           
		dc.w $FFFF
