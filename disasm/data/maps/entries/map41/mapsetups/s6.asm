
; ASM FILE data\maps\entries\map41\mapsetups\s6.asm :
; 0x5F4A0..0x5F630 : 

; =============== S U B R O U T I N E =======================================

ms_map41_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $3A2
		beq.s   return_5F4AC
		lea     cs_5F4AE(pc), a0
		trap    #6
return_5F4AC:
		rts

	; End of function ms_map41_InitFunction

cs_5F4AE:       setBlocks $D,$0,$3,$5,$5,$4
		csc_end
cs_5F4B8:       setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setActscript $1F,$FF,eas_Init
		csWait $28
		playSound SFX_BIG_DOOR_RUMBLE
		setQuake $3
		csWait $28
		playSound SFX_BIG_DOOR_RUMBLE
		csWait $5
		setActscript $0,$0,eas_461B6
		csWait $5
		setActscript $7,$0,eas_461B6
		csWait $5
		setActscript $1F,$0,eas_461B6
		playSound SFX_BIG_DOOR_RUMBLE
		csWait $28
		playSound SFX_BIG_DOOR_RUMBLE
		csWait $28
		playSound SFX_BIG_DOOR_RUMBLE
		csWait $28
		playSound SFX_BIG_DOOR_RUMBLE
		setBlocks $D,$6,$3,$5,$5,$4
		playSound SFX_BLAST_SPELL
		flashScreenWhite $4
		playSound SFX_BIG_DOOR_RUMBLE
		setFacing $0,$1
		setFacing $7,$1
		setFacing $1F,$1
		csWait $3C
		setBlocks $D,$0,$3,$5,$5,$4
		playSound SFX_BLAST_SPELL
		flashScreenWhite $4
		playSound SFX_BIG_DOOR_RUMBLE
		setQuake $4003
		csWait $28
		setActscript $0,$0,eas_Jump
		setActscript $7,$0,eas_Jump
		setActscript $1F,$FF,eas_Jump
		setActscript $0,$0,eas_Jump
		setActscript $7,$0,eas_Jump
		setActscript $1F,$FF,eas_Jump
		csWait $32
		followEntity $7,$0,$2
		followEntity $1F,$7,$2
		csc_end
cs_5F594:       newEntity $1C,$6,$F,$1,$FF
		textCursor $DB9
		nextSingleText $0,$1C   ; "Sir Astral!  {LEADER}!{W1}"
		setEntityDest $1F,$6,$A
		setFacing $0,$3
		setFacing $7,$3
		setFacing $1F,$3
		setCamDest $1,$6
		nextSingleText $0,$1C   ; "{LEADER}, wait!{W1}"
		moveEntity $1C,$FF,$1,$4
		endMove $8080
		nextSingleText $0,$1C   ; "May I join your force?{W1}"
		csWait $1E
		setFacing $1F,$1
		csWait $1E
		nextSingleText $80,$1F  ; "Well...{W1}"
		setFacing $1F,$3
		nextText $0,$1C         ; "You can trust me.{N}I'm a born fighter.{W2}"
		nextText $0,$1C         ; "As you know, I want to die.{W2}"
		nextSingleText $0,$1C   ; "I will die fighting for your{N}cause, if you let me.{W1}"
		csWait $28
		setFacing $1F,$1
		nextSingleText $80,$1F  ; "He's a hero in Galam.{N}I think he should join us.{W1}"
		entityNod $7
		entityNod $0
		setFacing $1F,$3
		csWait $14
		entityNod $1F
		nextSingleText $0,$1F   ; "{NAME;28}, please come{N}with us.  You'll be a great{N}help.{W1}"
		join $1C
		setActscript $1C,$FF,eas_Jump
		setActscript $1C,$FF,eas_Jump
		nextSingleText $0,$1C   ; "Oh, thank you!  I know I can{N}take the King of the Devils!{W1}"
		setFacing $1F,$1
		followEntity $1C,$1F,$2
		csc_end
