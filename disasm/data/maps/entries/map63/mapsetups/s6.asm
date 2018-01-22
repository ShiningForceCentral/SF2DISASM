
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

cs_5CA5E:       entitySprite $1D,$B0    ; 001A SET ENTITY SPRITE 1D B0
		setFacing $1D,$3        ; 0023 SET ENTITY FACING 1D 3
		stopEntity $1D          ; 001C STOP ENTITY ANIM 1D
		csc_end
cs_5CA6E:       setBlocks $10,$36,$1,$1,$D,$2B; 0034 SET BLOCKS 1036 101 D2B
		playSound SFX_DOOR_OPEN_HIGH_PITCH
						; 0005 PLAY SOUND SFX_DOOR_OPEN_HIGH_PITCH
		csWait $14
		setBlocks $10,$36,$1,$1,$D,$2C; 0034 SET BLOCKS 1036 101 D2C
		playSound SFX_DOOR_OPEN_HIGH_PITCH
						; 0005 PLAY SOUND SFX_DOOR_OPEN_HIGH_PITCH
		csWait $12
		setBlocks $10,$36,$1,$1,$D,$2D; 0034 SET BLOCKS 1036 101 D2D
		playSound SFX_DOOR_OPEN_HIGH_PITCH
						; 0005 PLAY SOUND SFX_DOOR_OPEN_HIGH_PITCH
		csWait $10
		setBlocks $10,$36,$1,$1,$D,$2E; 0034 SET BLOCKS 1036 101 D2E
		playSound SFX_DOOR_OPEN_HIGH_PITCH
						; 0005 PLAY SOUND SFX_DOOR_OPEN_HIGH_PITCH
		csWait $E
		setBlocks $10,$36,$1,$1,$D,$2F; 0034 SET BLOCKS 1036 101 D2F
		playSound SFX_DOOR_OPEN_HIGH_PITCH
						; 0005 PLAY SOUND SFX_DOOR_OPEN_HIGH_PITCH
		csWait $C
		setBlocks $10,$36,$1,$1,$D,$30; 0034 SET BLOCKS 1036 101 D30
		playSound SFX_DOOR_OPEN_HIGH_PITCH
						; 0005 PLAY SOUND SFX_DOOR_OPEN_HIGH_PITCH
		csWait $A
		setBlocks $10,$36,$1,$1,$E,$30; 0034 SET BLOCKS 1036 101 E30
		playSound SFX_DOOR_OPEN_HIGH_PITCH
						; 0005 PLAY SOUND SFX_DOOR_OPEN_HIGH_PITCH
		csWait $8
		setBlocks $10,$36,$1,$1,$F,$30; 0034 SET BLOCKS 1036 101 F30
		playSound SFX_DOOR_OPEN_HIGH_PITCH
						; 0005 PLAY SOUND SFX_DOOR_OPEN_HIGH_PITCH
		csWait $6
		setBlocks $10,$36,$1,$1,$F,$31; 0034 SET BLOCKS 1036 101 F31
		playSound SFX_DOOR_OPEN_HIGH_PITCH
						; 0005 PLAY SOUND SFX_DOOR_OPEN_HIGH_PITCH
		csWait $5
		setBlocks $10,$36,$1,$1,$F,$32; 0034 SET BLOCKS 1036 101 F32
		playSound SFX_DOOR_OPEN_HIGH_PITCH
						; 0005 PLAY SOUND SFX_DOOR_OPEN_HIGH_PITCH
		csWait $4
		setBlocks $10,$36,$1,$1,$F,$33; 0034 SET BLOCKS 1036 101 F33
		playSound SFX_DOOR_OPEN_HIGH_PITCH
						; 0005 PLAY SOUND SFX_DOOR_OPEN_HIGH_PITCH
		csWait $3
		setBlocks $10,$36,$1,$1,$F,$34; 0034 SET BLOCKS 1036 101 F34
		playSound SFX_DOOR_OPEN_HIGH_PITCH
						; 0005 PLAY SOUND SFX_DOOR_OPEN_HIGH_PITCH
		csWait $2
		setBlocks $10,$36,$1,$1,$F,$35; 0034 SET BLOCKS 1036 101 F35
		playSound SFX_DOOR_OPEN_HIGH_PITCH
						; 0005 PLAY SOUND SFX_DOOR_OPEN_HIGH_PITCH
		csWait $1
		setBlocks $10,$36,$1,$1,$F,$36; 0034 SET BLOCKS 1036 101 F36
		playSound SFX_DOOR_OPEN_HIGH_PITCH
						; 0005 PLAY SOUND SFX_DOOR_OPEN_HIGH_PITCH
		csWait $1
		csc_end
cs_5CB34:       setBlocksVar $10,$35,$1,$1,$F,$36
						; 0035 SIMILAR TO SET BLOCKS 1035 101 F36
		setBlocks $C,$2B,$1,$1,$D,$2B; 0034 SET BLOCKS C2B 101 D2B
		csWait $1E
		setBlocksVar $10,$35,$1,$1,$F,$35
						; 0035 SIMILAR TO SET BLOCKS 1035 101 F35
		setBlocks $10,$35,$1,$1,$D,$2C; 0034 SET BLOCKS 1035 101 D2C
		csWait $19
		setBlocksVar $10,$35,$1,$1,$F,$34
						; 0035 SIMILAR TO SET BLOCKS 1035 101 F34
		setBlocks $10,$35,$1,$1,$D,$2D; 0034 SET BLOCKS 1035 101 D2D
		csWait $14
		setBlocksVar $10,$35,$1,$1,$F,$33
						; 0035 SIMILAR TO SET BLOCKS 1035 101 F33
		setBlocks $10,$35,$1,$1,$D,$2E; 0034 SET BLOCKS 1035 101 D2E
		csWait $F
		setBlocksVar $10,$35,$1,$1,$F,$32
						; 0035 SIMILAR TO SET BLOCKS 1035 101 F32
		setBlocks $10,$35,$1,$1,$D,$2F; 0034 SET BLOCKS 1035 101 D2F
		csWait $A
		setBlocksVar $10,$35,$1,$1,$F,$31
						; 0035 SIMILAR TO SET BLOCKS 1035 101 F31
		setBlocks $10,$35,$1,$1,$D,$30; 0034 SET BLOCKS 1035 101 D30
		csWait $5
		setBlocksVar $10,$35,$1,$1,$F,$30
						; 0035 SIMILAR TO SET BLOCKS 1035 101 F30
		setBlocks $10,$35,$1,$1,$E,$30; 0034 SET BLOCKS 1035 101 E30
		csWait $1
		csc_end
cs_5CBB4:       textCursor $1053        ; 0004 INIT TEXT CURSOR 1053 : "{LEADER} put the Arm of{N}Golem on the golem.{W1}"
		nextSingleText $FF,$FF  ; "{LEADER} put the Arm of{N}Golem on the golem.{W1}"
		entitySprite $1D,$1D    ; 001A SET ENTITY SPRITE 1D 1D
		startEntity $1D         ; 001B START ENTITY ANIM 1D
		nextSingleText $0,$1D   ; "O...ooo...wow!{W1}"
		setActscript $1D,$FF,eas_Jump; 0015 SET ACTSCRIPT 1D FF 45E44
		setQuake $2             ; 0033 SET QUAKE AMOUNT 2
		playSound SFX_DOOR_OPEN_HIGH_PITCH
						; 0005 PLAY SOUND SFX_DOOR_OPEN_HIGH_PITCH
		csWait $14
		setQuake $0             ; 0033 SET QUAKE AMOUNT 0
		csWait $28
		setFacing $1D,$2        ; 0023 SET ENTITY FACING 1D 2
		csWait $14
		setFacing $1D,$1        ; 0023 SET ENTITY FACING 1D 1
		csWait $14
		setFacing $1D,$0        ; 0023 SET ENTITY FACING 1D 0
		csWait $14
		setFacing $1D,$3        ; 0023 SET ENTITY FACING 1D 3
		setActscript $1D,$FF,eas_Jump; 0015 SET ACTSCRIPT 1D FF 45E44
		setQuake $2             ; 0033 SET QUAKE AMOUNT 2
		playSound SFX_DOOR_OPEN_HIGH_PITCH
						; 0005 PLAY SOUND SFX_DOOR_OPEN_HIGH_PITCH
		csWait $14
		setQuake $0             ; 0033 SET QUAKE AMOUNT 0
		csWait $1E
		nextText $0,$1D         ; "That feels good....{N}My power is back!{W1}"
		nextText $0,$1D         ; "Thank you.{N}I can move again!{N}How can I express...{W1}"
		nextSingleText $0,$1D   ; "Oh, yes!  I'll join you!{N}I'll protect you!{W1}"
		join $1D                ; 0008 JOIN FORCE 1D
		addNewFollower $1D      ; 0056 SOMETHING WITH AN ENTITY 1D
		csc_end
cs_5CC26:       entityFlashWhite $0,$32 ; 0018 FLASH ENTITY WHITE 0 32
		setActscript $0,$0,eas_RotateRightHighSpeed
						; 0015 SET ACTSCRIPT 0 0 45FF0
		csWait $1E
		executeSubroutine FadeOutToWhite; 000A EXECUTE SUBROUTINE CF4
		mapLoad $40,$0,$0       ; 0048 LOAD MAP 40 0 0
		loadEntitiesFromMapSetup $5,$4,$1
						; 0049  5 4 1
		executeSubroutine csub_5CDDC; 000A EXECUTE SUBROUTINE 5CDDC
		setActscript $0,$0,eas_RotateRightHighSpeed
						; 0015 SET ACTSCRIPT 0 0 45FF0
		executeSubroutine FadeInFromWhite
						; 000A EXECUTE SUBROUTINE CEA
		csWait $1E
		executeSubroutine sub_5CDEC; 000A EXECUTE SUBROUTINE 5CDEC
		csWait $14
		executeSubroutine sub_5CDEC; 000A EXECUTE SUBROUTINE 5CDEC
		csWait $14
		executeSubroutine sub_5CDEC; 000A EXECUTE SUBROUTINE 5CDEC
		csWait $14
		executeSubroutine sub_5CDEC; 000A EXECUTE SUBROUTINE 5CDEC
		csWait $14
		executeSubroutine sub_5CDEC; 000A EXECUTE SUBROUTINE 5CDEC
		csWait $14
		executeSubroutine sub_5CDEC; 000A EXECUTE SUBROUTINE 5CDEC
		csWait $14
		executeSubroutine sub_5CDEC; 000A EXECUTE SUBROUTINE 5CDEC
		csWait $14
		executeSubroutine sub_5CDEC; 000A EXECUTE SUBROUTINE 5CDEC
		csWait $14
		executeSubroutine sub_5CDEC; 000A EXECUTE SUBROUTINE 5CDEC
		csWait $14
		executeSubroutine sub_5CDEC; 000A EXECUTE SUBROUTINE 5CDEC
		csWait $1E
		executeSubroutine FadeOutToWhite; 000A EXECUTE SUBROUTINE CF4
		csWait $28
		executeSubroutine sub_5CDF8; 000A EXECUTE SUBROUTINE 5CDF8
		csWait $2
		mapLoad $3F,$3,$3       ; 0048 LOAD MAP 3F 3 3
		loadEntitiesFromMapSetup $8,$7,$1
						; 0049  8 7 1
		setActscript $0,$0,eas_RotateRightHighSpeed
						; 0015 SET ACTSCRIPT 0 0 45FF0
		executeSubroutine FadeInFromWhite
						; 000A EXECUTE SUBROUTINE CEA
		csWait $1E
		entityFlashWhite $0,$32 ; 0018 FLASH ENTITY WHITE 0 32
		setActscript $0,$FF,eas_Init; 0015 SET ACTSCRIPT 0 FF 460CE
		startEntity $0          ; 001B START ENTITY ANIM 0
		csc_end
cs_5CCF6:       entityFlashWhite $0,$32 ; 0018 FLASH ENTITY WHITE 0 32
		setActscript $0,$0,eas_RotateRightHighSpeed
						; 0015 SET ACTSCRIPT 0 0 45FF0
		csWait $1E
		executeSubroutine FadeOutToWhite; 000A EXECUTE SUBROUTINE CF4
		mapLoad $40,$0,$0       ; 0048 LOAD MAP 40 0 0
		loadEntitiesFromMapSetup $5,$4,$1
						; 0049  5 4 1
		executeSubroutine sub_5CDE4; 000A EXECUTE SUBROUTINE 5CDE4
		setActscript $0,$0,eas_RotateRightHighSpeed
						; 0015 SET ACTSCRIPT 0 0 45FF0
		executeSubroutine FadeInFromWhite
						; 000A EXECUTE SUBROUTINE CEA
		csWait $1E
		executeSubroutine sub_5CDF2; 000A EXECUTE SUBROUTINE 5CDF2
		csWait $14
		executeSubroutine sub_5CDF2; 000A EXECUTE SUBROUTINE 5CDF2
		csWait $14
		executeSubroutine sub_5CDF2; 000A EXECUTE SUBROUTINE 5CDF2
		csWait $14
		executeSubroutine sub_5CDF2; 000A EXECUTE SUBROUTINE 5CDF2
		csWait $14
		executeSubroutine sub_5CDF2; 000A EXECUTE SUBROUTINE 5CDF2
		csWait $14
		executeSubroutine sub_5CDF2; 000A EXECUTE SUBROUTINE 5CDF2
		csWait $14
		executeSubroutine sub_5CDF2; 000A EXECUTE SUBROUTINE 5CDF2
		csWait $14
		executeSubroutine sub_5CDF2; 000A EXECUTE SUBROUTINE 5CDF2
		csWait $14
		executeSubroutine sub_5CDF2; 000A EXECUTE SUBROUTINE 5CDF2
		csWait $14
		executeSubroutine sub_5CDF2; 000A EXECUTE SUBROUTINE 5CDF2
		csWait $1E
		executeSubroutine FadeOutToWhite; 000A EXECUTE SUBROUTINE CF4
		csWait $28
		executeSubroutine sub_5CDF8; 000A EXECUTE SUBROUTINE 5CDF8
		csWait $2
		mapLoad $3F,$5,$11      ; 0048 LOAD MAP 3F 5 11
		loadEntitiesFromMapSetup $A,$15,$1
						; 0049  A 15 1
		setActscript $0,$0,eas_RotateRightHighSpeed
						; 0015 SET ACTSCRIPT 0 0 45FF0
		executeSubroutine FadeInFromWhite
						; 000A EXECUTE SUBROUTINE CEA
		csWait $1E
		entityFlashWhite $0,$32 ; 0018 FLASH ENTITY WHITE 0 32
		setActscript $0,$FF,eas_Init; 0015 SET ACTSCRIPT 0 FF 460CE
		startEntity $0          ; 001B START ENTITY ANIM 0
		jumpIfFlagSet $1D,cs_5CDDA; Claude joined
		entitySprite $1D,$B0    ; 001A SET ENTITY SPRITE 1D B0
		setFacing $1D,$3        ; 0023 SET ENTITY FACING 1D 3
		stopEntity $1D          ; 001C STOP ENTITY ANIM 1D
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

