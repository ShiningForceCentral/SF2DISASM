
; ASM FILE data\maps\entries\map26\mapsetups\s6.asm :
; 0x59DDC..0x59F42 : 

; =============== S U B R O U T I N E =======================================

ms_map26_InitFunction:
		
		 
		chkFlg $30B             ; set after the Cotton Balloon pops and you land in Floor World
		bne.s   byte_59DF2      
		script  cs_59E04
		setFlg $30B             ; set after the Cotton Balloon pops and you land in Floor World
		move.b  #$1A,((EGRESS_MAP_INDEX-$1000000)).w
byte_59DF2:
		chkFlg $30C             ; set after the man tries to lift the giant ring in Floor World
		beq.s   return_59E02
		move.w  #$81,d0 
		jsr     MoveEntityOutOfMap
return_59E02:
		rts

	; End of function ms_map26_InitFunction

cs_59E04:       textCursor $6CB
		setCameraEntity $FFFF
		reloadMap 21,8
		setActscriptWait $0,eas_Init
		setActscriptWait $7,eas_Init
		setActscriptWait $1F,eas_Init
		stopEntity $0
		stopEntity $7
		stopEntity $1F
		customActscriptWait $0
		 ac_setSpeed 10,10      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		customActscriptWait $7
		 ac_setSpeed 10,10      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		customActscriptWait $1F
		 ac_setSpeed 10,10      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		customActscriptWait $82
		 ac_setSpeed 10,10      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		customActscriptWait $83
		 ac_setSpeed 10,10      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		customActscriptWait $84
		 ac_setSpeed 10,10      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		setPos $0,26,7,DOWN
		setPos $7,27,6,DOWN
		setPos $1F,25,6,DOWN
		setPos $82,26,6,UP
		setPos $83,25,5,UP
		setPos $84,27,5,UP
		fadeInB
		entityActions $0
		 moveDown 7
		endActions
		entityActions $7
		 moveDown 7
		endActions
		entityActions $1F
		 moveDown 7
		endActions
		entityActions $82
		 moveDown 7
		endActions
		entityActions $83
		 moveDown 7
		endActions
		entityActionsWait $84
		 moveDown 7
		endActions
		csWait 20
		startEntity $0
		startEntity $7
		startEntity $1F
		csWait 40
		hide $82
		hide $83
		hide $84
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
		entityActionsWait $81
		 moveUp 8
		endActions
		hide $81
		csc_end
