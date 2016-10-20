
; ASM FILE data\maps\entries\map01\mapsetups\s4.asm :
; 0x5E726..0x5E758 : 

; =============== S U B R O U T I N E =======================================

ms_map1_AreaDescriptions:
		
		move.w  #$1044,d3
		lea     word_5E736(pc), a0
		nop
		jmp     DisplayAreaDescription

	; End of function ms_map1_AreaDescriptions

word_5E736:
		dc.w $B03
		dc.b 0
		dc.b 0
		dc.b 9
		dc.b 0
		dc.w $2C1A
		dc.b 0
		dc.b 1
		dc.w sub_5E746-word_5E736
		dc.w $FD00
		dc.b $4E 
		dc.b $75 

; =============== S U B R O U T I N E =======================================

sub_5E746:
		
		trap    #CHECK_FLAG
		dc.w $349
		bne.s   return_5E756
		lea     cs_5E772(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $349               
						; set after the Taya join scene has played inside the Mitula Shrine
return_5E756:
		
		rts

	; End of function sub_5E746

