
; ASM FILE data\battles\entries\battle42\cs_beforebattle.asm :
; 0x4ED8E..0x4EF04 : Cutscene before battle 42
bbcs_42:        textCursor $C10
		loadMapFadeIn $3B,$8,$1D
		loadMapEntities ce_4EEDC
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		entityPosDir $7,$C,$24,$1
		setActscript $1F,$FF,eas_Init
		entityPosDir $1F,$E,$24,$1
		setActscript $1C,$FF,eas_Init
		entityPosDir $1C,$D,$24,$1
		jumpIfFlagClear $4C,cs_4EDE8; Zynk is a follower
		setActscript $1A,$FF,eas_Init
		entityPosDir $1A,$3F,$3E,$3
cs_4EDE8:       stopEntity $81
		customActscript $81,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		playSound MUSIC_WITCH
		fadeInFromBlackHalf
		cameraSpeed $30
		csWait $3C
		moveEntity $7,$FF,$1,$2
		endMove $8080
		nextSingleText $0,$7    ; "I can't see!  Is anybody{N}there?{W1}"
		nextSingleText $C0,$80  ; "Welcome...{W1}"
		setActscript $0,$0,eas_Jump
		setActscript $7,$0,eas_Jump
		setActscript $1F,$0,eas_Jump
		setActscript $1C,$FF,eas_Jump
		moveEntity $1F,$FF,$1,$3
		endMove $8080
		nextSingleText $0,$1F   ; "King Galam?{W1}"
		nextSingleText $C0,$80  ; "Is it too dark?{N}Let there be light!{W1}"
		fadeInB
		nextSingleText $C0,$80  ; "Is that better?{W1}"
		moveEntity $0,$0,$1,$2
		endMove $8080
		moveEntity $1C,$FF,$1,$2
		endMove $8080
		entityShiver $1F
		nextSingleText $0,$1F   ; "King Galam!{W1}"
		moveEntity $0,$0,$2,$1
		endMove $8080
		moveEntity $1C,$FF,$1,$1
		endMove $8080
		setFacing $0,$1
		moveEntity $1C,$FF,$1,$1
		endMove $8080
		nextSingleText $0,$1C   ; "Oh, Princess Elis is here!{W1}"
		setCamDest $8,$D
		nextSingleText $C0,$80  ; "Nice to see you again,{N}Astral.  I see {NAME;28} is{N}with you.{W1}"
		nextSingleText $0,$1F   ; "Where's Zeon?{W1}"
		nextText $C0,$80        ; "He has not revived fully yet.{W2}"
		nextSingleText $C0,$80  ; "So I came to welcome you for{N}him.{W1}"
		nextSingleText $0,$7    ; "She isn't moving!{N}Is she dead?{W1}"
		setFacing $80,$1
		csWait $28
		setFacing $80,$3
		nextSingleText $C0,$80  ; "We haven't killed her yet.{N}She will be the first{N}sacrifice for King Zeon.{W1}"
		nextText $0,$1F         ; "What?!{W2}"
		nextSingleText $0,$1F   ; "Zeon said, you'd return her{N}in exchange for the jewel!{W1}"
		nextText $C0,$80        ; "Ha, ha, ha!  He lied.{W2}"
		nextText $C0,$80        ; "You killed our greater{N}devils.{N}I can't allow this to go on.{W2}"
		nextSingleText $C0,$80  ; "You shall never see Zeon!{N}I'll kill you before that!{W1}"
		setQuake $3
		playSound SFX_INTRO_LIGHTNING
		flashScreenWhite $1E
		csWait $14
		setQuake $0
		csc_end
ce_4EEDC:       dc.w $D
		dc.w $23
		dc.w 1
		dc.b $C
		dc.b $24
		dc.b 1
		dc.b 7
		dc.l eas_Init           
		dc.b $D
		dc.b $24
		dc.b 1
		dc.b $1C
		dc.l eas_Init           
		dc.b $D
		dc.b $12
		dc.b 3
		dc.b $A4
		dc.l eas_Init           
		dc.b $D
		dc.b $F
		dc.b 3
		dc.b $CC
		dc.l eas_Init           
		dc.w $FFFF
