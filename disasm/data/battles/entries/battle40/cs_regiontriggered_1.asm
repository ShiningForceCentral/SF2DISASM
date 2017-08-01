
; ASM FILE data\battles\entries\battle40\cs_regiontriggered_1.asm :
; 0x4E8A8..0x4E9B2 : Region-activated cutscene 1 for battle 40
rbcs_battle40_1:
		csc45 $30               
						; (null)
		setCamDest $A,$11
		setBlocks $B0B,$101,$F15
		csWait $5
		setBlocks $B0B,$101,$1114
		csWait $5
		setBlocks $B0B,$101,$D13
		csWait $5
		setBlocks $B0B,$101,$B16
		csWait $5
		setBlocks $B0B,$101,$1015
		csWait $5
		setBlocks $B0B,$101,$F16
		csWait $4
		setBlocks $B0B,$101,$E14
		csWait $4
		setBlocks $B0B,$101,$F14
		csWait $4
		setBlocks $B0B,$101,$1016
		csWait $4
		setBlocks $B0B,$101,$1017
		csWait $4
		setBlocks $B0B,$101,$E16
		csWait $3
		setBlocks $B0B,$101,$A17
		csWait $3
		setBlocks $B0B,$101,$1014
		csWait $3
		setBlocks $B0B,$101,$D14
		csWait $3
		setBlocks $B0B,$101,$E15
		csWait $3
		setBlocks $B0B,$101,$1115
		csWait $2
		setBlocks $B0B,$101,$1216
		csWait $2
		setBlocks $B0B,$101,$1013
		csWait $2
		setBlocks $B0B,$101,$1116
		csWait $2
		setBlocks $B0B,$101,$1117
		csWait $2
		setBlocks $B0B,$101,$C13
		csWait $1
		setBlocks $B0B,$101,$1214
		csWait $1
		setBlocks $B0B,$101,$D16
		csWait $1
		setBlocks $B0B,$101,$F13
		csWait $1
		setBlocks $B0B,$101,$1316
		setF $183               
						; set after the first set of tile changes in the Oddeye battle
		csc_end                 
						; END OF CUTSCENE SCRIPT
