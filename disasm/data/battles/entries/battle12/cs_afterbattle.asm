
; ASM FILE data\battles\entries\battle12\cs_afterbattle.asm :
; 0x4ACEC..0x4ACF8 : Cutscene after battle 12
abcs_battle12:  textCursor $9BD         ; Initial text line $9BD : "{LEADER}, did you hear{N}that?  He said, he had{N}been waiting for you.{W2}"
		mapSysEvent $34170802
		csc_end                 ; END OF CUTSCENE SCRIPT
