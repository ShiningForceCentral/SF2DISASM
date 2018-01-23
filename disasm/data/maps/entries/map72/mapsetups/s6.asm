
; ASM FILE data\maps\entries\map72\mapsetups\s6.asm :
; 0x4FF2E..0x50312 : 

; =============== S U B R O U T I N E =======================================

ms_map72_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $2CC               ; set after your raft-giving conversation with the mayor in Polca
		beq.s   return_4FF40
		trap    #CHECK_FLAG
		dc.w $A                 ; Luke joined
		bne.s   return_4FF40
		lea     cs_4FF5A(pc), a0
		trap    #6
return_4FF40:
		rts

	; End of function ms_map72_InitFunction

		resetMap
		reloadMap 0,0
		playSound MUSIC_SAD_THEME_3
		fadeInB
		textCursor $F0
		nextSingleText $0,$0    ; "That's it for today?{W2}{N}Yes, you had better take a{N}rest now.{N}Come back again.{W1}"
		csc_end
cs_4FF5A:       textCursor $614
		newEntity $A,43,47,DOWN,$FF
		csWait 1
		setPos $0,45,47,LEFT
		setPos $7,44,47,DOWN
		setPos $A,43,47,DOWN
		setPos $1F,45,48,LEFT
		playSound MUSIC_MAIN_THEME
		fadeInB
		csWait 40
		nextSingleText $0,$A    ; "Now, let's go to Devil's Tail{N}to see Creed!{W1}"
		setActscript $A,$FF,eas_Jump
		setActscript $A,$FF,eas_Jump
		csWait 30
		setFacing $7,LEFT
		setFacing $A,RIGHT
		nextSingleText $C0,$7   ; "It sounds like {NAME;10} is{N}going with us.{W1}"
		nextText $0,$A          ; "I am.  I want to fight with{N}{LEADER}.{W2}"
		nextSingleText $0,$A    ; "This might be exciting!{W1}"
		join $A
		setFacing $7,RIGHT
		nextSingleText $C0,$7   ; "I didn't know you were such{N}an adventurer!{W1}"
		setFacing $7,LEFT
		nextSingleText $0,$A    ; "Alright!{N}Wow!  Let's go!{W1}"
		csWait 30
		moveEntity $A,$FF,$3,$1
		endMove $8080
		hideEntity $A
		setStoryFlag $10        ; Battle 16 unlocked
		csc_end
cs_4FFDA:       textCursor $D0D
		newEntity $B,63,63,UP,$B
		newEntity $80,63,63,LEFT,$B5
		newEntity $81,63,63,LEFT,$B2
		setActscript $7,$FF,eas_Init
		setActscript $1F,$FF,eas_Init
		setActscript $1E,$FF,eas_Init
		stopEntity $80
		stopEntity $81
		setActscript $80,$FF,eas_46172
		setActscript $81,$FF,eas_46172
		setCamDest 21,33
		setEntityDest $801E,27,39
		setEntityDest $801F,28,37
		setEntityDest $8007,25,37
		setEntityDest $0,26,37
		csWait 60
		setPos $80,27,36,LEFT
		setFacing $0,UP
		setFacing $7,UP
		setFacing $1F,UP
		csWait 50
		setFacing $1F,DOWN
		nextSingleText $0,$1F   ; "{NAME;11}, {NAME;11}!{W1}"
		nextSingleText $0,$B    ; "Yes?{W1}"
		setPos $B,27,39,RIGHT
		setActscript $B,$FF,eas_4536C
		csWait 3
		setFacing $B,UP
		nextText $0,$1F         ; "You know about devices like{N}this, right?{W2}"
		nextSingleText $0,$1F   ; "{LEADER} has a cannon and{N}some dynamite here.  Can you{N}remove those rocks?{W1}"
		nextSingleText $0,$B    ; "Ah...OK, let me try.{W1}"
		moveEntity $B,$FF,$1,$1
		moreMove $2,$2
		endMove $8080
		setFacing $0,DOWN
		setFacing $7,DOWN
		setFacing $B,UP
		entityNod $0
		nextSingleText $FF,$FF  ; "{NAME;11} gets the dynamite{N}from {LEADER}.{W1}"
		moveEntity $B,$FF,$0,$1
		moreMove $1,$1
		endMove $8080
		setFacing $0,UP
		setFacing $7,UP
		setFacing $1F,UP
		nextSingleText $0,$B    ; "Stand back.  Ready?{W1}"
		setCamDest 21,32
		setActscript $80,$FF,eas_BumpDown
		setPos $81,27,35,LEFT
		customActscript $81,$FF
		ac_setSpeed 20560       ;   
		ac_jump eas_Idle        ;   
		ac_end
		moveEntity $81,$FF,$1,$2
		endMove $8080
		setQuake 3
		entitySprite $81,$AB
		startEntity $81
		setActscript $81,$0,eas_AnimSpeedx2
		playSound SFX_BATTLEFIELD_DEATH
		csWait 40
		setBlocks 0,0,1,2,27,33
		hideEntity $81
		setQuake 0
		csWait 60
		moveEntity $1F,$FF,$1,$1
		endMove $8080
		nextSingleText $0,$1F   ; "Perfect!  We can now go to{N}North Parmecia.{W1}"
		csWait 40
		setActscript $B,$FF,eas_Jump
		nextSingleText $0,$B    ; "Wow!  This cannon is great!{W1}"
		setFacing $7,RIGHT
		setFacing $0,RIGHT
		setFacing $1F,LEFT
		setActscript $7,$0,eas_JumpLeft
		setActscript $0,$0,eas_JumpLeft
		setActscript $1F,$FF,eas_JumpRight
		setPos $B,26,36,RIGHT
		csWait 25
		setPos $B,27,37,UP
		csWait 25
		setPos $B,28,36,LEFT
		csWait 25
		setPos $B,27,37,UP
		csWait 25
		setPos $B,26,36,RIGHT
		csWait 25
		setPos $B,27,37,UP
		csWait 25
		nextSingleText $0,$B    ; "I can attend the battles{N}with this weapon.{W1}"
		setFacing $B,LEFT
		nextText $0,$B          ; "{LEADER}, do you need{N}this any more?{W2}"
		nextText $0,$B          ; "May I use it?  Huh?{W2}"
		nextSingleText $0,$B    ; "Wow, now I can fight along{N}side you!{W1}"
		join $B
		nextSingleText $0,$B    ; "Please call me when you{N}need my help.{W1}"
		setActscript $80,$FF,eas_46172
		moveEntity $80,$0,$3,$2
		endMove $8080
		moveEntity $B,$FF,$3,$1
		endMove $8080
		moveEntity $B,$0,$3,$1
		endMove $8080
		csWait 3
		setActscript $B,$0,eas_452BA
		csWait 3
		moveEntity $80,$0,$3,$1
		endMove $8080
		csWait 3
		setActscript $80,$0,eas_452BA
		csWait 3
		hideEntity $B
		hideEntity $80
		moveEntity $1F,$FF,$3,$1
		moreMove $2,$2
		endMove $8080
		nextSingleText $0,$1F   ; "{NAME;11} is hooked.{N}Ha, ha!{W1}"
		setFacing $1F,DOWN
		nextSingleText $0,$1F   ; "OK, {LEADER}.  Let's go{N}to North Parmecia!{W1}"
		setFacing $0,DOWN
		setFacing $7,DOWN
		setActscript $0,$0,eas_Jump
		setActscript $7,$FF,eas_Jump
		followEntity $1E,$0,$2
		followEntity $7,$1E,$1
		followEntity $1F,$1E,$3
		setStoryFlag $19        ; Battle 25 unlocked
		csc_end
cs_5023E:       textCursor $D1D
		setActscript $7,$FF,eas_Init
		setActscript $1F,$FF,eas_Init
		setActscript $1E,$FF,eas_Init
		setCamDest 21,33
		setEntityDest $801E,27,39
		setEntityDest $801F,28,37
		setEntityDest $8007,25,37
		setEntityDest $0,26,37
		waitIdle $1E
		waitIdle $1F
		waitIdle $7
		setFacing $0,UP
		setFacing $7,UP
		setFacing $1F,UP
		csWait 50
		setFacing $0,RIGHT
		csWait 30
		setFacing $1F,LEFT
		entityNod $0
		entityShiver $1F
		setFacing $7,RIGHT
		csWait 20
		nextSingleText $0,$1F   ; "What?!  You forgot to bring{N}the {ITEM} with you?{N}{LEADER}, are you serious?{W2}"
		stopEntity $0
		setSize $0,$16
		csWait 10
		setSize $0,$14
		csWait 10
		setSize $0,$12
		moveEntity $1F,$FF,$2,$1
		endMove $8080
		setActscript $1F,$FF,eas_Jump
		setActscript $1F,$FF,eas_Jump
		nextSingleText $0,$1F   ; "You fool!  Go back and{N}bring it here!{W1}"
		setActscript $0,$FF,eas_Init
		startEntity $0
		followEntity $1E,$0,$2
		followEntity $7,$1E,$1
		followEntity $1F,$1E,$3
		csc_end
