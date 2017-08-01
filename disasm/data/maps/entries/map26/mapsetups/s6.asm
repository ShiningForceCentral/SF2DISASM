
; ASM FILE data\maps\entries\map26\mapsetups\s6.asm :
; 0x59DDC..0x59F42 : 

; =============== S U B R O U T I N E =======================================

ms_map26_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $30B
		bne.s   loc_59DF2
		lea     cs_59E04(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $30B               ; set after the Cotton Balloon pops and you land in Floor World
		move.b  #$1A,((EGRESS_MAP_INDEX-$1000000)).w
loc_59DF2:
		trap    #CHECK_FLAG
		dc.w $30C
		beq.s   return_59E02
		move.w  #$81,d0 
		jsr     MoveEntityOutOfMap
return_59E02:
		rts

	; End of function ms_map26_InitFunction

cs_59E04:       textCursor $6CB         ; Initial text line $6CB : "The Cotton Balloon popped.{W1}"
		setCameraEntity $FFFF   ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
		csc46 $15,$8            ; 0046 UNKNOWN
		setActscript $0,$FF,eas_Init; 0015 SET ACTSCRIPT 0 FF 460CE
		setActscript $7,$FF,eas_Init; 0015 SET ACTSCRIPT 7 FF 460CE
		setActscript $1F,$FF,eas_Init; 0015 SET ACTSCRIPT 1F FF 460CE
		stopEntity $0           ; 001C STOP ENTITY ANIM 0
		stopEntity $7           ; 001C STOP ENTITY ANIM 7
		stopEntity $1F          ; 001C STOP ENTITY ANIM 1F
		customActscript $0,$FF  ; 0014 SET MANUAL ACTSCRIPT 0
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $7,$FF  ; 0014 SET MANUAL ACTSCRIPT 7
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $1F,$FF ; 0014 SET MANUAL ACTSCRIPT 1F
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $82,$FF ; 0014 SET MANUAL ACTSCRIPT 82
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $83,$FF ; 0014 SET MANUAL ACTSCRIPT 83
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $84,$FF ; 0014 SET MANUAL ACTSCRIPT 84
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		entityPosDir $0,$1A,$7,$3; 0019 SET ENTITY POS AND FACING 0 1A 7 3
		entityPosDir $7,$1B,$6,$3; 0019 SET ENTITY POS AND FACING 7 1B 6 3
		entityPosDir $1F,$19,$6,$3; 0019 SET ENTITY POS AND FACING 1F 19 6 3
		entityPosDir $82,$1A,$6,$1; 0019 SET ENTITY POS AND FACING 82 1A 6 1
		entityPosDir $83,$19,$5,$1; 0019 SET ENTITY POS AND FACING 83 19 5 1
		entityPosDir $84,$1B,$5,$1; 0019 SET ENTITY POS AND FACING 84 1B 5 1
		fadeInB                 ; 0039 FADE IN FROM BLACK
		moveEntity $0,$0,$3,$7  ; 002D MOVE ENTITY 0 0 3 7
		endMove $8080
		moveEntity $7,$0,$3,$7  ; 002D MOVE ENTITY 7 0 3 7
		endMove $8080
		moveEntity $1F,$0,$3,$7 ; 002D MOVE ENTITY 1F 0 3 7
		endMove $8080
		moveEntity $82,$0,$3,$7 ; 002D MOVE ENTITY 82 0 3 7
		endMove $8080
		moveEntity $83,$0,$3,$7 ; 002D MOVE ENTITY 83 0 3 7
		endMove $8080
		moveEntity $84,$FF,$3,$7; 002D MOVE ENTITY 84 FF 3 7
		endMove $8080
		csWait $14              ; WAIT 14
		startEntity $0          ; 001B START ENTITY ANIM 0
		startEntity $7          ; 001B START ENTITY ANIM 7
		startEntity $1F         ; 001B START ENTITY ANIM 1F
		csWait $28              ; WAIT 28
		hideEntity $82          ; 002E HIDE ENTITY 82
		hideEntity $83          ; 002E HIDE ENTITY 83
		hideEntity $84          ; 002E HIDE ENTITY 84
		csWait $1E              ; WAIT 1E
		nextSingleText $FF,$FF  ; "The Cotton Balloon popped.{W1}"
		followEntity $7,$0,$2   ; 002C FOLLOW ENTITY 7 0 2
		followEntity $1F,$7,$2  ; 002C FOLLOW ENTITY 1F 7 2
		csc_end                 ; END OF CUTSCENE SCRIPT
cs_59F20:       textCursor $6CC         ; Initial text line $6CC : "Ungh!{W2}"
		setCamDest $0,$14       ; 0032 SET CAMERA DEST 0 14
		nextSingleText $0,$81   ; "Ungh!{W2}"
		csWait $32              ; WAIT 32
		nextSingleText $0,$81   ; "It's too heavy. I can't{N}lift it.  I give up!{W1}"
		moveEntity $81,$FF,$1,$8; 002D MOVE ENTITY 81 FF 1 8
		endMove $8080
		hideEntity $81          ; 002E HIDE ENTITY 81
		csc_end                 ; END OF CUTSCENE SCRIPT
