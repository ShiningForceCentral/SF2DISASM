
; ASM FILE data\maps\entries\map09\mapsetups\s5.asm :
; 0x568A4..0x568C4 : 
ms_map9_Section5:
		dc.b $10
		dc.b $3A
		dc.b $FF
		dc.b $3D
		dc.w sub_568B0-ms_map9_Section5
		dc.b $FD
		dc.b 0
		dc.b 0
		dc.b 0
		dc.w return_568C2-ms_map9_Section5

; =============== S U B R O U T I N E =======================================

sub_568B0:
		trap    #CHECK_FLAG
		dc.w $2D7               ; set after presenting the Achilles Sword to Rohde (yes/no to the Caravan regardless)
		bne.s   return_568C2
		lea     cs_569BC(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $2D7               ; set after presenting the Achilles Sword to Rohde (yes/no to the Caravan regardless)
		moveq   #$FFFFFFFF,d6
return_568C2:
		rts

	; End of function sub_568B0

