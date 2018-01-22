
; ASM FILE data\maps\entries\map04\mapsetups\s6.asm :
; 0x51728..0x51912 : 

; =============== S U B R O U T I N E =======================================

ms_map4_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $270               ; set after the soldiers are swallowed up by the earthquake
		bne.s   loc_5173A
		lea     cs_51750(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $270               ; set after the soldiers are swallowed up by the earthquake
		bra.s   return_51740
loc_5173A:
		lea     cs_51742(pc), a0
		trap    #6
return_51740:
		rts

	; End of function ms_map4_InitFunction

cs_51742:       entityPosDir $80,$0,$0,$0
		entityPosDir $81,$0,$0,$0
		csc_end
cs_51750:       textCursor $2CB
		entityPosDir $0,$1D,$4,$3
		entityPosDir $1F,$1C,$3,$3
		entityPosDir $1E,$1D,$3,$3
		entityPosDir $9F,$1E,$3,$3
		setQuake $1
		fadeInB
		csWait $1E
		setQuake $1
		nextSingleText $0,$80   ; "Your Majesty!  Sir Astral!{N}Are you alright?{W1}"
		moveEntity $1F,$FF,$3,$1
		endMove $8080
		nextSingleText $0,$1F   ; "You didn't escape?{N}Why are you here?{W1}"
		nextSingleText $0,$80   ; "We've been waiting for you.{N}Chasms are appearing in the{N}ground.{W2}{N}Everybody is on the ship{N}to avoid falling into a{N}hole.{W1}"
		setFacing $1F,$0
		nextSingleText $0,$1F   ; "Thank you.  {LEADER},{N}hurry to the harbor.{W1}"
		nextSingleText $0,$80   ; "Wooooo!{N}Help! Heeeeelp....{W1}"
		setFacing $1F,$3
		customActscript $80,$FF
		dc.w $10                ;   0010 SET SPEED X=$4 Y=$4
		dc.b 4
		dc.b 4
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $81,$FF
		dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
		dc.b 8
		dc.b 8
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $80,$0,$3,$1
		endMove $8080
		moveEntity $81,$0,$0,$1
		endMove $8080
		playSound SFX_BIG_DOOR_RUMBLE
		setQuake $3
		csWait $1E
		setBlocks $33,$12,$B,$7,$18,$3
		csWait $A
		setBlocks $33,$19,$B,$7,$18,$3
		csWait $A
		setBlocks $33,$20,$B,$7,$18,$3
		csWait $A
		setActscript $80,$0,eas_51840
		csWait $5
		setActscript $81,$FF,eas_51840
		playSound SFX_BIG_DOOR_RUMBLE
		setBlocks $33,$0,$5,$4,$1B,$0
		csWait $A
		setBlocks $33,$4,$5,$4,$1B,$0
		csWait $A
		setBlocks $33,$8,$5,$4,$1B,$0
		csWait $1E
		setQuake $1
		csWait $1E
		setFacing $1F,$0
		nextSingleText $0,$1F   ; "That's too cruel....{N}{W2}{LEADER}, go to the{N}harbor from the east side.{N}It's safer.{W1}"
		setActscript $1F,$0,eas_Follower1
		csc_end
eas_51840:      dc.w $10                ; 0010 SET SPEED X=$0 Y=$0
		dc.b 0
		dc.b 0
		dc.w $11                ; 0011  $101
		dc.w $101
		dc.w $12                ; 0012  $FEFF
		dc.w $FEFF
		dc.w $13                ; 0013  $FEFF
		dc.w $FEFF
		dc.w $18                ; 0018 SET 1C BIT 7 $FFFF
		dc.w $FFFF
		dc.w $19                ; 0019 SET 1C BIT 6 $0
		dc.w 0
		dc.w $1A                ; 001A SET 1C BIT 5 $0
		dc.w 0
		dc.w $15                ; 0015 SET ABILITY TO CHANGE FACING $0
		dc.w 0
		dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$0 Y=Y+$2
		dc.w 0
		dc.w 2
		dc.w $1F                ; 001F SET 1D BIT 3 $FFFF
		dc.w $FFFF
		dc.w $23                ; 0023 SEND SOUND COMMAND SFX_FALLING
		dc.w $58
		dc.w $22                ; 0022 SET FACING $0
		dc.w 0
		dc.w $B                 ; 000B SET SPRITE SIZE $16
		dc.w $16
		dc.w $A                 ; 000A UPDATE SPRITE
		dc.w 0                  ; 0000 WAIT value $4
		dc.w 4
		dc.w $22                ; 0022 SET FACING $1
		dc.w 1
		dc.w $B                 ; 000B SET SPRITE SIZE $14
		dc.w $14
		dc.w $A                 ; 000A UPDATE SPRITE
		dc.w 0                  ; 0000 WAIT value $4
		dc.w 4
		dc.w $22                ; 0022 SET FACING $2
		dc.w 2
		dc.w $B                 ; 000B SET SPRITE SIZE $12
		dc.w $12
		dc.w $A                 ; 000A UPDATE SPRITE
		dc.w 0                  ; 0000 WAIT value $4
		dc.w 4
		dc.w $22                ; 0022 SET FACING $3
		dc.w 3
		dc.w $B                 ; 000B SET SPRITE SIZE $10
		dc.w $10
		dc.w $A                 ; 000A UPDATE SPRITE
		dc.w 0                  ; 0000 WAIT value $4
		dc.w 4
		dc.w $22                ; 0022 SET FACING $0
		dc.w 0
		dc.w $B                 ; 000B SET SPRITE SIZE $E
		dc.w $E
		dc.w $A                 ; 000A UPDATE SPRITE
		dc.w 0                  ; 0000 WAIT value $4
		dc.w 4
		dc.w $22                ; 0022 SET FACING $1
		dc.w 1
		dc.w $B                 ; 000B SET SPRITE SIZE $C
		dc.w $C
		dc.w $A                 ; 000A UPDATE SPRITE
		dc.w 0                  ; 0000 WAIT value $4
		dc.w 4
		dc.w $22                ; 0022 SET FACING $2
		dc.w 2
		dc.w $B                 ; 000B SET SPRITE SIZE $A
		dc.w $A
		dc.w $A                 ; 000A UPDATE SPRITE
		dc.w 0                  ; 0000 WAIT value $4
		dc.w 4
		dc.w $22                ; 0022 SET FACING $3
		dc.w 3
		dc.w $B                 ; 000B SET SPRITE SIZE $8
		dc.w 8
		dc.w $A                 ; 000A UPDATE SPRITE
		dc.w 0                  ; 0000 WAIT value $4
		dc.w 4
		dc.w $22                ; 0022 SET FACING $0
		dc.w 0
		dc.w $B                 ; 000B SET SPRITE SIZE $6
		dc.w 6
		dc.w $A                 ; 000A UPDATE SPRITE
		dc.w 0                  ; 0000 WAIT value $4
		dc.w 4
		dc.w $22                ; 0022 SET FACING $1
		dc.w 1
		dc.w $B                 ; 000B SET SPRITE SIZE $4
		dc.w 4
		dc.w $A                 ; 000A UPDATE SPRITE
		dc.w 0                  ; 0000 WAIT value $4
		dc.w 4
		dc.w $22                ; 0022 SET FACING $2
		dc.w 2
		dc.w $B                 ; 000B SET SPRITE SIZE $2
		dc.w 2
		dc.w $A                 ; 000A UPDATE SPRITE
		dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
		dc.w $C                 ; 000C SET POSITION X=$0 Y=$0
		dc.w 0
		dc.w 0
		dc.w $34                ; 0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
