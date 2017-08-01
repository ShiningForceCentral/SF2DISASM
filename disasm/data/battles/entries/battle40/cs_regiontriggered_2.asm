
; ASM FILE data\battles\entries\battle40\cs_regiontriggered_2.asm :
; 0x4E9B2..0x4EA94 : Region-activated cutscene 2 for battle 40
rbcs_battle40_2:
		csc45 $30               
						; (null)
		setCamDest $D,$8
		setBlocks $B0B,$101,$130A
		csWait $5
		setBlocks $B0B,$101,$130B
		csWait $5
		setBlocks $B0B,$101,$140C
		csWait $5
		setBlocks $B0B,$101,$150B
		csWait $5
		setBlocks $B0B,$101,$150C
		csWait $5
		setBlocks $B0B,$101,$160C
		csWait $4
		setBlocks $B0B,$101,$130C
		csWait $4
		setBlocks $B0B,$101,$120B
		csWait $4
		setBlocks $B0B,$101,$140D
		csWait $4
		setBlocks $B0B,$101,$130D
		csWait $4
		setBlocks $B0B,$101,$120A
		csWait $3
		setBlocks $B0B,$101,$120C
		csWait $3
		setBlocks $B0B,$101,$120D
		csWait $3
		setBlocks $B0B,$101,$110C
		csWait $3
		setBlocks $B0B,$101,$130E
		csWait $3
		setBlocks $B0B,$101,$140E
		csWait $2
		setBlocks $B0B,$101,$150E
		csWait $2
		setBlocks $B0B,$101,$110A
		csWait $2
		setBlocks $B0B,$101,$100C
		csWait $2
		setBlocks $B0B,$101,$110D
		csWait $2
		setBlocks $B0B,$101,$D0E
		setF $184               
						; set after the second set of tile changes in the Oddeye battle
		csc_end                 
						; END OF CUTSCENE SCRIPT
