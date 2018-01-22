
; ASM FILE data\maps\entries\map45\mapsetups\s6.asm :
; 0x60098..0x603AE : 

; =============== S U B R O U T I N E =======================================

ms_map45_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $19
		beq.s   loc_600AA
		move.w  #$19,d0
		jsr     MoveEntityOutOfMap
		bra.s   return_600B0
loc_600AA:
		lea     cs_600B2(pc), a0
		trap    #6
return_600B0:
		rts

	; End of function ms_map45_InitFunction

cs_600B2:       setActscript $19,$FF,eas_45F9C
		entitySprite $19,$D9
		setActscript $19,$FF,eas_Init3
		setFacing $19,UP
		csc_end
cs_600CE:       textCursor $823
		setActscript $1F,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setActscript $1A,$FF,eas_Init
		nextSingleText $0,$19   ; "Who's there!{W1}"
		setCamDest 1,1
		nextSingleText $0,$19   ; "This is a sacred place!{W1}"
		setPos $1A,8,12,LEFT
		setPos $1F,6,11,UP
		setPos $0,6,13,UP
		setPos $7,6,14,UP
		setCamDest 1,9
		nextSingleText $80,$1F  ; "Oops!{W1}"
		moveEntity $1F,$FF,$3,$1
		endMove $8080
		nextSingleText $80,$1F  ; "She's too beautiful for you!{N}Back, back!{W1}"
		setActscript $0,$FF,eas_46172
		setActscript $7,$FF,eas_46172
		customActscript $0,$FF
		dc.w $10                ;   0010 SET SPEED X=$4 Y=$4
		dc.b 4
		dc.b 4
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $1F,$FF
		dc.w $10                ;   0010 SET SPEED X=$4 Y=$4
		dc.b 4
		dc.b 4
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $7,$FF
		dc.w $10                ;   0010 SET SPEED X=$4 Y=$4
		dc.b 4
		dc.b 4
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $1F,$0,$3,$3
		endMove $8080
		moveEntity $0,$0,$C,$14
		moreMove $3,$3
		endMove $8080
		moveEntity $7,$0,$C,$28
		moreMove $3,$3
		endMove $8080
		csWait 50
		entityShakeHead $0
		entityShakeHead $0
		csWait 10
		entityShakeHead $0
		entityShakeHead $0
		csWait 10
		entityShakeHead $0
		waitIdle $0
		nextText $0,$19         ; "Wait!{W1}"
		nextSingleText $0,$19   ; "Is that you...Sir Astral?{W1}"
		setFacing $1F,UP
		nextSingleText $80,$1F  ; "What?{W1}"
		setActscript $1F,$FF,eas_Init
		moveEntity $1F,$FF,$1,$4
		endMove $8080
		nextSingleText $80,$1F  ; "Who are you?{N}You know me?{W1}"
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		moveEntity $0,$0,$1,$4
		moreMove $0,$1
		moreMove $1,$1
		endMove $8080
		moveEntity $7,$0,$1,$4
		moreMove $2,$1
		moreMove $1,$1
		endMove $8080
		setCamDest 1,5
		nextSingleText $0,$19   ; "Oh...you don't remember me?{W1}"
		setFacing $1F,DOWN
		nextSingleText $80,$1F  ; "Well...ah...sorry.{W1}"
		nextSingleText $0,$19   ; "I'm {NAME;25}.  I was a pupil{N}of yours in Galam.  I was{N}preparing to become a priest.{W1}"
		entityShiver $1F
		setFacing $1F,UP
		nextSingleText $80,$1F  ; "{NAME;25}!  I can't believe it!{W1}"
		nextText $0,$19         ; "How is that scar on your{N}chest.{W2}"
		nextSingleText $0,$19   ; "Remember?  You snuck up{N}behind me and tapped my{N}shoulder....{W1}"
		moveEntity $1F,$FF,$1,$1
		endMove $8080
		nextText $80,$1F        ; "And you kicked me in the{N}chest...and it left a scar.{N}How could I forget.{W2}"
		nextSingleText $80,$1F  ; "Nobody but {NAME;25}{N}knew about that scar....{N}It still aches sometimes.{W1}"
		setActscript $1F,$FF,eas_Jump
		setActscript $1F,$FF,eas_Jump
		nextSingleText $0,$19   ; "I am sorry I kicked you.{W1}"
		entityShiver $1F
		nextSingleText $80,$1F  ; "That OK. How have...{W1}"
		moveEntity $7,$FF,$0,$1
		endMove $8080
		setFacing $7,UP
		setFacing $0,DOWN
		nextSingleText $0,$7    ; "Hey, aren't you going to{N}introduce us?{W1}"
		moveEntity $1F,$FF,$3,$1
		endMove $8080
		nextSingleText $80,$1F  ; "Of course.{W1}"
		setQuake 3
		csWait 40
		setQuake 0
		csWait 20
		setFacing $1F,UP
		setFacing $7,UP
		setFacing $0,UP
		nextText $80,$1F        ; "All in good time.{W2}"
		nextSingleText $80,$1F  ; "By the way, what are you{N}doing here?{W1}"
		entityShiver $19
		nextSingleText $0,$19   ; "I came to kill Red Baron.{N}He killed my fiance.{W1}"
		nextSingleText $80,$1F  ; "Oh....{N}I'm sorry...{W1}"
		nextSingleText $0,$19   ; "And why did you come back{N}to Grans?{W1}"
		nextSingleText $80,$1F  ; "To reseal Zeon.{W1}"
		nextSingleText $0,$19   ; "The King of the Devils?{W1}"
		entityNod $1F
		nextText $80,$1F        ; "Listen, {NAME;25}.{N}All the killings lately were{N}caused by him.{W2}"
		nextSingleText $80,$1F  ; "He'll destroy the entire{N}world.  He must be stopped!{W1}"
		entityShiver $19
		nextSingleText $0,$19   ; "Is Red Baron his follower?{W1}"
		nextSingleText $80,$1F  ; "Could be.{W1}"
		nextSingleText $0,$19   ; "Hmmm....{W1}"
		csWait 60
		nextSingleText $0,$19   ; "Ok!  I'll do it!{W1}"
		setPos $86,6,8,UP
		setCameraEntity $19
		nextSingleText $0,$19   ; "Close your eyes!{W1}"
		setActscript $19,$FF,eas_46172
		setFacing $19,LEFT
		moveEntity $19,$FF,$1,$2
		endMove $8080
		setFacing $19,DOWN
		startEntity $19
		setActscript $19,$0,eas_Transparent
		moveEntity $19,$FF,$3,$4
		endMove $8080
		hideEntity $86
		setActscript $19,$FF,eas_Init
		entitySprite $19,$19
		moveEntity $19,$FF,$3,$2
		endMove $8080
		setActscript $0,$0,eas_Jump
		setActscript $7,$0,eas_Jump
		setActscript $1F,$FF,eas_Jump
		setActscript $0,$0,eas_Jump
		setActscript $7,$0,eas_Jump
		setActscript $1F,$FF,eas_Jump
		startEntity $19
		csWait 30
		setActscript $19,$FF,eas_Init
		setCamDest 1,5
		nextSingleText $0,$19   ; "Sir Astral, please let me go{N}with you.{W1}"
		nextSingleText $80,$1F  ; "We welcome you, but can you{N}fight?{W1}"
		nextSingleText $0,$19   ; "I've made my body into a{N}weapon.{W1}"
		nextSingleText $80,$1F  ; "Where did you learn to do{N}this?  You're a priest.{W1}"
		nextSingleText $0,$19   ; "I was.  But now I'm a{N}master monk.{W1}"
		setActscript $1F,$FF,eas_Jump
		setActscript $1F,$FF,eas_Jump
		nextSingleText $80,$1F  ; "We could always use another{N}well-trained fighter!{W1}"
		join $19
		nextSingleText $0,$7    ; "We've got a strong ally!{W1}"
		setFacing $19,LEFT
		nextSingleText $0,$19   ; "Many Galam soldiers are in{N}the west.{N}We must be careful.{W1}"
		followEntity $7,$0,$2
		followEntity $1F,$7,$2
		followEntity $1A,$1F,$2
		followEntity $19,$0,$5
		csc_end
