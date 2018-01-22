
; ASM FILE data\battles\entries\battle40\cs_regiontriggered_2.asm :
; 0x4E9B2..0x4EA94 : Region-activated cutscene 2 for battle 40
rbcs_battle40_2:cameraSpeed $30
		setCamDest $D,$8
		setBlocks $B,$B,$1,$1,$13,$A
		csWait $5
		setBlocks $B,$B,$1,$1,$13,$B
		csWait $5
		setBlocks $B,$B,$1,$1,$14,$C
		csWait $5
		setBlocks $B,$B,$1,$1,$15,$B
		csWait $5
		setBlocks $B,$B,$1,$1,$15,$C
		csWait $5
		setBlocks $B,$B,$1,$1,$16,$C
		csWait $4
		setBlocks $B,$B,$1,$1,$13,$C
		csWait $4
		setBlocks $B,$B,$1,$1,$12,$B
		csWait $4
		setBlocks $B,$B,$1,$1,$14,$D
		csWait $4
		setBlocks $B,$B,$1,$1,$13,$D
		csWait $4
		setBlocks $B,$B,$1,$1,$12,$A
		csWait $3
		setBlocks $B,$B,$1,$1,$12,$C
		csWait $3
		setBlocks $B,$B,$1,$1,$12,$D
		csWait $3
		setBlocks $B,$B,$1,$1,$11,$C
		csWait $3
		setBlocks $B,$B,$1,$1,$13,$E
		csWait $3
		setBlocks $B,$B,$1,$1,$14,$E
		csWait $2
		setBlocks $B,$B,$1,$1,$15,$E
		csWait $2
		setBlocks $B,$B,$1,$1,$11,$A
		csWait $2
		setBlocks $B,$B,$1,$1,$10,$C
		csWait $2
		setBlocks $B,$B,$1,$1,$11,$D
		csWait $2
		setBlocks $B,$B,$1,$1,$D,$E
		setF $184               ; set after the second set of tile changes in the Oddeye battle
		csc_end
