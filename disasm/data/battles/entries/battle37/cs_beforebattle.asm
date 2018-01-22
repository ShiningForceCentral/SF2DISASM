
; ASM FILE data\battles\entries\battle37\cs_beforebattle.asm :
; 0x4DA66..0x4DB94 : Cutscene before battle 37
bbcs_37:        textCursor $B8C
		loadMapFadeIn 77,50,33
		loadMapEntities ce_4DB74
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setPos $7,56,37,LEFT
		setActscript $1F,$FF,eas_Init
		setPos $1F,56,35,LEFT
		setPos $1E,56,36,LEFT
		jumpIfFlagClear $4C,cs_4DAB8; Zynk is a follower
		setActscript $1A,$FF,eas_Init
		setPos $1A,63,62,DOWN
cs_4DAB8:       fadeInB
		nextSingleText $0,$80   ; "Now you shall pay for killing{N}my precious Prism Flowers.{W1}"
		setActscript $0,$0,eas_Jump
		setActscript $7,$FF,eas_Jump
		setFacing $0,DOWN
		setFacing $7,DOWN
		setFacing $1F,DOWN
		cameraSpeed $30
		nextSingleText $C0,$1F  ; "Geshp again.{W1}"
		setCamDest 40,44
		animEntityFadeInOut $80,$6
		setPos $80,45,47,UP
		animEntityFadeInOut $80,$7
		nextSingleText $0,$80   ; "Hee, hee, hee.{W1}"
		nextSingleText $C0,$7   ; "Do you have another cunning{N}trap for us?{W1}"
		nextText $0,$80         ; "Would I do that?{W2}"
		nextSingleText $0,$80   ; "I just want to introduce you{N}to my friend.{W1}"
		setFacing $80,DOWN
		nextSingleText $0,$80   ; "Red Baron, say hello!{W1}"
		setCamDest 30,54
		setActscript $81,$FF,eas_Jump
		setActscript $81,$FF,eas_Jump
		nextSingleText $0,$81   ; "Grruuooouu!{W1}"
		nextText $0,$80         ; "He's waiting for you just{N}outside the Galam gate.{W2}"
		nextText $0,$80         ; "You have to defeat him if you{N}want to advance.{W2}"
		nextText $0,$80         ; "See his red armor?{N}It's smeared with blood.{W2}"
		nextSingleText $0,$80   ; "He has killed many people.{W1}"
		setCamDest 40,44
		setFacing $80,UP
		nextText $0,$80         ; "Now, it's your turn.{W2}"
		nextSingleText $0,$80   ; "This will be your undoing.{W1}"
		animEntityFadeInOut $80,$6
		setCamDest 50,33
		setFacing $7,UP
		nextSingleText $C0,$7   ; "Galam is just over there,{N}but...{W1}"
		setFacing $1F,DOWN
		setFacing $0,RIGHT
		nextSingleText $C0,$1F  ; "We have to advance.{N}{LEADER}, are you ready?{W1}"
		entityNod $0
		csc_end
ce_4DB74:       dc.w $37
		dc.w $24
		dc.w 2
		dc.b $38
		dc.b $25
		dc.b 2
		dc.b 7
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 1
		dc.b $9F
		dc.l eas_Init           
		dc.b $23
		dc.b $3C
		dc.b 1
		dc.b $9E
		dc.l eas_Init           
		dc.w $FFFF
