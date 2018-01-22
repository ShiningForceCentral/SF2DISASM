
; ASM FILE data\battles\entries\battle43\cs_afterbattle.asm :
; 0x4F35E..0x4F47A : Cutscene after battle 43
abcs_battle43:  setCamDest $8,$2
		playSound $FD
		csWait $28
		playSound SFX_BIG_DOOR_RUMBLE
		playSound SFX_BLAST_SPELL
		flashScreenWhite $14
		playSound SFX_BLAST_SPELL
		flashScreenWhite $14
		playSound SFX_BLAST_SPELL
		flashScreenWhite $14
		playSound SFX_BIG_DOOR_RUMBLE
		playSound SFX_BLAST_SPELL
		flashScreenWhite $14
		playSound SFX_BLAST_SPELL
		flashScreenWhite $14
		hideEntity $80
		playSound SFX_BIG_DOOR_RUMBLE
		playSound SFX_BLAST_SPELL
		flashScreenWhite $14
		playSound SFX_BLAST_SPELL
		flashScreenWhite $14
		playSound SFX_BIG_DOOR_RUMBLE
		playSound SFX_BLAST_SPELL
		flashScreenWhite $14
		setBlocks $C,$36,$7,$4,$A,$3
		playSound SFX_BLAST_SPELL
		flashScreenWhite $14
		playSound SFX_BLAST_SPELL
		flashScreenWhite $14
		playSound SFX_BIG_DOOR_RUMBLE
		playSound SFX_BLAST_SPELL
		flashScreenWhite $14
		setBlocks $C,$31,$7,$4,$A,$3
		playSound SFX_BLAST_SPELL
		flashScreenWhite $14
		playSound SFX_BLAST_SPELL
		flashScreenWhite $14
		playSound SFX_BIG_DOOR_RUMBLE
		playSound SFX_BLAST_SPELL
		flashScreenWhite $14
		setBlocks $C,$2C,$7,$4,$A,$3
		playSound SFX_BLAST_SPELL
		flashScreenWhite $14
		playSound SFX_BLAST_SPELL
		flashScreenWhite $14
		setQuake $3
		playSound SFX_BIG_DOOR_RUMBLE
		playSound SFX_BLAST_SPELL
		flashScreenWhite $14
		setBlocks $C,$27,$7,$4,$A,$3
		playSound SFX_BLAST_SPELL
		flashScreenWhite $14
		playSound SFX_BLAST_SPELL
		flashScreenWhite $14
		setQuake $5
		playSound SFX_BIG_DOOR_RUMBLE
		csWait $78
		mapFadeOutToWhite
		csWait $28
		mapFadeInFromWhite
		mapSysEvent $3B,$C,$B,$1
		setQuake $0
		clearF $43              ; Peter is a follower
		clearF $46              ; Astral is a follower
		clearF $47              ; Lemon is a follower
		clearF $4C              ; Zynk is a follower
		csc_end
