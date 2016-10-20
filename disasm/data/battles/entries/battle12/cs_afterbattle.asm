
; ASM FILE data\battles\entries\battle12\cs_afterbattle.asm :
; 0x4ACEC..0x4ACF8 : Cutscene after battle 12
abcs_battle12:
		dc.w 4                  
						; 0004 INIT TEXT CURSOR 9BD : "{LEADER}, did you hear{N}that?  He said, he had{N}been waiting for you.{W2}"
		dc.w $9BD
		dc.w 7                  
						; 0007 EXECUTE MAP SYSTEM EVENT 34170802
		dc.l $34170802
		dc.w $FFFF              
						; END OF CUTSCENE SCRIPT
