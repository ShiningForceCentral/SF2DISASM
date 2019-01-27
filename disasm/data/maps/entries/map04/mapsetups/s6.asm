
; ASM FILE data\maps\entries\map04\mapsetups\s6.asm :
; 0x51728..0x51912 : 

; =============== S U B R O U T I N E =======================================

ms_map4_InitFunction:
		
		 
		chkFlg $270             ; set after the soldiers are swallowed up by the earthquake
		bne.s   byte_5173A
		script  cs_51750
		setFlg $270             ; set after the soldiers are swallowed up by the earthquake
		bra.s   return_51740
byte_5173A:
		script  cs_51742
return_51740:
		rts

	; End of function ms_map4_InitFunction

cs_51742:       setPos $80,0,0,RIGHT
		setPos $81,0,0,RIGHT
		csc_end
cs_51750:       textCursor $2CB
		setPos $0,29,4,DOWN
		setPos $1F,28,3,DOWN
		setPos $1E,29,3,DOWN
		setPos $9F,30,3,DOWN
		setQuake 1
		fadeInB
		csWait 30
		setQuake 1
		nextSingleText $0,$80   ; "Your Majesty!  Sir Astral!{N}Are you alright?{W1}"
		entityActionsWait $1F
		 moveDown 1
		endActions
		nextSingleText $0,$1F   ; "You didn't escape?{N}Why are you here?{W1}"
		nextSingleText $0,$80   ; "We've been waiting for you.{N}Chasms are appearing in the{N}ground.{W2}{N}Everybody is on the ship{N}to avoid falling into a{N}hole.{W1}"
		setFacing $1F,RIGHT
		nextSingleText $0,$1F   ; "Thank you.  {LEADER},{N}hurry to the harbor.{W1}"
		nextSingleText $0,$80   ; "Wooooo!{N}Help! Heeeeelp....{W1}"
		setFacing $1F,DOWN
		customActscriptWait $80
		 ac_setSpeed 4,4        ;   
		 ac_jump eas_Idle       ;   
		ac_end
		customActscriptWait $81
		 ac_setSpeed 8,8        ;   
		 ac_jump eas_Idle       ;   
		ac_end
		entityActions $80
		 moveDown 1
		endActions
		entityActions $81
		 moveRight 1
		endActions
		playSound SFX_BIG_DOOR_RUMBLE
		setQuake 3
		csWait 30
		setBlocks 51,18,11,7,24,3
		csWait 10
		setBlocks 51,25,11,7,24,3
		csWait 10
		setBlocks 51,32,11,7,24,3
		csWait 10
		setActscript $80,eas_51840
		csWait 5
		setActscriptWait $81,eas_51840
		playSound SFX_BIG_DOOR_RUMBLE
		setBlocks 51,0,5,4,27,0
		csWait 10
		setBlocks 51,4,5,4,27,0
		csWait 10
		setBlocks 51,8,5,4,27,0
		csWait 30
		setQuake 1
		csWait 30
		setFacing $1F,RIGHT
		nextSingleText $0,$1F   ; "That's too cruel....{N}{W2}{LEADER}, go to the{N}harbor from the east side.{N}It's safer.{W1}"
		setActscript $1F,eas_Follower1
		csc_end
eas_51840:       ac_setSpeed 0,0
		 ac_11 $101
		 ac_12 $FEFF
		 ac_13 $FEFF
		 ac_set1Cb7 $FFFF
		 ac_set1Cb6 $0
		 ac_set1Cb5 $0
		 ac_autoFacing $0
		 ac_moveRel 0,2
		 ac_set1Db3 $FFFF
		 ac_soundCommand $58
		 ac_setFacing RIGHT
		 ac_setSize 22
		 ac_updateSprite
		 ac_wait 4
		 ac_setFacing UP
		 ac_setSize 20
		 ac_updateSprite
		 ac_wait 4
		 ac_setFacing LEFT
		 ac_setSize 18
		 ac_updateSprite
		 ac_wait 4
		 ac_setFacing DOWN
		 ac_setSize 16
		 ac_updateSprite
		 ac_wait 4
		 ac_setFacing RIGHT
		 ac_setSize 14
		 ac_updateSprite
		 ac_wait 4
		 ac_setFacing UP
		 ac_setSize 12
		 ac_updateSprite
		 ac_wait 4
		 ac_setFacing LEFT
		 ac_setSize 10
		 ac_updateSprite
		 ac_wait 4
		 ac_setFacing DOWN
		 ac_setSize 8
		 ac_updateSprite
		 ac_wait 4
		 ac_setFacing RIGHT
		 ac_setSize 6
		 ac_updateSprite
		 ac_wait 4
		 ac_setFacing UP
		 ac_setSize 4
		 ac_updateSprite
		 ac_wait 4
		 ac_setFacing LEFT
		 ac_setSize 2
		 ac_updateSprite
		 ac_waitDest
		 ac_setPos 0,0
		 ac_jump eas_Idle
