
; ASM FILE data\maps\entries\map68\mapsetups\s3.asm :
; 0x4FD6C..0x4FD7C : 
ms_map68_ZoneEvents:
		dc.w $FD00
		dc.w sub_4FD70-ms_map68_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_4FD70:
		move.w  #$13,d0
		jsr     sub_47856
		rts

	; End of function sub_4FD70

