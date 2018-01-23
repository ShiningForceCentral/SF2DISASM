
; ASM FILE data\maps\entries\map55\mapsetups\s6.asm :
; 0x5E268..0x5E37C : 

; =============== S U B R O U T I N E =======================================

ms_map55_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $3E7
		beq.s   return_5E27A
		lea     byte_5E320(pc), a0
		trap    #6
		lea     cs_5E346(pc), a0
		trap    #6
return_5E27A:
		rts

	; End of function ms_map55_InitFunction

byte_5E27C:     setActscript $0,$FF,eas_5E2C4
		setActscript $7,$FF,eas_Init
		setActscript $7,$FF,eas_5E2C4
		setActscript $1F,$FF,eas_Init
		setActscript $1F,$FF,eas_5E2C4
		jumpIfFlagClear $4C,cs_5E2BC; Zynk is a follower
		setActscript $1A,$FF,eas_Init
		setActscript $1A,$FF,eas_5E2C4
cs_5E2BC:       mapSysEvent $25,$1D,$8,$2
		csc_end
eas_5E2C4:      ac_set1Cb5 $0
		ac_moveAbs 7,7
		ac_wait 6
		ac_set1Db3 $FFFF
		ac_setSize 22
		ac_updateSprite
		ac_wait 1
		ac_setSize 20
		ac_updateSprite
		ac_wait 1
		ac_setSize 18
		ac_updateSprite
		ac_wait 1
		ac_setSize 16
		ac_updateSprite
		ac_wait 1
		ac_setSize 14
		ac_updateSprite
		ac_wait 1
		ac_setSize 12
		ac_updateSprite
		ac_waitDest
		ac_setSprite 60
		ac_updateSprite
		ac_wait 1
		ac_jump eas_Idle
byte_5E320:     mapLoad 75,8,14
		loadMapEntities ce_5E33E
		setActscript $0,$FF,eas_Init
		playSound MUSIC_MAIN_THEME
		fadeInB
		csc_end
ce_5E33E:       mainEntity 12,19,DOWN
		dc.w $FFFF
cs_5E346:       textCursor $D2B
		setActscript $0,$FF,eas_Init
		moveEntity $0,$FF,$2,$1
		moreMove $2,$1
		endMove $8080
		csWait 30
		setFacing $7,RIGHT
		setFacing $1A,RIGHT
		setFacing $1F,RIGHT
		setFacing $0,RIGHT
		nextText $0,$1F         ; "What a terrible waste.{N}We've lost an ancient{N}treasure.{W2}"
		setFacing $1F,LEFT
		nextSingleText $0,$1F   ; "Anyway, we have to go to{N}Arc Valley.{N}{LEADER}, let's go.{W1}"
		csc_end
