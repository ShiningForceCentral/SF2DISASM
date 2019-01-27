
; ASM FILE data\maps\entries\map42\mapsetups\s4.asm :
; 0x5FE24..0x5FE90 : 

; =============== S U B R O U T I N E =======================================

ms_map42_AreaDescriptions:
		
		move.w  #$1B2,d3
		lea     word_5FE34(pc), a0
		nop
		jmp     DisplayAreaDescription

	; End of function ms_map42_AreaDescriptions

word_5FE34:     dc.w $2702
		dc.b $FF
		dc.b 1
		dc.w sub_5FE68-word_5FE34
		dc.w $2702
		dc.b 0
		dc.b 1
		dc.w sub_5FE42-word_5FE34
		dc.w $FD00

; =============== S U B R O U T I N E =======================================

sub_5FE42:
		 
		chkFlg  $386            ; set after you pull the Force Sword out
		bne.s   loc_5FE52
		move.w  #$D06,d0
		jsr     (DisplayText).w 
		bra.s   return_5FE66
loc_5FE52:
		clr.w   ((TEXT_NAME_INDEX_1-$1000000)).w
		move.w  #$1A8,d0
		jsr     (DisplayText).w 
		move.w  #$1B2,d0
		jsr     (DisplayText).w 
return_5FE66:
		rts

	; End of function sub_5FE42


; =============== S U B R O U T I N E =======================================

sub_5FE68:
		 
		chkFlg  $386            ; set after you pull the Force Sword out
		bne.s   loc_5FE7A
		script  cs_5FF06
		setFlg  $386            ; set after you pull the Force Sword out
		bra.s   return_5FE8E
loc_5FE7A:
		clr.w   ((TEXT_NAME_INDEX_1-$1000000)).w
		move.w  #$1A8,d0
		jsr     (DisplayText).w 
		move.w  #$1B2,d0
		jsr     (DisplayText).w 
return_5FE8E:
		rts

	; End of function sub_5FE68

