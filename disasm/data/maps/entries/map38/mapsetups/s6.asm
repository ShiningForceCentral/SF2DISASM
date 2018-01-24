
; ASM FILE data\maps\entries\map38\mapsetups\s6.asm :
; 0x5DD58..0x5DF84 : 

; =============== S U B R O U T I N E =======================================

ms_map38_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $399
		beq.s   loc_5DD78
		trap    #SET_FLAG
		dc.w $38F               ; set after the Petro death scene in Roft
		trap    #CHECK_FLAG
		dc.w $1A
		bne.s   loc_5DD78
		trap    #CHECK_FLAG
		dc.w $104
		bne.s   loc_5DD78
		lea     cs_5DD8E(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $104
loc_5DD78:
		trap    #CHECK_FLAG
		dc.w $38E
		bne.s   return_5DD8C
		lea     cs_5DD9C(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $38E               ; set after the initial scene on entering Roft (where the guy thinks you're Galam)
		trap    #SET_FLAG
		dc.w $102
return_5DD8C:
		rts

	; End of function ms_map38_InitFunction

cs_5DD8E:       newEntity $1A,11,8,DOWN,$FF
		setFacing $1A,DOWN
		csc_end
cs_5DD9C:       setPos $80,14,26,DOWN
		textCursor $854
		csWait 1
		setPos $0,14,28,UP
		setPos $7,13,29,UP
		setPos $1F,14,29,UP
		jumpIfFlagSet $4C,cs_5DE22; Zynk is a follower
cs_5DDC2:       playSound MUSIC_TOWN
		fadeInB
		setCameraEntity $80
		setActscript $80,$FF,eas_Jump
		nextSingleText $0,$80   ; "Galam soldiers!  Run!{W1}"
		entityActions $80,$FF
		 moveLeft 2
		endActions
		entityActions $80,$FF
		 moveUp 1
		endActions
		entityActions $80,$FF
		 moveLeft 2
		endActions
		setFacing $0,LEFT
		setFacing $7,LEFT
		setFacing $1F,LEFT
		nextSingleText $0,$7    ; "No, wait!  We're not Galam{N}soldiers!{W1}"
		setFacing $80,RIGHT
		nextSingleText $0,$80   ; "No...?{W1}"
		entityActions $80,$FF
		 moveDown 2
		endActions
		entityActions $80,$FF
		 moveRight 2
		endActions
		nextSingleText $0,$80   ; "Oops.  My mistake.{W2}"
		nextSingleText $0,$80   ; "Oh, it's obvious.  I can see{N}it in your eyes.{W1}"
		csc_end
cs_5DE22:       setPos $1A,15,29,UP
		jump cs_5DDC2
cs_5DE2E:       textCursor $86A
		stopEntity $8E
		playSound $FD
		setCamDest 8,0
		entityShiver $89
		playSound MUSIC_SAD_THEME_3
		nextSingleText $0,$89   ; "Sir Petro, don't leave me{N}alone!{W1}"
		nextSingleText $0,$8E   ; "Paseran...I'm sorry.{W1}"
		entityShiver $89
		nextSingleText $0,$89   ; "You promised to fly me in{N}the sky!{W1}"
		nextText $0,$8E         ; "I know...with the Nazca{N}Ship...I promised...{W2}"
		nextText $0,$8E         ; "I'd fly home...to see my{N}family....{W2}"
		nextSingleText $0,$8E   ; "To show them how wonderful{N}the ancients were....{W1}"
		entityShiver $89
		playSound $FD
		nextSingleText $0,$89   ; "Petro!  No!{W1}"
		playSound $FB
		csc_end
cs_5DE76:       textCursor $879
		setActscript $7,$FF,eas_Init
		setActscript $1F,$FF,eas_Init
		setCameraEntity $1A
		setEntityDest $0,12,9
		setEntityDest $7,12,8
		setEntityDest $7,13,8
		setEntityDest $1F,12,8
		setEntityDest $1F,14,8
		setActscript $1A,$FF,eas_Init
		setEntityDest $1A,11,8
		setFacing $0,LEFT
		setFacing $7,LEFT
		setFacing $1F,LEFT
		entityActions $1A,$FF
		 moveLeft 2
		endActions
		entityActions $7,$FF
		 moveLeft 2
		endActions
		entityActions $1F,$FF
		 moveLeft 1
		endActions
		entityActions $1A,$FF
		 moveDown 1
		endActions
		entityActions $1A,$FF
		 moveRight 1
		endActions
		entityActions $1A,$FF
		 moveUp 1
		endActions
		entityActions $1A,$FF
		 moveLeft 2
		endActions
		setActscript $1A,$FF,eas_Jump
		setActscript $1A,$0,eas_Jump
		nextSingleText $0,$7    ; "What's wrong with {NAME;26}?{W1}"
		nextSingleText $0,$1F   ; "I have no idea, but he's{N}obviously disturbed!{W1}"
		entityActions $1A,$FF
		 moveUp 1
		endActions
		entityActions $1A,$FF
		 moveRight 1
		endActions
		entityActions $1A,$FF
		 moveDown 1
		endActions
		entityActions $1A,$FF
		 moveLeft 2
		endActions
		csWait 30
		entityNod $1A
		setFacing $1A,RIGHT
		nextSingleText $0,$1A   ; "{LEADER}, Sir Astral!{N}I am angry!{W2}"
		nextSingleText $0,$1A   ; "I cannot forgive the{N}devils!{W2}"
		nextSingleText $0,$1A   ; "I have overridden my{N}restrictions on fighting.{W2}"
		nextSingleText $0,$1A   ; "I am joining your force as{N}a soldier!{W1}"
		join $1A
		clearF $4C              ; Zynk is a follower
		nextSingleText $0,$1A   ; "Let us go defeat the Devil{N}Army!{W1}"
		followEntity $7,$0,$2
		followEntity $1F,$7,$2
		followEntity $1A,$1F,$2
		csc_end
