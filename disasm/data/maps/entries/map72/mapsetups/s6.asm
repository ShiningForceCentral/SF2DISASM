
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

		csc36                   ; 0036 UNKNOWN, RELATED TO LOADING A MAP
		csc46 $0,$0             ; 0046 UNKNOWN
		playSound MUSIC_SAD_THEME_3; 0005 PLAY SOUND MUSIC_SAD_THEME_3
		fadeInB                 ; 0039 FADE IN FROM BLACK
		textCursor $F0          ; Initial text line $F0 : "That's it for today?{W2}{N}Yes, you had better take a{N}rest now.{N}Come back again.{W1}"
		nextSingleText $0,$0    ; "That's it for today?{W2}{N}Yes, you had better take a{N}rest now.{N}Come back again.{W1}"
		csc_end                 ; END OF CUTSCENE SCRIPT
cs_4FF5A:       textCursor $614         ; Initial text line $614 : "Now, let's go to Devil's Tail{N}to see Creed!{W1}"
		csc2B $A,$2B,$2F,$3,$FF ; 002B  A 2B 2F 3 FF
		csWait $1               ; WAIT 1
		entityPosDir $0,$2D,$2F,$2; 0019 SET ENTITY POS AND FACING 0 2D 2F 2
		entityPosDir $7,$2C,$2F,$3; 0019 SET ENTITY POS AND FACING 7 2C 2F 3
		entityPosDir $A,$2B,$2F,$3; 0019 SET ENTITY POS AND FACING A 2B 2F 3
		entityPosDir $1F,$2D,$30,$2; 0019 SET ENTITY POS AND FACING 1F 2D 30 2
		playSound MUSIC_MAIN_THEME; 0005 PLAY SOUND MUSIC_MAIN_THEME
		fadeInB                 ; 0039 FADE IN FROM BLACK
		csWait $28              ; WAIT 28
		nextSingleText $0,$A    ; "Now, let's go to Devil's Tail{N}to see Creed!{W1}"
		setActscript $A,$FF,eas_Jump; 0015 SET ACTSCRIPT A FF 45E44
		setActscript $A,$FF,eas_Jump; 0015 SET ACTSCRIPT A FF 45E44
		csWait $1E              ; WAIT 1E
		setEntityDir $7,$2      ; 0023 SET ENTITY FACING 7 2
		setEntityDir $A,$0      ; 0023 SET ENTITY FACING A 0
		nextSingleText $C0,$7   ; "It sounds like {NAME;10} is{N}going with us.{W1}"
		nextText $0,$A          ; "I am.  I want to fight with{N}{LEADER}.{W2}"
		nextSingleText $0,$A    ; "This might be exciting!{W1}"
		join $A                 ; 0008 JOIN FORCE A
		setEntityDir $7,$0      ; 0023 SET ENTITY FACING 7 0
		nextSingleText $C0,$7   ; "I didn't know you were such{N}an adventurer!{W1}"
		setEntityDir $7,$2      ; 0023 SET ENTITY FACING 7 2
		nextSingleText $0,$A    ; "Alright!{N}Wow!  Let's go!{W1}"
		csWait $1E              ; WAIT 1E
		moveEntity $A,$FF,$3,$1 ; 002D MOVE ENTITY A FF 3 1
		endMove $8080
		hideEntity $A           ; 002E HIDE ENTITY A
		setStoryFlag $10        ; Battle 16 unlocked
		csc_end                 ; END OF CUTSCENE SCRIPT
cs_4FFDA:       textCursor $D0D         ; Initial text line $D0D : "{NAME;11}, {NAME;11}!{W1}"
		csc2B $B,$3F,$3F,$1,$B  ; 002B  B 3F 3F 1 B
		csc2B $80,$3F,$3F,$2,$B5; 002B  80 3F 3F 2 B5
		csc2B $81,$3F,$3F,$2,$B2; 002B  81 3F 3F 2 B2
		setActscript $7,$FF,eas_Init; 0015 SET ACTSCRIPT 7 FF 460CE
		setActscript $1F,$FF,eas_Init; 0015 SET ACTSCRIPT 1F FF 460CE
		setActscript $1E,$FF,eas_Init; 0015 SET ACTSCRIPT 1E FF 460CE
		stopEntity $80          ; 001C STOP ENTITY ANIM 80
		stopEntity $81          ; 001C STOP ENTITY ANIM 81
		setActscript $80,$FF,eas_46172; 0015 SET ACTSCRIPT 80 FF 46172
		setActscript $81,$FF,eas_46172; 0015 SET ACTSCRIPT 81 FF 46172
		setCamDest $15,$21      ; 0032 SET CAMERA DEST 15 21
		setEntityDest $801E,$1B,$27; 0029 SET ENTITY DEST 801E 1B 27
		setEntityDest $801F,$1C,$25; 0029 SET ENTITY DEST 801F 1C 25
		setEntityDest $8007,$19,$25; 0029 SET ENTITY DEST 8007 19 25
		setEntityDest $0,$1A,$25; 0029 SET ENTITY DEST 0 1A 25
		csWait $3C              ; WAIT 3C
		entityPosDir $80,$1B,$24,$2; 0019 SET ENTITY POS AND FACING 80 1B 24 2
		setEntityDir $0,$1      ; 0023 SET ENTITY FACING 0 1
		setEntityDir $7,$1      ; 0023 SET ENTITY FACING 7 1
		setEntityDir $1F,$1     ; 0023 SET ENTITY FACING 1F 1
		csWait $32              ; WAIT 32
		setEntityDir $1F,$3     ; 0023 SET ENTITY FACING 1F 3
		nextSingleText $0,$1F   ; "{NAME;11}, {NAME;11}!{W1}"
		nextSingleText $0,$B    ; "Yes?{W1}"
		entityPosDir $B,$1B,$27,$0; 0019 SET ENTITY POS AND FACING B 1B 27 0
		setActscript $B,$FF,eas_4536C; 0015 SET ACTSCRIPT B FF 4536C
		csWait $3               ; WAIT 3
		setEntityDir $B,$1      ; 0023 SET ENTITY FACING B 1
		nextText $0,$1F         ; "You know about devices like{N}this, right?{W2}"
		nextSingleText $0,$1F   ; "{LEADER} has a cannon and{N}some dynamite here.  Can you{N}remove those rocks?{W1}"
		nextSingleText $0,$B    ; "Ah...OK, let me try.{W1}"
		moveEntity $B,$FF,$1,$1 ; 002D MOVE ENTITY B FF 1 1
		moreMove $2,$2
		endMove $8080
		setEntityDir $0,$3      ; 0023 SET ENTITY FACING 0 3
		setEntityDir $7,$3      ; 0023 SET ENTITY FACING 7 3
		setEntityDir $B,$1      ; 0023 SET ENTITY FACING B 1
		entityNod $0            ; 0026 MAKE ENTITY NOD 0
		nextSingleText $FF,$FF  ; "{NAME;11} gets the dynamite{N}from {LEADER}.{W1}"
		moveEntity $B,$FF,$0,$1 ; 002D MOVE ENTITY B FF 0 1
		moreMove $1,$1
		endMove $8080
		setEntityDir $0,$1      ; 0023 SET ENTITY FACING 0 1
		setEntityDir $7,$1      ; 0023 SET ENTITY FACING 7 1
		setEntityDir $1F,$1     ; 0023 SET ENTITY FACING 1F 1
		nextSingleText $0,$B    ; "Stand back.  Ready?{W1}"
		setCamDest $15,$20      ; 0032 SET CAMERA DEST 15 20
		setActscript $80,$FF,eas_BumpDown
						; 0015 SET ACTSCRIPT 80 FF 45F34
		entityPosDir $81,$1B,$23,$2; 0019 SET ENTITY POS AND FACING 81 1B 23 2
		customActscript $81,$FF ; 0014 SET MANUAL ACTSCRIPT 81
		dc.w $10                ;   0010 SET SPEED X=$50 Y=$50
		dc.b $50
		dc.b $50
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $81,$FF,$1,$2; 002D MOVE ENTITY 81 FF 1 2
		endMove $8080
		setQuakeAmount $3       ; 0033 SET QUAKE AMOUNT 3
		entitySprite $81,$AB    ; 001A SET ENTITY SPRITE 81 AB
		startEntity $81         ; 001B START ENTITY ANIM 81
		setActscript $81,$0,eas_AnimSpeedx2
						; 0015 SET ACTSCRIPT 81 0 45FB2
		playSound SFX_BATTLEFIELD_DEATH; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
		csWait $28              ; WAIT 28
		setBlocks $0,$102,$1B21 ; 0034 SET BLOCKS 0 102 1B21
		hideEntity $81          ; 002E HIDE ENTITY 81
		setQuakeAmount $0       ; 0033 SET QUAKE AMOUNT 0
		csWait $3C              ; WAIT 3C
		moveEntity $1F,$FF,$1,$1; 002D MOVE ENTITY 1F FF 1 1
		endMove $8080
		nextSingleText $0,$1F   ; "Perfect!  We can now go to{N}North Parmecia.{W1}"
		csWait $28              ; WAIT 28
		setActscript $B,$FF,eas_Jump; 0015 SET ACTSCRIPT B FF 45E44
		nextSingleText $0,$B    ; "Wow!  This cannon is great!{W1}"
		setEntityDir $7,$0      ; 0023 SET ENTITY FACING 7 0
		setEntityDir $0,$0      ; 0023 SET ENTITY FACING 0 0
		setEntityDir $1F,$2     ; 0023 SET ENTITY FACING 1F 2
		setActscript $7,$0,eas_JumpLeft; 0015 SET ACTSCRIPT 7 0 45E6C
		setActscript $0,$0,eas_JumpLeft; 0015 SET ACTSCRIPT 0 0 45E6C
		setActscript $1F,$FF,eas_JumpRight
						; 0015 SET ACTSCRIPT 1F FF 45E94
		entityPosDir $B,$1A,$24,$0; 0019 SET ENTITY POS AND FACING B 1A 24 0
		csWait $19              ; WAIT 19
		entityPosDir $B,$1B,$25,$1; 0019 SET ENTITY POS AND FACING B 1B 25 1
		csWait $19              ; WAIT 19
		entityPosDir $B,$1C,$24,$2; 0019 SET ENTITY POS AND FACING B 1C 24 2
		csWait $19              ; WAIT 19
		entityPosDir $B,$1B,$25,$1; 0019 SET ENTITY POS AND FACING B 1B 25 1
		csWait $19              ; WAIT 19
		entityPosDir $B,$1A,$24,$0; 0019 SET ENTITY POS AND FACING B 1A 24 0
		csWait $19              ; WAIT 19
		entityPosDir $B,$1B,$25,$1; 0019 SET ENTITY POS AND FACING B 1B 25 1
		csWait $19              ; WAIT 19
		nextSingleText $0,$B    ; "I can attend the battles{N}with this weapon.{W1}"
		setEntityDir $B,$2      ; 0023 SET ENTITY FACING B 2
		nextText $0,$B          ; "{LEADER}, do you need{N}this any more?{W2}"
		nextText $0,$B          ; "May I use it?  Huh?{W2}"
		nextSingleText $0,$B    ; "Wow, now I can fight along{N}side you!{W1}"
		join $B                 ; 0008 JOIN FORCE B
		nextSingleText $0,$B    ; "Please call me when you{N}need my help.{W1}"
		setActscript $80,$FF,eas_46172; 0015 SET ACTSCRIPT 80 FF 46172
		moveEntity $80,$0,$3,$2 ; 002D MOVE ENTITY 80 0 3 2
		endMove $8080
		moveEntity $B,$FF,$3,$1 ; 002D MOVE ENTITY B FF 3 1
		endMove $8080
		moveEntity $B,$0,$3,$1  ; 002D MOVE ENTITY B 0 3 1
		endMove $8080
		csWait $3               ; WAIT 3
		setActscript $B,$0,eas_452BA; 0015 SET ACTSCRIPT B 0 452BA
		csWait $3               ; WAIT 3
		moveEntity $80,$0,$3,$1 ; 002D MOVE ENTITY 80 0 3 1
		endMove $8080
		csWait $3               ; WAIT 3
		setActscript $80,$0,eas_452BA; 0015 SET ACTSCRIPT 80 0 452BA
		csWait $3               ; WAIT 3
		hideEntity $B           ; 002E HIDE ENTITY B
		hideEntity $80          ; 002E HIDE ENTITY 80
		moveEntity $1F,$FF,$3,$1; 002D MOVE ENTITY 1F FF 3 1
		moreMove $2,$2
		endMove $8080
		nextSingleText $0,$1F   ; "{NAME;11} is hooked.{N}Ha, ha!{W1}"
		setEntityDir $1F,$3     ; 0023 SET ENTITY FACING 1F 3
		nextSingleText $0,$1F   ; "OK, {LEADER}.  Let's go{N}to North Parmecia!{W1}"
		setEntityDir $0,$3      ; 0023 SET ENTITY FACING 0 3
		setEntityDir $7,$3      ; 0023 SET ENTITY FACING 7 3
		setActscript $0,$0,eas_Jump; 0015 SET ACTSCRIPT 0 0 45E44
		setActscript $7,$FF,eas_Jump; 0015 SET ACTSCRIPT 7 FF 45E44
		followEntity $1E,$0,$2  ; 002C FOLLOW ENTITY 1E 0 2
		followEntity $7,$1E,$1  ; 002C FOLLOW ENTITY 7 1E 1
		followEntity $1F,$1E,$3 ; 002C FOLLOW ENTITY 1F 1E 3
		setStoryFlag $19        ; Battle 25 unlocked
		csc_end                 ; END OF CUTSCENE SCRIPT
cs_5023E:       textCursor $D1D         ; Initial text line $D1D : "What?!  You forgot to bring{N}the {ITEM} with you?{N}{LEADER}, are you serious?{W2}"
		setActscript $7,$FF,eas_Init; 0015 SET ACTSCRIPT 7 FF 460CE
		setActscript $1F,$FF,eas_Init; 0015 SET ACTSCRIPT 1F FF 460CE
		setActscript $1E,$FF,eas_Init; 0015 SET ACTSCRIPT 1E FF 460CE
		setCamDest $15,$21      ; 0032 SET CAMERA DEST 15 21
		setEntityDest $801E,$1B,$27; 0029 SET ENTITY DEST 801E 1B 27
		setEntityDest $801F,$1C,$25; 0029 SET ENTITY DEST 801F 1C 25
		setEntityDest $8007,$19,$25; 0029 SET ENTITY DEST 8007 19 25
		setEntityDest $0,$1A,$25; 0029 SET ENTITY DEST 0 1A 25
		waitIdle $1E            ; 0016 WAIT UNTIL IDLE ENTITY 1E
		waitIdle $1F            ; 0016 WAIT UNTIL IDLE ENTITY 1F
		waitIdle $7             ; 0016 WAIT UNTIL IDLE ENTITY 7
		setEntityDir $0,$1      ; 0023 SET ENTITY FACING 0 1
		setEntityDir $7,$1      ; 0023 SET ENTITY FACING 7 1
		setEntityDir $1F,$1     ; 0023 SET ENTITY FACING 1F 1
		csWait $32              ; WAIT 32
		setEntityDir $0,$0      ; 0023 SET ENTITY FACING 0 0
		csWait $1E              ; WAIT 1E
		setEntityDir $1F,$2     ; 0023 SET ENTITY FACING 1F 2
		entityNod $0            ; 0026 MAKE ENTITY NOD 0
		entityShiver $1F        ; 002A MAKE ENTITY SHIVER 1F
		setEntityDir $7,$0      ; 0023 SET ENTITY FACING 7 0
		csWait $14              ; WAIT 14
		nextSingleText $0,$1F   ; "What?!  You forgot to bring{N}the {ITEM} with you?{N}{LEADER}, are you serious?{W2}"
		stopEntity $0           ; 001C STOP ENTITY ANIM 0
		setEntitySize $0,$16    ; 0050 SET ENTITY SIZE 0 16 
		csWait $A               ; WAIT A
		setEntitySize $0,$14    ; 0050 SET ENTITY SIZE 0 14 
		csWait $A               ; WAIT A
		setEntitySize $0,$12    ; 0050 SET ENTITY SIZE 0 12 
		moveEntity $1F,$FF,$2,$1; 002D MOVE ENTITY 1F FF 2 1
		endMove $8080
		setActscript $1F,$FF,eas_Jump; 0015 SET ACTSCRIPT 1F FF 45E44
		setActscript $1F,$FF,eas_Jump; 0015 SET ACTSCRIPT 1F FF 45E44
		nextSingleText $0,$1F   ; "You fool!  Go back and{N}bring it here!{W1}"
		setActscript $0,$FF,eas_Init; 0015 SET ACTSCRIPT 0 FF 460CE
		startEntity $0          ; 001B START ENTITY ANIM 0
		followEntity $1E,$0,$2  ; 002C FOLLOW ENTITY 1E 0 2
		followEntity $7,$1E,$1  ; 002C FOLLOW ENTITY 7 1E 1
		followEntity $1F,$1E,$3 ; 002C FOLLOW ENTITY 1F 1E 3
		csc_end                 ; END OF CUTSCENE SCRIPT
