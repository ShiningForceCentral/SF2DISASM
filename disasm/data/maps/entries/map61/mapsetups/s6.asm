
; ASM FILE data\maps\entries\map61\mapsetups\s6.asm :
; 0x5C6C8..0x5C76A : 

; =============== S U B R O U T I N E =======================================

ms_map61_InitFunction:
		
		rts

	; End of function ms_map61_InitFunction

cs_5C6CA:       textCursor $E3A
		setActscript $7,$FF,eas_Init
		setActscript $1E,$FF,eas_Init
		setActscript $1F,$FF,eas_Init
		setEntityDest $0,4,9
		setFacing $0,1
		setEntityDest $7,6,9
		setFacing $7,1
		setCamDest 0,5
		setEntityDest $1E,5,7
		setEntityDest $1F,5,9
		setFacing $1F,1
		setFacing $1E,3
		nextSingleText $0,$1E   ; "It's my job!{W1}"
		setFacing $1E,1
		nextSingleText $0,$1E   ; "Row...sham...bow!{W1}"
		entityFlashWhite $1E,$28
		playSound SFX_BATTLEFIELD_DEATH
		setQuake 2
		setBlocks 11,0,1,1,5,6
		csWait 30
		setQuake 0
		setFacing $1E,3
		nextSingleText $0,$1E   ; "OK, you go first!{W1}"
		setStoryFlag $F         ; Battle 15 unlocked
		followEntity $7,$0,$2
		followEntity $1F,$7,$2
		followEntity $1E,$1F,$2
		csc_end
