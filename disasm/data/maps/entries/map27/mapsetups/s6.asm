
; ASM FILE data\maps\entries\map27\mapsetups\s6.asm :
; 0x59FB6..0x5A09E : 

; =============== S U B R O U T I N E =======================================

ms_map27_InitFunction:
		
		rts

	; End of function ms_map27_InitFunction

cs_59FB8:       textCursor $6C5
		setActscript $1F,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		cameraSpeed $30
		setCamDest 22,15
		setEntityDest $1F,26,20
		csWait 5
		setActscript $1F,$0,eas_461B6
		csWait 120
		nextSingleText $0,$1F   ; "(Sniff, sniff)...{N}It smells like a ditch!{W1}"
		setEntityDest $7,27,20
		setFacing $1F,0
		entityShiver $7
		nextSingleText $0,$7    ; "Is this the smell of the{N}devils that they were{N}talking about?{W1}"
		setCamDest 36,17
		setEntityDest $81,41,21
		nextSingleText $C0,$81  ; "Hee, hee!{W1}"
		setActscript $80,$0,eas_RotateRightHighSpeed
		setActscript $81,$0,eas_RotateRightHighSpeed
		setActscript $82,$0,eas_RotateRightHighSpeed
		csWait 40
		setActscript $80,$FF,eas_Init
		setActscript $81,$FF,eas_Init
		setActscript $82,$FF,eas_Init
		setFacing $80,2
		setFacing $81,2
		setFacing $82,2
		setActscript $80,$0,eas_Jump
		setActscript $81,$0,eas_Jump
		setActscript $82,$FF,eas_Jump
		startEntity $80
		startEntity $81
		startEntity $82
		nextSingleText $0,$7    ; "What huge rats!{W1}"
		nextText $C0,$81        ; "Welcome!{W2}"
		nextSingleText $C0,$81  ; "It's dinner time!{W1}"
		setActscript $80,$0,eas_Jump
		setActscript $82,$FF,eas_Jump
		setStoryFlag $17        ; Battle 23 unlocked
		mapSysEvent $1B,$0,$0,$0
		csc_end
