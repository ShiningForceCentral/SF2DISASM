
; ASM FILE data\maps\entries\map22\mapsetups\s6.asm :
; 0x5962E..0x59AC0 : 

; =============== S U B R O U T I N E =======================================

ms_map22_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $308
		bne.s   loc_5963E
		lea     cs_59656(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $308               ; set after the scene where Goliath places you on the Desktop
loc_5963E:
		trap    #CHECK_FLAG
		dc.w $20A
		beq.s   return_59654
		trap    #CHECK_FLAG
		dc.w $30A
		bne.s   return_59654
		lea     cs_5996E(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $30A               ; set after the scene that plays after you win the chess battle
return_59654:
		rts

	; End of function ms_map22_InitFunction

cs_59656:       textCursor $6D4
		reloadMap 0,19
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setActscript $1F,$FF,eas_Init
		stopEntity $0
		stopEntity $7
		stopEntity $1F
		customActscript $0,$FF
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $7,$FF
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $1F,$FF
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setPos $0,4,8,DOWN
		setPos $7,3,7,DOWN
		setPos $1F,5,7,DOWN
		setPos $99,12,16,DOWN
		setPos $9A,11,15,DOWN
		setPos $9B,13,15,DOWN
		removeShadow $0
		removeShadow $7
		removeShadow $1F
		fadeInB
		moveEntity $0,$0,$3,$10
		endMove $8080
		moveEntity $7,$0,$3,$10
		endMove $8080
		moveEntity $1F,$0,$3,$10
		endMove $8080
		moveEntity $99,$0,$6,$8
		endMove $8080
		moveEntity $9A,$0,$6,$8
		endMove $8080
		moveEntity $9B,$FF,$6,$8
		endMove $8080
		hideEntity $99
		hideEntity $9A
		hideEntity $9B
		customActscript $0,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $7,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $3
		dc.w 3
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $1F,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $3
		dc.w 3
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		csWait 100
		startEntity $0
		startEntity $7
		startEntity $1F
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setActscript $1F,$FF,eas_Init
		entityShakeHead $0
		entityShakeHead $7
		entityShakeHead $1F
		setFacing $0,UP
		setFacing $7,RIGHT
		setFacing $1F,LEFT
		csWait 20
		nextText $C0,$1F        ; "What happened?{W2}"
		nextText $C0,$1F        ; "A strange feeling swept over{N}me when I entered that door.{W2}"
		nextSingleText $C0,$1F  ; "Then, it felt like...I was{N}lifted upward!{W1}"
		nextText $0,$7          ; "It's very difficult to explain{N}what's happened to us....{W2}"
		nextSingleText $0,$7    ; "Anyway, we're very small now.{W1}"
		customActscript $1F,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $1F,$FF,$2,$1
		endMove $8080
		nextSingleText $C0,$1F  ; "Small?  How small?{W1}"
		csWait 5
		setActscript $7,$0,eas_461B6
		csWait 100
		moveEntity $7,$FF,$3,$2
		moreMove $0,$1
		endMove $8080
		csWait 5
		setActscript $7,$0,eas_461B6
		csWait 130
		setFacing $7,UP
		setFacing $0,DOWN
		setFacing $1F,DOWN
		nextSingleText $0,$7    ; "Let's see...now we're on a{N}desk...and it's very large,{N}like a village.{W1}"
		nextSingleText $0,$80   ; "Exactly.{W1}"
		moveEntity $0,$0,$2,$1
		endMove $8080
		moveEntity $7,$FF,$0,$1
		endMove $8080
		csWait 5
		setActscript $0,$0,eas_461B6
		csWait 10
		csWait 5
		setActscript $7,$0,eas_461B6
		csWait 5
		setActscript $1F,$0,eas_461B6
		csWait 130
		setFacing $7,DOWN
		setFacing $0,DOWN
		setFacing $1F,DOWN
		setActscript $0,$FF,eas_Jump
		setActscript $7,$0,eas_Jump
		entityShiver $0
		entityShiver $7
		setActscript $0,$FF,eas_46172
		setActscript $7,$FF,eas_46172
		moveEntity $0,$0,$1,$1
		endMove $8080
		moveEntity $7,$FF,$1,$1
		endMove $8080
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		nextText $0,$7          ; "Goliath!{W2}"
		setActscript $7,$FF,eas_Jump
		setActscript $7,$FF,eas_Jump
		csWait 10
		nextSingleText $0,$7    ; "Hey, what did you do to us?{W1}"
		nextText $0,$80         ; "I told you not to go in{N}there.  You didn't listen{N}to my warning.{W2}"
		nextSingleText $0,$80   ; "You guys look so cute!{N}Ha, ha!{N}Bye, little kiddies!{W1}"
		csWait 20
		playSound SFX_DIALOG_BLEEP_6
		csWait 20
		playSound SFX_DIALOG_BLEEP_6
		csWait 20
		playSound SFX_DIALOG_BLEEP_6
		csWait 20
		playSound SFX_DIALOG_BLEEP_6
		csWait 20
		playSound SFX_DIALOG_BLEEP_6
		setFacing $0,RIGHT
		setFacing $7,RIGHT
		setFacing $1F,RIGHT
		csWait 20
		playSound SFX_DIALOG_BLEEP_8
		csWait 20
		playSound SFX_DIALOG_BLEEP_8
		csWait 20
		playSound SFX_DIALOG_BLEEP_8
		csWait 20
		playSound SFX_DIALOG_BLEEP_8
		csWait 20
		playSound SFX_DIALOG_BLEEP_8
		csWait 50
		moveEntity $7,$FF,$2,$2
		endMove $8080
		setFacing $0,DOWN
		setFacing $7,UP
		setFacing $1F,DOWN
		nextText $0,$7          ; "{LEADER}, cheer up!{W2}"
		nextSingleText $0,$7    ; "Let's look around this{N}Desktop Kingdom.{W1}"
		setFacing $0,RIGHT
		setFacing $1F,LEFT
		nextSingleText $0,$1F   ; "I agree!  We can meet Creed{N}later.{W1}"
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setActscript $1F,$FF,eas_Init
		followEntity $7,$0,$2
		followEntity $1F,$7,$2
		csc_end
cs_5994E:       textCursor $700
		csWait 50
		setCamDest 10,0
		nextText $0,$86         ; "Are you ready?{W2}"
		nextSingleText $0,$86   ; "Now, start the battle!{N}Do your best!{W1}"
		setStoryFlag $16        ; Battle 22 unlocked
		mapSysEvent $16,$0,$0,$0
		csc_end
cs_5996E:       textCursor $702
		setCameraEntity $FFFF
		reloadMap 10,0
		setPos $0,25,12,UP
		setPos $7,24,13,UP
		setPos $1F,25,13,UP
		fadeInB
		nextSingleText $0,$86   ; "Checkmate!{N}This is for you.{W1}"
		setCamDest 20,7
		nextText $0,$86         ; "A Cotton Balloon is inside.{W2}"
		nextSingleText $0,$86   ; "With it you can leave{N}Desktop Kingdom safely.{N}Good luck!{W1}"
		csc_end
cs_599A4:       moveEntity $88,$FF,$1,$1
		endMove $8080
		setFacing $88,DOWN
		csc_end
cs_599B2:       setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setActscript $1F,$FF,eas_Init
		setEntityDest $0,35,24
		setEntityDest $7,34,24
		setEntityDest $1F,33,24
		moveEntity $0,$0,$E,$1
		moreMove $B,$1
		moreMove $3,$2
		endMove $8080
		moveEntity $7,$0,$0,$1
		moreMove $E,$1
		moreMove $7,$1
		moreMove $B,$1
		endMove $8080
		moveEntity $1F,$FF,$0,$1
		moreMove $E,$1
		moreMove $B,$1
		moreMove $3,$1
		endMove $8080
		setPos $89,36,25,UP
		setPos $8A,37,24,UP
		setPos $8B,35,24,UP
		stopEntity $0
		stopEntity $7
		stopEntity $1F
		customActscript $0,$FF
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $7,$FF
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $1F,$FF
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $89,$FF
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $8A,$FF
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $8B,$FF
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $0,$0,$3,$6
		endMove $8080
		moveEntity $7,$0,$3,$6
		endMove $8080
		moveEntity $1F,$0,$3,$6
		endMove $8080
		moveEntity $89,$0,$3,$6
		endMove $8080
		moveEntity $8A,$0,$3,$6
		endMove $8080
		moveEntity $8B,$FF,$3,$6
		endMove $8080
		mapSysEvent $1A,$1A,$8,$3
		csc_end
