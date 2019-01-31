
; ASM FILE data\maps\entries\map41\mapsetups\s5.asm :
; 0x5F46C..0x5F4A0 : 
ms_map41_Section5:
		msItemEvent 6, 8, UP, 67, Map41_ItemEvent0-ms_map41_Section5
		msDefaultItemEvent nullsub_69-ms_map41_Section5

; =============== S U B R O U T I N E =======================================

nullsub_69:
		rts

	; End of function nullsub_69


; =============== S U B R O U T I N E =======================================

Map41_ItemEvent0:
		
		 
		chkFlg  $3A2            ; set after opening Devil's Head with the Force Sword
		bne.s   return_5F49E
		script  cs_5F4B8
		setFlg  $3A2            ; set after opening Devil's Head with the Force Sword
		chkFlg  $1C             ; Lemon joined
		bne.s   loc_5F49A
		script  cs_5F594
		setFlg  $47             ; Lemon is a follower
loc_5F49A:
		move.w  #$FFFF,d6
return_5F49E:
		rts

	; End of function Map41_ItemEvent0

