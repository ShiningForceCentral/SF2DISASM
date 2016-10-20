
; ASM FILE data\battles\entries\battle40\cs_regiontriggered_1.asm :
; 0x4E8A8..0x4E9B2 : Region-activated cutscene 1 for battle 40
rbcs_battle40_1:
		dc.w $45                
						; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
		dc.w $30
		dc.w $32                
						; 0032 SET CAMERA DEST A 11
		dc.w $A
		dc.w $11
		dc.w $34                
						; 0034 SET BLOCKS B0B 101 F15
		dc.w $B0B
		dc.w $101
		dc.w $F15
		dc.b $80                
						; WAIT 5
		dc.b 5
		dc.w $34                
						; 0034 SET BLOCKS B0B 101 1114
		dc.w $B0B
		dc.w $101
		dc.w $1114
		dc.b $80                
						; WAIT 5
		dc.b 5
		dc.w $34                
						; 0034 SET BLOCKS B0B 101 D13
		dc.w $B0B
		dc.w $101
		dc.w $D13
		dc.b $80                
						; WAIT 5
		dc.b 5
		dc.w $34                
						; 0034 SET BLOCKS B0B 101 B16
		dc.w $B0B
		dc.w $101
		dc.w $B16
		dc.b $80                
						; WAIT 5
		dc.b 5
		dc.w $34                
						; 0034 SET BLOCKS B0B 101 1015
		dc.w $B0B
		dc.w $101
		dc.w $1015
		dc.b $80                
						; WAIT 5
		dc.b 5
		dc.w $34                
						; 0034 SET BLOCKS B0B 101 F16
		dc.w $B0B
		dc.w $101
		dc.w $F16
		dc.b $80                
						; WAIT 4
		dc.b 4
		dc.w $34                
						; 0034 SET BLOCKS B0B 101 E14
		dc.w $B0B
		dc.w $101
		dc.w $E14
		dc.b $80                
						; WAIT 4
		dc.b 4
		dc.w $34                
						; 0034 SET BLOCKS B0B 101 F14
		dc.w $B0B
		dc.w $101
		dc.w $F14
		dc.b $80                
						; WAIT 4
		dc.b 4
		dc.w $34                
						; 0034 SET BLOCKS B0B 101 1016
		dc.w $B0B
		dc.w $101
		dc.w $1016
		dc.b $80                
						; WAIT 4
		dc.b 4
		dc.w $34                
						; 0034 SET BLOCKS B0B 101 1017
		dc.w $B0B
		dc.w $101
		dc.w $1017
		dc.b $80                
						; WAIT 4
		dc.b 4
		dc.w $34                
						; 0034 SET BLOCKS B0B 101 E16
		dc.w $B0B
		dc.w $101
		dc.w $E16
		dc.b $80                
						; WAIT 3
		dc.b 3
		dc.w $34                
						; 0034 SET BLOCKS B0B 101 A17
		dc.w $B0B
		dc.w $101
		dc.w $A17
		dc.b $80                
						; WAIT 3
		dc.b 3
		dc.w $34                
						; 0034 SET BLOCKS B0B 101 1014
		dc.w $B0B
		dc.w $101
		dc.w $1014
		dc.b $80                
						; WAIT 3
		dc.b 3
		dc.w $34                
						; 0034 SET BLOCKS B0B 101 D14
		dc.w $B0B
		dc.w $101
		dc.w $D14
		dc.b $80                
						; WAIT 3
		dc.b 3
		dc.w $34                
						; 0034 SET BLOCKS B0B 101 E15
		dc.w $B0B
		dc.w $101
		dc.w $E15
		dc.b $80                
						; WAIT 3
		dc.b 3
		dc.w $34                
						; 0034 SET BLOCKS B0B 101 1115
		dc.w $B0B
		dc.w $101
		dc.w $1115
		dc.b $80                
						; WAIT 2
		dc.b 2
		dc.w $34                
						; 0034 SET BLOCKS B0B 101 1216
		dc.w $B0B
		dc.w $101
		dc.w $1216
		dc.b $80                
						; WAIT 2
		dc.b 2
		dc.w $34                
						; 0034 SET BLOCKS B0B 101 1013
		dc.w $B0B
		dc.w $101
		dc.w $1013
		dc.b $80                
						; WAIT 2
		dc.b 2
		dc.w $34                
						; 0034 SET BLOCKS B0B 101 1116
		dc.w $B0B
		dc.w $101
		dc.w $1116
		dc.b $80                
						; WAIT 2
		dc.b 2
		dc.w $34                
						; 0034 SET BLOCKS B0B 101 1117
		dc.w $B0B
		dc.w $101
		dc.w $1117
		dc.b $80                
						; WAIT 2
		dc.b 2
		dc.w $34                
						; 0034 SET BLOCKS B0B 101 C13
		dc.w $B0B
		dc.w $101
		dc.w $C13
		dc.b $80                
						; WAIT 1
		dc.b 1
		dc.w $34                
						; 0034 SET BLOCKS B0B 101 1214
		dc.w $B0B
		dc.w $101
		dc.w $1214
		dc.b $80                
						; WAIT 1
		dc.b 1
		dc.w $34                
						; 0034 SET BLOCKS B0B 101 D16
		dc.w $B0B
		dc.w $101
		dc.w $D16
		dc.b $80                
						; WAIT 1
		dc.b 1
		dc.w $34                
						; 0034 SET BLOCKS B0B 101 F13
		dc.w $B0B
		dc.w $101
		dc.w $F13
		dc.b $80                
						; WAIT 1
		dc.b 1
		dc.w $34                
						; 0034 SET BLOCKS B0B 101 1316
		dc.w $B0B
		dc.w $101
		dc.w $1316
		dc.w $10                
						; 0010 SET FLAG 183 FFFF : set after the first set of tile changes in the Oddeye battle
		dc.w $183
		dc.w $FFFF
		dc.w $FFFF              
						; END OF CUTSCENE SCRIPT
