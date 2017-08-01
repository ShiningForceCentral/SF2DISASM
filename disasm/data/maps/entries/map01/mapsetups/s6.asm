
; ASM FILE data\maps\entries\map01\mapsetups\s6.asm :
; 0x5E760..0x5E86C : 

; =============== S U B R O U T I N E =======================================

ms_map1_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $15
		beq.s   return_5E770
		move.w  #$88,d0 
		jsr     MoveEntityOutOfMap
return_5E770:
		rts

	; End of function ms_map1_InitFunction

cs_5E772:       textCursor $E41         ; Initial text line $E41 : "I feel...a power returning{N}me to human.{W2}"
		csWait $1E              ; WAIT 1E
		setEntityDir $0,$1      ; 0023 SET ENTITY FACING 0 1
		setEntityDest $0,$2C,$1B; 0029 SET ENTITY DEST 0 2C 1B
		setActscript $7,$FF,eas_Init; 0015 SET ACTSCRIPT 7 FF 460CE
		setActscript $1F,$FF,eas_Init; 0015 SET ACTSCRIPT 1F FF 460CE
		flashScreenWhite $1E    ; 0041 FLASH SCREEN WHITE 1E
		csWait $1E              ; WAIT 1E
		flashScreenWhite $1E    ; 0041 FLASH SCREEN WHITE 1E
		entityPosDir $88,$3F,$3E,$3; 0019 SET ENTITY POS AND FACING 88 3F 3E 3
		entityPosDir $15,$2C,$1A,$3; 0019 SET ENTITY POS AND FACING 15 2C 1A 3
		stopEntity $15          ; 001C STOP ENTITY ANIM 15
		csWait $1E              ; WAIT 1E
		flashScreenWhite $1E    ; 0041 FLASH SCREEN WHITE 1E
		csWait $1E              ; WAIT 1E
		setEntityDest $7,$2B,$1B; 0029 SET ENTITY DEST 7 2B 1B
		setEntityDest $1F,$2D,$1B; 0029 SET ENTITY DEST 1F 2D 1B
		setEntityDir $7,$1      ; 0023 SET ENTITY FACING 7 1
		setEntityDir $1F,$1     ; 0023 SET ENTITY FACING 1F 1
		nextSingleText $80,$15  ; "I feel...a power returning{N}me to human.{W2}"
		nextSingleText $80,$15  ; "Hey!  The evil is gone!{N}Did you chase them away?{W1}"
		startEntity $15         ; 001B START ENTITY ANIM 15
		moveEntity $7,$FF,$1,$1 ; 002D MOVE ENTITY 7 FF 1 1
		endMove $8080
		setEntityDir $7,$0      ; 0023 SET ENTITY FACING 7 0
		nextSingleText $0,$7    ; "{LEADER}, who is she?{W1}"
		setEntityDir $15,$2     ; 0023 SET ENTITY FACING 15 2
		nextSingleText $80,$15  ; "Did you say {LEADER}?{N}Oh, you're from Granseal!{W1}"
		nextSingleText $0,$7    ; "Yes, we are, but who are{N}you?{W1}"
		entityShiver $15        ; 002A MAKE ENTITY SHIVER 15
		nextSingleText $80,$15  ; "Do you know how long I've{N}been here as a stone statue?{W1}"
		moveEntity $0,$FF,$3,$1 ; 002D MOVE ENTITY 0 FF 3 1
		endMove $8080
		moveEntity $1F,$FF,$2,$1; 002D MOVE ENTITY 1F FF 2 1
		endMove $8080
		setEntityDir $1F,$1     ; 0023 SET ENTITY FACING 1F 1
		moveEntity $0,$FF,$0,$1 ; 002D MOVE ENTITY 0 FF 0 1
		endMove $8080
		moveEntity $0,$FF,$1,$1 ; 002D MOVE ENTITY 0 FF 1 1
		endMove $8080
		setEntityDir $0,$1      ; 0023 SET ENTITY FACING 0 1
		nextSingleText $0,$1F   ; "How do you know {LEADER}?{W1}"
		setEntityDir $15,$3     ; 0023 SET ENTITY FACING 15 3
		nextSingleText $80,$15  ; "Oh, I'm sorry.{W2}"
		nextSingleText $80,$15  ; "I'm {NAME;21}, a sorceress.{N}Goddess Mitula told me about{N}you.{W1}"
		nextSingleText $0,$1F   ; "She did?{W1}"
		nextSingleText $80,$15  ; "Yes.  She was worried about{N}you.{W2}"
		nextSingleText $80,$15  ; "You are fated to fight Zeon.{W2}"
		nextSingleText $80,$15  ; "But, she is unable to help{N}you.  It's an order from{N}Volcanon.{W2}"
		nextSingleText $80,$15  ; "But, I'm here for her.{N}I'm here to help you.{W1}"
		join $15                ; 0008 JOIN FORCE 15
		nextSingleText $80,$15  ; "You want to go to Grans,{N}right?  Then, I think we{N}can use the ancient ship.{W2}"
		nextSingleText $80,$15  ; "Let's go to Nazca.{W1}"
		followEntity $7,$0,$2   ; 002C FOLLOW ENTITY 7 0 2
		followEntity $1F,$7,$2  ; 002C FOLLOW ENTITY 1F 7 2
		csc56 $15               ; 0056 UNKNOWN, SOMETHING WITH AN ENTITY
		csc_end                 ; END OF CUTSCENE SCRIPT
