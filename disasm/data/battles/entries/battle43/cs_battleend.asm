
; ASM FILE data\battles\entries\battle43\cs_battleend.asm :
; 0x4F358..0x4F35E : Enemy defeated cutscene for battle 43
edcs_battle43:
		dc.w $21                
						; 0021 REVIVE FORCE MEMBER 80
		dc.w $80
		dc.w $FFFF              
						; END OF CUTSCENE SCRIPT
