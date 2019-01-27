
; ASM FILE data\maps\entries\map20\mapsetups\s6_21F.asm :
; 0x633A2..0x6343C : 

; =============== S U B R O U T I N E =======================================

ms_map20_flag21F_InitFunction:
		
		 
		chkFlg $3D6
		beq.s   byte_633BA
		lea     cs_633B2(pc), a0
		trap    #6
		bra.w   byte_633BA
cs_633B2:
		setPos $80,27,50,LEFT
		csc_end
byte_633BA:
		sndCom MUSIC_TOWN
		jsr     (FadeInFromBlack).w
		rts

	; End of function ms_map20_flag21F_InitFunction

cs_EndKiss:     hideText
		setCameraEntity $FFFF
		setFacing $0,RIGHT
		customActscriptWait $0
		 ac_setSpeed 8,8        ;   
		 ac_jump eas_Idle       ;   
		ac_end
		csWait 30
		playSound MUSIC_ENDING
		entityActions $0
		 moveUpRight 1
		endActions
		csWait 10
		setActscriptWait $0,eas_461AA
		csWait 80
		entityActions $0
		 moveRight 1
		endActions
		csWait 10
		setActscriptWait $0,eas_461AA
		stopEntity $0
		csWait 50
		customActscriptWait $0
		 ac_setSpeed 4,4        ;   
		 ac_jump eas_Idle       ;   
		ac_end
		entityActions $0
		 moveRight 1
		endActions
		csWait 16
		setActscriptWait $0,eas_461AA
		csWait 120
		executeSubroutine j_EndKiss
		csc_end
