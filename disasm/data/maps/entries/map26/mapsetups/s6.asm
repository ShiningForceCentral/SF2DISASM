
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

cs_59E04:       textCursor $6CB
		setCameraEntity $FFFF
		reloadMap 21,8
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setActscript $1F,$FF,eas_Init
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
		customActscript $82,$FF
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $83,$FF
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $84,$FF
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setPos $0,26,7,3
		setPos $7,27,6,3
		setPos $1F,25,6,3
		setPos $82,26,6,1
		setPos $83,25,5,1
		setPos $84,27,5,1
		fadeInB
		moveEntity $0,$0,$3,$7
		endMove $8080
		moveEntity $7,$0,$3,$7
		endMove $8080
		moveEntity $1F,$0,$3,$7
		endMove $8080
		moveEntity $82,$0,$3,$7
		endMove $8080
		moveEntity $83,$0,$3,$7
		endMove $8080
		moveEntity $84,$FF,$3,$7
		endMove $8080
		csWait 20
		startEntity $0
		startEntity $7
		startEntity $1F
		csWait 40
		hideEntity $82
		hideEntity $83
		hideEntity $84
		csWait 30
		nextSingleText $FF,$FF  ; "The Cotton Balloon popped.{W1}"
		followEntity $7,$0,$2
		followEntity $1F,$7,$2
		csc_end
cs_59F20:       textCursor $6CC
		setCamDest 0,20
		nextSingleText $0,$81   ; "Ungh!{W2}"
		csWait 50
		nextSingleText $0,$81   ; "It's too heavy. I can't{N}lift it.  I give up!{W1}"
		moveEntity $81,$FF,$1,$8
		endMove $8080
		hideEntity $81
		csc_end
