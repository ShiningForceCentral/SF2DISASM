
; ASM FILE data\battles\entries\battle34\cs_afterbattle.asm :
; 0x4D4B6..0x4D6CE : Cutscene after battle 34
abcs_battle34:  textCursor $B5F
		loadMapFadeIn 55,2,7
		loadMapEntities ce_4D69E
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setPos $7,9,11,UP
		setActscript $1F,$FF,eas_Init
		setPos $1F,5,11,UP
		jumpIfFlagClear $4C,cs_4D502; Zynk is a follower
		setActscript $1A,$FF,eas_Init
		setPos $1A,8,12,UP
cs_4D502:       stopEntity $80
		customActscript $80,$FF
		ac_setAnimCounter $0    ;   
		ac_setFlip $1           ;   
		ac_updateSprite         ;   
		ac_jump eas_Idle        ;   
		ac_end
		stopEntity $83
		setActscript $83,$FF,eas_46172
		fadeInB
		entityShiver $80
		nextSingleText $0,$80   ; "{LEADER}, I lost?!{N}Take this.{W1}"
		nextSingleText $FF,$FF  ; "Cameela reveals the Sky Orb.{W1}"
		setPos $83,7,10,LEFT
		nextText $0,$80         ; "This is the Sky Orb.  With{N}it, you can drive the Nazca{N}Ship.{W2}"
		nextText $0,$80         ; "Listen.  You have to be very{N}careful from now on.{W2}"
		nextSingleText $0,$80   ; "Geshp has Prism Flowers.{N}He will...{W1}"
		tintMap
		nextSingleText $C0,$81  ; "Your life is over,{N}Cameela!{W1}"
		flashScreenWhite $2
		tintMap
		setActscript $80,$FF,eas_Init
		setFacing $80,LEFT
		entitySprite $80,$B4
		startEntity $80
		setActscript $80,$0,eas_AnimSpeedx2
		setActscript $0,$0,eas_Jump
		setActscript $7,$0,eas_Jump
		jumpIfFlagClear $4C,cs_4D592; Zynk is a follower
		setActscript $1A,$0,eas_Jump
cs_4D592:       setActscript $1F,$FF,eas_Jump
		nextSingleText $0,$80   ; "Geshp!{W1}"
		nextSingleText $C0,$81  ; "Ha, ha, ha!  You acted just{N}as I planned!{W1}"
		nextSingleText $0,$80   ; "Ouuuuu...Ges...{W1}"
		entitySprite $80,$9C
		setActscript $80,$FF,eas_Die
		nextSingleText $0,$1F   ; "How horrible!{W1}"
		nextText $C0,$81        ; "It's the law.  Traitors{N}die by fire.{W2}"
		nextText $C0,$81        ; "Congratulations!{N}You have a ship now!{N}Come to Grans!{W2}"
		nextSingleText $C0,$81  ; "I have to go now and{N}prepare your welcoming{N}party!{W1}"
		flickerOnce
		csWait 60
		setFacing $7,LEFT
		nextText $0,$7          ; "I really hate him!{W2}"
		nextSingleText $0,$7    ; "Prism Flowers?{N}What are they?{W1}"
		setFacing $1F,RIGHT
		nextSingleText $0,$1F   ; "I have no idea, but it's{N}probably a trap.{W1}"
		jumpIfFlagClear $4C,cs_4D620; Zynk is a follower
		customActscript $1A,$FF
		ac_setSpeed 6168        ;   
		ac_jump eas_Idle        ;   
		ac_end
		entityActions $1A,$FF
		 moveUp 1
		 moveLeft 1
		endActions
		nextSingleText $0,$1A   ; "Ancient flower.{W1}"
		entityActions $1F,$FF
		 moveRight 1
		endActions
		nextSingleText $0,$1F   ; "Excuse me?{W1}"
		nextSingleText $0,$1A   ; "Ancient countries had those{N}flowers along their borders.{W1}"
		nextSingleText $0,$1F   ; "What kind of flowers are{N}they?{W1}"
		setFacing $1A,UP
		csWait 30
		nextSingleText $0,$1A   ; "I cannot explain....{W1}"
cs_4D620:       textCursor $B74
		entityActions $7,$FF
		 moveLeft 1
		endActions
		nextSingleText $0,$7    ; "We will see them when we{N}arrive at Grans.{W1}"
		nextSingleText $0,$1F   ; "{LEADER}, grab the Sky{N}Orb.{N}Let's go.{W1}"
		entityActions $7,$FF
		 moveUp 1
		endActions
		setFacing $7,LEFT
		jumpIfFlagClear $4C,cs_4D654; Zynk is a follower
		entityActions $1A,$FF
		 moveRight 1
		endActions
		setFacing $1A,LEFT
cs_4D654:       entityNod $0
		entityActions $0,$FF
		 moveUp 1
		endActions
		hideEntity $83
		executeSubroutine csub_4D694
		followEntity $82,$0,$2
		followEntity $7,$82,$1
		followEntity $1F,$82,$3
		jumpIfFlagClear $4C,cs_4D692; Zynk is a follower
		followEntity $1A,$82,$2
cs_4D692:       csc_end

; =============== S U B R O U T I N E =======================================

csub_4D694:
		moveq   #$71,d0 
		moveq   #1,d1
		jmp     sub_4F48A

	; End of function csub_4D694

ce_4D69E:       mainEntity 7,12,UP
		entity 9,11,UP,7,eas_Init
		entity 7,9,DOWN,156,eas_Init
		entity 63,63,DOWN,159,eas_Init
		entity 6,12,UP,62,eas_Init
		entity 63,63,LEFT,172,eas_Init
		dc.w $FFFF
