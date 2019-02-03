
; ASM FILE data\maps\entries\map09\mapsetups\s5_itemevents.asm :
; 0x568A4..0x568C4 : 
ms_map9_Section5:
		msItemEvent 16, 58, NO_DIRECTION, 61, Map9_ItemEvent0-ms_map9_Section5
		msDefaultItemEvent return_568C2-ms_map9_Section5

; =============== S U B R O U T I N E =======================================

Map9_ItemEvent0:
		
		 
		chkFlg  $2D7            ; set after presenting the Achilles Sword to Rohde (yes/no to the Caravan regardless)
		bne.s   return_568C2
		script  cs_569BC
		setFlg  $2D7            ; set after presenting the Achilles Sword to Rohde (yes/no to the Caravan regardless)
		moveq   #$FFFFFFFF,d6
return_568C2:
		rts

	; End of function Map9_ItemEvent0

