
; ASM FILE data\battles\entries\battle40\cs_regiontriggered_1.asm :
; 0x4E8A8..0x4E9B2 : Region-activated cutscene 1 for battle 40
rbcs_battle40_1:cameraSpeed $30
		setCamDest $A,$11
		setBlocks $B,$B,$1,$1,$F,$15
		csWait $5
		setBlocks $B,$B,$1,$1,$11,$14
		csWait $5
		setBlocks $B,$B,$1,$1,$D,$13
		csWait $5
		setBlocks $B,$B,$1,$1,$B,$16
		csWait $5
		setBlocks $B,$B,$1,$1,$10,$15
		csWait $5
		setBlocks $B,$B,$1,$1,$F,$16
		csWait $4
		setBlocks $B,$B,$1,$1,$E,$14
		csWait $4
		setBlocks $B,$B,$1,$1,$F,$14
		csWait $4
		setBlocks $B,$B,$1,$1,$10,$16
		csWait $4
		setBlocks $B,$B,$1,$1,$10,$17
		csWait $4
		setBlocks $B,$B,$1,$1,$E,$16
		csWait $3
		setBlocks $B,$B,$1,$1,$A,$17
		csWait $3
		setBlocks $B,$B,$1,$1,$10,$14
		csWait $3
		setBlocks $B,$B,$1,$1,$D,$14
		csWait $3
		setBlocks $B,$B,$1,$1,$E,$15
		csWait $3
		setBlocks $B,$B,$1,$1,$11,$15
		csWait $2
		setBlocks $B,$B,$1,$1,$12,$16
		csWait $2
		setBlocks $B,$B,$1,$1,$10,$13
		csWait $2
		setBlocks $B,$B,$1,$1,$11,$16
		csWait $2
		setBlocks $B,$B,$1,$1,$11,$17
		csWait $2
		setBlocks $B,$B,$1,$1,$C,$13
		csWait $1
		setBlocks $B,$B,$1,$1,$12,$14
		csWait $1
		setBlocks $B,$B,$1,$1,$D,$16
		csWait $1
		setBlocks $B,$B,$1,$1,$F,$13
		csWait $1
		setBlocks $B,$B,$1,$1,$13,$16
		setF $183               ; set after the first set of tile changes in the Oddeye battle
		csc_end
