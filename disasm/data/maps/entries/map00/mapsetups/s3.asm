
; ASM FILE data\maps\entries\map00\mapsetups\s3.asm :
; 0x5E3A4..0x5E61E : 
ms_map0_ZoneEvents:
		dc.b $E
		dc.b $C
		dc.w sub_5E3B0-ms_map0_ZoneEvents
		dc.b $F
		dc.b $C
		dc.w sub_5E3B0-ms_map0_ZoneEvents
		dc.w $FD00
		dc.w return_5E3C0-ms_map0_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_5E3B0:
		trap    #CHECK_FLAG
		dc.w $321
		bne.s   return_5E3C0
		lea     cs_5E3C2(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $321               ; set after Zalbard taunts you in the scene outside the Mitula Shrine
return_5E3C0:
		rts

	; End of function sub_5E3B0

cs_5E3C2:       textCursor $AAB
		setActscript $7,$FF,eas_Init
		setActscript $1F,$FF,eas_Init
		nextSingleText $0,$80   ; "Welcome, Granseal force!{W1}"
		setActscript $1F,$0,eas_Jump
		setActscript $0,$0,eas_Jump
		setActscript $7,$FF,eas_Jump
		setFacing $7,DOWN
		nextSingleText $0,$7    ; "What?{W1}"
		csWait 5
		setActscript $7,$0,eas_461B6
		csWait 120
		setFacing $1F,UP
		nextSingleText $0,$1F   ; "I heard a voice from the{N}other side of the door.{W1}"
		setFacing $0,UP
		setEntityDest $801F,13,12
		setEntityDest $7,16,12
		setFacing $1F,UP
		setFacing $7,UP
		setCamDest 8,9
		nextSingleText $0,$80   ; "I'm Zalbard.  I'm one of{N}the greater devils.{W1}"
		setActscript $1F,$FF,eas_46172
		setActscript $0,$FF,eas_46172
		setActscript $7,$FF,eas_46172
		entityActions $1F,$0
		 moveDown 2
		endActions
		entityActions $0,$0
		 moveDown 1
		endActions
		entityActions $7,$FF
		 moveDown 2
		endActions
		nextSingleText $0,$80   ; "Do come in.  Of course, you{N}can go back now and abandon{N}Mitula!{W1}"
		setFacing $7,LEFT
		nextText $0,$7          ; "Sir Astral...{W2}"
		nextSingleText $0,$7    ; "The greater devil that{N}attacked Bedoe was as{N}strong as Volcanon.{W1}"
		nextText $0,$80         ; "Are you talking about{N}Sir Odd Eye?{W2}"
		nextSingleText $0,$80   ; "Did he fight against{N}Volcanon at Bedoe?{W1}"
		setFacing $7,UP
		nextSingleText $0,$1F   ; "Yes.  And he lost.{W1}"
		nextText $0,$80         ; "I can't believe it!{N}Odd Eye is the strongest{N}devil among us.{W2}"
		nextText $0,$80         ; "But, we haven't been able to{N}contact him lately.{W2}"
		nextText $0,$80         ; "This is good news for me.{N}If I get the Jewel of Evil, I{N}can take his place.{W2}"
		nextSingleText $0,$80   ; "Now, enter the shrine.{N}Mitula is here.{W1}"
		csWait 60
		nextSingleText $0,$7    ; "What should we do?{N}A greater devil awaits us{N}inside.{W1}"
		setFacing $7,LEFT
		setActscript $1F,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		customActscript $1F,$FF
		ac_setSpeed 2056        ;   
		ac_jump eas_Idle        ;   
		ac_end
		entityActions $1F,$FF
		 moveLeft 2
		endActions
		nextSingleText $0,$1F   ; "Odd Eye...Odd Eye...{N}Odd...Eye....{W1}"
		nextSingleText $0,$7    ; "Sir Astral?{W1}"
		entityActions $1F,$FF
		 moveRight 2
		endActions
		nextSingleText $0,$1F   ; "I think I've heard that{N}name before....{W1}"
		entityActions $7,$FF
		 moveDown 1
		 moveLeft 3
		endActions
		setFacing $0,DOWN
		setFacing $7,UP
		setCamDest 9,12
		setFacing $1F,DOWN
		setActscript $1F,$FF,eas_46172
		setActscript $7,$FF,eas_46172
		customActscript $7,$FF
		ac_setSpeed 2056        ;   
		ac_jump eas_Idle        ;   
		ac_end
		entityActions $1F,$0
		 moveDown 2
		endActions
		csWait 16
		entityActions $7,$0
		 moveDown 2
		endActions
		waitIdle $1F
		setActscript $7,$FF,eas_461AA
		nextSingleText $0,$7    ; "Sir Astral?{W1}"
		nextSingleText $0,$1F   ; "Hmmmm....{W1}"
		entityActions $1F,$0
		 moveDown 2
		endActions
		entityActions $7,$0
		 moveDown 2
		endActions
		waitIdle $1F
		setActscript $7,$FF,eas_461AA
		nextSingleText $0,$7    ; "Sir Astral!!!{W1}"
		customActscript $1F,$FF
		ac_setSpeed 12336       ;   
		ac_jump eas_Idle        ;   
		ac_end
		setActscript $1F,$FF,eas_Jump
		setActscript $1F,$FF,eas_46172
		entityActions $1F,$FF
		 moveUp 4
		endActions
		nextSingleText $0,$1F   ; "Whhhhhhat?{N}{NAME;7}, don't scare me!{W1}"
		entityShiver $1F
		customActscript $7,$FF
		ac_setSpeed 8224        ;   
		ac_jump eas_Idle        ;   
		ac_end
		setCamDest 9,11
		entityActions $7,$FF
		 moveUp 3
		endActions
		nextText $0,$7          ; "What's wrong with you?{W2}"
		nextSingleText $0,$7    ; "Should we go into the shrine{N}now?{W1}"
		nextSingleText $0,$1F   ; "Oh, sorry.{W1}"
		customActscript $1F,$FF
		ac_setSpeed 8224        ;   
		ac_jump eas_Idle        ;   
		ac_end
		setActscript $1F,$FF,eas_Init
		entityActions $1F,$FF
		 moveRight 1
		endActions
		setFacing $1F,UP
		nextText $0,$1F         ; "Zalbard...at least he's not{N}as strong as Odd Eye.{W2}"
		nextText $0,$1F         ; "But still, he's a greater{N}devil.{W2}"
		nextSingleText $0,$1F   ; "We had better complete our{N}preparations before we go in.{W1}"
		nextSingleText $0,$0    ; "OK.{W1}"
		entityNod $7
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		followEntity $1F,$0,$2
		followEntity $7,$1F,$2
		setBlocks 0,38,2,3,14,10
		setF $348               ; set after the door to the Mitula Shrine is opened
		csc_end
