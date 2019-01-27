
; ASM FILE data\maps\entries\map72\mapsetups\s6.asm :
; 0x4FF2E..0x50312 : 

; =============== S U B R O U T I N E =======================================

ms_map72_InitFunction:
		
		 
		chkFlg  $2CC            ; set after your raft-giving conversation with the mayor in Polca
		beq.s   return_4FF40
		chkFlg  $A              ; Luke joined
		bne.s   return_4FF40
		script  cs_4FF5A
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
		setActscriptWait $A,eas_Jump
		setActscriptWait $A,eas_Jump
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
		entityActionsWait $A
		 moveDown 1
		endActions
		hide $A
		setStoryFlag $10        ; Battle 16 unlocked
		csc_end
cs_4FFDA:       textCursor $D0D
		newEntity $B,63,63,UP,$B
		newEntity $80,63,63,LEFT,$B5
		newEntity $81,63,63,LEFT,$B2
		setActscriptWait $7,eas_Init
		setActscriptWait $1F,eas_Init
		setActscriptWait $1E,eas_Init
		stopEntity $80
		stopEntity $81
		setActscriptWait $80,eas_46172
		setActscriptWait $81,eas_46172
		setCamDest 21,33
		setDest $801E,27,39
		setDest $801F,28,37
		setDest $8007,25,37
		setDest $0,26,37
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
		setActscriptWait $B,eas_4536C
		csWait 3
		setFacing $B,UP
		nextText $0,$1F         ; "You know about devices like{N}this, right?{W2}"
		nextSingleText $0,$1F   ; "{LEADER} has a cannon and{N}some dynamite here.  Can you{N}remove those rocks?{W1}"
		nextSingleText $0,$B    ; "Ah...OK, let me try.{W1}"
		entityActionsWait $B
		 moveUp 1
		 moveLeft 2
		endActions
		setFacing $0,DOWN
		setFacing $7,DOWN
		setFacing $B,UP
		nod $0
		nextSingleText $FF,$FF  ; "{NAME;11} gets the dynamite{N}from {LEADER}.{W1}"
		entityActionsWait $B
		 moveRight 1
		 moveUp 1
		endActions
		setFacing $0,UP
		setFacing $7,UP
		setFacing $1F,UP
		nextSingleText $0,$B    ; "Stand back.  Ready?{W1}"
		setCamDest 21,32
		setActscriptWait $80,eas_BumpDown
		setPos $81,27,35,LEFT
		customActscriptWait $81
		 ac_setSpeed 80,80      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		entityActionsWait $81
		 moveUp 2
		endActions
		setQuake 3
		setSprite $81,$AB
		startEntity $81
		setActscript $81,eas_AnimSpeedx2
		playSound SFX_BATTLEFIELD_DEATH
		csWait 40
		setBlocks 0,0,1,2,27,33
		hide $81
		setQuake 0
		csWait 60
		entityActionsWait $1F
		 moveUp 1
		endActions
		nextSingleText $0,$1F   ; "Perfect!  We can now go to{N}North Parmecia.{W1}"
		csWait 40
		setActscriptWait $B,eas_Jump
		nextSingleText $0,$B    ; "Wow!  This cannon is great!{W1}"
		setFacing $7,RIGHT
		setFacing $0,RIGHT
		setFacing $1F,LEFT
		setActscript $7,eas_JumpLeft
		setActscript $0,eas_JumpLeft
		setActscriptWait $1F,eas_JumpRight
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
		setActscriptWait $80,eas_46172
		entityActions $80
		 moveDown 2
		endActions
		entityActionsWait $B
		 moveDown 1
		endActions
		entityActions $B
		 moveDown 1
		endActions
		csWait 3
		setActscript $B,eas_452BA
		csWait 3
		entityActions $80
		 moveDown 1
		endActions
		csWait 3
		setActscript $80,eas_452BA
		csWait 3
		hide $B
		hide $80
		entityActionsWait $1F
		 moveDown 1
		 moveLeft 2
		endActions
		nextSingleText $0,$1F   ; "{NAME;11} is hooked.{N}Ha, ha!{W1}"
		setFacing $1F,DOWN
		nextSingleText $0,$1F   ; "OK, {LEADER}.  Let's go{N}to North Parmecia!{W1}"
		setFacing $0,DOWN
		setFacing $7,DOWN
		setActscript $0,eas_Jump
		setActscriptWait $7,eas_Jump
		followEntity $1E,$0,$2
		followEntity $7,$1E,$1
		followEntity $1F,$1E,$3
		setStoryFlag $19        ; Battle 25 unlocked
		csc_end
cs_5023E:       textCursor $D1D
		setActscriptWait $7,eas_Init
		setActscriptWait $1F,eas_Init
		setActscriptWait $1E,eas_Init
		setCamDest 21,33
		setDest $801E,27,39
		setDest $801F,28,37
		setDest $8007,25,37
		setDest $0,26,37
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
		nod $0
		shiver $1F
		setFacing $7,RIGHT
		csWait 20
		nextSingleText $0,$1F   ; "What?!  You forgot to bring{N}the {ITEM} with you?{N}{LEADER}, are you serious?{W2}"
		stopEntity $0
		setSize $0,$16
		csWait 10
		setSize $0,$14
		csWait 10
		setSize $0,$12
		entityActionsWait $1F
		 moveLeft 1
		endActions
		setActscriptWait $1F,eas_Jump
		setActscriptWait $1F,eas_Jump
		nextSingleText $0,$1F   ; "You fool!  Go back and{N}bring it here!{W1}"
		setActscriptWait $0,eas_Init
		startEntity $0
		followEntity $1E,$0,$2
		followEntity $7,$1E,$1
		followEntity $1F,$1E,$3
		csc_end
