
; ASM FILE data\maps\entries\map36\mapsetups\s6.asm :
; 0x5DA16..0x5DAE4 : 

; =============== S U B R O U T I N E =======================================

ms_map36_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $16
		beq.s   return_5DA26
		move.w  #$16,d0
		jsr     MoveEntityOutOfMap
return_5DA26:
		rts

	; End of function ms_map36_InitFunction

cs_5DA28:       textCursor $CFB
		faceEntity $7,$83
		faceEntity $1F,$83
		nextText $0,$16         ; "You defeated Zalbard and{N}saved Mitula.{W2}"
		nextText $0,$16         ; "You are trustworthy{N}soldiers, so...would you{N}do me a favor?{W2}"
		nextSingleText $0,$16   ; "Please go to Moun with me.{W1}"
		nextSingleText $0,$1F   ; "What are you going to do{N}there?{W1}"
		nextText $0,$16         ; "I believe there are{N}survivors in Moun.{W2}"
		nextSingleText $0,$16   ; "I would like to save them.{W1}"
		nextText $0,$7          ; "We have to go through Moun{N}to get to Nazka, right?{W2}"
		nextSingleText $0,$7    ; "{LEADER}, let's go{N}together.{W1}"
		nextSingleText $0,$16   ; "Alright.{W1}"
		nextSingleText $FF,$FF  ; "{LEADER} decides to take{N}{NAME;22} with him.{W1}"
		nextSingleText $0,$16   ; "Thank you very much.{W1}"
		followEntity $16,$1F,$2
		setStoryFlag $1F        ; Battle 31 unlocked
		setStoryFlag $21        ; Battle 33 unlocked
		setStoryFlag $22        ; Battle 34 unlocked
		csc_end
cs_5DA7A:       setCameraEntity $83
		setEntityDest $0,4,23
		setFacing $0,1
		moveEntity $83,$FF,$0,$2
		endMove $8080
		moveEntity $83,$FF,$3,$1
		endMove $8080
		setFacing $0,0
		csWait 60
		customActscript $83,$FF
		dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
		dc.b $10
		dc.b $10
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $83,$FF,$0,$2
		endMove $8080
		entityShakeHead $83
		entityShiver $83
		csWait 120
		entityShiver $83
		customActscript $83,$FF
		dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
		dc.b 8
		dc.b 8
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $83,$FF,$0,$1
		endMove $8080
		entityShiver $83
		csc_end
