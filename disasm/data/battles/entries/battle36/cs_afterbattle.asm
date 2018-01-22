
; ASM FILE data\battles\entries\battle36\cs_afterbattle.asm :
; 0x4D9A4..0x4DA66 : Cutscene after battle 36
abcs_battle36:  textCursor $B89
		loadMapFadeIn 53,6,17
		loadMapEntities ce_4DA46
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setPos $7,10,19,DOWN
		setActscript $1F,$FF,eas_Init
		setPos $1F,12,19,DOWN
		jumpIfFlagClear $4C,cs_4D9F0; Zynk is a follower
		setActscript $1A,$FF,eas_Init
		setPos $1A,63,62,DOWN
cs_4D9F0:       animEntityFadeInOut $80,$6
		fadeInB
		animEntityFadeInOut $80,$7
		setActscript $80,$FF,eas_Jump
		csWait 5
		setActscript $80,$0,eas_461B6
		csWait 120
		setFacing $80,DOWN
		nextText $0,$80         ; "Prism Flowers?{W2}"
		nextSingleText $0,$80   ; "My Prism Flowers!{W1}"
		setFacing $80,UP
		nextSingleText $0,$80   ; "{LEADER}, I shall return{N}with Red Baron!{N}You'll pay for this!{W1}"
		animEntityFadeInOut $80,$6
		followEntity $81,$0,$2
		followEntity $7,$81,$1
		followEntity $1F,$81,$3
		csc_end
ce_4DA46:       dc.w $B
		dc.w $14
		dc.w 3
		dc.b $A
		dc.b $13
		dc.b 3
		dc.b 7
		dc.l eas_Init           
		dc.b $B
		dc.b $17
		dc.b 3
		dc.b $9F
		dc.l eas_Init           
		dc.b $B
		dc.b $13
		dc.b 3
		dc.b $3E
		dc.l eas_Init           
		dc.w $FFFF
