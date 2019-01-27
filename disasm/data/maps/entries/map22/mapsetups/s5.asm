
; ASM FILE data\maps\entries\map22\mapsetups\s5.asm :
; 0x59604..0x5962E : 
ms_map22_Section5:
		dc.b $23
		dc.b $18
		dc.b $FF
		dc.b $7D
		dc.w sub_59610-ms_map22_Section5
		dc.b $FD
		dc.b 0
		dc.b 0
		dc.b 0
		dc.w return_5962C-ms_map22_Section5

; =============== S U B R O U T I N E =======================================

sub_59610:
		moveq   #$7D,d1 
		jsr     j_sub_9146
		cmpi.w  #$FFFF,d0
		beq.s   byte_59624
		jsr     j_RemoveItemBySlot
byte_59624:
		script  cs_599B2
		moveq   #$FFFFFFFF,d6
return_5962C:
		rts

	; End of function sub_59610

