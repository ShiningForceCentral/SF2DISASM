
; ASM FILE data\maps\entries\map63\mapsetups\s6.asm :
; 0x5CA50..0x5CDFE : 

; =============== S U B R O U T I N E =======================================

ms_map63_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $1D
		bne.s   return_5CA5C
		lea     cs_5CA5E(pc), a0
		trap    #6
return_5CA5C:
		rts

	; End of function ms_map63_InitFunction

cs_5CA5E:       entitySprite $1D,$B0
		setFacing $1D,$3
		stopEntity $1D
		csc_end
cs_5CA6E:       setBlocks $10,$36,$1,$1,$D,$2B
		playSound SFX_DOOR_OPEN_HIGH_PITCH
		csWait $14
		setBlocks $10,$36,$1,$1,$D,$2C
		playSound SFX_DOOR_OPEN_HIGH_PITCH
		csWait $12
		setBlocks $10,$36,$1,$1,$D,$2D
		playSound SFX_DOOR_OPEN_HIGH_PITCH
		csWait $10
		setBlocks $10,$36,$1,$1,$D,$2E
		playSound SFX_DOOR_OPEN_HIGH_PITCH
		csWait $E
		setBlocks $10,$36,$1,$1,$D,$2F
		playSound SFX_DOOR_OPEN_HIGH_PITCH
		csWait $C
		setBlocks $10,$36,$1,$1,$D,$30
		playSound SFX_DOOR_OPEN_HIGH_PITCH
		csWait $A
		setBlocks $10,$36,$1,$1,$E,$30
		playSound SFX_DOOR_OPEN_HIGH_PITCH
		csWait $8
		setBlocks $10,$36,$1,$1,$F,$30
		playSound SFX_DOOR_OPEN_HIGH_PITCH
		csWait $6
		setBlocks $10,$36,$1,$1,$F,$31
		playSound SFX_DOOR_OPEN_HIGH_PITCH
		csWait $5
		setBlocks $10,$36,$1,$1,$F,$32
		playSound SFX_DOOR_OPEN_HIGH_PITCH
		csWait $4
		setBlocks $10,$36,$1,$1,$F,$33
		playSound SFX_DOOR_OPEN_HIGH_PITCH
		csWait $3
		setBlocks $10,$36,$1,$1,$F,$34
		playSound SFX_DOOR_OPEN_HIGH_PITCH
		csWait $2
		setBlocks $10,$36,$1,$1,$F,$35
		playSound SFX_DOOR_OPEN_HIGH_PITCH
		csWait $1
		setBlocks $10,$36,$1,$1,$F,$36
		playSound SFX_DOOR_OPEN_HIGH_PITCH
		csWait $1
		csc_end
cs_5CB34:       setBlocksVar $10,$35,$1,$1,$F,$36
		setBlocks $C,$2B,$1,$1,$D,$2B
		csWait $1E
		setBlocksVar $10,$35,$1,$1,$F,$35
		setBlocks $10,$35,$1,$1,$D,$2C
		csWait $19
		setBlocksVar $10,$35,$1,$1,$F,$34
		setBlocks $10,$35,$1,$1,$D,$2D
		csWait $14
		setBlocksVar $10,$35,$1,$1,$F,$33
		setBlocks $10,$35,$1,$1,$D,$2E
		csWait $F
		setBlocksVar $10,$35,$1,$1,$F,$32
		setBlocks $10,$35,$1,$1,$D,$2F
		csWait $A
		setBlocksVar $10,$35,$1,$1,$F,$31
		setBlocks $10,$35,$1,$1,$D,$30
		csWait $5
		setBlocksVar $10,$35,$1,$1,$F,$30
		setBlocks $10,$35,$1,$1,$E,$30
		csWait $1
		csc_end
cs_5CBB4:       textCursor $1053
		nextSingleText $FF,$FF  ; "{LEADER} put the Arm of{N}Golem on the golem.{W1}"
		entitySprite $1D,$1D
		startEntity $1D
		nextSingleText $0,$1D   ; "O...ooo...wow!{W1}"
		setActscript $1D,$FF,eas_Jump
		setQuake $2
		playSound SFX_DOOR_OPEN_HIGH_PITCH
		csWait $14
		setQuake $0
		csWait $28
		setFacing $1D,$2
		csWait $14
		setFacing $1D,$1
		csWait $14
		setFacing $1D,$0
		csWait $14
		setFacing $1D,$3
		setActscript $1D,$FF,eas_Jump
		setQuake $2
		playSound SFX_DOOR_OPEN_HIGH_PITCH
		csWait $14
		setQuake $0
		csWait $1E
		nextText $0,$1D         ; "That feels good....{N}My power is back!{W1}"
		nextText $0,$1D         ; "Thank you.{N}I can move again!{N}How can I express...{W1}"
		nextSingleText $0,$1D   ; "Oh, yes!  I'll join you!{N}I'll protect you!{W1}"
		join $1D
		addNewFollower $1D
		csc_end
cs_5CC26:       entityFlashWhite $0,$32
		setActscript $0,$0,eas_RotateRightHighSpeed
		csWait $1E
		executeSubroutine FadeOutToWhite
		mapLoad $40,$0,$0
		loadEntitiesFromMapSetup $5,$4,$1
		executeSubroutine csub_5CDDC
		setActscript $0,$0,eas_RotateRightHighSpeed
		executeSubroutine FadeInFromWhite
		csWait $1E
		executeSubroutine sub_5CDEC
		csWait $14
		executeSubroutine sub_5CDEC
		csWait $14
		executeSubroutine sub_5CDEC
		csWait $14
		executeSubroutine sub_5CDEC
		csWait $14
		executeSubroutine sub_5CDEC
		csWait $14
		executeSubroutine sub_5CDEC
		csWait $14
		executeSubroutine sub_5CDEC
		csWait $14
		executeSubroutine sub_5CDEC
		csWait $14
		executeSubroutine sub_5CDEC
		csWait $14
		executeSubroutine sub_5CDEC
		csWait $1E
		executeSubroutine FadeOutToWhite
		csWait $28
		executeSubroutine sub_5CDF8
		csWait $2
		mapLoad $3F,$3,$3
		loadEntitiesFromMapSetup $8,$7,$1
		setActscript $0,$0,eas_RotateRightHighSpeed
		executeSubroutine FadeInFromWhite
		csWait $1E
		entityFlashWhite $0,$32
		setActscript $0,$FF,eas_Init
		startEntity $0
		csc_end
cs_5CCF6:       entityFlashWhite $0,$32
		setActscript $0,$0,eas_RotateRightHighSpeed
		csWait $1E
		executeSubroutine FadeOutToWhite
		mapLoad $40,$0,$0
		loadEntitiesFromMapSetup $5,$4,$1
		executeSubroutine sub_5CDE4
		setActscript $0,$0,eas_RotateRightHighSpeed
		executeSubroutine FadeInFromWhite
		csWait $1E
		executeSubroutine sub_5CDF2
		csWait $14
		executeSubroutine sub_5CDF2
		csWait $14
		executeSubroutine sub_5CDF2
		csWait $14
		executeSubroutine sub_5CDF2
		csWait $14
		executeSubroutine sub_5CDF2
		csWait $14
		executeSubroutine sub_5CDF2
		csWait $14
		executeSubroutine sub_5CDF2
		csWait $14
		executeSubroutine sub_5CDF2
		csWait $14
		executeSubroutine sub_5CDF2
		csWait $14
		executeSubroutine sub_5CDF2
		csWait $1E
		executeSubroutine FadeOutToWhite
		csWait $28
		executeSubroutine sub_5CDF8
		csWait $2
		mapLoad $3F,$5,$11
		loadEntitiesFromMapSetup $A,$15,$1
		setActscript $0,$0,eas_RotateRightHighSpeed
		executeSubroutine FadeInFromWhite
		csWait $1E
		entityFlashWhite $0,$32
		setActscript $0,$FF,eas_Init
		startEntity $0
		jumpIfFlagSet $1D,cs_5CDDA; Claude joined
		entitySprite $1D,$B0
		setFacing $1D,$3
		stopEntity $1D
cs_5CDDA:       csc_end

; =============== S U B R O U T I N E =======================================

csub_5CDDC:
		move.b  #$A9,($FFFFA849).w
		rts

	; End of function csub_5CDDC


; =============== S U B R O U T I N E =======================================

sub_5CDE4:
		move.b  #$57,((MAP_AREA_LAYER2_AUTOSCROLL_Y-$1000000)).w 
		rts

	; End of function sub_5CDE4


; =============== S U B R O U T I N E =======================================

sub_5CDEC:
		subq.b  #4,((MAP_AREA_LAYER2_AUTOSCROLL_Y-$1000000)).w
		rts

	; End of function sub_5CDEC


; =============== S U B R O U T I N E =======================================

sub_5CDF2:
		addq.b  #4,((MAP_AREA_LAYER2_AUTOSCROLL_Y-$1000000)).w
		rts

	; End of function sub_5CDF2


; =============== S U B R O U T I N E =======================================

sub_5CDF8:
		clr.b   ((MAP_AREA_LAYER2_AUTOSCROLL_Y-$1000000)).w
		rts

	; End of function sub_5CDF8

