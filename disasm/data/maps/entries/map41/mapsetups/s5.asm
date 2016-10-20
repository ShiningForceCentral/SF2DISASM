
; ASM FILE data\maps\entries\map41\mapsetups\s5.asm :
; 0x5F46C..0x5F4A0 : 
ms_map41_Section5:
		dc.b 6
		dc.b 8
		dc.b 1
		dc.b $43
		dc.w sub_5F47A-ms_map41_Section5
		dc.b $FD
		dc.b 0
		dc.b 0
		dc.b 0
		dc.w nullsub_69-ms_map41_Section5

; =============== S U B R O U T I N E =======================================

nullsub_69:
		
		rts

	; End of function nullsub_69


; =============== S U B R O U T I N E =======================================

sub_5F47A:
		
		trap    #CHECK_FLAG
		dc.w $3A2
		bne.s   return_5F49E
		lea     cs_5F4B8(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $3A2               
						; set after opening Devil's Head with the Force Sword
		trap    #CHECK_FLAG
		dc.w $1C
		bne.s   loc_5F49A
		lea     cs_5F594(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $47                
						; Lemon is a follower
loc_5F49A:
		
		move.w  #$FFFF,d6
return_5F49E:
		
		rts

	; End of function sub_5F47A

