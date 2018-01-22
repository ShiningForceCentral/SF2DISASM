
; ASM FILE data\maps\entries\map12\mapsetups\s6.asm :
; 0x57D04..0x57E36 : 

; =============== S U B R O U T I N E =======================================

ms_map12_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $2D5               ; set after telling Rohde that you're going to get the Caravan
		bne.s   loc_57D10
		lea     cs_57D22(pc), a0
		trap    #6
loc_57D10:
		trap    #CHECK_FLAG
		dc.w $206               ; Battle 18 completed
		beq.s   return_57D20
		move.w  #$80,d0 
		jsr     MoveEntityOutOfMap
return_57D20:
		rts

	; End of function ms_map12_InitFunction

cs_57D22:       textCursor $C7D
		cameraSpeed $30
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setActscript $1F,$FF,eas_Init
		setPos $0,12,31,1
		setPos $7,13,31,1
		setPos $1F,11,31,1
		fadeInB
		moveEntity $0,$0,$1,$5
		endMove $8080
		moveEntity $7,$0,$1,$5
		endMove $8080
		moveEntity $1F,$FF,$1,$5
		endMove $8080
		nextSingleText $0,$80   ; "Stop!{W1}"
		csWait 10
		setActscript $0,$0,eas_Jump
		setActscript $7,$0,eas_Jump
		setActscript $1F,$FF,eas_Jump
		setActscript $0,$0,eas_Jump
		setActscript $7,$0,eas_Jump
		setActscript $1F,$FF,eas_Jump
		csWait 30
		csWait 5
		setActscript $0,$0,eas_461B6
		csWait 5
		setActscript $7,$0,eas_461E4
		csWait 5
		setActscript $1F,$0,eas_461B6
		csWait 80
		moveEntity $7,$FF,$1,$1
		endMove $8080
		setFacing $0,1
		setFacing $1F,1
		nextSingleText $80,$7   ; "Who said that?{W1}"
		setCamDest 7,5
		nextSingleText $80,$7   ; "Wow, what a huge guy!{W1}"
		csWait 30
		nextSingleText $0,$80   ; "Leave here!{N}I'll attack you if you don't!{W1}"
		setCamDest 7,21
		moveEntity $7,$FF,$3,$1
		endMove $8080
		setFacing $0,0
		setFacing $1F,0
		setFacing $7,2
		nextText $80,$7         ; "Attack us?!  {LEADER},{N}let's get out of here!{W2}"
		nextSingleText $80,$7   ; "We don't want to fight him!{W1}"
		csWait 20
		entityNod $0
		nextSingleText $80,$7   ; "OK, hurry!{W1}"
		moveEntity $0,$0,$3,$5
		endMove $8080
		moveEntity $7,$0,$3,$5
		endMove $8080
		moveEntity $1F,$FF,$3,$5
		endMove $8080
		mapSysEvent $44,$37,$2C,$3
		csc_end
