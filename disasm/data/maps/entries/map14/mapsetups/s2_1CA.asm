
; ASM FILE data\maps\entries\map14\mapsetups\s2_1CA.asm :
; 0x58F3C..0x58F4C : 
ms_map14_flag1CA_EntityEvents:
		msEntityEvent 128, UP, sub_58F44-ms_map14_flag1CA_EntityEvents
		msDefaultEntityEvent 1, (entevdft_58EE2-ms_map14_flag1CA_EntityEvents) & $FFFF

; =============== S U B R O U T I N E =======================================

sub_58F44:
		jsr     (MapTileset050+$3D6-ms_map14_flag1CA_EntityEvents)
		rts

	; End of function sub_58F44

