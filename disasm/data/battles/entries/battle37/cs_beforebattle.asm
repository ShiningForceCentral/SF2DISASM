
; ASM FILE data\battles\entries\battle37\cs_beforebattle.asm :
; 0x4DA66..0x4DB94 : Cutscene before battle 37
bbcs_37:        textCursor $B8C         ; Initial text line $B8C : "Now you shall pay for killing{N}my precious Prism Flowers.{W1}"
		loadMapFadeIn $4D,$32,$21
		loadMapEntities ce_4DB74; Entity data to figure out and format
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		entityPosDir $7,$38,$25,$2
		setActscript $1F,$FF,eas_Init
		entityPosDir $1F,$38,$23,$2
		entityPosDir $1E,$38,$24,$2
		jumpIfFlagClear $4C,cs_4DAB8; Zynk is a follower
		setActscript $1A,$FF,eas_Init
		entityPosDir $1A,$3F,$3E,$3
cs_4DAB8:       fadeInB
		nextSingleText $0,$80   ; "Now you shall pay for killing{N}my precious Prism Flowers.{W1}"
		setActscript $0,$0,eas_Jump
		setActscript $7,$FF,eas_Jump
		setEntityDir $0,$3
		setEntityDir $7,$3
		setEntityDir $1F,$3
		csc45 $30               ; (null)
		nextSingleText $C0,$1F  ; "Geshp again.{W1}"
		setCamDest $28,$2C
		animEntityFadeInOut $80,$6
		entityPosDir $80,$2D,$2F,$1
		animEntityFadeInOut $80,$7
		nextSingleText $0,$80   ; "Hee, hee, hee.{W1}"
		nextSingleText $C0,$7   ; "Do you have another cunning{N}trap for us?{W1}"
		nextText $0,$80         ; "Would I do that?{W2}"
		nextSingleText $0,$80   ; "I just want to introduce you{N}to my friend.{W1}"
		setEntityDir $80,$3
		nextSingleText $0,$80   ; "Red Baron, say hello!{W1}"
		setCamDest $1E,$36
		setActscript $81,$FF,eas_Jump
		setActscript $81,$FF,eas_Jump
		nextSingleText $0,$81   ; "Grruuooouu!{W1}"
		nextText $0,$80         ; "He's waiting for you just{N}outside the Galam gate.{W2}"
		nextText $0,$80         ; "You have to defeat him if you{N}want to advance.{W2}"
		nextText $0,$80         ; "See his red armor?{N}It's smeared with blood.{W2}"
		nextSingleText $0,$80   ; "He has killed many people.{W1}"
		setCamDest $28,$2C
		setEntityDir $80,$1
		nextText $0,$80         ; "Now, it's your turn.{W2}"
		nextSingleText $0,$80   ; "This will be your undoing.{W1}"
		animEntityFadeInOut $80,$6
		setCamDest $32,$21
		setEntityDir $7,$1
		nextSingleText $C0,$7   ; "Galam is just over there,{N}but...{W1}"
		setEntityDir $1F,$3
		setEntityDir $0,$0
		nextSingleText $C0,$1F  ; "We have to advance.{N}{LEADER}, are you ready?{W1}"
		entityNod $0
		csc_end                 ; END OF CUTSCENE SCRIPT
ce_4DB74:       dc.b   0
		dc.b $37 
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
